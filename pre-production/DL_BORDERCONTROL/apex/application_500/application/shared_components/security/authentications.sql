prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(239983036751769626)
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
,p_reference_id=>36572496243847589
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(555081659911906175)
,p_name=>'DL_AD_LOGIN'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'DL_LDAP.AUTHENTICATE'
,p_attribute_05=>'N'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(563847144330049641)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(571433192780894593)
,p_name=>'LDAPServerPhnomPenhAirport'
,p_scheme_type=>'NATIVE_LDAP'
,p_attribute_01=>'10.10.0.10'
,p_attribute_02=>'389'
,p_attribute_03=>'NO_SSL'
,p_attribute_04=>'ou=users,dc=dbmain01,dc=khm20928'
,p_attribute_05=>'N'
,p_attribute_06=>'cn=%LDAP_USER%'
,p_attribute_08=>'STD'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(571758468602042901)
,p_name=>'Keine Authentifizierung'
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(842134134117280315)
,p_name=>'OpenLDAPServerGeneric'
,p_scheme_type=>'NATIVE_LDAP'
,p_attribute_01=>'&AI_PARAMETER_OPENLDAPHOST.'
,p_attribute_02=>'389'
,p_attribute_03=>'NO_SSL'
,p_attribute_04=>'&AI_PARAMETER_OPENLDAPBASE.'
,p_attribute_05=>'N'
,p_attribute_06=>'cn=%LDAP_USER%'
,p_attribute_08=>'STD'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure checkForDuplicateLogin',
'as',
'v_cnt number := 0;',
'begin',
'	SELECT COUNT(*) INTO v_cnt FROM (',
'		SELECT username FROM wwv_flow_sessions$ WHERE workspace_user_id IS NULL AND username = :APP_USER AND ROWNUM <= 2',
'	);',
'	if v_cnt > 1 then',
'		:AI_IS_DUPLICATE_SESSION := ''1'';',
'	end if;',
'end;',
''))
,p_invalid_session_type=>'LOGIN'
,p_post_auth_process=>'checkForDuplicateLogin'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(843873133715584463)
,p_name=>'LDAPLocalhost'
,p_scheme_type=>'NATIVE_LDAP'
,p_attribute_01=>'10.120.30.41'
,p_attribute_02=>'389'
,p_attribute_03=>'NO_SSL'
,p_attribute_04=>'dc=dbmain01,dc=phnom-penh,dc=khm20928'
,p_attribute_05=>'N'
,p_attribute_06=>'cn=%LDAP_USER%'
,p_attribute_08=>'STD'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
