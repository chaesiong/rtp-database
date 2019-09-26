CREATE TABLE "PIBICSDM2"."FN_PERSON_LOG" 
   (	"FN_PERSON_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"FNPERSON_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(40 CHAR), 
	"TM6NO" VARCHAR2(7 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"INDTE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"HTYPE_SEQNO" NUMBER, 
	"BUILDING" VARCHAR2(500 CHAR), 
	"ADDR" VARCHAR2(200 CHAR), 
	"ROAD" VARCHAR2(50 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"TEL" VARCHAR2(100 CHAR), 
	"DOCDATE" DATE, 
	"NEXT_DATE" DATE, 
	"PREVIOUS_DATE" DATE, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"VERSION" NUMBER, 
	"FIGHTNO" VARCHAR2(20 CHAR), 
	"PERMITDATE" DATE, 
	"FLIGHTPREFIX" VARCHAR2(10 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(10 CHAR), 
	"BARCODE" VARCHAR2(50 CHAR), 
	"FNEXLOGSEQNO" NUMBER, 
	"PHONE_HOME" VARCHAR2(25 CHAR), 
	"EMAIL" VARCHAR2(150 CHAR), 
	"ANDD_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FN_PERSON_LOG" ADD CONSTRAINT "FNPERSON_LOG_PK" PRIMARY KEY ("FN_PERSON_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FNPERSON_LOG_PK" ON "PIBICSDM2"."FN_PERSON_LOG" ("FN_PERSON_LOG_SEQNO") 
  ;
