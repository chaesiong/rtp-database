CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TESTPASSDATA" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TESTPASSDATA
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        10/03/2014   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TESTPASSDATA
      Sysdate:         10/03/2014
      Date and Time:   10/03/2014, 12:02:47, and 10/03/2014 12:02:47
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrownum number(20);
commitrow number(20);
foundin  number(20);
batchlogno_seq number(20);
checkImage char(1);
addressfn varchar2(1800);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select personid, tdtno from vw_tmonline where to_char(inoutdate, 'YYYYMM') = '201311' and nationcd = 'T03' and tdtno like 'AA%' and typedata = 'การเดินทางเข้า-ออก'
    --and personid = 'PIS7970481'
    and tdtno not in (select tdtno from testpasstemp)
    group by  personid, tdtno;
    rec_tm c1%rowtype;  
begin
    totalrownum:=0;
    commitrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
       
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'PIBICS', '999', 'PROCESSTMPASS', null, 0, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');     
    commit;  
 
    delete wllogrerun;
    commit;

    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSTMPPASS'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSTMPPASS .... !!!');utl_file.fflush(file_ut); 
    open c1;
 
    foundin := 0;
    checkImage := null;
    addressfn := null;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
        select * from (
            select tdtno from vw_tmonline where personid = rec_tm.personid and tdtno <> rec_tm.tdtno and length(tdtno) = 7 order by inoutdate desc
        ) where rownum = 1
     )
     loop        
          insert into wllogrerun (dept_seqno, tdtno) values (tmppass_seqno.nextval, rec_tm.tdtno);
     end loop;
    
    totalrownum:=totalrownum+1;   
    commitrow:=commitrow+1;
    if commitrow = 1000 then
        update batchlog set prrow = totalrownum where batchlogno = batchlogno_seq;
        commit;
      commitrow:=0;
    end if; 

 end loop; --cursor
 close c1;
  update batchlog
   set totalrow     = totalrownum,
     prrow          = totalrownum,
     endprocess     = sysdate,
     status         = '0',
     tfstatus       = 'Y'
   where batchlogno = batchlogno_seq;
   commit;
 utl_file.put_line(file_ut,'total :'||totalrownum);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESSTMPPASS .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
 -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END TESTPASSDATA;
/
  GRANT EXECUTE ON "PIBICSDM2"."TESTPASSDATA" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TESTPASSDATA" TO "BIOSAADM";
