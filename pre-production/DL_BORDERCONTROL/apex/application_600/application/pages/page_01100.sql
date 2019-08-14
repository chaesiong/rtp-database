prompt --application/pages/page_01100
begin
wwv_flow_api.create_page(
 p_id=>1100
,p_user_interface_id=>wwv_flow_api.id(68526215125627868)
,p_name=>'Blacklist Matched Detection Statistics'
,p_page_mode=>'NORMAL'
,p_step_title=>'Blacklist Matched Detection Statistics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Blacklist Matched Detection Statistics'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_api.id(68488783085627510)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(46598465620221197)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180729163811'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45618296442270330)
,p_plug_name=>'Search criteria'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(68499987483627604)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45651666650378509)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(94210916753149112)
,p_plug_name=>'Blacklist Matched Detection Statistics (Chart)'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(68499987483627604)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>12
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P1100_SHOW_RESULTS = 1 AND 1 = 2'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(94211227737149113)
,p_default_chart_type=>'2DColumn'
,p_chart_title=>'Blacklist Matched Detection Statistics'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_name=>'chart_28909079461147535'
,p_chart_width=>1340
,p_chart_height=>760
,p_display_attr=>':H:N:V:B::Top::V:Y:Circle:N:N:N:N:N:Default:N::S:'
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
 p_id=>wwv_flow_api.id(94211570192149123)
