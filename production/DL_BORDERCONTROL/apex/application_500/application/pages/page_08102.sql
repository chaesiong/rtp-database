prompt --application/pages/page_08102
begin
wwv_flow_api.create_page(
 p_id=>8102
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'User Statistics'
,p_page_mode=>'NORMAL'
,p_step_title=>'User Statistics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'User Statistics'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P8102_TOP10_MAX_LOV_CONTAINER'').width(''30%'');',
'/*',
'$(document).ready(function () {',
'  $("#P8102_TOP10_MAX_LOV").change(function () {',
'    $("#top_10_chart").load();',
'  });',
'});',
'*/'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20171110161447'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882377069891023380)
,p_plug_name=>'User Statistics'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(563823021746049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882376768848023376)
,p_plug_name=>'Page Views'
,p_parent_plug_id=>wwv_flow_api.id(882377069891023380)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882375423547023363)
,p_plug_name=>'Charts_ViewsInDays'
,p_parent_plug_id=>wwv_flow_api.id(882376768848023376)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(563824202832049618)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882375856746023367)
,p_plug_name=>'Page views last 2 days'
,p_parent_plug_id=>wwv_flow_api.id(882375423547023363)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882375906068023368)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N::N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'::::::::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>10
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882376022107023369)
,p_chart_id=>wwv_flow_api.id(882375906068023368)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.GET_PAGEVIEWSINLAST(''LAST_48_HOURS'');'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882376077486023370)
,p_plug_name=>'Page views last 7 days'
,p_parent_plug_id=>wwv_flow_api.id(882375423547023363)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882376219404023371)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N::N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'::::::::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>10
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882376335184023372)
,p_chart_id=>wwv_flow_api.id(882376219404023371)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.GET_PAGEVIEWSINLAST(''LAST_7_DAYS'');'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882376398962023373)
,p_plug_name=>'Page views last 14 days'
,p_parent_plug_id=>wwv_flow_api.id(882375423547023363)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882376472259023374)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N::N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'::::::::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>10
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882376608746023375)
,p_chart_id=>wwv_flow_api.id(882376472259023374)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.GET_PAGEVIEWSINLAST(''LAST_14_DAYS'');'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882377406255023383)
,p_plug_name=>'Page views last 1 day'
,p_parent_plug_id=>wwv_flow_api.id(882375423547023363)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882377480996023384)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N::N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'::::::::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Solid'
,p_bgcolor1=>'#FFFFFF'
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>10
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882377571178023385)
,p_chart_id=>wwv_flow_api.id(882377480996023384)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.GET_PAGEVIEWSINLAST(''LAST_24_HOURS'');'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(885239541889978192)
,p_plug_name=>'Charts_ViewsInHours'
,p_parent_plug_id=>wwv_flow_api.id(882376768848023376)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(563824202832049618)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882374070799023350)
,p_plug_name=>'Page views last 15 min'
,p_parent_plug_id=>wwv_flow_api.id(885239541889978192)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882374218836023351)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME:N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Solid'
,p_bgcolor1=>'#FFFFFF'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>10
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882374319205023352)
,p_chart_id=>wwv_flow_api.id(882374218836023351)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return BC_CAMBODIA_PROD.TEST_KS.GET_PAGEVIEWSINLAST(''LAST_15_MINUTES'');',
''))
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882374431212023353)
,p_plug_name=>'Page views last 1 hour'
,p_parent_plug_id=>wwv_flow_api.id(885239541889978192)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882374470744023354)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>':::N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>10
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882374597367023355)
,p_chart_id=>wwv_flow_api.id(882374470744023354)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.GET_PAGEVIEWSINLAST(''LAST_1_HOUR'');'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882374739089023356)
,p_plug_name=>'Page views last 2 hour'
,p_parent_plug_id=>wwv_flow_api.id(885239541889978192)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882374786775023357)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>':::N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>10
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882374885596023358)
,p_chart_id=>wwv_flow_api.id(882374786775023357)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.GET_PAGEVIEWSINLAST(''LAST_2_HOURS'');'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(885215490067439652)
,p_plug_name=>'Page views last 30 min'
,p_parent_plug_id=>wwv_flow_api.id(885239541889978192)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(885215874814439655)
,p_default_chart_type=>'Horizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_name=>'chart_607860705654480112'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:N:N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>10
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_grid_labels_font=>'Tahoma:10:#000000'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(885216302856439660)
,p_chart_id=>wwv_flow_api.id(885215874814439655)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.GET_PAGEVIEWSINLAST(''LAST_30_MINUTES'');'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882377314988023382)
,p_plug_name=>'Mix'
,p_parent_plug_id=>wwv_flow_api.id(882377069891023380)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(563824202832049618)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882375494198023364)
,p_plug_name=>'Top pages with validation errors'
,p_parent_plug_id=>wwv_flow_api.id(882377314988023382)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882375570083023365)
,p_default_chart_type=>'StackedHorizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::Default:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME:N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Solid'
,p_bgcolor1=>'#FFFFFF'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>5
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882375728766023366)
,p_chart_id=>wwv_flow_api.id(882375570083023365)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return BC_CAMBODIA_PROD.TEST_KS.Get_ErrorPages(:P8102_TOP10_MAX_LOV)',
''))
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>100
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882377765112023386)
,p_plug_name=>'Top pages with validation errors, sorted by user'
,p_parent_plug_id=>wwv_flow_api.id(882377314988023382)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882377820659023387)
,p_default_chart_type=>'Stacked2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:N::N::::None:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:N:N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Solid'
,p_bgcolor1=>'#FFFFFF'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>5
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882377879714023388)
,p_chart_id=>wwv_flow_api.id(882377820659023387)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.Get_ErrorUser(:P8102_TOP10_MAX_LOV)'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(882377981730023389)
,p_plug_name=>'Most viewed Pages'
,p_region_name=>'top_10'
,p_parent_plug_id=>wwv_flow_api.id(882377314988023382)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(882378110288023390)
,p_default_chart_type=>'StackedHorizontal2DColumn'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_height=>200
,p_display_attr=>':H:N:V:X::N::::None:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:N:N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Solid'
,p_bgcolor1=>'#FFFFFF'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'Y'
,p_async_time=>5
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'::'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(882378201496023391)
,p_chart_id=>wwv_flow_api.id(882378110288023390)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>'return BC_CAMBODIA_PROD.TEST_KS.Get_MostViewedPages(:P8102_TOP10_MAX_LOV);'
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(882378465336023393)
,p_name=>'P8102_TOP10_MAX_LOV'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(882377314988023382)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Max Columns'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT ROWNUM label , ROWNUM value FROM',
'    (',
'      SELECT DISTINCT PAGE_ID',
'      from APEX_WORKSPACE_ACTIVITY_LOG',
'        where ERROR_ON_COMPONENT_TYPE=''APEX_APPLICATION_PAGE_VAL''',
'    );'))
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_tag_css_classes=>'.label{width:10px;}'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
end;
/
