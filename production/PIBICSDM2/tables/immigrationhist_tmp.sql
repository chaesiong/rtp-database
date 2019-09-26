CREATE TABLE "PIBICSDM2"."IMMIGRATIONHIST_TMP" 
   (	"IMMHISTSEQNO" VARCHAR2(20 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR), 
	"INOUTDTE" DATE, 
	"CARDTYPE" CHAR(1 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"TDTNO" VARCHAR2(20 CHAR), 
	"PASSPORTDTE" DATE, 
	"PASSPORTEXPDTE" DATE, 
	"VISATYPECD" CHAR(4 CHAR), 
	"VISAEXPDTE" DATE, 
	"DEPTCD" CHAR(5 CHAR), 
	"IMGPASS" BLOB, 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"COUNT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."IMMIGRATIONHIST_TMP" ADD CONSTRAINT "TIMMIGRATIONHIST_PK" PRIMARY KEY ("IMMHISTSEQNO")
  USING INDEX (CREATE INDEX "PIBICSDM2"."TPK_IMMIGRATIONHIST" ON "PIBICSDM2"."IMMIGRATIONHIST_TMP" ("IMMHISTSEQNO", "PERSONID") 
  )  ENABLE;
  CREATE INDEX "PIBICSDM2"."TIMMHIST_TMP_PERSONID_IDX" ON "PIBICSDM2"."IMMIGRATIONHIST_TMP" ("PERSONID") 
  ;
CREATE INDEX "PIBICSDM2"."TPK_IMMIGRATIONHIST" ON "PIBICSDM2"."IMMIGRATIONHIST_TMP" ("IMMHISTSEQNO", "PERSONID") 
  ;
  ;
