prompt --application/pages/page_08006
begin
wwv_flow_api.create_page(
 p_id=>8006
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'License Information'
,p_page_mode=>'NORMAL'
,p_step_title=>'License Information'
,p_step_sub_title=>'License Information'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
'#APP_IMAGES#BioScreenDisplayControl.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#APP_IMAGES#BioScreenMaintenance.js'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-labelContainer {',
'    text-align: left;',
'}'))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20191118215148'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9457938623953395570)
,p_plug_name=>'Transaction Data Analysis'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>72
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9457938682234395571)
,p_name=>'Data'
,p_parent_plug_id=>wwv_flow_api.id(9457938623953395570)
,p_template=>wwv_flow_api.id(563820889302049617)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dates',
'      ,day_movements',
'      ,total_movements',
'      ,day_abis',
'      ,total_abis',
'      ,day_borderdocuments',
'      ,total_borderdocuments',
'      ,remaining_face',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4700012610120854003)
,p_query_column_id=>1
,p_column_alias=>'DATES'
,p_column_display_sequence=>1
,p_column_heading=>'Dates'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4700013036273854009)
,p_query_column_id=>2
,p_column_alias=>'DAY_MOVEMENTS'
,p_column_display_sequence=>2
,p_column_heading=>'Movements per Day'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4700013416089854009)
,p_query_column_id=>3
,p_column_alias=>'TOTAL_MOVEMENTS'
,p_column_display_sequence=>3
,p_column_heading=>'Movements Total'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4700013846053854012)
,p_query_column_id=>4
,p_column_alias=>'DAY_ABIS'
,p_column_display_sequence=>4
,p_column_heading=>'ABIS per Day'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4700014272303854013)
,p_query_column_id=>5
,p_column_alias=>'TOTAL_ABIS'
,p_column_display_sequence=>5
,p_column_heading=>'ABIS Total'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4700014628309854013)
,p_query_column_id=>6
,p_column_alias=>'DAY_BORDERDOCUMENTS'
,p_column_display_sequence=>6
,p_column_heading=>'Borderdocuments per Day'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4700015031146854014)
,p_query_column_id=>7
,p_column_alias=>'TOTAL_BORDERDOCUMENTS'
,p_column_display_sequence=>7
,p_column_heading=>'Borderdocuments Total'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4700015496766854014)
,p_query_column_id=>8
,p_column_alias=>'REMAINING_FACE'
,p_column_display_sequence=>8
,p_column_heading=>'Remaining Licenses'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9457939635920395580)
,p_plug_name=>'Totals'
,p_parent_plug_id=>wwv_flow_api.id(9457938623953395570)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(dates, ''dd.mm.yyyy'')',
'from dl_bordercontrol.mv_transaction_data_analysis'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(4700016187489854094)
,p_region_id=>wwv_flow_api.id(9457939635920395580)
,p_chart_type=>'line'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_legend_rendered=>'on'
,p_legend_title=>'Legend'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(4700018870810854218)
,p_chart_id=>wwv_flow_api.id(4700016187489854094)
,p_seq=>10
,p_name=>'Movements'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(dates, ''yyyy.mm.dd'')',
'      ,total_movements',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)'))
,p_items_value_column_name=>'TOTAL_MOVEMENTS'
,p_items_label_column_name=>'TO_CHAR(DATES,''YYYY.MM.DD'')'
,p_items_short_desc_column_name=>'TOTAL_MOVEMENTS'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(4700019431929854218)
,p_chart_id=>wwv_flow_api.id(4700016187489854094)
,p_seq=>20
,p_name=>'Borderdocuments'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(dates, ''yyyy.mm.dd'')',
'      ,total_borderdocuments',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)'))
,p_items_value_column_name=>'TOTAL_BORDERDOCUMENTS'
,p_items_label_column_name=>'TO_CHAR(DATES,''YYYY.MM.DD'')'
,p_items_short_desc_column_name=>'TOTAL_BORDERDOCUMENTS'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(4700017710379854214)
,p_chart_id=>wwv_flow_api.id(4700016187489854094)
,p_seq=>30
,p_name=>'ABIS'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(dates, ''yyyy.mm.dd'')',
'      ,total_abis',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)'))
,p_items_value_column_name=>'TOTAL_ABIS'
,p_items_label_column_name=>'TO_CHAR(DATES,''YYYY.MM.DD'')'
,p_items_short_desc_column_name=>'TOTAL_ABIS'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(4700018255016854217)
,p_chart_id=>wwv_flow_api.id(4700016187489854094)
,p_seq=>40
,p_name=>'Remaining Licenses'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(dates, ''yyyy.mm.dd'')',
'      ,remaining_face',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)'))
,p_items_value_column_name=>'REMAINING_FACE'
,p_items_label_column_name=>'TO_CHAR(DATES,''YYYY.MM.DD'')'
,p_items_short_desc_column_name=>'REMAINING_FACE'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(4700016502339854135)
,p_chart_id=>wwv_flow_api.id(4700016187489854094)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-short'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(4700017134861854138)
,p_chart_id=>wwv_flow_api.id(4700016187489854094)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9457940410991395588)
,p_plug_name=>'Daily Increments'
,p_parent_plug_id=>wwv_flow_api.id(9457938623953395570)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dates',
'      ,day_movements',
'      ,total_movements',
'      ,day_abis',
'      ,total_abis',
'      ,day_borderdocuments',
'      ,total_borderdocuments',
'      ,remaining_face',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)',
''))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(4700020393028854220)
,p_region_id=>wwv_flow_api.id(9457940410991395588)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_legend_rendered=>'on'
,p_legend_title=>'Legend'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(4700022083793854226)
,p_chart_id=>wwv_flow_api.id(4700020393028854220)
,p_seq=>10
,p_name=>'Movements'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(dates, ''yyyy.mm.dd'')',
'      ,day_movements',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)'))
,p_items_value_column_name=>'DAY_MOVEMENTS'
,p_items_label_column_name=>'TO_CHAR(DATES,''YYYY.MM.DD'')'
,p_items_short_desc_column_name=>'DAY_MOVEMENTS'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(4700022657881854227)
,p_chart_id=>wwv_flow_api.id(4700020393028854220)
,p_seq=>20
,p_name=>'Borderdocuments'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(dates, ''yyyy.mm.dd'')',
'      ,day_borderdocuments',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)'))
,p_items_value_column_name=>'DAY_BORDERDOCUMENTS'
,p_items_label_column_name=>'TO_CHAR(DATES,''YYYY.MM.DD'')'
,p_items_short_desc_column_name=>'DAY_BORDERDOCUMENTS'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(4700023213608854227)
,p_chart_id=>wwv_flow_api.id(4700020393028854220)
,p_seq=>30
,p_name=>'ABIS'
,p_data_source_type=>'SQL_QUERY'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(dates, ''yyyy.mm.dd'')',
'      ,day_abis',
'from dl_bordercontrol.mv_transaction_data_analysis',
'where dates > trunc(sysdate - 30)'))
,p_items_value_column_name=>'DAY_ABIS'
,p_items_label_column_name=>'TO_CHAR(DATES,''YYYY.MM.DD'')'
,p_items_short_desc_column_name=>'DAY_ABIS'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(4700020862288854224)
,p_chart_id=>wwv_flow_api.id(4700020393028854220)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'date-short'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(4700021420921854224)
,p_chart_id=>wwv_flow_api.id(4700020393028854220)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9531315630602458347)
,p_plug_name=>'License Information'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>52
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<h2>License Information</h>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9614108185713141721)
,p_plug_name=>'Dynamic Object List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>42
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<script>v_display_objects = []'');',
'for c_row in (select object_id, object_name, decode(delete_flag, 0, ''false'', ''true'') delete_flag, decode(is_default, 0, ''false'', ''true'') is_default, decode(is_video, 0, ''false'', ''true'') is_video from display_objects) loop',
'    htp.p(''v_display_objects.push({object_id:'' || c_row.object_id || '',object_name:"'' || c_row.object_name || ''",delete_flag:'' || c_row.delete_flag || '',is_default:'' || c_row.is_default || '',is_video:'' || c_row.is_video || ''});'');',
'end loop;',
'htp.p(''</script>'');',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9614108716412141726)
,p_plug_name=>'Product License Certificate'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>62
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4700024774566854233)
,p_name=>'P8006_SYSTEM_TIME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9614108716412141726)
,p_prompt=>'System Time:'
,p_format_mask=>'fmDay, fmDD fmMonth, YYYY'
,p_source=>'Select to_char(sysdate, ''Day'')||'', ''|| to_char(sysdate, ''Month DD, YYYY'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'t-Form-fieldContainer--large:margin-right-none'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4700025140011854234)
,p_name=>'P8006_LICENSE_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9614108716412141726)
,p_prompt=>'License Project:'
,p_source=>'RTP Bio Project'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4700025533586854234)
,p_name=>'P8006_LICENSE_ABIS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9614108716412141726)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Remaining ABIS licenses:'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    trim(to_char(MIN(LREM), ''999G999G999G999G999G999G990'')) LICENSE_COUNT_INFO FROM',
'(',
'    SELECT',
'    least(coalesce(LM.REMAINING_FACE, 0), coalesce(LM.REMAINING_FINGER, 0)) LREM',
'    FROM DL_BORDERCONTROL.LICENSE_MONITORING LM',
'    WHERE LM.ABIS_SYSTEM = ''BLACKLIST''',
'    AND CHECK_TIME = (SELECT MAX(CHECK_TIME) FROM DL_BORDERCONTROL.LICENSE_MONITORING WHERE ABIS_SYSTEM = ''BLACKLIST'')',
'    UNION ALL',
'    SELECT',
'    least(coalesce(LM.REMAINING_FACE, 0), coalesce(LM.REMAINING_FINGER, 0)) LREM',
'    FROM DL_BORDERCONTROL.LICENSE_MONITORING LM',
'    WHERE LM.ABIS_SYSTEM = ''MOVEMENTS''',
'    AND CHECK_TIME = (SELECT MAX(CHECK_TIME) FROM DL_BORDERCONTROL.LICENSE_MONITORING WHERE ABIS_SYSTEM = ''MOVEMENTS'')',
')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4700025915497854235)
,p_name=>'P8006_CUSTOMER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9614108716412141726)
,p_prompt=>'Customer:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4700026340870854235)
,p_name=>'P8006_LICENSE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(9614108716412141726)
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="height:570px"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.Get_APP_Static_File_Content(''License.png'') from dual'
);
end;
/
