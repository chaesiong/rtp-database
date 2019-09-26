CREATE TABLE "PIBICSDM2"."PERMITTYPE" 
   (	"PERMIT_SEQNO" NUMBER, 
	"PERMITCD" CHAR(4 CHAR), 
	"PERMITNM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."PERMITTYPE" ADD CONSTRAINT "PERMITTYPE_PK" PRIMARY KEY ("PERMIT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."PERMITTYPE" ADD CONSTRAINT "PERMITTYPE_U01" UNIQUE ("PERMITCD")
  USING INDEX (CREATE UNIQUE INDEX "PIBICSDM2"."PERMITCD_PK" ON "PIBICSDM2"."PERMITTYPE" ("PERMITCD") 
  )  ENABLE;
  ALTER TABLE "PIBICSDM2"."PERMITTYPE" ADD CONSTRAINT "PERMITTYPE_U02" UNIQUE ("PERMITNM")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."PERMITCD_PK" ON "PIBICSDM2"."PERMITTYPE" ("PERMITCD") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."PERMITTYPE_PK" ON "PIBICSDM2"."PERMITTYPE" ("PERMIT_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."PERMITTYPE_U02" ON "PIBICSDM2"."PERMITTYPE" ("PERMITNM") 
  ;
