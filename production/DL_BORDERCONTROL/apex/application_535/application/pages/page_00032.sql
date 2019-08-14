prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Case Details Read only'
,p_page_mode=>'MODAL'
,p_step_title=>'Case Details Read only'
,p_step_sub_title=>'Case Details Read only'
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
,p_dialog_width=>'1280px'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190627152747'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80233402649133073)
,p_plug_name=>'Case Details'
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
 p_id=>wwv_flow_api.id(105278951468620446)
,p_plug_name=>'Summary'
,p_parent_plug_id=>wwv_flow_api.id(80233402649133073)
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
 p_id=>wwv_flow_api.id(80234313802133082)
,p_plug_name=>'Document Data'
,p_parent_plug_id=>wwv_flow_api.id(105278951468620446)
,p_region_css_classes=>'demographic-data i-h400'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105281710265620473)
,p_plug_name=>'Tab Region'
,p_parent_plug_id=>wwv_flow_api.id(80233402649133073)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(15256924031705251)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(79117190495301768)
,p_plug_name=>'Biometric Images'
,p_parent_plug_id=>wwv_flow_api.id(105281710265620473)
,p_region_css_classes=>'region-100'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79117272702301769)
,p_plug_name=>'Photos'
,p_parent_plug_id=>wwv_flow_api.id(79117190495301768)
,p_region_css_classes=>'region-100 photos-region too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h240:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79117379828301770)
,p_plug_name=>'Fingerprints'
,p_parent_plug_id=>wwv_flow_api.id(79117190495301768)
,p_region_css_classes=>'fingeritem-region region-100'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h640:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'height-700'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80839193281669164)
,p_plug_name=>'Case Details'
,p_parent_plug_id=>wwv_flow_api.id(105281710265620473)
,p_region_css_classes=>'case-details'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(105282060133620477)
,p_plug_name=>'Related Organization Data'
,p_parent_plug_id=>wwv_flow_api.id(80839193281669164)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105282270403620479)
,p_plug_name=>'Case Data'
,p_parent_plug_id=>wwv_flow_api.id(80839193281669164)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105279043892620447)
,p_plug_name=>'Person Data'
,p_parent_plug_id=>wwv_flow_api.id(105281710265620473)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105695835525060882)
,p_plug_name=>'Names___ Addresses and Traveldocs'
,p_parent_plug_id=>wwv_flow_api.id(105279043892620447)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(80234376549133083)
,p_plug_name=>'Demographic and Biometric Description'
,p_parent_plug_id=>wwv_flow_api.id(105695835525060882)
,p_region_css_classes=>'biometric-text-data'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42845019036172117)
,p_plug_name=>'Biometric Description'
,p_parent_plug_id=>wwv_flow_api.id(80234376549133083)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42845132067172118)
,p_plug_name=>'Demographic Description'
,p_parent_plug_id=>wwv_flow_api.id(80234376549133083)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105825249556531250)
,p_plug_name=>'Identities'
,p_parent_plug_id=>wwv_flow_api.id(105695835525060882)
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
 p_id=>wwv_flow_api.id(105695986633060883)
,p_plug_name=>'Identities'
,p_region_name=>'IdentitiesGrid'
,p_parent_plug_id=>wwv_flow_api.id(105825249556531250)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'        i.key_value',
'       ,i.given_name',
'       ,i.surname',
'       ,(SELECT coalesce(max( ''/image/''||image_id||''?width=450'' ) ,''#WORKSPACE_IMAGES#template_photo.png'') as image FROM',
'            faces f',
'            INNER JOIN biometrics b ON f.biometric_id = b.id',
'            INNER JOIN blacklist_cases c ON b.blacklist_case_id = c.id',
'            INNER JOIN blacklist_case_identities ci ON c.id = ci.blacklist_case where ci.identity = i.key_value ) as image',
'',
'  FROM dl_blacklist.blacklist_cases bc',
'  JOIN dl_blacklist.blacklist_case_identities ci ON bc.id = ci.blacklist_case',
'  JOIN dl_blacklist.identities i       ON ci.identity = i.key_value',
'  ',
'WHERE ci.blacklist_case = :P32_CASE_ID;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P32_CASE_ID'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105696136683060885)
,p_name=>'GIVEN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GIVEN_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Given name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(105823895307531236)
,p_name=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SURNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Surname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(105826566849531263)
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
 p_id=>wwv_flow_api.id(106444561351252574)
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
,p_attribute_01=>'<img src="&IMAGE." style="max-width: 50px" data-selected-identity-id="&KEY_VALUE.">'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(105696075369060884)
,p_internal_uid=>105696075369060884
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_api.id(105833819599531883)
,p_interactive_grid_id=>wwv_flow_api.id(105696075369060884)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(105833838574531883)
,p_report_id=>wwv_flow_api.id(105833819599531883)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105850636378532143)
,p_view_id=>wwv_flow_api.id(105833838574531883)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(105696136683060885)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>477
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105851197067532149)
,p_view_id=>wwv_flow_api.id(105833838574531883)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(105823895307531236)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>551
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105897446150011426)
,p_view_id=>wwv_flow_api.id(105833838574531883)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(105826566849531263)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108303966192765791)
,p_view_id=>wwv_flow_api.id(105833838574531883)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(106444561351252574)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105825339241531251)
,p_plug_name=>'Addresses'
,p_parent_plug_id=>wwv_flow_api.id(105695835525060882)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105824832733531245)
,p_plug_name=>'Addresses'
,p_region_name=>'Addresses'
,p_parent_plug_id=>wwv_flow_api.id(105825339241531251)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'        id',
'        ,identity',
'        ,is_active as active',
'        ,ins_at',
'        ,ins_by',
'        ,address_name',
'        ,moo',
'        ,building',
'        ,road',
'        ,(Select display_value FROM lov_adm_class_subdistrict WHERE return_value = sub_district) AS sub_district',
'        ,(Select display_value FROM lov_adm_class_district    WHERE return_value = district)     AS district',
'        ,(Select display_value FROM lov_adm_class_province    WHERE return_value = province)     AS province',
'        ,zipcode',
'        ,country',
'  FROM dl_blacklist.addresses',
'--WHERE identity = :P32_SELECTED_IDENTITY_ID;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(105695986633060883)
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106441662603252545)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<span class="fa fa-edit" data-address-id="&ID."></span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106441815634252546)
,p_name=>'IDENTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDENTITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(105826566849531263)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106442014254252548)
,p_name=>'INS_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INS_AT'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106442105178252549)
,p_name=>'INS_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INS_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106442321666252551)
,p_name=>'MOO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MOO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Moo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(106442421897252552)
,p_name=>'BUILDING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUILDING'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Building'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(106442500364252553)
,p_name=>'ROAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Road'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(106442607112252554)
,p_name=>'SUB_DISTRICT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUB_DISTRICT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sub district'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>524
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
 p_id=>wwv_flow_api.id(106442656184252555)
