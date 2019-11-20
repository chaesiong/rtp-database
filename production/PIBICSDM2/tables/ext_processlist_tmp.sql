CREATE TABLE "PIBICSDM2"."EXT_PROCESSLIST_TMP" 
   (	"PROCLIST_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"EXTLIST_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PROCESSLIST_TMP" TO "BIOSAADM";
