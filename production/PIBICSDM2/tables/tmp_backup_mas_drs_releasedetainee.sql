CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" 
   (	"RELEASEDETAINEE_SEQNO" NUMBER, 
	"RELEASE_SEQNO" NUMBER, 
	"DETENRECORD_SEQNO" NUMBER, 
	"RELEASETYPE_SEQNO" NUMBER, 
	"ISSUEDEPT_TO" NUMBER, 
	"FLIGHTNO" VARCHAR2(10 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"AIRLINENM" VARCHAR2(100 CHAR), 
	"PENALTYRATE" VARCHAR2(20 CHAR), 
	"REMARK" VARCHAR2(200 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"RELEASE_NO" VARCHAR2(50 CHAR), 
	"FLIGHTPREFIX" VARCHAR2(10 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(10 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_BACKUP_MAS_DRS_RELEASEDETAINEE" TO "BIOSAADM";
