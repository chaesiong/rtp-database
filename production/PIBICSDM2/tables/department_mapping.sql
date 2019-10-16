CREATE TABLE "PIBICSDM2"."DEPARTMENT_MAPPING" 
   (	"SEQNO" NUMBER, 
	"DEPT_SEQNO_C" NUMBER, 
	"DEPTCD_O" VARCHAR2(5 CHAR)
   ) ;
  CREATE INDEX "PIBICSDM2"."IDX_DEPTCDO" ON "PIBICSDM2"."DEPARTMENT_MAPPING" ("DEPTCD_O") 
  ;