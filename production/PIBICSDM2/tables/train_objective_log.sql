CREATE TABLE "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" 
   (	"OBJ_SEQNO" NUMBER, 
	"COURSE_SEQNO" NUMBER, 
	"OBJ_DETAIL" VARCHAR2(800 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"OBJECTIVELOG_SEQNO" NUMBER, 
	"OBJECTIVELOG_DATE" TIMESTAMP (6), 
	"OBJECTIVELOG_FLAG" CHAR(1 CHAR), 
	"OBJECTIVELOG_USRUPD" VARCHAR2(20 CHAR), 
	"COURSELOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" ADD CONSTRAINT "TRAIN_OBJECTIVE_LOG_PK" PRIMARY KEY ("OBJECTIVELOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" ADD CONSTRAINT "TRAIN_OBJECTIVE_LOG_R01" FOREIGN KEY ("COURSELOG_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_COURSE_LOG" ("COURSELOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_OBJECTIVE_LOG_PK" ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" ("OBJECTIVELOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TRAIN_OBJECTIVE_LOG" TO "BIOSAADM";
