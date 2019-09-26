CREATE TABLE "PIBICSDM2"."TRAIN_INSTRUCTOR_LOG" 
   (	"INS_SEQNO" NUMBER, 
	"INS_FIRSTNAME" VARCHAR2(60 CHAR), 
	"INS_LASTNAME" VARCHAR2(60 CHAR), 
	"INS_FAXNO" VARCHAR2(20 CHAR), 
	"INS_PLACENO" VARCHAR2(10 CHAR), 
	"INS_PLACERD" VARCHAR2(30 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"INS_POSTCODE" VARCHAR2(5 CHAR), 
	"INS_PHONENO" VARCHAR2(20 CHAR), 
	"INS_MOBILENO" VARCHAR2(20 CHAR), 
	"INS_WORKPLACE" VARCHAR2(59 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"INS_PREFIX" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"INSLOG_SEQNO" NUMBER, 
	"INSLOG_DATE" TIMESTAMP (6), 
	"INSLOG_FLAG" CHAR(1 CHAR), 
	"INSLOG_USRUPD" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_INSTRUCTOR_LOG" ADD CONSTRAINT "TRAIN_INSTRUCTOR_LOG_PK" PRIMARY KEY ("INSLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_INSTRUCTOR_LOG" ADD CONSTRAINT "TRAIN_INSTRUCTOR_LOG_R02" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_INSTRUCTOR_LOG" ADD CONSTRAINT "TRAIN_INSTRUCTOR_LOG_R03" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_INSTRUCTOR_LOG" ADD CONSTRAINT "TRAIN_INSTRUCTOR_LOG_R01" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_INSTRUCTOR_LOG_PK" ON "PIBICSDM2"."TRAIN_INSTRUCTOR_LOG" ("INSLOG_SEQNO") 
  ;
