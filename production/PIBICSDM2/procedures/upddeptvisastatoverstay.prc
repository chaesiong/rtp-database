CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDDEPTVISASTATOVERSTAY" (P_YYYYMM IN VARCHAR2, P_YEAR IN NUMBER, P_START IN NUMBER, P_END IN NUMBER, P_SEX IN VARCHAR2, STATISTICFILED  IN VARCHAR2, P_FLAG IN VARCHAR2) IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       INSDEPTSTATISTICPIBICS
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        20/09/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     INSDEPTSTATISTICPIBICS
      Sysdate:         20/09/2012
      Date and Time:   20/09/2012, 12:09:04, and 20/09/2012 12:09:04
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
SQLCOMMAND VARCHAR2(1000);
AMOUNT number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    
    if P_FLAG = '1' then
        select visatype_seqno, COUNT('X') amount 
        from vw_immovs where to_char(processdte,'yyyymmdd')<= P_YYYYMM
        and lastdte <= sysdte and lastdte >= add_months(sysdte,-P_YEAR) and age >= P_START and age < P_END and sex = P_SEX
        group by visatype_seqno;
    end
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTVISASTATOVERSTAY" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTVISASTATOVERSTAY" TO "BIOSAADM";
