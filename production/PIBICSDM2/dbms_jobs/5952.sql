sys.dbms_ijob.submit(job=>5952,luser=>'PIBICSDM2',puser=>'PIBICSDM2',cuser=>'PIBICSDM2',next_date=>to_date('4000-01-01:00:00:00','YYYY-MM-DD:HH24:MI:SS'),interval=>' NEXT_DAY(TRUNC(SYSDATE) + 5.32/24, ''MONDAY'')',broken=>TRUE,what=>'PIBICS.PROCESSTMPERSONEX30;',nlsenv=>'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY''',env=>'0102000200000000');
