CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18CHILD" 
   (	"TM18CHILD_SEQNO" NUMBER, 
	"TM18_SEQNO" NUMBER, 
	"FAMILYNM" VARCHAR2(60 CHAR), 
	"FIRSTNM" VARCHAR2(60 CHAR), 
	"MIDDLENM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18CHILD" ADD CONSTRAINT "TMP_SYNC_MAS_CRS_TM18CHILD_PK" PRIMARY KEY ("TM18CHILD_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18CHILD_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18CHILD" ("TM18CHILD_SEQNO") 
  ;
