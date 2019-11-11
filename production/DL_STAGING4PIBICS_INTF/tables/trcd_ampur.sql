CREATE TABLE "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" 
   (	"SEQNO" NUMBER, 
	"CODE" VARCHAR2(4 CHAR), 
	"HIGHER" VARCHAR2(4 CHAR), 
	"KEY_VALUE" VARCHAR2(32 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" ADD CONSTRAINT "TRCD_AMPUR_UK1" UNIQUE ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR_UK1" ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" ("SEQNO") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR_UK2" ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR_UK3" ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" ("CODE", "HIGHER") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS_INTF"."TRCD_AMPUR" TO "BIOSAADM";
