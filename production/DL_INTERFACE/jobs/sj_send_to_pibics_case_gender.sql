BEGIN 
dbms_scheduler.create_job('"SJ_SEND_TO_PIBICS_CASE_GENDER"',
job_type=>'PLSQL_BLOCK', job_action=>
'begin
               --created date : 08-07-2019
               -- owner K.MITI
                              
    DL_INTERFACE.SP_SEND_TO_PIBICS_CASE_GENDER;
    exception when others  then
        raise;
end;'
, number_of_arguments=>0,
start_date=>NULL, repeat_interval=> 
'freq=hourly;byhour=3,9,15,21,23;byminute=30'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"SJ_SEND_TO_PIBICS_CASE_GENDER"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"SJ_SEND_TO_PIBICS_CASE_GENDER"','restart_on_recovery',TRUE);
dbms_scheduler.set_attribute('"SJ_SEND_TO_PIBICS_CASE_GENDER"','restart_on_failure',TRUE);
COMMIT; 
END; 
/
