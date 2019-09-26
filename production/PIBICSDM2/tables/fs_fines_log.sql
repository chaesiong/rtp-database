CREATE TABLE "PIBICSDM2"."FS_FINES_LOG" 
   (	"FINESLOG_SEQNO" NUMBER, 
	"FINES_SEQNO" NUMBER, 
	"FINESNO" VARCHAR2(20 CHAR), 
	"FINESLIPNO" VARCHAR2(20 CHAR), 
	"FINESLIPBOOKNO" VARCHAR2(20 CHAR), 
	"FINESLIPDATE" TIMESTAMP (6), 
	"PRINTFLAG" CHAR(1 CHAR), 
	"FINESLIPAMOUNT" NUMBER(10,2), 
	"CHARGEDOF" VARCHAR2(100 CHAR), 
	"CHARGENO" VARCHAR2(20 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"TM6NO" VARCHAR2(7 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"INDTE" DATE, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISAEXPDTE" DATE, 
	"OUTDTE" DATE, 
	"FINESTATUS" VARCHAR2(10 CHAR), 
	"FINESREMARK" VARCHAR2(1500 CHAR), 
	"FLAG_SYSTEM" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_USRUPD" VARCHAR2(60 CHAR), 
	"VERSION" NUMBER(10,0), 
	"PERMIT_SEQNO" NUMBER, 
	"PERMIT_DATE" DATE, 
	"SLIPTYPE" CHAR(1 CHAR), 
	"SUFFIX_SEQNO" NUMBER, 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"STAFF_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_FINES_LOG" ADD CONSTRAINT "FS_FINES_LOG_R01" PRIMARY KEY ("FINESLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_FINES_LOG" ADD FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_FINES_LOG" ADD FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_FINES_LOG" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_FINES_LOG_R01" ON "PIBICSDM2"."FS_FINES_LOG" ("FINESLOG_SEQNO") 
  ;
