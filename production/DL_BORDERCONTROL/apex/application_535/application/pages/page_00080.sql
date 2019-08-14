prompt --application/pages/page_00080
begin
wwv_flow_api.create_page(
 p_id=>80
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'NIST Import'
,p_page_mode=>'MODAL'
,p_step_title=>'NIST Import'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#javascript/helper-functions.js'
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
'',
'/*  Victor:',
'    This a fix for FingerCapture component, ',
'    to hide unnecessary scroll bar within the component',
'*/',
'.FingerCaptureHeader .messages .FingerCaptureHeaderMessages .buttons.right {',
'    height: calc(100% - 20px);',
'}',
'.FingerCapture * {',
'    margin-top: 0;',
'}',
'.FingerCapture {',
'    border-top: 1px white solid!important;',
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
'    height:380px;',
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
'}',
'',
'#IdentitiesGrid.a-GV-cell {',
'    height: 222px;',
'}',
'',
'',
'',
'.capture-button {',
'    position: absolute;',
'    z-index: 99999!important;',
'    left: 0;',
'    top: 379px;',
'    height: 40px;',
'    background-color: #2074d3 !important;',
'    color: #f5f9fd !important; ',
'}',
'',
'.FaceItemLayout .fc-item-header span:not(.fa) {',
'    padding-left: 49px!important;',
'}',
'.nist-container>.t-Region-header {',
'    background-color: #fcfcfc;',
'}',
'.a-Tabs-panel {',
'    max-height:700px;',
'    overflow:auto;',
'}',
'.segmented-warning .t-DialogRegion-body {',
'    padding: 30px;',
'    font-size: 1.2em;',
'}',
'.nist-import-page-main-view .nist-file-contents:not(:empty) {',
'    height: 490px',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190627152747'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56765697932779649)
,p_plug_name=>'NIST Import'
,p_region_css_classes=>'nist-container'
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
 p_id=>wwv_flow_api.id(3131987273378706)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(56765697932779649)
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
 p_id=>wwv_flow_api.id(3132031413378707)
,p_plug_name=>'Demographic Data'
,p_parent_plug_id=>wwv_flow_api.id(3131987273378706)
,p_region_css_classes=>'demographic-data'
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
 p_id=>wwv_flow_api.id(53953466272589805)
,p_plug_name=>'Case Data'
,p_parent_plug_id=>wwv_flow_api.id(3132031413378707)
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
 p_id=>wwv_flow_api.id(111873309126557509)
,p_plug_name=>'Import NIST Data'
,p_parent_plug_id=>wwv_flow_api.id(3131987273378706)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.DERMALOG.NIST'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'nist-import-page'
,p_attribute_02=>'standard'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(133463122947860205)
,p_plug_name=>'Biometric Images'
,p_region_name=>'BiometricImages'
,p_parent_plug_id=>wwv_flow_api.id(3131987273378706)
,p_region_css_classes=>'region-100'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(133463205154860206)
,p_plug_name=>'Photos'
,p_parent_plug_id=>wwv_flow_api.id(133463122947860205)
,p_region_css_classes=>'too-small-for-overlay region-100 photos-region '
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--hiddenOverflow:margin-bottom-none'
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
 p_id=>wwv_flow_api.id(133463312280860207)
,p_plug_name=>'Fingerprints'
,p_parent_plug_id=>wwv_flow_api.id(133463122947860205)
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
 p_id=>wwv_flow_api.id(28685169374891937)
,p_plug_name=>'Segmented Plain Fingerprints Only'
,p_region_name=>'SegmentedPlainPrintsOnly'
,p_parent_plug_id=>wwv_flow_api.id(56765697932779649)
,p_region_css_classes=>'segmented-warning'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(15252280563705245)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This file contains only rolled or unsegmented fingerprints. In this civil environment only segmented plain fingerprints can be imported.',
'Please ask on the origin agency of the NIST file for segmented plain fingerprints of this criminal.',
'',
'<a href="http://cognaxon.com/index.php?page=nistviewer" target="blank">Free Nist File Viewer</a>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3132593743378712)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(56765697932779649)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3132829830378715)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(56765697932779649)
,p_button_name=>'CreateCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Case'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(28685235738891938)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(28685169374891937)
,p_button_name=>'Ok'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Ok'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3132112741378708)
,p_name=>'P80_FIRSTNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3132031413378707)
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3132201689378709)
,p_name=>'P80_AUTHORITY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(53953466272589805)
,p_prompt=>'Authority/ External Agency'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3132347219378710)
,p_name=>'P80_LASTNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3132031413378707)
,p_prompt=>'Lastname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3132422464378711)
,p_name=>'P80_REFERENCE_DOCUMENT_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(53953466272589805)
,p_prompt=>'Reference document number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3132993993378716)
,p_name=>'P80_SEX'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3132031413378707)
,p_prompt=>'Sex'
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
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53953185738589802)
,p_name=>'P80_CASE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(111873309126557509)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53953580975589806)
,p_name=>'P80_REASON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53953466272589805)
,p_prompt=>'Reason'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_REASON_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) ,',
'       KEY_VALUE',
'  from dl_common.reason_codes$LC',
'  where is_active = ''Y''',
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
 p_id=>wwv_flow_api.id(53953608584589807)
