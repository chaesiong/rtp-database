CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TRANSFER_FWLOG" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TRANSFER_TM_MIDNIGHT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        05/02/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TRANSFER_TM_MIDNIGHT
      Sysdate:         05/02/2011
      Date and Time:   05/02/2011, 14:40:13, and 05/02/2011 14:40:13
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
avlrow number(8);
dptrow number(8);
otalrow number(8);
totalrow number(8);
total number(8);
batchlogno_seq number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
        select * from fw_log where to_char(LOGINDATE, 'YYYYMM') < '201601';
    rec_tm c1%rowtype;  
begin

 batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'FWL', '88', 'โอนข้อมูล FW_LOG (201601) ', null, 0, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N', 0, 0, 0, sysdate);
        commit;

 avlrow:=0;dptrow:=0;totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD_hh24mi') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 --file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_tminout'||sysdateFile||'.txt','W');
 --utl_file.put_line(file_ut,sysdateTxt||' Start Transfer Tminout into Tmmain .... !!!');utl_file.fflush(file_ut); 
 open c1;
         loop fetch c1 into rec_tm; exit when c1%notfound;
           totalrow:=totalrow+1;
           INSERT INTO FW_LOG_BACKUP (
           SESSIONID, LOGINDATE, IPADDRESS, 
           STATUS, USER_TYPE, SYSTEMMESSAGE, 
           ACTION, USER_ID, PROGRAM_ID, 
           LOGOUT_TYPE, LOGOUT_TIME, IPSERVER, 
           TIMELINEDATE) 
        VALUES ( rec_tm.SESSIONID,
         rec_tm.LOGINDATE,
         rec_tm.IPADDRESS,
         rec_tm.STATUS,
         rec_tm.USER_TYPE,
         rec_tm.SYSTEMMESSAGE,
         rec_tm.ACTION,
         rec_tm.USER_ID,
         rec_tm.PROGRAM_ID,
         rec_tm.LOGOUT_TYPE,
         rec_tm.LOGOUT_TIME,
         rec_tm.IPSERVER,
         rec_tm.TIMELINEDATE);
  --DBMS_OUTPUT.put_line('total row:'||totalrow);
  delete from fw_log where SESSIONID =rec_tm.SESSIONID ;

   IF totalrow>100 and MOD(totalrow,100)=0  THEN 
  -- utl_file.put_line(file_ut,'Commit Every  :'||totalrow||':row');utl_file.fflush(file_ut);
   commit;
   END IF;
   
 end loop; --cursor
   commit;
 close c1;
   total:=totalrow;
   update batchlog b set b.status=0 , b.endprocess = sysdate,b.totalrow=total , b.prrow=total,b.TFSTATUS='Y' ,b.totalins=avlrow,b.totalupd=dptrow where b.batchlogno = batchlogno_seq;
   commit;
   -------------------------------
   
 --utl_file.put_line(file_ut,'sum arrival :'||avlrow);utl_file.fflush(file_ut);
 --utl_file.put_line(file_ut,'sum departure :'||dptrow);utl_file.fflush(file_ut);
 --utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 --utl_file.put_line(file_ut,sysdateTxt||' End Transfer Tminout into Tmmain .... !!!');utl_file.fflush(file_ut);
 --utl_file.fclose(file_ut);
 Exception
    when others then
        ROLLBACK;
        --utl_file.put_line(file_ut,'Exception :'||rec_tm.seqno);utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut,'Failure code: ' || SQLCODE);utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut,'Failure at: ' || SQLERRM);utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut,'Exception timing:'||sysdateTxt);utl_file.fflush(file_ut); 
         null;
        --utl_file.fclose(file_ut);
       --prompt(sqlerrm||'[Re-Gen Error]');
end;

END TRANSFER_FWLOG;
/
  GRANT EXECUTE ON "PIBICSDM2"."TRANSFER_FWLOG" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TRANSFER_FWLOG" TO "BIOSAADM";
