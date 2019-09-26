CREATE TABLE "PIBICSDM2"."MATCHTRAVELONE" 
   (	"MATCHSEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(20 CHAR), 
	"INTDTNO" VARCHAR2(20 CHAR), 
	"INTM6NO" VARCHAR2(7 CHAR), 
	"INDTE" VARCHAR2(30 CHAR), 
	"INVISA" VARCHAR2(100 CHAR), 
	"INVISAEXPDTE" VARCHAR2(20 CHAR), 
	"INDTESORT" DATE, 
	"INCONVEYANCE" VARCHAR2(100 CHAR), 
	"INCONVREGNO" VARCHAR2(100 CHAR), 
	"INDEPTCD" CHAR(5 CHAR), 
	"INDEPTTNM" VARCHAR2(500 CHAR), 
	"OUTTDTNO" VARCHAR2(20 CHAR), 
	"OUTTM6NO" VARCHAR2(20 CHAR), 
	"OUTDTE" VARCHAR2(30 CHAR), 
	"OUTDTESORT" DATE, 
	"OUTCONVEYANCE" VARCHAR2(100 CHAR), 
	"OUTCONVREGNO" VARCHAR2(100 CHAR), 
	"OUTDEPTCD" CHAR(5 CHAR), 
	"OUTDEPTTNM" VARCHAR2(500 CHAR), 
	"NATIONCD" VARCHAR2(5 CHAR), 
	"AMOUNT" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."MATCHTRAVELONE" ADD CONSTRAINT "MATCHTRAVELONE_PK" PRIMARY KEY ("MATCHSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."MATCHTRAVELONE_PK" ON "PIBICSDM2"."MATCHTRAVELONE" ("MATCHSEQNO") 
  ;
