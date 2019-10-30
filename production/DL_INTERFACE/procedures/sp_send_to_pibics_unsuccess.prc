CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."SP_SEND_TO_PIBICS_UNSUCCESS" AS 
BEGIN
    DELETE FROM DL_INTERFACE.UNSUCCESS_LIST ;
    COMMIT;

    --DL_INTERFACE.SP_READY_ADD_DATA_TO_PIBICS();
    --DL_INTERFACE.SP_READY_INVELID_GENDER_FORMAT();
    
    DL_INTERFACE.SP_SEND_TO_PIBICS_AGAIN();
    DL_INTERFACE.SP_SEND_TO_PIBICS_CASE_GENDER();

END SP_SEND_TO_PIBICS_UNSUCCESS;
/
  GRANT EXECUTE ON "DL_INTERFACE"."SP_SEND_TO_PIBICS_UNSUCCESS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."SP_SEND_TO_PIBICS_UNSUCCESS" TO "BIOSUPPORT";
