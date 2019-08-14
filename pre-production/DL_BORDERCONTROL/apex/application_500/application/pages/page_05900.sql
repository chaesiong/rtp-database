prompt --application/pages/page_05900
begin
wwv_flow_api.create_page(
 p_id=>5900
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Home Tools'
,p_page_mode=>'NORMAL'
,p_step_title=>'Home Tools'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#imagedata-thailady.js',
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
'#APP_IMAGES#BioScreenDisplayControl.js'))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'MSTEPHAN'
,p_last_upd_yyyymmddhh24miss=>'20180710151230'
);
end;
/
