CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_RELATIONS" ("DISPLAY_VALUE", "RETURN_VALUE") AS 
  SELECT display_code || ' ' || NVL(display_value, name$dlc) AS display_value
        ,key_value AS return_value
    FROM dl_common.relations$lc
   WHERE is_active = 'Y'
   ORDER BY display_order ASC, display_code ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_RELATIONS" TO "PUNYAWII_D";
