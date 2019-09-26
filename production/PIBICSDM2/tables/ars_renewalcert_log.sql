CREATE TABLE "PIBICSDM2"."ARS_RENEWALCERT_LOG" 
   (	"RENEWALCERTLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"RENEWALCERT_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"RENEWTYPE" VARCHAR2(50 CHAR), 
	"RENEW_DATE" DATE, 
	"RENEWEXP_DATE" DATE, 
	"NPOLIS_SEQNO" NUMBER, 
	"REPT_DATE" DATE, 
	"REPTNO" VARCHAR2(20 CHAR), 
	"REPTBOOKNO" VARCHAR2(15 CHAR), 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"NPOLISPV_SEQNO" NUMBER, 
	"NPOLISBH_SEQNO" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"ALIENCERTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_RENEWALCERT_LOG" ADD CONSTRAINT "ARS_RENEWALCERT_LOG_PK" PRIMARY KEY ("RENEWALCERTLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_RENEWALCERT_LOG" ADD FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_RENEWALCERT_LOG" ADD FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_RENEWALCERT_LOG" ADD FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_RENEWALCERT_LOG_PK" ON "PIBICSDM2"."ARS_RENEWALCERT_LOG" ("RENEWALCERTLOG_SEQNO") 
  ;
