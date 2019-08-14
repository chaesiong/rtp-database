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