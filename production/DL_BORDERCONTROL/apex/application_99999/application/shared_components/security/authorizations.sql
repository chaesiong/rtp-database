prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(151535529381180161)
,p_name=>'IS_SUPERVISOR'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HA'')  = 1;'
,p_error_message=>'Supervisor Login required.'
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