,p_name=>'DISTRICT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISTRICT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'District'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>524
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
 p_id=>wwv_flow_api.id(106442772662252556)
,p_name=>'PROVINCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROVINCE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Province'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>524
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
 p_id=>wwv_flow_api.id(106442847076252557)
,p_name=>'ZIPCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ZIPCODE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Zipcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(106442996076252558)
,p_name=>'COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COUNTRY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Country'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(106443727267252565)
,p_name=>'ADDRESS_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADDRESS_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Address name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<span data-address-id="&ID.">&ADDRESS_NAME.</span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(106444409458252572)
,p_name=>'ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Active'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
end;
/
begin
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(105824910142531246)
,p_internal_uid=>105824910142531246
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
 p_id=>wwv_flow_api.id(105876609223791201)
,p_interactive_grid_id=>wwv_flow_api.id(105824910142531246)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(105876728714791201)
,p_report_id=>wwv_flow_api.id(105876609223791201)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106832367365975573)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(106441662603252545)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>35
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106832841583975601)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(106441815634252546)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106833862752975617)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(106442014254252548)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106834419176975624)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(106442105178252549)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106835360439975638)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(106442321666252551)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106835847539975645)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(106442421897252552)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106836347574975653)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(106442500364252553)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106836852723975661)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(106442607112252554)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106837328820975669)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(106442656184252555)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106837815518975678)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(106442772662252556)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106838240931975690)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(106442847076252557)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106838795152975703)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(106442996076252558)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107862821083463412)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(106443727267252565)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108015087777858383)
,p_view_id=>wwv_flow_api.id(105876728714791201)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(106444409458252572)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105825511978531252)
,p_plug_name=>'Travel Documents'
,p_parent_plug_id=>wwv_flow_api.id(105695835525060882)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105825615313531253)
,p_plug_name=>'Traveldocuments'
,p_region_name=>'TravelDocs'
,p_parent_plug_id=>wwv_flow_api.id(105825511978531252)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'         t.key_value',
'		,t.nationality',
'        ,t.doc_type',
'        ,t.given_name',
'        ,t.surname',
'        ,t.issuing_country',
'        ,t.doc_number',
'        ,t.date_of_expiry',
'		,t.sex',
'		,t.date_of_birth',
'        ,t.date_of_issue',
'        ,t.identity',
'  FROM dl_blacklist.travel_docs t ',
'  ',
'--WHERE t.identity = :P32_SELECTED_IDENTITY_ID;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(105695986633060883)
,p_ajax_items_to_submit=>'P32_SELECTED_IDENTITY_ID'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(56762915364779622)
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
 p_id=>wwv_flow_api.id(56763036634779623)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105825766319531255)
,p_name=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105825909361531256)
,p_name=>'DOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Doc type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<span data-traveldoc-id="&KEY_VALUE.">&DOC_TYPE.</span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105826008518531257)
,p_name=>'ISSUING_COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISSUING_COUNTRY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Issuing country'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(105826129674531258)
,p_name=>'DOC_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>36
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
 p_id=>wwv_flow_api.id(105826156026531259)
,p_name=>'DATE_OF_ISSUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_ISSUE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105826393742531261)
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
 p_id=>wwv_flow_api.id(105827128244531268)
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
 p_id=>wwv_flow_api.id(105827221404531269)
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
 p_id=>wwv_flow_api.id(105827248428531270)
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
 p_id=>wwv_flow_api.id(106444479297252573)
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
,p_parent_column_id=>wwv_flow_api.id(105826566849531263)
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(105825669373531254)
,p_internal_uid=>105825669373531254
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
 p_id=>wwv_flow_api.id(105892539601001851)
