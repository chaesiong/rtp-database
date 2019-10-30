prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,1000)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEX_USER_MANAGEMENT')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Dermalog User Management')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'APEX_USER_MANAGEMENT')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'5A443CF9F78DD07675991FE6A9EAB9F9750D4D03690F94E2610358E9022DA860'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'BROWSER'
,p_date_format=>'DD/MM/YYYY'
,p_date_time_format=>'DD/MM/YYYY hh24:mi:ss'
,p_timestamp_format=>'DD/MM/YYYY hh24:mi:ssXFF'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(60640137431091892)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:DERMALOG User Management'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'Release-2.0.10'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_vpd=>'pkg_man_users.POST_INIT_NEW_DB_SESSION;'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'AUTHORIZATION_ACTIVE'
,p_substitution_value_01=>'Y'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190912020119'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>7
,p_ui_type_name => null
);
end;
/
