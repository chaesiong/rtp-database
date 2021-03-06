prompt --application/pages/page_03551
begin
wwv_flow_api.create_page(
 p_id=>3551
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Test'
,p_page_mode=>'NORMAL'
,p_step_title=>'Test'
,p_step_sub_title=>'Test'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'CHRISTINA'
,p_last_upd_yyyymmddhh24miss=>'20180815165538'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(286010954464724197)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select level ,pnr, ''<pre>'' || LPAD(display_value,LENGTH(display_value)+2*(LEVEL-1) ) || ''</pre>'' as name, key_value, link gggg',
'from (select display_value, key_value, null pnr, ''<a href="''||APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:3511:&APP_SESSION.::&DEBUG.::P3511_KEY_VALUE:''||key_value, p_checksum_type => ''SESSION'')||''"><img src="/i/app_ui/img/icons/apex-edit-pencil.png'
||'" class="apex-edit-pencil" alt=""></a>'' link ',
'from dl_bordercontrol.adm_class_region r',
'union all',
'select display_value, key_value, ADM_CLASS_REGION pnr, ''<a href="''||APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:3521:&APP_SESSION.::&DEBUG.::P3521_KEY_VALUE:''||key_value ,p_checksum_type => ''SESSION'')||''"><img src="/i/app_ui/img/icons/apex-edit-penc'
||'il.png" class="apex-edit-pencil" alt=""></a>'' link ',
'from dl_bordercontrol.adm_class_province p',
'union all',
'select display_value, key_value, ADM_CLASS_PROVINCE pnr, ''<a href="''||APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:3531:&APP_SESSION.::&DEBUG.::P3531_KEY_VALUE:''||key_value ,p_checksum_type => ''SESSION'')||''"><img src="/i/app_ui/img/icons/apex-edit-pe'
||'ncil.png" class="apex-edit-pencil" alt=""></a>'' link  ',
'from dl_bordercontrol.adm_class_district d',
'union all',
'select display_value, key_value, ADM_CLASS_DISTRICT pnr, ''<a href="''||APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:3541:&APP_SESSION.::&DEBUG.::P3541_KEY_VALUE:''||key_value, p_checksum_type => ''SESSION'')||''"><img src="/i/app_ui/img/icons/apex-edit-pe'
||'ncil.png" class="apex-edit-pencil" alt=""></a>'' link  ',
'from dl_bordercontrol.adm_class_subdistrict s)',
'start with key_value in (select key_value from dl_bordercontrol.adm_class_region r) --''690659B76B8BF68FE053BE26780A006E''',
'connect by prior key_value = pnr'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(183110497904742598)
,p_name=>'LEVEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEVEL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Level'
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
 p_id=>wwv_flow_api.id(183110533101742599)
,p_name=>'PNR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PNR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Pnr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>128
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(183110630484742600)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(183110729061742601)
,p_name=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Key value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>128
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(183110904479742602)
,p_name=>'GGGG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GGGG'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Gggg'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(286011123759724198)
,p_internal_uid=>209486503639137506
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(288083886209915334)
,p_interactive_grid_id=>wwv_flow_api.id(286011123759724198)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(288084015227915334)
,p_report_id=>wwv_flow_api.id(288083886209915334)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(183332125064507592)
,p_view_id=>wwv_flow_api.id(288084015227915334)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(183110497904742598)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(183332639128507636)
,p_view_id=>wwv_flow_api.id(288084015227915334)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(183110533101742599)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(183333174947507644)
,p_view_id=>wwv_flow_api.id(288084015227915334)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(183110630484742600)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(183333699117507649)
,p_view_id=>wwv_flow_api.id(288084015227915334)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(183110729061742601)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(183342499981534314)
,p_view_id=>wwv_flow_api.id(288084015227915334)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(183110904479742602)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183329413518505121)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(286010954464724197)
,p_button_name=>'Create_Region'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Region'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_button_redirect_url=>'f?p=&APP_ID.:3511:&SESSION.::&DEBUG.:RP,3511::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183329790924505127)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(286010954464724197)
,p_button_name=>'Create_Province'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Province'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_button_redirect_url=>'f?p=&APP_ID.:3521:&SESSION.::&DEBUG.:RP,3521::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183330168563505128)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(286010954464724197)
,p_button_name=>'Create_District'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create District'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_button_redirect_url=>'f?p=&APP_ID.:3531:&SESSION.::&DEBUG.:RP,3531::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183330610239505130)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(286010954464724197)
,p_button_name=>'Create_Subdistrict'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Subdistrict'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_button_redirect_url=>'f?p=&APP_ID.:3541:&SESSION.::&DEBUG.:RP,3541::'
,p_grid_new_grid=>false
);
end;
/
