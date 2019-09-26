CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEOTWF_CREMATION" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEOTWF_CREMATION
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        11/09/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEOTWF_CREMATION
      Sysdate:         11/09/2012
      Date and Time:   11/09/2012, 15:00:00, and 11/09/2012 15:00:00
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
     select * from hr_profile_ot where cremation = 'Y';
    rec_ot c1%rowtype;
begin
    totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_hrProfileOTCremation'||sysdateFile,'W');
    utl_file.put_line(file_ut,sysdateTxt||' Start migrate HR_PROFILE_OT 2 PIBICS WF_CREMATIOn .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into rec_ot; exit when c1%notfound;
        foundhr:='NOTFOUND';
        
               seqno:=GetSEQ_RUNNO('WF_CREMATION');
               --foundhr:='FOUND';
                insert into wf_cremation (cm_seqno, cm_applydate, cm_quitdate, cm_cremationsts, cm_fundmomdate, profile_seqno, 
                actflag, create_by, create_date, update_by, update_date, cm_remark, version, cm_funddaddate, cm_fundwfdate) 
                values ( seqno, to_date('01/01/2012', 'dd/mm/yyyy'), null, 'A', null, rec_ot.profile_seqno, null, 
                'ittipon', sysdate, 'ittipon', sysdate, null, 0, null, null );
               totalrow:=totalrow+1;
     
        commit;
        end loop;
        
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' End migrate HR_PROFILE_OT 2 PIBICS WF_CREMATIOn .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
end;
END MIGRATEOTWF_CREMATION;
/
