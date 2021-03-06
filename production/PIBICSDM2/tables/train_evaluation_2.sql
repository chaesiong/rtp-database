CREATE TABLE "PIBICSDM2"."TRAIN_EVALUATION_2" 
   (	"EVA_SEQNO" NUMBER, 
	"COURSE_SEQNO" NUMBER, 
	"EVA_ITEMNO" NUMBER, 
	"EVA_ORGANIZER" VARCHAR2(60 CHAR), 
	"EVA_EDUCATION" VARCHAR2(60 CHAR), 
	"POSLEVEL_SEQNO" NUMBER, 
	"EVA_2_1" CHAR(1 CHAR), 
	"EVA_2_2" CHAR(1 CHAR), 
	"EVA_2_4_1" CHAR(1 CHAR), 
	"EVA_2_4_1_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_2" CHAR(1 CHAR), 
	"EVA_2_4_2_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_3" CHAR(1 CHAR), 
	"EVA_2_4_3_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_4" CHAR(1 CHAR), 
	"EVA_2_4_4_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_5" CHAR(1 CHAR), 
	"EVA_2_4_5_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_6" CHAR(1 CHAR), 
	"EVA_2_4_6_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_7" CHAR(1 CHAR), 
	"EVA_2_4_7_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_8" CHAR(1 CHAR), 
	"EVA_2_4_8_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_9" CHAR(1 CHAR), 
	"EVA_2_4_9_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_10" CHAR(1 CHAR), 
	"EVA_2_4_10_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_11" CHAR(1 CHAR), 
	"EVA_2_4_11_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_12" CHAR(1 CHAR), 
	"EVA_2_4_12_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_13" CHAR(1 CHAR), 
	"EVA_2_4_13_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_14" CHAR(1 CHAR), 
	"EVA_2_4_14_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_4_15" CHAR(1 CHAR), 
	"EVA_2_4_15_REMARK" VARCHAR2(100 CHAR), 
	"EVA_3_1_REMARK" CLOB, 
	"EVA_3_2_REMARK" CLOB, 
	"VERSION" NUMBER, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_EVALUATION_2" ADD CONSTRAINT "TRAIN_EVALUATION_2_PK" PRIMARY KEY ("EVA_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_EVALUATION_2" ADD CONSTRAINT "TRAIN_EVALUATION_2_R01" FOREIGN KEY ("COURSE_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_COURSE" ("COURSE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302200C00039$$" ON "PIBICSDM2"."TRAIN_EVALUATION_2" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302200C00040$$" ON "PIBICSDM2"."TRAIN_EVALUATION_2" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_EVALUATION_2_PK" ON "PIBICSDM2"."TRAIN_EVALUATION_2" ("EVA_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TRAIN_EVALUATION_2" TO "BIOSAADM";
