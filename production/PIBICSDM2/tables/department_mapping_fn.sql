CREATE TABLE "PIBICSDM2"."DEPARTMENT_MAPPING_FN" 
   (	"SEQ_ORA" NUMBER, 
	"SEQ_SQLSERVER" NUMBER, 
	"NAME_SQLSERVER" VARCHAR2(200 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."DEPARTMENT_MAPPING_FN_PK" ON "PIBICSDM2"."DEPARTMENT_MAPPING_FN" ("SEQ_SQLSERVER") 
  ;
