prompt --application/pages/page_00070
begin
wwv_flow_api.create_page(
 p_id=>70
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Existing Identity with Passport'
,p_page_mode=>'MODAL'
,p_step_title=>'Existing Identity with Passport'
,p_step_sub_title=>'Lost Passport Case'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#javascript/helper-functions.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function convertNameOfFieldToCamelCase(field){ //replace Apex page prefixe like P2020_',
'	var lower = $.camelCase(field.name.toLowerCase().replace(/^p\d+_/i,"").replace(/_/g,"-"));',
'	var name = lower[0] ? lower[0].toLowerCase() + lower.slice(1) :''Unnamed'';',
'	return name;',
'};',
'',
'function nameWithoutPage(field){ //replace Apex page prefixe like P2020_',
'	return field.name.replace(/^p\d+_/i,"");',
'};',
'',
'function regionToJson(regionSelector, originalName){',
'	var Demographic = {};',
'	// serialize textfields',
'	$(regionSelector).find(''.text_field, .apex-item-text, .textarea, input[type="hidden"]'').each((i,field)=>{',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'		Demographic[name] = field.value.trim();',
'	});',
'	$(regionSelector).find(''.datepicker'').each((i, field) => {',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'		if(field.value && field.value !== ''''){',
'			var date = new Date($(''#''+field.name).datepicker("getDate"));',
'			date.setMinutes(date.getMinutes() - date.getTimezoneOffset());',
'			var value = date.toISOString();',
'			Demographic[name] = value;',
'		}',
'	});',
'	// serialize selectlist',
'	$(regionSelector).find(''.selectlist'').each((i,field)=>{',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'        var val = apex.item(field.name).getValue();',
'        if(val && val !== '''' ){',
'            Demographic[name] = val;',
'        }',
'	});',
'	$(regionSelector).find(''.multi_selectlist'').each((i,field)=>{',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'		Demographic[name] = apex.item(field.id).getValue();',
'	});',
'	// all checked radio buttons',
'	$(regionSelector).find(''input[type="radio"]:checked'').each((i, field) => {',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'		Demographic[name] = field.value;',
'	});',
'',
'	// serialize number_fields',
'	$(regionSelector).find(''.number_field'').each((i,field)=>{',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'		if(field.value){',
'			Demographic[name] = parseInt(field.value);',
'		}else{',
'			Demographic[name] = null;',
'		}',
'	});',
'',
'	return Demographic;',
'}'))
,p_css_file_urls=>'#APP_IMAGES#css/application-overwrite.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*   -------------- Colors -------------- */',
'.u-ColorBG--6 {',
'',
'}',
'body .ui-dialog .ui-dialog-titlebar .ui-dialog-title,',
'body .ui-dialog .ui-dialog-titlebar, ',
'.u-Color-6-BG--bg,',
'.t-Region-header, ',
'.t-Region--noBorder>.t-Region-header  {',
'    background-color: #2074d3;',
'    color: #f5f9fd;',
'    margin-top:1px;',
'}',
'.u-ColorBG--6 {',
' background-color: #2074d3;',
' color: #f5f9fd;',
'}',
'.u-Color-6-FG--txt {',
'color: #f5f9fd;',
'}',
'',
'.u-Color-6-FG--fill {',
'fill: #f5f9fd;',
'}',
'.u-Color-6-BG--fill {',
'fill: #2074d3;',
'}',
'.u-Color-2-FG--bg {',
'background-color: #f5f9fd;',
'}',
'.u-Color-3-BG--br {',
'    stroke: #2074d3;',
'    border-color: #2074d3;',
'}',
'.u-Color-6-BG--bg,',
'.t-Region-header {',
' background-color: #2074d3;',
' color: #f5f9fd;',
'}',
'/*   -------------- Colors -------------- */',
'.apex-icons-fontawesome .fa:before {',
'    font-family: FontAwesome;',
'    vertical-align: middle;',
'}',
'.details>.t-Region-bodyWrap>.t-Region-body {',
'    max-height: 750px;',
'    padding: 13px !important;',
'}',
'.t-Region-buttons--bottom {',
'    box-shadow: 0px -9px 8px -6px rgba(80,80,80,0.15);',
'    z-index: 7; ',
'    position: relative; ',
'}',
'body .ui-datepicker select.ui-datepicker-month, body .ui-datepicker select.ui-datepicker-year {',
'    width: 41%;',
'}',
'',
'.FaceItem {',
'    margin-top:0px;',
'    box-shadow:none;',
'    width:100%;',
'}',
'.fingeritem-region .t-Form-itemWrapper, ',
'.fingeritem-region>.t-Region, ',
'.fingeritem-region>.t-Region>.t-Region-bodyWrap, ',
'.fingeritem-region>.t-Region>.t-Region-bodyWrap>.t-Region-body, ',
'.fingeritem-region>.t-Region>.t-Region-bodyWrap>.t-Region-body>.container, ',
'.region-100, .region-100>.t-Region-bodyWrap, ',
'.region-100>.t-Region-bodyWrap>.t-Region-body, ',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container, ',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row, ',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row>.col, ',
'.fingeritem-region .col-2 .rel-col, .fingeritem-region .col-2 {',
'    height: 100%;',
'    padding: 0;',
'    margin:0;',
'}',
'.fingeritem-region.t-Region>.t-Region-bodyWrap {',
'    height: calc(100% - 40px);',
'}',
'.fingeritem-region {',
'    height:640px;',
'}',
'.fingeritem-region .row{',
'    height:50% !important;',
'    margin:0;',
'}',
'.fingeritem-region .col:not(.t-Form-inputContainer){',
'    width:20% !important;',
'}',
'.u-Color-6-FG--fill {',
' fill: #fff;',
'}',
'.photos-region .row,',
'.photos-region .t-Form-itemWrapper,',
'.photos-region .t-Form-inputContainer,',
'.photos-region .t-Form-fieldContainer{',
'    height:320px;',
'    margin:0;',
'}',
'.FaceItemLayout .fc-item-content.hasImage {',
'    background-color: #fff;',
'}',
'.height-700 {',
'    height:700px !important;',
'}',
'.a-GV-footer {',
'    position: static !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190606173841'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73434439598922566)
,p_plug_name=>'Identity Details'
,p_region_css_classes=>'details'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98479988418409939)
,p_plug_name=>'Summary'
,p_parent_plug_id=>wwv_flow_api.id(73434439598922566)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(15256924031705251)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73435413498922576)
,p_plug_name=>'Demographic and Biometric Description'
,p_parent_plug_id=>wwv_flow_api.id(98479988418409939)
,p_region_css_classes=>'biometric-text-data'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99026548928320745)
,p_plug_name=>'Travel Documents'
,p_parent_plug_id=>wwv_flow_api.id(73435413498922576)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99026652263320746)
,p_plug_name=>'Traveldocuments'
,p_region_name=>'TravelDocs'
,p_parent_plug_id=>wwv_flow_api.id(99026548928320745)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'     t.key_value',
'    ,t.nationality',
'    ,(SELECT NVL(display_value,DISPLAY_VALUE$DLC) display_value FROM DL_COMMON.BC_DOC_CLASS$LC where IS_ACTIVE=''Y'' AND key_value=COALESCE(t.doc_class, t.doc_type) ) as doc_type',
'    ,(SELECT coalesce(max( ''/image/''||image_id||''?width=450'' ) ,''#WORKSPACE_IMAGES#template_photo.png'')  FROM dl_blacklist.faces WHERE id=t.face_id) as image',
'    ,t.issuing_country',
'    ,t.doc_number',
'    ,t.given_name',
'    ,t.surname',
'    ,t.date_of_expiry',
'    ,t.sex',
'    ,t.date_of_birth',
'    ,t.date_of_issue',
'    ,t.identity',
'FROM dl_blacklist.travel_docs t ',
'  ',
'WHERE t.identity = :P70_IDENTITY_ID;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99026803269320748)
,p_name=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99026946311320749)
,p_name=>'DOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>512
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
 p_id=>wwv_flow_api.id(99027045468320750)
