CREATE TABLE "PIBICSDM2"."PLACE_PERMITTYPE" 
   (	"PP_SEQNO" NUMBER, 
	"PP_PERMITNAME" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"PP_PERMITCODE" VARCHAR2(5 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."PLACE_PERMITTYPE" ADD CONSTRAINT "PLACE_PERMITTYPE_PK" PRIMARY KEY ("PP_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."PLACE_PERMITTYPE" ADD CONSTRAINT "PLACE_PERMITTYPE_U01" UNIQUE ("PP_PERMITCODE")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."PLACE_PERMITTYPE" ADD CONSTRAINT "PLACE_PERMITTYPE_U02" UNIQUE ("PP_PERMITNAME")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."PLACE_PERMITTYPE_PK" ON "PIBICSDM2"."PLACE_PERMITTYPE" ("PP_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."PLACE_PERMITTYPE_U01" ON "PIBICSDM2"."PLACE_PERMITTYPE" ("PP_PERMITCODE") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."PLACE_PERMITTYPE_U02" ON "PIBICSDM2"."PLACE_PERMITTYPE" ("PP_PERMITNAME") 
  ;
