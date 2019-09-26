CREATE TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET_LOG" 
   (	"EXTLIST_NET_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"EXTLIST_NET_SEQNO" NUMBER, 
	"EXT_SEQNO" NUMBER, 
	"DOC_NO" VARCHAR2(50 CHAR), 
	"REASON_SEQNO" NUMBER, 
	"EXT_DAY" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"EXT_DATE" DATE, 
	"TM6NO" VARCHAR2(7 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(50 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"PASSPORT_PLACE" VARCHAR2(50 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORT_EXPDATE" DATE, 
	"IN_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"FROMCOUNT_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"BUILDING" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(100 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(20 CHAR), 
	"PERSON_STS" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"FINE_SEQNO1" NUMBER, 
	"FINE_SEQNO2" NUMBER, 
	"FINE_SEQNO3" NUMBER, 
	"FINE_SEQNO4" NUMBER, 
	"FEESLIP_SEQNO" NUMBER, 
	"APPROVE_STS" CHAR(1 CHAR), 
	"COMMAND_SEQNO" NUMBER, 
	"COMMAND_OTH" VARCHAR2(100 CHAR), 
	"PERMIT_DATE" DATE, 
	"APPROVE_REM" VARCHAR2(100 CHAR), 
	"WAITCOMMENT_SEQNO" NUMBER, 
	"WAITCOMMENT_OTH" VARCHAR2(100 CHAR), 
	"WAIT_DATE" DATE, 
	"NO_DATE" DATE, 
	"NO_REM" VARCHAR2(100 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"CPASSPORTNO" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"EXTIMG" BLOB, 
	"PASSPORT_PIC" VARCHAR2(70 CHAR), 
	"VISA_DATE" DATE, 
	"OLD_PERMIT_DATE" DATE, 
	"COM_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET_LOG" ADD CONSTRAINT "EXT_EXTENSIONLIST_NET_LOG_PK" PRIMARY KEY ("EXTLIST_NET_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_EXTENSIONLIST_NET_LOG_PK" ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET_LOG" ("EXTLIST_NET_LOG_SEQNO") 
  ;
  ;
