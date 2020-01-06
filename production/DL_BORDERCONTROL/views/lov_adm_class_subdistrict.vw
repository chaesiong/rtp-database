CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" ("DISPLAY_VALUE", "RETURN_VALUE", "ADM_CLASS_DISTRICT") AS 
  SELECT /*display_code || ' ' ||*/ NVL(display_value, name$dlc)  AS display_value
      ,key_value                                            AS return_value
      ,adm_class_district
  FROM dl_bordercontrol.adm_class_subdistrict$lc
 ORDER BY display_order ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_SUBDISTRICT" TO "PORNRUKSA_S";
