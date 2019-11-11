CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."OPS_CONFIGURATION" ("TYPE", "NAME", "VALUE") AS 
  SELECT 'Preference-Entry' AS TYPE
      ,pref_name AS NAME
      ,pref_value AS VALUE
FROM ops_preferences  ORDER BY 1,2;
   COMMENT ON TABLE "DL_BLACKLIST"."OPS_CONFIGURATION"  IS 'Summary of most important configuration settings in the system';
  GRANT SELECT ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BLACKLIST"."OPS_CONFIGURATION" TO "BIOSAADM";
