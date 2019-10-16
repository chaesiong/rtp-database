CREATE TABLE "PIBICSDM2"."DLYLOG" 
   (	"DLYLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"DLY_SEQNO" NUMBER, 
	"INTM2_SEQNO" NUMBER, 
	"INDTE" DATE, 
	"OUTTM2_SEQNO" NUMBER, 
	"OUTDTE" DATE, 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORTDTE" DATE, 
	"PASSPORTISU" NUMBER, 
	"PASSPORTEXPDTE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"TRNSSTS" CHAR(1 CHAR), 
	"OUTCONV_SEQNO" NUMBER, 
	"OUTCONVNATIONCD" NUMBER, 
	"OUTCONVREGNO" VARCHAR2(20 CHAR), 
	"PERSONSTS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"NOTE" VARCHAR2(250 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."DLYLOG" ADD CONSTRAINT "DLYLOG_PK" PRIMARY KEY ("DLYLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DLYLOG" ADD CONSTRAINT "DLYLOG_R01" FOREIGN KEY ("INTM2_SEQNO")
	  REFERENCES "PIBICSDM2"."TM2" ("TM2_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."DLYLOG" ADD CONSTRAINT "DLYLOG_R02" FOREIGN KEY ("OUTTM2_SEQNO")
	  REFERENCES "PIBICSDM2"."TM2" ("TM2_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."DLYLOG" ADD FOREIGN KEY ("OUTCONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."DLYLOG" ADD FOREIGN KEY ("OUTCONVNATIONCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."DLYLOG" ADD FOREIGN KEY ("NATIONCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DLYLOG_PK" ON "PIBICSDM2"."DLYLOG" ("DLYLOG_SEQNO") 
  ;