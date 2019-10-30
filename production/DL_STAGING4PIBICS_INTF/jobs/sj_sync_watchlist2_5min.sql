BEGIN 
dbms_scheduler.create_job('"SJ_SYNC_WATCHLIST2_5MIN"',
job_type=>'PLSQL_BLOCK', job_action=>
'BEGIN 
  dl_staging4pibics_intf.keep_current2(to_char(sysdate,''YYYYMMDD''));
  exception when others
    then
        raise;
END;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('28-JUN-2019 12.30.42.000000000 PM ASIA/BANGKOK','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'FREQ=MINUTELY;INTERVAL=15;BYDAY=MON,TUE,WED,THU,FRI,SAT,SUN'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
'TEST SYNC BLACKLIST2 '
);
sys.dbms_scheduler.set_attribute('"SJ_SYNC_WATCHLIST2_5MIN"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"SJ_SYNC_WATCHLIST2_5MIN"','restart_on_recovery',TRUE);
dbms_scheduler.set_attribute('"SJ_SYNC_WATCHLIST2_5MIN"','restart_on_failure',TRUE);
dbms_scheduler.enable('"SJ_SYNC_WATCHLIST2_5MIN"');
COMMIT; 
END; 
/
