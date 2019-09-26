CREATE TABLE "PIBICSDM2"."TM6_TRAVEL" 
   (	"TRAV_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"IODTE" DATE, 
	"CONVCD" CHAR(4 CHAR), 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TM6_TRAVEL" ADD CONSTRAINT "TM6_TRAVEL_PK" PRIMARY KEY ("TRAV_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TM6_TRAVEL_PK" ON "PIBICSDM2"."TM6_TRAVEL" ("TRAV_SEQNO") 
  ;
