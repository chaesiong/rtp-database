prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,500)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'DL_BORDERCONTROL')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'BmBS - Biometric Bordercontrol System')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'BMBS')
,p_page_view_logging=>'NO'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'07DDC3DA776E61A6F5B9DD9D8E90A9F3C96146C012A1F925BFDD539D21C10647'
,p_bookmark_checksum_function=>'SH1'
,p_on_max_session_timeout_url=>'#LOGOUT_URL#'
,p_on_max_idle_timeout_url=>'#LOGOUT_URL#'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en-us'
,p_flow_language_derived_from=>'BROWSER'
,p_date_format=>'DD/MM/YYYY'
,p_timestamp_format=>'DD/MM/YYYY HH24:MI'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(239983036751769626)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:BmBS - Biometric Bordercontrol System'
,p_favicons=>'<link rel="shortcut icon" href="#APP_IMAGES#Immigration_Thai_Thumb.png"><link rel="icon" sizes="16x16" href="#APP_IMAGES#Immigration_Thai_Thumb.png">'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'V '
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'T'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_03=>'AUTHORIZATION_ACTIVE'
,p_substitution_value_03=>'Y'
,p_substitution_string_04=>'LDAP_HOST'
,p_substitution_value_04=>'shhtdc004.dermalog.testing'
,p_substitution_string_05=>'LDAP_PORT'
,p_substitution_value_05=>'389'
,p_substitution_string_06=>'LDAP_BASE'
,p_substitution_value_06=>'OU=TESTING, DC=dermalog, DC=testing'
,p_substitution_string_07=>'LDAP_DOMAIN'
,p_substitution_value_07=>'DHH-TESTING\'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20191115234356'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>1904
,p_ui_type_name => null
);
end;
/
