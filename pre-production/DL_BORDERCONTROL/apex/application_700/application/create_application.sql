prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,700)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'DL_COMMON')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Dermalog Common Data')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'DL_COMMON_DATA')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'25F9480AA2915A4D2EC2E92A58A7E07098EEF966AD6597C4577F1D8FC94EDBBF'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en-us'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_date_format=>'DD/MM/YYYY'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(128756391666710826)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:Dermalog Common Data'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'1.0.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'AUTHORIZATION_ACTIVE'
,p_substitution_value_01=>'Y'
,p_last_updated_by=>'SUPERADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190730191308'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
