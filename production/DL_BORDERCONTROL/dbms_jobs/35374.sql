sys.dbms_ijob.submit(job=>35374,luser=>'DL_BORDERCONTROL',puser=>'DL_BORDERCONTROL',cuser=>'DL_BORDERCONTROL',next_date=>to_date('2020-01-29:02:22:43','YYYY-MM-DD:HH24:MI:SS'),interval=>'sysdate + 1 ',broken=>FALSE,what=>'dbms_refresh.refresh(''"DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS"'');',nlsenv=>'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY''',env=>'0102000000000000');
