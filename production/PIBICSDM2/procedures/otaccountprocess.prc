CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."OTACCOUNTPROCESS" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       otaccountprocess
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        30/6/2010   manop       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     otaccountprocess
      Sysdate:         30/6/2010
      Date and Time:   30/6/2010, 18:43:46, and 30/6/2010 18:43:46
      Username:        manop (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
otalrow number(8);
totalrow number(8);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select estimateyear, estimatemonth, a.dept_seqno, b.deptlevel, b.rel_code, sum(totalamount) totalamount 
    from ot_otslip a, department b 
    where a.dept_seqno=b.dept_seqno 
    and estimateyear=to_char(sysdate-1,'yyyy')+543 and estimatemonth=to_char(sysdate-1, 'mm')-1
    group by estimateyear, estimatemonth, a.dept_seqno, b.deptlevel, b.rel_code
    order by dept_seqno;
    rec_ot c1%rowtype;  
begin
 totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 file_ut := UTL_FILE.FOPEN('UTL_DIR','log_OTsliptotalLog'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Process Total OTSlip By Department .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_ot; exit when c1%notfound;
    insert into ot_sliptotallog (sliptotalseqno, estimateyear, estimatemonth, dept_seqno, deptlevel, rel_code, sliptotal, loguserid, logdte) 
    values (otsliptotallog_seqno.nextval, rec_ot.estimateyear, rec_ot.estimatemonth, rec_ot.dept_seqno, rec_ot.deptlevel, rec_ot.rel_code,
    rec_ot.totalamount, 'ADMIN', sysdate);
   commit;   
   totalrow:=totalrow+1;
 end loop; --cursor
 close c1;
 utl_file.put_line(file_ut,'Total records Process Total OTSlip :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Process Total OTSlip .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  --Exception
    --  when others then
      --    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END otaccountprocess;
/
  GRANT EXECUTE ON "PIBICSDM2"."OTACCOUNTPROCESS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."OTACCOUNTPROCESS" TO "BIOSAADM";
