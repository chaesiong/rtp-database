CREATE TABLE "PIBICSDM2"."DRS_IDCSTS_LOG" 
   (	"IDCSTS_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"IDCSTS_SEQNO" NUMBER, 
	"IDCSTSCD" CHAR(2 CHAR), 
	"IDCSTS_DESC" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_IDCSTS_LOG" ADD CONSTRAINT "DRS_IDCSTS_LOG_PK" PRIMARY KEY ("IDCSTS_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DRS_IDCSTS_LOG_PK" ON "PIBICSDM2"."DRS_IDCSTS_LOG" ("IDCSTS_LOG_SEQNO") 
  ;