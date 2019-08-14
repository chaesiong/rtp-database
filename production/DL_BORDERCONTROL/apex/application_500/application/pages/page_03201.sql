prompt --application/pages/page_03201
begin
wwv_flow_api.create_page(
 p_id=>3201
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Visarun Rules'
,p_page_mode=>'NORMAL'
,p_step_title=>'Visarun Rules'
,p_step_sub_title=>'Visarun Rules'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'CHRISTINA'
,p_last_upd_yyyymmddhh24miss=>'20181023174417'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(596891419520592808)
,p_plug_name=>'Visarun Rules'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VISARUNID,',
'       VISA_KEYVALUE,',
'       MAX_USE_PER_YEAR,',
'       MAX_DAYS_EACH,',
'       INCLUDE_EXTSTAY_EACH,',
'       MAX_DAYS_TOTAL, ',
'       INCLUDE_EXTSTAY_TOTAL',
'  from X_VISARUN_RULES'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(172351161446488233)
,p_name=>'VISARUNID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VISARUNID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Visarunid'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(172351292029488234)
,p_name=>'VISA_KEYVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VISA_KEYVALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Visa keyvalue'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(172351376259488235)
,p_name=>'MAX_USE_PER_YEAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAX_USE_PER_YEAR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Max use per year'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(172351508931488236)
,p_name=>'MAX_DAYS_EACH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAX_DAYS_EACH'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Max days each'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(172351588163488237)
,p_name=>'INCLUDE_EXTSTAY_EACH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLUDE_EXTSTAY_EACH'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Include extstay each'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(172351710276488238)
,p_name=>'MAX_DAYS_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAX_DAYS_TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Max days total'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(172351764465488239)
,p_name=>'INCLUDE_EXTSTAY_TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLUDE_EXTSTAY_TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Include extstay total'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(539854132648647366)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(539854322470647367)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(596892584941592825)
,p_name=>'APEX$LINK'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:3211:&SESSION.::&DEBUG.:RP,3211:P3211_ROWID:&ROWID.'
,p_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(596893222207592831)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(596891955857592814)
,p_internal_uid=>520367335737006122
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(596892294531592817)
,p_interactive_grid_id=>wwv_flow_api.id(596891955857592814)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(596892388127592818)
,p_report_id=>wwv_flow_api.id(596892294531592817)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172664988472933761)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(172351161446488233)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172665481388933784)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(172351292029488234)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172665955834933789)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(172351376259488235)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172666478875933794)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(172351508931488236)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172666884961933800)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(172351588163488237)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172667388855933805)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>32
,p_column_id=>wwv_flow_api.id(172351710276488238)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(172667918983933811)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>33
,p_column_id=>wwv_flow_api.id(172351764465488239)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(542447781468482610)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(539854132648647366)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>55
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(596893042136592828)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(596892584941592825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(596893667574592832)
,p_view_id=>wwv_flow_api.id(596892388127592818)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(596893222207592831)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172661803554911984)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(596891419520592808)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:3211:&SESSION.::&DEBUG.:3211::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(172662218699911986)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(596891419520592808)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Extendstay - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/