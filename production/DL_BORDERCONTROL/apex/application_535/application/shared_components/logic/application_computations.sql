prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(42788485132931241)
,p_computation_sequence=>10
,p_computation_item=>'AI_VERSION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'DL_BORDERCONTROL.PKG_COMMON.GET_PARAMETER(''RELEASE_VERSION'');'
,p_compute_when=>':AI_VERSION IS NULL'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(42791821411995336)
,p_computation_sequence=>10
,p_computation_item=>'AI_VERSION_BBS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'DL_BORDERCONTROL.PKG_COMMON.GET_PARAMETER(''APP_VERSION_BBS'')'
,p_compute_when=>':AI_VERSION_BBS is NULL'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(72170845625746584)
,p_computation_sequence=>10
,p_computation_item=>'CAMUNDA_URL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'return dl_blacklist.pkg_camunda_rest.get_camunda_server_url;'
,p_compute_when=>':CAMUNDA_URL IS NULL'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
end;
/
