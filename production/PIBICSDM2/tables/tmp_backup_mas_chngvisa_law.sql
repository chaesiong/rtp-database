CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" 
   (	"LAW_SEQNO" NUMBER, 
	"LAWNO" NUMBER, 
	"LAWNM" VARCHAR2(250 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"NOTE" VARCHAR2(200 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_BACKUP_MAS_CHNGVISA_LAW" TO "BIOSAADM";
