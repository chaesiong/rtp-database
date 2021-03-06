CREATE TABLE "PIBICSDM2"."QUE_SETUP_DAYS_LOG" 
   (	"QSETUP_DAYS_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"SETUP_DAYS_SEQNO" NUMBER, 
	"SETUP_SEQNO" NUMBER, 
	"QUEDATE" DATE, 
	"QUESTATUS" CHAR(1 CHAR), 
	"QUETIME_OPEN" VARCHAR2(5 CHAR), 
	"QUETIME_CLOSE" VARCHAR2(5 CHAR), 
	"QUETIME_TYPE" CHAR(1 CHAR), 
	"QUETIME_NUM" NUMBER, 
	"QUETIME_TOTAL" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"NOTE" VARCHAR2(200 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."QUE_SETUP_DAYS_LOG_PK" ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" ("QSETUP_DAYS_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."QUE_SETUP_DAYS_LOG" TO "BIOSAADM";
