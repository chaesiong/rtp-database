CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PASSINVESTIGATE" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       passInvestigate
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        25/01/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     passInvestigate
      Sysdate:         25/01/2012
      Date and Time:   25/01/2012, 11:43:26, and 25/01/2012 11:43:26
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select tdtno
    from vw_tmmain 
    where nationcd in (select countcd from country where CONTINENT_SEQNO in (2,6,8) and count_seqno <> 101) and 
    to_char(inoutdate, 'YYYYMM') between '201001' and '201212' and cardtype='1'
    and sex = 'M'
    group by nationenm, efamilynm, efirstnm, emiddlenm,  tdtno, sex, birthdte
    having count(tdtno) > 6;
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_passInvestigate'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start passInvestigate .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
    totalrow:=totalrow+1;
    insert into passportfind (tdtno, seq) values (rec_tm.tdtno, totalrow);    
   commitrow:=commitrow+1;
   if commitrow = 1000 then
    commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut); 
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End passInvestigate.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END passInvestigate;
/
  GRANT EXECUTE ON "PIBICSDM2"."PASSINVESTIGATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PASSINVESTIGATE" TO "BIOSAADM";
