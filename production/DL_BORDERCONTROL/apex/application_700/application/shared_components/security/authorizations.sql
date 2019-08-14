prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(75628207662254518)
,p_name=>'IS_PAGE_ALLOWED'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return USER_MANAGEMENT.pkg_authorization.APEX_IS_PAGE_ALLOWED;'
,p_error_message=>'You are not authorized to access this page!'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
