CREATE GLOBAL TEMPORARY TABLE "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT" 
   (	"LPPCD" VARCHAR2(20 CHAR), 
	"DMLTYPE$$" VARCHAR2(1 CHAR), 
	"SNAPID" NUMBER(*,0), 
	"CHANGE_VECTOR$$" RAW(255)
   ) ON COMMIT PRESERVE ROWS ;
   COMMENT ON TABLE "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT"  IS 'temporary updatable snapshot log';
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_LOSTPASSPORT" TO "APPSUP";
