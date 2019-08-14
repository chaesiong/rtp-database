prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(106430524328307700)
,p_name=>'Request an extension of stay'
,p_page_mode=>'NORMAL'
,p_step_title=>'Extend Stay'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://localhost:2013/js/Dermalog.Plugins.js',
'#APP_IMAGES#passreader.js',
'#APP_IMAGES#webcam.js',
'#APP_IMAGES#blacklist.js',
'#APP_IMAGES#dermalogPluginManager.js',
'#APP_IMAGES#shortcuts.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Create The Plugin Manager',
'var DermalogPluginMgr = new DermalogPluginManager();',
'var blacklistServiceURL = ''&AI_BLACKLIST_SERVICE_URL.'';',
'var passportData = '''';',
'',
'$(''#showPassportPortrait'').mousemove(function(e) ',
'{',
'    if(typeof passportData.ImagePortrait !== ''undefined'')',
'    {',
'        var base64Portrait = ''data:image/png;base64,'' + passportData.ImagePortrait.Image;',
'        $img = $(''#passportPortraitImg'');',
'        $img.attr(''src'', base64Portrait);',
'',
'        $img.fadeIn(0);',
'        $img.offset({',
'            top: e.pageY + 18 ,',
'            left: e.pageX - ($img.outerWidth()-18)',
'        });',
'    }',
'}).mouseleave(function() {',
'    $img = $(''#passportPortraitImg'');',
'    if(typeof $img !== ''undefined'')',
'    {',
'        $img.fadeOut(250);',
'    }',
'});',
'',
'//Age and other Date Calculations',
'function getDateFromVarchar(dateToConvert)',
'{',
'	var dateElements = dateToConvert.split("/");',
'	var d = new Date(dateElements[2], parseInt(dateElements[1])-1, dateElements[0]);',
'	',
'	return d;',
'}',
'',
'function getDateAsIsoString(dateToConvert)',
'{',
'	return (getDateFromVarchar(dateToConvert)).toISOString();',
'}',
'',
'function getAge(dateString) {',
'    var today = new Date();',
'    var birthDate = getDateFromVarchar(dateString);',
'    var age = today.getFullYear() - birthDate.getFullYear();',
'    var m = today.getMonth() - birthDate.getMonth();',
'    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {',
'        age--;',
'    }',
'    return age;',
'}',
'',
'function apexCustomEvent(event, data){',
'    apex.event.trigger(document, event, data);',
'}',
'',
'',
'function preventDialogCancel(event, ui){',
'    console.log(event);',
'    console.log(ui);',
'    ',
'    event.preventDefault();',
'',
'    return ''test'';',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''html'').append(''<img id="passportPortraitImg" style="display: none; position: absolute; height: 300px; width: 240px; z-index: 999;" />'');',
'',
'shortcut.add("F9", function() {',
'   DermalogPluginMgr.passreaderPlugin.scan();',
'});',
'',
'$(''.navbarHardwareIcons .t-Button-label'').append(''<div class="hardwareStatus offline"><div class="fingerprintReaderIcon"> </div></div>''); ',
'$(''.navbarHardwareIcons .t-Button-label'').append(''<div class="hardwareStatus offline fa-anim-flash"><div class="webcamIcon"> </div></div></div>''); ',
'$(''.navbarHardwareIcons .t-Button-label'').append(''<div class="hardwareStatus offline fa-anim-flash"><div class="passReaderIcon"> </div></div>''); ',
'',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Red and Green YES/NO Switches*/',
'.apex-button-group input[value="Y"]:checked+label',
'{',
'    /*Green*/',
'    background-color: #8bdc9c;',
'}',
'.apex-button-group input[value="N"]:checked+label',
'{',
'    /*Red*/',
'    background-color: #ff9595;',
'}',
'',
'/*Sets the Text Position when the Loading Screen is showing up*/',
'#driverStatusTexts',
'{',
'    z-index: 2000;',
'    position: absolute;',
'    color: white;',
'    width: 300px;',
'    text-align: center;',
'    font-size: medium;',
'    line-height: normal;',
'}',
'',
'/*Makes the Driver Status texts have a shadow*/',
'#passportScannerStatusText, #webcamScannerStatusText, #fingerprintScannerStatusText',
'{',
'    text-shadow: 1px 0 0 #000, 0 -1px 0 #000, 0 1px 0 #000, -1px 0 0 #000;',
'}',
'',
'/*Mandatory Fields should have a red border */',
'.t-Form--stretchInputs .t-Form-fieldContainer select.selectlist.apex-page-item-error {',
'    border-color: #eb6562;',
'}',
'',
'td[headers="CHILDIMAGE"] img',
'{',
'    width: 100px;',
'}',
'',
'/* Makes the Camera Picuture Shake from Left to right when no Person was found */',
'.shakey{',
'  animation: shake 1s;',
'  animation-iteration-count: 1;',
'}',
'',
'@keyframes shake {',
'  0% { transform: translate(5px, 0px); }',
'  10% { transform: translate(-5px, 0px); }',
'  20% { transform: translate(5px, 0px); }',
'  30% { transform: translate(-5px, 0px); }',
'  40% { transform: translate(5px, 0px); }',
'  50% { transform: translate(-5px, 0px); }',
'  60% { transform: translate(5px, 0px); }',
'  70% { transform: translate(-5px, 0px); }',
'  80% { transform: translate(5px, 0px); }',
'  90% { transform: translate(-5px, 0px); }',
'  100% { transform: translate(5px, 0px); }',
'}',
'',
'#webcamFrame{',
'    margin-left:7px;',
'}'))
,p_step_template=>wwv_flow_api.id(106384267006307446)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181107114551'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100059577014327499)
,p_plug_name=>'Metadata'
,p_region_name=>'applicationMetaData'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100062325212327526)
,p_plug_name=>'PASSPORT_DETAILS'
,p_region_name=>'passportDetailsRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>70
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
 p_id=>wwv_flow_api.id(100062891376327532)
,p_plug_name=>'CURRENT_ADDRESS'
,p_region_name=>'currentAddressRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>80
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
 p_id=>wwv_flow_api.id(100063617337327539)
,p_plug_name=>'VISA'
,p_region_name=>'visaRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
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
 p_id=>wwv_flow_api.id(100224964463440600)
,p_plug_name=>'OFFICIAL USE'
,p_region_name=>'officialUseRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>120
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
 p_id=>wwv_flow_api.id(100228980218440640)
,p_plug_name=>'EXTENSION_INFORMATION'
,p_region_name=>'travelInformationRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>100
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
 p_id=>wwv_flow_api.id(102657184184894032)
,p_plug_name=>'Inline Dialog: Detailed Passport Information'
,p_region_name=>'passreaderInfos'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(106392270743307496)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(111226142313020318)
,p_name=>'Children'
,p_region_name=>'fellowPassengerReport'
,p_template=>wwv_flow_api.id(106393843464307504)
,p_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ROWNUM,',
'    LAST_NAME,',
'    FIRST_NAME,',
'    (SELECT DISPLAY_VALUE FROM lov_relations WHERE RETURN_VALUE = TMP_COLLECTIVE_PASSPORT_DATA.RELATION) as RELATION,',
'    DATE_OF_BIRTH,',
'    (SELECT DISPLAY_VALUE FROM DL_COMMON.HUMAN_SEXES$LC WHERE KEY_VALUE = TMP_COLLECTIVE_PASSPORT_DATA.GENDER) as Gender,',
'    NATIONALITY,',
'    KEY_VALUE,',
'    dbms_lob.getlength(IMAGE) as CHILDIMAGE',
'FROM TMP_COLLECTIVE_PASSPORT_DATA',
'WHERE APP_SESSION = v(''APP_SESSION'')  AND (LAST_NAME IS NOT NULL OR FIRST_NAME IS NOT NULL)',
'ORDER BY ROWNUM ASC',
'',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(106406809148307542)
,p_query_num_rows=>99
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(125832769052397163)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>1
,p_column_heading=>'Rownum'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(125831280207397148)
,p_query_column_id=>2
,p_column_alias=>'LAST_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Last name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(125831311013397149)
,p_query_column_id=>3
,p_column_alias=>'FIRST_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'First name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(125831392292397150)
,p_query_column_id=>4
,p_column_alias=>'RELATION'
,p_column_display_sequence=>4
,p_column_heading=>'Relation'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(125831497289397151)
,p_query_column_id=>5
,p_column_alias=>'DATE_OF_BIRTH'
,p_column_display_sequence=>5
,p_column_heading=>'Date of birth'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(125831606323397152)
,p_query_column_id=>6
,p_column_alias=>'GENDER'
,p_column_display_sequence=>6
,p_column_heading=>'Gender'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(125831745865397153)
,p_query_column_id=>7
,p_column_alias=>'NATIONALITY'
,p_column_display_sequence=>7
,p_column_heading=>'Nationality'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(134462536565750836)
,p_query_column_id=>8
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(134462695617750838)
,p_query_column_id=>9
,p_column_alias=>'CHILDIMAGE'
,p_column_display_sequence=>9
,p_column_heading=>'&nbsp;'
,p_use_as_row_header=>'N'
,p_column_format=>'IMAGE:V_COLLECTIVE_PASSPORT_PICTURES:IMAGE:KEY_VALUE::MIME_TYPE::UPDATE_AT::::'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112420841563823601)
,p_plug_name=>'Hidden Items'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_region_attributes=>'style="display: none";'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'htp.p( APEX_ITEM.TEXTAREA(p_idx => 1,p_value => ''value'', p_item_id => ''imageToSubmit'') );'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(125833350879397169)
,p_plug_name=>'Passport Regions'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>50
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
 p_id=>wwv_flow_api.id(100060556636327509)
,p_plug_name=>'PERSONAL_DETAILS'
,p_region_name=>'personalDetailsRegion'
,p_parent_plug_id=>wwv_flow_api.id(125833350879397169)
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs:margin-top-none'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<span id="scannedPassportInfosButton" aria-hidden="true" class="fa fa-question-circle" style="cursor: pointer; display: none; color: grey; position:absolute; top: 8px; right: 8px;></span>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(125833206059397168)
,p_plug_name=>'Passport Loading Bar'
,p_region_name=>'passportRegion'
,p_parent_plug_id=>wwv_flow_api.id(125833350879397169)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
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
 p_id=>wwv_flow_api.id(126250111255242952)
,p_plug_name=>'Fotoinformationen'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span id="showPassportPortrait" aria-hidden="true" class="fa fa-image" style="cursor: pointer; position:absolute; top: 8px; right: 8px; display: none;"></span>',
'',
'<div style="position: relative;" id="webcamFrame">',
'    <img id="video" class="mainWebcam" />',
'    <img id="silouette" src="#WORKSPACE_IMAGES#person_mask_noaspect.svg" />',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(126251119741242962)
,p_plug_name=>'Buttoncontainer Fotoinformationen'
,p_region_name=>'fotoinformationRegion'
,p_parent_plug_id=>wwv_flow_api.id(126250111255242952)
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(106386861324307487)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111227131735020328)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(111226142313020318)
,p_button_name=>'ADD_CHILD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(106419823729307603)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'+'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-child'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100286967937720480)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'RELOAD_PHOTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pillStart'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Reload photo'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100287370841720481)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'PHOTO_LEFT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Photo left'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100287832950720482)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'PHOTO_UP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Photo up'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-up-alt '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100288199927720483)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'PHOTO_DOWN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Photo down'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-down-alt '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100288582704720484)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'PHOTO_RIGHT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Photo right'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-right-alt '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100288983036720485)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'PHOTO_ZOOM_IN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Photo zoom in'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search-plus '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100289440825720486)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'PHOTO_ZOOM_OUT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Photo zoom out'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search-minus '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100289795389720486)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'PHOTO_SHOOT'
,p_button_static_id=>'shootPhotoButton'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Photo shoot'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-camera '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(135061515912866143)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(126251119741242962)
,p_button_name=>'PHOTO_CENTER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pillEnd'
,p_button_template_id=>wwv_flow_api.id(106419633663307595)
,p_button_image_alt=>'Photo center'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrows'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(111051959112928904)
,p_branch_name=>'Show FEE Dialog'
,p_branch_action=>'return dl_bordercontrol.pkg_apex_fee_and_fine.prepare_form_url (p_key_value => :P1_RECEIPT_NO'||wwv_flow.LF||
' ,p_fee_or_fine => ''FEE'''||wwv_flow.LF||
' ,p_reference_entity => ''TM8_APPLICATION.APPLICATION_NUMBER'''||wwv_flow.LF||
' ,p_reference_number => :P1_APPLICATION_NO'||wwv_flow.LF||
' ,p_owner => ''APEX_REENTRY'''||wwv_flow.LF||
' ,p_print_flag => :P1_RECEIPT'||wwv_flow.LF||
' ,p_fee_exception => :P1_NO_FEES);'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44645107325054195)
,p_name=>'P1_EXTSTAY_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100224964463440600)
,p_prompt=>'End of Extension:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44645199510054196)
,p_name=>'P1_NEXT_ADDRESS_REPORT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100224964463440600)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Next Address Report:'
,p_source=>'SELECT sysdate + 90 from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100059706350327500)
,p_name=>'P1_APPLICATION_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100059577014327499)
,p_prompt=>'Application Date:'
,p_source=>'Select sysdate from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100059777875327501)
,p_name=>'P1_RECEIPT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100059577014327499)
,p_item_default=>'Y'
,p_prompt=>'Print Receipt'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'Y'
,p_attribute_03=>'Yes'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100059904976327502)
,p_name=>'P1_NO_FEES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100059577014327499)
,p_item_default=>'N'
,p_prompt=>'Fee Exception'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'Y'
,p_attribute_03=>'Yes'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100060694033327510)
,p_name=>'P1_TITLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Title:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SALUTATIONS'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_salutations'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100060811402327511)
,p_name=>'P1_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100060932461327512)
,p_name=>'P1_FIRST_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100061006180327513)
,p_name=>'P1_MIDDLE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100061235038327515)
,p_name=>'P1_BIRTHDAY'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Birthday:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419426766307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_LG.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100061295427327516)
,p_name=>'P1_AGE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Age:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>4
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100061402141327517)
,p_name=>'P1_PROFESSION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Profession:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROFESSIONS'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_professions'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100061458671327518)
,p_name=>'P1_LAND_OF_BIRTH'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Native Country:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.COUNTRIES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100061625290327519)
,p_name=>'P1_GENDER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_GENDERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419426766307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100061689245327520)
,p_name=>'P1_PLACE_OF_BIRTH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Place of Birth:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
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
 p_id=>wwv_flow_api.id(100061888415327522)
