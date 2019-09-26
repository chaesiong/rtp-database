CREATE TABLE "PIBICSDM2"."CHNG_CHANGEVISALIST_LOG" 
   (	"CHANGEVISALIST_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"CHANGEVISALIST_SEQNO" NUMBER, 
	"CHANGEVISA_SEQNO" NUMBER, 
	"EFIRSTNM" VARCHAR2(50 CHAR), 
	"EFAMILYNM" VARCHAR2(50 CHAR), 
	"EMIDDLENM" VARCHAR2(50 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CHNGPERSON_SEQNO" NUMBER, 
	"UDEPT_SEQNO" NUMBER, 
	"CHANGEVISA_LOG_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"FEES_SEQNO" NUMBER, 
	"FINES_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"CHANGEVISA_DOCNO" VARCHAR2(50 CHAR), 
	"PASSPORT_EXPDATE" DATE, 
	"IN_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISATYPESUB_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"BUILDING" VARCHAR2(200 CHAR), 
	"ADDR" VARCHAR2(200 CHAR), 
	"ROAD" VARCHAR2(200 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(200 CHAR), 
	"NOTE" VARCHAR2(500 CHAR), 
	"FINES_STS" CHAR(1 CHAR), 
	"FEES_STS" CHAR(1 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."CHNG_CHANGEVISALIST_LOG_PK" ON "PIBICSDM2"."CHNG_CHANGEVISALIST_LOG" ("CHANGEVISALIST_LOG_SEQNO") 
  ;
