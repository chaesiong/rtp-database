CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" ("DISPLAY_VALUE", "RETURN_VALUE", "PAYMENT_TYPE") AS 
  SELECT NVL(display_value, display_value$dlc)  AS display_value
      ,key_value                     AS return_value
      ,payment_type
  FROM dl_bordercontrol.faf_payment_rate$lc
 ORDER BY display_order ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."LOV_PAYMENT_RATE" TO "BIOSAADM";
