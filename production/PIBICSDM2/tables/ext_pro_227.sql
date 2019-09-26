CREATE TABLE "PIBICSDM2"."EXT_PRO_227" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"ALIEN_DETAIL" VARCHAR2(2000 CHAR), 
	"COMMAND_FROM" VARCHAR2(150 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FACT1" CHAR(1 CHAR), 
	"FACT2" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_227" ADD CONSTRAINT "EXT_PRO_227_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_227" ADD CONSTRAINT "EXT_PRO_227_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_227_PK" ON "PIBICSDM2"."EXT_PRO_227" ("PRO_SEQNO") 
  ;
