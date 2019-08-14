prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(71772255799297339)
,p_name=>'Apply for a Re-Entry Permit'
,p_page_mode=>'NORMAL'
,p_step_title=>'Re-Entry Permit'
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
,p_step_template=>wwv_flow_api.id(71725998477297085)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180911142933'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65401308485317138)
,p_plug_name=>'Metadata'
,p_region_name=>'applicationMetaData'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65404056683317165)
,p_plug_name=>'PASSPORT_DETAILS'
,p_region_name=>'passportDetailsRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(65404622847317171)
,p_plug_name=>'CURRENT_ADDRESS'
,p_region_name=>'currentAddressRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(65405348808317178)
,p_plug_name=>'VISA'
,p_region_name=>'visaRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(65406120044317186)
,p_plug_name=>'VISA_TYPE'
,p_region_name=>'visaTypeRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(65566695934430239)
,p_plug_name=>'OFFICIAL USE'
,p_region_name=>'officialUseRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>110
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
 p_id=>wwv_flow_api.id(65570711689430279)
,p_plug_name=>'TRAVEL_INFORMATION'
,p_region_name=>'travelInformationRegion'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>90
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
 p_id=>wwv_flow_api.id(67998915655883671)
,p_plug_name=>'Inline Dialog: Detailed Passport Information'
,p_region_name=>'passreaderInfos'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(71734002214297135)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(76567873784009957)
,p_name=>'Children'
,p_region_name=>'fellowPassengerReport'
,p_template=>wwv_flow_api.id(71735574935297143)
,p_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
,p_query_row_template=>wwv_flow_api.id(71748540619297181)
,p_query_num_rows=>99
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(91174500523386802)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>1
,p_column_heading=>'Rownum'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(91173011678386787)
,p_query_column_id=>2
,p_column_alias=>'LAST_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Last name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(91173042484386788)
,p_query_column_id=>3
,p_column_alias=>'FIRST_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'First name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(91173123763386789)
,p_query_column_id=>4
,p_column_alias=>'RELATION'
,p_column_display_sequence=>4
,p_column_heading=>'Relation'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(91173228760386790)
,p_query_column_id=>5
,p_column_alias=>'DATE_OF_BIRTH'
,p_column_display_sequence=>5
,p_column_heading=>'Date of birth'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(91173337794386791)
,p_query_column_id=>6
,p_column_alias=>'GENDER'
,p_column_display_sequence=>6
,p_column_heading=>'Gender'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(91173477336386792)
,p_query_column_id=>7
,p_column_alias=>'NATIONALITY'
,p_column_display_sequence=>7
,p_column_heading=>'Nationality'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99804268036740475)
,p_query_column_id=>8
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99804427088740477)
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
 p_id=>wwv_flow_api.id(77762573034813240)
,p_plug_name=>'Hidden Items'
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_region_attributes=>'style="display: none";'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(91175082350386808)
,p_plug_name=>'Passport Regions'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(65402288107317148)
,p_plug_name=>'PERSONAL_DETAILS'
,p_region_name=>'personalDetailsRegion'
,p_parent_plug_id=>wwv_flow_api.id(91175082350386808)
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs:margin-top-none'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(91174937530386807)
,p_plug_name=>'Passport Loading Bar'
,p_region_name=>'passportRegion'
,p_parent_plug_id=>wwv_flow_api.id(91175082350386808)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(91591842726232591)
,p_plug_name=>'Fotoinformationen'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
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
 p_id=>wwv_flow_api.id(91592851212232601)
,p_plug_name=>'Buttoncontainer Fotoinformationen'
,p_region_name=>'fotoinformationRegion'
,p_parent_plug_id=>wwv_flow_api.id(91591842726232591)
,p_region_css_classes=>'customInputRegion'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71728592795297126)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76568863206009967)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76567873784009957)
,p_button_name=>'ADD_CHILD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71761555200297242)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'+'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-child'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65628699408710119)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'RELOAD_PHOTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pillStart'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Reload photo'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65629102312710120)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'PHOTO_LEFT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Photo left'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65629564421710121)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'PHOTO_UP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Photo up'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-up-alt '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65629931398710122)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'PHOTO_DOWN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Photo down'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-down-alt '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65630314175710123)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'PHOTO_RIGHT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Photo right'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-right-alt '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65630714507710124)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'PHOTO_ZOOM_IN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Photo zoom in'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search-plus '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65631172296710125)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'PHOTO_ZOOM_OUT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Photo zoom out'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-search-minus '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65631526860710125)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'PHOTO_SHOOT'
,p_button_static_id=>'shootPhotoButton'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pill'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Photo shoot'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-camera '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100403247383855782)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(91592851212232601)
,p_button_name=>'PHOTO_CENTER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--pillEnd'
,p_button_template_id=>wwv_flow_api.id(71761365134297234)
,p_button_image_alt=>'Photo center'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrows'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76393690583918543)
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
 p_id=>wwv_flow_api.id(65401437821317139)
