CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" ("KEY_VALUE", "DISPLAY_VALUE", "DISPLAY_ORDER", "DISPLAY_CODE", "COSTS_REGULAR", "COSTS_LIMIT", "PAYMENT_TYPE", "OWNER", "DISPLAY_VALUE_SHORT") AS 
  SELECT key_value
      ,NVL(display_value, display_value$dlc) AS display_value
      ,display_order
      ,display_code
      ,costs_regular
      ,costs_limit
      ,payment_type
      ,owner
      ,display_value_short
  FROM dl_bordercontrol.faf_payment_rate$lc
 WHERE is_active = 'Y';
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSUPPORT";
