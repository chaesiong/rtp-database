prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(92881041167413874)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=GLOBAL_DIALOGS:LOGIN_DESKTOP:&SESSION.::NO:RP,111:P111_REFERING_APP:&APP_ID.'
,p_theme_style_by_user_pref=>false
,p_navigation_list_id=>wwv_flow_api.id(92828868562413534)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(92868204728413755)
,p_nav_list_template_options=>'#DEFAULT#'
,p_css_file_urls=>'#WORKSPACE_IMAGES#vita_style_fixes.css'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(92880957869413871)
,p_nav_bar_list_template_id=>wwv_flow_api.id(92866646914413751)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