,p_name=>'ISSUING_COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISSUING_COUNTRY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Issuing country'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>12
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
 p_id=>wwv_flow_api.id(99027166624320751)
,p_name=>'DOC_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>80
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
 p_id=>wwv_flow_api.id(99027192976320752)
,p_name=>'DATE_OF_ISSUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_ISSUE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_api.id(99027430692320754)
,p_name=>'DATE_OF_EXPIRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_EXPIRY'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Date of expiry'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99028165194320761)
,p_name=>'NATIONALITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NATIONALITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nationality'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>12
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
 p_id=>wwv_flow_api.id(99028258354320762)
,p_name=>'SEX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEX'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sex'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4
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
 p_id=>wwv_flow_api.id(99028285378320763)
,p_name=>'DATE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_BIRTH'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Date of birth'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(99645516247042066)
,p_name=>'IDENTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDENTITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(171900689300228230)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Image'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<img src="&IMAGE." style="max-width: 50px">'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(171900770328228231)
,p_name=>'GIVEN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GIVEN_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Given name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
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
 p_id=>wwv_flow_api.id(171900840538228232)
,p_name=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SURNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Surname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(99026706323320747)
,p_internal_uid=>99026706323320747
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(99093576550791344)
,p_interactive_grid_id=>wwv_flow_api.id(99026706323320747)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(99093720396791345)
,p_report_id=>wwv_flow_api.id(99093576550791344)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99094191186791351)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(99026803269320748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99094655298791367)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(99026946311320749)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99095093972791375)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(99027045468320750)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99095599445791382)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(99027166624320751)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99096148771791390)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(99027192976320752)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99097139825791406)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(99027430692320754)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99142442401187041)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(99028165194320761)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99142890465187053)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(99028258354320762)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(99143463658187061)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(99028285378320763)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101376862768366623)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(99645516247042066)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(246397656218079486)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(171900689300228230)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(246398059492079544)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(171900770328228231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(246398595239079548)
,p_view_id=>wwv_flow_api.id(99093720396791345)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(171900840538228232)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(298053034880672029)
,p_plug_name=>'Demographic Description'
,p_parent_plug_id=>wwv_flow_api.id(73435413498922576)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(298063118891697058)
,p_plug_name=>'Biometric Description'
,p_parent_plug_id=>wwv_flow_api.id(73435413498922576)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50713840784745774)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(73434439598922566)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50714258263745783)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(73434439598922566)
,p_button_name=>'Insert'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Use this Identity and Update for all Cases'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(171902532956228249)
,p_branch_name=>'GoToCase'
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP:P30_CASE_ID:&P70_CASE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P70_CASE_JSON'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50726026021745812)
,p_name=>'P70_NEW_TRAVELDOC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99026548928320745)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50726497468745813)
,p_name=>'P70_TRAVELDOC_REDIRECT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(99026548928320745)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171901249562228236)
,p_name=>'P70_IDENTITY_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(73434439598922566)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171901595723228239)
,p_name=>'P70_CASE_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(73434439598922566)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_retval clob;',
'begin',
'    FOR R0 IN (SELECT * FROM APEX_collections WHERE collection_name = ''EXISTING_IDENTITY'' AND seq_id = 1)',
'    LOOP',
'      l_retval :=  R0.clob001 ;',
'    END LOOP;',
'    RETURN l_retval;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171901789901228241)
,p_name=>'P70_CASE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73434439598922566)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171902035798228244)
,p_name=>'P70_REDIRECT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73434439598922566)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246679464961005523)
,p_name=>'P70_SALUTATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Salutation'
,p_source=>'SALUTATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SALUTATIONS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_value,',
'       KEY_VALUE',
'  from dl_common.salutations$LC',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246679707016005543)
,p_name=>'P70_SURNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname'
,p_source=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246680104387005545)
,p_name=>'P70_MIDDLE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Middle name'
,p_source=>'MIDDLE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246680547759005546)
,p_name=>'P70_GIVEN_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Given name'
,p_source=>'GIVEN_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-bottom-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246680900873005547)
,p_name=>'P70_SURNAME_THAI_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname thai'
,p_source=>'SURNAME_THAI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246681361136005548)
,p_name=>'P70_MIDDLE_NAME_THAI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Middle name Thai'
,p_source=>'MIDDLENAME_THAI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246681786590005549)
,p_name=>'P70_GIVEN_NAME_THAI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Given name thai'
,p_source=>'GIVENNAME_THAI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-bottom-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246682168189005550)
,p_name=>'P70_DATE_OF_BIRTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date of birth'
,p_source=>'DATE_OF_BIRTH_PARTIAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1900:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246682544511005551)
,p_name=>'P70_PLACE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of birth'
,p_source=>'PLACE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246682934915005558)
,p_name=>'P70_COUNTRY_OF_BIRTH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Country of birth'
,p_source=>'COUNTRY_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.COUNTRIES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246683386310005561)
,p_name=>'P70_NATIONALITY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nationality'
,p_source=>'NATIONALITY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ICAO_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P70_PLACE_OF_BIRTH'
,p_ajax_items_to_submit=>'P70_PLACE_OF_BIRTH'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246683728928005562)
,p_name=>'P70_NOTICE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice'
,p_source=>'NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246684117960005562)
,p_name=>'P70_PROFESSION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(298053034880672029)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profession'
,p_source=>'PROFESSION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROFESSIONS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISPLAY_VALUE,',
'       KEY_VALUE',
'  from dl_common.professions$LC',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246689643736030425)
,p_name=>'P70_SEX'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sex'
,p_source=>'SEX'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_HUMAN_SEXES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.HUMAN_SEXES$LC',
'WHERE ICAO is not null',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P70_PLACE_OF_BIRTH'
,p_ajax_items_to_submit=>'P70_PLACE_OF_BIRTH'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246690097987030425)
,p_name=>'P70_BODY_HEIGHT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body height'
,p_source=>'BODY_HEIGHT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246690459419030425)
,p_name=>'P70_BODY_WEIGHT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body weight'
,p_source=>'BODY_WEIGHT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246690797354030426)
,p_name=>'P70_BODY_SHAPE_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body shape'
,p_source=>'BODY_SHAPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246691113156030426)
,p_name=>'P70_HAIR_COLOR_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hair color'
,p_source=>'HAIR_COLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246691531069030426)
,p_name=>'P70_HAIR_CHARACTERISTIC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hair characteristic'
,p_source=>'HAIR_CHARACTERISTIC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246691945922030427)
,p_name=>'P70_FACE_SHAPE_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Face shape'
,p_source=>'FACE_SHAPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246692361035030427)
,p_name=>'P70_EYE_COLOR_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Eye color'
,p_source=>'EYE_COLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246692767291030427)
,p_name=>'P70_SKIN_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Skin'
,p_source=>'SKIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246693195455030428)
,p_name=>'P70_DOMINANT_CHARACTERISTIC_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Dominant characteristic'
,p_source=>'DOMINANT_CHARACTERISTIC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(246693521550030428)
,p_name=>'P70_SPECIAL_CHARACTERISTIC_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(298063118891697058)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Special characteristic'
,p_source=>'SPECIAL_CHARACTERISTIC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(250015230121795716)
,p_name=>'P70_SUBMITTED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73434439598922566)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50763810797745959)
,p_name=>'CloseDialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23326135696712920)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50764386026745965)
,p_event_id=>wwv_flow_api.id(50763810797745959)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50765645304745966)
,p_name=>'UseAndUpdateExistingIdentity'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(50714258263745783)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50766102250745967)
,p_event_id=>wwv_flow_api.id(50765645304745966)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P70_CASE_JSON'').getValue() != ''''){',
'var blacklistRequestBody = JSON.parse(apex.item(''P70_CASE_JSON'').getValue());',
'if(blacklistRequestBody !== ''''){',
'    var lspinner$ = apex.util.showSpinner()',
'    blacklistRequestBody.case.identities = [];',
'',
'    console.log(''Demo '', blacklistRequestBody);',
'    var endpoint = ''/bpm/blacklist/insert'';',
'    var request = $.ajax({',
'        type: ''POST'',',
'        contentType: "application/json; charset=utf-8",',
'        url: endpoint,',
'        data: JSON.stringify(blacklistRequestBody)',
'    });',
'',
'    request.done(function (data) {',
'     console.log(''success'', data);',
'     if (data.status.code === ''ERROR'') {',
'        apex.message.clearErrors();',
'        apex.message.showErrors({',
'            type: ''error'',',
'            location: ''page'',',
'            message: ''BPM: Record could not be inserted.''',
'        });',
'     }',
'     else {',
'         apex.item(''P70_CASE_ID'').setValue(data.blacklistid);',
'         lspinner$.remove();',
'         try{',
'            apex.message.showPageSuccess(apex.lang.getMessage(''RECORD.INSERTED''));',
'         }',
'         catch(e){console.log(e)}',
'         apex.submit({ request:"UPDATE" });',
'     }',
'    });',
'    request.fail(function (data) {',
'    var text = data.responseText;',
'    try {',
'        var json = JSON.parse(text);',
'        if (json.status.code === ''ERROR'' || json.error) {',
'            var message = json.message || json.status.message;',
'            apex.message.clearErrors();',
'            apex.message.showErrors({',
'                type: ''error'',',
'                location: ''page'',',
'                message: apex.lang.getMessage(''RECORD.INSERT.ERROR'') + '' '' + message',
'            });',
'        }',
'    }',
'    catch (e) {',
'        apex.message.clearErrors();',
'        apex.message.showErrors({',
'            type: ''error'',',
'            location: ''page'',',
'            message: apex.lang.getMessage(''RECORD.INSERT.ERROR'')',
'        })',
'    }',
'    lspinner$.remove();',
'    });',
'}}',
'else if(apex.item(''P70_CASE_ID'').getValue()!== ''''){',
'    apex.submit({ request:"UPDATE" });',
'}',
'',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50773941545745974)
,p_name=>'GetRedirectURL'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48314559333575029)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50774453064745975)
,p_event_id=>wwv_flow_api.id(50773941545745974)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':50:''||l_session||''::NO::P50_IDENTITY_ID:'' || :P70_SELECTED_IDENTITY_ID,',
'        p_checksum_type => ''SESSION''',
'    );',
'    :P70_TRAVELDOC_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_03=>'P70_TRAVELDOC_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50774929527745975)
,p_event_id=>wwv_flow_api.id(50773941545745974)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'console.log(apex.item("P70_TRAVELDOC_REDIRECT_URL").getValue());',
'apex.navigation.redirect(apex.item("P70_TRAVELDOC_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50767437337745968)
,p_name=>'ChangedNewTravelDoc'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P70_NEW_TRAVELDOC_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50767923850745969)
,p_event_id=>wwv_flow_api.id(50767437337745968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region(''TravelDocs'').refresh();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50771166888745972)
,p_name=>'OpenAddress'
,p_event_sequence=>100
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-address-id], #Addresses tbody .a-GV-row td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#Addresses'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50771692511745973)
,p_event_id=>wwv_flow_api.id(50771166888745972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).parent().find(''span[data-address-id]'');',
'var addressID = $(this.triggeringElement).attr(''data-address-id'') || rowSpan.attr(''data-address-id'');',
'console.log(addressID);',
'apex.item(''P70_SELECTED_ADDRESS_ID'').setValue(addressID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50772118984745973)
,p_event_id=>wwv_flow_api.id(50771166888745972)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':40:''||l_session||''::NO::P40_ADDRESS_ID:'' || :P70_SELECTED_ADDRESS_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P70_ADDRESS_REDIRECT_URL := l_url;',
'END;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50772690373745973)
,p_event_id=>wwv_flow_api.id(50771166888745972)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P70_ADDRESS_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(171901862474228242)
,p_name=>'OpenNewCase'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P70_CASE_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171901996478228243)
,p_event_id=>wwv_flow_api.id(171901862474228242)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P70_CASE_ID'').getValue()==''''){',
' return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171902123858228245)
,p_event_id=>wwv_flow_api.id(171901862474228242)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':30:''||l_session||''::YES:30:P30_CASE_ID:'' || :P70_CASE_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P70_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P70_CASE_ID'
,p_attribute_03=>'P70_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171902201551228246)
,p_event_id=>wwv_flow_api.id(171901862474228242)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.redirect(apex.item("P70_REDIRECT_URL").getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(171902621764228250)
,p_name=>'RefreshTraveldocsOnOpenCase'
,p_event_sequence=>120
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(250013701334795701)
,p_event_id=>wwv_flow_api.id(171902621764228250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(top.windowToRefresh && apex.item(''P70_CASE_JSON'').getValue() === '''' && apex.item(''P70_SUBMITTED'').getValue() != ''''){',
'    top.windowToRefresh.apex.region(''IdentitiesGrid'').refresh();',
'    setTimeout(function(){$(document.body).trigger(''close-dialog'');},1000);',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(264776854467117504)
,p_name=>'CloseEvent'
,p_event_sequence=>130
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'close-dialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(264777234685117546)
,p_event_id=>wwv_flow_api.id(264776854467117504)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42843900522172106)
,p_name=>'CloseDialog2'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(50713840784745774)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42844090524172107)
,p_event_id=>wwv_flow_api.id(42843900522172106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(171901134575228235)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'FetchRow'
,p_attribute_02=>'IDENTITIES'
,p_attribute_03=>'P70_IDENTITY_ID'
,p_attribute_04=>'KEY_VALUE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(171902348574228247)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'SaveIdentityData'
,p_attribute_02=>'IDENTITIES'
,p_attribute_03=>'P70_IDENTITY_ID'
,p_attribute_04=>'KEY_VALUE'
,p_attribute_11=>'U'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(171902405977228248)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LinkCaseToIdentity'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    INSERT INTO dl_blacklist.blacklist_case_identities',
'        (blacklist_case',
'        ,identity)',
'    VALUES',
'        (:P70_CASE_ID',
'        ,:P70_IDENTITY_ID)',
'    RETURNING ID INTO :P70_SUBMITTED;',
'EXCEPTION',
'    WHEN dup_val_on_index THEN',
'        NULL;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
