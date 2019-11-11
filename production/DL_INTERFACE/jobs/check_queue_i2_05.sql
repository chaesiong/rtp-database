BEGIN 
dbms_scheduler.create_job('"CHECK_QUEUE_I2_05"',
job_type=>'PLSQL_BLOCK', job_action=>
'BEGIN dl_interface.pkg_listener.dequeue_hooks (''SEND_MOVEMENT''); END;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('25-MAR-2019 10.25.00.000000000 PM EUROPE/BERLIN','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'FREQ=SECONDLY; INTERVAL=30;'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
'Advanced Queuing for Movements to PIBICS (10. asynchron job)'
);
sys.dbms_scheduler.set_attribute('"CHECK_QUEUE_I2_05"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"CHECK_QUEUE_I2_05"','instance_stickiness',FALSE);
dbms_scheduler.set_attribute('"CHECK_QUEUE_I2_05"','instance_id',2);
dbms_scheduler.enable('"CHECK_QUEUE_I2_05"');
COMMIT; 
END; 
/
