CREATE TABLE "PIBICSDM2"."RQS_APPLYTYPE" 
   (	"APPLYTYPE_SEQNO" NUMBER, 
	"APPLYTYPECD" CHAR(2 CHAR), 
	"APPLYTYPENM" VARCHAR2(200 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_APPLYTYPE" ADD CONSTRAINT "RQS_APPLYTYPE_PK" PRIMARY KEY ("APPLYTYPE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_APPLYTYPE_PK" ON "PIBICSDM2"."RQS_APPLYTYPE" ("APPLYTYPE_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."RQS_APPLYTYPE_U02" ON "PIBICSDM2"."RQS_APPLYTYPE" ("APPLYTYPECD") 
  ;