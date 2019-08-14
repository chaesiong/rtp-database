prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(84086328460050156)
,p_process_sequence=>1
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Show notification if pwd expires'
,p_process_sql_clob=>'dl_user_management.pkg_man_users.check_pwd_expired();'
,p_process_when=>'apex_util.get_preference(''PWD_EXP_NOTIFICATION'') != v(''APP_SESSION'') or apex_util.get_preference(''PWD_EXP_NOTIFICATION'') is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(18149138299779627)
,p_process_sequence=>1
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Session Language'
,p_process_sql_clob=>'APEX_UTIL.SET_SESSION_LANG( P_LANG => SUBSTR(APEX_APPLICATION.G_BROWSER_LANGUAGE, 1, 2) );'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(265671452861489453)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetJWTTokenCookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_params          VARCHAR2(32767) := apex_application.g_x01;',
'    l_clob            CLOB;',
'    l_json            JSON_OBJECT_T;',
'    l_access_token    VARCHAR2(32767);',
'    l_client_id       VARCHAR2(32767);',
'    l_client_secret   VARCHAR2(32767);',
'    l_url    VARCHAR2(4000 CHAR);',
'    l_server VARCHAR2(4000 CHAR);',
'    err_no_data exception;',
'    PRAGMA EXCEPTION_INIT(err_no_data,-20001);',
'',
'BEGIN',
'    l_server := coalesce(owa_util.get_cgi_env(''HTTP_HOST''),',
'                         utl_inaddr.get_host_address);',
'',
'    IF instr(l_server, '':'') > 0',
'    THEN',
'        l_server := substr(l_server, 1, instr(l_server, '':'') - 1);',
'    END IF;',
'    l_url := owa_util.get_cgi_env(''REQUEST_PROTOCOL'') || ''://'' ||',
'             l_server || ''/'';',
'             ',
'    SELECT  CLIENT_ID, CLIENT_SECRET',
'    INTO l_client_id, l_client_secret',
'    FROM dl_bordercontrol.v_oauth_clients',
'    WHERE NAME = ''Client Imageserver'';',
'',
'    apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';   ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';  ',
'    ',
'    apex_web_service.g_request_headers(2).name := ''Authorization'';   ',
'    apex_web_service.g_request_headers(2).value := ''Basic '' || ',
'       replace(',
'            utl_raw.cast_to_varchar2(',
'                utl_encode.base64_encode(',
'                    utl_raw.cast_to_raw(l_client_id||'':''||l_client_secret)',
'                )',
'            ), ',
'            chr(13)||chr(10), '''');',
'',
'    apex_web_service.g_request_headers(3).name := ''cache-control'';   ',
'    apex_web_service.g_request_headers(3).value := ''no-cache'';',
'    ',
'    l_clob := apex_web_service.make_rest_request(',
'          p_url         => l_url || ''/oauth2/connect/token'',',
'          p_http_method => ''POST'',',
'          p_parm_name   => apex_util.string_to_table(''grant_type:scope''),  ',
'          p_parm_value  => apex_util.string_to_table(''client_credentials:ImageService_Execute''),',
'          p_wallet_path => ''file:/u01/app/oracle/admin/AFIS/https_wallet/'', -- The path to directory that holding wallets',
'          p_wallet_pwd  => ''dermalog!''',
'          ,p_https_host  => ''Dermalog'' -- The Value from the Common Name in cert subject - The Oracle Way',
'    );',
'    ',
'    l_json         := JSON_OBJECT_T.parse(l_clob);',
'    l_access_token := l_json.get_String(''access_token'');',
'    IF l_access_token IS NOT NULL THEN',
'        owa_cookie.send(''OA_B'',l_access_token, SYSDATE+30, ''/'');',
'    ELSE',
'        owa_cookie.send(''OA_B'','' '', SYSDATE-30, ''/'');',
'    END IF;',
'    ',
'END;'))
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(341106056172611702)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetORDSTokenCookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_params          VARCHAR2(32767) := apex_application.g_x01;',
'    l_clob            CLOB;',
'    l_json            JSON_OBJECT_T;',
'    l_access_token    VARCHAR2(32767);',
'    l_client_id       VARCHAR2(32767);',
'    l_client_secret   VARCHAR2(32767);',
'    l_url    VARCHAR2(4000 CHAR);',
'    l_server VARCHAR2(4000 CHAR);',
'    err_no_data exception;',
'    PRAGMA EXCEPTION_INIT(err_no_data,-20001);',
'',
'BEGIN',
'    l_server := coalesce(owa_util.get_cgi_env(''HTTP_HOST''),',
'                         utl_inaddr.get_host_address);',
'',
'    IF instr(l_server, '':'') > 0',
'    THEN',
'        l_server := substr(l_server, 1, instr(l_server, '':'') - 1);',
'    END IF;',
'    l_url := owa_util.get_cgi_env(''REQUEST_PROTOCOL'') || ''://'' ||',
'             l_server || ''/'';',
'             ',
'    SELECT  CLIENT_ID, CLIENT_SECRET',
'    INTO l_client_id, l_client_secret',
'    FROM dl_bordercontrol.v_oauth_clients',
'    WHERE NAME = ''Camunda Client'';',
'',
'    apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';   ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';  ',
'    ',
'    apex_web_service.g_request_headers(2).name := ''Authorization'';   ',
'    apex_web_service.g_request_headers(2).value := ''Basic '' || ',
'       replace(',
'            utl_raw.cast_to_varchar2(',
'                utl_encode.base64_encode(',
'                    utl_raw.cast_to_raw(l_client_id||'':''||l_client_secret)',
'                )',
'            ), ',
'            chr(13)||chr(10), '''');',
'',
'    apex_web_service.g_request_headers(3).name := ''cache-control'';   ',
'    apex_web_service.g_request_headers(3).value := ''no-cache'';',
'    ',
'    l_clob := apex_web_service.make_rest_request(',
'          p_url         => l_url || ''/ords/dl_bordercontrol/oauth/token'',',
'          p_http_method => ''POST'',',
'          p_parm_name   => apex_util.string_to_table(''grant_type:scope''),  ',
'          p_parm_value  => apex_util.string_to_table(''client_credentials:BlacklistAccess''),',
'          p_https_host  => ''Dermalog'', -- this is the value of the Subject Common Name (CN)                      ',
'          p_wallet_path => ''file:/u01/app/oracle/admin/AFIS/https_wallet'',',
'          p_wallet_pwd  => ''dermalog!''',
'    );',
'    apex_debug.message(''CAMUNDA_URL: '' || l_clob);',
'    l_json         := JSON_OBJECT_T.parse(l_clob);',
'    l_access_token := l_json.get_String(''access_token'');',
'    IF l_access_token IS NOT NULL THEN',
'        owa_cookie.send(''OA_A'',l_access_token, SYSDATE+1, ''/'');',
'    ELSE',
'        owa_cookie.send(''OA_A'','''', SYSDATE-30);',
'    END IF;',
'    ',
'END;'))
,p_process_when_type=>'NEVER'
);
end;
/
