CREATE TABLE "PIBICSDM2"."INV_SPALIAS" 
   (	"SPA_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPA_ALIASTYPE" VARCHAR2(20 CHAR), 
	"SPA_ALIAS" VARCHAR2(60 CHAR), 
	"SPA_REMARK" VARCHAR2(500 CHAR), 
	"SPA_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPALIAS" ADD CONSTRAINT "INV_SPALIAS_PK" PRIMARY KEY ("SPA_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPALIAS" ADD CONSTRAINT "INV_SPALIAS_R01" FOREIGN KEY ("SP_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT" ("SP_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPALIAS_PK" ON "PIBICSDM2"."INV_SPALIAS" ("SPA_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SPALIAS" TO "BIOSAADM";
