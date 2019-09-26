CREATE TABLE "PIBICSDM2"."EXT_PRO_216_LOG" 
   (	"PRO_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"CER_FROM" VARCHAR2(100 CHAR), 
	"OTH" VARCHAR2(1500 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"PROC_LOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_216_LOG" ADD CONSTRAINT "EXT_PRO_216_LOG_PK" PRIMARY KEY ("PRO_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_216_LOG_PK" ON "PIBICSDM2"."EXT_PRO_216_LOG" ("PRO_LOG_SEQNO") 
  ;
