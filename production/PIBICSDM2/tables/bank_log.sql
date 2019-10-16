CREATE TABLE "PIBICSDM2"."BANK_LOG" 
   (	"BANK_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"BANK_CODE" VARCHAR2(2 CHAR), 
	"BANK_NAME" VARCHAR2(50 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"BANK_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."BANK_LOG" ADD CONSTRAINT "BANK_LOG_PK" PRIMARY KEY ("BANK_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."BANK_LOG_PK" ON "PIBICSDM2"."BANK_LOG" ("BANK_LOG_SEQNO") 
  ;