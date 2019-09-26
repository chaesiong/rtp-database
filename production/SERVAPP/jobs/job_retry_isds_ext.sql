BEGIN 
dbms_scheduler.create_job('"JOB_RETRY_ISDS_EXT"',
job_type=>'PLSQL_BLOCK', job_action=>
'declare
   v_start varchar2(20);
   v_end   varchar2(20);
begin
   v_start :=to_char(sysdate,''DD/MM/YYYY'')||'' 00:00:00'';      
   v_end:=to_char(sysdate,''DD/MM/YYYY'')||'' 23:59:59'';
             --Created date : 07/11/2019 
             --Owner :   Tanat + Nitat
            PKG_ISDS_RETRY.ISDS_RETRY(''EXT'',v_start,v_end);         
   exception when others 
        then 
            raise;
end;'
, number_of_arguments=>0,
start_date=>TO_TIMESTAMP_TZ('25-JUL-2019 03.03.42.000000000 PM ASIA/BANGKOK','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'), repeat_interval=> 
'freq=minutely;interval=5;'
, end_date=>NULL,
job_class=>'"DEFAULT_JOB_CLASS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
NULL
);
sys.dbms_scheduler.set_attribute('"JOB_RETRY_ISDS_EXT"','NLS_ENV','NLS_LANGUAGE=''THAI'' NLS_TERRITORY=''THAILAND'' NLS_CURRENCY=''฿'' NLS_ISO_CURRENCY=''THAILAND'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD/MM/RRRR HH24:MI:SS'' NLS_DATE_LANGUAGE=''THAI'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH24.MI.SSXFF'' NLS_TIMESTAMP_FORMAT=''DD MON RRRR HH24.MI.SSXFF'' NLS_TIME_TZ_FORMAT=''HH24.MI.SSXFF TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD MON RRRR HH24.MI.SSXFF TZR'' NLS_DUAL_CURRENCY=''฿'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
dbms_scheduler.enable('"JOB_RETRY_ISDS_EXT"');
COMMIT; 
END; 
/
