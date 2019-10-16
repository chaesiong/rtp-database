CREATE TABLE "PIBICSDM2"."REASONDPT" 
   (	"REASONDPT_SEQNO" NUMBER, 
	"REASONDPTNM" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"REASONCD" VARCHAR2(2 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."REASONDPT" ADD CONSTRAINT "REASONDPT_PK" PRIMARY KEY ("REASONDPT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."REASONDPT" ADD CONSTRAINT "REASONDPT_U01" UNIQUE ("REASONDPTNM")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."REASONDPT_PK" ON "PIBICSDM2"."REASONDPT" ("REASONDPT_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."REASONDPT_U01" ON "PIBICSDM2"."REASONDPT" ("REASONDPTNM") 
  ;