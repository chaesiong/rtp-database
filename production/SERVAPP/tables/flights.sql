CREATE TABLE "SERVAPP"."FLIGHTS" 
   (	"FLGHTID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"FLIGHTNUM" VARCHAR2(20 CHAR), 
	"ORIGINAIRPORTID" NUMBER(10,0), 
	"DESTINAIRPORTID" NUMBER(10,0), 
	"TIMEDEPARTURE" DATE, 
	"TIMEARRIVAL" DATE, 
	"ACTIVE" NUMBER(1,0) DEFAULT ON NULL 1 NOT NULL ENABLE, 
	"DIRECTIONFLG" NUMBER(1,0), 
	"PAIREDFLGHTID" VARCHAR2(32 CHAR), 
	"AGENTID" NUMBER(4,0), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR), 
	"INS_BORDERPOST" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."FLIGHTS" ADD CONSTRAINT "FLIGHTS_PK" PRIMARY KEY ("FLGHTID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."FLIGHTS_PK" ON "SERVAPP"."FLIGHTS" ("FLGHTID") 
  ;