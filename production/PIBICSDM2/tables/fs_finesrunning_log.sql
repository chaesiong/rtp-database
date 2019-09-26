CREATE TABLE "PIBICSDM2"."FS_FINESRUNNING_LOG" 
   (	"FINESRUN_LOG_SEQNO" NUMBER, 
	"FINESRUN_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"FINES_YEAR" VARCHAR2(4 CHAR), 
	"FINES_RUNNINGNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_FINESRUNNING_LOG" ADD CONSTRAINT "FS_FINESRUNNING_LOG_PK" PRIMARY KEY ("FINESRUN_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_FINESRUNNING_LOG_PK" ON "PIBICSDM2"."FS_FINESRUNNING_LOG" ("FINESRUN_LOG_SEQNO") 
  ;
