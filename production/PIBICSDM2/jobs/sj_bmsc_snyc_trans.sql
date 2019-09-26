BEGIN 
dbms_scheduler.create_job('"SJ_BMSC_SNYC_TRANS"',
job_type=>'PLSQL_BLOCK', job_action=>
'begin
          --Created date : 26/03/2019
          --Job owner : Sirion
          cp_sync_main_tran();
          commit;
          
          exception when others
            then
                raise;         
end;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('26-MAR-2019 10.46.14.529899000 AM ASIA/BARNAUL','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'freq=hourly;byhour=01,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23;byminute=30;bysecond=00'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"SJ_BMSC_SNYC_TRANS"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"SJ_BMSC_SNYC_TRANS"','restart_on_recovery',TRUE);
dbms_scheduler.set_attribute('"SJ_BMSC_SNYC_TRANS"','restart_on_failure',TRUE);
dbms_scheduler.enable('"SJ_BMSC_SNYC_TRANS"');
COMMIT; 
END; 
/
