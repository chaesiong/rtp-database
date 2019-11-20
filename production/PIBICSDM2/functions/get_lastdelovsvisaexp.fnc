CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_LASTDELOVSVISAEXP" (DELIMMOVS_SEQNO NUMBER) RETURN DATE IS
LASTDTE DATE;
IMMOVS_REC DELIMMOVERSTAY%ROWTYPE;
/******************************************************************************
   NAME:       GET_LASTOVSVISAEXP
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        18/12/2014   Sumet-C       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GET_LASTOVSVISAEXP
      Sysdate:         18/12/2014
      Date and Time:   18/12/2014, 17:01:51, and 18/12/2014 17:01:51
      Username:        Sumet-C (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    SELECT * INTO IMMOVS_REC FROM DELIMMOVERSTAY WHERE DIOVSEQNO = DELIMMOVS_SEQNO;
    IF IMMOVS_REC.EXTFLAG = 'Y' OR IMMOVS_REC.CHNGFLAG = 'Y' OR IMMOVS_REC.RQSFLAG = 'Y' THEN
       IF IMMOVS_REC.RQSFLAG = 'Y' THEN
            LASTDTE := IMMOVS_REC.RQSPERMITDTE;
       ELSIF IMMOVS_REC.CHNGFLAG = 'Y' THEN
            LASTDTE := IMMOVS_REC.CHNGPERMITDTE;
       ELSIF IMMOVS_REC.EXTFLAG = 'Y' THEN
            LASTDTE := IMMOVS_REC.EXTPERMITDTE;
       END IF;
    ELSE
         LASTDTE := IMMOVS_REC.VISAEXPDTE;
    END IF;
   RETURN LASTDTE;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       NULL;
END GET_LASTDELOVSVISAEXP;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_LASTDELOVSVISAEXP" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_LASTDELOVSVISAEXP" TO "BIOSAADM";
