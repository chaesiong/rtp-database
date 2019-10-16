CREATE TABLE "PIBICSDM2"."EXT_PRO_218_1236_LOG" 
   (	"PRO_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"WIFENM" VARCHAR2(150 CHAR), 
	"REGIS_DATE" DATE, 
	"REGIS_PLACE" VARCHAR2(200 CHAR), 
	"NUMOFCHILD" NUMBER, 
	"ADDR" VARCHAR2(2500 CHAR), 
	"DEPOSIT" NUMBER(15,2), 
	"SALARY" NUMBER(15,2), 
	"OTH" VARCHAR2(1500 CHAR), 
	"RULE1" CHAR(1 CHAR), 
	"RULE2" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"PROC_LOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_218_1236_LOG" ADD CONSTRAINT "EXT_PRO_218_1236_LOG_PK" PRIMARY KEY ("PRO_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_218_1236_LOG_PK" ON "PIBICSDM2"."EXT_PRO_218_1236_LOG" ("PRO_LOG_SEQNO") 
  ;