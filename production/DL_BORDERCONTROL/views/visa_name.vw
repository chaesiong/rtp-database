CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."VISA_NAME" ("KEY_VALUE", "DISPLAY_VALUE") AS 
  select distinct
	  vt.key_value
	  , NVL(vt.display_value, vt.DISPLAY_VALUE$DLC) display_value
	from
	  DL_COMMON.VISA_TYPES#ICAO_DC_ITMS$LC vt
;
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."VISA_NAME" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."VISA_NAME" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VISA_NAME" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."VISA_NAME" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "PORNRUKSA_S";
