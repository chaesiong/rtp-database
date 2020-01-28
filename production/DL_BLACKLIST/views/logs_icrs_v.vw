CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."LOGS_ICRS_V" ("KEY_VALUE", "BLACKLIST_CASE_ID", "NIST_FILE", "NIST_FILE_MIMETYPE", "NIST_FILE_NAME", "SERVICE_RESPONSE", "SERVICE_SEND", "SERVICE_RECEIVE", "SERVICE_RESULT", "STATUS", "AUTHORITY", "CASE_NUMBER", "INS_AT", "DML_AT") AS 
  SELECT l.key_value
      ,l.blacklist_case_id
      ,l.nist_file
      ,l.nist_file_mimetype
      ,l.nist_file_name
      ,l.service_response
      ,l.service_send
      ,l.service_receive
      ,l.service_result
      ,l.status
      ,b.authority
      ,b.case_number
      ,b.ins_at
      ,b.dml_at
  FROM dl_blacklist.logs_icrs l
  JOIN dl_blacklist.blacklist_cases b ON l.blacklist_case_id = b.id
;
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "DL_COMMON";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS_V" TO "PUNYAWII_D";
