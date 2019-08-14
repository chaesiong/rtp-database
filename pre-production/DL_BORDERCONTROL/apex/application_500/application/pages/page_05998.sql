prompt --application/pages/page_05998
begin
wwv_flow_api.create_page(
 p_id=>5998
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Browse Statistics'
,p_page_mode=>'NORMAL'
,p_step_title=>'Statistics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Browse Statistics'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code_onload=>'$("#R302711050818397060_control_panel").hide();'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_height=>'600'
,p_dialog_width=>'1000'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180525111648'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(936507744570185872)
,p_plug_name=>'Statistics Information'
,p_icon_css_classes=>'fa-bar-chart'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this Page to select a statistic you need. Each statistic can be customized with global parameters that are on the right side of each page.',
''))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(936508100070185878)
,p_plug_name=>'Statistics'
,p_component_template_options=>'u-colors:t-Cards--displayIcons:t-Cards--4cols:t-Cards--featured:t-Cards--animColorFill'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(936501093518137549)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(563834594933049623)
,p_plug_query_row_template=>1
);
end;
/
