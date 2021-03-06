CREATE TABLE "PIBICSDM2"."TRAIN_EVA_INS" 
   (	"EVAI_SEQNO" NUMBER, 
	"EVA_SEQNO" NUMBER, 
	"INS_SEQNO" NUMBER, 
	"EVA_2_3_1" CHAR(1 CHAR), 
	"EVA_2_3_1_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_2" CHAR(1 CHAR), 
	"EVA_2_3_2_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_3" CHAR(1 CHAR), 
	"EVA_2_3_3_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_4" CHAR(1 CHAR), 
	"EVA_2_3_4_REMARK" VARCHAR2(100 CHAR), 
	"EVA_2_3_5" CHAR(1 CHAR), 
	"EVA_2_3_5_REMARK" VARCHAR2(100 CHAR), 
	"VERSION" NUMBER, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_EVA_INS" ADD CONSTRAINT "TRAIN_EVA_INS_PK" PRIMARY KEY ("EVAI_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_EVA_INS" ADD CONSTRAINT "TRAIN_EVA_INS_R01" FOREIGN KEY ("EVA_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_EVALUATION" ("EVA_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_EVA_INS_PK" ON "PIBICSDM2"."TRAIN_EVA_INS" ("EVAI_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TRAIN_EVA_INS" TO "BIOSAADM";
