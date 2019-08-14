prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(44010040051063227)
,p_name=>'UM_VIEW_ACTIVITIES'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''UMA'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(53073817285351812)
,p_name=>'UM_DELETE_ADMINISTRATION'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''UMU'', i_grant_id=>''DEL'');'
,p_error_message=>'You have no permission to delete!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(58964392495783603)
,p_name=>'UM_IS_PAGE_ALLOWED'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_authorization.APEX_IS_PAGE_ALLOWED;'
,p_error_message=>'You are not authorized to access this page!'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(59022296074954726)
,p_name=>'UM_VIEW_ADMINISTRATION'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''UMU'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(59022491778956593)
,p_name=>'UM_VIEW_PARAMETERS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''UMP'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(59022745668961534)
,p_name=>'UM_VIEW_APEX_OBJECTS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''UMO'', i_grant_id=>''VW'');'
,p_error_message=>'You have no permission to view this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(59023141227969587)
,p_name=>'UM_EDIT_APEX_OBJECTS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''UMO'', i_grant_id=>''EDT'');',
''))
,p_error_message=>'You have no permission to edit in this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(59023368500969587)
,p_name=>'UM_EDIT_PARAMETERS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''UMP'', i_grant_id=>''EDT'');'
,p_error_message=>'You have no permission to edit in this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(59023663688969588)
,p_name=>'UM_EDIT_ADMINISTRATION'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_authorization.APEX_HAS_USER_PERMISSION(i_object_id => ''UMU'', i_grant_id=>''EDT'');'
,p_error_message=>'You have no permission to edit in this module!'
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
