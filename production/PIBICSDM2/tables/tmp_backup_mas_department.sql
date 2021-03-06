CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" 
   (	"DEPT_SEQNO" NUMBER, 
	"DEPTCD" VARCHAR2(6 CHAR), 
	"DEPTLEVEL" CHAR(1 CHAR), 
	"DEPTENM" VARCHAR2(60 CHAR), 
	"DEPTTNM" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(250 CHAR), 
	"ADDNO" VARCHAR2(60 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"ZIPCODE" CHAR(5 CHAR), 
	"TELNO" VARCHAR2(60 CHAR), 
	"FAX" VARCHAR2(60 CHAR), 
	"EMAIL" VARCHAR2(2000 CHAR), 
	"URLDEPT" VARCHAR2(100 CHAR), 
	"ADEPTTYPE" CHAR(1 CHAR), 
	"CONV_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CONVCD" CHAR(4 CHAR), 
	"ABBRNM" VARCHAR2(100 CHAR), 
	"REL_CODE" NUMBER, 
	"ORG_CODE" VARCHAR2(8 CHAR), 
	"DETAINEE_FLAG" CHAR(1 CHAR), 
	"ORG_SEQNO" NUMBER, 
	"CHECKPOINT" CHAR(1 CHAR), 
	"DEPTABBFMT1" VARCHAR2(200 CHAR), 
	"DEPTABBFMT2" VARCHAR2(200 CHAR), 
	"CASINO_FLAG" CHAR(1 CHAR), 
	"SPOTSEQNO" NUMBER, 
	"OLDDEPTCD" CHAR(5 CHAR), 
	"DEPTLINE" CHAR(1 CHAR), 
	"FIELD_DEFAULT" VARCHAR2(500 CHAR), 
	"TWOSECTION" CHAR(1 CHAR), 
	"QEXT_ACTFLAG" CHAR(1 CHAR), 
	"QEXT_TYPE" CHAR(1 CHAR), 
	"QEXT_NOTE" VARCHAR2(2500 CHAR), 
	"QREPS_ACTFLAG" CHAR(1 CHAR), 
	"QREPS_TYPE" CHAR(1 CHAR), 
	"QREPS_NOTE" VARCHAR2(2500 CHAR), 
	"DEPT_TITLE_DOC" VARCHAR2(1000 CHAR), 
	"TEL_TITLE_DOC" VARCHAR2(100 CHAR), 
	"DEPTABBFMT3" VARCHAR2(200 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"QFN90_ACTFLAG" CHAR(1 CHAR), 
	"QFN90_TYPE" CHAR(1 CHAR), 
	"QFN90_NOTE" VARCHAR2(2500 CHAR), 
	"FLAG_FINES_STAFF" CHAR(1 CHAR), 
	"DEPTABBFMT4" VARCHAR2(200 CHAR), 
	"VOA_ONLINE_FLAG" CHAR(1 CHAR), 
	"IMGDIR" VARCHAR2(5 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_BACKUP_MAS_DEPARTMENT" TO "BIOSAADM";