,p_chart_id=>wwv_flow_api.id(94211227737149113)
,p_series_seq=>10
,p_series_name=>'Arrival'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_time_sql(',
'',
'     i_facts => ''INCIDENTS'',',
'',
'     -- Filter criteria',
'     i_dim_agents_id => :P1100_DIM_AGENTS,',
'     i_dim_ages_id => :P1100_DIM_AGES,',
'     i_dim_borderposts_id => :P1100_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1100_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1100_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1100_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1100_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1100_DIM_OFFICERS,',
'',
'     i_time_interval => :P1100_INTERVAL,',
'     i_dim_times_hour_from => :P1100_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1100_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1100_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1100_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => :P1100_DIM_TIMES_YEAR,',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'     i_dim_transport_modes_id => :P1100_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1100_DIM_VISA_TYPES,',
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
 p_id=>wwv_flow_api.id(94211982239149127)
,p_chart_id=>wwv_flow_api.id(94211227737149113)
,p_series_seq=>20
,p_series_name=>'Departure'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_time_sql(',
'',
'     i_facts => ''INCIDENTS'',',
'     -- Filter criteria',
'     i_dim_agents_id => :P1100_DIM_AGENTS,',
'     i_dim_ages_id => :P1100_DIM_AGES,',
'     i_dim_borderposts_id => :P1100_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1100_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1100_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1100_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1100_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1100_DIM_OFFICERS,',
'',
'     i_time_interval => :P1100_INTERVAL,',
'     i_dim_times_hour_from => :P1100_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1100_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1100_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1100_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => :P1100_DIM_TIMES_YEAR,',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'     i_dim_transport_modes_id => :P1100_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1100_DIM_VISA_TYPES,',
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
 p_id=>wwv_flow_api.id(94212387410149129)
,p_chart_id=>wwv_flow_api.id(94211227737149113)
,p_series_seq=>30
,p_series_name=>'Offload'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_time_sql(',
'',
'     i_facts => ''INCIDENTS'',',
'',
'     -- Filter criteria',
'     i_dim_agents_id => :P1100_DIM_AGENTS,',
'     i_dim_ages_id => :P1100_DIM_AGES,',
'     i_dim_borderposts_id => :P1100_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1100_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1100_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1100_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1100_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1100_DIM_OFFICERS,',
'',
'     i_time_interval => :P1100_INTERVAL,',
'     i_dim_times_hour_from => :P1100_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1100_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1100_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1100_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => :P1100_DIM_TIMES_YEAR,',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'     i_dim_transport_modes_id => :P1100_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1100_DIM_VISA_TYPES,',
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
 p_id=>wwv_flow_api.id(94212787265149131)
,p_name=>'Blacklist Matched Detection Statistics (Table)'
,p_template=>wwv_flow_api.id(68499987483627604)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  sqltext VARCHAR2(4000);',
'BEGIN',
'   sqltext := dl_bordercontrol_datamart.pkg_reporting.get_report_time_sql(',
'',
'     i_facts => ''INCIDENTS'',',
'',
'     -- Filter criteria',
'     i_dim_agents_id => :P1100_DIM_AGENTS,',
'     i_dim_ages_id => :P1100_DIM_AGES,',
'     i_dim_borderposts_id => :P1100_DIM_BORDERPOSTS,',
'     i_dim_document_types_id => :P1100_DIM_DOCUMENT_TYPES,',
'     i_dim_genders_id => :P1100_DIM_GENDERS,',
'     i_dim_movment_types_id => :P1100_DIM_MOVEMENT_TYPES,',
'     i_dim_nationalities_id => :P1100_DIM_NATIONALITIES,',
'     i_dim_officers_id => :P1100_DIM_OFFICERS,',
'',
'     i_time_interval => :P1100_INTERVAL,',
'     i_dim_times_hour_from => :P1100_DIM_TIME_HOUR_FROM,',
'     i_dim_times_hour_to => :P1100_DIM_TIME_HOUR_TO,',
'     i_dim_times_date_from => :P1100_DIM_TIMES_DATE_FROM, ',
'     i_dim_times_date_to => :P1100_DIM_TIMES_DATE_TO, ',
'     i_dim_times_year_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_month_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_week_id => NULL, -- for drilldown (will come later)',
'     i_dim_times_day_id => NULL, -- for drilldown (will come later)',
'',
'     i_dim_transport_modes_id => :P1100_DIM_TRANSPORT_MODES,',
'     i_dim_visa_types_id => :P1100_DIM_VISA_TYPES,',
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
,p_display_when_condition=>':P1100_SHOW_RESULTS = 1 AND 1 = 2'
,p_display_condition_type=>'PLSQL_EXPRESSION'
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
,p_plug_query_exp_separator=>';'
,p_plug_query_exp_enclosed_by=>'"'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94213230244149138)
,p_query_column_id=>1
,p_column_alias=>'COL01'
,p_column_display_sequence=>1
,p_column_heading=>'Col01'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94213546292149140)
,p_query_column_id=>2
,p_column_alias=>'COL02'
,p_column_display_sequence=>2
,p_column_heading=>'Col02'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94213958086149141)
,p_query_column_id=>3
,p_column_alias=>'COL03'
,p_column_display_sequence=>3
,p_column_heading=>'Col03'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94214416219149142)
,p_query_column_id=>4
,p_column_alias=>'COL04'
,p_column_display_sequence=>4
,p_column_heading=>'Col04'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94214773038149143)
,p_query_column_id=>5
,p_column_alias=>'COL05'
,p_column_display_sequence=>5
,p_column_heading=>'Col05'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94215217009149146)
,p_query_column_id=>6
,p_column_alias=>'COL06'
,p_column_display_sequence=>6
,p_column_heading=>'Col06'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94215574966149147)
,p_query_column_id=>7
,p_column_alias=>'COL07'
,p_column_display_sequence=>7
,p_column_heading=>'Col07'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94215992147149149)
,p_query_column_id=>8
,p_column_alias=>'COL08'
,p_column_display_sequence=>8
,p_column_heading=>'Col08'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94216358217149150)
,p_query_column_id=>9
,p_column_alias=>'COL09'
,p_column_display_sequence=>9
,p_column_heading=>'Col09'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94216828514149151)
,p_query_column_id=>10
,p_column_alias=>'COL10'
,p_column_display_sequence=>10
,p_column_heading=>'Col10'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94217228133149153)
,p_query_column_id=>11
,p_column_alias=>'COL11'
,p_column_display_sequence=>11
,p_column_heading=>'Col11'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94217571318149154)
,p_query_column_id=>12
,p_column_alias=>'COL12'
,p_column_display_sequence=>12
,p_column_heading=>'Col12'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94217946361149155)
,p_query_column_id=>13
,p_column_alias=>'COL13'
,p_column_display_sequence=>13
,p_column_heading=>'Col13'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94218360558149157)
,p_query_column_id=>14
,p_column_alias=>'COL14'
,p_column_display_sequence=>14
,p_column_heading=>'Col14'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94218770804149159)
,p_query_column_id=>15
,p_column_alias=>'COL15'
,p_column_display_sequence=>15
,p_column_heading=>'Col15'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94219175002149160)
,p_query_column_id=>16
,p_column_alias=>'COL16'
,p_column_display_sequence=>16
,p_column_heading=>'Col16'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94219625152149162)
,p_query_column_id=>17
,p_column_alias=>'COL17'
,p_column_display_sequence=>17
,p_column_heading=>'Col17'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94220023156149163)
,p_query_column_id=>18
,p_column_alias=>'COL18'
,p_column_display_sequence=>18
,p_column_heading=>'Col18'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94220375816149165)
,p_query_column_id=>19
,p_column_alias=>'COL19'
,p_column_display_sequence=>19
,p_column_heading=>'Col19'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94220772962149166)
,p_query_column_id=>20
,p_column_alias=>'COL20'
,p_column_display_sequence=>20
,p_column_heading=>'Col20'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94221147192149168)
,p_query_column_id=>21
,p_column_alias=>'COL21'
,p_column_display_sequence=>21
,p_column_heading=>'Col21'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94221591295149169)
,p_query_column_id=>22
,p_column_alias=>'COL22'
,p_column_display_sequence=>22
,p_column_heading=>'Col22'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94221960304149171)
,p_query_column_id=>23
,p_column_alias=>'COL23'
,p_column_display_sequence=>23
,p_column_heading=>'Col23'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94222370890149173)
,p_query_column_id=>24
,p_column_alias=>'COL24'
,p_column_display_sequence=>24
,p_column_heading=>'Col24'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94222782619149175)
,p_query_column_id=>25
,p_column_alias=>'COL25'
,p_column_display_sequence=>25
,p_column_heading=>'Col25'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94223146402149177)
,p_query_column_id=>26
,p_column_alias=>'COL26'
,p_column_display_sequence=>26
,p_column_heading=>'Col26'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94223588535149180)
,p_query_column_id=>27
,p_column_alias=>'COL27'
,p_column_display_sequence=>27
,p_column_heading=>'Col27'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94223944038149182)
,p_query_column_id=>28
,p_column_alias=>'COL28'
,p_column_display_sequence=>28
,p_column_heading=>'Col28'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94224410663149183)
,p_query_column_id=>29
,p_column_alias=>'COL29'
,p_column_display_sequence=>29
,p_column_heading=>'Col29'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94224756644149185)
,p_query_column_id=>30
,p_column_alias=>'COL30'
,p_column_display_sequence=>30
,p_column_heading=>'Col30'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94225228616149187)
,p_query_column_id=>31
,p_column_alias=>'COL31'
,p_column_display_sequence=>31
,p_column_heading=>'Col31'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94225582763149188)
,p_query_column_id=>32
,p_column_alias=>'COL32'
,p_column_display_sequence=>32
,p_column_heading=>'Col32'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94226015178149190)
,p_query_column_id=>33
,p_column_alias=>'COL33'
,p_column_display_sequence=>33
,p_column_heading=>'Col33'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94226339080149191)
,p_query_column_id=>34
,p_column_alias=>'COL34'
,p_column_display_sequence=>34
,p_column_heading=>'Col34'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94226789531149192)
,p_query_column_id=>35
,p_column_alias=>'COL35'
,p_column_display_sequence=>35
,p_column_heading=>'Col35'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94227193369149193)
,p_query_column_id=>36
,p_column_alias=>'COL36'
,p_column_display_sequence=>36
,p_column_heading=>'Col36'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94227593779149194)
,p_query_column_id=>37
,p_column_alias=>'COL37'
,p_column_display_sequence=>37
,p_column_heading=>'Col37'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94227950180149196)
,p_query_column_id=>38
,p_column_alias=>'COL38'
,p_column_display_sequence=>38
,p_column_heading=>'Col38'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94228340645149198)
,p_query_column_id=>39
,p_column_alias=>'COL39'
,p_column_display_sequence=>39
,p_column_heading=>'Col39'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94228734810149199)
,p_query_column_id=>40
,p_column_alias=>'COL40'
,p_column_display_sequence=>40
,p_column_heading=>'Col40'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94229143182149200)
,p_query_column_id=>41
,p_column_alias=>'COL41'
,p_column_display_sequence=>41
,p_column_heading=>'Col41'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94229615680149201)
,p_query_column_id=>42
,p_column_alias=>'COL42'
,p_column_display_sequence=>42
,p_column_heading=>'Col42'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94229938960149203)
,p_query_column_id=>43
,p_column_alias=>'COL43'
,p_column_display_sequence=>43
,p_column_heading=>'Col43'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94230354715149205)
,p_query_column_id=>44
,p_column_alias=>'COL44'
,p_column_display_sequence=>44
,p_column_heading=>'Col44'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94230801059149206)
,p_query_column_id=>45
,p_column_alias=>'COL45'
,p_column_display_sequence=>45
,p_column_heading=>'Col45'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94231227658149208)
,p_query_column_id=>46
,p_column_alias=>'COL46'
,p_column_display_sequence=>46
,p_column_heading=>'Col46'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94231543927149209)
,p_query_column_id=>47
,p_column_alias=>'COL47'
,p_column_display_sequence=>47
,p_column_heading=>'Col47'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94231999656149211)
,p_query_column_id=>48
,p_column_alias=>'COL48'
,p_column_display_sequence=>48
,p_column_heading=>'Col48'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94232415749149212)
,p_query_column_id=>49
,p_column_alias=>'COL49'
,p_column_display_sequence=>49
,p_column_heading=>'Col49'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94232782929149214)
,p_query_column_id=>50
,p_column_alias=>'COL50'
,p_column_display_sequence=>50
,p_column_heading=>'Col50'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94233227439149216)
,p_query_column_id=>51
,p_column_alias=>'COL51'
,p_column_display_sequence=>51
,p_column_heading=>'Col51'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94233615539149217)
,p_query_column_id=>52
,p_column_alias=>'COL52'
,p_column_display_sequence=>52
,p_column_heading=>'Col52'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94234019879149218)
,p_query_column_id=>53
,p_column_alias=>'COL53'
,p_column_display_sequence=>53
,p_column_heading=>'Col53'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94234363064149219)
,p_query_column_id=>54
,p_column_alias=>'COL54'
,p_column_display_sequence=>54
,p_column_heading=>'Col54'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94234782189149220)
,p_query_column_id=>55
,p_column_alias=>'COL55'
,p_column_display_sequence=>55
,p_column_heading=>'Col55'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94235143939149221)
,p_query_column_id=>56
,p_column_alias=>'COL56'
,p_column_display_sequence=>56
,p_column_heading=>'Col56'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94235558046149222)
,p_query_column_id=>57
,p_column_alias=>'COL57'
,p_column_display_sequence=>57
,p_column_heading=>'Col57'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94235969695149223)
,p_query_column_id=>58
,p_column_alias=>'COL58'
,p_column_display_sequence=>58
,p_column_heading=>'Col58'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94236405653149224)
,p_query_column_id=>59
,p_column_alias=>'COL59'
,p_column_display_sequence=>59
,p_column_heading=>'Col59'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(94236818057149225)
,p_query_column_id=>60
,p_column_alias=>'COL60'
,p_column_display_sequence=>60
,p_column_heading=>'Col60'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134645413076388152)
,p_plug_name=>'Blacklist Matched Detection Statistics (Table)'
,p_region_name=>'GetReportRegion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(68499437106627602)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT type -- Blacklist',
'      ,ins_at AS created_date',
'      ,TO_CHAR(ins_at, ''YYYY'') AS year',
'      ,TO_CHAR(ins_at, ''MM'') AS month',
'      ,TO_CHAR(ins_at, ''DD'') AS day',
'      ,TO_CHAR(ins_at, ''IW'') AS week',
'      ,TO_CHAR(ins_at, ''HH24'') AS hour',
'  from dl_bordercontrol.incidents'))
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
 p_id=>wwv_flow_api.id(134645525525388153)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'E1CHAGEMANN'
