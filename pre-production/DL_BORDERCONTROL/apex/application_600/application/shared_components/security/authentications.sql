prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(46794375363426892)
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
,p_reference_id=>12035545016454057
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(68526378970627944)
,p_name=>'APEX'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(68529610634749747)
,p_name=>'No Autharization'
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/