BEGIN 
dbms_scheduler.create_job('"LOGGER_UNSET_PREFS_BY_CLIENT"',
job_type=>'PLSQL_BLOCK', job_action=>
'begin logger.unset_client_level; end; '
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('23-NOV-2018 10.05.31.920597000 PM +07:00','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'FREQ=HOURLY; BYHOUR=1'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>TRUE,comments=>
'Clears logger prefs by client_id'
);
sys.dbms_scheduler.set_attribute('"LOGGER_UNSET_PREFS_BY_CLIENT"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-YYYY HH24:MI:SS'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.enable('"LOGGER_UNSET_PREFS_BY_CLIENT"');
COMMIT; 
END; 
/
