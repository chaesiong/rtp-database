BEGIN 
dbms_scheduler.disable1_calendar_check();
dbms_scheduler.create_schedule('"METADATA"',TO_TIMESTAMP_TZ('26-NOV-2018 09.25.07.000000000 PM EUROPE/BERLIN','DD-MON-RRRR HH.MI.SSXFF AM TZR','NLS_DATE_LANGUAGE=english'),
'FREQ=HOURLY; INTERVAL=23',
NULL,
'every some hours we get the metadata'
);
COMMIT; 
END; 
/
