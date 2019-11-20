CREATE TABLE "PIBICSDM2"."INV_PLMOVEMENT" 
   (	"PLM_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PLM_FROMDATE" DATE, 
	"PLM_TODATE" DATE, 
	"PLM_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"PLM_MOVEMENT" CLOB, 
	"PLM_REMARK" CLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLMOVEMENT" ADD CONSTRAINT "INV_PLMOVEMENT_PK" PRIMARY KEY ("PLM_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLMOVEMENT" ADD CONSTRAINT "INV_PLMOVEMENT_R01" FOREIGN KEY ("PL_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE" ("PL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLMOVEMENT_PK" ON "PIBICSDM2"."INV_PLMOVEMENT" ("PLM_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301526C00012$$" ON "PIBICSDM2"."INV_PLMOVEMENT" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301526C00013$$" ON "PIBICSDM2"."INV_PLMOVEMENT" (
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_PLMOVEMENT" TO "BIOSAADM";
