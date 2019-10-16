CREATE TABLE "PIBICSDM2"."WF_WATERUSAGE_LOG" 
   (	"WAT_SEQNO_LOG" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USERID" VARCHAR2(30 CHAR), 
	"WAT_SEQNO" NUMBER, 
	"APT_SEQNO" NUMBER, 
	"WAT_MONTH" NUMBER, 
	"WAT_YEAR" CHAR(4 CHAR), 
	"WAT_METERVALUE" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"WAT_USAGE" NUMBER, 
	"PROCESS" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_WATERUSAGE_LOG" ADD CONSTRAINT "WF_WATERUSAGE_LOG_PK" PRIMARY KEY ("WAT_SEQNO_LOG")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."WF_WATERUSAGE_LOG" ADD CONSTRAINT "WF_WATERUSAGE_LOG_R01" FOREIGN KEY ("APT_SEQNO")
	  REFERENCES "PIBICSDM2"."WF_APARTMENT" ("APT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_WATERUSAGE_LOG_PK" ON "PIBICSDM2"."WF_WATERUSAGE_LOG" ("WAT_SEQNO_LOG") 
  ;