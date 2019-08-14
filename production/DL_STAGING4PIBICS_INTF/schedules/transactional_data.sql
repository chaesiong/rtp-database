BEGIN 
dbms_scheduler.disable1_calendar_check();
dbms_scheduler.create_schedule('"TRANSACTIONAL_DATA"',TO_TIMESTAMP_TZ('26-NOV-2018 09.25.07.000000000 PM EUROPE/BERLIN','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'),
'FREQ=MINUTELY; INTERVAL=23',
NULL,
'every some minutes we get the transactional data'
);
COMMIT; 
END; 
/
