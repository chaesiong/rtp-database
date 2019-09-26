CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ABBCOUNTANDNATTIONENM" (COUNTSEQNO NUMBER) RETURN VARCHAR2 IS
TMPRETURNVAR VARCHAR(200);
/******************************************************************************
   NAME:       GET_ABBCOUNTANDNATTIONENM
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        26-Dec-10   Administrator       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GET_ABBCOUNTANDNATTIONENM
      Sysdate:         26-Dec-10
      Date and Time:   26-Dec-10, 4:02:50 PM, and 26-Dec-10 4:02:50 PM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    BEGIN
        SELECT ABBCOUNT || ' - ' || NATIONENM INTO TMPRETURNVAR FROM COUNTRY WHERE COUNT_SEQNO = COUNTSEQNO;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
    END;
    RETURN TMPRETURNVAR;
END GET_ABBCOUNTANDNATTIONENM;
/
