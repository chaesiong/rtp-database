CREATE TABLE "PIBICSDM2"."WELFARE_ACCT" 
   (	"CITIZEDID" CHAR(13 CHAR), 
	"FSCYEAR" CHAR(4 CHAR), 
	"MONTH" CHAR(2 CHAR), 
	"SPWELFAREAMT" NUMBER(10,2), 
	"HLWELFAREAMT" NUMBER(10,2), 
	"FNWELFAREAMT" NUMBER(10,2), 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WELFARE_ACCT" ADD CONSTRAINT "WELFARE_ACCT_PK" PRIMARY KEY ("CITIZEDID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WELFARE_ACCT_PK" ON "PIBICSDM2"."WELFARE_ACCT" ("CITIZEDID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WELFARE_ACCT" TO "BIOSAADM";