,p_name=>'P1_APPLICATION_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65401308485317138)
,p_prompt=>'Application Date:'
,p_source=>'Select sysdate from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65401509346317140)
,p_name=>'P1_RECEIPT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65401308485317138)
,p_item_default=>'Y'
,p_prompt=>'Print Receipt'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'Y'
,p_attribute_03=>'Yes'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65401636447317141)
,p_name=>'P1_NO_FEES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65401308485317138)
,p_item_default=>'N'
,p_prompt=>'Fee Exception'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'Y'
,p_attribute_03=>'Yes'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65402425504317149)
,p_name=>'P1_TITLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'Title:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SALUTATIONS'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_salutations'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65402542873317150)
,p_name=>'P1_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65402663932317151)
,p_name=>'P1_FIRST_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65402737651317152)
,p_name=>'P1_MIDDLE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65402966509317154)
,p_name=>'P1_BIRTHDAY'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'Birthday:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71761158237297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_LG.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65403026898317155)
,p_name=>'P1_AGE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'Age:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>4
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65403133612317156)
,p_name=>'P1_PROFESSION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'Profession:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROFESSIONS'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_professions'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65403190142317157)
,p_name=>'P1_LAND_OF_BIRTH'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
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
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65403356761317158)
,p_name=>'P1_GENDER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
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
,p_field_template=>wwv_flow_api.id(71761158237297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65403420716317159)
,p_name=>'P1_PLACE_OF_BIRTH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'Place of Birth:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65403619886317161)
,p_name=>'P1_SPACER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'Spacer'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65403698900317162)
,p_name=>'P1_SPACER_1'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
,p_prompt=>'New'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65404183354317166)
,p_name=>'P1_PASSPORT_NO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65404056683317165)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71761158237297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65404205643317167)
,p_name=>'P1_PASSPORT_ISSUED_BY'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(65404056683317165)
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
,p_field_template=>wwv_flow_api.id(71761158237297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65404366870317168)
,p_name=>'P1_PASSPORT_ISSUED_ON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65404056683317165)
,p_prompt=>'Issued on:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_LG.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65404405958317169)
,p_name=>'P1_PASSPORT_VALID_UNTIL'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65404056683317165)
,p_prompt=>'Valid until:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71761158237297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:&AI_DATE_RANGE_FUTURE_LG.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65404729719317172)
,p_name=>'P1_ADDRESS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65404622847317171)
,p_prompt=>'Address:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65404860267317173)
,p_name=>'P1_CITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65404622847317171)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_province'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65404919867317174)
,p_name=>'P1_DISTRICT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65404622847317171)
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
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405072714317175)
,p_name=>'P1_PHONE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65404622847317171)
,p_prompt=>'Phone No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEL'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405159657317176)
,p_name=>'P1_STREET'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(65404622847317171)
,p_prompt=>'Street:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405229827317177)
,p_name=>'P1_SUBDISTRICT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65404622847317171)
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
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405389885317179)
,p_name=>'P1_VISA_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_prompt=>'Visa&nbsp;Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405538304317180)
,p_name=>'P1_VISA_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT DISPLAY_VALUE as value, KEY_VALUE as key FROM DL_COMMON.VISA_TYPES WHERE IS_ACTIVE = ''Y'' ORDER BY DISPLAY_ORDER'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405607743317181)
,p_name=>'P1_VISA_ISSUED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_prompt=>'Visa&nbsp;Issued&nbsp;By:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405736302317182)
,p_name=>'P1_DOCUMENT_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405820825317183)
,p_name=>'P1_VISA_ISSUED_AT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_prompt=>'Visa Issued At:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65405902669317184)
,p_name=>'P1_ARRIVAL_IN_THAILAND'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_prompt=>'Arrival in Thailand:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65406037376317185)
,p_name=>'P1_VISA_EXPIRY_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_prompt=>'Stay Until:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM:&AI_DATE_RANGE_FUTURE_SM.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65406260471317187)
,p_name=>'P1_ENTRY_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65406120044317186)
,p_prompt=>'Entry Type:'
,p_source=>'S'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Single;S,Multiple;M'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71761158237297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65449222081706448)
,p_name=>'P1_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(65402288107317148)
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
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65566857324430240)
,p_name=>'P1_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65566695934430239)
,p_item_default=>'APPROVED'
,p_prompt=>'Status:'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Approved;APPROVED,Not Approved;NOT_APPROVED'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71761158237297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65566922812430241)
,p_name=>'P1_OFFICE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65566695934430239)
,p_prompt=>'Office:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Specification missing'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65567005902430242)
,p_name=>'P1_REASON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65566695934430239)
,p_prompt=>'Reason:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Specification missing'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65567159774430243)
,p_name=>'P1_ADDITIONAL_INFO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65566695934430239)
,p_prompt=>'Additional Info:'
,p_source=>'SELECT ADDITIONAL_INFO FROM DL_BORDERCONTROL.TM8_APPLICATION WHERE APPLICATION_NUMBER = :P1_APPLICATION_NO'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>5
,p_colspan=>12
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65567216725430244)
,p_name=>'P1_VISA_VALID_UNTIL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(65566695934430239)
,p_prompt=>'Permit Expiry Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(71761158237297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-0:&AI_DATE_RANGE_FUTURE_SM.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65570810719430280)
,p_name=>'P1_DESTINATION_COUNTRY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65570711689430279)
,p_prompt=>'Destination:'
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
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65570918723430281)
,p_name=>'P1_TRANSPORT_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65570711689430279)
,p_prompt=>'Transport Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TRANSPORT_TYPES'
,p_lov=>'SELECT display_value, return_value FROM lov_trans_vehicles;'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65571019185430282)
,p_name=>'P1_TRAVEL_REASON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65570711689430279)
,p_prompt=>'Travel Reason:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65571155363430283)
,p_name=>'P1_LEAVE_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(65570711689430279)
,p_prompt=>'Leave Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-0:&AI_DATE_RANGE_FUTURE_SM.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65571211713430284)
,p_name=>'P1_RETURN_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65570711689430279)
,p_prompt=>'Return Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-0:&AI_DATE_RANGE_FUTURE_SM.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65632372426710127)
,p_name=>'P1_NO_PHOTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(91592851212232601)
,p_prompt=>'No Photo'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:No Photo;1'
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66473598524557976)
,p_name=>'P1_FEE_FK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(77762573034813240)
,p_prompt=>'Fee fk'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66474023151557981)
,p_name=>'P1_VISA_FK'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67998989061883672)
,p_name=>'P1_APPLICATION_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65401308485317138)
,p_prompt=>'Application No.:'
,p_source=>'SELECT NVL(MAX(APPLICATION_NUMBER),0)+1 FROM DL_BORDERCONTROL.TM8_APPLICATION'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>20
,p_tag_attributes=>'readonly'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67999127818883673)
,p_name=>'P1_APPLICATION_NO_MAX'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(65401308485317138)
,p_use_cache_before_default=>'NO'
,p_prompt=>'/'
,p_pre_element_text=>'/ &nbsp;'
,p_source=>'SELECT NVL(MAX(APPLICATION_NUMBER),0) FROM DL_BORDERCONTROL.TM8_APPLICATION'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67999232596883674)
,p_name=>'P1_RECEIPT_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(65401308485317138)
,p_prompt=>'Receipt No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67999359870883675)
,p_name=>'P1_RECEIPT_NO_MAX'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(65401308485317138)
,p_prompt=>'New'
,p_pre_element_text=>'/ &nbsp;&nbsp;'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67999469241883676)
,p_name=>'P1_MANUAL_APPLICATION_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(65401308485317138)
,p_prompt=>'Manual application no'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Manual Application Number;1'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71521796556903849)
,p_name=>'P1_TM6_NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
,p_prompt=>'TM6 Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77999394656370286)
,p_name=>'P1_JSON_BLACKLIST_REQUEST'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(77762573034813240)
,p_prompt=>'Json blacklist request'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91172518525386783)
,p_name=>'P1_NUMBER_OF_REENTRIES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(65406120044317186)
,p_prompt=>'Re-Entries:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91175230654386910)
,p_name=>'P1_TMP_DISTRICT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(77762573034813240)
,p_prompt=>'Tmp district'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91175405375386911)
,p_name=>'P1_TMP_SUBDISTRICT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(77762573034813240)
,p_prompt=>'Tmp subdistrict'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99803193070740464)
,p_name=>'P1_NO_MOVEMENT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(77762573034813240)
,p_prompt=>'No movement'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100402474566855774)
,p_name=>'P1_DOCUMENT_CLASS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(65405348808317178)
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
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100402601108855775)
,p_name=>'P1_BRDDOCID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(77762573034813240)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100402656822855776)
,p_name=>'P1_AUTOTRACE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(91592851212232601)
,p_item_default=>'1'
,p_prompt=>'Autotrace'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Tracing;1'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(71520940724903840)
,p_validation_name=>'P1_APPLICATION_NO: NOT NULL'
,p_validation_sequence=>10
,p_validation=>'P1_APPLICATION_NO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'You have to enter an Application Number!'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(67998989061883672)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74731270907622743)
,p_validation_name=>'P1_GENDER: NOT NULL'
,p_validation_sequence=>30
,p_validation=>'P1_GENDER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Gender can''t be empty.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(65403356761317158)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(91175213652386809)
,p_validation_name=>'Must be Numeric'
,p_validation_sequence=>40
,p_validation=>'P1_NUMBER_OF_REENTRIES'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'The Number of Re-Entries has to be numeric.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(91172518525386783)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65567444474430246)
,p_name=>'Snapshot'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(65631526860710125)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65567558698430247)
,p_event_id=>wwv_flow_api.id(65567444474430246)
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
 p_id=>wwv_flow_api.id(65567621354430248)
