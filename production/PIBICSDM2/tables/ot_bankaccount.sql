CREATE TABLE "PIBICSDM2"."OT_BANKACCOUNT" 
   (	"BANKACCTSEQNO" NUMBER, 
	"BANK_SEQNO" NUMBER, 
	"BANKACCTNO" VARCHAR2(15 CHAR), 
	"PROFILE_SEQNO" NUMBER, 
	"BANKACCTNAME" VARCHAR2(100 CHAR), 
	"BANKBRANCH" VARCHAR2(100 CHAR), 
	"BANKREMARK" VARCHAR2(600 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_BANKACCOUNT" ADD CONSTRAINT "OT_BANKACCOUNT_PK" PRIMARY KEY ("BANKACCTSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_BANKACCOUNT" ADD CONSTRAINT "OT_BANKACCOUNT_R01" FOREIGN KEY ("BANK_SEQNO")
	  REFERENCES "PIBICSDM2"."BANK" ("BANK_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_BANKACCOUNT_PK" ON "PIBICSDM2"."OT_BANKACCOUNT" ("BANKACCTSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_BANKACCOUNT" TO "BIOSAADM";
