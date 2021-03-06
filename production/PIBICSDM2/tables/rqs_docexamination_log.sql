CREATE TABLE "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" 
   (	"DOCEXAMINATION_SEQNO" NUMBER, 
	"TMTYPE" CHAR(1 CHAR), 
	"TM_LOG_SEQNO" NUMBER, 
	"DETAILED_EXAM" VARCHAR2(1000 CHAR), 
	"EXAM_SDATE" DATE, 
	"EXAM_RDATE" DATE, 
	"TEST_RESULT" VARCHAR2(300 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"DOCEXAMINATION_LOG_SEQNO" NUMBER, 
	"TM_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" ADD PRIMARY KEY ("DOCEXAMINATION_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00206968" ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" ("DOCEXAMINATION_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RQS_DOCEXAMINATION_LOG" TO "BIOSAADM";
