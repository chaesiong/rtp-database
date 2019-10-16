CREATE TABLE "PIBICSDM2"."EXT_PRO_230" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"LOCATION" VARCHAR2(1000 CHAR), 
	"INCOME_PERSON" NUMBER(15,2), 
	"CONTRACT_DATE" DATE, 
	"CONTRACT" VARCHAR2(300 CHAR), 
	"OTHER" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_230" ADD CONSTRAINT "EXT_PRO_230_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_230" ADD CONSTRAINT "EXT_PRO_230_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_230_PK" ON "PIBICSDM2"."EXT_PRO_230" ("PRO_SEQNO") 
  ;