,p_name=>'Enable Livestream'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(65628699408710119)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65567733804430249)
,p_event_id=>wwv_flow_api.id(65567621354430248)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'DermalogPluginMgr.setWebcamState("takePhoto");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65567826376430250)
,p_name=>'Show/Hide Video Livestream'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_NO_PHOTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65567941536430251)
,p_event_id=>wwv_flow_api.id(65567826376430250)
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
 p_id=>wwv_flow_api.id(65568059451430252)
,p_name=>'Set Age'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_BIRTHDAY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65568144177430253)
,p_event_id=>wwv_flow_api.id(65568059451430252)
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
 p_id=>wwv_flow_api.id(65568382017430255)
,p_name=>'PanLeft'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(65629102312710120)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65568425681430256)
,p_event_id=>wwv_flow_api.id(65568382017430255)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.panLeft();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65568567484430257)
,p_name=>'TiltUp'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(65629564421710121)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65568633426430258)
,p_event_id=>wwv_flow_api.id(65568567484430257)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.tiltUp();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65568748677430259)
,p_name=>'TiltDown'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(65629931398710122)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65568818072430260)
,p_event_id=>wwv_flow_api.id(65568748677430259)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.tiltDown();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65568926222430261)
,p_name=>'PanRight'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(65630314175710123)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65568992634430262)
,p_event_id=>wwv_flow_api.id(65568926222430261)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.panRight();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65569127599430263)
,p_name=>'ZoomIn'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(65630714507710124)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65569217710430264)
,p_event_id=>wwv_flow_api.id(65569127599430263)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.zoomIn();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65569302420430265)
,p_name=>'ZoomOut'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(65631172296710125)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65569478538430266)
,p_event_id=>wwv_flow_api.id(65569302420430265)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.zoomOut();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65569555821430267)
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
 p_id=>wwv_flow_api.id(65569646678430268)
