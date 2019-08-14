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