CREATE TABLE "PIBICSDM2"."PLACE_SUBTYPE_LOG" 
   (	"PS_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"PS_SEQNO" NUMBER, 
	"PS_CODE" VARCHAR2(5 CHAR), 
	"PS_NAME" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"PT_CODE" VARCHAR2(5 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."PLACE_SUBTYPE_LOG" ADD CONSTRAINT "PLACE_SUBTYPE_LOG_PK" PRIMARY KEY ("PS_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."PLACE_SUBTYPE_LOG_PK" ON "PIBICSDM2"."PLACE_SUBTYPE_LOG" ("PS_LOG_SEQNO") 
  ;