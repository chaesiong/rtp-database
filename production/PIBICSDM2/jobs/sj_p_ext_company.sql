BEGIN 
dbms_scheduler.create_job('"SJ_P_EXT_COMPANY"',
job_type=>'PLSQL_BLOCK', job_action=>
'declare
   v_start varchar2(20);
   v_end   varchar2(20);
  
begin
 
   v_start :=TO_CHAR(sysdate-4/24, ''DD/MM/YYYY HH24:MI:SS'');      
   v_end:=TO_CHAR(sysdate, ''DD/MM/YYYY HH24:MI:SS'');
             --Created date : 11/07/2019 
             --Owner :   Tanat + Nitat
           
            P_EXT_COMPANY (v_start,v_end);    
            
   exception when others 
        then 
            raise;
end;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('11-JUL-2019 02.24.07.722969000 PM ASIA/BARNAUL','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'freq=hourly;interval=1;byminute=15'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"SJ_P_EXT_COMPANY"','NLS_ENV','NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.set_attribute('"SJ_P_EXT_COMPANY"','restart_on_recovery',TRUE);
dbms_scheduler.set_attribute('"SJ_P_EXT_COMPANY"','restart_on_failure',TRUE);
dbms_scheduler.enable('"SJ_P_EXT_COMPANY"');
COMMIT; 
END; 
/
