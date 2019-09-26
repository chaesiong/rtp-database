CREATE TABLE "PIBICSDM2"."WF_APARTMENT" 
   (	"APT_SEQNO" NUMBER, 
	"APT_ROOMNO" VARCHAR2(5 CHAR), 
	"APT_WATER_METERNO" VARCHAR2(20 CHAR), 
	"APT_REMARK" VARCHAR2(500 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"BD_ID" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_APARTMENT" ADD CONSTRAINT "WF_APARTMENT_PK" PRIMARY KEY ("APT_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_APARTMENT_PK" ON "PIBICSDM2"."WF_APARTMENT" ("APT_SEQNO") 
  ;