,p_event_id=>wwv_flow_api.id(65569555821430267)
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
'    :P1_TM6_NUMBER  :=l_entry_form.FORM_NO;',
'    ',
'    --Get Movement Infos--',
'    :P1_ARRIVAL_IN_THAILAND := l_last_arrival.DATE_OF_ENTRY;',
'    ',
'    /*',
'    --:P1_PASSPORT_VALID_UNTIL := NULL;',
'    --:P1_BIRTHDAY := NULL;',
'    apex_debug.error(''No Data found while populating Items with Passport Data from Database %s'', sqlerrm);',
'    apex_debug.error( DBMS_UTILITY.FORMAT_ERROR_STACK() );',
'    apex_debug.error( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE() );',
'    apex_debug.error( ''(DOCNO) P1_PASSPORT_NO: '' || :P1_PASSPORT_NO );',
'    apex_debug.error( ''(EXPIRYDATE) P1_PASSPORT_VALID_UNTIL: '' || DL_BORDERCONTROL.PKG_COMMON.Parse_Date(:P1_PASSPORT_VALID_UNTIL,0,1,0,1) );',
'    apex_debug.error( ''(ISSUECTRY) P1_PASSPORT_ISSUED_BY '' || :P1_PASSPORT_ISSUED_BY );',
'    */',
'',
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
||'NT_TYPE,P1_CITY,P1_NO_MOVEMENT,P1_DOCUMENT_CLASS,P1_BRDDOCID'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77998292793370275)
,p_event_id=>wwv_flow_api.id(65569555821430267)
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
 p_id=>wwv_flow_api.id(67999590434883678)
