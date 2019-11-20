CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETSEQ_RUNNO" (P_TABLE IN VARCHAR2) RETURN NUMBER IS
tmp NUMBER;
/******************************************************************************
   NAME:       GetSEQ_RUNNO
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/09/2011   Administrator       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GetSEQ_RUNNO
      Sysdate:         16/09/2011
      Date and Time:   16/09/2011, 09:48:51, and 16/09/2011 09:48:51
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
        tmp:=0;
        select max(runno) into tmp from seq_runno where TABLENM = P_TABLE;        
        update seq_runno set runno = tmp+1 where TABLENM = P_TABLE;
        commit;
        return tmp;
END GetSEQ_RUNNO;
/
  GRANT EXECUTE ON "PIBICSDM2"."GETSEQ_RUNNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GETSEQ_RUNNO" TO "BIOSAADM";
