
REM INSERTING into DL_BLACKLIST.OPS_PREFERENCES
SET DEFINE OFF;
Insert into DL_BLACKLIST.OPS_PREFERENCES (PREF_NAME,DESCRIPTION,PREF_VALUE) values ('LOGGER_LEVEL','Logging Level for LOGGER-Package, related to client_id, see LOGGING_CLIENT_ID. If the Value is NULL, the system LOGGER-Level will be used','DEBUG');
Insert into DL_BLACKLIST.OPS_PREFERENCES (PREF_NAME,DESCRIPTION,PREF_VALUE) values ('LOGGER_CLIENT_ID','Client-Id for LOGGER-Pakage. This will be set with  sys.dbms_session.set_identifier during runtime.  If LOGGER_LEVEL is NULL, this value is ignored.','Blacklist User Interface');

