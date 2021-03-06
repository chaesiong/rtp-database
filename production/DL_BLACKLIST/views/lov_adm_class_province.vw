CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" ("DISPLAY_VALUE", "RETURN_VALUE", "ADM_CLASS_REGION") AS 
  SELECT "DISPLAY_VALUE","RETURN_VALUE","ADM_CLASS_REGION" FROM dl_bordercontrol.lov_adm_class_province;
   COMMENT ON TABLE "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE"  IS 'LoV Available provinces from dl_bordercontrol';
  GRANT SELECT ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "DERMALOG_PROXY";
  GRANT DELETE ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BLACKLIST"."LOV_ADM_CLASS_PROVINCE" TO "BIOSAADM";
