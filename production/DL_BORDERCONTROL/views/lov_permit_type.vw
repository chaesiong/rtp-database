CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_PERMIT_TYPE" ("DISPLAY_VALUE", "RETURN_VALUE") AS 
  SELECT NVL(display_value, display_value)  AS display_value
      ,key_value                          AS return_value
  FROM dl_bordercontrol.faf_permit_type$lc
 ORDER BY display_order ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PERMIT_TYPE" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_PERMIT_TYPE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_PERMIT_TYPE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PERMIT_TYPE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_PERMIT_TYPE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PERMIT_TYPE" TO "APPSUP";
