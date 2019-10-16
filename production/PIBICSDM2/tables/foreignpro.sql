CREATE TABLE "PIBICSDM2"."FOREIGNPRO" 
   (	"FOREIGN_SEQNO" NUMBER, 
	"DPT_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"NOTE" VARCHAR2(250 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."FOREIGNPRO_PK" ON "PIBICSDM2"."FOREIGNPRO" ("FOREIGN_SEQNO") 
  ;