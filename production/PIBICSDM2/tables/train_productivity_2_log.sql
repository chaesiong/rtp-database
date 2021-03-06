CREATE TABLE "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" 
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
	"LOG_SEQNO" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" ADD CONSTRAINT "TRAIN_PRODUCTIVITY_2_LOG_PK" PRIMARY KEY ("LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" ADD CONSTRAINT "TRAIN_PRODUCTIVITY_2_LOG_R01" FOREIGN KEY ("COURSE_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_COURSE" ("COURSE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302233C00032$$" ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG_PK" ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" ("LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TRAIN_PRODUCTIVITY_2_LOG" TO "BIOSAADM";
