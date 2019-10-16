CREATE TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" 
   (	"OCCUPATIONHISTLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"OCCUPATIONHIST_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"LICENSE_NUMBER" VARCHAR2(30 CHAR), 
	"LICENSE_ISSUEPV" NUMBER, 
	"LICENSE_DATE" DATE, 
	"LICENSEEXP_DATE" DATE, 
	"POSITION" VARCHAR2(60 CHAR), 
	"COMPANYNM" VARCHAR2(60 CHAR), 
	"ADDR" VARCHAR2(60 CHAR), 
	"ROAD" VARCHAR2(60 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"TELPHONENO" VARCHAR2(50 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"ALIENCERTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD CONSTRAINT "ARS_OCCUPATIONHIST_LOG_PK" PRIMARY KEY ("OCCUPATIONHISTLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD CONSTRAINT "ARS_OCCUPATIONHIST_LOG_R01" FOREIGN KEY ("LICENSE_ISSUEPV")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG_PK" ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ("OCCUPATIONHISTLOG_SEQNO") 
  ;