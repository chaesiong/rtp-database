BEGIN 
dbms_scheduler.create_job('"SJ_P_EXT_PERSON"',
job_type=>'PLSQL_BLOCK', job_action=>
'declare
   v_start varchar2(30);
   v_end   varchar2(30);
begin
   v_start :=TO_CHAR(sysdate-1/24, ''DD/MM/YYYY HH24:MI:SS'');      
   v_end:=TO_CHAR(sysdate, ''DD/MM/YYYY HH24:MI:SS'');  
   
    --Owner : Intawat
    P_EXT_PERSON;  
    
 --Created date : 07/11/2019 
 --Owner :   Tanat + Nitat
    P_EXT_MOVESTAMP(v_start,v_end);          
    
    commit;
    
        exception when others
          then 
                 raise;
  end;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('17-DEC-2018 04.37.30.478897000 PM ASIA/BARNAUL','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'freq=minutely;interval=10;bysecond=05'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"SJ_P_EXT_PERSON"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"SJ_P_EXT_PERSON"','restart_on_recovery',TRUE);
dbms_scheduler.set_attribute('"SJ_P_EXT_PERSON"','restart_on_failure',TRUE);
dbms_scheduler.set_attribute('"SJ_P_EXT_PERSON"','raise_events',128);
dbms_scheduler.enable('"SJ_P_EXT_PERSON"');
COMMIT; 
END; 
/
