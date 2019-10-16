CREATE TABLE "PIBICSDM2"."ZONE_LOG" 
   (	"ZONE_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"ZONE_SEQNO" NUMBER, 
	"SYSTEM_CODE" VARCHAR2(10 CHAR), 
	"ZONENM" VARCHAR2(50 CHAR), 
	"REMARK" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."ZONE_LOG_PK" ON "PIBICSDM2"."ZONE_LOG" ("ZONE_LOG_SEQNO") 
  ;