CREATE TABLE "PIBICSDM2"."OT_RATE" 
   (	"OTRATESEQNO" NUMBER, 
	"POSLEVEL_SEQNO" NUMBER, 
	"OTRATE" NUMBER(3,2), 
	"ACTFLAG" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_RATE" ADD CONSTRAINT "OT_RATE_PK" PRIMARY KEY ("OTRATESEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_RATE" ADD CONSTRAINT "OT_RATE_U01" UNIQUE ("POSLEVEL_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_RATE" ADD CONSTRAINT "OT_RATE_R01" FOREIGN KEY ("POSLEVEL_SEQNO")
	  REFERENCES "PIBICSDM2"."POSLEVEL" ("POSLEVEL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_RATE_PK" ON "PIBICSDM2"."OT_RATE" ("OTRATESEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."OT_RATE_U01" ON "PIBICSDM2"."OT_RATE" ("POSLEVEL_SEQNO") 
  ;