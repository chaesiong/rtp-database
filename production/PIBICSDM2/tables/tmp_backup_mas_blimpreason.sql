CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" 
   (	"REASON_SEQNO" NUMBER, 
	"REASONCD" CHAR(4 CHAR), 
	"REASONTNM" VARCHAR2(60 CHAR), 
	"REASONENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"OVERSTAY_BEGIN_AMT" NUMBER, 
	"OVERSTAY_BEGIN_UNIT" VARCHAR2(1 CHAR), 
	"PROHIBIT_AMT" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_BACKUP_MAS_BLIMPREASON" TO "BIOSAADM";
