CREATE TABLE "PIBICSDM2"."SUFFIX" 
   (	"SUFFIX_SEQNO" NUMBER, 
	"SUFFIX_DESC" VARCHAR2(50 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"SUFFIX_TYPE" CHAR(1 CHAR), 
	"SUFFIXORDER" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."SUFFIX" ADD CONSTRAINT "SUFFIX_PK" PRIMARY KEY ("SUFFIX_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SUFFIX_PK" ON "PIBICSDM2"."SUFFIX" ("SUFFIX_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SUFFIX_U01" ON "PIBICSDM2"."SUFFIX" ("SUFFIX_DESC") 
  ;