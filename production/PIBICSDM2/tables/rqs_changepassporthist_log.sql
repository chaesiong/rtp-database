CREATE TABLE "PIBICSDM2"."RQS_CHANGEPASSPORTHIST_LOG" 
   (	"PASSHIST_SEQNO" NUMBER, 
	"MOVESTAMP_SEQNO" NUMBER, 
	"RQSPERSON_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_PIC" VARCHAR2(50 CHAR), 
	"ISSUE_DATE" DATE, 
	"ISSUE_PLACE" VARCHAR2(100 CHAR), 
	"EXP_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"TFIRSTNM" VARCHAR2(100 CHAR), 
	"TFAMILYNM" VARCHAR2(100 CHAR), 
	"TMIDDLENM" VARCHAR2(100 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"PASSHIST_LOG_SEQNO" NUMBER, 
	"MOVESTAMP_LOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_CHANGEPASSPORTHIST_LOG" ADD PRIMARY KEY ("PASSHIST_LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_CHANGEPASSPORTHIST_LOG" ADD FOREIGN KEY ("MOVESTAMP_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_MOVESTAMP" ("MOVESTAMP_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_CHANGEPASSPORTHIST_LOG" ADD FOREIGN KEY ("RQSPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_PERSON" ("RQSPERSON_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_CHANGEPASSPORTHIST_LOG" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_CHANGEPASSPORTHIST_LOG" ADD FOREIGN KEY ("MOVESTAMP_LOG_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_MOVESTAMP_LOG" ("MOVESTAMP_LOG_SEQNO") ON DELETE CASCADE ENABLE;
  ;