,p_name=>'P80_CASE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53953466272589805)
,p_prompt=>'Case type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_CASES_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.case_types$LC',
'  where NVL( is_active, ''Y'' ) = ''Y''',
' order by DISPLAY_ORDER ASC',
''))
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
 p_id=>wwv_flow_api.id(111858302373514715)
,p_name=>'P80_BIOMETRIC_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(133463122947860205)
,p_use_cache_before_default=>'NO'
,p_source=>'BIOMETRIC_JSON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111858773257514734)
,p_name=>'P80_LIVE_IMAGE_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(133463122947860205)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111859852996514747)
,p_name=>'P80_PHOTO_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(133463205154860206)
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
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111860973697514752)
,p_name=>'P80_FP_RT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_09=>'N'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111861369046514753)
,p_name=>'P80_FP_RI'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111861748581514754)
,p_name=>'P80_FP_RM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111862143057514755)
,p_name=>'P80_FP_RR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111862543654514756)
,p_name=>'P80_FP_RL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111862910356514757)
,p_name=>'P80_FP_LT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111863385042514758)
,p_name=>'P80_FP_LI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111863748717514759)
,p_name=>'P80_FP_LM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111864108311514760)
,p_name=>'P80_FP_LR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111864514291514761)
,p_name=>'P80_FP_LL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(133463312280860207)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171899045381228214)
,p_name=>'P80_REDIRECT_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(111873309126557509)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111872519669557501)
,p_name=>'NISTfileSelected'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_NIST_FILE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111872653726557502)
,p_event_id=>wwv_flow_api.id(111872519669557501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let triggeringElement =  this.triggeringElement.files;',
'console.log(''selected'');',
'this.affectedElements.find(''.NistContainer'').each(function () {',
'      $(this).Nist(''loadNistFile'', triggeringElement);',
'    });',
'',
'window.currentApexSpinner = apex.widget.waitPopup();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111872746042557503)
,p_name=>'NISTFingerLoaded'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56765697932779649)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistaddfingermodel'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3131651780378703)
,p_event_id=>wwv_flow_api.id(111872746042557503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'try{',
'    window.currentApexSpinner.remove();',
'}',
'catch(e){}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111872858057557504)
,p_event_id=>wwv_flow_api.id(111872746042557503)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.FINGERITEM.UPDATE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(133463122947860205)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111873056651557506)
,p_name=>'NISTFaceLoaded'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56765697932779649)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistaddfacemodel'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111873102169557507)
,p_event_id=>wwv_flow_api.id(111873056651557506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.FACEITEM.UPDATE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(133463205154860206)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3131714507378704)
,p_name=>'NISTDescriptionLoaded'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(111873309126557509)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistloadednistjson'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3131887053378705)
,p_event_id=>wwv_flow_api.id(3131714507378704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(this.data);',
'try{',
'    window.currentApexSpinner.remove();',
'}',
'catch(e){}',
'function setName(commaSeparatetName){',
'    var names = commaSeparatetName.split('','');',
'    apex.item(''P80_FIRSTNAME'').setValue(names[0])',
'    if(names[1]){',
'        apex.item(''P80_LASTNAME'').setValue(names[1])',
'    }',
'}',
'',
'var descText = this.data.descriptiveText',
'if(descText[0][''010'']){',
'    apex.item(''P80_REFERENCE_DOCUMENT_NUMBER'').setValue(descText[0][''010''][0][0])',
'}',
'if(descText[0][''030'']){',
'    setName(descText[0][''030''][0][0]);',
'}',
'if(descText[0][''039'']){',
'    var val = ''MALE'';',
'    switch(descText[0][''039''][0][0]){',
'            case''F'':',
'            case''Female'':',
'            val = ''FEMALE''; break;',
'            case''O'':',
'            case''Other'':',
'            val = ''OTHER''; break;',
'    }',
'    apex.item(''P80_SEX'').setValue(val);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3132661401378713)
,p_name=>'CloseDialog'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3132593743378712)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3132778945378714)
,p_event_id=>wwv_flow_api.id(3132661401378713)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3136322510378750)
,p_name=>'CreateInsertJSON'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3132829830378715)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53953034106589801)
,p_event_id=>wwv_flow_api.id(3136322510378750)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!apex.page.validate()) {',
'    apex.message.clearErrors();',
'    apex.message.showErrors({',
'        type: ''error'',',
'        location: ''page'',',
'        message: apex.lang.getMessage(''INSERT.VALIDATION.FILL-ALL-REQUIRED-FIELDS'')',
'    });',
'    return false;',
'}',
'',
'var Demographic = regionToJson(''.demographic-data'');',
'if (!Demographic.givenName){',
'    Demographic.givenName = Demographic.firstname;',
'} ',
'    Demographic.surName = Demographic.surname = Demographic.lastname;',
'',
'var CaseDetails = regionToJson(''.case-details'');',
'var TravelDoc = _.clone(Demographic);',
'',
'    if( Demographic.sex) TravelDoc.sex = Demographic.sex.substring(0, 1);',
'    TravelDoc.docNumber = Demographic.passportNumber;',
'    TravelDoc.issuingCountry = Demographic.passportIssuingCountry;',
'    TravelDoc.dateOfExpiry = Demographic.passportExpiryDate;',
'    Demographic.traveldocs = [];',
'    //Demographic.traveldocs.push(TravelDoc);',
'    CaseDetails.identities = [];',
'    CaseDetails.identities.push(Demographic);',
'    CaseDetails.relatedPersons = [{}];',
'    var tempFinger = [];',
'    var tempFaces = [];',
'',
'function getGuidFromUrl(url) {',
'    var matches = url.match(/\/([^\/\?]{32})($|\?)/);',
'    if (matches) return matches[1];',
'    return null;',
'}',
'$(''.FingerItem'').each(function (i, el) {',
'    var model = $(this).FingerItem(''broadcast'');',
'    if (!model.has(''MissingReason'') && model.has(''ImageUrl'')) {',
'        tempFinger.push({',
'            "image": {',
'                "guid": getGuidFromUrl(model.getImageURL()),',
'            },',
'            "nistImpressionType": model.get(''ImpressionType'').ordinal,',
'            "nistPosition": model.get(''Position'').ordinal',
'        });',
'    }',
'});',
'',
'$(''.FaceItem'').each(function (i, el) {',
'    var model = $(this).FaceItem(''broadcast'');',
'    if (model.has(''ImageGuid'') || model.has(''ImageUrl'')) {',
'        tempFaces.push({',
'            "image": {',
'                "guid": model.get(''ImageGuid'')',
'            },',
'            "nistPosition": 1',
'        });',
'    }',
'});',
'',
'var blacklistRequestBody = {',
'    case: CaseDetails',
'};',
'if (tempFinger.length || tempFaces.length) {',
'    blacklistRequestBody.biometric = {',
'        fingerprints: tempFinger,',
'        faces: tempFaces',
'    }',
'}',
'',
'console.log(''Demo '', blacklistRequestBody);',
'',
'//var endpoint = ''http://10.120.114.11:8091/bpm/blacklist/insert'';',
'var endpoint = ''/bpm/blacklist/insert'';',
'//var endpoint = ''/ords/dl_bordercontrol/blacklist/case/insert'';',
'',
'var lspinner$ = apex.util.showSpinner();',
'var request = $.ajax({',
'    type: ''POST'',',
'    contentType: "application/json; charset=utf-8",',
'    url: endpoint,',
'    data: JSON.stringify(blacklistRequestBody)',
'});',
'',
'request.done(function (data) {',
'    console.log(''success'', data);',
'    lspinner$.remove();',
'    if (data.status.code === ''ERROR'') {',
'        apex.message.clearErrors();',
'        apex.message.showErrors({',
'            type: ''error'',',
'            location: ''page'',',
'            message: ''BPM: Record could not be inserted.''',
'        });',
'    }',
'    else {',
'        try{',
'            apex.message.showPageSuccess(apex.lang.getMessage(''RECORD.INSERTED''));',
'        }',
'        catch(e){console.log(e)}',
'        apex.item(''P80_CASE_ID'').setValue(data.blacklistid);',
'',
'    }',
'',
'    return;',
'});',
'',
'request.fail(function (data) {',
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
'    console.log(''error'',);',
'    lspinner$.remove();',
'',
'});'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67104410415079814)
,p_name=>'NistFileLoadingError'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56765697932779649)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistloadingerror'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67104598873079815)
,p_event_id=>wwv_flow_api.id(67104410415079814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try{',
'    currentApexSpinner.remove();',
'    window.currentApexSpinner.remove();',
'}',
'catch(e){}',
'apex.message.clearErrors();',
'apex.message.showErrors({',
'    type: ''error'',',
'    location: ''page'',',
'    message: this.data',
'});',
'try{',
'    window.currentApexSpinner.remove();',
'}',
'catch(e){}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(228401901589552686)
,p_name=>'OpenInsertedCase'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_CASE_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(228402364739552749)
,p_event_id=>wwv_flow_api.id(228401901589552686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P80_CASE_ID'').getValue()==''''){',
' return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(228402824552552751)
,p_event_id=>wwv_flow_api.id(228401901589552686)
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
'        p_url => ''f?p='' || l_app || '':30:''||l_session||''::YES:30:P30_CASE_ID:'' || :P80_CASE_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P80_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P80_CASE_ID'
,p_attribute_03=>'P80_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(228403315180552751)
,p_event_id=>wwv_flow_api.id(228401901589552686)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.redirect(apex.item("P80_REDIRECT_URL").getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28684915840891935)
,p_name=>'OpenWarningForSegmentedFingerprints'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56765697932779649)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistnofingerprintsimported'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28685006241891936)
,p_event_id=>wwv_flow_api.id(28684915840891935)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'openModal("SegmentedPlainPrintsOnly");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28685331027891939)
,p_name=>'CloseWarnDialog'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(28685235738891938)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28685404629891940)
,p_event_id=>wwv_flow_api.id(28685331027891939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'closeModal(''SegmentedPlainPrintsOnly'');'
,p_stop_execution_on_error=>'Y'
);
end;
/
