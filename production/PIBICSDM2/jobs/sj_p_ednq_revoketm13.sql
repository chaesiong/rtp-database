BEGIN 
dbms_scheduler.create_job('"SJ_P_EDNQ_REVOKETM13"',
job_type=>'PLSQL_BLOCK', job_action=>
'  begin
    --17
    P_EDNQ_REVOKETM13; 
        exception when others
          then 
                 raise;
  end;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('17-DEC-2018 04.37.30.478897000 PM ASIA/BARNAUL','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'freq=daily;byhour=01;byminute=16;'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"SJ_P_EDNQ_REVOKETM13"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"SJ_P_EDNQ_REVOKETM13"','restart_on_recovery',TRUE);
dbms_scheduler.set_attribute('"SJ_P_EDNQ_REVOKETM13"','restart_on_failure',TRUE);
dbms_scheduler.enable('"SJ_P_EDNQ_REVOKETM13"');
COMMIT; 
END; 
/
