CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_TERMINALS" ("DISPLAY_VALUE", "DISPLAY_VALUE_IP", "RETURN_VALUE", "BORDER_POST") AS 
  SELECT NVL(name, name$dlc) AS display_value
      ,ipaddress           AS display_value_ip
      ,id                  AS return_value
      ,border_post
  FROM dl_bordercontrol.terminals$lc
 ORDER BY display_value ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_TERMINALS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_TERMINALS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_TERMINALS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_TERMINALS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_TERMINALS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_TERMINALS" TO "TESTADM";
