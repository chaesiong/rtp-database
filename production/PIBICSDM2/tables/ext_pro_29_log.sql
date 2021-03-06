CREATE TABLE "PIBICSDM2"."EXT_PRO_29_LOG" 
   (	"PRO_LOG_SEQNO" NUMBER, 
	"PROC_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"DOCDATE" DATE, 
	"EXPEXT_DATE" DATE, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"AGENCY" VARCHAR2(50 CHAR), 
	"BOOK" VARCHAR2(200 CHAR), 
	"SEAL" VARCHAR2(100 CHAR), 
	"EXT_DATE" DATE, 
	"STUDY_PERIOD" VARCHAR2(100 CHAR), 
	"YEAR_EDUCATION" VARCHAR2(50 CHAR), 
	"COURSE_LEVEL" VARCHAR2(100 CHAR), 
	"RESULTS" VARCHAR2(200 CHAR), 
	"COURSE" VARCHAR2(200 CHAR), 
	"SCHEDULE" VARCHAR2(200 CHAR), 
	"SUPPORT_BOOK" VARCHAR2(2000 CHAR), 
	"FACT1" CHAR(1 CHAR), 
	"COMMAND_FROM" VARCHAR2(150 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_29_LOG" ADD CONSTRAINT "EXT_PRO_29_LOG_PK" PRIMARY KEY ("PRO_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_29_LOG_PK" ON "PIBICSDM2"."EXT_PRO_29_LOG" ("PRO_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PRO_29_LOG" TO "BIOSAADM";
