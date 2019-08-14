BEGIN 
dbms_scheduler.create_job('"METADATA_SYNC_FLIGHTNUMBERS"',
job_type=>'PLSQL_BLOCK', job_action=>
'BEGIN dl_staging4pibics_intf.transfer_meta_data(p_process => ''FLIGHTNUMBERS''); END;'
, number_of_arguments=>0,
schedule_name=>'"METADATA"',
job_class=>'"ONGOING_SYNCHRONISATION_PIBICS"', enabled=>FALSE, auto_drop=>FALSE,comments=>
'keep metadata current  FLIGHTNUMBERS from  PIBICS  to BORDERCONTROL '
);
sys.dbms_scheduler.set_attribute('"METADATA_SYNC_FLIGHTNUMBERS"','NLS_ENV','NLS_LANGUAGE=''ENGLISH'' NLS_TERRITORY=''GERMANY'' NLS_CURRENCY=''€'' NLS_ISO_CURRENCY=''GERMANY'' NLS_NUMERIC_CHARACTERS='',.'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD.MM.RR'' NLS_DATE_LANGUAGE=''ENGLISH'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH24:MI:SSXFF'' NLS_TIMESTAMP_FORMAT=''DD.MM.RR HH24:MI:SSXFF'' NLS_TIME_TZ_FORMAT=''HH24:MI:SSXFF TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD.MM.RR HH24:MI:SSXFF TZR'' NLS_DUAL_CURRENCY=''€'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''');
COMMIT; 
END; 
/
