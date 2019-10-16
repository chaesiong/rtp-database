CREATE TABLE "PIBICSDM2"."REPS_TM8RUNNING" 
   (	"TM8RUNNING_SEQNO" NUMBER, 
	"TM8NO" NUMBER, 
	"YEAR" VARCHAR2(4 CHAR), 
	"ZONE" VARCHAR2(12 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" DATE, 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" DATE, 
	"VERSION" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."REPS_TM8RUNNING_PK" ON "PIBICSDM2"."REPS_TM8RUNNING" ("TM8RUNNING_SEQNO") 
  ;