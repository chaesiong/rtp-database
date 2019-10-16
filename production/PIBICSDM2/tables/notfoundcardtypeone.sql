CREATE TABLE "PIBICSDM2"."NOTFOUNDCARDTYPEONE" 
   (	"SEQNO" NUMBER, 
	"USERID" VARCHAR2(20 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"PASSPORTNO" VARCHAR2(60 CHAR), 
	"TM6NO" VARCHAR2(7 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"USERSTAFF" VARCHAR2(20 CHAR), 
	"ACTION" CHAR(1 CHAR), 
	"MATCHDATE" DATE, 
	"REMARK" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."NOTFOUNDCARDTYPEONE" ADD CONSTRAINT "NOTFOUNDCARDTYPEONE_PK" PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."NOTFOUNDCARDTYPEONE_PK" ON "PIBICSDM2"."NOTFOUNDCARDTYPEONE" ("SEQNO") 
  ;