,p_interactive_grid_id=>wwv_flow_api.id(105825669373531254)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(105892683447001852)
,p_report_id=>wwv_flow_api.id(105892539601001851)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105893154237001858)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(105825766319531255)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105893618349001874)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(105825909361531256)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105894057023001882)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(105826008518531257)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105894562496001889)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(105826129674531258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105895111822001897)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(105826156026531259)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105896102876001913)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(105826393742531261)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105941405451397548)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(105827128244531268)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105941853515397560)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(105827221404531269)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105942426708397568)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(105827248428531270)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108175825818577130)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(106444479297252573)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109091564801439028)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(56762915364779622)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109092074016439049)
,p_view_id=>wwv_flow_api.id(105892683447001852)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(56763036634779623)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120670105056704273)
,p_plug_name=>'Related Persons'
,p_parent_plug_id=>wwv_flow_api.id(105279043892620447)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120669213749704264)
,p_plug_name=>'Related Persons List'
,p_parent_plug_id=>wwv_flow_api.id(120670105056704273)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	key_value',
'	,blacklist_case_id ',
'	,first_name ',
'	,last_name ',
'	,middle_name ',
'	,relationship ',
'    ,notice ',
'FROM DL_BLACKLIST.RELATED_PERSONS',
'WHERE blacklist_case_id = :P32_CASE_ID;'))
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
 p_id=>wwv_flow_api.id(120670121189704274)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>500
,p_show_detail_link=>'N'
,p_owner=>'RSTOPP'
,p_internal_uid=>120670121189704274
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66716076457114628)
,p_db_column_name=>'KEY_VALUE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Key value'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66716366764114649)
,p_db_column_name=>'BLACKLIST_CASE_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Blacklist case id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66716700977114650)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'First name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66717187376114651)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Last name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66717580579114652)
,p_db_column_name=>'MIDDLE_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Middle name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66717970257114653)
,p_db_column_name=>'RELATIONSHIP'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Relationship'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(66718362725114655)
,p_db_column_name=>'NOTICE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Notice'
,p_column_html_expression=>'<div style="max-width:300px">#NOTICE#</div>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(133391240959127616)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'667187'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'KEY_VALUE:BLACKLIST_CASE_ID:FIRST_NAME:LAST_NAME:MIDDLE_NAME:RELATIONSHIP:NOTICE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105281737928620474)
,p_plug_name=>'Warrant Data'
,p_parent_plug_id=>wwv_flow_api.id(105281710265620473)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P32_CASE_TYPE'
,p_plug_display_when_cond2=>'CRIMINAL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(105282391947620480)
,p_plug_name=>'Travel Permit'
,p_parent_plug_id=>wwv_flow_api.id(105281710265620473)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108887236631622883)
,p_plug_name=>'Overstay'
,p_parent_plug_id=>wwv_flow_api.id(105281710265620473)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P32_CASE_TYPE'
,p_plug_display_when_cond2=>'OVERSTAY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(158824939867046571)
,p_plug_name=>'Lost Passport Data'
,p_region_name=>'LostPassportData'
,p_parent_plug_id=>wwv_flow_api.id(105281710265620473)
,p_region_css_classes=>'lost-passport-region'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P32_CASE_TYPE'
,p_plug_display_when_cond2=>'LOST_PASSPORT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(158825652296046578)
,p_plug_name=>'Issue Description'
,p_parent_plug_id=>wwv_flow_api.id(158824939867046571)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(158825773566046579)
,p_plug_name=>'New Passport Data'
,p_parent_plug_id=>wwv_flow_api.id(158824939867046571)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(367820654165894460)
,p_plug_name=>'Case Information'
,p_parent_plug_id=>wwv_flow_api.id(105281710265620473)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(367820729882894461)
,p_plug_name=>'ICRS Exchange'
,p_parent_plug_id=>wwv_flow_api.id(367820654165894460)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(367820886928894463)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(367820729882894461)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    ins_by              ',
'    ,ins_at              ',
'    ,dml_by              ',
'    ,dml_at              ',
'    ,service_response    ',
'    ,service_send        ',
'    ,service_receive     ',
'    ,service_result      ',
'    ,status ',
'',
' FROM dl_blacklist.logs_icrs ',
' WHERE blacklist_case_id = :P32_CASE_ID ;'))
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
 p_id=>wwv_flow_api.id(367821061048894464)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'RSTOPP'
