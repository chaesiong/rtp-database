CREATE TABLE "PIBICSDM2"."RELATIONPASSJOIN_LOG" 
   (	"RPJ_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"RPJSEQNO" NUMBER, 
	"RPJCD" CHAR(2 CHAR), 
	"RPJDESC" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."RELATIONPASSJOIN_LOG" ADD CONSTRAINT "RELATIONPASSJOIN_LOG_PK" PRIMARY KEY ("RPJ_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RELATIONPASSJOIN_LOG_PK" ON "PIBICSDM2"."RELATIONPASSJOIN_LOG" ("RPJ_LOG_SEQNO") 
  ;