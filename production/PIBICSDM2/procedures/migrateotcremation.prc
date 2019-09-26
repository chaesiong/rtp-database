CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEOTCREMATION" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEOTCREMATION
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        10/09/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEOTCREMATION
      Sysdate:         10/09/2012
      Date and Time:   10/09/2012, 16:51:43, and 10/09/2012 16:51:43
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
    select profile_seqno, b.cremation from hr_profile_ot a,  cremation_ot b where
    a.name = b.name and a.sname = b.sname;
    rec_ot c1%rowtype;
begin
    totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_hrProfileCreamtionOT'||sysdateFile,'W');
    utl_file.put_line(file_ut,sysdateTxt||' Start migrate Cremation 2 PIBICS HR_PROFILE_OT .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into rec_ot; exit when c1%notfound;
        foundhr:='NOTFOUND';
               update hr_profile_ot set cremation = rec_ot.cremation where profile_seqno = rec_ot.profile_seqno;
        commit;
        end loop;
        
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' End migrate Cremation 2 PIBICS HR_PROFILE_OT .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
end;
END MIGRATEOTCREMATION;
/
