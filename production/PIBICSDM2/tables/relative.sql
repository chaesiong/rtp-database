CREATE TABLE "PIBICSDM2"."RELATIVE" 
   (	"RLT_SEQNO" NUMBER, 
	"RLT_RELATETYPE" VARCHAR2(60 CHAR), 
	"RLT_REMARK" VARCHAR2(200 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RELATIVE" ADD CONSTRAINT "RELATIVE_PK" PRIMARY KEY ("RLT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RELATIVE" ADD CONSTRAINT "RELATIVE_U01" UNIQUE ("RLT_RELATETYPE")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RELATIVE_PK" ON "PIBICSDM2"."RELATIVE" ("RLT_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."RELATIVE_U01" ON "PIBICSDM2"."RELATIVE" ("RLT_RELATETYPE") 
  ;