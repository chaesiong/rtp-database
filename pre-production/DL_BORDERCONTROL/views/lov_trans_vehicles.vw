CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."LOV_TRANS_VEHICLES" ("DISPLAY_VALUE", "RETURN_VALUE") AS 
  SELECT NVL(display_value, display_value$dlc)  AS display_value
      ,key_value                              AS return_value
  FROM dl_common.trans_vehicles$lc
 ORDER BY display_order ASC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_TRANS_VEHICLES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOV_TRANS_VEHICLES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOV_TRANS_VEHICLES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_TRANS_VEHICLES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOV_TRANS_VEHICLES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOV_TRANS_VEHICLES" TO "TESTADM";