,p_internal_uid=>367821061048894464
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26140080794608013)
,p_db_column_name=>'INS_BY'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Ins by'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26140472565608017)
,p_db_column_name=>'INS_AT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Ins at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26140714994608018)
,p_db_column_name=>'DML_BY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Dml by'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26141110435608018)
,p_db_column_name=>'DML_AT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Dml at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26141556789608018)
,p_db_column_name=>'SERVICE_RESPONSE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Service response'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26141972449608019)
,p_db_column_name=>'SERVICE_SEND'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Service send'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26142338508608019)
,p_db_column_name=>'SERVICE_RECEIVE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Service receive'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26142725106608019)
,p_db_column_name=>'SERVICE_RESULT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Service result'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26143155064608019)
,p_db_column_name=>'STATUS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Status'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(368451723718130420)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'261435'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'INS_BY:INS_AT:DML_BY:DML_AT:SERVICE_RESPONSE:SERVICE_SEND:SERVICE_RECEIVE:SERVICE_RESULT:STATUS'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(367820869944894462)
,p_name=>'User Changes'
,p_parent_plug_id=>wwv_flow_api.id(367820654165894460)
,p_template=>wwv_flow_api.id(15253766136705247)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    return DL_BLACKLIST.PKG_DL_HISTORY.GET_CHANGES_HISTORY_FROM_BLACKLIST_TABLE(',
'    ''BLACKLIST_CASES'', ',
'    ''ACTION_CODE, ARRESTED_DESCRIPTION, ARRESTED_STATUS, ARRESTED_WARRANT_DATE, ARRESTED_WARRANT_EXPIRY_DATE, ARRESTED_WARRANT_NUMBER, ARRESTED_WARRANT_YEAR, ASSOCIATED_BEHAVIOR, AUTHORITY, BEHAVIOR, CASE_NUMBER, CASE_TYPE, CONTACT_INFORMATION, CONTA'
||'CT_OWNER_DATA, CONTACT_TELEPHONE_NUMBER, CRIMINAL_CASE_NUMBER, DECIDED_CASE_NUMBER, DML_AT, DML_BY, DML_TYPE, INS_AT, INS_BY, IS_ACTIVE, LOST_PP_LAST_PLACE, LOST_PP_LOST_DATE, LOST_PP_NEW_PP_EXPIRE_DATE, LOST_PP_NEW_PP_ISSUE_DATE, LOST_PP_NEW_PP_NUMB'
||'ER, LOST_PP_NEW_PP_PLACE_OF_ISSUE, LOST_PP_NEW_PP_TYPE, LOST_PP_NOTICE, LOST_PP_NOTIFY_DATE, LOST_PP_NOTIFY_PLACE, LOST_PP_VISA_EXP_DATE, LOST_PP_VISA_ON_ARRIV, NOTICE, OSTAY_ARRIVAL_DATE, OSTAY_BLOCK_PERIOD, OSTAY_CREATION_DATE, OSTAY_DEPARTURE_DATE'
||', OSTAY_NOTICE, OSTAY_NO_DAYS, OSTAY_SELF_INDICTMENT, OSTAY_STATUS, OSTAY_TM6, OTHER, OTHER_DESCRIPTION, OWNER_DATA, REASON, REFERENCE_DOCUMENT, RELATED_DOCUMENT, SECRET_LEVEL, TARGET_CODE, TRAVEL_PERMIT, TRAVEL_PERMIT_DATE_DELETE, TRAVEL_PERMIT_DATE'
||'_INSERT, TRAVEL_PERMIT_FROM, TRAVEL_PERMIT_NOTE, TRAVEL_PERMIT_TO, UNDECIDED_CASE_NUMBER, URGENT_CONTACT, WARRANT_ARRESTED_TYPE, closing_reason'',',
'    :P32_CASE_ID',
'   );',
'end;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(15263708918705266)
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
end;
/
begin
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26144240845608027)
,p_query_column_id=>1
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Column name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26144640879608036)
,p_query_column_id=>2
,p_column_alias=>'PREVIOUS_VALUE'
,p_column_display_sequence=>2
,p_column_heading=>'Previous value'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26145007329608037)
,p_query_column_id=>3
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>3
,p_column_heading=>'New value'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26145478612608037)
,p_query_column_id=>4
,p_column_alias=>'CHANGED_AT'
,p_column_display_sequence=>4
,p_column_heading=>'Changed at'
,p_use_as_row_header=>'N'
,p_column_format=>'dd/mm/yyyy HH24:MI'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26145881766608037)
,p_query_column_id=>5
,p_column_alias=>'CHANGED_BY'
,p_column_display_sequence=>5
,p_column_heading=>'Changed by'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57512813698956296)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(80233402649133073)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42845530761172122)
,p_name=>'P32_SURNAME_DISPLAY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42845647905172123)
,p_name=>'P32_MIDDLE_NAME_DISPLAY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Middle Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42845714579172124)
,p_name=>'P32_GIVEN_NAME_DISPLAY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Given Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42845806585172125)
,p_name=>'P32_DATE_OF_BIRTH_DISPLAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date of Birth'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42845999820172126)
,p_name=>'P32_PLACE_OF_BIRTH_DISPLAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of Birth'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56762842971779621)
,p_name=>'P32_UNDECIDED_CASE_NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Undecided Case Number'
,p_source=>'UNDECIDED_CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57514628366956334)
,p_name=>'P32_PASSPORT_NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Passport Number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57514959643956346)
,p_name=>'P32_PASSPORT_EXPIRY_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Passport expiry date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57515331048956347)
,p_name=>'P32_NATIONALITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Nationality'
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
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57515789487956350)
,p_name=>'P32_PASSPORT_ISSUING_COUNTRY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Issuing Country'
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
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57516104812956351)
,p_name=>'P32_SEX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Sex'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Female;FEMALE,Male;MALE,Other;OTHER'
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
 p_id=>wwv_flow_api.id(57516506842956353)
