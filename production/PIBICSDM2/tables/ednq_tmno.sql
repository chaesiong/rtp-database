CREATE TABLE "PIBICSDM2"."EDNQ_TMNO" 
   (	"TMNO_SEQNO" NUMBER, 
	"TMNO_RUNNING" NUMBER, 
	"TMNO_YEAR" CHAR(4 CHAR), 
	"CREATE_BY" VARCHAR2(60 CHAR), 
	"CREATE_DATE" DATE, 
	"UPDATE_BY" VARCHAR2(60 CHAR), 
	"UPDATE_DATE" DATE, 
	"VERSION" NUMBER, 
	"EDNQTMTYPE" CHAR(4 CHAR), 
	"DEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EDNQ_TMNO" ADD CONSTRAINT "EDNQ_TM13NO_PK" PRIMARY KEY ("TMNO_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EDNQ_TM13NO_PK" ON "PIBICSDM2"."EDNQ_TMNO" ("TMNO_SEQNO") 
  ;