CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_OWNERS" ("DISPLAY_VALUE", "RETURN_VALUE", "OWNER$TAG", "TAG$TAG") AS 
  SELECT NVL(lc.display_value, lc.display_value$dlc) AS display_value
      ,lc.key_value AS return_value
      ,tg.owner AS owner$tag
      ,tg.tag AS tag$tag
  FROM dl_common.owners$lc lc
  JOIN dl_common.owners$tag tg ON lc.key_value = tg.key_value
 WHERE lc.is_active = 'Y'
   AND tg.owner = 'APEX_FEE_AND_FINE'
 ORDER BY lc.display_order ASC, lc.display_value ASC;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_OWNERS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_OWNERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_OWNERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_OWNERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_OWNERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_OWNERS" TO "TESTADM";
