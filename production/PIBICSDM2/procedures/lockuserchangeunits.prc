CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."LOCKUSERCHANGEUNITS" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       LOCKUSERCHANGEUNITS
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        19/09/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     LOCKUSERCHANGEUNITS
      Sysdate:         19/09/2013
      Date and Time:   19/09/2013, 10:59:51 AM, and 19/09/2013 10:59:51 AM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateStartTxt varchar2(25);
sysdateEndTxt varchar2(25);
sysdateFile varchar2(20);
timenow varchar2(25);
totalrow number(20);
file_ut UTL_FILE.FILE_TYPE;
cursor c1 is       
        select * from hr_profile where status_tm ='N' ;--and to_char(update_date, 'YYYYMMDD') = to_char(sysdate -1, 'YYYYMMDD') ;
       rec_hrprofile c1%rowtype;
begin
     totalrow:=0;
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     select to_char(sysdate,'YYYYMMDDHH24MISS') into sysdateStartTxt from dual;
     select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
     file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_upd_fw_user'||sysdateFile||'.txt','W');
     utl_file.put_line(file_ut,sysdateTxt||' Start lockuserchangeunits data pibics@fw_user .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into rec_hrprofile; exit when c1%notfound;
        <<itemUSER_loop>> FOR itemUSER IN
            (
                select * from fw_user where person_id = rec_hrprofile.profile_seqno
            )
            LOOP
                update fw_user set disable='2',upd_userid='adminauto',lastupdate=sysdate where user_id = itemUSER.user_id;      
                totalrow:=totalrow+1;
            END LOOP
        commit;
        end loop;
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     select to_char(sysdate,'YYYYMMDDHH24MISS') into sysdateEndTxt from dual;     
     utl_file.put_line(file_ut,sysdateTxt||' End Process  lockuserchangeunits data pibics@fw_user .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
     
     /*  INSERT BATCHLOG*/
      INSERT INTO BATCHLOG (BATCHLOGNO, BATCH_SRC, FILE_TYPE, FILE_NAME, FILE_SIZE, TOTALROW, PRROW, 
      ERRROW, STARTPROCESS, ENDPROCESS, STATUS, CREUSR, 
      CREDTE, TFSTATUS, TOTALINS, TOTALUPD, TOTALDEL, NOTE, DATAFILEERROR, TRANSFERDTE) 
       VALUES ( BATCHLOG_SEQ.nextval,'ADMIN','88','adminauto'||to_char(sysdate -1, 'YYMMDD'),null,totalrow,totalrow,
       null , to_date(sysdateStartTxt,'YYYYMMDDHH24MISS'),to_date(sysdateEndTxt,'YYYYMMDDHH24MISS'),  '1' ,'ADMINAUTO',
       SYSDATE, 'Y', '0', totalrow, '0',null ,null ,null );
           
       commit;
end;
END LOCKUSERCHANGEUNITS;
/
  GRANT EXECUTE ON "PIBICSDM2"."LOCKUSERCHANGEUNITS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."LOCKUSERCHANGEUNITS" TO "BIOSAADM";
