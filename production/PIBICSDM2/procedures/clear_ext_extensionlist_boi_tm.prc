CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CLEAR_EXT_EXTENSIONLIST_BOI_TM" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       CLEAR_EXT_EXTENSIONLIST_BOI_TM
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        06/18/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     CLEAR_EXT_EXTENSIONLIST_BOI_TM
      Sysdate:         06/18/2013
      Date and Time:   06/18/2013, 5:35:58 PM, and 06/18/2013 5:35:58 PM
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   tmpVar := 0;
   delete EXT_EXTENSIONLIST_BOI_TMP;
   commit;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END CLEAR_EXT_EXTENSIONLIST_BOI_TM;
/
  GRANT EXECUTE ON "PIBICSDM2"."CLEAR_EXT_EXTENSIONLIST_BOI_TM" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CLEAR_EXT_EXTENSIONLIST_BOI_TM" TO "BIOSAADM";
