prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(98315303766869307)
,p_computation_sequence=>10
,p_computation_item=>'AI_APP_VERSION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'dl_bordercontrol.pkg_common.get_parameter(''APP_VERSION'') || '' / '' || dl_bordercontrol.pkg_common.get_parameter(''APP_VERSION_VOA'')'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(98355052365001703)
,p_computation_sequence=>10
,p_computation_item=>'AI_BLACKLIST_SERVICE_URL'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'SELECT "VALUE" FROM DL_BORDERCONTROL."PARAMETERS" WHERE "NAME" = ''BLACKLIST_ADVANCED'''
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(146412507502921443)
,p_computation_sequence=>10
,p_computation_item=>'CAMUNDA_URL'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'return dl_blacklist.pkg_camunda_rest.get_camunda_server_url; '
);
end;
/
