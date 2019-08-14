BEGIN 
dbms_scheduler.create_job('"CHECK_QUEUE_23"',
job_type=>'PLSQL_BLOCK', job_action=>
'BEGIN dl_interface.pkg_listener.dequeue_hooks (''SEND_MOVEMENT''); END;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('25-MAR-2019 10.25.00.000000000 PM EUROPE/BERLIN','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'FREQ=SECONDLY; INTERVAL=30;'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
'Advanced Queuing for Movements to PIBICS (10. asynchron job)'
);
sys.dbms_scheduler.set_attribute('"CHECK_QUEUE_23"','NLS_ENV','NLS_LANGUAGE=''ENGLISH'' NLS_TERRITORY=''GERMANY'' NLS_CURRENCY=''€'' NLS_ISO_CURRENCY=''GERMANY'' NLS_NUMERIC_CHARACTERS='',.'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD.MM.YYYY HH24:MI:SS'' NLS_DATE_LANGUAGE=''ENGLISH'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH24:MI:SSXFF'' NLS_TIMESTAMP_FORMAT=''DD.MM.RR HH24:MI:SSXFF'' NLS_TIME_TZ_FORMAT=''HH24:MI:SSXFF TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD.MM.RR HH24:MI:SSXFF TZR'' NLS_DUAL_CURRENCY=''€'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"CHECK_QUEUE_23"','instance_stickiness',FALSE);
dbms_scheduler.set_attribute('"CHECK_QUEUE_23"','instance_id',1);
dbms_scheduler.enable('"CHECK_QUEUE_23"');
COMMIT; 
END; 
/
