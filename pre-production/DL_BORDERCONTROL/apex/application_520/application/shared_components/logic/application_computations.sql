prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(69167430084375878)
,p_computation_sequence=>10
,p_computation_item=>'AI_APP_VERSION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'dl_bordercontrol.pkg_common.get_parameter(''APP_VERSION'') || '' / '' ||  dl_bordercontrol.pkg_common.get_parameter(''APP_VERSION_FEENFINE'')'
,p_compute_when=>':AI_APP_VERSION IS NULL'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(69352244827042957)
,p_computation_sequence=>10
,p_computation_item=>'AI_DEFAULT_DATE_FORMAT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT date_format ',
'  FROM apex_applications ',
' WHERE application_id = :APP_ID'))
,p_compute_when=>':AI_DEFAULT_DATE_FORMAT IS NULL'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(70014434908387174)
,p_computation_sequence=>10
,p_computation_item=>'AI_OWNER'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'APEX_FEE_AND_FINE'
,p_compute_when=>':AI_OWNER IS NULL'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
end;
/
