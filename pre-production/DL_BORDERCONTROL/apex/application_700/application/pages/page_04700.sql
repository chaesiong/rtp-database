prompt --application/pages/page_04700
begin
wwv_flow_api.create_page(
 p_id=>4700
,p_user_interface_id=>wwv_flow_api.id(165585018976055186)
,p_name=>'Continents'
,p_page_mode=>'NORMAL'
,p_step_title=>'Continents'
,p_step_sub_title=>'Continents'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(75628207662254518)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181023113113'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(530346862387059168)
,p_plug_name=>'Continents'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(165558797155055065)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select KEY_VALUE,',
'       LOCALE,',
'       DISPLAY_VALUE,',
'       DISPLAY_ORDER,',
'       DISPLAY_CODE,',
'       IS_ACTIVE,',
'       NOTICE,',
'       NUM_VALUE',
'  from CONTINENTS'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(289509089183189541)
,p_name=>'DISPLAY_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_CODE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Display Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(473309575515113726)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(473309765337113727)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(530348027808059185)
,p_name=>'APEX$LINK'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:4410:&SESSION.::&DEBUG.:RP,4410:P4410_ROWID:&ROWID.'
,p_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(530348665074059191)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(530349305014059195)
,p_name=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Key Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'onChange="this.value=this.value.toUpperCase();"'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>128
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(530349816515059198)
,p_name=>'LOCALE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCALE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Locale'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(530350428398059199)
,p_name=>'DISPLAY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Display Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(530351110152059200)
,p_name=>'DISPLAY_ORDER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_ORDER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Display Order'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(530351682757059201)
,p_name=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_ACTIVE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Is Active'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(165699145145791088)
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
 p_id=>wwv_flow_api.id(530352305971059202)
,p_name=>'NOTICE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTICE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Notice'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(530352893908059203)
,p_name=>'NUM_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUM_VALUE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Num Value'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'EXISTS'
,p_readonly_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from DL_COMMON.CONTINENTS',
'where key_value = :Key_VALUE ',
'and bitand(row_flag_mask,1) = 1;'))
,p_readonly_for_each_row=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(530347398724059174)
,p_internal_uid=>488563270338003724
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
 p_id=>wwv_flow_api.id(530347737398059177)
,p_interactive_grid_id=>wwv_flow_api.id(530347398724059174)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(530347830994059178)
,p_report_id=>wwv_flow_api.id(530347737398059177)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(290783513562351104)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(289509089183189541)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(475903224334948970)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(473309575515113726)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>55
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530348485003059188)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(530348027808059185)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530349110441059192)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(530348665074059191)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530349631103059197)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(530349305014059195)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530350224952059199)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(530349816515059198)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530350892760059200)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(530350428398059199)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530351462515059201)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(530351110152059200)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530352095497059202)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(530351682757059201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530352663680059203)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(530352305971059202)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(530353247183059204)
,p_view_id=>wwv_flow_api.id(530347830994059178)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(530352893908059203)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79934457505562817)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(530346862387059168)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(165579782173055115)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:4710:&SESSION.::&DEBUG.:4710::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79934948954562844)
,p_tabular_form_region_id=>wwv_flow_api.id(530346862387059168)
,p_validation_name=>'Key Value Check duplicates'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_count number;',
'  l_old_key_value  CONTINENTS.KEY_VALUE%type;',
'begin',
'  if :APEX$ROW_STATUS = ''U'' then',
'     select key_value',
'     into l_old_key_value',
'     from CONTINENTS',
'     where rowid = :ROWID;',
'     ',
'     if l_old_key_value != upper(:KEY_VALUE) then',
'       select count(*) ',
'       into l_count',
'       from CONTINENTS',
'       where key_value = upper(:KEY_VALUE);',
'     else',
'       l_count := 0;',
'     end if;',
'     ',
'  elsif :APEX$ROW_STATUS = ''C'' then',
'    select count(*) ',
'    into l_count',
'    from CONTINENTS',
'    where key_value = upper(:KEY_VALUE);',
'  end if;',
'  ',
'  if l_count >= 1 then',
'     return ''Found duplicated Key Value'';',
'  end if;',
'  return null;',
'end ;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79935382573562847)
,p_tabular_form_region_id=>wwv_flow_api.id(530346862387059168)
,p_validation_name=>'Key values not changeble'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_count number;',
'  l_old_key_value  CONTINENTS.KEY_VALUE%type;',
'begin',
'  if :APEX$ROW_STATUS = ''U'' then',
'     select key_value',
'     into l_old_key_value',
'     from CONTINENTS',
'     where rowid = :ROWID;',
'     ',
'     if l_old_key_value != upper(:KEY_VALUE) then',
'       select count(*) ',
'       into l_count',
'       from CONTINENTS$I18N',
'       where key_value = l_old_key_value;',
'     else',
'       l_count := 0;',
'     end if;',
'  end if;',
'  ',
'  if l_count >= 1 then',
'     return ''Key Value already in use. You cannot change it'';',
'  end if;',
'  return null;',
'end ;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(79935770709562848)
,p_tabular_form_region_id=>wwv_flow_api.id(530346862387059168)
,p_validation_name=>'Num Value Check duplicates'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_count number;',
'  l_old_num_value  CONTINENTS.NUM_VALUE%type;',
'begin',
'  if :APEX$ROW_STATUS = ''U'' then',
'     select nvl(num_value, -9999)',
'     into l_old_num_value',
'     from CONTINENTS',
'     where rowid = :ROWID;',
'     ',
'     if l_old_num_value != :NUM_VALUE then',
'       select count(*) ',
'       into l_count',
'       from CONTINENTS',
'       where num_value = :NUM_VALUE;',
'     else',
'       l_count := 0;',
'     end if;',
'     ',
'  elsif :APEX$ROW_STATUS = ''C'' then',
'    select count(*) ',
'    into l_count',
'    from CONTINENTS',
'    where num_value = :NUM_VALUE;',
'  end if;',
'  ',
'  if l_count >= 1 then',
'     return ''Found duplicated Num Value'';',
'  end if;',
'  return null;',
'end ;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79936092739562851)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(530346862387059168)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'CONTINENTS- Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
