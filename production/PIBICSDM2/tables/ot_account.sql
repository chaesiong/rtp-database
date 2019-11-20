CREATE TABLE "PIBICSDM2"."OT_ACCOUNT" 
   (	"ACCOUNTSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_ACCOUNT" ADD CONSTRAINT "OT_OTACCOUNT_PK" PRIMARY KEY ("ACCOUNTSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_ACCOUNT" ADD CONSTRAINT "OT_ACCOUNT_U01" UNIQUE ("DEPT_SEQNO", "ESTIMATEMONTH", "ESTIMATEYEAR")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_ACCOUNT_U01" ON "PIBICSDM2"."OT_ACCOUNT" ("DEPT_SEQNO", "ESTIMATEMONTH", "ESTIMATEYEAR") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."OT_OTACCOUNT_PK" ON "PIBICSDM2"."OT_ACCOUNT" ("ACCOUNTSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_ACCOUNT" TO "BIOSAADM";
