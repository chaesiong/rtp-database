CREATE TABLE "PIBICSDM2"."CHNG_PERSON" 
   (	"CHNGPERSON_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"EFIRSTNM" VARCHAR2(50 CHAR), 
	"EFAMILYNM" VARCHAR2(50 CHAR), 
	"EMIDDLENM" VARCHAR2(50 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"CHANGEVISA_DATE" TIMESTAMP (6), 
	"VISATYPE_SEQNO" NUMBER, 
	"VISATEYPSUB_SEQNO" NUMBER, 
	"NATION_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"IN_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
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
	"TEL" VARCHAR2(50 CHAR), 
	"PASSPORT_EXPDATE" DATE, 
	"UDEPT_SEQNO" NUMBER, 
	"STATUSCHNG" CHAR(1 CHAR), 
	"STATUSCHNGDTE" DATE, 
	"STATUS" CHAR(1 CHAR), 
	"CHANGEVISALIST_SEQNO" NUMBER, 
	"FLAGUPDATE" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CHNG_PERSON" ADD CONSTRAINT "CHNG_PERSON_R01" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CHNG_PERSON" ADD CONSTRAINT "CHNG_PERSON_R03" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."CHNG_PERSON_ACTFLAG_IDX" ON "PIBICSDM2"."CHNG_PERSON" ("ACTFLAG") 
  ;
CREATE INDEX "PIBICSDM2"."CHNG_PERSON_NATIONSEQNO_IDX" ON "PIBICSDM2"."CHNG_PERSON" ("NATION_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."CHNG_PERSON_PASSPORTNO_IDX" ON "PIBICSDM2"."CHNG_PERSON" ("PASSPORTNO") 
  ;
CREATE INDEX "PIBICSDM2"."PASSPORTNO_INDATE_IDX" ON "PIBICSDM2"."CHNG_PERSON" ("PASSPORTNO", TO_CHAR("IN_DATE",'yyyymmdd')) 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."CHNG_PERSON_PK" ON "PIBICSDM2"."CHNG_PERSON" ("CHNGPERSON_SEQNO") 
  ;