,p_name=>'Toggle Readonly of Appl. No.'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_MANUAL_APPLICATION_NO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67999784322883679)
,p_event_id=>wwv_flow_api.id(67999590434883678)
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
 p_id=>wwv_flow_api.id(76569353382009972)
,p_name=>'Open: Add new Child'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76568863206009967)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76569408842009973)
,p_event_id=>wwv_flow_api.id(76569353382009972)
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
 p_id=>wwv_flow_api.id(77997776670370269)
,p_name=>'Load Image from existing Permit'
,p_event_sequence=>170
,p_condition_element=>'P1_APPLICATION_NO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77997816033370270)
,p_event_id=>wwv_flow_api.id(77997776670370269)
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
 p_id=>wwv_flow_api.id(77998180563370273)
,p_name=>'Calculate Age from Birthday'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77998215078370274)
,p_event_id=>wwv_flow_api.id(77998180563370273)
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
 p_id=>wwv_flow_api.id(77998461771370276)
,p_name=>'Validate Page'
,p_event_sequence=>190
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.saveButton'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(77998530306370277)
,p_event_id=>wwv_flow_api.id(77998461771370276)
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
 p_id=>wwv_flow_api.id(78430559137753166)
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
 p_id=>wwv_flow_api.id(78430627016753167)
,p_event_id=>wwv_flow_api.id(78430559137753166)
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
 p_id=>wwv_flow_api.id(62341453725561409)
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
 p_id=>wwv_flow_api.id(62341556025561410)
,p_event_id=>wwv_flow_api.id(62341453725561409)
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
 p_id=>wwv_flow_api.id(66473464480557975)
,p_event_id=>wwv_flow_api.id(62341453725561409)
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
 p_id=>wwv_flow_api.id(66473682980557977)
,p_event_id=>wwv_flow_api.id(62341453725561409)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.location.replace("f?p=" + $v(''pFlowId'') + ":"+$v(''pFlowStepId'')+":"+$v(''pInstance'')+":RESTART");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(66475509147557995)
,p_name=>'Enable/Disable Livestream (Children)'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_NO_PHOTO_CHILDREN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(66475598939557996)
,p_event_id=>wwv_flow_api.id(66475509147557995)
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
 p_id=>wwv_flow_api.id(91172291943386780)
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
 p_id=>wwv_flow_api.id(91172369205386781)
,p_event_id=>wwv_flow_api.id(91172291943386780)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91172464509386782)
,p_event_id=>wwv_flow_api.id(91172291943386780)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91173722374386795)
,p_name=>'Number Of Reentries'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_ENTRY_TYPE'
,p_condition_element=>'P1_ENTRY_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91173852118386796)
,p_event_id=>wwv_flow_api.id(91173722374386795)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_NUMBER_OF_REENTRIES'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91173937856386797)
,p_event_id=>wwv_flow_api.id(91173722374386795)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_NUMBER_OF_REENTRIES'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91174025756386798)
,p_event_id=>wwv_flow_api.id(91173722374386795)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P1_NUMBER_OF_REENTRIES := 1;'
,p_attribute_03=>'P1_NUMBER_OF_REENTRIES'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91174598415386803)
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
 p_id=>wwv_flow_api.id(91174670762386804)