,p_internal_uid=>95023394289485022
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134645582627388154)
,p_db_column_name=>'TYPE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(134938498335124453)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134645669351388155)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Created date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134645759973388156)
,p_db_column_name=>'YEAR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Year'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134645852592388157)
,p_db_column_name=>'MONTH'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Month'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134645991295388158)
,p_db_column_name=>'DAY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Day'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134646101080388159)
,p_db_column_name=>'WEEK'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Week'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134646201227388160)
,p_db_column_name=>'HOUR'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Hour'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134849894420002321)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'952278'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'TYPE:CREATED_DATE:YEAR:MONTH:DAY:WEEK:HOUR'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134883262174893925)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Yearly'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'YEARLY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'TYPE:CREATED_DATE:YEAR:MONTH:DAY:WEEK:HOUR'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134886091352901013)
,p_report_id=>wwv_flow_api.id(134883262174893925)
,p_group_by_columns=>'YEAR:TYPE'
,p_function_01=>'COUNT'
,p_function_column_01=>'*'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'TYPE'
,p_sort_direction_02=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134884255907895063)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Monthly'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'MONTHLY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'TYPE:CREATED_DATE:YEAR:MONTH:DAY:WEEK:HOUR'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134885455972898708)
,p_report_id=>wwv_flow_api.id(134884255907895063)
,p_group_by_columns=>'YEAR:MONTH:TYPE'
,p_function_01=>'COUNT'
,p_function_column_01=>'*'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'MONTH'
,p_sort_direction_02=>'DESC'
,p_sort_column_03=>'TYPE'
,p_sort_direction_03=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134886508675902097)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Daily'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'DAILY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'TYPE:CREATED_DATE:YEAR:MONTH:DAY:WEEK:HOUR'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134887727003905668)
,p_report_id=>wwv_flow_api.id(134886508675902097)
,p_group_by_columns=>'YEAR:MONTH:DAY:TYPE'
,p_function_01=>'COUNT'
,p_function_column_01=>'*'
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
,p_sort_column_04=>'TYPE'
,p_sort_direction_04=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134888055180906735)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Hourly'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'HOURLY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'TYPE:CREATED_DATE:YEAR:MONTH:DAY:WEEK:HOUR'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(134889306412910106)
,p_report_id=>wwv_flow_api.id(134888055180906735)
,p_group_by_columns=>'YEAR:HOUR:TYPE'
,p_function_01=>'COUNT'
,p_function_column_01=>'*'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'HOUR'
,p_sort_direction_02=>'DESC'
,p_sort_column_03=>'TYPE'
,p_sort_direction_03=>'ASC'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(135044338454232307)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Weekly'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'WEEKLY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'TYPE:CREATED_DATE:YEAR:MONTH:DAY:WEEK:HOUR'
,p_flashback_enabled=>'N'
);
end;
/
begin
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(135045537571233966)
,p_report_id=>wwv_flow_api.id(135044338454232307)
,p_group_by_columns=>'YEAR:WEEK:TYPE'
,p_function_01=>'COUNT'
,p_function_column_01=>'*'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Count'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'Y'
,p_sort_column_01=>'YEAR'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'WEEK'
,p_sort_direction_02=>'DESC'
,p_sort_column_03=>'TYPE'
,p_sort_direction_03=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134976481754859859)
,p_plug_name=>'Blacklist Matched Detection Statistics (Chart)'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(68499987483627604)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(134976549151859860)
,p_region_id=>wwv_flow_api.id(134976481754859859)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'on'
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
 p_id=>wwv_flow_api.id(134976656226859861)
