CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEAMTMEMBERDEAD" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEAMTMEMBERDEAD
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        17/09/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEAMTMEMBERDEAD
      Sysdate:         17/09/2012
      Date and Time:   17/09/2012, 21:33:13, and 17/09/2012 21:33:13
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
timenow varchar2(25);
totalrow number(20);
foundhr varchar2(20);
seqno number(20);
file_ut UTL_FILE.FILE_TYPE;
cursor c1 is              
    select b.profile_seqno, firstname, lastname, decode(amtmemberdead, 0, null, 'Y') amtmemberdead
    from otperperson a, hr_profile_ot b where a.firstname = b.name and a.lastname = b.sname and a.BANKACCOUNT is null
    order by profile_seqno;
    recHR c1%rowtype;
begin
    totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_hrProfileAmtmemberdead'||sysdateFile,'W');
    utl_file.put_line(file_ut,sysdateTxt||' Start migrate OTPERPERON amtmemberdead 2 PIBICS HR_PROFILE_OT .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into recHR; exit when c1%notfound;
        update hr_profile_ot set cremation = recHR.amtmemberdead where profile_seqno = recHR.profile_seqno;
        commit;
        end loop;
        
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' End migrate OTPERPERON amtmemberdead 2 PIBICS HR_PROFILE_OT .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
end;
END MIGRATEAMTMEMBERDEAD;
/
