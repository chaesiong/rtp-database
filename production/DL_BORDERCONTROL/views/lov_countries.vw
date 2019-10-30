CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_COUNTRIES" ("DISPLAY_VALUE", "RETURN_VALUE") AS 
  SELECT NVL(display_value, display_value$dlc) AS display_value
      ,key_value                             AS return_value
  FROM dl_common.countries$lc
 ORDER BY display_order ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_COUNTRIES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_COUNTRIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_COUNTRIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_COUNTRIES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_COUNTRIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_COUNTRIES" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_COUNTRIES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_COUNTRIES" TO "BIOSUPPORT";
