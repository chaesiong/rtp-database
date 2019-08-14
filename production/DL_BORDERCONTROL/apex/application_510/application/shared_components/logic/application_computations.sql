prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(64220241522771919)
,p_computation_sequence=>10
,p_computation_item=>'AI_USERNAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT CASE',
'        WHEN first_name IS NOT NULL OR last_name IS NOT NULL',
'        THEN',
'          last_name || CASE WHEN first_name IS NOT NULL AND last_name IS NOT NULL THEN '', '' ELSE NULL END || first_name',
'        ELSE',
'          username',
'        END AS app_user_name',
'  FROM user_management.users',
' WHERE UPPER(username) = UPPER(:APP_USER)'))
,p_compute_when=>':AI_USERNAME IS NULL'
,p_compute_when_type=>'PLSQL_EXPRESSION'
,p_computation_error_message=>'Error: #SQLERRM#'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(62226048062915925)
,p_computation_sequence=>10
,p_computation_item=>'AI_OWNER'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'APEX_VOA'
,p_compute_when=>'AI_OWNER'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(68040742861785786)
,p_computation_sequence=>10
,p_computation_item=>'AI_DEFAULT_DATE_FORMAT'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT date_format ',
'  FROM apex_applications ',
' WHERE application_id = :APP_ID'))
,p_compute_when=>'AI_DEFAULT_DATE_FORMAT'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(69867091497475288)
,p_computation_sequence=>10
,p_computation_item=>'AI_APP_VERSION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'dl_bordercontrol.pkg_common.get_parameter(''APP_VERSION'') || '' / '' || dl_bordercontrol.pkg_common.get_parameter(''APP_VERSION_VOA'')'
);
end;
/
