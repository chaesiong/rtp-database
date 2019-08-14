prompt --application/shared_components/security/authorizations
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(27945944904365682)
,p_name=>'IsSuperUser'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'l_retval number ; ',
'',
'begin',
' select',
'        count(*)',
'    into l_retval',
'    from dl_user_management.user_role_rel urr',
'    left join dl_user_management.users u',
'        on u.id = urr.user_id',
'    right join dl_user_management.role_object_grant_rel rogr',
'        on rogr.role_id = urr.role_id',
'    right join dl_user_management.object_grant_rel ogr',
'        on ogr.id = rogr.object_grant_rel_id ',
'    where u.username = :APP_USER and ogr.object_id = ''BL_MSC'';',
'    ',
'    ',
'    if l_retval is not null and l_retval > 0  then',
'        return  true;',
'    else ',
'        return false;     ',
'    end if;',
'end;'))
,p_error_message=>'User is not allowed to access'
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
