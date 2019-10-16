CREATE TABLE "PIBICSDM2"."STATISTICNATIONPIBICS" 
   (	"COUNT_SEQNO" NUMBER, 
	"COUNTCD" CHAR(3 CHAR), 
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
  ALTER TABLE "PIBICSDM2"."STATISTICNATIONPIBICS" ADD CONSTRAINT "STATISTICNATIONPIBICS_PK" PRIMARY KEY ("COUNT_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."STATISTICNATIONPIBICS_PK" ON "PIBICSDM2"."STATISTICNATIONPIBICS" ("COUNT_SEQNO") 
  ;