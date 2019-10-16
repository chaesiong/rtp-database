CREATE TABLE "PIBICSDM2"."COUNTRY_MAPPING_FN" 
   (	"SEQNO_ORA" NUMBER, 
	"CD_ORA" VARCHAR2(5 CHAR), 
	"SEQNO_SQLSERVER" NUMBER, 
	"CD_SQLSERVER" VARCHAR2(5 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."COUNTRY_MAPPING_PK" ON "PIBICSDM2"."COUNTRY_MAPPING_FN" ("SEQNO_SQLSERVER") 
  ;