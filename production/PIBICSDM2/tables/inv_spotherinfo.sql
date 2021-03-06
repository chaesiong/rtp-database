CREATE TABLE "PIBICSDM2"."INV_SPOTHERINFO" 
   (	"SPO_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPO_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPO_REMARK" CLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPOTHERINFO" ADD CONSTRAINT "INV_SPOTHERINFO_PK" PRIMARY KEY ("SPO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPOTHERINFO" ADD CONSTRAINT "INV_SPOTHERINFO_R01" FOREIGN KEY ("SP_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT" ("SP_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPOTHERINFO_PK" ON "PIBICSDM2"."INV_SPOTHERINFO" ("SPO_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301588C00010$$" ON "PIBICSDM2"."INV_SPOTHERINFO" (
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SPOTHERINFO" TO "BIOSAADM";
