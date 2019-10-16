CREATE TABLE "PIBICSDM2"."ARS_ALIEN_LOG" 
   (	"ALIENLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"ALIEN_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"OPASSPORTNO" VARCHAR2(60 CHAR), 
	"OPASSPORT_DATE" DATE, 
	"OPASSPORTISSUE" VARCHAR2(60 CHAR), 
	"OPASSPORTEXP_DATE" DATE, 
	"CPASSPORTNO" VARCHAR2(60 CHAR), 
	"CPASSPORT_DATE" DATE, 
	"CPASSPORTISSUE" VARCHAR2(60 CHAR), 
	"CPASSPORTEXP_DATE" DATE, 
	"CERTOFRESIDENCE_SEQNO" NUMBER, 
	"RCISSUE_DATE" DATE, 
	"RCISSUE_BY" VARCHAR2(60 CHAR), 
	"RCISSUEAMP_SEQNO" NUMBER, 
	"RCISSUEPV_SEQNO" NUMBER, 
	"IMMIGRATIONTYPE" VARCHAR2(30 CHAR), 
	"QUOTANO" VARCHAR2(10 CHAR), 
	"QUOTA_YEAR" CHAR(2 CHAR), 
	"QUOTA_DATE" DATE, 
	"ALIENCERT_NUMBER" NUMBER, 
	"ALIENCERT_YEAR" CHAR(4 CHAR), 
	"ACPLS_SEQNO" NUMBER, 
	"ACISSUE_DATE" DATE, 
	"ALIENSTS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_ALIEN_LOG" ADD CONSTRAINT "ARS_ALIENLOG_PK" PRIMARY KEY ("ALIENLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_ALIEN_LOG" ADD FOREIGN KEY ("CERTOFRESIDENCE_SEQNO")
	  REFERENCES "PIBICSDM2"."CRS_CERTOFRESIDENCE" ("CERTOFRESIDENCE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_ALIEN_LOG" ADD FOREIGN KEY ("RCISSUEAMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_ALIEN_LOG" ADD FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_ALIEN_LOG" ADD FOREIGN KEY ("RCISSUEPV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_ALIENLOG_PK" ON "PIBICSDM2"."ARS_ALIEN_LOG" ("ALIENLOG_SEQNO") 
  ;