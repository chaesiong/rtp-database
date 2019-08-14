prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(186479920031388043)
,p_name=>'IS_PAGE_ALLOWED'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return USER_MANAGEMENT.pkg_authorization.APEX_IS_PAGE_ALLOWED;'
,p_error_message=>'You are not authorized to access this page!'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(187024943101751895)
,p_name=>'VIEW_TOOLS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return dl_user_management.pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''TOOLS'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(187190241436598134)
,p_name=>'VIEW_ADMINISTRATION'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return USER_MANAGEMENT.pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''ADMINSTRATION'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(187358305584845564)
,p_name=>'VIEW_STATISTICS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return USER_MANAGEMENT.pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''STATISTICS'', i_grant_id => ''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(187545421665112046)
,p_name=>'VIEW_BLACKLIST'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return USER_MANAGEMENT.pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''BLACKLIST'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(187552975563427368)
,p_name=>'VIEW_REPORTING'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return USER_MANAGEMENT.pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''REPORTING'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(187553157428471938)
,p_name=>'VIEW_INCIDENT'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return USER_MANAGEMENT.pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''INCIDENT'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(187612823300390002)
,p_name=>'VIEW_PASSPORT_CHECK'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return USER_MANAGEMENT.pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''PASSPORT_CHECK'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
