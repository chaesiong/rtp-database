CREATE TABLE "PIBICSDM2"."TRAIN_COSRUNNO" 
   (	"COSRUNNO_SEQNO" NUMBER, 
	"COSRUNNO_CODE" CHAR(4 CHAR), 
	"COSRUNNO_YEAR" CHAR(4 CHAR), 
	"CREATE_BY" VARCHAR2(60 CHAR), 
	"CREATE_DATE" DATE, 
	"UPDATE_BY" VARCHAR2(60 CHAR), 
	"UPDATE_DATE" DATE, 
	"VERSION" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_COSRUNNO_PK" ON "PIBICSDM2"."TRAIN_COSRUNNO" ("COSRUNNO_SEQNO") 
  ;
