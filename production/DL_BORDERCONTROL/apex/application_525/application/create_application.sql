prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,525)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'DL_BORDERCONTROL')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Extend Stay')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'EXTSTAY')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'FC25E00043C188F540122580B142988AF2C724AC1608F5EA11AF667E426E54FB'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'BROWSER'
,p_date_format=>'DD/MM/YYYY'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(102718840297962983)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:Extend Stay'
,p_favicons=>'<link rel="shortcut icon" href="#APP_IMAGES#favicon.ico">'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'&AI_APP_VERSION.'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181107114551'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>295
,p_ui_type_name => null
);
end;
/
