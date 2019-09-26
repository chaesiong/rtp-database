CREATE TABLE "PIBICSDM2"."EXT_PRO_221" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"P_POSITION" VARCHAR2(100 CHAR), 
	"ORGNIZATION" VARCHAR2(100 CHAR), 
	"ALIEN_DETAIL" VARCHAR2(1500 CHAR), 
	"FACT_1" CHAR(1 CHAR), 
	"FACT_1_1" CHAR(1 CHAR), 
	"FACT_1_2" CHAR(1 CHAR), 
	"FACT_1_3" CHAR(1 CHAR), 
	"FACT_1_4" CHAR(1 CHAR), 
	"FACT_1_5" CHAR(1 CHAR), 
	"FACT_1_6" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"COMMAND_FROM" VARCHAR2(150 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_221" ADD CONSTRAINT "EXT_PRO_221_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_221" ADD CONSTRAINT "EXT_PRO_221_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_221_PK" ON "PIBICSDM2"."EXT_PRO_221" ("PRO_SEQNO") 
  ;
