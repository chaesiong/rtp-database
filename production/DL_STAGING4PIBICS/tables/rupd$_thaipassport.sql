CREATE GLOBAL TEMPORARY TABLE "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" 
   (	"CITIZENID" VARCHAR2(13 CHAR), 
	"PASSPORTNO" VARCHAR2(12 CHAR), 
	"DMLTYPE$$" VARCHAR2(1 CHAR), 
	"SNAPID" NUMBER(*,0), 
	"CHANGE_VECTOR$$" RAW(255)
   ) ON COMMIT PRESERVE ROWS ;
   COMMENT ON TABLE "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT"  IS 'temporary updatable snapshot log';
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."RUPD$_THAIPASSPORT" TO "BIOSAADM";
