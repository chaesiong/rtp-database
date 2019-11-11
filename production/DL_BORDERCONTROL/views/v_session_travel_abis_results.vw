CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" ("SCORE_TYPE", "ABIS_ID", "ABIS_SCORE", "SCORE_PERCENT", "IS_EXPECTED") AS 
  select c001 score_type, n001 abis_id, n002 abis_score, n003 score_percent, n004 is_expected from apex_collections where collection_name = 'TRAVEL_ABIS_RESULTS';
  GRANT SELECT ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."V_SESSION_TRAVEL_ABIS_RESULTS" TO "BIOSAADM";
