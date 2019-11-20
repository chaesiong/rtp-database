CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CLEAR_CHNG_CHANGEVISALIST_TMP" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       CLEAR_CHNG_CHANGEVISALIST_TMP
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        06/18/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     CLEAR_CHNG_CHANGEVISALIST_TMP
      Sysdate:         06/18/2013
      Date and Time:   06/18/2013, 5:18:39 PM, and 06/18/2013 5:18:39 PM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   tmpVar := 0;
   delete CHNG_CHANGEVISALIST_TMP;
   commit;   
   
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
         -- Consider logging the error and then re-raise
       RAISE;
END CLEAR_CHNG_CHANGEVISALIST_TMP;
/
  GRANT EXECUTE ON "PIBICSDM2"."CLEAR_CHNG_CHANGEVISALIST_TMP" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CLEAR_CHNG_CHANGEVISALIST_TMP" TO "BIOSAADM";