,p_name=>'P1_SPACER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Spacer'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100061967429327523)
,p_name=>'P1_SPACER_1'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100062451883327527)
,p_name=>'P1_PASSPORT_NO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100062325212327526)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419426766307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100062474172327528)
,p_name=>'P1_PASSPORT_ISSUED_BY'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100062325212327526)
,p_prompt=>'Issued by:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' ORDER BY display_order, NVL(display_value, display_value$dlc) ASC;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419426766307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100062635399327529)
,p_name=>'P1_PASSPORT_ISSUED_ON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100062325212327526)
,p_prompt=>'Issued on:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_LG.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100062674487327530)
,p_name=>'P1_PASSPORT_VALID_UNTIL'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100062325212327526)
,p_prompt=>'Valid until:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419426766307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:&AI_DATE_RANGE_FUTURE_LG.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100062998248327533)
,p_name=>'P1_ADDRESS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100062891376327532)
,p_prompt=>'Address:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100063128796327534)
,p_name=>'P1_CITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100062891376327532)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_province'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100063188396327535)
,p_name=>'P1_DISTRICT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100062891376327532)
,p_prompt=>'Ampur:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_district WHERE adm_class_province = :P1_CITY'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P1_CITY'
,p_ajax_items_to_submit=>'P1_CITY'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100063341243327536)
,p_name=>'P1_PHONE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100062891376327532)
,p_prompt=>'Phone No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100063428186327537)
,p_name=>'P1_STREET'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(100062891376327532)
,p_prompt=>'Street:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100063498356327538)
,p_name=>'P1_SUBDISTRICT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100062891376327532)
,p_prompt=>'Tambon:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_subdistrict WHERE adm_class_district = :P1_DISTRICT'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P1_DISTRICT'
,p_ajax_items_to_submit=>'P1_DISTRICT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100063658414327540)
,p_name=>'P1_VISA_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'Visa&nbsp;Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100063806833327541)
,p_name=>'P1_VISA_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT DISPLAY_VALUE as value, KEY_VALUE as key FROM DL_COMMON.VISA_TYPES WHERE IS_ACTIVE = ''Y'' ORDER BY DISPLAY_ORDER'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100063876272327542)
,p_name=>'P1_VISA_ISSUED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'Visa&nbsp;Issued&nbsp;By:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100064004831327543)
,p_name=>'P1_DOCUMENT_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100064089354327544)
,p_name=>'P1_VISA_ISSUED_AT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'Visa Issued At:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100064171198327545)
,p_name=>'P1_ARRIVAL_IN_THAILAND'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'Arrival in Thailand:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100064305905327546)
,p_name=>'P1_VISA_EXPIRY_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'Stay Until:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM:&AI_DATE_RANGE_FUTURE_SM.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100107490610716809)
,p_name=>'P1_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(100060556636327509)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' ORDER BY display_order, NVL(display_value, display_value$dlc) ASC;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100225125853440601)
,p_name=>'P1_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100224964463440600)
,p_item_default=>'APPROVED'
,p_prompt=>'Status:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Approved;APPROVED,Not Approved;NOT_APPROVED'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419426766307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100225428303440604)
,p_name=>'P1_ADDITIONAL_INFO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100224964463440600)
,p_prompt=>'Additional Info:'
,p_source=>'SELECT ADDITIONAL_INFO FROM DL_BORDERCONTROL.TM8_APPLICATION WHERE APPLICATION_NUMBER = :P1_APPLICATION_NO'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>5
,p_colspan=>12
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100229079248440641)
,p_name=>'P1_EXTSTAY_REASON'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100228980218440640)
,p_prompt=>'Ext. Reason:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Display1;Return1,Display2;Return2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100229187252440642)
,p_name=>'P1_REFERENCE_PERSON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100228980218440640)
,p_prompt=>'Ref. Person:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100229287714440643)
,p_name=>'P1_REFERENCE_PERSON_PHONE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100228980218440640)
,p_prompt=>'Ref. Pers. Phone:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100229423892440644)
,p_name=>'P1_EXTSTAY_DURATION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100228980218440640)
,p_prompt=>'Duration:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Display1;Return1,Display2;Return2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100290640955720488)
,p_name=>'P1_NO_PHOTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(126251119741242962)
,p_prompt=>'No Photo'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:No Photo;1'
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101131867053568337)
,p_name=>'P1_FEE_FK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112420841563823601)
,p_prompt=>'Fee fk'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101132291680568342)
,p_name=>'P1_VISA_FK'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102657257590894033)
,p_name=>'P1_APPLICATION_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100059577014327499)
,p_prompt=>'Application No.:'
,p_source=>'SELECT NVL(MAX(APPLICATION_NUMBER),0)+1 FROM DL_BORDERCONTROL.EXTENDSTAY'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'readonly'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102657396347894034)
,p_name=>'P1_APPLICATION_NO_MAX'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100059577014327499)
,p_use_cache_before_default=>'NO'
,p_prompt=>'/'
,p_pre_element_text=>'/ &nbsp;'
,p_source=>'SELECT NVL(MAX(APPLICATION_NUMBER),0) FROM DL_BORDERCONTROL.EXTENDSTAY'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102657501125894035)
,p_name=>'P1_RECEIPT_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(100059577014327499)
,p_prompt=>'Receipt No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102657628399894036)
,p_name=>'P1_RECEIPT_NO_MAX'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(100059577014327499)
,p_prompt=>'New'
,p_pre_element_text=>'/ &nbsp;&nbsp;'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102657737770894037)
,p_name=>'P1_MANUAL_APPLICATION_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(100059577014327499)
,p_prompt=>'Manual application no'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Manual Application Number;1'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106180065085914210)
,p_name=>'P1_TM6_NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'TM6 Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112657663185380647)
,p_name=>'P1_JSON_BLACKLIST_REQUEST'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112420841563823601)
,p_prompt=>'Json blacklist request'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(125833499183397271)
,p_name=>'P1_TMP_DISTRICT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112420841563823601)
,p_prompt=>'Tmp district'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(125833673904397272)
,p_name=>'P1_TMP_SUBDISTRICT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112420841563823601)
,p_prompt=>'Tmp subdistrict'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134461461599750825)
,p_name=>'P1_NO_MOVEMENT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(112420841563823601)
,p_prompt=>'No movement'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(135060743095866135)
,p_name=>'P1_DOCUMENT_CLASS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(100063617337327539)
,p_prompt=>'Document Class:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DOCUEMENT_CLASS_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(135060869637866136)
,p_name=>'P1_BRDDOCID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112420841563823601)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(135060925351866137)
,p_name=>'P1_AUTOTRACE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(126251119741242962)
,p_item_default=>'1'
,p_prompt=>'Autotrace'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Tracing;1'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(106179209253914201)
,p_validation_name=>'P1_APPLICATION_NO: NOT NULL'
,p_validation_sequence=>10
,p_validation=>'P1_APPLICATION_NO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'You have to enter an Application Number!'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(102657257590894033)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(109389539436633104)
,p_validation_name=>'P1_GENDER: NOT NULL'
,p_validation_sequence=>30
,p_validation=>'P1_GENDER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Gender can''t be empty.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(100061625290327519)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100225713003440607)
,p_name=>'Snapshot'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100289795389720486)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100225827227440608)
,p_event_id=>wwv_flow_api.id(100225713003440607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_PHOTO_BASE64'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Defined in the File webcam.js',
'doSnapshot();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100225889883440609)
,p_name=>'Enable Livestream'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100286967937720480)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100226002333440610)
,p_event_id=>wwv_flow_api.id(100225889883440609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'DermalogPluginMgr.setWebcamState("takePhoto");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100226094905440611)
,p_name=>'Show/Hide Video Livestream'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_NO_PHOTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100226210065440612)
,p_event_id=>wwv_flow_api.id(100226094905440611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var noPhoto = $("#P1_NO_PHOTO_0").prop("checked");',
'if(noPhoto)',
'{',
'    DermalogPluginMgr.setWebcamState(''noPhoto'');',
'}',
'else',
'{',
'    DermalogPluginMgr.setWebcamState(''takePhoto'');',
'}',
'',
'',
'/*',
'if(noPhoto)',
'{',
'    for(var i = 0; i < 20; i++)',
'    {',
'        conStream.panRight();',
'        conStream.tiltUp();',
'    }',
'}',
'else',
'{',
'    for(var i = 0; i < 10; i++)',
'    {',
'        conStream.panLeft();',
'    }',
'    for(var i = 0; i < 5; i++)',
'    {',
'        conStream.tiltDown();',
'    }        ',
'}',
'*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100226327980440613)
,p_name=>'Set Age'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_BIRTHDAY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100226412706440614)
,p_event_id=>wwv_flow_api.id(100226327980440613)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'$(''#P1_AGE'').val( getAge($(''#P1_BIRTHDAY'').val()) );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100226650546440616)
,p_name=>'PanLeft'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100287370841720481)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100226694210440617)
,p_event_id=>wwv_flow_api.id(100226650546440616)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.panLeft();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100226836013440618)
,p_name=>'TiltUp'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100287832950720482)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100226901955440619)
,p_event_id=>wwv_flow_api.id(100226836013440618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.tiltUp();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100227017206440620)
,p_name=>'TiltDown'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100288199927720483)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100227086601440621)
,p_event_id=>wwv_flow_api.id(100227017206440620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.tiltDown();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100227194751440622)
,p_name=>'PanRight'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100288582704720484)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100227261163440623)
,p_event_id=>wwv_flow_api.id(100227194751440622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.panRight();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100227396128440624)
,p_name=>'ZoomIn'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100288983036720485)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100227486239440625)
,p_event_id=>wwv_flow_api.id(100227396128440624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.zoomIn();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100227570949440626)
,p_name=>'ZoomOut'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100289440825720486)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100227747067440627)
,p_event_id=>wwv_flow_api.id(100227570949440626)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.zoomOut();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100227824350440628)
,p_name=>'Populate Passport Details'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_PASSPORT_NO,P1_PASSPORT_ISSUED_BY,P1_PASSPORT_VALID_UNTIL'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P1_PASSPORT_NO'').val().length > 0 && ',
'$(''#P1_PASSPORT_VALID_UNTIL'').val().length > 0 && ',
'$(''#P1_PASSPORT_ISSUED_BY'').val().length > 0'))
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100227915207440629)
,p_event_id=>wwv_flow_api.id(100227824350440628)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_borderdocument DL_BORDERCONTROL.BORDERDOCUMENTS%rowtype;',
'    l_visa           DL_BORDERCONTROL.VISAS%rowtype;',
'    l_entry_form     DL_BORDERCONTROL.ENTRY_FORMS%rowtype;',
'    l_last_arrival   DL_BORDERCONTROL.MOVEMENTS%rowtype;',
'    l_person         DL_BORDERCONTROL.PERSON%rowtype;',
'    ',
'    l_passport_valid_until DATE := nvl(nvl(pkg_common.parse_date(:P1_PASSPORT_VALID_UNTIL, 0, 1, 20, 1), pkg_common.parse_date(:P1_PASSPORT_VALID_UNTIL, 1, 0, 0, 1)), pkg_common.tolerant_to_date(:P1_PASSPORT_VALID_UNTIL, ''DD/MM/YYYY''));',
'BEGIN',
'    --:P1_PASSPORT_VALID_UNTIL := ;',
'    APEX_UTIL.set_session_state(',
'    p_name => ''P1_PASSPORT_VALID_UNTIL'', ',
'    p_value => l_passport_valid_until);',
'    ',
'    --Reset Current Failed/Succeded Status of DataLoad--',
'    APEX_UTIL.set_session_state(',
'    p_name => ''P1_NO_MOVEMENT'', ',
'    p_value => NULL);',
'    ',
'    PKG_REENTRY.GET_DATA_BY_PASSPORT(',
'        :P1_PASSPORT_NO, ',
'        l_passport_valid_until, ',
'        :P1_PASSPORT_ISSUED_BY, ',
'        l_borderdocument,',
'        l_visa,',
'        l_entry_form,',
'        l_last_arrival);',
'        ',
'    :P1_BRDDOCID := l_borderdocument.BRDDOCID;',
'',
'    apex_debug.info( ''l_borderdocument.BRDDOCID: '' || l_borderdocument.BRDDOCID );',
'    apex_debug.info( ''l_entry_form.KEY_VALUE: '' ||  l_entry_form.KEY_VALUE );',
'    apex_debug.info( ''l_visa.KEY_VALUE: '' || l_visa.KEY_VALUE );',
'',
'    --Get Passport Information from Borderdocuments',
'    :P1_BIRTHDAY           := l_borderdocument.CALC_DOB;',
'    :P1_FIRST_NAME         := l_borderdocument.GIVENNAME;',
'    :P1_LAST_NAME          := l_borderdocument.SURNAME;',
'    :P1_PASSPORT_ISSUED_ON := l_borderdocument.MANUAL_ISSUING_DATE;',
'    :P1_PLACE_OF_BIRTH     := l_borderdocument.MANUAL_PLACEOFBIRTH;',
'    :P1_DOCUMENT_TYPE      := l_borderdocument.DOCTYPE;',
'    :P1_DOCUMENT_CLASS     := l_borderdocument.DOCCLASS;  ',
'    ',
'    --Get Visa Information by Borderdocument',
'    :P1_VISA_NUMBER    := l_visa.VISA_NUMBER;',
'    :P1_VISA_ISSUED_AT := l_visa.ISSUING_DATE;',
'    :P1_VISA_ISSUED_BY := l_visa.ISSUING_PLACE;',
'    :P1_VISA_TYPE      := l_visa.VISA_TYPE;',
'    :P1_VISA_FK        := l_visa.KEY_VALUE;',
'',
'    --Set these Hidden Items so we can Refresh the Dependent Select Lists one after each other--',
'    :P1_CITY            := l_entry_form.PROVINCE;',
'    :P1_TMP_DISTRICT    := l_entry_form.DISTRICT;',
'    :P1_TMP_SUBDISTRICT := l_entry_form.SUBDISTRICT;',
'    --The Real Items will be set in the next Dynamic Action TRUE Action (Javascript)',
'',
'    --Get TM6 Form Infos--',
'    :P1_ADDRESS     := l_entry_form.ADDRESS;',
'    :P1_TM6_NUMBER  := l_entry_form.FORM_NO;',
'    ',
'    --Get Movement Infos--',
'    :P1_ARRIVAL_IN_THAILAND := to_char(l_last_arrival.DATE_OF_ENTRY,''DD/MM/YYYY'');',
'    ',
'    ',
'    BEGIN',
'        SELECT * INTO l_person FROM PERSON WHERE KEY_VALUE = l_visa.PERSON;',
'        :P1_PROFESSION            := l_person.PROFESSION;',
'        :P1_TITLE                 := l_person.SALUTATION;',
'        :P1_LAND_OF_BIRTH         := l_person.NATIONALITY;',
'        :P1_PHONE                 := l_person.PHONE_NUMBER;',
'        :P1_STREET                := l_person.TA_STREET;',
'    EXCEPTION when no_data_found then',
'        null;',
'    END;',
'    ',
'    --Extend Stay Specific--',
'    :P1_REFERENCE_PERSON      := l_person.CONTACT_PERSON;',
'    :P1_NEXT_ADDRESS_REPORT   := sysdate + 90;',
'    ',
'    ',
'    EXCEPTION ',
'        when PKG_REENTRY.NO_ENTRY_FORM_FOUND then',
'            :P1_NO_MOVEMENT := ''NO_ENTRY_FORM_FOUND'';',
'        when PKG_REENTRY.NO_BORDERDOC_FOUND then',
'            :P1_NO_MOVEMENT := ''NO_BORDERDOC_FOUND'';',
'        when PKG_REENTRY.NO_VISA_FOUND then',
'            :P1_NO_MOVEMENT := ''NO_VISA_FOUND'';',
'        when PKG_REENTRY.NO_ARRIVAL_FOUND then',
'            :P1_NO_MOVEMENT := ''NO_ARRIVAL_FOUND'';',
'END;'))
,p_attribute_02=>'P1_NO_MOVEMENT,P1_PASSPORT_NO,P1_PASSPORT_VALID_UNTIL,P1_PASSPORT_ISSUED_BY,P1_NATIONALITY,P1_BIRTHDAY,P1_VISA_NUMBER,P1_VISA_ISSUED_BY,P1_VISA_ISSUED_AT,P1_VISA_TYPE,P1_AGE,P1_VISA_FK,P1_PASSPORT_VALID_UNTIL,P1_PASSPORT_ISSUED_ON,P1_PLACE_OF_BIRTH,P'
||'1_TMP_DISTRICT,P1_TMP_SUBDISTRICT,P1_ADDRESS,P1_TM6_NUMBER,P1_ARRIVAL_IN_THAILAND,P1_DOCUMENT_TYPE,P1_CITY,P1_NO_MOVEMENT'
,p_attribute_03=>'P1_BIRTHDAY,P1_VISA_NUMBER,P1_VISA_ISSUED_BY,P1_VISA_ISSUED_AT,P1_VISA_TYPE,P1_AGE,P1_VISA_FK,P1_PASSPORT_VALID_UNTIL,P1_PASSPORT_ISSUED_ON,P1_PLACE_OF_BIRTH,P1_TMP_DISTRICT,P1_TMP_SUBDISTRICT,P1_ADDRESS,P1_TM6_NUMBER,P1_ARRIVAL_IN_THAILAND,P1_DOCUME'
||'NT_TYPE,P1_CITY,P1_NO_MOVEMENT,P1_DOCUMENT_CLASS,P1_BRDDOCID,P1_PROFESSION,P1_TITLE,P1_LAND_OF_BIRTH,P1_REFERENCE_PERSON,P1_PHONE,P1_STREET,P1_NEXT_ADDRESS_REPORT'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112656561322380636)
,p_event_id=>wwv_flow_api.id(100227824350440628)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($(''#P1_NO_MOVEMENT'').val() != '''')',
'{',
'    apex.message.alert("This Passport never entered Thailand before. No Re-Entry can be requested: " + $(''#P1_NO_MOVEMENT'').val(), function() ',
'    {',
'        console.log("Movement could not be found...");',
'    });',
'}',
'else',
'{',
'    $(''#P1_CITY'').trigger(''change'');',
'}',
'',
'',
'if($(''#P1_BIRTHDAY'').val() != '''')',
'{',
'    $(''#P1_BIRTHDAY'').trigger(''change'');',
'}',
'',
'/*',
'$(''#P1_CITY'').change(function() {  ',
'    console.log(apex.item( "P1_TMP_DISTRICT" ).getValue());',
'    apex.item( "P1_DISTRICT" ).setValue( apex.item( "P1_TMP_DISTRICT" ).getValue() );',
'});',
'',
'apex.item( "P1_CITY" ).setValue( apex.item( "P1_TMP_CITY" ).getValue() );',
'*/',
'',
'',
'/*',
'setTimeout(',
'function()',
'{ ',
'    apex.item( "P1_DISTRICT" ).setValue( apex.item( "P1_TMP_DISTRICT" ).getValue() );',
'}, 500);*/',
'/*',
'setTimeout(',
'function()',
'{ ',
'    apex.item( "P1_SUBDISTRICT" ).setValue( apex.item( "P1_TMP_SUBDISTRICT" ).getValue() );',
'}, 1000);',
'    **/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(102657858963894039)
,p_name=>'Toggle Readonly of Appl. No.'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_MANUAL_APPLICATION_NO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(102658052851894040)
,p_event_id=>wwv_flow_api.id(102657858963894039)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var currentState = $(''#P1_APPLICATION_NO'').prop(''readonly'');',
'$(''#P1_APPLICATION_NO'').prop(''readonly'', !currentState).focus();',
'',
'$(''#P1_APPLICATION_NO'').val( parseInt($(''#P1_APPLICATION_NO_MAX'').val())+1);'))
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Sets the ability to manually set the Application Number'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111227621911020333)
,p_name=>'Open: Add new Child'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(111227131735020328)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111227677371020334)
,p_event_id=>wwv_flow_api.id(111227621911020333)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("CREATE_URL", ',
'{',
'    x01: 99999, //The APP_ID can be empty to use the Current Context ',
'    x02: 20  //the Page ID',
'    //x02: 991',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        //console.log(pData);',
'        //Opens the Modal Dialog that comes from the Apex URL Builder (this makes it possible to calculate checksums)',
'        //eval(pData.url); ',
'        apex.navigation.redirect(pData.url);',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(112656045199380630)
,p_name=>'Load Image from existing Permit'
,p_event_sequence=>170
,p_condition_element=>'P1_APPLICATION_NO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112656084562380631)
,p_event_id=>wwv_flow_api.id(112656045199380630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("LOAD_IMAGE", ',
'{',
'    x01: apex.item(''P1_APPLICATION_NO'').getValue()',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        if(pData.status == ''success'')',
'        {',
'            $(''#video'').attr(''src'', ''data:image/jpg;base64,'' + pData.image);',
'            DermalogPluginMgr.setWebcamState(''showTakenPhoto'');',
'            ',
'            console.log(pData);',
'        }',
'    }',
'});',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(112656449092380634)
,p_name=>'Calculate Age from Birthday'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112656483607380635)
,p_event_id=>wwv_flow_api.id(112656449092380634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($(''#P1_BIRTHDAY'').val() != '''')',
'{',
'    $(''#P1_BIRTHDAY'').trigger(''change'');',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(112656730300380637)
,p_name=>'Validate Page'
,p_event_sequence=>190
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.saveButton'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(112656798835380638)
,p_event_id=>wwv_flow_api.id(112656730300380637)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var ok = apex.page.validate();',
'',
'if(ok)',
'{',
'    checkForBlacklist(''search'');',
'}',
'else',
'{',
'    apex.message.alert( apex.lang.getMessage( "APEX.CORRECT_ERRORS" ), ',
'        function() { /* nothing to do */ } ',
'    );',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113088827666763527)
,p_name=>'Blacklist Screen Closed and Permitted'
,p_event_sequence=>200
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "120"'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113088895545763528)
,p_event_id=>wwv_flow_api.id(113088827666763527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''Blacklist Dialog Closed'');',
'',
'apex.submit({',
'  request:"SAVE"',
'});',
'',
'/*',
'//Open Modal Dialog that shows the Blacklist Details',
'apex.server.process("CREATE_URL", ',
'{',
'    //Pass the Result Data so the Collection can be filled',
'    p_clob_01: JSON.stringify( data ),',
'    x01: 520,',
'    x02: 10',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        console.log(pData);',
'        //Opens the Modal Dialog that comes from the Apex URL Builder (this makes it possible to calculate checksums)',
'        //eval(pData.url); ',
'        apex.navigation.redirect(pData.url);',
'    }',
'});*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96999722254571770)
,p_name=>'Fee Receipt Dialog Closed'
,p_event_sequence=>210
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && (this.data.dialogPageId == "10" || this.data.dialogPageId == "50") && this.data.P10_RETURN_RECEIPT_NO1 != undefined'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96999824554571771)
,p_event_id=>wwv_flow_api.id(96999722254571770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''Fee Dialog Closed'');',
'console.log(this.data.P10_KEY_VALUE);',
'',
'apex.item( "P1_FEE_FK" ).setValue(this.data.P10_KEY_VALUE);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101131733009568336)
,p_event_id=>wwv_flow_api.id(96999722254571770)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE TM8_APPLICATION SET FEES_FK = :P1_FEE_FK WHERE APPLICATION_NUMBER = :P1_APPLICATION_NO;',
'commit;'))
,p_attribute_02=>'P1_FEE_FK'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101131951509568338)
,p_event_id=>wwv_flow_api.id(96999722254571770)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.location.replace("f?p=" + $v(''pFlowId'') + ":"+$v(''pFlowStepId'')+":"+$v(''pInstance'')+":RESTART");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101133777676568356)
,p_name=>'Enable/Disable Livestream (Children)'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_NO_PHOTO_CHILDREN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101133867468568357)
,p_event_id=>wwv_flow_api.id(101133777676568356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#video'').toggle();',
'$(''#noPhotoChildren'').toggle();',
'',
'var noPhoto = $("#P1_NO_PHOTO_CHILDREN_0").prop("checked");',
'conStream.enableTrace(!noPhoto);',
'/*',
'if(noPhoto)',
'{',
'    for(var i = 0; i < 20; i++)',
'    {',
'        conStream.panRight();',
'        conStream.tiltUp();',
'    }',
'}',
'else',
'{',
'    for(var i = 0; i < 10; i++)',
'    {',
'        conStream.panLeft();',
'    }',
'    for(var i = 0; i < 5; i++)',
'    {',
'        conStream.tiltDown();',
'    }        ',
'}',
'*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(125830560472397141)
,p_name=>'Color Mandatory red'
,p_event_sequence=>270
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[aria-required=''true'']'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.value == ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(125830637734397142)
,p_event_id=>wwv_flow_api.id(125830560472397141)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(125830733038397143)
,p_event_id=>wwv_flow_api.id(125830560472397141)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(125832866944397164)
,p_name=>'Collective Passport Closed'
,p_event_sequence=>290
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "20" && this.data.P20_KEY_VALUE != null'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(125832939291397165)
,p_event_id=>wwv_flow_api.id(125832866944397164)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(111226142313020318)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(135059751518866125)
,p_name=>'Fee and Fine Dialog Canceled'
,p_event_sequence=>300
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.data.modalPageName == "feeAndFine"'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'customDialogCancel'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(135059797232866126)
,p_event_id=>wwv_flow_api.id(135059751518866125)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.location.replace("f?p=" + $v(''pFlowId'') + ":"+$v(''pFlowStepId'')+":"+$v(''pInstance'')+":RESTART");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(135059993112866128)
,p_name=>'Toggle Picture From Loaded Application'
,p_event_sequence=>310
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'apex.item( "P1_NO_PHOTO" ).getValue()[0] == ''1'''
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(135060102622866129)
,p_event_id=>wwv_flow_api.id(135059993112866128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var noPhoto = $("#P1_NO_PHOTO_0").prop("checked");',
'',
'if(noPhoto)',
'{',
'    DermalogPluginMgr.setWebcamState(''noPhoto'');',
'}',
'',
'//conStream.enableTrace(!noPhoto);',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134461742462750828)
,p_name=>'Set District when Ready'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_DISTRICT'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134461829357750829)
,p_event_id=>wwv_flow_api.id(134461742462750828)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item( "P1_DISTRICT" ).setValue( apex.item( "P1_TMP_DISTRICT" ).getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134461955758750830)
,p_name=>'Set SubDistrict when Ready'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_SUBDISTRICT'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134462058772750831)
,p_event_id=>wwv_flow_api.id(134461955758750830)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item( "P1_SUBDISTRICT" ).setValue( apex.item( "P1_TMP_SUBDISTRICT" ).getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134462856578750839)
,p_name=>'Refresh Children Images'
,p_event_sequence=>340
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(111226142313020318)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134462963842750840)
,p_event_id=>wwv_flow_api.id(134462856578750839)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(111226142313020318)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//This will Forcefully refresh the Children Images to a newly not clientside cached version',
'//I know it is ugly, but it works',
'$(''td[headers="CHILDIMAGE"] img'').each(function(index, element){ $(element).attr(''src'',$(element).attr(''src'') + ''&version='' + (+ new Date()) ) });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(135061079265866138)
,p_name=>'Set Autotracing'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_AUTOTRACE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(135061180555866139)
,p_event_id=>wwv_flow_api.id(135061079265866138)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'DermalogPluginMgr.setWebcamTracing( $(''#P1_AUTOTRACE_0'').prop(''checked'') );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(135061644571866144)
,p_name=>'Re-Align Webcam'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(135061515912866143)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(135061781502866145)
,p_event_id=>wwv_flow_api.id(135061644571866144)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.positionReset(0,0);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106179464137914204)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Existing Application'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_application    DL_BORDERCONTROL.EXTENDSTAY%rowtype;',
'    l_borderdocument DL_BORDERCONTROL.BORDERDOCUMENTS%rowtype;',
'    l_person         DL_BORDERCONTROL.PERSON%rowtype;',
'    l_visa           DL_BORDERCONTROL.VISAS%rowtype;',
'    l_fee            DL_BORDERCONTROL.FAF_FEES_AND_FINES%rowtype := NULL;',
'    ',
'    l_application_c  NUMBER; --To see if an application with that ID exists',
'BEGIN',
'    SELECT count(*) INTO l_application_c FROM DL_BORDERCONTROL.EXTENDSTAY WHERE APPLICATION_NUMBER = :P1_APPLICATION_NO;',
'    IF l_application_c <= 0 then',
'        return; --The Application ID does not exists...',
'    END IF;',
'',
'    BEGIN',
'        SELECT * INTO l_application FROM DL_BORDERCONTROL.EXTENDSTAY      WHERE APPLICATION_NUMBER = :P1_APPLICATION_NO;',
'        SELECT * INTO l_person      FROM DL_BORDERCONTROL.PERSON          WHERE KEY_VALUE          = l_application.PERSON_FK;',
'        SELECT * INTO l_visa        FROM DL_BORDERCONTROL.VISAS           WHERE KEY_VALUE          = l_application.VISA_FK;',
'        ',
'        IF l_application.fees_fk is NOT NULL then',
'            SELECT * INTO l_fee FROM DL_BORDERCONTROL.FAF_FEES_AND_FINES WHERE KEY_VALUE = l_application.fees_fk;',
'        END IF;',
'',
'        /*',
'        --Delete Children collection and add all existing children--',
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''TM8_FELLOW_PASSENGERS'');',
'        FOR l_child IN (SELECT * FROM FELLOW_PASSENGER WHERE PERSON = l_application.PERSON_FK) LOOP',
'            APEX_COLLECTION.ADD_MEMBER (',
'                    ''TM8_FELLOW_PASSENGERS'',',
'                    p_xmltype001 => DL_BORDERCONTROL.PKG_REENTRY.create_xml_child(l_child)); ',
'        END LOOP;*/',
'        ',
'        --Load the Image of the Applicant into the Collection--',
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''EXTSTAY_PERSON_IMAGE'');',
'        IF l_person.IMAGE IS NOT NULL then',
'            APEX_COLLECTION.ADD_MEMBER (',
'                ''EXTSTAY_PERSON_IMAGE'',',
'                p_clob001 => dl_common.pkg_util.encode_base64( l_person.IMAGE ) );',
'        END IF;',
'        --:F01 := dl_common.pkg_util.encode_base64( l_person.image ); --Not working due to the Limit of 32kB ',
'',
'        SELECT NUM_VALUE INTO :P1_GENDER FROM DL_COMMON.HUMAN_SEXES$LC WHERE KEY_VALUE = l_person.SEX;',
'',
'        :P1_FIRST_NAME := l_person.FIRST_NAME;',
'        :P1_MIDDLE_NAME    := l_person.MIDDLE_NAME;',
'        :P1_LAST_NAME      := l_person.LAST_NAME;',
'        :P1_BIRTHDAY       := to_char(l_person.DATE_OF_BIRTH, :APP_NLS_DATE_FORMAT);',
'        :P1_PLACE_OF_BIRTH := l_person.PLACE_OF_BIRTH;',
'        :P1_LAND_OF_BIRTH  := l_person.BIRTH_COUNTRY;',
'        :P1_PHONE          := l_person.PHONE_NUMBER;',
'        :P1_STREET := l_person.TA_STREET;',
'        ',
'        :P1_DISTRICT := l_person.TA_ADM_CLASS_DISTRICT;',
'        :P1_SUBDISTRICT := l_person.TA_ADM_CLASS_SUBDISTRICT;',
'        :P1_CITY := l_person.TA_ADM_CLASS_PROVINCE;',
'        ',
'        :P1_NATIONALITY := l_person.NATIONALITY;',
'        :P1_PROFESSION := l_person.PROFESSION;',
'        :P1_ADDRESS := l_person.PERMANENT_ADDRESS;',
'        --l_person.CONTACT_PERSON := '''';',
'        :P1_TITLE := l_person.SALUTATION;',
'        --l_person.RELATION := '''';',
'        --l_person.TM6_NO := '''';',
'        ',
'        IF l_person.IMAGE IS NULL then',
'            :P1_NO_PHOTO := 1;',
'        END IF;',
'        ',
'',
'        --l_application.purpose_seqno := null;',
'        --:P1_TRAVEL_REASON :=  l_application.purpose;',
'        :P1_TRANSPORT_TYPE :=  l_application.transporttype_seqno;',
'        --:P1_VISA_NUMBER := l_application.visano;',
'        :P1_ARRIVAL_IN_THAILAND := l_application.arrive_date;',
'        :P1_LEAVE_DATE := l_application.leave_date ;',
'        --:P1_RETURN_DATE := l_application.return_date ;',
'        --:P1_VISA_VALID_UNTIL := l_application.endpermit_date;',
'        :P1_PASSPORT_NO := l_application.passportno;',
'        :P1_PASSPORT_ISSUED_ON := l_application.passport_issued_date;',
'        :P1_PASSPORT_VALID_UNTIL := l_application.passport_expiry_date;',
'        :P1_PASSPORT_ISSUED_BY := l_application.passport_issued_by;',
'        --:P1_ENTRY_TYPE := l_application.tm8_type;',
'        --l_application.manualtm8 := null;',
'        :P1_STATUS := l_application.approval_status;',
'        :P1_TM6_NUMBER := l_application.TM6_NUMBER;',
'        --:P1_NUMBER_OF_REENTRIES := l_application.NUMBER_OF_ENTRIES;',
'        ',
'        ',
'        --Document Type Logic START--',
'        l_borderdocument.BRDDOCID := PKG_BORDERDOCUMENTS.GET_DOCUMENT(',
'                        p_DOCNO      => l_application.passportno,',
'                        p_ISSUECTRY  => l_application.passport_issued_by,',
'                        p_EXPIRYDATE => l_application.passport_expiry_date);          ',
'        SELECT ',
'            *',
'        INTO ',
'            l_borderdocument',
'        FROM',
'            DL_BORDERCONTROL.BORDERDOCUMENTS',
'        WHERE ',
'            BORDERDOCUMENTS.BRDDOCID = l_borderdocument.BRDDOCID;     ',
'        :P1_DOCUMENT_TYPE := l_borderdocument.DOCTYPE;',
'        --Document Type Logic END--',
'        ',
'        IF l_fee.KEY_VALUE IS NOT NULL then',
'            :P1_FEE_FK         := l_fee.KEY_VALUE;',
'            :P1_RECEIPT_NO     := l_fee.BOOKING_NUMBER;',
'            :P1_RECEIPT_NO_MAX := l_fee.RECEIPT_NUMBER;',
'        END IF;',
'        ',
'        :P1_APPLICATION_NO      := l_application.APPLICATION_NUMBER;',
'        --:P1_DESTINATION_COUNTRY := l_application.DESTINATION_COUNTRY;',
'        :P1_ADDITIONAL_INFO     := l_application.ADDITIONAL_INFO ;',
'        ',
'        :P1_VISA_NUMBER      := l_visa.VISA_NUMBER;',
'        :P1_VISA_ISSUED_BY   := l_visa.ISSUING_PLACE;',
'        :P1_VISA_ISSUED_AT   := l_visa.ISSUING_DATE ;',
'        :P1_VISA_TYPE        := l_visa.VISA_TYPE;',
'        :P1_VISA_EXPIRY_DATE := l_visa.EXPIRY_DATE;',
'        :P1_VISA_FK          := l_visa.KEY_VALUE;',
'        --l_visa.VISA_DOCUMENT_TYPE := :P1_VISA_DOCUMENT_TYPE; //Why do we need this',
'        ',
'        PKG_COLLECTIVE_PASSPORT.LOAD_DATA(l_person.KEY_VALUE);',
'    ',
'    EXCEPTION WHEN no_data_found then',
'        apex_debug.error(''No Data found while loading Existing Application %s'', sqlerrm);',
'        apex_debug.error( DBMS_UTILITY.FORMAT_ERROR_STACK() );',
'        apex_debug.error( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE() );',
'        raise;',
'        ',
'    END;',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESTART'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111051659551928901)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Session State'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESTART'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101134098465568360)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create or Truncate Collections'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Reset Collections--',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''EXTSTAY_PERSON_IMAGE'');',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''BLACKLIST_HITS'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESTART'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(125833002973397166)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Empty Collective Passport TEMP Table'
,p_process_sql_clob=>'PKG_COLLECTIVE_PASSPORT.INIT_TEMP_TABLE(true);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESTART'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111229152356020348)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Clear the Collection',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(apex_application.g_x01);',
'',
'--Save the Image into the requested Collection',
'APEX_COLLECTION.ADD_MEMBER (',
'    apex_application.g_x01,',
'    p_clob001 => apex_application.g_clob_01);',
'',
'--Write some JSON out for the response',
'apex_json.open_object();',
'apex_json.write(''status'', ''success'');',
'apex_json.write(''collectionName'', apex_application.g_x01);',
'apex_json.close_object();',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112655921745380629)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOAD_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_status VARCHAR2(300) := ''error'';',
'BEGIN',
'    apex_json.open_object();',
'    ',
'    DECLARE',
'        l_image DL_BORDERCONTROL.PERSON.IMAGE%type;',
'    BEGIN',
'        SELECT ',
'            IMAGE into l_image ',
'        FROM ',
'            DL_BORDERCONTROL.PERSON ',
'        WHERE ',
'            KEY_VALUE = (SELECT PERSON_FK FROM DL_BORDERCONTROL.TM8_APPLICATION WHERE APPLICATION_NUMBER = apex_application.g_x01) AND',
'            IMAGE IS NOT NULL;',
'            ',
'        l_status := ''success'';',
'        apex_json.write(''image'', dl_common.pkg_util.encode_base64(l_image) );',
'',
'        EXCEPTION when no_data_found then',
'            null;',
'            --No Image Present',
'    END;',
'',
'    apex_json.write(''status'', l_status);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112656979488380640)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE_URL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare  ',
'    l_url varchar(2056);  ',
'',
'    l_request CLOB      := EMPTY_CLOB();',
'    l_request_clob CLOB  := EMPTY_CLOB();',
'    l_blacklistHits CLOB := EMPTY_CLOB();',
'',
'    l_appid VARCHAR(128);',
'    l_pageid VARCHAR(128);',
'',
'begin   ',
'',
'    l_appid := apex_application.g_x01;',
'    IF l_appid IS NULL then',
'        l_appid := ''&APP_ID.'';',
'    END IF;',
'    ',
'    l_pageid := apex_application.g_x02;',
'    l_url := APEX_UTIL.PREPARE_URL(p_url => ''f?p=''|| l_appid ||'':''||l_pageid||'':&APP_SESSION.::&DEBUG.::'',p_checksum_type => ''SESSION'') ; ',
'',
'    DELETE FROM TMP_BLACKLIST_SEARCH WHERE APP_SESSION = v(''APP_SESSION'');',
'',
'    INSERT INTO TMP_BLACKLIST_SEARCH (KEY_VALUE, APP_SESSION, JSON_DATA) VALUES (SYS_GUID(), v(''APP_SESSION''), apex_application.g_clob_01 );',
'    commit;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''url'', l_url);',
'    apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96998400933571757)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_CHILD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''TM8_FELLOW_PASSENGERS'',',
'        p_seq => apex_application.g_x01);',
'        ',
'    --Write some JSON out for the response',
'    apex_json.open_object();',
'    apex_json.write(''status'', ''success'');',
'    apex_json.close_object();',
'',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(102658631904894046)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_person          DL_BORDERCONTROL.PERSON%rowtype;',
'    l_application     DL_BORDERCONTROL.EXTENDSTAY%rowtype;',
'    l_visa            DL_BORDERCONTROL.VISAS%rowtype;',
'    l_borderdocument  DL_BORDERCONTROL.BORDERDOCUMENTS%rowtype;',
'    l_image           DL_BORDERCONTROL.PERSON.IMAGE%type;',
'BEGIN',
'',
'    BEGIN',
'        SELECT dl_common.pkg_util.decode_base64(clob001) INTO l_image FROM APEX_collections WHERE collection_name = ''EXTSTAY_PERSON_IMAGE'';',
'    EXCEPTION when no_data_found then',
'        l_image := NULL;',
'    END;',
'    ',
'    l_person.FIRST_NAME := :P1_FIRST_NAME;',
'    l_person.MIDDLE_NAME := :P1_MIDDLE_NAME;',
'    l_person.LAST_NAME := :P1_LAST_NAME;',
'    l_person.DATE_OF_BIRTH := :P1_BIRTHDAY;',
'',
'    --Select Key Value ',
'    SELECT KEY_VALUE INTO l_person.SEX FROM DL_COMMON.HUMAN_SEXES$LC WHERE NUM_VALUE = :P1_GENDER;',
'    ',
'    l_person.PLACE_OF_BIRTH := :P1_PLACE_OF_BIRTH;',
'    l_person.BIRTH_COUNTRY := :P1_LAND_OF_BIRTH;',
'    l_person.PHONE_NUMBER := :P1_PHONE;',
'    --l_person.IMAGE := dl_common.pkg_util.decode_base64(:P1_PHOTO_BASE64);',
'    ',
'    apex_debug.error( ''NO_PHOTO_VALUE: '' || :P1_NO_PHOTO );',
'     ',
'    IF :P1_NO_PHOTO IS NULL then',
'        l_person.IMAGE := l_image ;',
'    ELSE',
'        l_person.IMAGE := NULL ;',
'    END IF;',
'    ',
'    l_person.TA_STREET := :P1_STREET;',
'    l_person.TA_ADM_CLASS_DISTRICT := :P1_DISTRICT;',
'    l_person.TA_ADM_CLASS_SUBDISTRICT := :P1_SUBDISTRICT;',
'    l_person.TA_ADM_CLASS_PROVINCE := :P1_CITY;',
'    l_person.NATIONALITY := :P1_NATIONALITY;',
'    l_person.PROFESSION := :P1_PROFESSION;',
'    l_person.PERMANENT_ADDRESS := :P1_ADDRESS;',
'    l_person.CONTACT_PERSON := '''';',
'    l_person.SALUTATION := :P1_TITLE;',
'    l_person.RELATION := '''';',
'    l_person.TM6_NO := '''';',
'    --l_person.ADDR_REPORT_PERIOD := 90;',
'    ',
'    l_application.DOC_DATE := :P1_APPLICATION_DATE;',
'    l_application.transporttype_seqno := :P1_TRANSPORT_TYPE ;',
'    l_application.arrive_date := :P1_ARRIVAL_IN_THAILAND;',
'    l_application.leave_date := :P1_LEAVE_DATE ;',
'    l_application.end_of_extension := :P1_VISA_EXPIRY_DATE;',
'    l_application.next_addr_report := :P1_NEXT_ADDRESS_REPORT;',
'    l_application.passportno := :P1_PASSPORT_NO;',
'    l_application.passport_issued_date := :P1_PASSPORT_ISSUED_ON;',
'    l_application.passport_expiry_date := :P1_PASSPORT_VALID_UNTIL;',
'    l_application.passport_issued_by := :P1_PASSPORT_ISSUED_BY;',
'    l_application.tm6_number := :P1_TM6_NUMBER;',
'    l_application.APPLICATION_NUMBER := :P1_APPLICATION_NO;',
'    l_application.ADDITIONAL_INFO := :P1_ADDITIONAL_INFO;',
'    l_application.ref_person := :P1_REFERENCE_PERSON;',
'    l_application.ref_person_phone := :P1_REFERENCE_PERSON_PHONE;',
'    l_application.reason   := :P1_EXTSTAY_REASON ;',
'    ',
'    l_application.approval_status := :P1_STATUS;',
'',
'',
'    ',
'    l_visa.VISA_NUMBER   := :P1_VISA_NUMBER;',
'    l_visa.ISSUING_PLACE := :P1_VISA_ISSUED_BY;',
'    l_visa.ISSUING_DATE  := :P1_VISA_ISSUED_AT;',
'    l_visa.VISA_TYPE     := :P1_VISA_TYPE;',
'    l_visa.EXPIRY_DATE   := :P1_VISA_EXPIRY_DATE;',
'    l_visa.KEY_VALUE     := :P1_VISA_FK;',
'',
'    l_borderdocument.BRDDOCID := :P1_BRDDOCID;',
'    l_borderdocument.DOCTYPE  := :P1_DOCUMENT_TYPE;',
'    l_borderdocument.DOCCLASS := :P1_DOCUMENT_CLASS;',
'    ',
'    PKG_EXTSTAY.save_application(',
'        io_application => l_application, ',
'        i_person => l_person, ',
'        i_visa => l_visa,',
'        i_borderdocument => l_borderdocument);',
'END;',
'',
'',
'',
'',
'',
'',
'',
''))
,p_process_error_message=>'There was an error while saving the TM8 Application.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'TM8 Application successfully saved.'
);
end;
/
