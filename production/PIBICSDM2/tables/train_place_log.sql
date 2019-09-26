CREATE TABLE "PIBICSDM2"."TRAIN_PLACE_LOG" 
   (	"PLACE_SEQNO" NUMBER, 
	"PLACE_NAME" VARCHAR2(60 CHAR), 
	"PLACE_NUMBER" VARCHAR2(10 CHAR), 
	"PLACE_ROAD" VARCHAR2(30 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"PLACE_POSTCODE" VARCHAR2(5 CHAR), 
	"PLACE_CONTACTNAME" VARCHAR2(30 CHAR), 
	"PLACE_PHONENO" VARCHAR2(20 CHAR), 
	"PLACE_FAXNO" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"PLACE_CONTACTNO" VARCHAR2(30 CHAR), 
	"PLACELOG_SEQNO" NUMBER, 
	"PLACELOG_DATE" TIMESTAMP (6), 
	"PLACELOG_FLAG" CHAR(1 CHAR), 
	"PLACELOG_USRUPD" VARCHAR2(20 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PLACE_CONTACTEMAIL" VARCHAR2(40 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_PLACE_LOG" ADD CONSTRAINT "TRAIN_PLACE_LOG_PK" PRIMARY KEY ("PLACELOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_PLACE_LOG" ADD CONSTRAINT "TRAIN_PLACE_LOG_R02" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_PLACE_LOG" ADD CONSTRAINT "TRAIN_PLACE_LOG_R01" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_PLACE_LOG" ADD CONSTRAINT "TRAIN_PLACE_LOG_R03" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_PLACE_LOG_PK" ON "PIBICSDM2"."TRAIN_PLACE_LOG" ("PLACELOG_SEQNO") 
  ;