,p_name=>'P32_FIRSTNAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57516981420956354)
,p_name=>'P32_SURNAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Surname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57517313130956355)
,p_name=>'P32_DATE_OF_BIRTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Date of Birth'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1910:2037'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57517707683956356)
,p_name=>'P32_PLACE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(80234313802133082)
,p_prompt=>'Place of birth'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57518721885956361)
,p_name=>'P32_HOST'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80839193281669164)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57519164708956362)
,p_name=>'P32_ABIS_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80839193281669164)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57519515351956363)
,p_name=>'P32_CASE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80839193281669164)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57519957729956364)
,p_name=>'P32_IS_ACTIVE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(80839193281669164)
,p_use_cache_before_default=>'NO'
,p_source=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57520616198956371)
,p_name=>'P32_AUTHORITY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105282060133620477)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Authority'
,p_source=>'AUTHORITY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57521010995956373)
,p_name=>'P32_CONTACT_OWNER_DATA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105282060133620477)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contact Owner Data'
,p_source=>'CONTACT_OWNER_DATA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57521413710956374)
,p_name=>'P32_URGENT_CONTACT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105282060133620477)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Urgent contact'
,p_source=>'URGENT_CONTACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57521831655956376)
,p_name=>'P32_CONTACT_TELEPHONE_NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105282060133620477)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contact telephone number'
,p_source=>'CONTACT_TELEPHONE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57522274776956376)
,p_name=>'P32_OWNER_DATA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105282060133620477)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner data'
,p_source=>'OWNER_DATA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57522665348956377)
,p_name=>'P32_ASSOCIATED_BEHAVIOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(105282060133620477)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Associated behavior'
,p_source=>'ASSOCIATED_BEHAVIOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57523085256956378)
,p_name=>'P32_OTHER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(105282060133620477)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Other'
,p_source=>'OTHER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57523446927956379)
,p_name=>'P32_OTHER_DESCRIPTION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(105282060133620477)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Other Description'
,p_source=>'OTHER_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57524197899956381)
,p_name=>'P32_CASE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Case Type'
,p_source=>'CASE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_CASES_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.case_types$LC',
'  where NVL( is_active, ''Y'' ) = ''Y''',
' order by DISPLAY_ORDER ASC',
''))
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57524562155956383)
,p_name=>'P32_CASE_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Case number'
,p_source=>'CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-bottom-md'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57524983968956385)
,p_name=>'P32_BEHAVIOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Behavior'
,p_source=>'BEHAVIOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57525326233956391)
,p_name=>'P32_REASON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reason'
,p_source=>'REASON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_REASON_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) ,',
'       KEY_VALUE',
'  from dl_common.reason_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57525767059956392)
,p_name=>'P32_CONTACT_INFORMATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contact information'
,p_source=>'CONTACT_INFORMATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57526115613956394)
,p_name=>'P32_REFERENCE_DOCUMENT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reference document'
,p_source=>'REFERENCE_DOCUMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57526544312956395)
,p_name=>'P32_SECRET_LEVEL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Secret level'
,p_source=>'SECRET_LEVEL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_SECRET_LEVELS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'       KEY_VALUE',
'  from dl_common.secret_levels$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57526950801956396)
,p_name=>'P32_TARGET_CODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Target code'
,p_source=>'TARGET_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57527315699956397)
,p_name=>'P32_ACTION_CODE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Action code'
,p_source=>'ACTION_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_ACTION_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.action_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57527714788956398)
,p_name=>'P32_CASE_NOTICE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(105282270403620479)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Case notice '
,p_source=>'NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57528720965956402)
,p_name=>'P32_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79117272702301769)
,p_prompt=>'Photo 1'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_attribute_10=>'/image'
,p_attribute_11=>'http://chh0567:8080/face/detection/portrait'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57529165959956404)
,p_name=>'P32_NEW_11'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(79117272702301769)
,p_prompt=>'Photo 2'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_attribute_10=>'/image'
,p_attribute_11=>'http://chh0567:8080/face/detection/portrait'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57529818379956408)
,p_name=>'P32_NEW_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Right Thumb'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'Y'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57530222876956409)
,p_name=>'P32_NEW_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Right Index'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'2'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57530689906956410)
,p_name=>'P32_NEW_3'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Right Middle'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'3'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57531078649956411)
,p_name=>'P32_NEW_4'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Right Ring'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'4'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57531426646956412)
,p_name=>'P32_NEW_5'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Right Little'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'5'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57531834807956413)
,p_name=>'P32_NEW_6'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Left Thumb'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'6'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57532235244956415)
,p_name=>'P32_NEW_7'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Left Index'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'7'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57532698521956416)
,p_name=>'P32_NEW_8'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Left Middle'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'8'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57533011105956416)
,p_name=>'P32_NEW_9'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Left Ring'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'9'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57533489160956417)
,p_name=>'P32_NEW_10'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(79117379828301770)
,p_prompt=>'Left Little'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'10'
,p_attribute_02=>'16'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_09=>'N'
,p_attribute_10=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57535189485956425)
,p_name=>'P32_SELECTED_TRAVELDOC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105825511978531252)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57535517869956427)
,p_name=>'P32_TRAVELDOC_REDIRECT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105825511978531252)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57541000942956491)
,p_name=>'P32_PROFESSION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_prompt=>'Profession'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57541443445956492)
,p_name=>'P32_NOTICE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_prompt=>'Notice '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57541822793956493)
,p_name=>'P32_SURNAME_THAI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_prompt=>'Surname thai'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57542254549956494)
,p_name=>'P32_MIDDLE_NAME_THAI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_prompt=>'Middle name thai'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57542634328956495)
,p_name=>'P32_GIVEN_NAME_THAI'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(42845132067172118)
,p_prompt=>'Givenname Thai'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57543079828956496)
,p_name=>'P32_BODY_HEIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Body height'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57543405863956497)
,p_name=>'P32_BODY_WEIGHT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Body weight'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57543826622956498)
,p_name=>'P32_HAIR_COLOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Hair color'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57544209993956498)
,p_name=>'P32_HAIR_CHARACTERISTIC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Hair characteristic'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57544660228956499)
,p_name=>'P32_FACE_SHAPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Face shape'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57545062590956499)
,p_name=>'P32_BODY_SHAPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Body shape'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57545455168956500)
,p_name=>'P32_EYE_COLOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Eye Color'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57545898210956501)
,p_name=>'P32_SKIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Skin'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57546266560956502)
,p_name=>'P32_DOMINANT_CHARACTERISTIC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Dominant characteristic'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57546672587956503)
,p_name=>'P32_SPECIAL_CHARACTERISTIC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(42845019036172117)
,p_prompt=>'Special characteristic'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57547756471956507)
,p_name=>'P32_IDENTITY_REDIRECT_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105825249556531250)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57548115066956508)
,p_name=>'P32_SELECTED_IDENTITY_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105825249556531250)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57552108687956520)
,p_name=>'P32_SELECTED_ADDRESS_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105825339241531251)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57552572547956520)
,p_name=>'P32_ADDRESS_REDIRECT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105825339241531251)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57559666806956539)
,p_name=>'P32_TRAVEL_PERMIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105282391947620480)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel Permit?'
,p_source=>'TRAVEL_PERMIT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57560043964956540)
,p_name=>'P32_TRAVEL_PERMIT_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105282391947620480)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel permit from'
,p_source=>'TRAVEL_PERMIT_FROM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57560405749956541)
,p_name=>'P32_TRAVEL_PERMIT_TO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105282391947620480)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel permit to'
,p_source=>'TRAVEL_PERMIT_TO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57560836427956541)
,p_name=>'P32_TRAVEL_PERMIT_NOTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(105282391947620480)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice'
,p_source=>'TRAVEL_PERMIT_NOTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57561209302956542)
,p_name=>'P32_TRAVEL_PERMIT_DATE_INSERT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105282391947620480)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel permit date inserted'
,p_source=>'TRAVEL_PERMIT_DATE_INSERT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57561689982956543)
,p_name=>'P32_TRAVEL_PERMIT_DATE_DELETE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(105282391947620480)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel permit date deleted'
,p_source=>'TRAVEL_PERMIT_DATE_DELETE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57562361477956545)
,p_name=>'P32_ARRESTED_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested Status'
,p_source=>'ARRESTED_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_ARRESTED_STATUSES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.arrested_statuses$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57562750418956546)
,p_name=>'P32_ARRESTED_DESCRIPTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested Description'
,p_source=>'ARRESTED_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57563180475956547)
,p_name=>'P32_DECIDED_CASE_NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Decided case number'
,p_source=>'DECIDED_CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57563555686956548)
,p_name=>'P32_CRIMINAL_CASE_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Criminal case number'
,p_source=>'CRIMINAL_CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57563909841956548)
,p_name=>'P32_RELATED_DOCUMENT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Related document'
,p_source=>'RELATED_DOCUMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57564394092956549)
,p_name=>'P32_ARRESTED_WARRANT_YEAR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested warrant year'
,p_source=>'ARRESTED_WARRANT_YEAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57564762016956550)
,p_name=>'P32_ARRESTED_WARRANT_NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested warrant number'
,p_source=>'ARRESTED_WARRANT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57565129926956551)
,p_name=>'P32_WARRANT_ARRESTED_TYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Warrant arrested type'
,p_source=>'WARRANT_ARRESTED_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_ARRESTED_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.arrested_types$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57565503939956552)
,p_name=>'P32_ARRESTED_WARRANT_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested warrant date'
,p_source=>'ARRESTED_WARRANT_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57565937352956553)
,p_name=>'P32_ARRESTED_WARRANT_EXPIRY_DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(105281737928620474)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested warrant expiry date'
,p_source=>'ARRESTED_WARRANT_EXPIRY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57566633195956555)
,p_name=>'P32_OVERSTAY_CREATED_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108887236631622883)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created Date'
,p_source=>'OSTAY_CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57567051895956556)
,p_name=>'P32_OVERSTAY_SELF_INDICTMENT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108887236631622883)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surrender oneself/ Arrest'
,p_source=>'OSTAY_SELF_INDICTMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57567449819956560)
,p_name=>'P32_OVERSTAY_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(108887236631622883)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'OSTAY_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57567869101956561)
,p_name=>'P32_OVERSTAY_TM6'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(108887236631622883)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Overstay tm6'
,p_source=>'OSTAY_TM6'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57568283555956562)
,p_name=>'P32_OVERSTAY_BLOCK_PERIOD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(108887236631622883)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Blocking period'
,p_source=>'OSTAY_BLOCK_PERIOD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57568682780956563)
,p_name=>'P32_OVERSTAY_NOTICE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(108887236631622883)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Remark'
,p_source=>'OSTAY_NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102063382848266982)
,p_name=>'P32_LOST_PP_LOST_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(158825652296046578)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Lost Passport Date'
,p_source=>'LOST_PP_LOST_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102063750211266993)
,p_name=>'P32_LOST_PP_LAST_PLACE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(158825652296046578)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Place'
,p_source=>'LOST_PP_LAST_PLACE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102064169826266994)
,p_name=>'P32_LOST_PP_NOTIFY_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(158825652296046578)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notify Date'
,p_source=>'LOST_PP_NOTIFY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102064504983266994)
,p_name=>'P32_LOST_PP_NOTIFY_PLACE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(158825652296046578)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notify Place'
,p_source=>'LOST_PP_NOTIFY_PLACE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102064918589266995)
,p_name=>'P32_LOST_PP_VISA_ON_ARRIV'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(158825652296046578)
,p_use_cache_before_default=>'NO'
,p_prompt=>'VISA on Arrival'
,p_source=>'LOST_PP_VISA_ON_ARRIV'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102065339422266996)
,p_name=>'P32_LOST_PP_VISA_EXP_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(158825652296046578)
,p_use_cache_before_default=>'NO'
,p_prompt=>'VISA Expiry Date'
,p_source=>'LOST_PP_VISA_EXP_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102065775812266997)
,p_name=>'P32_LOST_PP_NOTICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(158825652296046578)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice'
,p_source=>'LOST_PP_NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102066416743266999)
,p_name=>'P32_PASSPORT_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(158825773566046579)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Passport Type'
,p_source=>'LOST_PP_NEW_PP_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102066878971267000)
,p_name=>'P32_PASSPORT_NUMBER_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(158825773566046579)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Passport number'
,p_source=>'LOST_PP_NEW_PP_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102067274777267001)
,p_name=>'P32_NEW_PASSPORT_ISSUE_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(158825773566046579)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Issue Date'
,p_source=>'LOST_PP_NEW_PP_ISSUE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102067603561267002)
,p_name=>'P32_NEW_PASSPORT_PLACE_OF_ISSUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(158825773566046579)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of issue'
,p_source=>'LOST_PP_NEW_PP_PLACE_OF_ISSUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102068063625267003)
,p_name=>'P32_PASSPORT_EXPIRE_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(158825773566046579)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Passport expire date'
,p_source=>'LOST_PP_NEW_PP_EXPIRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57570298153956604)
,p_name=>'CloseDialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23326135696712920)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57570744023956610)
,p_event_id=>wwv_flow_api.id(57570298153956604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57576203449956627)
,p_name=>'getCaseDeatilsFromWS'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57576786016956628)
,p_event_id=>wwv_flow_api.id(57576203449956627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var blacklistID = apex.item(''P32_CASE_ID'').getValue();',
'if(!blacklistID) return;',
'getCaseDetailsFromWS(blacklistID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57582643709956639)
,p_name=>'SelectIdentity'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'*[data-selected-identity-id], tbody .a-GV-row td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#IdentitiesGrid'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57583121208956639)
,p_event_id=>wwv_flow_api.id(57582643709956639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).parent().find(''[data-selected-identity-id]'');',
'var identityID = $(this.triggeringElement).attr(''data-selected-identity-id'') || rowSpan.attr(''data-selected-identity-id'');',
'console.log(identityID);',
'apex.item(''P32_SELECTED_IDENTITY_ID'').setValue(identityID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57583532686956640)
,p_name=>'GetTravelDocRedirectURL'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48314559333575029)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57585023129956642)
,p_event_id=>wwv_flow_api.id(57583532686956640)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var identityID = $(''#IdentitiesGrid .a-GV-row.is-selected'').find(''[data-selected-identity-id]'').attr(''data-selected-identity-id'');',
'console.log(identityID);',
'apex.item(''P32_SELECTED_IDENTITY_ID'').setValue(identityID);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57584007563956641)
,p_event_id=>wwv_flow_api.id(57583532686956640)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':50:''||l_session||''::NO:50:P50_IDENTITY_ID:'' || :P32_SELECTED_IDENTITY_ID,',
'        p_checksum_type => ''SESSION''',
'    );',
'    :P32_TRAVELDOC_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P32_SELECTED_IDENTITY_ID'
,p_attribute_03=>'P32_TRAVELDOC_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57584500237956642)
,p_event_id=>wwv_flow_api.id(57583532686956640)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'console.log(apex.item("P32_TRAVELDOC_REDIRECT_URL").getValue());',
'apex.navigation.redirect(apex.item("P32_TRAVELDOC_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57578015622956631)
,p_name=>'ChangedNewTravelDoc'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_SELECTED_TRAVELDOC_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57578577716956632)
,p_event_id=>wwv_flow_api.id(57578015622956631)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region(''TravelDocs'').refresh();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57580791503956635)
,p_name=>'OpenAddress'
,p_event_sequence=>100
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-address-id], tbody .a-GV-row td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#Addresses'
,p_bind_event_type=>'dblclick'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57581204732956637)
,p_event_id=>wwv_flow_api.id(57580791503956635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).parent().find(''span[data-address-id]'');',
'var addressID = $(this.triggeringElement).attr(''data-address-id'') || rowSpan.attr(''data-address-id'');',
'console.log(addressID);',
'apex.item(''P32_SELECTED_ADDRESS_ID'').setValue(addressID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57581708721956637)
,p_event_id=>wwv_flow_api.id(57580791503956635)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':40:''||l_session||''::NO::P40_ADDRESS_ID:'' || :P32_SELECTED_ADDRESS_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P32_ADDRESS_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P32_SELECTED_ADDRESS_ID'
,p_attribute_03=>'P32_ADDRESS_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57582297215956638)
,p_event_id=>wwv_flow_api.id(57580791503956635)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P32_ADDRESS_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57586354343956646)
,p_name=>'OpenTravelDoc'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-traveldoc-id], tbody .a-GV-row td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#TravelDocs'
,p_bind_event_type=>'dblclick'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57586805347956647)
,p_event_id=>wwv_flow_api.id(57586354343956646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).parent().find(''span[data-traveldoc-id]'');',
'var traveldocID = $(this.triggeringElement).attr(''data-traveldoc-id'') || rowSpan.attr(''data-traveldoc-id'');',
'console.log(traveldocID);',
'apex.item(''P32_SELECTED_TRAVELDOC_ID'').setValue(traveldocID);'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57587301835956648)
,p_event_id=>wwv_flow_api.id(57586354343956646)
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
'        p_url => ''f?p='' || l_app || '':50:''||l_session||''::NO:50:P50_TRAVELDOC_ID:'' || :P32_SELECTED_TRAVELDOC_ID, ',
'        p_checksum_type => ''SESSION'');',
'    :P32_TRAVELDOC_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P32_SELECTED_TRAVELDOC_ID'
,p_attribute_03=>'P32_TRAVELDOC_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57587824844956648)
,p_event_id=>wwv_flow_api.id(57586354343956646)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P32_TRAVELDOC_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57572981134956618)
,p_name=>'GetIdentityRedirectURL'
,p_event_sequence=>120
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.a-GV-row.is-selected td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#IdentitiesGrid'
,p_bind_event_type=>'dblclick'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57573427193956619)
,p_event_id=>wwv_flow_api.id(57572981134956618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var identityID = $(''#IdentitiesGrid .a-GV-row.is-selected'').find(''[data-selected-identity-id]'').attr(''data-selected-identity-id'');',
'console.log(identityID);',
'apex.item(''P32_SELECTED_IDENTITY_ID'').setValue(identityID);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57573900287956621)
,p_event_id=>wwv_flow_api.id(57572981134956618)
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
'        p_url => ''f?p='' || l_app || '':60:''||l_session||''::NO:60:P60_IDENTITY_ID,P60_CASE_ID:'' || :P32_SELECTED_IDENTITY_ID || '','' || :P32_CASE_ID,',
'        p_checksum_type => ''SESSION''',
'    );',
'    :P32_IDENTITY_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P32_SELECTED_IDENTITY_ID,P32_CASE_ID'
,p_attribute_03=>'P32_IDENTITY_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57574480805956622)
,p_event_id=>wwv_flow_api.id(57572981134956618)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P32_IDENTITY_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57574886582956623)
,p_name=>'LoadIdentityData'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(105695986633060883)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57575304884956625)
,p_event_id=>wwv_flow_api.id(57574886582956623)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''InteractiveGrid'',this);',
'var identityID = $(''#IdentitiesGrid .a-GV-row.is-selected'').find(''[data-selected-identity-id]'').attr(''data-selected-identity-id'');',
'console.log(identityID);',
'apex.item(''P32_SELECTED_IDENTITY_ID'').setValue(identityID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57575880312956626)
,p_event_id=>wwv_flow_api.id(57574886582956623)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'SELECT ',
'    notice',
'    ,(SELECT DISPLAY_VALUE FROM DL_COMMON.PROFESSIONS WHERE KEY_VALUE = profession)',
'    ,phone_number_0',
'    ,phone_number_1',
'    ,phone_number_2',
'    ,body_height',
'    ,body_weight',
'    ,body_shape',
'    ,hair_color',
'    ,hair_characteristic',
'    ,face_shape',
'    ,eye_color',
'    ,skin',
'    ,dominant_characteristic',
'    ,special_characteristic',
'    ,surname_thai',
'    ,middlename_thai',
'    ,givenname_thai',
'    ,surname',
'    ,middle_name',
'    ,given_name',
'    ,i.date_of_birth_partial.getFormatData(''YYYY-MM-DD'') AS date_of_birth',
'    ,place_of_birth',
'INTO ',
'    :P32_NOTICE',
'    ,:P32_PROFESSION',
'    ,:P32_PHONE_NUMBER_0',
'    ,:P32_PHONE_NUMBER_1',
'    ,:P32_PHONE_NUMBER_2',
'    ,:P32_BODY_HEIGHT',
'    ,:P32_BODY_WEIGHT',
'    ,:P32_BODY_SHAPE',
'    ,:P32_HAIR_COLOR',
'    ,:P32_HAIR_CHARACTERISTIC',
'    ,:P32_FACE_SHAPE',
'    ,:P32_EYE_COLOR',
'    ,:P32_SKIN',
'    ,:P32_DOMINANT_CHARACTERISTIC',
'    ,:P32_SPECIAL_CHARACTERISTIC ',
'    ,:P32_SURNAME_THAI',
'    ,:P32_GIVEN_NAME_THAI',
'    ,:P32_MIDDLE_NAME_THAI',
'    ,:P32_SURNAME_DISPLAY',
'    ,:P32_MIDDLE_NAME_DISPLAY',
'    ,:P32_GIVEN_NAME_DISPLAY',
'    ,:P32_DATE_OF_BIRTH_DISPLAY',
'    ,:P32_PLACE_OF_BIRTH_DISPLAY',
'FROM IDENTITIES i WHERE key_value = :P32_SELECTED_IDENTITY_ID;',
'EXCEPTION WHEN NO_DATA_FOUND THEN ',
'NULL;',
'end;'))
,p_attribute_02=>'P32_SELECTED_IDENTITY_ID'
,p_attribute_03=>'P32_NOTICE,P32_PROFESSION,P32_PHONE_NUMBER_0,P32_PHONE_NUMBER_1,P32_PHONE_NUMBER_2,P32_BODY_HEIGHT,P32_BODY_WEIGHT,P32_BODY_SHAPE,P32_HAIR_COLOR,P32_HAIR_CHARACTERISTIC,P32_FACE_SHAPE,P32_EYE_COLOR,P32_SKIN,P32_DOMINANT_CHARACTERISTIC,P32_SPECIAL_CHA'
||'RACTERISTIC,P32_SURNAME_THAI,P32_MIDDLE_NAME_THAI,P32_GIVEN_NAME_THAI,P32_SURNAME_DISPLAY,P32_MIDDLE_NAME_DISPLAY,P32_GIVEN_NAME_DISPLAY,P32_DATE_OF_BIRTH_DISPLAY,P32_PLACE_OF_BIRTH_DISPLAY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57585490631956643)
,p_name=>'AddRefreshWindow'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(51370685386666603)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57585963799956645)
,p_event_id=>wwv_flow_api.id(57585490631956643)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'top.windowToRefresh = window;'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67568671529613634)
,p_name=>'CloseModalPage'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(57512813698956296)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67568734498613635)
,p_event_id=>wwv_flow_api.id(67568671529613634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57569079229956599)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'FetchCaseRow'
,p_attribute_02=>'V_BLACKLIST_CASES'
,p_attribute_03=>'P32_CASE_ID'
,p_attribute_04=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
