prompt --application/pages/page_01000
begin
wwv_flow_api.create_page(
 p_id=>1000
,p_user_interface_id=>wwv_flow_api.id(68526215125627868)
,p_name=>'Traveler In/Out Statistics'
,p_page_mode=>'NORMAL'
,p_step_title=>'Travaler In/Out Statistics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Travaler In/Out Statistics'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.maltetest {',
'    font-size: 6px;',
'}',
'',
'body.t-PageBody.js-rightCollapsed .t-Body-actions {',
'    -webkit-transform: translate3d(300px, 0, 0);',
'    -ms-transform: translate(300px);',
'    transform: translate3d(300px, 0, 0);',
'}',
'',
'.t-Body .t-Body-actions {',
'    width: 200px;',
'}',
'',
'#IR td[headers=MONTH]{min-width:10px}',
'',
''))
,p_step_template=>wwv_flow_api.id(68488783085627510)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(46598465620221197)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180807161623'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45574257335896124)
,p_plug_name=>'Search criteria'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(68499987483627604)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45601458314987149)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48018989815268263)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(68499437106627602)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dim_time.year_numeric "Year", dim_movement_types.NAME "Movement Type", dim_time.month_numeric, COUNT_MOVEMENTS count',
'FROM dl_bordercontrol_datamart.fact_border_movements fact_movements',
'        INNER JOIN dl_bordercontrol_datamart.dim_movement_types ON fact_movements.dimension_movement_types_id = dim_movement_types.id',
'        INNER JOIN dl_bordercontrol_datamart.dim_times dim_time ON fact_movements.dimension_time_id = dim_time.id',
'        INNER JOIN dl_bordercontrol_datamart.dim_nationalities dim_nationalities ON fact_movements.dimension_nationalities_id = dim_nationalities.id',
'WHERE 1=1',
'AND DIMENSION_TIME_ID >=  TO_NUMBER(''2018011600'')',
'AND DIMENSION_TIME_ID <= TO_NUMBER(''2018071623'')',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(48019043670268264)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'CHRISTINA'
,p_internal_uid=>8396912434365133
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48019330876268266)
,p_db_column_name=>'Year'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48019334823268267)
,p_db_column_name=>'Movement Type'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Movement type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48019494511268268)
,p_db_column_name=>'MONTH_NUMERIC'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Month numeric'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'MONTH'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48019719801268270)
,p_db_column_name=>'COUNT'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Count'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(127339900712032292)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'PIVOT'
,p_report_alias=>'877178'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'Year:Movement Type:MONTH_NUMERIC:COUNT'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_pivot(
 p_id=>wwv_flow_api.id(127859216604445705)
,p_report_id=>wwv_flow_api.id(127339900712032292)
,p_pivot_columns=>'Year:Movement Type'
,p_row_columns=>'MONTH_NUMERIC'
);
wwv_flow_api.create_worksheet_pivot_agg(
 p_id=>wwv_flow_api.id(127859604961445710)
,p_pivot_id=>wwv_flow_api.id(127859216604445705)
,p_display_seq=>1
,p_function_name=>'SUM'
,p_column_name=>'COUNT'
,p_db_column_name=>'PFC1'
,p_format_mask=>'999G999G999G999G990'
,p_display_sum=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91460348590139249)
,p_plug_name=>'Traveler In/Out Statistics old (Chart)'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(68499987483627604)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P1000_SHOW_RESULTS = 1 AND 1 = 2'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(91460816948139252)
,p_default_chart_type=>'2DColumn'
,p_chart_title=>'Traveler In/Out Staistics'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_name=>'chart_28909079461147535'
,p_chart_width=>1340
,p_chart_height=>760
,p_display_attr=>':H:N:V:B::Top::V:Y:Circle:N:N:N:N:N:Default:N::S:Y'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME:N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'0'
,p_custom_colors=>'#2578CF,#65090A,#FFFF00'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_decimal_place=>0
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'Tahoma:10:#000000'
,p_grid_labels_font=>'Tahoma:10:#000000'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(91461178672139255)
,p_chart_id=>wwv_flow_api.id(91460816948139252)
,p_series_seq=>10
,p_series_name=>'Arrival'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_time_sql(',
'',
'     i_facts => ''MOVEMENTS'',',
'',
'     -- Filter criteria',
'     i_dim_agents_id => :P1000_DIM_AGENTS,',
'     i_dim_ages_id => :P1000_DIM_AGES,',
'     i_dim_borderposts_id => :P1000_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1000_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1000_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1000_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1000_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1000_DIM_OFFICERS,',
'',
'     i_time_interval => :P1000_INTERVAL,',
'     i_dim_times_hour_from => :P1000_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1000_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1000_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1000_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => :P1000_DIM_TIMES_YEAR,',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'     i_dim_transport_modes_id => :P1000_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1000_DIM_VISA_TYPES,',
'',
'     -- if the sql is for a table',
'     i_is_for_table => NULL,',
'           ',
'     -- if the sql is for a chart series',
'     i_is_for_chart => true,',
'     i_chart_series_name => ''Arrival'',',
'     i_chart_series_movement_type => ''ARRIVAL''  -- filter movement type',
'   );',
'',
'   RETURN sqltext;',
'END;'))
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'IGNORE_CHART_QUERY'
,p_series_query_no_data_found=>'no data found'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(93833613786321559)
,p_chart_id=>wwv_flow_api.id(91460816948139252)
,p_series_seq=>20
,p_series_name=>'Departure'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_time_sql(',
'',
'     i_facts => ''MOVEMENTS'',',
'     -- Filter criteria',
'     i_dim_agents_id => :P1000_DIM_AGENTS,',
'     i_dim_ages_id => :P1000_DIM_AGES,',
'     i_dim_borderposts_id => :P1000_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1000_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1000_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1000_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1000_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1000_DIM_OFFICERS,',
'',
'     i_time_interval => :P1000_INTERVAL,',
'     i_dim_times_hour_from => :P1000_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1000_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1000_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1000_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => :P1000_DIM_TIMES_YEAR,',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'     i_dim_transport_modes_id => :P1000_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1000_DIM_VISA_TYPES,',
'',
'     -- if the sql is for a table',
'     i_is_for_table => NULL,',
'           ',
'     -- if the sql is for a chart series',
'     i_is_for_chart => true,',
'     i_chart_series_name => ''Departure'',',
'     i_chart_series_movement_type => ''DEPARTURE''  -- filter movement type',
'   );',
'',
'   RETURN sqltext;',
'END;'))
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'IGNORE_CHART_QUERY'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(93834128007332865)
,p_chart_id=>wwv_flow_api.id(91460816948139252)
,p_series_seq=>30
,p_series_name=>'Offload'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_time_sql(',
'',
'     i_facts => ''MOVEMENTS'',',
'',
'     -- Filter criteria',
'     i_dim_agents_id => :P1000_DIM_AGENTS,',
'     i_dim_ages_id => :P1000_DIM_AGES,',
'     i_dim_borderposts_id => :P1000_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1000_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1000_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1000_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1000_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1000_DIM_OFFICERS,',
'',
'     i_time_interval => :P1000_INTERVAL,',
'     i_dim_times_hour_from => :P1000_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1000_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1000_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1000_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => :P1000_DIM_TIMES_YEAR,',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'     i_dim_transport_modes_id => :P1000_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1000_DIM_VISA_TYPES,',
'',
'     -- if the sql is for a table',
'     i_is_for_table => NULL,',
'           ',
'     -- if the sql is for a chart series',
'     i_is_for_chart => true,',
'     i_chart_series_name => ''Offload'',',
'     i_chart_series_movement_type => ''OFFLOAD''  -- filter movement type',
'   );',
'',
'   RETURN sqltext;',
'END;'))
,p_series_type=>'Bar'
,p_series_query_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_series_query_parse_opt=>'IGNORE_CHART_QUERY'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(91462030770139266)
,p_name=>'Traveler In/Out Statistics old (Table)'
,p_template=>wwv_flow_api.id(68499987483627604)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_time_sql(',
'',
'     i_facts => ''MOVEMENTS'',',
'',
'     -- Filter criteria',
'     i_dim_agents_id => :P1000_DIM_AGENTS,',
'     i_dim_ages_id => :P1000_DIM_AGES,',
'     i_dim_borderposts_id => :P1000_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1000_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1000_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1000_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1000_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1000_DIM_OFFICERS,',
'',
'     i_time_interval => :P1000_INTERVAL,',
'     i_dim_times_hour_from => :P1000_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1000_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1000_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1000_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'',
'     i_dim_transport_modes_id => :P1000_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1000_DIM_VISA_TYPES,',
'           ',
'',
'     i_is_for_chart => false,',
'     i_chart_series_name => null,',
'     i_chart_series_movement_type => null,',
'',
'     -- if the sql is for a table',
'     i_is_for_table => true',
'',
'   );',
'',
'   RETURN sqltext;',
'',
'END;',
'',
''))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_display_when_condition=>':P1000_SHOW_RESULTS = 1 AND 1 = 2'
,p_display_condition_type=>'SQL_EXPRESSION'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(68508751539627640)
,p_plug_query_max_columns=>60
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>30
,p_query_options=>'GENERIC_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Save as CSV file for Excel'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_plug_query_exp_separator=>';'
,p_plug_query_exp_enclosed_by=>'"'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92937644755626149)
,p_query_column_id=>1
,p_column_alias=>'COL01'
,p_column_display_sequence=>1
,p_column_heading=>'Col01'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92938100529626150)
,p_query_column_id=>2
,p_column_alias=>'COL02'
,p_column_display_sequence=>2
,p_column_heading=>'Col02'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92938451670626152)
,p_query_column_id=>3
,p_column_alias=>'COL03'
,p_column_display_sequence=>3
,p_column_heading=>'Col03'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92938903332626153)
,p_query_column_id=>4
,p_column_alias=>'COL04'
,p_column_display_sequence=>4
,p_column_heading=>'Col04'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92939225451626154)
,p_query_column_id=>5
,p_column_alias=>'COL05'
,p_column_display_sequence=>5
,p_column_heading=>'Col05'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92939586887626155)
,p_query_column_id=>6
,p_column_alias=>'COL06'
,p_column_display_sequence=>6
,p_column_heading=>'Col06'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92940024789626157)
,p_query_column_id=>7
,p_column_alias=>'COL07'
,p_column_display_sequence=>7
,p_column_heading=>'Col07'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92940408807626158)
,p_query_column_id=>8
,p_column_alias=>'COL08'
,p_column_display_sequence=>8
,p_column_heading=>'Col08'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92940760033626159)
,p_query_column_id=>9
,p_column_alias=>'COL09'
,p_column_display_sequence=>9
,p_column_heading=>'Col09'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92941133198626160)
,p_query_column_id=>10
,p_column_alias=>'COL10'
,p_column_display_sequence=>10
,p_column_heading=>'Col10'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92941557618626161)
,p_query_column_id=>11
,p_column_alias=>'COL11'
,p_column_display_sequence=>11
,p_column_heading=>'Col11'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92942016674626162)
,p_query_column_id=>12
,p_column_alias=>'COL12'
,p_column_display_sequence=>12
,p_column_heading=>'Col12'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92942409246626164)
,p_query_column_id=>13
,p_column_alias=>'COL13'
,p_column_display_sequence=>13
,p_column_heading=>'Col13'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92942779964626166)
,p_query_column_id=>14
,p_column_alias=>'COL14'
,p_column_display_sequence=>14
,p_column_heading=>'Col14'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92943139939626167)
,p_query_column_id=>15
,p_column_alias=>'COL15'
,p_column_display_sequence=>15
,p_column_heading=>'Col15'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92943618208626168)
,p_query_column_id=>16
,p_column_alias=>'COL16'
,p_column_display_sequence=>16
,p_column_heading=>'Col16'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92943978864626169)
,p_query_column_id=>17
,p_column_alias=>'COL17'
,p_column_display_sequence=>17
,p_column_heading=>'Col17'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92944362840626171)
,p_query_column_id=>18
,p_column_alias=>'COL18'
,p_column_display_sequence=>18
,p_column_heading=>'Col18'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92944765844626172)
,p_query_column_id=>19
,p_column_alias=>'COL19'
,p_column_display_sequence=>19
,p_column_heading=>'Col19'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92945136957626174)
,p_query_column_id=>20
,p_column_alias=>'COL20'
,p_column_display_sequence=>20
,p_column_heading=>'Col20'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92945624848626175)
,p_query_column_id=>21
,p_column_alias=>'COL21'
,p_column_display_sequence=>21
,p_column_heading=>'Col21'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92945950378626176)
,p_query_column_id=>22
,p_column_alias=>'COL22'
,p_column_display_sequence=>22
,p_column_heading=>'Col22'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92946407181626177)
,p_query_column_id=>23
,p_column_alias=>'COL23'
,p_column_display_sequence=>23
,p_column_heading=>'Col23'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92946756406626178)
,p_query_column_id=>24
,p_column_alias=>'COL24'
,p_column_display_sequence=>24
,p_column_heading=>'Col24'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92947215166626180)
,p_query_column_id=>25
,p_column_alias=>'COL25'
,p_column_display_sequence=>25
,p_column_heading=>'Col25'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92947543916626181)
,p_query_column_id=>26
,p_column_alias=>'COL26'
,p_column_display_sequence=>26
,p_column_heading=>'Col26'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92947999892626182)
,p_query_column_id=>27
,p_column_alias=>'COL27'
,p_column_display_sequence=>27
,p_column_heading=>'Col27'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92948392031626184)
,p_query_column_id=>28
,p_column_alias=>'COL28'
,p_column_display_sequence=>28
,p_column_heading=>'Col28'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92948763986626185)
,p_query_column_id=>29
,p_column_alias=>'COL29'
,p_column_display_sequence=>29
,p_column_heading=>'Col29'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92949151723626187)
,p_query_column_id=>30
,p_column_alias=>'COL30'
,p_column_display_sequence=>30
,p_column_heading=>'Col30'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92949629453626188)
,p_query_column_id=>31
,p_column_alias=>'COL31'
,p_column_display_sequence=>31
,p_column_heading=>'Col31'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92949954898626189)
,p_query_column_id=>32
,p_column_alias=>'COL32'
,p_column_display_sequence=>32
,p_column_heading=>'Col32'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92950428239626190)
,p_query_column_id=>33
,p_column_alias=>'COL33'
,p_column_display_sequence=>33
,p_column_heading=>'Col33'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92950823348626191)
,p_query_column_id=>34
,p_column_alias=>'COL34'
,p_column_display_sequence=>34
,p_column_heading=>'Col34'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92951159985626193)
,p_query_column_id=>35
,p_column_alias=>'COL35'
,p_column_display_sequence=>35
,p_column_heading=>'Col35'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92951558036626194)
,p_query_column_id=>36
,p_column_alias=>'COL36'
,p_column_display_sequence=>36
,p_column_heading=>'Col36'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92951982469626195)
,p_query_column_id=>37
,p_column_alias=>'COL37'
,p_column_display_sequence=>37
,p_column_heading=>'Col37'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92952363531626196)
,p_query_column_id=>38
,p_column_alias=>'COL38'
,p_column_display_sequence=>38
,p_column_heading=>'Col38'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92952733584626197)
,p_query_column_id=>39
,p_column_alias=>'COL39'
,p_column_display_sequence=>39
,p_column_heading=>'Col39'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92953148887626198)
,p_query_column_id=>40
,p_column_alias=>'COL40'
,p_column_display_sequence=>40
,p_column_heading=>'Col40'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92953549678626199)
,p_query_column_id=>41
,p_column_alias=>'COL41'
,p_column_display_sequence=>41
,p_column_heading=>'Col41'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92953931313626201)
,p_query_column_id=>42
,p_column_alias=>'COL42'
,p_column_display_sequence=>42
,p_column_heading=>'Col42'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92954357877626202)
,p_query_column_id=>43
,p_column_alias=>'COL43'
,p_column_display_sequence=>43
,p_column_heading=>'Col43'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92954770987626203)
,p_query_column_id=>44
,p_column_alias=>'COL44'
,p_column_display_sequence=>44
,p_column_heading=>'Col44'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92955225896626204)
,p_query_column_id=>45
,p_column_alias=>'COL45'
,p_column_display_sequence=>45
,p_column_heading=>'Col45'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92955552426626205)
,p_query_column_id=>46
,p_column_alias=>'COL46'
,p_column_display_sequence=>46
,p_column_heading=>'Col46'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92955971225626206)
,p_query_column_id=>47
,p_column_alias=>'COL47'
,p_column_display_sequence=>47
,p_column_heading=>'Col47'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92956400581626207)
,p_query_column_id=>48
,p_column_alias=>'COL48'
,p_column_display_sequence=>48
,p_column_heading=>'Col48'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92956818232626209)
,p_query_column_id=>49
,p_column_alias=>'COL49'
,p_column_display_sequence=>49
,p_column_heading=>'Col49'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92957220306626210)
,p_query_column_id=>50
,p_column_alias=>'COL50'
,p_column_display_sequence=>50
,p_column_heading=>'Col50'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92957548380626211)
,p_query_column_id=>51
,p_column_alias=>'COL51'
,p_column_display_sequence=>51
,p_column_heading=>'Col51'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92958010123626212)
,p_query_column_id=>52
,p_column_alias=>'COL52'
,p_column_display_sequence=>52
,p_column_heading=>'Col52'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92958346510626213)
,p_query_column_id=>53
,p_column_alias=>'COL53'
,p_column_display_sequence=>53
,p_column_heading=>'Col53'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92958802196626214)
,p_query_column_id=>54
,p_column_alias=>'COL54'
,p_column_display_sequence=>54
,p_column_heading=>'Col54'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92959196714626215)
,p_query_column_id=>55
,p_column_alias=>'COL55'
,p_column_display_sequence=>55
,p_column_heading=>'Col55'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92959603390626216)
,p_query_column_id=>56
,p_column_alias=>'COL56'
,p_column_display_sequence=>56
,p_column_heading=>'Col56'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92960026371626217)
,p_query_column_id=>57
,p_column_alias=>'COL57'
,p_column_display_sequence=>57
,p_column_heading=>'Col57'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92960376315626219)
,p_query_column_id=>58
,p_column_alias=>'COL58'
,p_column_display_sequence=>58
,p_column_heading=>'Col58'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
end;
/
begin
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92960788873626220)
,p_query_column_id=>59
,p_column_alias=>'COL59'
,p_column_display_sequence=>59
,p_column_heading=>'Col59'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(92961162754626222)
,p_query_column_id=>60
,p_column_alias=>'COL60'
,p_column_display_sequence=>60
,p_column_heading=>'Col60'
,p_include_in_export=>'Y'
,p_print_col_width=>'1'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118905626113055271)
,p_plug_name=>'New test'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(68499987483627604)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_html(',
'',
'     i_facts => ''MOVEMENTS'',',
'',
'     -- Filter criteria',
'     i_dim_agents_id => :P1000_DIM_AGENTS,',
'     i_dim_ages_id => :P1000_DIM_AGES,',
'     i_dim_borderposts_id => :P1000_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1000_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1000_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1000_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1000_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1000_DIM_OFFICERS,',
'',
'     i_time_interval => :P1000_INTERVAL,',
'     i_dim_times_hour_from => :P1000_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1000_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1000_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1000_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'',
'     i_dim_transport_modes_id => :P1000_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1000_DIM_VISA_TYPES,',
'           ',
'',
'     i_is_for_chart => false,',
'     i_chart_series_name => null,',
'     i_chart_series_movement_type => null,',
'',
'     -- if the sql is for a table',
'     i_is_for_table => true',
'',
'   );',
'',
'   Htp.p(sqltext);',
'',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P1000_SHOW_RESULTS = 1 AND 1 = 2'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134643877677388137)
,p_plug_name=>'Traveler In/Out Statistics (Table)'
,p_region_name=>'GetReportRegion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(68499437106627602)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT exitflg',
'      ,NVL(date_of_entry, ins_at) as date_of_entry',
'      ,TO_NUMBER(TO_CHAR(NVL(date_of_entry, ins_at), ''YYYY'')) AS year',
'      ,TO_NUMBER(TO_CHAR(NVL(date_of_entry, ins_at), ''MM'')) AS month',
'      ,TO_NUMBER(TO_CHAR(NVL(date_of_entry, ins_at), ''HH24'')) as hour',
'      ,TO_NUMBER(TO_CHAR(NVL(date_of_entry, ins_at), ''IW'')) AS week',
'      ,TO_NUMBER(TO_CHAR(NVL(date_of_entry, ins_at), ''DD'')) AS day',
'  FROM dl_bordercontrol.movements',
' WHERE is_finished = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(134643939522388138)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'E1CHAGEMANN'
,p_internal_uid=>95021808286485007
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134644056024388139)
,p_db_column_name=>'EXITFLG'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Movement Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(134808524408874064)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134644806998388146)
,p_db_column_name=>'DATE_OF_ENTRY'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Date of entry'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134644916060388147)
,p_db_column_name=>'YEAR'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134644972552388148)
,p_db_column_name=>'MONTH'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Month'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134645131215388149)
,p_db_column_name=>'HOUR'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Hour'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134645176613388150)
,p_db_column_name=>'WEEK'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Week'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134645253128388151)
,p_db_column_name=>'DAY'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Day'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134800110335850511)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'951780'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_view_mode=>'REPORT'
,p_report_columns=>'EXITFLG:DATE_OF_ENTRY:YEAR:MONTH:WEEK:DAY:HOUR:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134821479847905145)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Yearly'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'YEARLY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_view_mode=>'REPORT'
,p_report_columns=>'EXITFLG:DATE_OF_ENTRY'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134829406875923894)
,p_report_id=>wwv_flow_api.id(134821479847905145)
,p_group_by_columns=>'YEAR:EXITFLG'
,p_function_01=>'COUNT'
,p_function_column_01=>'DATE_OF_ENTRY'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'ASC'
,p_sort_column_02=>'EXITFLG'
,p_sort_direction_02=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134829818347925123)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Monthly'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'MONTHLY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_view_mode=>'REPORT'
,p_report_columns=>'EXITFLG:DATE_OF_ENTRY'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134831028038932515)
,p_report_id=>wwv_flow_api.id(134829818347925123)
,p_group_by_columns=>'YEAR:MONTH:EXITFLG'
,p_function_01=>'COUNT'
,p_function_column_01=>'DATE_OF_ENTRY'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'MONTH'
,p_sort_direction_02=>'DESC'
,p_sort_column_03=>'EXITFLG'
,p_sort_direction_03=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134831334175933627)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Weekly'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'WEEKLY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_view_mode=>'REPORT'
,p_report_columns=>'EXITFLG:DATE_OF_ENTRY'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134832595526938225)
,p_report_id=>wwv_flow_api.id(134831334175933627)
,p_group_by_columns=>'YEAR:WEEK:EXITFLG'
,p_function_01=>'COUNT'
,p_function_column_01=>'DATE_OF_ENTRY'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'WEEK'
,p_sort_direction_02=>'DESC'
,p_sort_column_03=>'EXITFLG'
,p_sort_direction_03=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134832991057939093)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Daily'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'DAILY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_view_mode=>'REPORT'
,p_report_columns=>'EXITFLG:DATE_OF_ENTRY'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134835007569947334)
,p_report_id=>wwv_flow_api.id(134832991057939093)
,p_group_by_columns=>'YEAR:MONTH:DAY:EXITFLG'
,p_function_01=>'COUNT'
,p_function_column_01=>'DATE_OF_ENTRY'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'MONTH'
,p_sort_direction_02=>'DESC'
,p_sort_column_03=>'DAY'
,p_sort_direction_03=>'DESC'
,p_sort_column_04=>'EXITFLG'
,p_sort_direction_04=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134835342109948610)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Hourly'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'HOURLY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_view_mode=>'REPORT'
,p_report_columns=>'EXITFLG:DATE_OF_ENTRY'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134836602256958866)
,p_report_id=>wwv_flow_api.id(134835342109948610)
,p_group_by_columns=>'YEAR:HOUR:EXITFLG'
,p_function_01=>'COUNT'
,p_function_column_01=>'DATE_OF_ENTRY'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'HOUR'
,p_sort_direction_02=>'ASC'
,p_sort_column_03=>'EXITFLG'
,p_sort_direction_03=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134977178969859866)
,p_plug_name=>'Traveler In/Out Statistics (Chart)'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(68499987483627604)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT disp_value, additional_value, cnt',
'  FROM TABLE(pkg_apex_util.get_report_data(:APP_ID, :APP_PAGE_ID)); '))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(134977320615859867)
,p_region_id=>wwv_flow_api.id(134977178969859866)
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
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(134977402595859868)
,p_chart_id=>wwv_flow_api.id(134977320615859867)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'REGION_SOURCE'
,p_series_name_column_name=>'ADDITIONAL_VALUE'
,p_items_value_column_name=>'CNT'
,p_items_label_column_name=>'DISP_VALUE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(134977442535859869)
,p_chart_id=>wwv_flow_api.id(134977320615859867)
,p_axis=>'x'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_api.id(134977610543859870)
,p_chart_id=>wwv_flow_api.id(134977320615859867)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45574548090896138)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_api.id(45574257335896124)
,p_button_name=>'BTN_SHOW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(68520969804627701)
,p_button_image_alt=>'Show'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45575014290896141)
,p_button_sequence=>300
,p_button_plug_id=>wwv_flow_api.id(45574257335896124)
,p_button_name=>'BTN_RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(68520969804627701)
,p_button_image_alt=>'Reset'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(91925968508900677)
,p_branch_name=>'Show Results'
,p_branch_action=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.::P1000_SHOW_RESULTS:1'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45574548090896138)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(91926319079906145)
,p_branch_name=>'Reset'
,p_branch_action=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.:1000:P1000_SHOW_RESULTS:0'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45575014290896141)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45575362476896149)
,p_name=>'P1000_DIM_TIMES_DATE_FROM'
,p_is_required=>true
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'From Date'
,p_source=>'SYSDATE()-INTERVAL''3''MONTH'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(68520799110627690)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45575747523896155)
,p_name=>'P1000_DIM_TIMES_DATE_TO'
,p_is_required=>true
,p_item_sequence=>11
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'To Date'
,p_source=>'SYSDATE-1'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(68520799110627690)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45576228587896156)
,p_name=>'P1000_DIM_TIME_HOUR_FROM'
,p_is_required=>true
,p_item_sequence=>21
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'From Hour (0-23)'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(68520799110627690)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45576547207896157)
,p_name=>'P1000_DIM_TIME_HOUR_TO'
,p_is_required=>true
,p_item_sequence=>31
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'To Hour (0-23)'
,p_source=>'23'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>2
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(68520799110627690)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45576970581896158)
,p_name=>'P1000_INTERVAL'
,p_is_required=>true
,p_item_sequence=>41
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_item_default=>'''monthly'''
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Interval'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_INTERVALS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    name as d,',
'    id as r',
'FROM',
'    dl_bordercontrol_datamart.intervals',
'order by sort'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520799110627690)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45577390222896162)
,p_name=>'P1000_DIM_AGENTS'
,p_item_sequence=>51
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Agent'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_AGENTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_agent(id) as d, id as r',
'from dl_bordercontrol_datamart.dim_agents',
'where ID not in (''-100'', ''-200'')',
'order by name'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'maltetest'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45577819304896164)
,p_name=>'P1000_DIM_AGES'
,p_item_sequence=>61
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Age'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_AGES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id as d, id as r',
' from dl_bordercontrol_datamart.dim_ages',
' where ID not in (''-100'', ''-200'')',
' order by id'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45578187682896165)
,p_name=>'P1000_DIM_BORDERPOSTS'
,p_item_sequence=>71
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Borderpost'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_borderpost(id) as d, id as r',
' from dl_bordercontrol_datamart.dim_borderposts',
' where ID not in (''-100'', ''-200'')',
' order by name;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45578543326896166)
,p_name=>'P1000_DIM_DOCUMENT_TYPES'
,p_item_sequence=>81
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Document Class'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_DOCUMENT_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d, id as r',
' from dl_bordercontrol_datamart.dim_document_types',
' where ID not in (''-100'', ''-200'')',
' order by id;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45578953154896166)
,p_name=>'P1000_DIM_GENDERS'
,p_item_sequence=>91
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Gender'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_GENDERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_gender(id) as d, id as r',
'from dl_bordercontrol_datamart.dim_genders',
'where ID not in (''-100'', ''-200'')',
'order by id;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45579348254896167)
,p_name=>'P1000_DIM_MOVEMENT_TYPES'
,p_item_sequence=>101
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Movement Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_MOVEMENT_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_movement_type(id) as d, id as r',
'from dl_bordercontrol_datamart.dim_movement_types',
'where ID not in (''-100'', ''-200'')',
'order by id;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45579817920896168)
,p_name=>'P1000_DIM_NATIONALITIES'
,p_item_sequence=>111
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Nationality'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_NATIONALITIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_nationality(id) as d, id as r',
'from dl_bordercontrol_datamart.dim_nationalities',
'where ID not in (''-100'', ''-200'')',
'order by id;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45580228738896169)
,p_name=>'P1000_DIM_OFFICERS'
,p_item_sequence=>121
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Officer'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_OFFICERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username as d, id as r',
'from dl_bordercontrol_datamart.dim_officers',
'where ID not in (''-100'', ''-200'')',
'order by username;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45580608354896171)
,p_name=>'P1000_DIM_TIMES_YEAR'
,p_item_sequence=>131
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Year'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_TIME_YEARS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct year_numeric as d, year_numeric as r from dl_bordercontrol_datamart.dim_times',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45580935938896172)
,p_name=>'P1000_DIM_TRANSPORT_MODES'
,p_item_sequence=>141
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Transport Mode'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_TRANSPORT_MODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_transport_mode(id) as d, id as r ',
'from dl_bordercontrol_datamart.dim_transport_modes',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45581415106896174)
,p_name=>'P1000_DIM_VISA_TYPES'
,p_item_sequence=>151
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Visa Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_VISA_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_visa_type(id) as d, id as r ',
'from dl_bordercontrol_datamart.dim_visa_types',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45581754252896175)
,p_name=>'P1000_SHOW_RESULTS'
,p_item_sequence=>161
,p_item_plug_id=>wwv_flow_api.id(45574257335896124)
,p_prompt=>'Show Results'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(68520350876627684)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134977726059859871)
,p_name=>'REFRESH: CHART'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(134643877677388137)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134977827064859872)
,p_event_id=>wwv_flow_api.id(134977726059859871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(134977178969859866)
,p_stop_execution_on_error=>'Y'
);
end;
/
