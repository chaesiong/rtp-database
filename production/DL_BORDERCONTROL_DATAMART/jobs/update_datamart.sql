BEGIN 
dbms_scheduler.create_job('"UPDATE_DATAMART"',
job_type=>'PLSQL_BLOCK', job_action=>
'BEGIN DL_BORDERCONTROL_DATAMART.PKG_ETL.update_datamart; END;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('23-NOV-2018 10.18.55.391344000 PM ASIA/BARNAUL','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'FREQ=DAILY; BYHOUR=1; BYMINUTE=0; BYSECOND=0;'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"UPDATE_DATAMART"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-YYYY HH24:MI:SS'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''CHAR'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.enable('"UPDATE_DATAMART"');
COMMIT; 
END; 
/
