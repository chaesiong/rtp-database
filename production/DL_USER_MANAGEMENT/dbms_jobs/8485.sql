sys.dbms_ijob.submit(job=>8485,luser=>'DL_BORDERCONTROL',puser=>'DL_USER_MANAGEMENT',cuser=>'DL_USER_MANAGEMENT',next_date=>to_date('4000-01-01:00:00:00','YYYY-MM-DD:HH24:MI:SS'),interval=>'null',broken=>TRUE,what=>'dbms_mview.refresh( ''dl_user_management.apex_menu_permissions'' );',nlsenv=>'NLS_LANGUAGE=''THAI'' NLS_TERRITORY=''THAILAND'' NLS_CURRENCY=''฿'' NLS_ISO_CURRENCY=''THAILAND'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_DATE_FORMAT=''DD/MM/YYYY'' NLS_DATE_LANGUAGE=''THAI'' NLS_SORT=''THAI_DICTIONARY''',env=>'0102000000000000');
