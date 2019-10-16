CREATE TABLE "PIBICSDM2"."TRAIN_EVA_INS_2_LOG" 
   (	"EVAI_SEQNO" NUMBER, 
	"EVA_SEQNO" NUMBER, 
	"INS_SEQNO" NUMBER, 
	"EVA_2_3_1_1" CHAR(1 CHAR), 
	"EVA_2_3_1_1_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_1_2" CHAR(1 CHAR), 
	"EVA_2_3_1_2_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2_1" CHAR(1 CHAR), 
	"EVA_2_3_2_1_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2_2" CHAR(1 CHAR), 
	"EVA_2_3_2_2_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2_3" CHAR(1 CHAR), 
	"EVA_2_3_2_3_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2_4" CHAR(1 CHAR), 
	"EVA_2_3_2_4_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2_5" CHAR(1 CHAR), 
	"EVA_2_3_2_5_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2_6" CHAR(1 CHAR), 
	"EVA_2_3_2_6_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2_7" CHAR(1 CHAR), 
	"EVA_2_3_2_7_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2_8" CHAR(1 CHAR), 
	"EVA_2_3_2_8_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_3_1" CHAR(1 CHAR), 
	"EVA_2_3_3_1_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_3_2" CHAR(1 CHAR), 
	"EVA_2_3_3_2_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_4_1" CHAR(1 CHAR), 
	"EVA_2_3_4_1_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_4_2" CHAR(1 CHAR), 
	"EVA_2_3_4_2_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_5" CHAR(1 CHAR), 
	"EVA_2_3_5_REMARK" VARCHAR2(100 CHAR), 
	"VERSION" NUMBER, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"LOG_SEQNO" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"EVALOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_EVA_INS_2_LOG" ADD CONSTRAINT "TRAIN_EVA_INS_2_LOG_PK" PRIMARY KEY ("LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_EVA_INS_2_LOG" ADD CONSTRAINT "TRAIN_EVA_INS_2_LOG_R01" FOREIGN KEY ("EVALOG_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_EVALUATION_2_LOG" ("LOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_EVA_INS_2_LOG_PK" ON "PIBICSDM2"."TRAIN_EVA_INS_2_LOG" ("LOG_SEQNO") 
  ;