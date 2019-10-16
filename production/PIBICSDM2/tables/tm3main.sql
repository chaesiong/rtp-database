CREATE TABLE "PIBICSDM2"."TM3MAIN" 
   (	"TM3MAIN_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"TM3_SEQNO" NUMBER, 
	"INTM6NO" VARCHAR2(20 CHAR), 
	"OUTTM6NO" VARCHAR2(20 CHAR), 
	"INDTE" DATE, 
	"OUTDTE" DATE, 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" NUMBER, 
	"TDTNO" VARCHAR2(20 CHAR), 
	"PASSPORTDTE" DATE, 
	"PASSPORTISU" VARCHAR2(60 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"TM2IN_SEQNO" NUMBER, 
	"TM2OUT_SEQNO" NUMBER, 
	"TRNSSTS" CHAR(1 CHAR), 
	"INCONVREGNO" VARCHAR2(20 CHAR), 
	"OUTCONVREGNO" VARCHAR2(20 CHAR), 
	"PERSONSTS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1
   ) ;
  ALTER TABLE "PIBICSDM2"."TM3MAIN" ADD PRIMARY KEY ("TM3MAIN_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TM3MAIN" ADD FOREIGN KEY ("NATIONCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TM3MAIN" ADD FOREIGN KEY ("TM3_SEQNO")
	  REFERENCES "PIBICSDM2"."TM3" ("TM3_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."MASTER_TM3MAIN_IDX" ON "PIBICSDM2"."TM3MAIN" ("EFAMILYNM", "EFIRSTNM", "SEX", "BIRTHDTE", "EMIDDLENM") 
  ;
  ;