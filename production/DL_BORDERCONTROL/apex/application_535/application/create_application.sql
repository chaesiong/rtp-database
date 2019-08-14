prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,535)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'DL_BLACKLIST')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'BBS - Biometric Blacklist System')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'BBS')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'9039DE403A45DFCA0E3A598F401C7BE0825AA292A74A3E8EEAB519F919F6449C'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'BROWSER'
,p_date_format=>'DD/MM/YYYY'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(23845141340882761)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:BBS - Biometric Blacklist System'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'Version &AI_VERSION./&AI_VERSION_BBS.                   '
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'AUTHORIZATION'
,p_substitution_value_01=>'N'
,p_last_updated_by=>'SUPERADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190717192012'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>39
,p_ui_type_name => null
);
end;
/