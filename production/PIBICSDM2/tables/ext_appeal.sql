CREATE TABLE "PIBICSDM2"."EXT_APPEAL" 
   (	"APPL_SEQNO" NUMBER, 
	"WRITE_AT" VARCHAR2(100 CHAR), 
	"WRITE_DATE" DATE, 
	"FIRSTNM" VARCHAR2(150 CHAR), 
	"FAMILYNM" VARCHAR2(150 CHAR), 
	"MIDDLENM" VARCHAR2(150 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"AGE" NUMBER, 
	"NATION_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORTISSUE" VARCHAR2(100 CHAR), 
	"PASSPORTISSUEDTE" DATE, 
	"PASSPORTEXPDTE" DATE, 
	"VISATYPE_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"FROM_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"INDTE" DATE, 
	"TM6NO" VARCHAR2(7 CHAR), 
	"REASON" VARCHAR2(1000 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"FIRSTNM_WRITE" VARCHAR2(150 CHAR), 
	"FAMILYNM_WRITE" VARCHAR2(150 CHAR), 
	"MIDDLENM_WRITE" VARCHAR2(150 CHAR), 
	"ADDR" VARCHAR2(100 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(20 CHAR), 
	"SUFFIX_SEQNO" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"CANCEL_SEQNO" NUMBER, 
	"APPEAL_FLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" DATE, 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" DATE, 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"REASON_PROVE" VARCHAR2(1000 CHAR), 
	"FEES_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_PK" PRIMARY KEY ("APPL_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R12" FOREIGN KEY ("FEES_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FEES" ("FEES_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R09" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R02" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R07" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R03" FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R01" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R04" FOREIGN KEY ("FROM_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R11" FOREIGN KEY ("CANCEL_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_CANCEL" ("CANCEL_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_APPEAL" ADD CONSTRAINT "EXT_APPEAL_R08" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_APPEAL_PK" ON "PIBICSDM2"."EXT_APPEAL" ("APPL_SEQNO") 
  ;