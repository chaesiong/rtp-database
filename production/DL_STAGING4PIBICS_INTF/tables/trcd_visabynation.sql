CREATE TABLE "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" 
   (	"SEQNO" NUMBER, 
	"KEY_VALUE_COUNTRY" VARCHAR2(32 CHAR), 
	"KEY_VALUE_VISA_TYPE" VARCHAR2(32 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" ADD CONSTRAINT "TRCD_VISABYNATION_UK1" UNIQUE ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION_UK1" ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" ("SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_VISABYNATION" TO "APPSUP";
