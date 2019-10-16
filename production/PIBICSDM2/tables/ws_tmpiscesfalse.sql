CREATE TABLE "PIBICSDM2"."WS_TMPISCESFALSE" 
   (	"TMPISCESFALSE_SEQNO" VARCHAR2(100 CHAR), 
	"SEQUENCENO" VARCHAR2(100 CHAR), 
	"SENDDATETIME" VARCHAR2(100 CHAR), 
	"MSGVERSION" VARCHAR2(1 CHAR), 
	"CARDTYPE" VARCHAR2(1 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR), 
	"PORT" CHAR(3 CHAR), 
	"TRAVELDATE" VARCHAR2(100 CHAR), 
	"NATIONCD" VARCHAR2(20 CHAR), 
	"CONVTYPE" VARCHAR2(20 CHAR), 
	"TFIRSTNAME" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNAME" VARCHAR2(60 CHAR), 
	"EFIRSTNAME" VARCHAR2(60 CHAR), 
	"EMIDDLENAME" VARCHAR2(60 CHAR), 
	"EFAMILYNAME" VARCHAR2(60 CHAR), 
	"SEX" CHAR(10 CHAR), 
	"BIRTHDATE" VARCHAR2(20 CHAR), 
	"PASSPORTNO" VARCHAR2(100 CHAR), 
	"VISATYPECD" VARCHAR2(20 CHAR), 
	"INDCWL" VARCHAR2(20 CHAR), 
	"CWLRECORDNO" VARCHAR2(7 CHAR), 
	"VERIFYFLAG" CHAR(1 CHAR), 
	"ISSUCCESS" CHAR(1 CHAR), 
	"ERRORDESC" VARCHAR2(2000 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"PERSONIMAGE" CLOB, 
	"PASSPORTIMAGE" CLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."WS_TMPISCESFALSE" ADD CONSTRAINT "WS_TMPISCESFALSE_R01" PRIMARY KEY ("TMPISCESFALSE_SEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."WS_CREATE_DATE_IDX" ON "PIBICSDM2"."WS_TMPISCESFALSE" (TO_CHAR("CREATE_DATE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."WS_SENDATETIME_IDX" ON "PIBICSDM2"."WS_TMPISCESFALSE" ("SENDDATETIME") 
  ;
  ;
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."WS_TMPISCESFALSE_R01" ON "PIBICSDM2"."WS_TMPISCESFALSE" ("TMPISCESFALSE_SEQNO") 
  ;