CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" ("ID", "LOGGER_LEVEL", "TEXT", "TIME_STAMP", "SCOPE", "USER_NAME", "CLIENT_IDENTIFIER", "CALL_STACK", "UNIT_NAME", "LINE_NO", "EXTRA", "SID", "CLIENT_INFO", "MODULE", "ACTION") AS 
  SELECT
    id
   ,logger_level
   ,text
   ,time_stamp
   ,scope
   ,user_name
   ,client_identifier
   ,call_stack
   ,unit_name
   ,line_no
   ,extra
   ,sid
   ,client_info
   ,module
   ,action
FROM
    logger.logger_logs_60_min l
    where user_name = USER AND client_identifier IS NOT NULL
	order by id desc;
   COMMENT ON TABLE "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN"  IS 'All LOGGER-Logentries for current user with a set client_identifier. Last 60 minutes';
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "DERMALOG_PROXY";
  GRANT DELETE ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING4PIBICS"."LOG_MY_LOGS_60_MIN" TO "BIOSAADM";