,p_event_id=>wwv_flow_api.id(91174598415386803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(76567873784009957)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100401482989855764)
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
 p_id=>wwv_flow_api.id(100401528703855765)
,p_event_id=>wwv_flow_api.id(100401482989855764)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.location.replace("f?p=" + $v(''pFlowId'') + ":"+$v(''pFlowStepId'')+":"+$v(''pInstance'')+":RESTART");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100401724583855767)
,p_name=>'Toggle Picture From Loaded Application'
,p_event_sequence=>310
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'apex.item( "P1_NO_PHOTO" ).getValue()[0] == ''1'''
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100401834093855768)
,p_event_id=>wwv_flow_api.id(100401724583855767)
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
 p_id=>wwv_flow_api.id(99803473933740467)
,p_name=>'Set District when Ready'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_DISTRICT'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99803560828740468)
,p_event_id=>wwv_flow_api.id(99803473933740467)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item( "P1_DISTRICT" ).setValue( apex.item( "P1_TMP_DISTRICT" ).getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99803687229740469)
,p_name=>'Set SubDistrict when Ready'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_SUBDISTRICT'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99803790243740470)
,p_event_id=>wwv_flow_api.id(99803687229740469)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.item( "P1_SUBDISTRICT" ).setValue( apex.item( "P1_TMP_SUBDISTRICT" ).getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99804588049740478)
,p_name=>'Refresh Children Images'
,p_event_sequence=>340
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(76567873784009957)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99804695313740479)
,p_event_id=>wwv_flow_api.id(99804588049740478)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(76567873784009957)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//This will Forcefully refresh the Children Images to a newly not clientside cached version',
'//I know it is ugly, but it works',
'$(''td[headers="CHILDIMAGE"] img'').each(function(index, element){ $(element).attr(''src'',$(element).attr(''src'') + ''&version='' + (+ new Date()) ) });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100402810736855777)
,p_name=>'Set Autotracing'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_AUTOTRACE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100402912026855778)
,p_event_id=>wwv_flow_api.id(100402810736855777)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'DermalogPluginMgr.setWebcamTracing( $(''#P1_AUTOTRACE_0'').prop(''checked'') );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100403376042855783)
,p_name=>'Re-Align Webcam'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100403247383855782)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100403512973855784)
,p_event_id=>wwv_flow_api.id(100403376042855783)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'conStream.positionReset(0,0);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71521195608903843)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Existing Application'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_application    DL_BORDERCONTROL.TM8_APPLICATION%rowtype;',
'    l_borderdocument DL_BORDERCONTROL.BORDERDOCUMENTS%rowtype;',
'    l_person         DL_BORDERCONTROL.PERSON%rowtype;',
'    l_visa           DL_BORDERCONTROL.VISAS%rowtype;',
'    l_fee            DL_BORDERCONTROL.FAF_FEES_AND_FINES%rowtype := NULL;',
'    ',
'    l_application_c  NUMBER; --To see if an application with that ID exists',
'BEGIN',
'    SELECT count(*) INTO l_application_c FROM DL_BORDERCONTROL.TM8_APPLICATION WHERE APPLICATION_NUMBER = :P1_APPLICATION_NO;',
'    IF l_application_c <= 0 then',
'        return; --The Application ID does not exists...',
'    END IF;',
'',
'    BEGIN',
'        SELECT * INTO l_application FROM DL_BORDERCONTROL.TM8_APPLICATION WHERE APPLICATION_NUMBER = :P1_APPLICATION_NO;',
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
'        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''TM8_PERSON_IMAGE'');',
'        IF l_person.IMAGE IS NOT NULL then',
'            APEX_COLLECTION.ADD_MEMBER (',
'                ''TM8_PERSON_IMAGE'',',
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
'        :P1_DISTRICT := l_person.TA_ADM_CLASS_DISTRICT;',
'        :P1_SUBDISTRICT := l_person.TA_ADM_CLASS_SUBDISTRICT;',
'        :P1_CITY := l_person.TA_ADM_CLASS_PROVINCE;',
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
'        l_application.purpose_seqno := null;',
'        :P1_TRAVEL_REASON :=  l_application.purpose;',
'        :P1_TRANSPORT_TYPE :=  l_application.transporttype_seqno;',
'        --:P1_VISA_NUMBER := l_application.visano;',
'        :P1_ARRIVAL_IN_THAILAND := l_application.arrive_date;',
'        :P1_LEAVE_DATE := l_application.leave_date ;',
'        :P1_RETURN_DATE := l_application.return_date ;',
'        :P1_VISA_VALID_UNTIL := l_application.endpermit_date;',
'        :P1_PASSPORT_NO := l_application.passportno;',
'        :P1_PASSPORT_ISSUED_ON := l_application.passport_issued_date;',
'        :P1_PASSPORT_VALID_UNTIL := l_application.passport_expiry_date;',
'        :P1_PASSPORT_ISSUED_BY := l_application.passport_issued_by;',
'        :P1_ENTRY_TYPE := l_application.tm8_type;',
'        --l_application.manualtm8 := null;',
'        :P1_STATUS := l_application.approval_status;',
'        :P1_TM6_NUMBER := l_application.TM6_NUMBER;',
'        :P1_NUMBER_OF_REENTRIES := l_application.NUMBER_OF_ENTRIES;',
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
'        :P1_DESTINATION_COUNTRY := l_application.DESTINATION_COUNTRY;',
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
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76393391022918540)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Session State'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESTART'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66475829936557999)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create or Truncate Collections'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Reset Collections--',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''TM8_PERSON_IMAGE'');',
'APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''BLACKLIST_HITS'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESTART'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_is_stateful_y_n=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91174734444386805)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Empty Collective Passport TEMP Table'
,p_process_sql_clob=>'PKG_COLLECTIVE_PASSPORT.INIT_TEMP_TABLE(true);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESTART'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76570883827009987)
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
 p_id=>wwv_flow_api.id(77997653216370268)
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
 p_id=>wwv_flow_api.id(77998710959370279)
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
 p_id=>wwv_flow_api.id(62340132404561396)
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
 p_id=>wwv_flow_api.id(68000363375883685)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_person          DL_BORDERCONTROL.PERSON%rowtype;',
