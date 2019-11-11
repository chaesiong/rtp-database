CREATE OR REPLACE FORCE EDITIONABLE VIEW "LOGGER"."LOGGER_LOGS_60_MIN" ("ID", "LOGGER_LEVEL", "TEXT", "TIME_STAMP", "SCOPE", "MODULE", "ACTION", "USER_NAME", "CLIENT_IDENTIFIER", "CALL_STACK", "UNIT_NAME", "LINE_NO", "SCN", "EXTRA", "SID", "CLIENT_INFO") AS 
  select "ID","LOGGER_LEVEL","TEXT","TIME_STAMP","SCOPE","MODULE","ACTION","USER_NAME","CLIENT_IDENTIFIER","CALL_STACK","UNIT_NAME","LINE_NO","SCN","EXTRA","SID","CLIENT_INFO"
      from logger_logs
	 where time_stamp > systimestamp - (1/24);
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_INTERFACE";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_DBA";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_COMMON";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_USER_MANAGEMENT";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "USER_MANAGEMENT";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_BLACKLIST";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DL_STAGING4PIBICS";
  GRANT DELETE ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DERMALOG_PROXY";
  GRANT INSERT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DERMALOG_PROXY";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "DERMALOG_PROXY";
  GRANT DELETE ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT INSERT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT UPDATE ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT REFERENCES ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT READ ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT DEBUG ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT FLASHBACK ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
  GRANT MERGE VIEW ON "LOGGER"."LOGGER_LOGS_60_MIN" TO "BIOSAADM";
