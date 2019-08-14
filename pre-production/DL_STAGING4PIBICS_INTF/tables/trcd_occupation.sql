CREATE TABLE "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" 
   (	"SEQNO" NUMBER, 
	"CODE" VARCHAR2(4 CHAR), 
	"KEY_VALUE" VARCHAR2(32 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" ADD CONSTRAINT "TRCD_OCCUPATION_UK1" UNIQUE ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION_UK1" ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" ("SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "TESTADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_OCCUPATION" TO "TRAINEE";
