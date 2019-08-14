prompt --application/pages/page_03510
begin
wwv_flow_api.create_page(
 p_id=>3510
,p_user_interface_id=>wwv_flow_api.id(165585018976055186)
,p_name=>'(Blacklist) Relationships Details'
,p_page_mode=>'NORMAL'
,p_step_title=>'(Blacklist) Relationships Details'
,p_step_sub_title=>'(Blacklist) Relationships Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(75628207662254518)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181023112740'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1151346322643478228)
,p_plug_name=>'(Blacklist) Relationship'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(165558797155055065)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1151360464287478544)
,p_plug_name=>'Translate (Blacklist) Relationship'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(165558797155055065)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select KEY_VALUE,',
'       LOCALE,',
'       DISPLAY_VALUE',
'  from BS_RELATIONSHIPS$I18N',
' where KEY_VALUE = :P3510_KEY_VALUE'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P3510_KEY_VALUE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P3510_ROWID'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1151361583456478546)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1151362016383478547)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1151362623513478548)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1151363232006478550)
,p_name=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P3510_KEY_VALUE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1151363901478478551)
,p_name=>'LOCALE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCALE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Locale'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(177257589835159431)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1151364474372478552)
,p_name=>'DISPLAY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Display Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>512
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(1151360849191478545)
,p_internal_uid=>1106835474741564871
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
,p_toolbar_buttons=>'RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(1151361258392478546)
,p_interactive_grid_id=>wwv_flow_api.id(1151360849191478545)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(1151361390807478546)
,p_report_id=>wwv_flow_api.id(1151361258392478546)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1151362480343478548)
,p_view_id=>wwv_flow_api.id(1151361390807478546)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(1151362016383478547)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1151363021101478549)
,p_view_id=>wwv_flow_api.id(1151361390807478546)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(1151362623513478548)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1151363649947478550)
,p_view_id=>wwv_flow_api.id(1151361390807478546)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(1151363232006478550)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1151364269091478551)
,p_view_id=>wwv_flow_api.id(1151361390807478546)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(1151363901478478551)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1151364867852478552)
,p_view_id=>wwv_flow_api.id(1151361390807478546)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(1151364474372478552)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141761908501978167)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(165579782173055115)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P3510_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141762731708978168)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_button_name=>'GET_PREVIOUS_ROWID'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(165579657427055112)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P3510_ROWID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141763158161978171)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_button_name=>'GET_NEXT_ROWID'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(165579657427055112)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P3510_ROWID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141761098537978166)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(165579782173055115)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:3500:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141762301539978168)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(165579782173055115)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P3510_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141761491998978167)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(165579782173055115)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P3510_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(141770429854978178)
,p_branch_action=>'f?p=&APP_ID.:3500:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'SAVE,DELETE,CREATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(141770807974978178)
,p_branch_action=>'f?p=&APP_ID.:3510:&SESSION.::&DEBUG.::P3510_ROWID:&P3510_ROWID_NEXT.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(141763158161978171)
,p_branch_sequence=>1
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(141771223108978178)
,p_branch_action=>'f?p=&APP_ID.:3510:&SESSION.::&DEBUG.::P3510_ROWID:&P3510_ROWID_PREV.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(141762731708978168)
,p_branch_sequence=>1
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141763572223978171)
,p_name=>'P3510_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rowid'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(165579318832055111)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141763969602978171)
,p_name=>'P3510_KEY_VALUE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Key Value'
,p_source=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_tag_attributes=>'style = "max-width: 225px"'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_read_only_when=>':P3510_ROWID IS NOT NULL'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(165579318832055111)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141764369247978172)
,p_name=>'P3510_LOCALE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_item_default=>'en_US'
,p_prompt=>'Locale'
,p_source=>'LOCALE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(165579318832055111)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141764739455978172)
,p_name=>'P3510_DISPLAY_VALUE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display Value'
,p_source=>'DISPLAY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>512
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(165579472946055112)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141765095923978173)
,p_name=>'P3510_NUM_VALUE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Num Value'
,p_source=>'NUM_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>38
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(165579318832055111)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141765533432978173)
,p_name=>'P3510_DISPLAY_ORDER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display Order'
,p_source=>'DISPLAY_ORDER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(165579318832055111)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141765925763978173)
,p_name=>'P3510_IS_ACTIVE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, key_value r',
'FROM dl_common.yes_nos$lc',
'WHERE is_active = ''Y''',
'ORDER BY display_order;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(165579472946055112)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141766298318978174)
,p_name=>'P3510_NOTICE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice'
,p_source=>'NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>54
,p_cMaxlength=>4000
,p_cHeight=>4
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(165579318832055111)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141766735142978174)
,p_name=>'P3510_OWNER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner'
,p_source=>'OWNER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'OWNERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) AS display_value',
'      ,key_value AS return_value',
'  FROM dl_common.owners$lc',
' ORDER BY display_order ASC, display_value ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(165579318832055111)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141767113722978174)
,p_name=>'P3510_ROW_FLAG_MASK'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_source=>'ROW_FLAG_MASK'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141767484398978175)
,p_name=>'P3510_ROWID_NEXT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141767955956978175)
,p_name=>'P3510_ROWID_PREV'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141768313176978176)
,p_name=>'P3510_ROWID_COUNT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(1151346322643478228)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'class="fielddata"'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(141760079425978165)
,p_tabular_form_region_id=>wwv_flow_api.id(1151360464287478544)
,p_validation_name=>'Locale: Check duplicates'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_count number;',
'  l_old_locale  BS_RELATIONSHIPS.LOCALE%type;',
'begin',
'  if :APEX$ROW_STATUS = ''U'' then',
'     select locale',
'     into l_old_locale',
'     from BS_RELATIONSHIPS$i18n',
'     where rowid = :ROWID;',
'     ',
'     if l_old_locale != :LOCALE then',
'       select count(*) ',
'       into l_count',
'       from BS_RELATIONSHIPS$i18n',
'       where locale = :LOCALE',
'       and Key_value = :P3510KEY_VALUE;',
'     else',
'       l_count := 0;',
'     end if;',
'     ',
'  elsif :APEX$ROW_STATUS = ''C'' then',
'    select count(*) ',
'    into l_count',
'    from BS_RELATIONSHIPS$i18n',
'    where locale = :LOCALE',
'    and Key_value = :P3510KEY_VALUE;',
'  end if;',
'  ',
'  if l_count >= 1 then',
'     return ''Found duplicated Locale'';',
'  end if;',
'  return null;',
'end ;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141768705365978176)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from BS_RELATIONSHIPS'
,p_attribute_02=>'BS_RELATIONSHIPS'
,p_attribute_03=>'P3510_ROWID'
,p_attribute_04=>'ROWID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141769959858978177)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_PAGINATION'
,p_process_name=>'Get Next or Previous Primary Key Value'
,p_attribute_02=>'BS_RELATIONSHIPS'
,p_attribute_03=>'P3510_ROWID'
,p_attribute_04=>'ROWID'
,p_attribute_07=>'KEY_VALUE'
,p_attribute_09=>'P3510_ROWID_NEXT'
,p_attribute_10=>'P3510_ROWID_PREV'
,p_attribute_13=>'P3510_ROWID_COUNT'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141760467328978166)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(1151360464287478544)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>' - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141769091264978177)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of CARD_TYPES'
,p_attribute_02=>'BS_RELATIONSHIPS'
,p_attribute_03=>'P3510_ROWID'
,p_attribute_04=>'ROWID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141769510242978177)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141761491998978167)
);
end;
/