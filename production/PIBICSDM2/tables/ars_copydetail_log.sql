CREATE TABLE "PIBICSDM2"."ARS_COPYDETAIL_LOG" 
   (	"COPYDE_LOG_SEQNO" NUMBER, 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDATE" DATE, 
	"LOGUSERID" VARCHAR2(30 CHAR), 
	"COPYDE_SEQNO" NUMBER, 
	"COPYRECEPT_SEQNO" NUMBER, 
	"DETAIL_TYPE" CHAR(1 CHAR), 
	"DETAIL_DESC" VARCHAR2(300 CHAR), 
	"VERSION" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"AMOUNT" NUMBER(7,2), 
	"COPYRECEIPTLOG_SEQNO" NUMBER, 
	"ALIENCERTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_COPYDETAIL_LOG" ADD CONSTRAINT "ARS_COPYDETAIL_LOG_PK" PRIMARY KEY ("COPYDE_LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_COPYDETAIL_LOG" ADD CONSTRAINT "ARS_COPYDETAIL_LOG_R01" FOREIGN KEY ("COPYRECEPT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_COPYRECEIPT" ("COPYRECEIPT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."ARS_COPYDETAIL_LOG" ADD CONSTRAINT "ARS_COPYDETAIL_LOG_R02" FOREIGN KEY ("COPYRECEIPTLOG_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_COPYRECEIPT_LOG" ("COPYRECEIPTLOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_COPYDETAIL_LOG_PK" ON "PIBICSDM2"."ARS_COPYDETAIL_LOG" ("COPYDE_LOG_SEQNO") 
  ;