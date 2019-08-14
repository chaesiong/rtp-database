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
  GRANT SELECT ON "DL_BORDERCONTROL"."VISA_NAME" TO "TESTADM";