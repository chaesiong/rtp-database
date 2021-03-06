CREATE TABLE "DL_STAGING4PIBICS_INTF"."TRCD_REGION" 
   (	"SEQNO" NUMBER, 
	"CODE" VARCHAR2(4 CHAR), 
	"KEY_VALUE" VARCHAR2(32 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."TRCD_REGION" ADD CONSTRAINT "TRCD_REGION_UK1" UNIQUE ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_REGION_UK1" ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" ("SEQNO") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_REGION_UK2" ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_REGION_UK3" ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" ("CODE") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS_INTF"."TRCD_REGION" TO "BIOSAADM";
