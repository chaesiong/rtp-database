CREATE TABLE "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" 
   (	"SEQNO" NUMBER, 
	"CODE" VARCHAR2(4 CHAR), 
	"KEY_VALUE" VARCHAR2(32 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" ADD CONSTRAINT "TRCD_CONVEYANCE_UK1" UNIQUE ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE_UK1" ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" ("SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_CONVEYANCE" TO "BIOSUPPORT";