'    l_application     DL_BORDERCONTROL.TM8_APPLICATION%rowtype;',
'    l_visa            DL_BORDERCONTROL.VISAS%rowtype;',
'    l_borderdocument  DL_BORDERCONTROL.BORDERDOCUMENTS%rowtype;',
'    l_image           DL_BORDERCONTROL.PERSON.IMAGE%type;',
'BEGIN',
'',
'    BEGIN',
'        SELECT dl_common.pkg_util.decode_base64(clob001) INTO l_image FROM APEX_collections WHERE collection_name = ''TM8_PERSON_IMAGE'';',
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
'    l_application.purpose_seqno := null;',
'    l_application.purpose := :P1_TRAVEL_REASON ;',
'    l_application.transporttype_seqno := :P1_TRANSPORT_TYPE ;',
'    l_application.arrive_date := :P1_ARRIVAL_IN_THAILAND;',
'    l_application.leave_date := :P1_LEAVE_DATE ;',
'    l_application.return_date := :P1_RETURN_DATE;',
'    l_application.endpermit_date := :P1_VISA_VALID_UNTIL;',
'    l_application.passportno := :P1_PASSPORT_NO;',
'    l_application.passport_issued_date := :P1_PASSPORT_ISSUED_ON;',
'    l_application.passport_expiry_date := :P1_PASSPORT_VALID_UNTIL;',
'    l_application.passport_issued_by := :P1_PASSPORT_ISSUED_BY;',
'    l_application.tm8_type := :P1_ENTRY_TYPE;',
'    l_application.manualtm8 := null;',
'    l_application.tm6_number := :P1_TM6_NUMBER;',
'    l_application.APPLICATION_NUMBER := :P1_APPLICATION_NO;',
'    l_application.DESTINATION_COUNTRY := :P1_DESTINATION_COUNTRY;',
'    l_application.ADDITIONAL_INFO := :P1_ADDITIONAL_INFO;',
'    l_application.NUMBER_OF_ENTRIES_USED := 0;',
'    ',
'    l_application.approval_status := :P1_STATUS;',
'    IF l_application.approval_status = ''NOT_APPROVED'' then',
'        l_application.NUMBER_OF_ENTRIES := NULL;',
'    ELSE',
'        l_application.NUMBER_OF_ENTRIES := NVL(:P1_NUMBER_OF_REENTRIES,1);',
'    end if;',
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
'    PKG_REENTRY.save_application(',
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
