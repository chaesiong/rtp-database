CREATE TABLE "PIBICSDM2"."LOSTPASSPORTHIST" 
   (	"LPPCD" VARCHAR2(20 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"CITIZENID" CHAR(13 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"ISUPASSPORTDTE" DATE, 
	"ISUPASSPORTPLACE" CHAR(3 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"PASSPORTTYPE" CHAR(4 CHAR), 
	"LOSTPASSPORTDTE" DATE, 
	"LOSTPASSPORTPLACE" CHAR(3 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"REMARK" VARCHAR2(800 CHAR), 
	"CREUSR" VARCHAR2(30 CHAR), 
	"CREDTE" DATE, 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"NEWPASSPORTNO" VARCHAR2(12 CHAR), 
	"NEWPASSPORTTYPE" CHAR(4 CHAR), 
	"NEWISUPASSPORTDTE" DATE, 
	"NEWISUPASSPORTPLACE" CHAR(3 CHAR), 
	"NEWPASSPORTEXPDTE" DATE, 
	"INFORMPASSPORTDTE" DATE, 
	"OWNERAGE" CHAR(4 CHAR), 
	"AGCPHONE" VARCHAR2(60 CHAR), 
	"EMGCONT" VARCHAR2(200 CHAR), 
	"DOCREF" VARCHAR2(100 CHAR), 
	"SECLEV" VARCHAR2(2 CHAR), 
	"REASONCD" CHAR(4 CHAR), 
	"AGCCONT" VARCHAR2(200 CHAR), 
	"TDCD" CHAR(4 CHAR), 
	"OPERREF" CHAR(2 CHAR), 
	"LPPERSON" VARCHAR2(20 CHAR), 
	"TDT_SEQNO" NUMBER, 
	"POLISSTATION" VARCHAR2(200 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"VISAEXPDTE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."LOSTPASSPORTHIST" ADD CONSTRAINT "LOSTPASSPORTHIST_PK" PRIMARY KEY ("LPPCD")
  USING INDEX (CREATE UNIQUE INDEX "PIBICSDM2"."PK_LOSTPASSPORTHIST" ON "PIBICSDM2"."LOSTPASSPORTHIST" ("LPPCD") 
  )  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."LOSTPASSPORT_PKHIST" ON "PIBICSDM2"."LOSTPASSPORTHIST" ("LPPCD", "NATIONCD", "PASSPORTNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."PK_LOSTPASSPORTHIST" ON "PIBICSDM2"."LOSTPASSPORTHIST" ("LPPCD") 
  ;