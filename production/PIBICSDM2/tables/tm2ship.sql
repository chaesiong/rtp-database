CREATE TABLE "PIBICSDM2"."TM2SHIP" 
   (	"TM2SHIP_SEQNO" NUMBER, 
	"TM2_SEQNO" NUMBER, 
	"REGTONNAGE" NUMBER, 
	"SHIPTYPE" VARCHAR2(250 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1
   ) ;
  ALTER TABLE "PIBICSDM2"."TM2SHIP" ADD CONSTRAINT "TM2CAR_PK" PRIMARY KEY ("TM2SHIP_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TM2CAR_PK" ON "PIBICSDM2"."TM2SHIP" ("TM2SHIP_SEQNO") 
  ;