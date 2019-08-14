prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(70023425574464785)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET DATE RANGES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':AI_DATE_RANGE_FUTURE_LG := dl_bordercontrol.pkg_common.get_parameter(''DATE_RANGE_FUTURE_LG'');',
':AI_DATE_RANGE_FUTURE_SM := dl_bordercontrol.pkg_common.get_parameter(''DATE_RANGE_FUTURE_SM'');',
':AI_DATE_RANGE_PAST_LG   := dl_bordercontrol.pkg_common.get_parameter(''DATE_RANGE_PAST_LG'');',
':AI_DATE_RANGE_PAST_SM   := dl_bordercontrol.pkg_common.get_parameter(''DATE_RANGE_PAST_SM'');'))
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':AI_DATE_RANGE_FUTURE_LG IS NULL OR',
':AI_DATE_RANGE_FUTURE_SM IS NULL OR',
':AI_DATE_RANGE_PAST_LG   IS NULL OR',
':AI_DATE_RANGE_PAST_SM   IS NULL'))
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(58166699271549915)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET BORDERPOST INFORMATION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    dl_bordercontrol.pkg_apex_util.get_location_data (p_remote_addr     => owa_util.get_cgi_env(''REMOTE_ADDR'')',
'                                                     ,x_borderpost_id   => :AI_BORDERPOST_ID',
'                                                     ,x_borderpost_name => :AI_BORDERPOST_NAME',
'                                                     ,x_terminal_id     => :AI_TERMINAL_ID);',
'                                                     ',
'EXCEPTION',
'    WHEN OTHERS',
'    THEN',
'        apex_error.add_error (',
'            p_message          => ''Your Terminal could not be registered'',',
'            p_display_location => apex_error.c_inline_in_notification);',
'END;'))
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':AI_BORDERPOST_ID   IS NULL OR ',
':AI_BORDERPOST_NAME IS NULL OR ',
':AI_TERMINAL_ID     IS NULL'))
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(58166910793566140)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET DEFAULT SESSION VALUES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN    ',
'    ',
'    select owa_util.get_cgi_env(''REMOTE_ADDR'') ',
'    into :AI_TERMINAL_IP',
'    from dual;',
'    ',
'    select owa_util.get_cgi_env(''REMOTE_ADDR'') ',
'    into :AI_CGI_ENV_REMOTE_ADDR',
'    from dual;',
'    ',
'    select owa_util.get_cgi_env(''HTTP_USER_AGENT'') ',
'    into :AI_CGI_ENV_HTTP_USER_AGENT',
'    from dual;',
'    ',
'    select owa_util.get_cgi_env(''REMOTE_HOST'') ',
'    into :AI_CGI_ENV_REMOTE_HOST',
'    from dual;',
'    ',
'    select SYS_CONTEXT(''USERENV'',''SERVER_HOST'')',
'    into :AI_HTTP_HOST',
'    from dual;',
'    ',
'    --SELECT substr(utl_inaddr.get_host_name(:AI_TERMINAL_IP), 1, 15) into :AI_TERMINAL_NAME FROM dual;',
'    BEGIN',
'        SELECT substr(regexp_replace(utl_inaddr.get_host_name(:AI_TERMINAL_IP), ''\.[^0-9].*$''), 1, 15) into :AI_TERMINAL_NAME FROM dual;',
'    EXCEPTION WHEN OTHERS THEN',
'        IF sqlcode = -29257 THEN',
'            -- Could not resolve host name for IP',
'            :AI_TERMINAL_NAME := :AI_TERMINAL_IP;',
'        END IF;',
'    END;',
'',
'EXCEPTION  -- exception handlers begin   ',
'WHEN OTHERS THEN  -- handles all other errors',
'  :AI_TERMINAL_IP := null;',
'END;  -- exception handlers and block end here'))
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':AI_TERMINAL_IP             IS NULL OR',
':AI_CGI_ENV_REMOTE_ADDR     IS NULL OR',
':AI_CGI_ENV_HTTP_USER_AGENT IS NULL OR',
':AI_CGI_ENV_REMOTE_HOST     IS NULL OR',
':AI_TERMINAL_NAME           IS NULL'))
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
