prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(99284893088972448)
,p_process_sequence=>1
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Show notification if pwd expires'
,p_process_sql_clob=>'dl_user_management.pkg_man_users.check_pwd_expired();'
,p_process_when=>'apex_util.get_preference(''PWD_EXP_NOTIFICATION'') != v(''APP_SESSION'') or apex_util.get_preference(''PWD_EXP_NOTIFICATION'') is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(63546509060318999)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DUMMY'
,p_process_sql_clob=>'htp.prn(''OK'');'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
end;
/
