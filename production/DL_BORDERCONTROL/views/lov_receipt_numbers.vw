CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" ("DISPLAY_VALUE", "RETURN_VALUE") AS 
  SELECT booking_number || '/' || receipt_number AS display_value
      ,key_value                               AS return_value
  FROM dl_bordercontrol.faf_fees_and_fines
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RECEIPT_NUMBERS" TO "BIOSUPPORT";
