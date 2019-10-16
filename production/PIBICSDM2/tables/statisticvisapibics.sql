CREATE TABLE "PIBICSDM2"."STATISTICVISAPIBICS" 
   (	"VISATYPE_SEQNO" NUMBER, 
	"VISATYPECD" CHAR(4 CHAR), 
	"JAN" NUMBER, 
	"FEB" NUMBER, 
	"MAR" NUMBER, 
	"APR" NUMBER, 
	"MAY" NUMBER, 
	"JUN" NUMBER, 
	"JUL" NUMBER, 
	"AUG" NUMBER, 
	"SEP" NUMBER, 
	"OCT" NUMBER, 
	"NOV" NUMBER, 
	"DEC" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."STATISTICVISAPIBICS" ADD CONSTRAINT "STATISTICVISAPIBICS_PK" PRIMARY KEY ("VISATYPE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."STATISTICVISAPIBICS_PK" ON "PIBICSDM2"."STATISTICVISAPIBICS" ("VISATYPE_SEQNO") 
  ;