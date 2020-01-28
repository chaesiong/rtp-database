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
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_PAYMENT_RATE" TO "PUNYAWII_D";
