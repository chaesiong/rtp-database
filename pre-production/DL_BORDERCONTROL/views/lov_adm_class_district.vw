CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_ADM_CLASS_DISTRICT" ("DISPLAY_VALUE", "RETURN_VALUE", "ADM_CLASS_PROVINCE") AS 
  SELECT /*display_code || ' ' ||*/ NVL(display_value, name$dlc)  AS display_value
      ,key_value                                            AS return_value
      ,adm_class_province
  FROM dl_bordercontrol.adm_class_district$lc
 ORDER BY display_order ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_DISTRICT" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_DISTRICT" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_DISTRICT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_DISTRICT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_DISTRICT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_DISTRICT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_ADM_CLASS_DISTRICT" TO "TESTADM";
