CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_POLICORGANIZE" 
   (	"ORG_SEQNO" NUMBER, 
	"ORGCD" CHAR(4 CHAR), 
	"ORGNM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"EXTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_POLICORGANIZE" ADD CONSTRAINT "TMP_SYNC_MAS_POLICORGANIZE_PK" PRIMARY KEY ("ORG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_POLICORGANIZE_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_POLICORGANIZE" ("ORG_SEQNO") 
  ;
