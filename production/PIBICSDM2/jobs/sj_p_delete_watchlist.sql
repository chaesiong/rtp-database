BEGIN 
dbms_scheduler.create_job('"SJ_P_DELETE_WATCHLIST"',
job_type=>'PLSQL_BLOCK', job_action=>
'begin
      P_DELETE_WATCHLIST_M(''''); 
        exception when others
          then 
                 raise;
  end;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('12-NOV-2019 12.00.00.000000000 AM ASIA/BARNAUL','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'freq=hourly;interval=6'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"SJ_P_DELETE_WATCHLIST"','NLS_ENV','NLS_LANGUAGE=''THAI'' NLS_TERRITORY=''THAILAND'' NLS_CURRENCY=''฿'' NLS_ISO_CURRENCY=''THAILAND'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD MON RRRR'' NLS_DATE_LANGUAGE=''THAI'' NLS_SORT=''THAI_DICTIONARY'' NLS_TIME_FORMAT=''HH24.MI.SSXFF'' NLS_TIMESTAMP_FORMAT=''DD MON RRRR HH24.MI.SSXFF'' NLS_TIME_TZ_FORMAT=''HH24.MI.SSXFF TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD MON RRRR HH24.MI.SSXFF TZR'' NLS_DUAL_CURRENCY=''฿'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"SJ_P_DELETE_WATCHLIST"','restart_on_recovery',TRUE);
dbms_scheduler.set_attribute('"SJ_P_DELETE_WATCHLIST"','restart_on_failure',TRUE);
dbms_scheduler.enable('"SJ_P_DELETE_WATCHLIST"');
COMMIT; 
END; 
/
