CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."OPS_PREFERRED_LOGS" ("ID", "LOGGER_LEVEL", "TEXT", "TIME_STAMP", "SCOPE", "USER_NAME", "CLIENT_IDENTIFIER", "CALL_STACK", "UNIT_NAME", "LINE_NO", "EXTRA", "SID", "CLIENT_INFO") AS 
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
FROM
    logger.logger_logs l
    inner join ops_Preferences p on p.pref_value = l.client_identifier  and P.Pref_Name  ='LOGGER_CLIENT_ID'
;
   COMMENT ON TABLE "DL_BLACKLIST"."OPS_PREFERRED_LOGS"  IS 'All LOGGER-Logentries for the client_id as defined  in table PREFERENCES , PREF_VALUE for PREF_NAME ''LOGGER_CLIENT_ID''';
  GRANT SELECT ON "DL_BLACKLIST"."OPS_PREFERRED_LOGS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."OPS_PREFERRED_LOGS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."OPS_PREFERRED_LOGS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_PREFERRED_LOGS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."OPS_PREFERRED_LOGS" TO "DERMALOG_PROXY";