prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(563842840254049631)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(577274472604689777)
,p_default_dialog_template=>wwv_flow_api.id(563808839563049612)
,p_error_template=>wwv_flow_api.id(563806730438049611)
,p_printer_friendly_template=>wwv_flow_api.id(563810118173049612)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(563806730438049611)
,p_default_button_template=>wwv_flow_api.id(563841742376049627)
,p_default_region_template=>wwv_flow_api.id(563820889302049617)
,p_default_chart_template=>wwv_flow_api.id(563820889302049617)
,p_default_form_template=>wwv_flow_api.id(563820889302049617)
,p_default_reportr_template=>wwv_flow_api.id(563820889302049617)
,p_default_tabform_template=>wwv_flow_api.id(563820889302049617)
,p_default_wizard_template=>wwv_flow_api.id(563820889302049617)
,p_default_menur_template=>wwv_flow_api.id(563824202832049618)
,p_default_listr_template=>wwv_flow_api.id(563820889302049617)
,p_default_irr_template=>wwv_flow_api.id(563820435896049617)
,p_default_report_template=>wwv_flow_api.id(563829676711049621)
,p_default_label_template=>wwv_flow_api.id(563841216965049626)
,p_default_menu_template=>wwv_flow_api.id(563842240471049627)
,p_default_calendar_template=>wwv_flow_api.id(563842329675049627)
,p_default_list_template=>wwv_flow_api.id(563836738382049624)
,p_default_nav_list_template=>wwv_flow_api.id(563840125570049625)
,p_default_top_nav_list_temp=>wwv_flow_api.id(563840125570049625)
,p_default_side_nav_list_temp=>wwv_flow_api.id(563839104391049625)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(563812934294049615)
,p_default_dialogr_template=>wwv_flow_api.id(563812786985049615)
,p_default_option_label=>wwv_flow_api.id(563841216965049626)
,p_default_required_label=>wwv_flow_api.id(563841465920049626)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(563839039684049624)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.1/')
,p_files_version=>73
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
 p_id=>wwv_flow_api.id(564130103967429302)
,p_theme_id=>11
,p_theme_name=>'Green Spring'
,p_theme_internal_name=>'GREEN_SPRING'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_reference_id=>1990997464286118149
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(564117443174429289)
,p_error_template=>wwv_flow_api.id(564116616640429289)
,p_printer_friendly_template=>wwv_flow_api.id(564117819742429290)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(564115777655429286)
,p_default_button_template=>wwv_flow_api.id(564128952587429297)
,p_default_region_template=>wwv_flow_api.id(564121807642429292)
,p_default_chart_template=>wwv_flow_api.id(564119984389429292)
,p_default_form_template=>wwv_flow_api.id(564120246928429292)
,p_default_reportr_template=>wwv_flow_api.id(564121807642429292)
,p_default_tabform_template=>wwv_flow_api.id(564121807642429292)
,p_default_wizard_template=>wwv_flow_api.id(564122981778429293)
,p_default_menur_template=>wwv_flow_api.id(564119181816429291)
,p_default_listr_template=>wwv_flow_api.id(564119841128429292)
,p_default_irr_template=>wwv_flow_api.id(564120992769429292)
,p_default_report_template=>wwv_flow_api.id(564124422697429294)
,p_default_label_template=>wwv_flow_api.id(564128659951429297)
,p_default_menu_template=>wwv_flow_api.id(564129388458429298)
,p_default_calendar_template=>wwv_flow_api.id(564129591316429299)
,p_default_list_template=>wwv_flow_api.id(564127610367429296)
,p_default_option_label=>wwv_flow_api.id(564128659951429297)
,p_default_required_label=>wwv_flow_api.id(564128805932429297)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(11),'#IMAGE_PREFIX#themes/theme_11/')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
);
end;
/
