CREATE TABLE "DL_STAGING4PIBICS_INTF"."MAPP_ZONE_TERMINAL" 
   (	"ZONE_SEQNO" NUMBER, 
	"INS_TERMINAL" VARCHAR2(32)
   ) ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."MAPP_ZONE_TERMINAL" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."MAPP_ZONE_TERMINAL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."MAPP_ZONE_TERMINAL" TO "BIOSUPPORT";
