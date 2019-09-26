CREATE TABLE "PIBICSDM2"."RFC_TM2" 
   (	"TM2_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"CARDTYPE" CHAR(1 CHAR), 
	"CONVEYANCENAME" VARCHAR2(100 CHAR), 
	"REGISTRATIONNO" VARCHAR2(50 CHAR), 
	"OWNERCONVEYANCE" VARCHAR2(200 CHAR), 
	"FLIGHTNO" VARCHAR2(20 CHAR), 
	"DATEIO" TIMESTAMP (6), 
	"COUNTRYSEQNO" NUMBER, 
	"PORTNAME" VARCHAR2(250 CHAR), 
	"GATE" VARCHAR2(50 CHAR), 
	"SUMJOINING" NUMBER, 
	"SUMTRANSFER" NUMBER, 
	"SUMTRANSIT" NUMBER, 
	"SUMCREW" NUMBER, 
	"LOGSAPI_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"KEYSEQNO" NUMBER, 
	"STATUS_DOC" CHAR(1 CHAR), 
	"STA_ETA" TIMESTAMP (6), 
	"STD_ETD" TIMESTAMP (6), 
	"FLAG_CALL" CHAR(1 CHAR), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."RFC_TM2" ADD CONSTRAINT "RFC_TM2_PK" PRIMARY KEY ("TM2_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RFC_TM2_PK" ON "PIBICSDM2"."RFC_TM2" ("TM2_SEQNO") 
  ;
