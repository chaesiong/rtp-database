CREATE TABLE "PIBICSDM2"."CRS_TM18CHILDU12LOG" 
   (	"TM18CHILDU12_SEQNO" NUMBER, 
	"TM18_SEQNO" NUMBER, 
	"FAMILYNM" VARCHAR2(60 CHAR), 
	"FIRSTNM" VARCHAR2(60 CHAR), 
	"MIDDLENM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TM18CHILDU12LOG_SEQNO" NUMBER, 
	"LOG_USRUPD" VARCHAR2(60 CHAR), 
	"LOG_FLAG" VARCHAR2(1 CHAR), 
	"LOG_DATE" DATE, 
	"TM18LOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."CRS_TM18CHILDU12LOG" ADD CONSTRAINT "CRS_TM18CHILDU12LOG_PK" PRIMARY KEY ("TM18CHILDU12LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_TM18CHILDU12LOG" ADD CONSTRAINT "CRS_TM18CHILDU12LOG_CRS_T_FK2" FOREIGN KEY ("TM18LOG_SEQNO")
	  REFERENCES "PIBICSDM2"."CRS_TM18LOG" ("TM18LOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CRS_TM18CHILDU12LOG_PK" ON "PIBICSDM2"."CRS_TM18CHILDU12LOG" ("TM18CHILDU12LOG_SEQNO") 
  ;