,p_chart_id=>wwv_flow_api.id(134976549151859860)
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
 p_id=>wwv_flow_api.id(134976770929859862)
,p_chart_id=>wwv_flow_api.id(134976549151859860)
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
 p_id=>wwv_flow_api.id(134976836234859863)
,p_chart_id=>wwv_flow_api.id(134976549151859860)
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
 p_id=>wwv_flow_api.id(45618573117270333)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45619011725270334)
,p_button_sequence=>300
,p_button_plug_id=>wwv_flow_api.id(45618296442270330)
,p_button_name=>'BTN_RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(68520969804627701)
,p_button_image_alt=>'Reset'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94246239964149315)
,p_branch_name=>'Show Results'
,p_branch_action=>'f?p=&APP_ID.:1100:&SESSION.::&DEBUG.::P1100_SHOW_RESULTS:1'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45618573117270333)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94246653597149319)
,p_branch_name=>'Reset'
,p_branch_action=>'f?p=&APP_ID.:1100:&SESSION.::&DEBUG.:1100:P1100_SHOW_RESULTS:0'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(45619011725270334)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45619331706270335)
,p_name=>'P1100_DIM_TIMES_DATE_FROM'
,p_is_required=>true
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45619815691270336)
,p_name=>'P1100_DIM_TIMES_DATE_TO'
,p_is_required=>true
,p_item_sequence=>2
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45620228158270337)
,p_name=>'P1100_DIM_TIME_HOUR_FROM'
,p_is_required=>true
,p_item_sequence=>3
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
,p_prompt=>'From Hour (0-23)'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(68520799110627690)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45620606957270338)
,p_name=>'P1100_DIM_TIME_HOUR_TO'
,p_is_required=>true
,p_item_sequence=>4
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
,p_prompt=>'To Hour (0-23)'
,p_source=>'23'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>5
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(68520799110627690)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45620951350270339)
,p_name=>'P1100_INTERVAL'
,p_is_required=>true
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45621399148270340)
,p_name=>'P1100_DIM_AGENTS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(68520576015627689)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45621742544270341)
,p_name=>'P1100_DIM_AGES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45622199694270342)
,p_name=>'P1100_DIM_BORDERPOSTS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45622553982270343)
,p_name=>'P1100_DIM_DOCUMENT_TYPES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
,p_prompt=>'Document Type'
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
 p_id=>wwv_flow_api.id(45622952727270344)
,p_name=>'P1100_DIM_GENDERS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45623361040270344)
,p_name=>'P1100_DIM_MOVEMENT_TYPES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45623749299270345)
,p_name=>'P1100_DIM_NATIONALITIES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45624191184270347)
,p_name=>'P1100_DIM_OFFICERS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45624575142270348)
,p_name=>'P1100_DIM_TIMES_YEAR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45624961837270349)
,p_name=>'P1100_DIM_TRANSPORT_MODES'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45625354593270350)
,p_name=>'P1100_DIM_VISA_TYPES'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(45625776511270350)
,p_name=>'P1100_SHOW_RESULTS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(45618296442270330)
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
 p_id=>wwv_flow_api.id(134976975834859864)
,p_name=>'REFRESH: CHART'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(134645413076388152)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134977075529859865)
,p_event_id=>wwv_flow_api.id(134976975834859864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(134976481754859859)
,p_stop_execution_on_error=>'Y'
);
end;
/
