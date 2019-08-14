prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(92393613687434010)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(92609459105653370)
,p_name=>'DERMALOG_UM_AUTHENTICATION'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'user_management.pkg_man_users.apex_authenticate'
,p_attribute_04=>'user_management.pkg_man_users.post_logout'
,p_attribute_05=>'N'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'&LOGIN_URL.'
,p_post_auth_process=>'user_management.pkg_man_users.post_login'
,p_cookie_name=>'UM'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>28509756042082459
);
end;
/
