CREATE TABLE "PIBICSDM2"."MAP_TAMBON" 
   (	"MTMB_SEQNO" NUMBER, 
	"MTMB_ENGNAME" VARCHAR2(500 CHAR), 
	"MTMB_THANAME" VARCHAR2(500 CHAR), 
	"MTMB_COORDINATE" CLOB, 
	"TMB_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"MAMP_CODE" NUMBER, 
	"MTMB_CODE" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."MAP_TAMBON_PK" ON "PIBICSDM2"."MAP_TAMBON" ("MTMB_SEQNO") 
  ;
  ;