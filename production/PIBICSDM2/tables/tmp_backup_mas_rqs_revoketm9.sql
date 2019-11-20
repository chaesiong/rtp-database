CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" 
   (	"REVOKETM9_SEQNO" NUMBER, 
	"TM9_SEQNO" NUMBER, 
	"RVKSECTION" VARCHAR2(200 CHAR), 
	"RVKDETAIL" VARCHAR2(2000 CHAR), 
	"RVK_DATE" DATE, 
	"RVKMEETING" VARCHAR2(20 CHAR), 
	"INTERIORMINISTER" VARCHAR2(100 CHAR), 
	"ORDERRVK_DATE" DATE, 
	"NOTICEINFO" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_BACKUP_MAS_RQS_REVOKETM9" TO "BIOSAADM";
