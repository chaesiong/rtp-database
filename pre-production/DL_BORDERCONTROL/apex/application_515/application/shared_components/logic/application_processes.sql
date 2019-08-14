prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(70043467392714144)
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
 p_id=>wwv_flow_api.id(75281969630344377)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Boderpost Infos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    dl_bordercontrol.pkg_apex_util.get_location_data (p_remote_addr     => nvl(:AI_CLIENT_IP, owa_util.get_cgi_env(''REMOTE_ADDR''))',
'                                                     ,x_borderpost_id   => :AI_BORDERPOST_ID',
'                                                     ,x_borderpost_name => :AI_BORDERPOST_NAME',
'                                                     ,x_terminal_id     => :AI_TERMINAL_ID);',
'                                                                                                      ',
'EXCEPTION',
'    WHEN OTHERS',
'    THEN',
'        apex_error.add_error (',
'            p_message          => ''Your Terminal could not be registered'',',
'            p_display_location => apex_error.c_inline_in_notification);',
'END;'))
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(78003175969459316)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create and Truncate Collections'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''TM8_FELLOW_PASSENGERS'');',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''TM8_PERSON_IMAGE'');'))
);
end;
/
