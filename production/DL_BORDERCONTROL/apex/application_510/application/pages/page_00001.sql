prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(45965479290928181)
,p_name=>'Landing Page'
,p_page_mode=>'NORMAL'
,p_step_title=>'Visa on Arrival (VoA)'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#webcamConnection.js',
'#APP_IMAGES#passreaderConnection.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setConfigWebcam($v("P1_CONFIG_WEBCAM"));',
'connectFace();',
'connectWebCam();',
'',
'setConfigPassReader($v("P1_CONFIG_PASSREADER"));',
'connectPassReader();',
'',
'setConfigBlacklistCheck($v("P1_CONFIG_BLACKLIST"));'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form--stretchInputs .t-Form-fieldContainer select.selectlist.apex-page-item-error {',
'    border-color: #eb6562;',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(45919221968927927)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_read_only_when=>':P1_APPROVAL_STATUS = ''CANCELED'''
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180802132314'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46074119852989034)
,p_plug_name=>'Passport information'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs:margin-top-none'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<div id="test"></div>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65264593684918671)
,p_plug_name=>'Passport items'
,p_parent_plug_id=>wwv_flow_api.id(46074119852989034)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65264616037918672)
,p_plug_name=>'Passport progress bar'
,p_region_name=>'passportRegion'
,p_parent_plug_id=>wwv_flow_api.id(46074119852989034)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'&nbsp;'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46074265666989035)
,p_plug_name=>'Fotoinformationen'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_region_attributes=>'style="text-align: center"'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<img id="photoPreview" style="width: 450px; height: 337.5px"  src="data:image/gif;base64">',
'<img id="photoSnapshot" style="width: 250px; height: 337.5px"  src="data:image/gif;base64">',
'<img id="photoNoPhoto" style="width: 450px; height: 337.5px" src="#WORKSPACE_IMAGES#template_photo.png">',
'',
'<img id="photoSearch" style="width: 250px; height: 337.5px; display: none;" src="data:image/gif;base64,">'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46075274152989045)
,p_plug_name=>'Buttoncontainer Fotoinformationen'
,p_parent_plug_id=>wwv_flow_api.id(46074265666989035)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45921816286927968)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46074896268989041)
,p_plug_name=>'Receipt'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(46774136033322741)
,p_name=>'History'
,p_template=>wwv_flow_api.id(45928798426927985)
,p_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h240:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT issuing_date',
'      ,person_name',
'      ,nationality',
'      ,sex',
'      ,date_of_birth',
'      ,visa_number',
'      ,receipt',
'  FROM v_visas',
' WHERE /*visa_key_value  = :P1_VISA',
'    OR */UPPER(passport_no)     = UPPER(:P1_PASS_NO)',
'ORDER BY issuing_date DESC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_PASS_NO'
,p_query_row_template=>wwv_flow_api.id(45941764110928023)
,p_query_num_rows=>5000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align: center; margin-top: 50px;">',
'  <span style="color: lightgrey;" aria-hidden="true" class="fa fa-history fa-5x fam-ellipsis-h"></span><br>',
'<h3>No history data found...</h3>',
'</div>'))
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117852796152845)
,p_query_column_id=>1
,p_column_alias=>'ISSUING_DATE'
,p_column_display_sequence=>1
,p_column_heading=>'Date'
,p_use_as_row_header=>'N'
,p_column_format=>'DD/MM/YYYY'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117970339152846)
,p_query_column_id=>2
,p_column_alias=>'PERSON_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(46775104186322750)
,p_query_column_id=>3
,p_column_alias=>'NATIONALITY'
,p_column_display_sequence=>3
,p_column_heading=>'Nationality'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(50654925745736719)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55118033838152847)
,p_query_column_id=>4
,p_column_alias=>'SEX'
,p_column_display_sequence=>4
,p_column_heading=>'Gender'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(50645029860665709)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55118172954152848)
,p_query_column_id=>5
,p_column_alias=>'DATE_OF_BIRTH'
,p_column_display_sequence=>5
,p_column_heading=>'Date of Birth'
,p_use_as_row_header=>'N'
,p_column_format=>'DD/MM/YYYY'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55118280122152849)
,p_query_column_id=>6
,p_column_alias=>'VISA_NUMBER'
,p_column_display_sequence=>6
,p_column_heading=>'Visa No.'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55118351240152850)
,p_query_column_id=>7
,p_column_alias=>'RECEIPT'
,p_column_display_sequence=>7
,p_column_heading=>'Receipt'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(64215881910523056)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46774484999322744)
,p_plug_name=>'Approval'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50557125961994838)
,p_plug_name=>'Fellow Passenger'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'  FROM rep_fellow_passenger',
' WHERE person = :P1_PERSON'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50558251258994849)
,p_name=>'NATIONALITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NATIONALITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Nationality'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(50654925745736719)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50560847482994875)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50560943488994876)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50561079846994877)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50561273775994879)
,p_name=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50561381231994880)
,p_name=>'PERSON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERSON'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50561484847994881)
,p_name=>'RELATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RELATION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Relation'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(50662522175785089)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50561605862994882)
,p_name=>'RECEIPT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIPT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Receipt'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>32
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50561650641994883)
,p_name=>'TM6_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TM6_NO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'TM6 No.'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50611761601458834)
,p_name=>'FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIRST_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'First Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50611852126458835)
,p_name=>'MIDDLE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MIDDLE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Middle Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50611995976458836)
,p_name=>'LAST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Last Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50612016323458837)
,p_name=>'SEX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEX'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Gender'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(50645029860665709)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50612155931458838)
,p_name=>'DATE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_BIRTH'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Date of Birth'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50612223238458839)
,p_name=>'PLACE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLACE_OF_BIRTH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50612345436458840)
,p_name=>'REASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REASON'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50612414718458841)
,p_name=>'APPROVAL_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPROVAL_STATUS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(50558100885994847)
,p_internal_uid=>11010186190125314
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
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(50581124311325142)
,p_interactive_grid_id=>wwv_flow_api.id(50558100885994847)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(50581296833325146)
,p_report_id=>wwv_flow_api.id(50581124311325142)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50582172712325255)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(50558251258994849)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50607998061337936)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(50560847482994875)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50608451624337942)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(50560943488994876)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50618097930536875)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(50561273775994879)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50618533614536881)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(50561381231994880)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50619034329536888)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(50561484847994881)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50619608808536892)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>32
,p_column_id=>wwv_flow_api.id(50561605862994882)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50620076785536896)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>33
,p_column_id=>wwv_flow_api.id(50561650641994883)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50620498162536901)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>34
,p_column_id=>wwv_flow_api.id(50611761601458834)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50620993727536909)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>35
,p_column_id=>wwv_flow_api.id(50611852126458835)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50621421832536913)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>36
,p_column_id=>wwv_flow_api.id(50611995976458836)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50621955725536918)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>37
,p_column_id=>wwv_flow_api.id(50612016323458837)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50622477536536923)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>38
,p_column_id=>wwv_flow_api.id(50612155931458838)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50623010008536928)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>39
,p_column_id=>wwv_flow_api.id(50612223238458839)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50623479349536933)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>40
,p_column_id=>wwv_flow_api.id(50612345436458840)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50623915212536938)
,p_view_id=>wwv_flow_api.id(50581296833325146)
,p_display_seq=>41
,p_column_id=>wwv_flow_api.id(50612414718458841)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71302287175108938)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.DERMALOG.THA.WEBCAM'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91684354124160071)
,p_plug_name=>'Fellow Passenger'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45922244475927968)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91684474336160072)
,p_plug_name=>'Regular information'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69402980647779342)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(46074896268989041)
,p_button_name=>'PRINT_RECEIPT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print receipt'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript: apex.navigation.popup({url: ''f?p=FEENFINE:15:&SESSION.::NO:RP,15:P15_KEY_VALUE:&P1_RECEIPT.''})'
,p_button_condition=>':P1_RECEIPT IS NOT NULL'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71302126912108937)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(46074896268989041)
,p_button_name=>'EDIT_RECEIPT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Receipt'
,p_button_position=>'BODY'
,p_button_redirect_url=>'&P1_URL_FEE_AND_FINE.'
,p_button_execute_validations=>'N'
,p_button_condition=>':P1_RECEIPT IS NOT NULL'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-edit'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91684285435160070)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(91684354124160071)
,p_button_name=>'OPEN_FELLOW_PASSENGER'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'+'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=99999:20:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-child'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46075330413989046)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(46075274152989045)
,p_button_name=>'RELOAD_PHOTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pillStart'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Reload photo'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'disableAtCancelation'
,p_icon_css_classes=>'fa-refresh fa-2x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46075513713989047)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(46075274152989045)
,p_button_name=>'PHOTO_LEFT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Photo left'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'disableAtCancelation'
,p_icon_css_classes=>'fa-arrow-left-alt fa-2x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46075574512989048)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(46075274152989045)
,p_button_name=>'PHOTO_UP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Photo up'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'disableAtCancelation'
,p_icon_css_classes=>'fa-arrow-up-alt fa-2x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46075667837989049)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(46075274152989045)
,p_button_name=>'PHOTO_DOWN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Photo down'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'disableAtCancelation'
,p_icon_css_classes=>'fa-arrow-down-alt fa-2x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46075796450989050)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(46075274152989045)
,p_button_name=>'PHOTO_RIGHT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Photo right'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'disableAtCancelation'
,p_icon_css_classes=>'fa-arrow-right-alt fa-2x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46075862700989051)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(46075274152989045)
,p_button_name=>'PHOTO_ZOOM_IN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Photo zoom in'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'disableAtCancelation'
,p_icon_css_classes=>'fa-search-plus fa-2x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46075936456989052)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(46075274152989045)
,p_button_name=>'PHOTO_ZOOM_OUT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Photo zoom out'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'disableAtCancelation'
,p_icon_css_classes=>'fa-search-minus fa-2x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46076169920989054)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(46075274152989045)
,p_button_name=>'PHOTO_SHOOT'
,p_button_static_id=>'shootPhoto'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pillEnd'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Photo shoot'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'disableAtCancelation'
,p_icon_css_classes=>'fa-camera fa-2x'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(127130136643354265)
,p_branch_name=>'SUBMIT AND REDIRECT'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:REDIRECTED:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_WORKFLOW_STATUS LIKE ''SAVE%'' AND ',
'(:P1_WORKFLOW_STATUS NOT LIKE ''_WITH_FEE_EXCEPTION'' AND',
' :P1_WORKFLOW_STATUS NOT LIKE ''_WITHOUT_PRINT_FORM'')'))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(127129793658354261)
,p_branch_name=>'PRINT PREVIEW'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:PRINT_FORM:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(59431937884544574)
,p_branch_name=>'SUBMIT PAGE WITH VALUES'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:OPEN_FEE_AND_FINE:&DEBUG.:RP:P1_OPEN_MODAL:FEE&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>':P1_ACTION = ''SAVE_DATA'' AND 1 = 2'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(71057790203380858)
,p_branch_name=>'SUBMIT PAGE: ONLY PRINT FORM'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:PRINT_FORM:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_ACTION = ''SAVE_DATA'' AND ',
':P1_PRINT_FORM = ''Y'' AND 1 = 2'))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(71058025247380861)
,p_branch_name=>'CANCEL PAGE WITHOUT PRINT AND FEENFINE'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:RESTART:&DEBUG.:RP,1::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_WORKFLOW_STATUS LIKE ''SAVE%'' AND ',
':P1_WORKFLOW_STATUS LIKE ''%_WITHOUT_PRINT_FORM%'''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46075004554989042)
,p_name=>'P1_QUITTUNG_BUCHNUMMER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46074896268989041)
,p_prompt=>'Receipt:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>20
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46075026594989043)
,p_name=>'P1_QUITTUNG_NUMMER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(46074896268989041)
,p_prompt=>'&nbsp;'
,p_pre_element_text=>'<span style="padding-right: 10px">/</span> '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46076347982989056)
,p_name=>'P1_NO_PHOTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46075274152989045)
,p_prompt=>'No Photo'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:No Photo;1'
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(45954064279928066)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46076592221989058)
,p_name=>'P1_PASS_NO'
,p_is_required=>true
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_read_only_when=>':P1_VISA IS NOT NULL'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46076687774989059)
,p_name=>'P1_NATIONALITY'
,p_is_required=>true
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ICAO_DOC_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by UPPER(d) ASC',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46076768144989060)
,p_name=>'P1_LAST_NAME'
,p_is_required=>true
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'FAMILY NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46076848517989061)
,p_name=>'P1_NAME'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'FIRST NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46076977134989062)
,p_name=>'P1_MIDDLE_NAME'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'MIDDLE NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077057399989063)
,p_name=>'P1_BIRTHDAY'
,p_is_required=>true
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_LG.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077206154989064)
,p_name=>'P1_SEX'
,p_is_required=>true
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077217906989065)
,p_name=>'P1_SALUTATION'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Salutation:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SALUTATIONS_PK'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_salutations'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077338493989066)
,p_name=>'P1_IMMIGRATION_CARD'
,p_is_required=>true
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Immigration Card TM6 No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077499207989067)
,p_name=>'P1_FROM_COUNTRY'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'From Country:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_COUNTRIES_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_value, return_value ',
'  FROM lov_countries',
' ORDER BY UPPER(display_value) ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077566023989068)
,p_name=>'P1_PASSPORT_ORIGIN'
,p_is_required=>true
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Issuing Country:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ICAO_DOC_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by UPPER(d) ASC',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077658972989069)
,p_name=>'P1_PASSPORT_CREATED'
,p_is_required=>true
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Date of Issue:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_MD.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077783260989070)
,p_name=>'P1_PASSPORT_TILL'
,p_is_required=>true
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Expiry Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:&AI_DATE_RANGE_FUTURE_MD.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077817793989071)
,p_name=>'P1_TRAVEL_DATE'
,p_is_required=>true
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Travel Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46077914756989072)
,p_name=>'P1_TRANSPORT_TYPE'
,p_is_required=>true
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Transport Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TRANS_VEHICLES_PK'
,p_lov=>'SELECT display_value, return_value FROM lov_trans_vehicles'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46078089860989073)
,p_name=>'P1_FLIGHT_NUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Flight No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46078196992989074)
,p_name=>'P1_PROFESSION'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Occupation:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROFESSIONS_PK'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_professions'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46078327370989076)
,p_name=>'P1_ADDRESS'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Permanent Address:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46078540107989078)
,p_name=>'P1_ADDRESS_IN_THA'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Address in Thailand:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46078708013989079)
,p_name=>'P1_ADDRESS_IN_THA_PROVINCE'
,p_is_required=>true
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_province'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46078797782989080)
,p_name=>'P1_ADDRESS_IN_THA_DISTRICT'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Ampur:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_district WHERE adm_class_province = :P1_ADDRESS_IN_THA_PROVINCE'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P1_ADDRESS_IN_THA_PROVINCE'
,p_ajax_items_to_submit=>'P1_ADDRESS_IN_THA_PROVINCE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46078840151989081)
,p_name=>'P1_ADDRESS_IN_THA_SUBDISTRICT'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Tambon:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_subdistrict WHERE adm_class_district = :P1_ADDRESS_IN_THA_DISTRICT'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P1_ADDRESS_IN_THA_DISTRICT'
,p_ajax_items_to_submit=>'P1_ADDRESS_IN_THA_DISTRICT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46078987776989082)
,p_name=>'P1_CONTACT_THA'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Contact Person:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>250
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46079036647989083)
,p_name=>'P1_RELATIONSHIP'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Relation:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_RELATIONS_PK'
,p_lov=>'SELECT display_value, return_value FROM lov_relations'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46774566076322745)
,p_name=>'P1_APPROVAL_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46774484999322744)
,p_item_default=>'APPROVED'
,p_prompt=>'Approval Status:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'P1_LOV_STATUSES_STATUS_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM dl_bordercontrol.lov_statuses ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''VOA_STATUS_LOV''',
' UNION',
'SELECT display_value',
'      ,return_value',
'  FROM dl_bordercontrol.lov_statuses',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''VOA_STATUS''',
'   AND return_value = :P20_APPROVED_STATUS'))
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46774659734322746)
,p_name=>'P1_APPROVAL_DATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(46774484999322744)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Requesting Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46774783331322747)
,p_name=>'P1_APPROVAL_OFFICER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46774484999322744)
,p_item_default=>':AI_USERNAME'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Officer:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46774820822322748)
,p_name=>'P1_APPROVAL_TILL'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(46774484999322744)
,p_item_default=>'SYSDATE + 15'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Visa Expiry Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47022259014797476)
,p_name=>'P1_FEE_EXCEPTION'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Fee Exception:'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47022404381797477)
,p_name=>'P1_NO_RECEIPT'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_item_default=>'Y'
,p_prompt=>'Print Receipt:'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47022494782797478)
,p_name=>'P1_PRINT_FORM'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Print Form:'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50612556695458842)
,p_name=>'P1_PERSON'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50612682099458843)
,p_name=>'P1_VISA'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50613087954458847)
,p_name=>'P1_CAMERA_FILE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46075274152989045)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52507977594831856)
,p_name=>'P1_SEARCH_MODE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53195513629831744)
,p_name=>'P1_CONFIG_WEBCAM'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_item_default=>'{"cameraItem": "#P1_CAMERA_FILE", "previewImageSelector": "#photoPreview", "snapshotImageSelector": "#photoSnapshot"}'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53195572430831745)
,p_name=>'P1_CONFIG_PASSREADER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{ "progressBar":{',
'                "colorSuccessStart": "#9ae2aa",',
'                "colorFailureStart": "#f77e7e"',
'                },                ',
'  "apexItems":{',
'                "lastName": "#P1_LAST_NAME",',
'                "middleName": "#P1_MIDDLE_NAME",',
'                "firstName": "#P1_NAME",',
'                "nationality": "#P1_NATIONALITY",',
'                "gender": "#P1_SEX",',
'                "passportNo": "#P1_PASS_NO",',
'                "expirationDate": "#P1_PASSPORT_EXPIRY_DATE",',
'                "issuingStateCode": "#P1_PASSPORT_ORIGIN",',
'                "dateOfBirth": "#P1_PASSPORT_DATE_OF_BIRTH",',
'                "placeOfBirth": "#P1_PLACE_OF_BIRTH",',
'                "documentClassCode": "#P1_PASSPORT_DOCTYPE",',
'                "mrz": "#P1_PASSPORT_MRZ",',
'                "imageLightAxial": "#P1_PASSPORT_VISUALPAGE",',
'                "imageLightIR": "#P1_PASSPORT_IRPAGE",',
'                "imageLightUV": "#P1_PASSPORT_UVPAGE",',
'                "imageLightWhite": "#P1_PASSPORT_ICAO_FACE",',
'                "imagePortrait": "#P1_PASSPORT_VISUAL_FACE",',
'                "updateEvent": "pushToDatabase",',
'                "updateEventItem": "#P1_PASS_NO"',
'              }',
'}'))
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53195690641831746)
,p_name=>'P1_PASSPORT_DOCTYPE'
,p_is_required=>true
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_colspan=>3
,p_read_only_when=>':P1_VISA IS NOT NULL'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53195788942831747)
,p_name=>'P1_PASSPORT_MRZ'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53195875737831748)
,p_name=>'P1_PASSPORT_VISUAL_FACE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196009857831749)
,p_name=>'P1_PASSPORT_ICAO_FACE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196080112831750)
,p_name=>'P1_PASSPORT_VISUALPAGE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196182695831751)
,p_name=>'P1_PASSPORT_UVPAGE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196242235831752)
,p_name=>'P1_PASSPORT_IRPAGE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196326966831753)
,p_name=>'P1_PASSPORT_DG3_0'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196424839831754)
,p_name=>'P1_PASSPORT_DG3_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196520408831755)
,p_name=>'P1_PLACE_OF_BIRTH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196689778831756)
,p_name=>'P1_PASSPORT_DATE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53196725490831757)
,p_name=>'P1_PASSPORT_EXPIRY_DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59298716519346475)
,p_name=>'P1_RELEASE_NOTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(46774484999322744)
,p_prompt=>'Note:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_SEARCH_MODE = 1 AND',
':P1_VISA IS NOT NULL'))
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59427973133544434)
,p_name=>'P1_BLACKLIST_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59429140385544446)
,p_name=>'P1_VISA_NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(91684474336160072)
,p_item_default=>'dl_bordercontrol.voa_apex_pkg.get_next_visa_number()'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Visa Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59431274422544567)
,p_name=>'P1_RECEIPT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(46074896268989041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59431643106544571)
,p_name=>'P1_OPEN_MODAL'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59432246192544577)
,p_name=>'P1_URL_FEE_AND_FINE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65262514583918650)
,p_name=>'P1_ACTION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65264853079918674)
,p_name=>'P1_CONFIG_BLACKLIST'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_item_default=>'RETURN dl_bordercontrol.pkg_blacklist_util.get_params_blacklist_service();'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68213703603005442)
,p_name=>'P1_BLACKLIST_RECORD'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69403108906779343)
,p_name=>'P1_RECEIPT_CREATED_AT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(46074896268989041)
,p_prompt=>'Created at:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>':P1_RECEIPT IS NOT NULL'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69403143912779344)
,p_name=>'P1_RECEIPT_COSTS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(46074896268989041)
,p_prompt=>'Costs:'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_display_when=>':P1_RECEIPT IS NOT NULL'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69403295931779345)
,p_name=>'P1_RECEIPT_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(46074896268989041)
,p_prompt=>'Status:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_STATUSES_PAYMENT_STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM lov_statuses ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''VOA_PAYMENT_STATUS'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_display_when=>':P1_RECEIPT IS NOT NULL'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91684626308160074)
,p_name=>'P1_TERMINAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(91684474336160072)
,p_item_default=>':AI_TERMINAL_ID'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Created on Terminal:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TERMINALS_PK_IPADDRESS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.display_value_ip, return_value',
'  FROM dl_bordercontrol.lov_terminals t'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91684731008160075)
,p_name=>'P1_CANCEL_NOTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(46774484999322744)
,p_prompt=>'Cancel Remark:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_SEARCH_MODE = 1 AND',
':P1_VISA IS NOT NULL'))
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100395227453787676)
,p_name=>'P1_INSERT_MODE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(127130017946354264)
,p_name=>'P1_WORKFLOW_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(127130219601354266)
,p_name=>'P1_URL_PRINT_FORM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(127130365989354267)
,p_name=>'P1_URL_BLACKLIST'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65264593684918671)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(68214994702005455)
,p_computation_sequence=>10
,p_computation_item=>'P1_TRANSPORT_TYPE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT key_value',
'  FROM dl_common.trans_vehicles$lc',
' WHERE trans_mode = ''AIR''',
'   AND ROWNUM     = 1'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50613760650458854)
,p_name=>'ON CLICK: PHOTO_DOWN'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46075667837989049)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50613868538458855)
,p_event_id=>wwv_flow_api.id(50613760650458854)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.tiltDown();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50613980997458856)
,p_name=>'ON CLICK: PHOTO_UP'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46075574512989048)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50614073322458857)
,p_event_id=>wwv_flow_api.id(50613980997458856)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.tiltUp();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50614128640458858)
,p_name=>'ON CLICK: PHOTO_LEFT'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46075513713989047)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50614295682458859)
,p_event_id=>wwv_flow_api.id(50614128640458858)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.panLeft();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50614376089458860)
,p_name=>'ON CLICK: PHOTO_RIGHT'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46075796450989050)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50614481644458861)
,p_event_id=>wwv_flow_api.id(50614376089458860)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.panRight();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50614579275458862)
,p_name=>'ON CLICK: PHOTO_ZOOM_IN'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46075862700989051)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50614637799458863)
,p_event_id=>wwv_flow_api.id(50614579275458862)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.zoomIn();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50614717161458864)
,p_name=>'ON CLICK: PHOTO_ZOOM_OUT'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46075936456989052)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50614842996458865)
,p_event_id=>wwv_flow_api.id(50614717161458864)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.zoomOut();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50614981311458866)
,p_name=>'ON CLICK: PHOTO_SHOOT'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46076169920989054)
,p_condition_element=>'P1_NO_PHOTO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50615079894458867)
,p_event_id=>wwv_flow_api.id(50614981311458866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'doSnapshot();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71058177716380862)
,p_event_id=>wwv_flow_api.id(50614981311458866)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoSearch'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50615348235458870)
,p_event_id=>wwv_flow_api.id(50614981311458866)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoPreview'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50615687153458873)
,p_event_id=>wwv_flow_api.id(50614981311458866)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoSnapshot'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(53198181458831771)
,p_name=>'ON CLICK: TAKE_PHOTO'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#p1_buttonTakePhoto'
,p_condition_element=>'P1_NO_PHOTO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53198237747831772)
,p_event_id=>wwv_flow_api.id(53198181458831771)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'doSnapshot();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71058243889380863)
,p_event_id=>wwv_flow_api.id(53198181458831771)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoSearch'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53198369248831773)
,p_event_id=>wwv_flow_api.id(53198181458831771)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoPreview'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53198500661831774)
,p_event_id=>wwv_flow_api.id(53198181458831771)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoSnapshot'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50615781475458874)
,p_name=>'ON CLICK: RELOAD_PHOTO'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46075330413989046)
,p_condition_element=>'P1_NO_PHOTO'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50615869753458875)
,p_event_id=>wwv_flow_api.id(50615781475458874)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoPreview'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50615978033458876)
,p_event_id=>wwv_flow_api.id(50615781475458874)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoSnapshot'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50616106844458877)
,p_event_id=>wwv_flow_api.id(50615781475458874)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_CAMERA_FILE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53195343959831743)
,p_event_id=>wwv_flow_api.id(50615781475458874)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoSearch'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108332940254908250)
,p_event_id=>wwv_flow_api.id(50615781475458874)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process ( ',
'    "CLEANUP_CAMERA_IMAGE_FROM_COLLECTION", {}, {',
'		success: function (pData) {',
'		}',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50616272289458879)
,p_name=>'ON CHANGE: NO PHOTO'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_NO_PHOTO'
,p_condition_element=>'P1_NO_PHOTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50616711763458883)
,p_event_id=>wwv_flow_api.id(50616272289458879)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoNoPhoto'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50616487383458881)
,p_event_id=>wwv_flow_api.id(50616272289458879)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoPreview'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50824435349474234)
,p_event_id=>wwv_flow_api.id(50616272289458879)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoPreview'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50824603661474235)
,p_event_id=>wwv_flow_api.id(50616272289458879)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoSnapshot'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50616580150458882)
,p_event_id=>wwv_flow_api.id(50616272289458879)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoNoPhoto'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50824707214474236)
,p_event_id=>wwv_flow_api.id(50616272289458879)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_CAMERA_FILE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50824915878474239)
,p_name=>'SHORTCUTS'
,p_event_sequence=>140
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50825310622474242)
,p_event_id=>wwv_flow_api.id(50824915878474239)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'PLUGIN_COM.DERMALOG.SHORTCUT'
,p_attribute_01=>'F12'
,p_attribute_03=>'apex.event.trigger("#p1_buttonSave", "click");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50825346525474243)
,p_event_id=>wwv_flow_api.id(50824915878474239)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'PLUGIN_COM.DERMALOG.SHORTCUT'
,p_attribute_01=>'F8'
,p_attribute_03=>'document.getElementById("p1_buttonCancel").click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50825132552474241)
,p_event_id=>wwv_flow_api.id(50824915878474239)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.SHORTCUT'
,p_attribute_01=>'F11'
,p_attribute_03=>'apex.event.trigger("#p1_buttonTakePhoto", "click");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50825021570474240)
,p_event_id=>wwv_flow_api.id(50824915878474239)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'PLUGIN_COM.DERMALOG.SHORTCUT'
,p_attribute_01=>'F7'
,p_attribute_03=>'apex.event.trigger("#p1_buttonPrintPreview", "click");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50825621885474246)
,p_event_id=>wwv_flow_api.id(50824915878474239)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.SHORTCUT'
,p_attribute_01=>'F3'
,p_attribute_03=>'document.getElementById("p1_buttonSearch").click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(127130471810354268)
,p_event_id=>wwv_flow_api.id(50824915878474239)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.SHORTCUT'
,p_attribute_01=>'F7'
,p_attribute_03=>'apex.event.trigger("#p1_buttonPrintPreview", "click");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(52508048512831857)
,p_name=>'HIDE: photoPreview'
,p_event_sequence=>150
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P1_SEARCH_MODE = 1        OR',
' :P1_INSERT_MODE = 1)       AND ',
':P1_VISA        IS NOT NULL AND',
'NVL(:P1_CAMERA_FILE, 0) > 0 AND',
':P1_NO_PHOTO    IS NULL'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52508122061831858)
,p_event_id=>wwv_flow_api.id(52508048512831857)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoSearch'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53195313615831742)
,p_event_id=>wwv_flow_api.id(52508048512831857)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoPreview'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108332065088908241)
,p_event_id=>wwv_flow_api.id(52508048512831857)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("Test");',
'apex.server.process ( ',
'    "GET_CAMERA_IMAGE_FROM_COLLECTION",',
'    {',
'         x01: "test"',
'    },',
'    {',
'		success: function (pData) ',
'		{',
'            $("#photoSearch").attr("src", "data:image/gif;base64," + pData.image);',
'		}',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71301913559108934)
,p_name=>'HIDE: NO_PHOTO'
,p_event_sequence=>160
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_VISA        IS NOT NULL AND',
':P1_NO_PHOTO    IS NOT NULL'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71301931641108935)
,p_event_id=>wwv_flow_api.id(71301913559108934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoNoPhoto'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71302072657108936)
,p_event_id=>wwv_flow_api.id(71301913559108934)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#photoPreview'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(53196877373831758)
,p_name=>'ON CHANGE: P1_PASSPORT_EXPIRY_DATE'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_PASSPORT_EXPIRY_DATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53196951212831759)
,p_event_id=>wwv_flow_api.id(53196877373831758)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var expiryDate = apex.item("P1_PASSPORT_EXPIRY_DATE").getValue();',
'expiryDate = expandPassportDate(expiryDate, {future: true, range: 20});',
'',
'apex.item("P1_PASSPORT_TILL").setValue(expiryDate);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(53197090042831760)
,p_name=>'ON CHANGE: P1_PASSPORT_DATE_OF_BIRTH'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_PASSPORT_DATE_OF_BIRTH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53197206775831761)
,p_event_id=>wwv_flow_api.id(53197090042831760)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var dateOfBirth = apex.item("P1_PASSPORT_DATE_OF_BIRTH").getValue();',
'dateOfBirth = expandPassportDate(dateOfBirth, {past: true});',
'',
'apex.item("P1_BIRTHDAY").setValue(dateOfBirth);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(53197557203831765)
,p_name=>'CUSTOM: PUSH TO DATABASE'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_PASS_NO'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'pushToDatabase'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53197641992831766)
,p_event_id=>wwv_flow_api.id(53197557203831765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'NULL;',
'',
':P1_NAME := SUBSTR(TRIM(:P1_NAME), 1, INSTR(:P1_NAME, '' '') - 1);',
':P1_MIDDLE_NAME := SUBSTR(TRIM(:P1_NAME), INSTR(:P1_NAME, '' ''));'))
,p_attribute_02=>'P1_PASSPORT_EXPIRY_DATE,P1_PASSPORT_DATE_OF_BIRTH,P1_PLACE_OF_BIRTH,P1_PASSPORT_DG3_0,P1_PASSPORT_DG3_1,P1_PASSPORT_IRPAGE,P1_PASSPORT_UVPAGE,P1_PASSPORT_VISUALPAGE,P1_PASSPORT_ICAO_PAGE,P1_PASSPORT_VISUAL_FACE,P1_PASSPORT_MRZ,P1_PASSPORT_DOCTYPE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(58417493414470470)
,p_name=>'ON CHANGE: P1_PASS_NO'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_PASS_NO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59430905368544563)
,p_event_id=>wwv_flow_api.id(58417493414470470)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P1_PASS_NO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(58417576564470471)
,p_event_id=>wwv_flow_api.id(58417493414470470)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(46774136033322741)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(58417644655470472)
,p_name=>'ON CHANGE: P1_CUSTOM_RECEIPT'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_CUSTOM_RECEIPT'
,p_condition_element=>'P1_CUSTOM_RECEIPT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(58417799941470473)
,p_event_id=>wwv_flow_api.id(58417644655470472)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_QUITTUNG_BUCHNUMMER,P1_QUITTUNG_NUMMER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(58417914279470474)
,p_event_id=>wwv_flow_api.id(58417644655470472)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_QUITTUNG_BUCHNUMMER,P1_QUITTUNG_NUMMER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(59428056936544435)
,p_name=>'DIALOG CLOSED: BLACKLIST SCREEN'
,p_event_sequence=>220
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "11"'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59428157892544436)
,p_event_id=>wwv_flow_api.id(59428056936544435)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_RELEASE_NOTE'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P11_NOTE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59428251354544437)
,p_event_id=>wwv_flow_api.id(59428056936544435)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_BLACKLIST_STATUS'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P11_BLACKLIST_STATUS'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68213558390005441)
,p_event_id=>wwv_flow_api.id(59428056936544435)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_BLACKLIST_RECORD'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P11_RECORD_NO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59430023738544455)
,p_event_id=>wwv_flow_api.id(59428056936544435)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(this.triggeringElement);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59428929787544444)
,p_event_id=>wwv_flow_api.id(59428056936544435)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'AFTER_BLACKLIST'
,p_attribute_02=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(59429872681544453)
,p_name=>'DIALOG CLOSED: FEE AND FINE'
,p_event_sequence=>230
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && (this.data.dialogPageId == "10" || this.data.dialogPageId == "50") && this.data.P10_RETURN_RECEIPT_NO1 != undefined'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59430367145544458)
,p_event_id=>wwv_flow_api.id(59429872681544453)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_QUITTUNG_BUCHNUMMER'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P10_RETURN_RECEIPT_NO1'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59430419784544459)
,p_event_id=>wwv_flow_api.id(59429872681544453)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_QUITTUNG_NUMMER'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P10_RETURN_RECEIPT_NO2'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59430945733544564)
,p_event_id=>wwv_flow_api.id(59429872681544453)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_CUSTOM_RECEIPT'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P10_CHOOSE_MANUAL'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59431489755544569)
,p_event_id=>wwv_flow_api.id(59429872681544453)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_RECEIPT'
,p_attribute_01=>'DIALOG_RETURN_ITEM'
,p_attribute_09=>'N'
,p_attribute_10=>'P10_KEY_VALUE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59431519255544570)
,p_event_id=>wwv_flow_api.id(59429872681544453)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'SAVE_RECEIPT'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(59432093287544575)
,p_name=>'OPEN DIALOG: FEE AND FINE'
,p_event_sequence=>240
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_WORKFLOW_STATUS     LIKE ''SAVE%'' AND',
':P1_RECEIPT            IS NULL'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59432160646544576)
,p_event_id=>wwv_flow_api.id(59432093287544575)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.redirect(apex.item(''P1_URL_FEE_AND_FINE'').getValue());'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65263028404918656)
,p_name=>'OPEN POPUP: PRINT PREVIEW'
,p_event_sequence=>250
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P1_WORKFLOW_STATUS     LIKE ''SAVE%''               AND',
' :P1_WORKFLOW_STATUS     LIKE ''%_WITH_PRINT_FORM%''  AND',
' (:P1_WORKFLOW_STATUS    LIKE ''%_WITH_FEE_EXCEPTION%''    OR',
'  (:P1_WORKFLOW_STATUS   LIKE ''%_WITHOUT_FEE_EXCEPTION%'' AND ',
'   :P1_RECEIPT           IS NOT NULL))) OR',
':P1_WORKFLOW_STATUS      LIKE ''JUST_SAVE_PREVIEW%'''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65263183016918657)
,p_event_id=>wwv_flow_api.id(65263028404918656)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.popup({',
'    url: apex.item("P1_URL_PRINT_FORM").getValue(),',
'    name: ''Print Form (VISA on Arrival)''',
'});'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65263442854918660)
,p_name=>'ON CLICK: SAVE'
,p_event_sequence=>260
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#p1_buttonSave'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P1_APPROVAL_STATUS != ''CANCELED'''
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65265135219918677)
,p_event_id=>wwv_flow_api.id(65263442854918660)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P1_BIRTHDAY,P1_PASSPORT_TILL,P1_PASS_NO,P1_FIRST_NAME,P1_MIDDLE_NAME,P1_LAST_NAME,P1_NATIONALITY,P1_SEX'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65263526560918661)
,p_event_id=>wwv_flow_api.id(65263442854918660)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// opens blacklist-screen if no validation errors were found',
'function saveData() {',
'    ',
'    var searchObject = {demographic: {',
'                        dateOfBirth: new Date(apex.item("P1_BIRTHDAY").getValue()), ',
'                        expiryDate: new Date(apex.item("P1_PASSPORT_TILL").getValue()),',
'                        firstname: apex.item("P1_NAME").getValue(),',
'                        middlename: apex.item("P1_MIDDLE_NAME").getValue(),',
'                        surname: apex.item("P1_LAST_NAME").getValue(),',
'                        nationality: apex.item("P1_NATIONALITY").getValue(),',
'                        passportNumber: apex.item("P1_PASS_NO").getValue(),',
'                        sex: apex.item("P1_SEX").displayValueFor(apex.item("P1_SEX").getValue()).toUpperCase()',
'                    },',
'                    TransactionID: ''blackListSearch'' + (+new Date())};',
'    ',
'    ',
'    // Blacklist Service is out of order and will be changed',
'    // in the meanwhile nobody is on blacklist',
'    apex.submit(''SAVE'');',
'    ',
'    /*simpleSearch(function(hit) {',
'      if(hit) {',
'          apex.navigation.redirect(apex.item(''P1_URL'').getValue());',
'      }',
'      else {',
'          apex.submit(''SAVE'');',
'      }',
'    }, searchObject);*/',
'}',
'',
'function showError(checkPhoto) {',
'    ',
'    apex.message.clearErrors();',
'    var errors = [];',
'    ',
'    if(!apex.page.validate()) {',
'        errors.push({type: ''error'', location: ''page'', message: ''Please fix the red input fields first.'', unsafe: false});',
'    }',
'    ',
'    if(!checkPhoto) {',
'        errors.push({type: ''error'', location: ''page'', message: ''Please take a photo or activate the checkbox "No Photo" before saving.'', unsafe: false});',
'    }',
'    ',
'    if(errors.length > 0) {',
'        apex.message.showErrors(errors);',
'    }',
'}',
'',
'// execute actual code',
'apex.server.process ("GET_CAMERA_IMAGE_FROM_COLLECTION", {}, {',
'		success: function (pData) {',
'            ',
'            var checkPhoto = $("#P1_NO_PHOTO_0").prop("checked") || pData.image != null;',
'            ',
'            if(apex.page.validate() && checkPhoto) {',
'                saveData(); // function is declared above',
'            }',
'            else {',
'                showError(checkPhoto); // function is declared above',
'            }',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91683396056160061)
,p_name=>'MANDATORY: ITEMS'
,p_event_sequence=>270
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[aria-required=''true'']'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.value == ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91683907696160066)
,p_event_id=>wwv_flow_api.id(91683396056160061)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91683454551160062)
,p_event_id=>wwv_flow_api.id(91683396056160061)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100391204404787635)
,p_name=>'DISABLE: AT CANCELATION'
,p_event_sequence=>280
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P1_APPROVAL_STATUS = ''CANCELED'''
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100391252402787636)
,p_event_id=>wwv_flow_api.id(100391204404787635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'.disableAtCancelation'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100391495384787638)
,p_name=>'READONLY: ITEMS'
,p_event_sequence=>290
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100391530617787639)
,p_event_id=>wwv_flow_api.id(100391495384787638)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_QUITTUNG_BUCHNUMMER,P1_QUITTUNG_NUMMER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'this.affectedElements.each(function() {',
'   $(this).attr("readonly", "readonly").addClass("apex_disabled");',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100395527262787679)
,p_name=>'CUSTOM: HANDLE CAMERA IMAGE'
,p_event_sequence=>300
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DAHandleCameraImage'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100395742487787681)
,p_event_id=>wwv_flow_api.id(100395527262787679)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process ( ',
'    "SAVE_CAMERA_IMAGE_INTO_COLLECTION",',
'    {',
'		p_clob_01: this.data.image,',
'    },',
'    {',
'		success: function (pData) ',
'		{',
'		}',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108331457321908235)
,p_event_id=>wwv_flow_api.id(100395527262787679)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_CAMERA_FILE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'1'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(127129885139354262)
,p_name=>'ON CLICK: PRINT PREVIEW'
,p_event_sequence=>310
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#p1_buttonPrintPreview'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(127129967397354263)
,p_event_id=>wwv_flow_api.id(127129885139354262)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function saveData() {',
'    ',
'    apex.submit(''PRINT_PREVIEW'');',
'}',
'',
'// TODO: should put this code into separate a Javascript file',
'function showError(checkPhoto) {',
'    ',
'    apex.message.clearErrors();',
'    var errors = [];',
'    ',
'    if(!apex.page.validate()) {',
'        errors.push({type: ''error'', location: ''page'', message: ''Please fix the red input fields first.'', unsafe: false});',
'    }',
'    ',
'    if(!checkPhoto) {',
'        errors.push({type: ''error'', location: ''page'', message: ''Please take a photo or activate the checkbox "No Photo" before saving.'', unsafe: false});',
'    }',
'    ',
'    if(errors.length > 0) {',
'        apex.message.showErrors(errors);',
'    }',
'}',
'',
'if(apex.item("P1_APPROVAL_STATUS").getValue() != ''CANCELED'') {',
'    // execute actual code',
'    apex.server.process ("GET_CAMERA_IMAGE_FROM_COLLECTION", {}, {',
'            success: function (pData) {',
'',
'                var checkPhoto = $("#P1_NO_PHOTO_0").prop("checked") || pData.image != null;',
'',
'                if(apex.page.validate() && checkPhoto) {',
'                    saveData(); // function is declared above',
'                }',
'                else {',
'                    showError(checkPhoto); // function is declared above',
'                }',
'            }',
'        });',
'    ',
'} else {',
'    ',
'    apex.navigation.popup({',
'        url: apex.item("P1_URL_PRINT_FORM").getValue(),',
'        name: ''Print Form (VISA on Arrival)''',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(127130596467354269)
,p_name=>'AFTER PRINTS: CANCEL'
,p_event_sequence=>320
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P1_WORKFLOW_STATUS     LIKE ''SAVE%'' AND',
' :P1_RECEIPT             IS NOT NULL) AND',
':P1_INSERT_MODE          = 1'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(127130673322354270)
,p_event_id=>wwv_flow_api.id(127130596467354269)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'document.getElementById("p1_buttonCancel").click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50556878816994835)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_camera_file    CLOB;',
'',
'BEGIN',
'',
'    -- reset :P1_CAMERA_FILE if no photo is set',
'    IF :P1_NO_PHOTO = 1',
'    THEN',
'        l_camera_file := NULL;',
'    ELSE',
'        l_camera_file := voa_apex_pkg.get_tmp_face();',
'    END IF;',
'    ',
'    -- set approval status to in_progress if the preview is printed',
'    IF :REQUEST = ''PRINT_PREVIEW''',
'    THEN',
'        :P1_APPROVAL_STATUS := ''IN_PROGRESS'';',
'    ELSIF :P1_WORKFLOW_STATUS LIKE ''SAVE%'' AND :P1_APPROVAL_STATUS = ''IN_PROGRESS''',
'    THEN',
'        :P1_APPROVAL_STATUS := ''APPROVED'';',
'    END IF;',
'',
'    -- set insert status mode',
'    :P1_INSERT_MODE := 1;',
'',
'    -- save data',
'    voa_apex_pkg.save (p_key_value              => :P1_VISA',
'                      ,p_person                 => :P1_PERSON ',
'                      ,p_last_name              => :P1_LAST_NAME',
'                      ,p_first_name             => :P1_NAME',
'                      ,p_middle_name            => :P1_MIDDLE_NAME',
'                      ,p_nationality            => :P1_NATIONALITY',
'                      ,p_passport_no            => :P1_PASS_NO',
'                      ,p_date_of_birth          => TO_DATE(:P1_BIRTHDAY, :AI_DEFAULT_DATE_FORMAT)',
'                      ,p_gender                 => :P1_SEX',
'                      ,p_salutation             => :P1_SALUTATION',
'                      ,p_tm6_no                 => :P1_IMMIGRATION_CARD',
'                      ,p_issuing_country        => :P1_PASSPORT_ORIGIN',
'                      ,p_from_country           => :P1_FROM_COUNTRY',
'                      ,p_date_of_issue          => TO_DATE(:P1_PASSPORT_CREATED, :AI_DEFAULT_DATE_FORMAT)',
'                      ,p_expiry_date            => TO_DATE(:P1_PASSPORT_TILL, :AI_DEFAULT_DATE_FORMAT)',
'                      ,p_travel_date            => SYSDATE',
'                      ,p_transport_type         => :P1_TRANSPORT_TYPE',
'                      ,p_flight_no              => :P1_FLIGHT_NUMBER',
'                      ,p_profession             => :P1_PROFESSION',
'                      ,p_permanent_address      => :P1_ADDRESS',
'                      ,p_address_thailand       => :P1_ADDRESS_IN_THA',
'                      ,p_province               => :P1_ADDRESS_IN_THA_PROVINCE',
'                      ,p_district               => :P1_ADDRESS_IN_THA_DISTRICT',
'                      ,p_subdistrict            => :P1_ADDRESS_IN_THA_SUBDISTRICT',
'                      ,p_contact_person         => :P1_CONTACT_THA',
'                      ,p_relation               => :P1_RELATIONSHIP',
'                      ,p_approve_status         => :P1_APPROVAL_STATUS',
'                      ,p_officer                => :P1_APPROVAL_OFFICER',
'                      ,p_requesting_date        => TO_DATE(:P1_APPROVAL_DATE, :AI_DEFAULT_DATE_FORMAT)',
'                      ,p_visa_expiry_date       => TO_DATE(:P1_APPROVAL_TILL, :AI_DEFAULT_DATE_FORMAT)',
'                      ,p_receipt                => :P1_QUITTUNG_BUCHNUMMER || ''/'' || :P1_QUITTUNG_NUMMER',
'                      ,p_fee_exception          => :P1_FEE_EXCEPTION',
'                      ,p_person_photo           => dl_common.pkg_util.decode_base64(l_camera_file)',
'                      ,p_terminal_id            => :AI_TERMINAL_ID',
'                      ,p_borderpost_id          => :AI_BORDERPOST_ID',
'                      ,p_passport_doctype       => :P1_PASSPORT_DOCTYPE',
'                      ,p_passport_mrz           => :P1_PASSPORT_MRZ',
'                      ,p_passport_dob           => :P1_PASSPORT_DATE_OF_BIRTH',
'                      ,p_passport_visual_face   => dl_common.pkg_util.decode_base64(:P1_PASSPORT_VISUAL_FACE)',
'                      ,p_passport_icao_face     => dl_common.pkg_util.decode_base64(:P1_PASSPORT_ICAO_FACE)',
'                      ,p_passport_visualpage    => dl_common.pkg_util.decode_base64(:P1_PASSPORT_VISUALPAGE)',
'                      ,p_passport_uvpage        => dl_common.pkg_util.decode_base64(:P1_PASSPORT_UVPAGE)',
'                      ,p_passport_irpage        => dl_common.pkg_util.decode_base64(:P1_PASSPORT_IRPAGE)',
'                      ,p_passport_dg3_0         => dl_common.pkg_util.decode_base64(:P1_PASSPORT_DG3_0)',
'                      ,p_passport_dg3_1         => dl_common.pkg_util.decode_base64(:P1_PASSPORT_DG1_0)',
'                      ,p_status_fee_exception   => :P1_FEE_EXCEPTION',
'                      ,p_status_no_receipt      => CASE :P1_NO_RECEIPT WHEN ''Y'' THEN ''N'' ELSE ''Y'' END',
'                      ,p_status_print_form      => :P1_PRINT_FORM',
'                      ,p_release_note           => :P1_RELEASE_NOTE',
'                      ,p_cancel_note            => :P1_CANCEL_NOTE',
'                      ,p_blacklist_record       => :P1_BLACKLIST_RECORD',
'                      ,p_visa_number            => :P1_VISA_NUMBER',
'                      ,x_visa_number            => :P1_VISA_NUMBER',
'    );',
'END;'))
,p_process_error_message=>'An error occurred while saving the Visa On Arrival. Please contact the system administrator.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_WORKFLOW_STATUS LIKE ''SAVE%'' OR',
':P1_WORKFLOW_STATUS LIKE ''JUST_SAVE%'''))
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'The Visa on Arrival was successfully saved.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59431151421544566)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE: RECEIPT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'voa_apex_pkg.set_receipt (p_key_value => :P1_VISA',
'                         ,p_receipt   => :P1_RECEIPT);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P1_WORKFLOW_STATUS LIKE ''SAVE%'''
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Receipt was successfully created'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50612760376458844)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CANCEL'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P1_WORKFLOW_STATUS = ''CANCEL_VISA'''
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108331375291908234)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CANCEL: PLSQL CODE'
,p_process_sql_clob=>'voa_apex_pkg.cleanup_tmp_face();'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST = ''RESTART'''
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(65262773916918653)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET: P1_ACTION (BEFORE HEADER)'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Set Action parameter to print fee or fine',
'IF (:REQUEST = ''OPEN_FEE_AND_FINE'' OR (:REQUEST = ''AFTER_BLACKLIST'' AND :P1_BLACKLIST_STATUS = ''ACCEPT''))  AND',
'    :P1_OPEN_MODAL             = ''FEE''              AND',
'    NVL(:P1_SEARCH_MODE, 0)   != 1',
'THEN',
'    :P1_ACTION := ''OPEN_FEE_AND_FINE'';',
'END IF;',
'',
'-- Set Action parameter to print form',
'IF :REQUEST = ''PRINT_FORM'' OR (:P1_ACTION = ''SAVE_RECEIPT'' AND :P1_PRINT_FORM = ''Y'')',
'THEN',
'    :P1_ACTION := ''PRINT_FORM'';',
'END IF;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52507865900831855)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FETCH: VOA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_receipt        VARCHAR2(500 CHAR);',
'    l_cancel_note    visas.cancel_note%TYPE;',
'    l_payment_status visas.payment_status%TYPE;',
'    l_null           VARCHAR2(400 CHAR);',
'    l_print_receipt  dl_bordercontrol.visas.status_no_receipt%TYPE;',
'',
'BEGIN',
'',
'    voa_apex_pkg.search (p_key_value         => :P1_VISA',
'                        ,x_key_value         => :P1_VISA',
'                        ,x_person            => :P1_PERSON',
'                        ,x_last_name         => :P1_LAST_NAME',
'                        ,x_first_name        => :P1_NAME',
'                        ,x_middle_name       => :P1_MIDDLE_NAME',
'                        ,x_nationality       => :P1_NATIONALITY',
'                        ,x_passport_no       => :P1_PASS_NO',
'                        ,x_date_of_birth     => :P1_BIRTHDAY',
'                        ,x_gender            => :P1_SEX',
'                        ,x_salutation        => :P1_SALUTATION',
'                        ,x_tm6_no            => :P1_IMMIGRATION_CARD',
'                        ,x_issuing_country   => :P1_PASSPORT_ORIGIN',
'                        ,x_from_county       => :P1_FROM_COUNTRY',
'                        ,x_date_of_issue     => :P1_PASSPORT_CREATED',
'                        ,x_expiry_date       => :P1_PASSPORT_TILL',
'                        ,x_travel_date       => :P1_TRAVEL_DATE',
'                        ,x_transport_type    => :P1_TRANSPORT_TYPE',
'                        ,x_flight_no         => :P1_FLIGHT_NUMBER',
'                        ,x_profession        => :P1_PROFESSION',
'                        ,x_permanent_address => :P1_ADDRESS',
'                        ,x_address_thailand  => :P1_ADDRESS_IN_THA',
'                        ,x_province          => :P1_ADDRESS_IN_THA_PROVINCE',
'                        ,x_district          => :P1_ADDRESS_IN_THA_DISTRICT',
'                        ,x_subdistrict       => :P1_ADDRESS_IN_THA_SUBDISTRICT',
'                        ,x_contact_person    => :P1_CONTACT_THA',
'                        ,x_relation          => :P1_RELATIONSHIP',
'                        ,x_approve_status    => :P1_APPROVAL_STATUS',
'                        ,x_officer           => :P1_APPROVAL_OFFICER',
'                        ,x_requesting_date   => :P1_APPROVAL_DATE',
'                        ,x_visa_expiry_date  => :P1_APPROVAL_TILL',
'                        ,x_receipt           => :P1_RECEIPT',
'                        ,x_fee_exception     => l_null',
'                        ,x_person_photo      => :P1_CAMERA_FILE',
'                        ,x_cancel_note       => :P1_CANCEL_NOTE',
'                        ,x_release_note      => :P1_RELEASE_NOTE',
'                        ,x_payment_status    => :P1_RECEIPT_STATUS',
'                        ,x_ins_officer       => :P1_APPROVAL_OFFICER',
'                        ,x_receipt_no1       => :P1_QUITTUNG_BUCHNUMMER',
'                        ,x_receipt_no2       => :P1_QUITTUNG_NUMMER',
'                        ,x_status_fee_exception => :P1_FEE_EXCEPTION',
'                        ,x_status_no_receipt    => l_print_receipt',
'                        ,x_status_print_form    => :P1_PRINT_FORM',
'                        ,x_visa_number          => :P1_VISA_NUMBER',
'                        ,x_ins_terminal         => :P1_TERMINAL',
'                        ,x_passport_doctype     => :P1_PASSPORT_DOCTYPE);',
'                        ',
'    pkg_collective_passport.load_data(i_person_fk => :P1_PERSON);',
'    ',
'    CASE l_print_receipt ',
'        WHEN ''Y'' THEN :P1_NO_RECEIPT := ''N'';',
'        ELSE :P1_NO_RECEIPT := ''Y'';',
'    END CASE;',
'    ',
'    CASE',
'        WHEN :P1_CAMERA_FILE = 0 THEN :P1_NO_PHOTO := 1;',
'        ELSE NULL;',
'    END CASE;',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P1_VISA IS NOT NULL'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69403372223779346)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FETCH: RECEIPT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_fee_or_fine_rec    pkg_apex_fee_and_fine.fee_or_fine_typ;',
'',
'    l_receipt_rec    faf_fees_and_fines%ROWTYPE;',
'    l_entry_form_rec entry_forms%ROWTYPE;',
'',
'BEGIN',
'',
'    l_fee_or_fine_rec := pkg_apex_fee_and_fine.get_fee_or_fine_by_pk(:P1_RECEIPT);',
'    ',
'    :P1_QUITTUNG_BUCHNUMMER := l_fee_or_fine_rec.booking_number;',
'    :P1_QUITTUNG_NUMMER     := l_fee_or_fine_rec.receipt_number;',
'    :P1_RECEIPT_CREATED_AT  := l_fee_or_fine_rec.issuing_date;',
'    :P1_RECEIPT_COSTS       := NVL(l_fee_or_fine_rec.total_costs, 0);',
'    ',
'    :P1_URL_FEE_AND_FINE := APEX_UTIL.PREPARE_URL(p_url => ''f?p=520:10:''|| :APP_SESSION',
'                                 ||''::NO:10:P10_KEY_VALUE:'' || :P1_RECEIPT);',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P1_RECEIPT IS NOT NULL'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(65263698532918662)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET: URL BLACKLIST'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_URL_BLACKLIST := APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:11:''|| :APP_SESSION',
'                                 ||''::NO:11:'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59432329295544578)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET: URL FEE AND FINE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_URL_FEE_AND_FINE := dl_bordercontrol.pkg_apex_fee_and_fine.prepare_form_url (p_key_value        => :P1_RECEIPT',
'                                                                   ,p_fee_or_fine      => ''FEE''',
'                                                                   ,p_reference_entity => ''VISAS.VISA_NUMBER''',
'                                                                   ,p_reference_number => :P1_VISA_NUMBER',
'                                                                   ,p_owner            => :AI_OWNER',
'                                                                   ,p_print_flag       => :P1_NO_RECEIPT',
'                                                                   ,p_fee_exception    => :P1_FEE_EXCEPTION);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P1_VISA IS NOT NULL AND :P1_URL_FEE_AND_FINE IS NULL'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(65262916122918655)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET: URL PRINT FORM'
,p_process_sql_clob=>':P1_URL_PRINT_FORM := voa_apex_pkg.get_voa_print_link(:P1_VISA);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P1_VISA IS NOT NULL'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100395969168787683)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_CAMERA_IMAGE_INTO_COLLECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'voa_apex_pkg.save_tmp_face(apex_application.g_clob_01);',
'',
'apex_json.open_object();',
'apex_json.close_object();'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108332860435908249)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CLEANUP_CAMERA_IMAGE_FROM_COLLECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'voa_apex_pkg.cleanup_tmp_face;',
'',
'apex_json.open_object();',
'apex_json.close_object();'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108331531769908236)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_CAMERA_IMAGE_FROM_COLLECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_clob CLOB;',
'',
'BEGIN',
'',
'    l_clob := voa_apex_pkg.get_tmp_face();',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''image'', l_clob);',
'    apex_json.close_object();',
'',
'END;'))
,p_process_error_message=>'Failure: #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Success'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(65262593321918651)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET: P1_WORKFLOW_STATUS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_WORKFLOW_STATUS := NULL;',
'',
'-- define primary action',
'CASE :REQUEST',
'    WHEN ''SAVE''          THEN :P1_WORKFLOW_STATUS := ''SAVE'';',
'    WHEN ''SAVE_RECEIPT''  THEN :P1_WORKFLOW_STATUS := ''SAVERECEIPT'';',
'    WHEN ''CANCEL''        THEN :P1_WORKFLOW_STATUS := ''CANCEL_VISA'';',
'    WHEN ''PRINT_PREVIEW'' THEN :P1_WORKFLOW_STATUS := ''JUST_SAVE_PREVIEW'';',
'END CASE;',
'',
'-- define additional information',
'-- Fee Exception',
'CASE :P1_FEE_EXCEPTION',
'    WHEN ''Y'' THEN :P1_WORKFLOW_STATUS := :P1_WORKFLOW_STATUS || ''_WITH_FEE_EXCEPTION'';',
'    WHEN ''N'' THEN :P1_WORKFLOW_STATUS := :P1_WORKFLOW_STATUS || ''_WITHOUT_FEE_EXCEPTION'';',
'    ELSE NULL;',
'END CASE;',
'',
'-- Print receipt',
'CASE :P1_NO_RECEIPT',
'    WHEN ''Y'' THEN :P1_WORKFLOW_STATUS := :P1_WORKFLOW_STATUS || ''_WITH_PRINT_RECEIPT'';',
'    WHEN ''N'' THEN :P1_WORKFLOW_STATUS := :P1_WORKFLOW_STATUS || ''_WITHOUT_PRINT_RECEIPT'';',
'    ELSE NULL;',
'END CASE;',
'',
'-- Print form',
'CASE :P1_PRINT_FORM',
'    WHEN ''Y'' THEN :P1_WORKFLOW_STATUS := :P1_WORKFLOW_STATUS || ''_WITH_PRINT_FORM'';',
'    WHEN ''N'' THEN :P1_WORKFLOW_STATUS := :P1_WORKFLOW_STATUS || ''_WITHOUT_PRINT_FORM'';',
'    ELSE NULL;',
'END CASE;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
