CREATE TABLE "PIBICSDM2"."STATISTICPIBICS_INOUTFN" 
   (	"DEPT_SEQNO" NUMBER, 
	"DEPTNAMELEVEL1" VARCHAR2(200 CHAR), 
	"DEPTNAMELEVEL2" VARCHAR2(200 CHAR), 
	"DEPTNAMELEVEL3" VARCHAR2(200 CHAR), 
	"RLC" NUMBER, 
	"DEPTLEVEL" NUMBER, 
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
	"DLD" NUMBER, 
	"DEPTSORT" NUMBER, 
	"OCT55" NUMBER, 
	"NOV55" NUMBER, 
	"DEC55" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."STATISTICPIBICS_INOUTFN" ADD CONSTRAINT "STATISTICPIBICS_INOUTFN_PK" PRIMARY KEY ("DEPT_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."STATISTICPIBICS_INOUTFN_PK" ON "PIBICSDM2"."STATISTICPIBICS_INOUTFN" ("DEPT_SEQNO") 
  ;
