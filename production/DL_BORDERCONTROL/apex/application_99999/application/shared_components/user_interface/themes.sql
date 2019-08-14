prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(92383945318433929)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(92346431152433693)
,p_default_dialog_template=>wwv_flow_api.id(92344533253433677)
,p_error_template=>wwv_flow_api.id(92343242614433675)
,p_printer_friendly_template=>wwv_flow_api.id(92346431152433693)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(92343242614433675)
,p_default_button_template=>wwv_flow_api.id(92382587160433869)
,p_default_region_template=>wwv_flow_api.id(92356736826433749)
,p_default_chart_template=>wwv_flow_api.id(92356736826433749)
,p_default_form_template=>wwv_flow_api.id(92356736826433749)
,p_default_reportr_template=>wwv_flow_api.id(92356736826433749)
,p_default_tabform_template=>wwv_flow_api.id(92356736826433749)
,p_default_wizard_template=>wwv_flow_api.id(92356736826433749)
,p_default_menur_template=>wwv_flow_api.id(92361237110433757)
,p_default_listr_template=>wwv_flow_api.id(92356736826433749)
,p_default_irr_template=>wwv_flow_api.id(92356180518433747)
,p_default_report_template=>wwv_flow_api.id(92369713901433801)
,p_default_label_template=>wwv_flow_api.id(92382062454433857)
,p_default_menu_template=>wwv_flow_api.id(92383155952433874)
,p_default_calendar_template=>wwv_flow_api.id(92383161819433883)
,p_default_list_template=>wwv_flow_api.id(92378472941433838)
,p_default_nav_list_template=>wwv_flow_api.id(92380736413433847)
,p_default_top_nav_list_temp=>wwv_flow_api.id(92380736413433847)
,p_default_side_nav_list_temp=>wwv_flow_api.id(92380652922433846)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(92350242746433731)
,p_default_dialogr_template=>wwv_flow_api.id(92349780431433729)
,p_default_option_label=>wwv_flow_api.id(92382062454433857)
,p_default_required_label=>wwv_flow_api.id(92382317437433857)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(92377833694433835)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.1/')
,p_files_version=>62
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#HAMMERJS_URL#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/modernizr-custom#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(93717441508013931)
,p_theme_id=>500
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>32314018915479782
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(93627391454013535)
,p_default_dialog_template=>wwv_flow_api.id(93643790115013623)
,p_error_template=>wwv_flow_api.id(93635536291013608)
,p_printer_friendly_template=>wwv_flow_api.id(93647484416013639)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(93635536291013608)
,p_default_button_template=>wwv_flow_api.id(93712572537013841)
,p_default_region_template=>wwv_flow_api.id(93671148585013743)
,p_default_chart_template=>wwv_flow_api.id(93671148585013743)
,p_default_form_template=>wwv_flow_api.id(93671148585013743)
,p_default_reportr_template=>wwv_flow_api.id(93671148585013743)
,p_default_tabform_template=>wwv_flow_api.id(93671148585013743)
,p_default_wizard_template=>wwv_flow_api.id(93671148585013743)
,p_default_menur_template=>wwv_flow_api.id(93678079701013757)
,p_default_listr_template=>wwv_flow_api.id(93671148585013743)
,p_default_irr_template=>wwv_flow_api.id(93670033455013741)
,p_default_report_template=>wwv_flow_api.id(93689194369013782)
,p_default_label_template=>wwv_flow_api.id(93712140926013834)
,p_default_menu_template=>wwv_flow_api.id(93713427004013844)
,p_default_calendar_template=>wwv_flow_api.id(93713544857013849)
,p_default_list_template=>wwv_flow_api.id(93703192438013809)
,p_default_nav_list_template=>wwv_flow_api.id(93710019249013823)
,p_default_top_nav_list_temp=>wwv_flow_api.id(93710019249013823)
,p_default_side_nav_list_temp=>wwv_flow_api.id(93707980665013819)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(93654175451013694)
,p_default_dialogr_template=>wwv_flow_api.id(93654002493013694)
,p_default_option_label=>wwv_flow_api.id(93712140926013834)
,p_default_required_label=>wwv_flow_api.id(93712356229013835)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(93707827551013817)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(500),'#IMAGE_PREFIX#themes/theme_42/1.0/')
,p_files_version=>155
,p_custom_icon_prefix_class=>'fa'
,p_custom_library_file_urls=>'#WORKSPACE_IMAGES#flaticon.css'
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#tooltipManager#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/modernizr-custom#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.0/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#',
'',
'#APP_IMAGES#jquery.initialize.min.js',
'',
'#WORKSPACE_IMAGES#shortcut.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#',
'#WORKSPACE_IMAGES#css/waitPopupGreyBackground.css',
'#APP_IMAGES#css/background.css'))
);
end;
/
