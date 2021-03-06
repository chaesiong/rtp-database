CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_PROFESSIONS" ("DISPLAY_VALUE", "RETURN_VALUE") AS 
  SELECT display_code || ' ' || NVL(display_value, name$dlc)  AS display_value
      ,key_value                                            AS return_value
  FROM dl_common.professions$lc
 ORDER BY display_order ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_PROFESSIONS" TO "PUNYAWII_D";
