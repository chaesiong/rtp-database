CREATE GLOBAL TEMPORARY TABLE "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"DMLTYPE$$" VARCHAR2(1 CHAR), 
	"SNAPID" NUMBER(*,0), 
	"CHANGE_VECTOR$$" RAW(255)
   ) ON COMMIT PRESERVE ROWS ;
   COMMENT ON TABLE "DL_STAGING4PIBICS"."RUPD$_WATCHLIST"  IS 'temporary updatable snapshot log';
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."RUPD$_WATCHLIST" TO "BIOSAADM";
