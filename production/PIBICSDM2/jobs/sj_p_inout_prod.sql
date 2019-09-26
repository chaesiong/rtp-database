BEGIN 
dbms_scheduler.create_job('"SJ_P_INOUT_PROD"',
job_type=>'PLSQL_BLOCK', job_action=>
'begin
         --start date : 05/07/2019
         --owner : mayank.s
         
          P_INOUT_PROD;  
          
          exception when others
            then 
                raise;
                
end;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('05-JUL-2019 08.41.55.921644000 PM ASIA/BARNAUL','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'freq=minutely;interval=2;'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"SJ_P_INOUT_PROD"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"SJ_P_INOUT_PROD"','restart_on_recovery',TRUE);
dbms_scheduler.set_attribute('"SJ_P_INOUT_PROD"','restart_on_failure',TRUE);
dbms_scheduler.enable('"SJ_P_INOUT_PROD"');
COMMIT; 
END; 
/
