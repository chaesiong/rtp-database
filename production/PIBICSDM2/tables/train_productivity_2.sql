CREATE TABLE "PIBICSDM2"."TRAIN_PRODUCTIVITY_2" 
   (	"PRO_SEQNO" NUMBER, 
	"COURSE_SEQNO" NUMBER, 
	"PRO_ITEMNO" NUMBER, 
	"PRO_1_1_1" CHAR(1 CHAR), 
	"PRO_1_1_2" CHAR(1 CHAR), 
	"PRO_1_1_3" CHAR(1 CHAR), 
	"PRO_1_1_4" CHAR(1 CHAR), 
	"PRO_1_1_5" CHAR(1 CHAR), 
	"PRO_1_1_6" CHAR(1 CHAR), 
	"PRO_1_2_1" CHAR(1 CHAR), 
	"PRO_1_2_2" CHAR(1 CHAR), 
	"PRO_1_2_3" CHAR(1 CHAR), 
	"PRO_1_2_4" CHAR(1 CHAR), 
	"PRO_1_2_5" CHAR(1 CHAR), 
	"PRO_1_2_6" CHAR(1 CHAR), 
	"PRO_1_2_7" CHAR(1 CHAR), 
	"PRO_1_2_8" CHAR(1 CHAR), 
	"PRO_1_2_9" CHAR(1 CHAR), 
	"PRO_1_3_1" CHAR(1 CHAR), 
	"PRO_1_3_2" CHAR(1 CHAR), 
	"PRO_1_3_3" CHAR(1 CHAR), 
	"PRO_1_3_4" CHAR(1 CHAR), 
	"PRO_1_3_5" CHAR(1 CHAR), 
	"PRO_1_3_6" CHAR(1 CHAR), 
	"PRO_1_3_7" CHAR(1 CHAR), 
	"PRO_2_1_1" VARCHAR2(2000 CHAR), 
	"PRO_2_1_2" VARCHAR2(2000 CHAR), 
	"PRO_2_1_3" VARCHAR2(2000 CHAR), 
	"PRO_2_2_1" VARCHAR2(2000 CHAR), 
	"PRO_2_2_2" VARCHAR2(2000 CHAR), 
	"PRO_2_2_3" VARCHAR2(2000 CHAR), 
	"PRO_4_REMARK" CLOB, 
	"VERSION" NUMBER, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_PRODUCTIVITY_2" ADD CONSTRAINT "TRAIN_PRODUCTIVITY_2_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_PRODUCTIVITY_2" ADD CONSTRAINT "TRAIN_PRODUCTIVITY_2_R01" FOREIGN KEY ("COURSE_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_COURSE" ("COURSE_SEQNO") ENABLE;
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_PK" ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2" ("PRO_SEQNO") 
  ;
