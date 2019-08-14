prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Blacklist Case'
,p_page_mode=>'MODAL'
,p_step_title=>'Blacklist Case'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#javascript/helper-functions.js',
'#APP_IMAGES#javascript/jszip.min.js',
'#WORKSPACE_IMAGES#Dermalog.DeviceProviderWebPlugin.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function reloadBiometrics(){',
'    $(''.travel-docs'').trigger(''pass-added'');',
'}',
'',
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
'		Demographic[name] = field.value && field.value.trim();',
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
'}    ',
'    ',
'function gotoReloadTab() {',
'    if(apex.item(''P30_RELOAD_TO_TAB'').getValue() != '''')',
'    $("a[href=''#SR_"+apex.item(''P30_RELOAD_TO_TAB'').getValue()+"]").click();',
'}  ',
'function gotoTab() {',
'    $("a[href=''#SR_BiometricImages'']").click();',
'}    ',
'',
'function getGuidFromUrl( url ){',
'    var matches = url.match(/\/([^\/\?]{32})($|\?)/);',
'    if (matches) return matches[1];',
'    return null;',
'}',
'const toDataURL = url => fetch(url)',
'  .then(response => response.blob())',
'  .then(blob => new Promise((resolve, reject) => {',
'    const reader = new FileReader()',
'    reader.onloadend = () => resolve(reader.result)',
'    reader.onerror = reject',
'    reader.readAsDataURL(blob)',
'  }))',
'const toBlob = url => fetch(url)',
'  .then(response => response.blob())',
'',
'function saveAs(blob, fileName) {',
'    var url = window.URL.createObjectURL(blob);',
'',
'    var anchorElem = document.createElement("a");',
'    anchorElem.style = "display: none";',
'    anchorElem.href = url;',
'    anchorElem.download = fileName;',
'',
'    document.body.appendChild(anchorElem);',
'    anchorElem.click();',
'',
'    document.body.removeChild(anchorElem);',
'',
'    // On Edge, revokeObjectURL should be called only after',
'    // a.click() has completed, atleast on EdgeHTML 15.15048',
'    setTimeout(function () {',
'      window.URL.revokeObjectURL(url);',
'    }, 1000);',
'}',
'function setFaceToItem (url){',
'    var bestMatch = false;',
'    var newGguid  = getGuidFromUrl(url);',
'    var allreadyExists = false;',
'    $(''.FaceItem'').each(function(i, el){',
'        if(!bestMatch){',
'            var faceModel = $(this).FaceItem(''broadcast'');',
'            if(!faceModel.getImageURL){',
'                bestMatch = this;',
'            }',
'            else{',
'                if(newGguid && getGuidFromUrl(faceModel.getImageURL()) == newGguid){',
'                    allreadyExists = true;',
'                }',
'            }',
'        }',
'    })',
'  if(bestMatch && !allreadyExists){',
'      $(bestMatch).FaceItem(''urlToModel'', url );',
'  }',
'}',
'function getGuidFromUrl(url) {',
'        var matches = url.match(/\/([^\/\?]{32})($|\?)/);',
'        if (matches) return matches[1];',
'        return null;',
'}',
'function setBlockingPeriod(){',
'    var blockingSelectField =  apex.item(''P30_OSTAY_BLOCK_PERIOD'');',
'    var overstayDays = apex.item(''P30_OSTAY_NO_DAYS'').getValue();',
'    if(apex.item(''P30_OSTAY_SELF_INDICTMENT_Y'').getValue()==''Y''){',
'        if(overstayDays>90 && overstayDays<365){',
'        blockingSelectField.setValue(1);',
'        }',
'        if(overstayDays>365 && overstayDays<(365*3)){',
'            blockingSelectField.setValue(3);',
'        }',
'        if(overstayDays>(365*3) && overstayDays<(365*5)){',
'            blockingSelectField.setValue(5);',
'        }',
'        if(overstayDays>(365*5)){',
'            blockingSelectField.setValue(10);',
'        }',
'    }',
'    else{',
'        if(overstayDays<365){',
'            blockingSelectField.setValue(5);',
'        }',
'        if(overstayDays>365){',
'            blockingSelectField.setValue(10);',
'        }',
'    }',
'',
'}'))
,p_javascript_code_onload=>'apex.page.warnOnUnsavedChanges = function (e) { } ;'
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
'    right: 8px;',
'    top: 6px;',
'    height: 40px;',
'    background-color: #2074d3 !important;',
'    color: #f5f9fd !important; ',
'}',
'',
'.FaceItemLayout .fc-item-header span:not(.fa) {',
'    padding-left: 49px!important;',
'}',
'.default .LeftHand  {',
'    text-align: left;',
'    margin-left: 33px;',
'}',
'.photos-region .t-Form-fieldContainer.display-image-container, ',
'.photos-region .t-Form-fieldContainer.display-image-container .t-Form-itemWrapper,',
'.display-image-container .t-Form-inputContainer {',
'    height: auto;',
'}',
'.display-image-container table {',
'    width:100%;',
'}',
'.t-Button:not(.t-Button--simple):focus {',
'    background-color: #CC0000;',
'}',
'.closing-reason {',
'    border: 1px solid red !important;',
'}',
'.FingerCaptureHeader .controls .FingerCaptureHeaderControls>div.missing svg .progress {',
'	    fill: rgba(255,100,100,0.6);',
'}',
'.FingerCapture.default .RightHand .FingerCaptureHeaderControls {',
'    left: 1px;',
'}',
'.FingerprintItemLayout .quality-wrapper.quality-indicator svg {',
'	    display:none;',
'}',
'.permitted-days .t-Form-inputContainer input{',
'    background-color: rgba(200,255,200,0.7)',
'}',
'.overstay-days .t-Form-inputContainer input{',
'    background-color: rgba(255,200,200,0.7)',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1280px'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190627152747'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22721268317176838)
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
 p_id=>wwv_flow_api.id(47769575933664238)
,p_plug_name=>'New'
,p_region_name=>'TabContainer'
,p_parent_plug_id=>wwv_flow_api.id(22721268317176838)
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
 p_id=>wwv_flow_api.id(21605056163345533)
,p_plug_name=>'Biometric Images'
,p_region_name=>'BiometricImages'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
,p_region_css_classes=>'region-100'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(21605138370345534)
,p_plug_name=>'Photos'
,p_region_name=>'BiometricPhotos'
,p_parent_plug_id=>wwv_flow_api.id(21605056163345533)
,p_region_css_classes=>'too-small-for-overlay region-100 photos-region '
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h240:t-Region--hiddenOverflow:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>12
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21605245496345535)
,p_plug_name=>'Fingerprints'
,p_region_name=>'BiometricFingerprints'
,p_parent_plug_id=>wwv_flow_api.id(21605056163345533)
,p_region_css_classes=>'fingeritem-region region-100'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h640:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_css_classes=>'height-700'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(28685751564891943)
,p_plug_name=>'Nist Import'
,p_parent_plug_id=>wwv_flow_api.id(21605056163345533)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(56763719232779630)
,p_plug_name=>'FingerCapture'
,p_parent_plug_id=>wwv_flow_api.id(21605056163345533)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.DERMALOG.FINGERCAPTURE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'default'
,p_attribute_02=>'Y'
,p_attribute_03=>'lf10'
,p_attribute_04=>'bsi'
,p_attribute_16=>'nfiq2'
,p_attribute_17=>'Y'
,p_attribute_18=>'N'
,p_attribute_19=>'Y'
,p_attribute_20=>'Y'
,p_attribute_21=>'Y'
,p_attribute_22=>'N'
,p_attribute_24=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "UseImageService": false,',
'  "WarnOnRemoveFinger": false,',
'  "DeviceSettings": {',
'    "Beep": true,',
'    "UseLeds": true,',
'    "FakeDetection":false',
'  },',
'  "ContaminationWarnThreshold": 80,',
'  "ContaminationOkThreshold": 30,',
'  "EnrollmentSettings": {',
'      "DuplicationThreshold": 90,',
'      "Plain": {',
'        "ShowBoundingBox": false,',
'        "ShowInformationBox": false,',
'        "MaxDuration": 0.15,',
'        "MaxQualityThumb": 50,',
'        "MaxQualityIndex": 50,',
'        "MaxQualityMiddle": 40,',
'        "MaxQualityRing": 40,',
'        "MaxQualityLittle": 25,',
'        "MinQualityThumb": 20,',
'        "MinQualityIndex": 20,',
'        "MinQualityMiddle": 8,',
'        "MinQualityRing": 5,',
'        "MinQualityLittle": 0',
'      }',
'  },',
'  "Rescaleparams": {',
'    "Rescale": true,',
'    "Horizontal": 500,',
'    "Vertical": 500,',
'    "dpi": 499',
'  },',
'  "FakeDetectionSettings": {',
'    "LivenessWarnThreshold": 20,',
'    "LivenessThresholdLow":  30,',
'    "LivenessThresholdHigh": 75,',
'    "LivenessLabelLow": "Fake",',
'    "LivenessLabelMiddle": "Suspicious",',
'    "LivenessAverageScore": false,',
'    "LivenessLabelHigh": "OK"',
'  }',
'}'))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23327058949712929)
,p_plug_name=>'Case Details'
,p_region_name=>'CaseDetails'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
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
 p_id=>wwv_flow_api.id(3135512100378742)
,p_plug_name=>'Nist Export Options'
,p_parent_plug_id=>wwv_flow_api.id(23327058949712929)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(3134455690378731)
,p_plug_name=>'Nist Container'
,p_region_name=>'NistExport'
,p_parent_plug_id=>wwv_flow_api.id(3135512100378742)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.DERMALOG.NIST'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'standard'
,p_attribute_02=>'standard'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34123380435166601)
,p_plug_name=>'ZIP Export Options'
,p_parent_plug_id=>wwv_flow_api.id(23327058949712929)
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
 p_id=>wwv_flow_api.id(47769925801664242)
,p_plug_name=>'Related Organization Data'
,p_parent_plug_id=>wwv_flow_api.id(23327058949712929)
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
 p_id=>wwv_flow_api.id(47770136071664244)
,p_plug_name=>'Case Data'
,p_parent_plug_id=>wwv_flow_api.id(23327058949712929)
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
 p_id=>wwv_flow_api.id(5194096086864008)
,p_plug_name=>'Add Closing Reason'
,p_region_name=>'closingReason'
,p_parent_plug_id=>wwv_flow_api.id(47770136071664244)
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(15252280563705245)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47766909560664212)
,p_plug_name=>'Person Data'
,p_region_name=>'PersonData'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
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
 p_id=>wwv_flow_api.id(48183701193104647)
,p_plug_name=>'Names, Addresses and Traveldocs'
,p_parent_plug_id=>wwv_flow_api.id(47766909560664212)
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
 p_id=>wwv_flow_api.id(22722242217176848)
,p_plug_name=>'Demographic and Biometric Description'
,p_parent_plug_id=>wwv_flow_api.id(48183701193104647)
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
 p_id=>wwv_flow_api.id(42844613558172113)
,p_plug_name=>'Demographic Description'
,p_parent_plug_id=>wwv_flow_api.id(22722242217176848)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(42844740260172114)
,p_plug_name=>'Biometric Description'
,p_parent_plug_id=>wwv_flow_api.id(22722242217176848)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48313115224575015)
,p_plug_name=>'Identities'
,p_parent_plug_id=>wwv_flow_api.id(48183701193104647)
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
 p_id=>wwv_flow_api.id(48183852301104648)
,p_plug_name=>'Identities'
,p_region_name=>'IdentitiesGrid'
,p_parent_plug_id=>wwv_flow_api.id(48313115224575015)
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
'WHERE ci.blacklist_case = :P30_CASE_ID;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P30_CASE_ID'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48184002351104650)
,p_name=>'GIVEN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GIVEN_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Given name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(48311760975575001)
,p_name=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SURNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Surname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(48314432517575028)
,p_name=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48932427019296339)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Image'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<img src="&IMAGE." style="max-width: 50px" data-selected-identity-id="&KEY_VALUE.">'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(48183941037104649)
,p_internal_uid=>48183941037104649
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
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(48321685267575648)
,p_interactive_grid_id=>wwv_flow_api.id(48183941037104649)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(48321704242575648)
,p_report_id=>wwv_flow_api.id(48321685267575648)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48338502046575908)
,p_view_id=>wwv_flow_api.id(48321704242575648)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(48184002351104650)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>477
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48339062735575914)
,p_view_id=>wwv_flow_api.id(48321704242575648)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(48311760975575001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>551
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48385311818055191)
,p_view_id=>wwv_flow_api.id(48321704242575648)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(48314432517575028)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50791831860809556)
,p_view_id=>wwv_flow_api.id(48321704242575648)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(48932427019296339)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48313204909575016)
,p_plug_name=>'Addresses'
,p_parent_plug_id=>wwv_flow_api.id(48183701193104647)
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
 p_id=>wwv_flow_api.id(48312698401575010)
,p_plug_name=>'Addresses'
,p_region_name=>'Addresses'
,p_parent_plug_id=>wwv_flow_api.id(48313204909575016)
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
'        ,sub_district',
'        ,district',
'        ,province',
'        ,zipcode',
'        ,country',
'  FROM dl_blacklist.addresses',
'--WHERE identity = :P30_SELECTED_IDENTITY_ID;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(48183852301104648)
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48929528271296310)
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48929681302296311)
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
,p_parent_column_id=>wwv_flow_api.id(48314432517575028)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48929879922296313)
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
 p_id=>wwv_flow_api.id(48929970846296314)
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
 p_id=>wwv_flow_api.id(48930187334296316)
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
 p_id=>wwv_flow_api.id(48930287565296317)
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
 p_id=>wwv_flow_api.id(48930366032296318)
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
 p_id=>wwv_flow_api.id(48930521852296320)
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
 p_id=>wwv_flow_api.id(48930638330296321)
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
 p_id=>wwv_flow_api.id(48930712744296322)
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
 p_id=>wwv_flow_api.id(48930861744296323)
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
 p_id=>wwv_flow_api.id(48931592935296330)
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
 p_id=>wwv_flow_api.id(48932275126296337)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94391266589593140)
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(48312775810575011)
,p_internal_uid=>48312775810575011
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
 p_id=>wwv_flow_api.id(48364474891834966)
,p_interactive_grid_id=>wwv_flow_api.id(48312775810575011)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(48364594382834966)
,p_report_id=>wwv_flow_api.id(48364474891834966)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49320233034019338)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(48929528271296310)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>35
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49320707252019366)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(48929681302296311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49321728421019382)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(48929879922296313)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49322284845019389)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(48929970846296314)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49323226108019403)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(48930187334296316)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49323713208019410)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(48930287565296317)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49324213243019418)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(48930366032296318)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49325194489019434)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(48930521852296320)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49325681187019443)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(48930638330296321)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49326106600019455)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(48930712744296322)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49326660821019468)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(48930861744296323)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50350686751507177)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(48931592935296330)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50502953445902148)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(48932275126296337)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>58
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94824274863418392)
,p_view_id=>wwv_flow_api.id(48364594382834966)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(94391266589593140)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48313377646575017)
,p_plug_name=>'Travel Documents'
,p_parent_plug_id=>wwv_flow_api.id(48183701193104647)
,p_region_css_classes=>'travel-docs'
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
 p_id=>wwv_flow_api.id(48313480981575018)
,p_plug_name=>'Traveldocuments'
,p_region_name=>'TravelDocs'
,p_parent_plug_id=>wwv_flow_api.id(48313377646575017)
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
'        ,(SELECT NVL(display_value,DISPLAY_VALUE$DLC) display_value FROM DL_COMMON.BC_DOC_CLASS$LC where IS_ACTIVE=''Y'' AND key_value=COALESCE(t.doc_class, t.doc_type) ) as doc_type',
'        ,(SELECT coalesce(max( ''/image/''||image_id||''?width=450'' ) ,''#WORKSPACE_IMAGES#template_photo.png'')  FROM dl_blacklist.faces WHERE id=t.face_id) as image',
'        ,t.issuing_country',
'        ,t.doc_number',
'        ,t.given_name',
'        ,t.surname',
'        ,t.date_of_expiry',
'		,t.sex',
'		,t.date_of_birth_partial.getFormatData(''DD/MM/YYYY'') as date_of_birth',
'        ,t.date_of_issue',
'        ,t.identity',
'  FROM dl_blacklist.travel_docs t ',
'  ',
'--WHERE t.identity = :P30_SELECTED_IDENTITY_ID;'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(48183852301104648)
,p_ajax_items_to_submit=>'P30_SELECTED_IDENTITY_ID'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48313631987575020)
,p_name=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_VALUE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48313775029575021)
,p_name=>'DOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Doc type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<span data-traveldoc-id="&KEY_VALUE.">&DOC_TYPE.</span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48313874186575022)
,p_name=>'ISSUING_COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISSUING_COUNTRY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Issuing country'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>12
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48313995342575023)
,p_name=>'DOC_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>80
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48314021694575024)
,p_name=>'DATE_OF_ISSUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_ISSUE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48314259410575026)
,p_name=>'DATE_OF_EXPIRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_EXPIRY'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Date of expiry'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
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
 p_id=>wwv_flow_api.id(48314993912575033)
,p_name=>'NATIONALITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NATIONALITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nationality'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>12
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48315087072575034)
,p_name=>'SEX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEX'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sex'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48315114096575035)
,p_name=>'DATE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_BIRTH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Date of birth'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48932344965296338)
,p_name=>'IDENTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDENTITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(48314432517575028)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(67106248951079832)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Image'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<img src="&IMAGE." style="max-width: 50px">'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111873675643557512)
,p_name=>'GIVEN_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GIVEN_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Given name'
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
 p_id=>wwv_flow_api.id(111873726052557513)
,p_name=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SURNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Surname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(48313535041575019)
,p_internal_uid=>48313535041575019
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
 p_id=>wwv_flow_api.id(48380405269045616)
,p_interactive_grid_id=>wwv_flow_api.id(48313535041575019)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(48380549115045617)
,p_report_id=>wwv_flow_api.id(48380405269045616)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48381019905045623)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(48313631987575020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48381484017045639)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(48313775029575021)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48381922691045647)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(48313874186575022)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48382428164045654)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(48313995342575023)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48382977490045662)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(48314021694575024)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48383968544045678)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(48314259410575026)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48429271119441313)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(48314993912575033)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>62
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48429719183441325)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(48315087072575034)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>58
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48430292376441333)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(48315114096575035)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50663691486620895)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(48932344965296338)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114622901431744840)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(111873675643557512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(114623428542744862)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(111873726052557513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(153414998449434711)
,p_view_id=>wwv_flow_api.id(48380549115045617)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(67106248951079832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53954684283589817)
,p_plug_name=>'Related Persons'
,p_parent_plug_id=>wwv_flow_api.id(48183701193104647)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(53953792976589808)
,p_plug_name=>'Related Persons List'
,p_region_name=>'RelatedPersonsList'
,p_parent_plug_id=>wwv_flow_api.id(53954684283589817)
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
'WHERE blacklist_case_id = :P30_CASE_ID;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P30_CASE_ID'
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
 p_id=>wwv_flow_api.id(53954700416589818)
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
,p_internal_uid=>53954700416589818
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(53954886294589819)
,p_db_column_name=>'KEY_VALUE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Key value'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(53954943120589820)
,p_db_column_name=>'BLACKLIST_CASE_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Blacklist case id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(53955036603589821)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'First name'
,p_column_html_expression=>'<span data-selected-related-person-id="#KEY_VALUE#">#FIRST_NAME#</span>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(53955121617589822)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Last name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(53955230409589823)
,p_db_column_name=>'MIDDLE_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Middle name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(53955315084589824)
,p_db_column_name=>'RELATIONSHIP'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Relationship'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(53955428735589825)
,p_db_column_name=>'NOTICE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Notice'
,p_column_html_expression=>'<div style="max-width:300px">#NOTICE#</div>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(66675820186013160)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'666759'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'KEY_VALUE:BLACKLIST_CASE_ID:FIRST_NAME:LAST_NAME:MIDDLE_NAME:RELATIONSHIP:NOTICE'
,p_flashback_enabled=>'N'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47769603596664239)
,p_plug_name=>'Warrant Data'
,p_region_name=>'WarrantData'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
,p_region_css_classes=>'warrant-data-region'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P30_CASE_TYPE'
,p_plug_display_when_cond2=>'CRIMINAL:OVERSTAY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47770257615664245)
,p_plug_name=>'Travel Permit'
,p_region_name=>'TravelPermit'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
,p_region_css_classes=>'travel-permit-region'
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
 p_id=>wwv_flow_api.id(51375102299666648)
,p_plug_name=>'Overstay'
,p_region_name=>'Overstay'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P30_CASE_TYPE'
,p_plug_display_when_cond2=>'OVERSTAY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56762202935779615)
,p_plug_name=>'Lost Passport Data'
,p_region_name=>'LostPassportData'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
,p_region_css_classes=>'lost-passport-region'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P30_CASE_TYPE'
,p_plug_display_when_cond2=>'LOST_PASSPORT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56762915364779622)
,p_plug_name=>'Issue Description'
,p_parent_plug_id=>wwv_flow_api.id(56762202935779615)
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
 p_id=>wwv_flow_api.id(56763036634779623)
,p_plug_name=>'New Passport Data'
,p_parent_plug_id=>wwv_flow_api.id(56762202935779615)
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
 p_id=>wwv_flow_api.id(95832355597545140)
,p_plug_name=>'Criminal Record'
,p_region_name=>'CriminalRecord'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P30_CASE_TYPE'
,p_plug_display_when_cond2=>'CRIMINAL'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95832406314545141)
,p_plug_name=>'CRD Info'
,p_parent_plug_id=>wwv_flow_api.id(95832355597545140)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(95832528285545142)
,p_plug_name=>'CRD Result XML Report'
,p_region_name=>'id-ir-crd-result-xml-report'
,p_parent_plug_id=>wwv_flow_api.id(95832355597545140)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    x.id_no',
'    , x.case_no || ''/'' || x.case_y  AS CASE_NO_AND_YEAR',
'    , x.happen_d',
'    , x.charge_d',
'    , x.charge',
'    , x.orgname',
'    , x.remark_crd',
'FROM ',
'    (',
'        SELECT XMLTYPE.createxml(crd_result_xml) AS XML ',
'        FROM dl_blacklist.identities',
'        WHERE key_value = :P30_SELECTED_IDENTITY_ID -- 845B5347E4F2C1C3E055020C290F94FD',
'    ) CRD_RESULT',
'    , XMLTABLE',
'            (',
'                ''/DATA/DATA''',
'                PASSING crd_result.xml',
'                COLUMNS ID_NO           VARCHAR2(4000) PATH ''ID_NO''',
'                        ,P_NAME         VARCHAR2(4000) PATH ''P_NAME''',
'                        ,BIRTH_D        VARCHAR2(4000) PATH ''BIRTH_D''',
'                        ,CARD_FNAME     VARCHAR2(4000) PATH ''CARD_FNAME''',
'                        ,CARD_LNAME     VARCHAR2(4000) PATH ''CARD_LNAME''',
'                        ,CASE_NO        VARCHAR2(1000) PATH ''CASE_NO''',
'                        ,CASE_Y         VARCHAR2(1000) PATH ''CASE_Y''',
'                        ,HAPPEN_D       VARCHAR2(4000) PATH ''HAPPEN_D''',
'                        ,CHARGE         VARCHAR2(4000) PATH ''CHARGE''',
'                        ,CHARGE_D       VARCHAR2(4000) PATH ''CHARGE_D''',
'                        ,ORGNAME        VARCHAR2(4000) PATH ''ORGNAME''',
'                        ,REMARK_CRD     VARCHAR2(4000) PATH ''REMARK_CRD''',
'            ) x'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P30_SELECTED_IDENTITY_ID'
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
 p_id=>wwv_flow_api.id(95832631916545143)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No Data Found. Please select an identity from the "Person Data" tab.'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>95832631916545143
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95832742621545144)
,p_db_column_name=>'ID_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'No'
,p_column_type=>'STRING'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95832826632545145)
,p_db_column_name=>'CASE_NO_AND_YEAR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Case no/Case year'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95832976827545146)
,p_db_column_name=>'HAPPEN_D'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Happen Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95833066824545147)
,p_db_column_name=>'CHARGE_D'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Charge Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95833169318545148)
,p_db_column_name=>'CHARGE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Charge'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95833258063545149)
,p_db_column_name=>'ORGNAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Organization Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(95833371248545150)
,p_db_column_name=>'REMARK_CRD'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(111188497473136492)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1111885'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'ID_NO:CASE_NO_AND_YEAR:HAPPEN_D:CHARGE_D:CHARGE:ORGNAME:REMARK_CRD'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(341681476577286502)
,p_plug_name=>'Case Information'
,p_parent_plug_id=>wwv_flow_api.id(47769575933664238)
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
 p_id=>wwv_flow_api.id(341681552294286503)
,p_plug_name=>'ICRS Exchange'
,p_parent_plug_id=>wwv_flow_api.id(341681476577286502)
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
 p_id=>wwv_flow_api.id(341681709340286505)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(341681552294286503)
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
' WHERE blacklist_case_id = :P30_CASE_ID ;'))
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
 p_id=>wwv_flow_api.id(341681883460286506)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'RSTOPP'
,p_internal_uid=>341681883460286506
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(341681941764286507)
,p_db_column_name=>'INS_BY'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Ins by'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(341682013234286508)
,p_db_column_name=>'INS_AT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Ins at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(341682142481286509)
,p_db_column_name=>'DML_BY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Dml by'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(341682202300286510)
,p_db_column_name=>'DML_AT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Dml at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(341682335836286511)
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
 p_id=>wwv_flow_api.id(341682440869286512)
,p_db_column_name=>'SERVICE_SEND'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Service send'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(341682584982286513)
,p_db_column_name=>'SERVICE_RECEIVE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Service receive'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(341682629826286514)
,p_db_column_name=>'SERVICE_RESULT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Service result'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(341682720589286515)
,p_db_column_name=>'STATUS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Status'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(342312546129522462)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3423126'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'INS_BY:INS_AT:DML_BY:DML_AT:SERVICE_RESPONSE:SERVICE_SEND:SERVICE_RECEIVE:SERVICE_RESULT:STATUS'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(341681692356286504)
,p_name=>'User Changes'
,p_parent_plug_id=>wwv_flow_api.id(341681476577286502)
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
'    :P30_CASE_ID',
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
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363520794685824)
,p_query_column_id=>1
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Column name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363664323685825)
,p_query_column_id=>2
,p_column_alias=>'PREVIOUS_VALUE'
,p_column_display_sequence=>2
,p_column_heading=>'Previous value'
,p_use_as_row_header=>'N'
,p_report_column_width=>270
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363731845685826)
,p_query_column_id=>3
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>3
,p_column_heading=>'New value'
,p_use_as_row_header=>'N'
,p_report_column_width=>270
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363823170685827)
,p_query_column_id=>4
,p_column_alias=>'CHANGED_AT'
,p_column_display_sequence=>4
,p_column_heading=>'Changed at'
,p_use_as_row_header=>'N'
,p_column_format=>'dd/mm/yyyy HH24:MI'
,p_report_column_width=>120
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363915997685828)
,p_query_column_id=>5
,p_column_alias=>'CHANGED_BY'
,p_column_display_sequence=>5
,p_column_heading=>'Changed by'
,p_use_as_row_header=>'N'
,p_report_column_width=>260
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5195255187864020)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(47770136071664244)
,p_button_name=>'ReactivateCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reactivate this Case'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P30_IS_ACTIVE'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column_span=>4
,p_grid_column=>8
,p_security_scheme=>wwv_flow_api.id(27945944904365682)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111341218712156006)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(95832406314545141)
,p_button_name=>'UpdateCriminalRecord'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update Criminal Record'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23326135696712920)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(22721268317176838)
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
 p_id=>wwv_flow_api.id(89411585998940379)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(21605138370345534)
,p_button_name=>'Capture'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_image_alt=>'Live Capture'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP:P6_CASE_ID:&P30_CASE_ID.'
,p_button_css_classes=>'capture-button'
,p_icon_css_classes=>'fa fa-camera'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48314559333575029)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(48313377646575017)
,p_button_name=>'AddTraveldoc'
,p_button_static_id=>'AddTraveldoc'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Traveldoc'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48314694905575030)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(48313204909575016)
,p_button_name=>'AddAddress'
,p_button_static_id=>'AddAddress'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Address'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(51370685386666603)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(48313115224575015)
,p_button_name=>'AddIdentity'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Identity'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.:RP,60:P60_CASE_ID,P60_IDENTITY_ID:&P30_CASE_ID.,&P30_SELECTED_IDENTITY_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(53957141016589842)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(53954684283589817)
,p_button_name=>'AddRelatedPerson'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(67567449828613622)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(34123380435166601)
,p_button_name=>'ExportCasedata'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Export Casedata as ZIP File'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3133000688378717)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3134455690378731)
,p_button_name=>'NistExport'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Export as NIST File'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23326088089712919)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(22721268317176838)
,p_button_name=>'UPDATE'
,p_button_static_id=>'UpdateButton'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(56761307645779606)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(22721268317176838)
,p_button_name=>'Delete'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Delete Case'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P30_IS_ACTIVE'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_button_css_classes=>'deletebutton '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5194270320864010)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5194096086864008)
,p_button_name=>'DeleteWithReason'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete Case'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5194342247864011)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5194096086864008)
,p_button_name=>'CancelDialog'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(56761640492779609)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3134750629378734)
,p_name=>'P30_EXPORTFINGER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_prompt=>'Export Fingerprints'
,p_source=>'YES'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:YES;YES'
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3134823477378735)
,p_name=>'P30_NIST_DEMOGRAPHICS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3134939869378736)
,p_name=>'P30_EXPORTFACE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_prompt=>'Export Face'
,p_source=>'YES'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:YES;YES'
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3135238964378739)
,p_name=>'P30_NIST_LASTNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_prompt=>'Lastname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3135347528378740)
,p_name=>'P30_NIST_MIDDLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_prompt=>'Middle Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3135478325378741)
,p_name=>'P30_NIST_FIRSTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5193949798864007)
,p_name=>'P30_CLOSING_REASON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reason for Closing'
,p_source=>'CLOSING_REASON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1998
,p_cHeight=>5
,p_tag_css_classes=>'closing-reason'
,p_grid_label_column_span=>3
,p_display_when=>'P30_CLOSING_REASON_2'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-bottom-md'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5194106274864009)
,p_name=>'P30_CLOSING_REASON_2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5194096086864008)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Closing Reason'
,p_source=>'CLOSING_REASON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1998
,p_cHeight=>15
,p_grid_label_column_span=>3
,p_display_when=>'P30_CLOSING_REASON'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16976079611958715)
,p_name=>'P30_TRANSACTIONTYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_prompt=>'Type of Transaction'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'STATIC:IRQ - Image Request;IRQ,',
'IMR - Image Response;IMR,',
'CPS - Criminal Print-to-Print Search;CPS,',
'NPS - Non-Criminal Print-to-Print Search;NPS,',
'MPS - Latent-to-Print Search;MPS,',
'PMS - Print-to-Latent Search;PMS,',
'MMS - Latent-to-Latent Search;MMS,',
'DBS - Database Search;DBS,',
'SRE - Search Results;SRE,',
'USA - Add Latent to Unidentified Latents Collection;USA,',
'USR - Remove Latent from Unidentified Latents Collection;USR,',
'ATP - Add To Print Collection;ATP,',
'SUP - Substitute Print(s) Into Existing Print-Collection;SUP,',
'DFP - Delete From Print-Collection;DFP,',
'DIP - Disregard Individual Print(s) Update;DIP,',
'CPR - Criminal Subject Photo Request;CPR,',
'PHR - Photo Response;PHR,',
'APC - Add To Print Collection;APC,',
'DPC - Delete From Photo Collection;DPC,',
'CPP - Criminal Photo-to-Photo Search;CPP,',
'NPP - Non-Criminal Photo-to-Photo Search;NPP,',
'UPR - Update Request;UPR,',
'ERR - Error Message;ERR'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21605325423345536)
,p_name=>'P30_PHOTO_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21605138370345534)
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
 p_id=>wwv_flow_api.id(21605435408345537)
,p_name=>'P30_FP_RT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21605513831345538)
,p_name=>'P30_FP_RI'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21605669477345539)
,p_name=>'P30_FP_RM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21605724379345540)
,p_name=>'P30_FP_RR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21605821498345541)
,p_name=>'P30_FP_RL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21605940539345542)
,p_name=>'P30_FP_LT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21606070036345543)
,p_name=>'P30_FP_LI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21606116638345544)
,p_name=>'P30_FP_LM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21606271011345545)
,p_name=>'P30_FP_LR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21606388761345546)
,p_name=>'P30_FP_LL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(21605245496345535)
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
,p_attribute_09=>'Y'
,p_attribute_10=>'Y'
,p_attribute_11=>'N'
,p_attribute_12=>'Header Left and Right'
,p_attribute_13=>'Y'
,p_attribute_14=>'500'
,p_attribute_15=>'600'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22721411503176840)
,p_name=>'P30_AUTHORITY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47769925801664242)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Authority'
,p_source=>'AUTHORITY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22721596629176841)
,p_name=>'P30_BEHAVIOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Behavior'
,p_source=>'BEHAVIOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22721675299176842)
,p_name=>'P30_CASE_NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Case number'
,p_source=>'CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-bottom-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22721732534176843)
,p_name=>'P30_CONTACT_TELEPHONE_NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(47769925801664242)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contact telephone number'
,p_source=>'CONTACT_TELEPHONE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>20
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22722037128176846)
,p_name=>'P30_FACE_SHAPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Face shape'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22722409182176850)
,p_name=>'P30_BODY_SHAPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body shape'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23324274373712901)
,p_name=>'P30_MIDDLE_NAME_THAI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Middle name thai'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23324630748712905)
,p_name=>'P30_HAIR_COLOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hair color'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23324736757712906)
,p_name=>'P30_HAIR_CHARACTERISTIC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hair characteristic'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23324807530712907)
,p_name=>'P30_BODY_HEIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body height'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23324945046712908)
,p_name=>'P30_BODY_WEIGHT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body weight'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23325015879712909)
,p_name=>'P30_REASON'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reason'
,p_source=>'REASON'
,p_source_type=>'DB_COLUMN'
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23325710845712916)
,p_name=>'P30_GIVEN_NAME_THAI'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Givenname Thai'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23325805505712917)
,p_name=>'P30_SURNAME_THAI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname thai'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33105616554209013)
,p_name=>'P30_PHOTO_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(21605138370345534)
,p_prompt=>'Photo 2'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_css_classes=>'upload-photo'
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
 p_id=>wwv_flow_api.id(33105980824209016)
,p_name=>'P30_CASE_NOTICE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Case notice '
,p_source=>'NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34123463819166602)
,p_name=>'P30_EXPORT_ZIP_FINGERPRINTS_AS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(34123380435166601)
,p_item_default=>'png'
,p_prompt=>'Export ZIP fingerprints as'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:WSQ;wsq,BMP;bmp,JPEG2000;jpeg2000,PNG;png,TIFF;tiff'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34123665162166604)
,p_name=>'P30_EXPORT_ZIP_FACEPHOTOS_AS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(34123380435166601)
,p_item_default=>'png'
,p_prompt=>'Export ZIP facephotos as'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:BMP;bmp,JPEG2000;jpeg2000,PNG;png,TIFF;tiff'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42844130190172108)
,p_name=>'P30_SURNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42844263792172109)
,p_name=>'P30_MIDDLE_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Middle Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42844386411172110)
,p_name=>'P30_GIVEN_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Given Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42844852312172115)
,p_name=>'P30_PLACE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of Birth'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42844965156172116)
,p_name=>'P30_DATE_OF_BIRTH_DISPLAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date of Birth'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42846014594172127)
,p_name=>'P30_VISA_DAYS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Calculate by Period of Permitted Days'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>4
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_css_classes=>'permitted-days'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43039063272882702)
,p_name=>'P30_CASE_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(23327058949712929)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767118791664214)
,p_name=>'P30_EYE_COLOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Eye Color'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767208937664215)
,p_name=>'P30_SKIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Skin'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767310156664216)
,p_name=>'P30_DOMINANT_CHARACTERISTIC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Dominant characteristic'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767478535664217)
,p_name=>'P30_SPECIAL_CHARACTERISTIC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(42844740260172114)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Special characteristic'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767588490664218)
,p_name=>'P30_PROFESSION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profession'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767691266664219)
,p_name=>'P30_CONTACT_OWNER_DATA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(47769925801664242)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contact Owner Data'
,p_source=>'CONTACT_OWNER_DATA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767752295664220)
,p_name=>'P30_OWNER_DATA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(47769925801664242)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner data'
,p_source=>'OWNER_DATA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767888875664221)
,p_name=>'P30_CONTACT_INFORMATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Contact information'
,p_source=>'CONTACT_INFORMATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47767920128664222)
,p_name=>'P30_OTHER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(47769925801664242)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Other'
,p_source=>'OTHER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768005170664223)
,p_name=>'P30_OTHER_DESCRIPTION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(47769925801664242)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Other Description'
,p_source=>'OTHER_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768108761664224)
,p_name=>'P30_REFERENCE_DOCUMENT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reference document'
,p_source=>'REFERENCE_DOCUMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768277136664225)
,p_name=>'P30_URGENT_CONTACT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47769925801664242)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Urgent contact'
,p_source=>'URGENT_CONTACT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768359007664226)
,p_name=>'P30_SECRET_LEVEL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Secret level'
,p_source=>'SECRET_LEVEL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SECRET_LEVELS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'       KEY_VALUE',
'  from dl_common.secret_levels$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
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
 p_id=>wwv_flow_api.id(47768436070664227)
,p_name=>'P30_WARRANT_ARRESTED_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Warrant arrested type'
,p_source=>'WARRANT_ARRESTED_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ARRESTED_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.arrested_types$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768537534664228)
,p_name=>'P30_TARGET_CODE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Target code'
,p_source=>'TARGET_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768660385664229)
,p_name=>'P30_ARRESTED_WARRANT_NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested warrant number'
,p_source=>'ARRESTED_WARRANT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>20
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768716239664230)
,p_name=>'P30_DECIDED_CASE_NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Decided case number'
,p_source=>'DECIDED_CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768897315664231)
,p_name=>'P30_CRIMINAL_CASE_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Criminal case number'
,p_source=>'CRIMINAL_CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47768936998664232)
,p_name=>'P30_ASSOCIATED_BEHAVIOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(47769925801664242)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Associated behavior'
,p_source=>'ASSOCIATED_BEHAVIOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47769075533664233)
,p_name=>'P30_ARRESTED_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested Status'
,p_source=>'ARRESTED_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ARRESTED_STATUSES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.arrested_statuses$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47769166354664234)
,p_name=>'P30_ARRESTED_DESCRIPTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested Description'
,p_source=>'ARRESTED_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47769286545664235)
,p_name=>'P30_RELATED_DOCUMENT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Related document'
,p_source=>'RELATED_DOCUMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47769303962664236)
,p_name=>'P30_ACTION_CODE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Action code'
,p_source=>'ACTION_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ACTION_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.action_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
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
 p_id=>wwv_flow_api.id(47769417177664237)
,p_name=>'P30_ARRESTED_WARRANT_YEAR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested warrant year'
,p_source=>'ARRESTED_WARRANT_YEAR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47769717239664240)
,p_name=>'P30_ARRESTED_WARRANT_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_item_default=>'to_char(sysdate, ''dd/mm/yyyy'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Arrested warrant date'
,p_source=>'ARRESTED_WARRANT_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47769881864664241)
,p_name=>'P30_ARRESTED_WARRANT_EXPIRY_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrested warrant expiry date'
,p_source=>'ARRESTED_WARRANT_EXPIRY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47770328101664246)
,p_name=>'P30_TRAVEL_PERMIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47770257615664245)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel Permit?'
,p_source=>'TRAVEL_PERMIT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47770418909664247)
,p_name=>'P30_TRAVEL_PERMIT_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(47770257615664245)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel permit from'
,p_source=>'TRAVEL_PERMIT_FROM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47770552635664248)
,p_name=>'P30_TRAVEL_PERMIT_TO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47770257615664245)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel permit to'
,p_source=>'TRAVEL_PERMIT_TO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47770674908664249)
,p_name=>'P30_TRAVEL_PERMIT_NOTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(47770257615664245)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice'
,p_source=>'TRAVEL_PERMIT_NOTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47770793623664250)
,p_name=>'P30_TRAVEL_PERMIT_DATE_INSERT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(47770257615664245)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel permit date inserted'
,p_source=>'TRAVEL_PERMIT_DATE_INSERT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48179189088104601)
,p_name=>'P30_TRAVEL_PERMIT_DATE_DELETE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(47770257615664245)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel permit date deleted'
,p_source=>'TRAVEL_PERMIT_DATE_DELETE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48314372551575027)
,p_name=>'P30_SELECTED_IDENTITY_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(48313115224575015)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48316184165575045)
,p_name=>'P30_TRAVELDOC_REDIRECT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(48313377646575017)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48316652768575050)
,p_name=>'P30_SELECTED_TRAVELDOC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(48313377646575017)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48931915479296334)
,p_name=>'P30_SELECTED_ADDRESS_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(48313204909575016)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49984671190599009)
,p_name=>'P30_ADDRESS_REDIRECT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(48313204909575016)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49984739630599010)
,p_name=>'P30_HOST'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23327058949712929)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51373620244666633)
,p_name=>'P30_IDENTITY_REDIRECT_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(48313115224575015)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51374538098666642)
,p_name=>'P30_NOTICE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(42844613558172113)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51375292912666649)
,p_name=>'P30_OVERSTAY_CREATED_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created Date'
,p_source=>'OSTAY_CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51375394660666650)
,p_name=>'P30_OSTAY_NO_DAYS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Overstay number of days'
,p_source=>'OSTAY_NO_DAYS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>6
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_css_classes=>'overstay-days'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52723477024484201)
,p_name=>'P30_OSTAY_BLOCK_PERIOD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Blocking period'
,p_source=>'OSTAY_BLOCK_PERIOD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''1 Years'', 1 FROM DUAL UNION ALL',
'SELECT ''3 Years'', 3 FROM DUAL UNION ALL',
'SELECT ''5 Years'', 5 FROM DUAL UNION ALL',
'SELECT ''10 Years'', 10 FROM DUAL',
'ORDER BY 2',
'',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52723523268484202)
,p_name=>'P30_OVERSTAY_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'OSTAY_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52723600031484203)
,p_name=>'P30_OSTAY_NOTICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Remark'
,p_source=>'OSTAY_NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52723766829484204)
,p_name=>'P30_OSTAY_SELF_INDICTMENT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surrender oneself/ Arrest'
,p_source=>'OSTAY_SELF_INDICTMENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53953273284589803)
,p_name=>'P30_SEX'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_prompt=>'Sex'
,p_source=>'P30_SEX'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Female;F,Male;M,Not Certain;U'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53953397138589804)
,p_name=>'P30_DATE_OF_BIRTH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(3134455690378731)
,p_prompt=>'Date of birth'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53957614858589847)
,p_name=>'P30_RELATEDPERSON_REDIRECT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53954684283589817)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56760851591779601)
,p_name=>'P30_CASE_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47770136071664244)
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
 p_id=>wwv_flow_api.id(56761288384779605)
,p_name=>'P30_IS_ACTIVE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(23327058949712929)
,p_use_cache_before_default=>'NO'
,p_source=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56761910630779612)
,p_name=>'P30_ABIS_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23327058949712929)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56762309604779616)
,p_name=>'P30_LOST_PP_LOST_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(56762915364779622)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Lost Passport Date'
,p_source=>'LOST_PP_LOST_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56762727762779620)
,p_name=>'P30_UNDECIDED_CASE_NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(47769603596664239)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Undecided case number'
,p_source=>'UNDECIDED_CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56763178721779624)
,p_name=>'P30_PASSPORT_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(56763036634779623)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Passport Type'
,p_source=>'LOST_PP_NEW_PP_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56763287643779625)
,p_name=>'P30_PASSPORT_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(56763036634779623)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Passport number'
,p_source=>'LOST_PP_NEW_PP_NUMBER'
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
 p_id=>wwv_flow_api.id(56763372307779626)
,p_name=>'P30_NEW_PASSPORT_ISSUE_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(56763036634779623)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Issue Date'
,p_source=>'LOST_PP_NEW_PP_ISSUE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56763471670779627)
,p_name=>'P30_NEW_PASSPORT_PLACE_OF_ISSUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(56763036634779623)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of issue'
,p_source=>'LOST_PP_NEW_PP_PLACE_OF_ISSUE'
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
 p_id=>wwv_flow_api.id(56763551915779628)
,p_name=>'P30_PASSPORT_EXPIRE_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(56763036634779623)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Passport expire date'
,p_source=>'LOST_PP_NEW_PP_EXPIRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67103371477079803)
,p_name=>'P30_SELECTED_RELATED_PERSON_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53954684283589817)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67107389097079843)
,p_name=>'P30_RELOAD_TO_TAB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23327058949712929)
,p_source=>'P30_RELOAD_TO_TAB'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67107958000079849)
,p_name=>'P30_PHOTO_3'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(21605138370345534)
,p_prompt=>'Photo 3'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_api.id(67108012465079850)
,p_name=>'P30_PHOTO_4'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(21605138370345534)
,p_prompt=>'Photo 4'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_api.id(67565392715613601)
,p_name=>'P30_OSTAY_ARRIVAL_DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrival Date'
,p_source=>'OSTAY_ARRIVAL_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67565468920613602)
,p_name=>'P30_OSTAY_DEPARTURE_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Departure'
,p_source=>'OSTAY_DEPARTURE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67565595820613603)
,p_name=>'P30_OSTAY_TM6'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(51375102299666648)
,p_use_cache_before_default=>'NO'
,p_prompt=>'TM 6'
,p_source=>'OSTAY_TM6'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67565681766613604)
,p_name=>'P30_LOST_PP_LAST_PLACE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(56762915364779622)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Place'
,p_source=>'LOST_PP_LAST_PLACE'
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
 p_id=>wwv_flow_api.id(67565756908613605)
,p_name=>'P30_LOST_PP_NOTIFY_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(56762915364779622)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notify Date'
,p_source=>'LOST_PP_NOTIFY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67565873137613606)
,p_name=>'P30_LOST_PP_NOTIFY_PLACE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(56762915364779622)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notify Place'
,p_source=>'LOST_PP_NOTIFY_PLACE'
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
 p_id=>wwv_flow_api.id(67565912950613607)
,p_name=>'P30_LOST_PP_VISA_ON_ARRIV'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(56762915364779622)
,p_use_cache_before_default=>'NO'
,p_prompt=>'VISA on Arrival'
,p_source=>'LOST_PP_VISA_ON_ARRIV'
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
 p_id=>wwv_flow_api.id(67566021066613608)
,p_name=>'P30_LOST_PP_VISA_EXP_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(56762915364779622)
,p_use_cache_before_default=>'NO'
,p_prompt=>'VISA Expiry Date'
,p_source=>'LOST_PP_VISA_EXP_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67566197489613609)
,p_name=>'P30_LOST_PP_NOTICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(56762915364779622)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice'
,p_source=>'LOST_PP_NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67568837010613636)
,p_name=>'P30_BIOMETRIC_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21605056163345533)
,p_source=>'P30_BIOMETRIC_JSON'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89399807758832205)
,p_name=>'P30_GOTO_TAB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(23327058949712929)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89402164336832228)
,p_name=>'P30_LIVE_IMAGE_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21605056163345533)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111340759699156001)
,p_name=>'P30_CRD_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95832406314545141)
,p_prompt=>'Name :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111340840250156002)
,p_name=>'P30_CRD_SURNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95832406314545141)
,p_prompt=>'Surname :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111340909563156003)
,p_name=>'P30_CRD_RESULT_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95832406314545141)
,p_prompt=>'Result :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111341027364156004)
,p_name=>'P30_CRD_FLAG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(95832406314545141)
,p_prompt=>'Result Status :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111341101776156005)
,p_name=>'P30_CRD_UPDATED_DATETIME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(95832406314545141)
,p_prompt=>'Update Time :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171898318582228207)
,p_name=>'P30_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21605138370345534)
,p_prompt=>'Select the display image used in search results'
,p_source=>'null;'
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:This is the display image;1,This is the display image;2,This is the display image;3,This is the display image;3'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(15276179772705291)
,p_item_css_classes=>'display-image-container'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'12'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23326294447712921)
,p_name=>'CloseDialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23326135696712920)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23326361764712922)
,p_event_id=>wwv_flow_api.id(23326294447712921)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23326408834712923)
,p_name=>'SetFieldsFromScanPage'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23326583998712924)
,p_event_id=>wwv_flow_api.id(23326408834712923)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P30_CASE_ID'').getValue() != ''''){',
'    return;',
'}',
'',
'var $topDatepicker = top.$( ".datepicker").first();',
'$( ".datepicker" ).datepicker( "option", "dateFormat", $topDatepicker.datepicker( "option", "dateFormat") );',
'var classes = $topDatepicker.siblings(''button'').attr(''class'');',
'$( ".datepicker" ).siblings(''button'').addClass(classes);',
'var fields = top.regionToJson(''.demographic-data, .case-details'', true);',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35296452608869550)
,p_name=>'getCaseDeatilsFromWS'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43038949717882701)
,p_event_id=>wwv_flow_api.id(35296452608869550)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var blacklistID = apex.item(''P30_CASE_ID'').getValue();',
'if(!blacklistID) return;',
'//getCaseDetailsFromWS(blacklistID);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48314788930575031)
,p_name=>'SelectIdentity'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'*[data-selected-identity-id], tbody .a-GV-row td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#IdentitiesGrid'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48933524382296350)
,p_event_id=>wwv_flow_api.id(48314788930575031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).parent().find(''[data-selected-identity-id]'');',
'var identityID = $(this.triggeringElement).attr(''data-selected-identity-id'') || rowSpan.attr(''data-selected-identity-id'');',
'apex.item(''P30_SELECTED_IDENTITY_ID'').setValue(identityID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48315948536575043)
,p_name=>'GetTravelDocRedirectURL'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48314559333575029)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51370472288666601)
,p_event_id=>wwv_flow_api.id(48315948536575043)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var identityID = $(''#IdentitiesGrid .a-GV-row.is-selected'').find(''[data-selected-identity-id]'').attr(''data-selected-identity-id'');',
'apex.item(''P30_SELECTED_IDENTITY_ID'').setValue(identityID);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48316066354575044)
,p_event_id=>wwv_flow_api.id(48315948536575043)
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
'        p_url => ''f?p='' || l_app || '':50:''||l_session||''::NO:50:P50_IDENTITY_ID,P50_CASE_ID:'' || :P30_SELECTED_IDENTITY_ID || '','' || :P30_CASE_ID,',
'        p_checksum_type => ''SESSION''',
'    );',
'    :P30_TRAVELDOC_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P30_SELECTED_IDENTITY_ID,P30_CASE_ID'
,p_attribute_03=>'P30_TRAVELDOC_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48316215932575046)
,p_event_id=>wwv_flow_api.id(48315948536575043)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'console.log(apex.item("P30_TRAVELDOC_REDIRECT_URL").getValue());',
'apex.navigation.redirect(apex.item("P30_TRAVELDOC_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(53957268082589843)
,p_name=>'GetRelatedPersonRedirectURL'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(53957141016589842)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53957499842589845)
,p_event_id=>wwv_flow_api.id(53957268082589843)
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
'        p_url => ''f?p='' || l_app || '':65:''||l_session||''::NO:65:P65_CASE_ID:'' || :P30_CASE_ID,',
'        p_checksum_type => ''SESSION''',
'    );',
'    :P30_RELATEDPERSON_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P30_CASE_ID'
,p_attribute_03=>'P30_RELATEDPERSON_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53957575995589846)
,p_event_id=>wwv_flow_api.id(53957268082589843)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'console.log(apex.item("P30_RELATEDPERSON_REDIRECT_URL").getValue());',
'apex.navigation.redirect(apex.item("P30_RELATEDPERSON_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(49984370874599006)
,p_name=>'GetAddressRedirectURL'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48314694905575030)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51370555557666602)
,p_event_id=>wwv_flow_api.id(49984370874599006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var identityID = $(''#IdentitiesGrid .a-GV-row.is-selected'').find(''[data-selected-identity-id]'').attr(''data-selected-identity-id'');',
'apex.item(''P30_SELECTED_IDENTITY_ID'').setValue(identityID);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49984441715599007)
,p_event_id=>wwv_flow_api.id(49984370874599006)
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
'        p_url => ''f?p='' || l_app || '':40:''||l_session||''::YES:40:P40_IDENTITY_ID:'' || :P30_SELECTED_IDENTITY_ID,',
'        p_checksum_type => ''SESSION''',
'    );',
'    :P30_ADDRESS_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P30_SELECTED_IDENTITY_ID'
,p_attribute_03=>'P30_ADDRESS_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(49984583947599008)
,p_event_id=>wwv_flow_api.id(49984370874599006)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P30_ADDRESS_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48928690427296301)
,p_name=>'ChangedNewTravelDoc'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_SELECTED_TRAVELDOC_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48928799270296302)
,p_event_id=>wwv_flow_api.id(48928690427296301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region(''TravelDocs'').refresh();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48931768162296332)
,p_name=>'OpenAddress'
,p_event_sequence=>100
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-address-id], tbody .a-GV-row td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#Addresses'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48931883554296333)
,p_event_id=>wwv_flow_api.id(48931768162296332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).parent().find(''span[data-address-id]'');',
'var addressID = $(this.triggeringElement).attr(''data-address-id'') || rowSpan.attr(''data-address-id'');',
'console.log(addressID);',
'apex.item(''P30_SELECTED_ADDRESS_ID'').setValue(addressID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48932003661296335)
,p_event_id=>wwv_flow_api.id(48931768162296332)
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
'        p_url => ''f?p='' || l_app || '':40:''||l_session||''::NO::P40_ADDRESS_ID:'' || :P30_SELECTED_ADDRESS_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P30_ADDRESS_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P30_SELECTED_ADDRESS_ID'
,p_attribute_03=>'P30_ADDRESS_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48932111685296336)
,p_event_id=>wwv_flow_api.id(48931768162296332)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P30_ADDRESS_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48932924343296344)
,p_name=>'OpenTravelDoc'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-traveldoc-id], tbody .a-GV-row td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#TravelDocs'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48933012392296345)
,p_event_id=>wwv_flow_api.id(48932924343296344)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).parent().find(''span[data-traveldoc-id]'');',
'var traveldocID = $(this.triggeringElement).attr(''data-traveldoc-id'') || rowSpan.attr(''data-traveldoc-id'');',
'console.log(traveldocID);',
'apex.item(''P30_SELECTED_TRAVELDOC_ID'').setValue(traveldocID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48933144224296346)
,p_event_id=>wwv_flow_api.id(48932924343296344)
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
'        p_url => ''f?p='' || l_app || '':50:''||l_session||''::NO:50:P50_TRAVELDOC_ID,P50_CASE_ID:'' || :P30_SELECTED_TRAVELDOC_ID || '','' || :P30_CASE_ID, ',
'        p_checksum_type => ''SESSION'');',
'    :P30_TRAVELDOC_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P30_SELECTED_TRAVELDOC_ID,P30_CASE_ID'
,p_attribute_03=>'P30_TRAVELDOC_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48933275593296347)
,p_event_id=>wwv_flow_api.id(48932924343296344)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P30_TRAVELDOC_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51373133862666628)
,p_name=>'GetIdentityRedirectURL'
,p_event_sequence=>120
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.a-GV-row.is-selected td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#IdentitiesGrid'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51373376446666630)
,p_event_id=>wwv_flow_api.id(51373133862666628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var identityID = $(''#IdentitiesGrid .a-GV-row.is-selected'').find(''[data-selected-identity-id]'').attr(''data-selected-identity-id'');',
'console.log(identityID);',
'apex.item(''P30_SELECTED_IDENTITY_ID'').setValue(identityID);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51373466658666631)
,p_event_id=>wwv_flow_api.id(51373133862666628)
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
'        p_url => ''f?p='' || l_app || '':60:''||l_session||''::NO:60:P60_IDENTITY_ID,P60_CASE_ID:'' || :P30_SELECTED_IDENTITY_ID || '','' || :P30_CASE_ID,',
'        p_checksum_type => ''SESSION''',
'    );',
'    :P30_IDENTITY_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P30_SELECTED_IDENTITY_ID,P30_CASE_ID'
,p_attribute_03=>'P30_IDENTITY_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51373574724666632)
,p_event_id=>wwv_flow_api.id(51373133862666628)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P30_IDENTITY_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(53957760290589848)
,p_name=>'OpenRelatedPerson'
,p_event_sequence=>130
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.a-IRR-table td.u-tL'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#RelatedPersonsList'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53957855180589849)
,p_event_id=>wwv_flow_api.id(53957760290589848)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var identityID = $(this.browserEvent.target).closest(''tr'').find(''[data-selected-related-person-id]'').attr(''data-selected-related-person-id'');',
'console.log(identityID);',
'apex.item(''P30_SELECTED_RELATED_PERSON_ID'').setValue(identityID);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(53957905400589850)
,p_event_id=>wwv_flow_api.id(53957760290589848)
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
'        p_url => ''f?p='' || l_app || '':65:''||l_session||''::NO:65:P65_RELATED_PERSON_ID,P60_CASE_ID:'' || :P30_SELECTED_RELATED_PERSON_ID || '','' || :P30_CASE_ID,',
'        p_checksum_type => ''SESSION''',
'    );',
'    :P30_RELATEDPERSON_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P30_CASE_ID,P30_SELECTED_RELATED_PERSON_ID'
,p_attribute_03=>'P30_RELATEDPERSON_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67103161981079801)
,p_event_id=>wwv_flow_api.id(53957760290589848)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh = window;',
'apex.navigation.redirect(apex.item("P30_RELATEDPERSON_REDIRECT_URL").getValue() );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51374276299666639)
,p_name=>'LoadIdentityData'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(48183852301104648)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51374372299666640)
,p_event_id=>wwv_flow_api.id(51374276299666639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var identityID = $(''#IdentitiesGrid .a-GV-row.is-selected'').find(''[data-selected-identity-id]'').attr(''data-selected-identity-id'');',
'apex.item(''P30_SELECTED_IDENTITY_ID'').setValue(identityID);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51374442832666641)
,p_event_id=>wwv_flow_api.id(51374276299666639)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'SELECT ',
'    notice',
'    ,profession',
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
'    ,surname',
'    ,middle_name',
'    ,given_name',
'    ,coalesce(date_of_birth_i,date_of_birth_td) AS date_of_birth',
'    ,sex',
'    ,place_of_birth',
'    ,coalesce(date_of_birth_i,date_of_birth_td) AS date_of_birth',
'INTO ',
'    :P30_NOTICE',
'    ,:P30_PROFESSION',
'    ,:P30_PHONE_NUMBER_0',
'    ,:P30_PHONE_NUMBER_1',
'    ,:P30_PHONE_NUMBER_2',
'    ,:P30_BODY_HEIGHT',
'    ,:P30_BODY_WEIGHT',
'    ,:P30_BODY_SHAPE',
'    ,:P30_HAIR_COLOR',
'    ,:P30_HAIR_CHARACTERISTIC',
'    ,:P30_FACE_SHAPE',
'    ,:P30_EYE_COLOR',
'    ,:P30_SKIN',
'    ,:P30_DOMINANT_CHARACTERISTIC',
'    ,:P30_SPECIAL_CHARACTERISTIC ',
'    ,:P30_SURNAME_THAI',
'    ,:P30_GIVEN_NAME_THAI',
'    ,:P30_MIDDLE_NAME_THAI',
'    ,:P30_NIST_LASTNAME',
'    ,:P30_NIST_MIDDLE_NAME',
'    ,:P30_NIST_FIRSTNAME',
'    ,:P30_SURNAME',
'    ,:P30_MIDDLE_NAME',
'    ,:P30_GIVEN_NAME',
'    ,:P30_DATE_OF_BIRTH',
'    ,:P30_SEX',
'    ,:P30_PLACE_OF_BIRTH',
'    ,:P30_DATE_OF_BIRTH_DISPLAY',
'--FROM IDENTITIES WHERE key_value = :P30_SELECTED_IDENTITY_ID;',
'FROM',
'    (',
'        SELECT',
'            i.key_value,',
'            i.notice,',
'            (',
'                SELECT',
'                    display_value',
'                FROM',
'                    dl_common.professions$lc',
'                WHERE',
'                    key_value = i.profession',
'            ) AS profession,',
'            i.phone_number_0,',
'            i.phone_number_1,',
'            i.phone_number_2,',
'            i.body_height,',
'            i.body_weight,',
'            i.body_shape,',
'            i.hair_color,',
'            i.hair_characteristic,',
'            i.face_shape,',
'            i.eye_color,',
'            i.skin,',
'            i.dominant_characteristic,',
'            i.special_characteristic,',
'            i.surname_thai,',
'            i.middlename_thai,',
'            i.givenname_thai,',
'            i.surname,',
'            i.middle_name,',
'            i.given_name,',
'            i.sex,',
'            i.date_of_birth_partial.getFormatData(''YYYY-MM-DD'') AS date_of_birth_i,',
'            td.date_of_birth_partial.getFormatData(''YYYY-MM-DD'') AS date_of_birth_td,',
'            i.place_of_birth,',
'            td.dml_at AS dml_at_td,',
'            ROW_NUMBER() OVER(',
'                PARTITION BY i.key_value',
'                ORDER BY',
'                    td.dml_at DESC',
'            ) AS rn',
'        FROM',
'            dl_blacklist.identities i',
'            LEFT JOIN dl_blacklist.travel_docs td ON td.identity = i.key_value',
'                                                     AND td.date_of_birth IS NOT NULL',
'         WHERE i.key_value = :P30_SELECTED_IDENTITY_ID',
'    )',
'WHERE',
'    rn = 1;',
'EXCEPTION WHEN NO_DATA_FOUND THEN ',
'NULL;',
'end;'))
,p_attribute_02=>'P30_SELECTED_IDENTITY_ID'
,p_attribute_03=>'P30_NOTICE,P30_PROFESSION,P30_PHONE_NUMBER_0,P30_PHONE_NUMBER_1,P30_PHONE_NUMBER_2,P30_BODY_HEIGHT,P30_BODY_WEIGHT,P30_BODY_SHAPE,P30_HAIR_COLOR,P30_HAIR_CHARACTERISTIC,P30_FACE_SHAPE,P30_EYE_COLOR,P30_SKIN,P30_DOMINANT_CHARACTERISTIC,P30_SPECIAL_CHA'
||'RACTERISTIC,P30_SURNAME_THAI,P30_MIDDLE_NAME_THAI,P30_GIVEN_NAME_THAI,P30_NIST_LASTNAME,P30_NIST_MIDDLE_NAME,P30_NIST_FIRSTNAME,P30_DATE_OF_BIRTH_DISPLAY,P30_SEX,P30_GIVEN_NAME,P30_SURNAME,P30_MIDDLE_NAME,P30_PLACE_OF_BIRTH,P30_DATE_OF_BIRTH_DISPLAY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51374642470666643)
,p_name=>'AddRefreshWindow'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(51370685386666603)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51374759115666644)
,p_event_id=>wwv_flow_api.id(51374642470666643)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'top.windowToRefresh = window;'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56761401023779607)
,p_name=>'SetDelete'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5194270320864010)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56761771728779610)
,p_event_id=>wwv_flow_api.id(56761401023779607)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.clearErrors();',
'if(apex.item(''P30_CLOSING_REASON_2'').getValue().trim() == ''''){',
'    apex.message.showErrors([{',
'    type:       "error",',
'    location:   ["inline", "page"],',
'    pageItem:   "P30_CLOSING_REASON_2",',
'    message:    apex.lang.getMessage(''REASON_FOR_CLOSING_THIS_CASE''),',
'    unsafe:     true',
'  }]);',
'}',
'else{',
'  apex.confirm(apex.lang.getMessage(''CASE.DELETE''), {',
'      request:"SAVE",',
'      set:{"P30_IS_ACTIVE":"N", "P30_HOST": location.origin}',
'  });',
'}',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67566215646613610)
,p_name=>'FingerCaptured'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(56763719232779630)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.FINGERCAPTURE|REGION TYPE|fingercapturecaptured'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56762458052779617)
,p_event_id=>wwv_flow_api.id(67566215646613610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Fixme better conditions',
'if(!this.data.getImageURL){',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67566377893613611)
,p_event_id=>wwv_flow_api.id(67566215646613610)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.FINGERITEM.UPDATE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(21605245496345535)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67566456435613612)
,p_name=>'SetMissingFinger'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(21605245496345535)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.FINGERITEM|ITEM TYPE|fingeritemstatechanged'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67566550565613613)
,p_event_id=>wwv_flow_api.id(67566456435613612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.FINGERCAPTURE.STATE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(56763719232779630)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67567510536613623)
,p_name=>'ExportJSON'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(67567449828613622)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67567677256613624)
,p_event_id=>wwv_flow_api.id(67567510536613623)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var tempFinger = [];',
'var tempFaces = [];',
'var zip = new JSZip();',
'var biometricImages = zip.folder("biometric-images");',
'var loadingPromises = [];',
'',
'function makePromiseVoucher(){',
'        var isLoadedSwitch = jQuery.Deferred();',
'        var isLoadedPromise = new Promise((resolve, reject)=> {',
'            isLoadedSwitch.done(()=>{resolve();});',
'            isLoadedSwitch.fail(()=>{reject()});',
'        });',
'        loadingPromises.push(isLoadedPromise);',
'        return isLoadedSwitch;',
'}',
'$(''.FingerItem'').each(function(i, el){ ',
'    var model = $(this).FingerItem(''broadcast'');',
'    if(!model.has(''MissingReason'') && model.has(''ImageUrl'')){',
'        var faceVoucher = makePromiseVoucher();',
'        toBlob(model.getImageURL()+ ''?format=image/''+apex.item(''P30_EXPORT_ZIP_FINGERPRINTS_AS'').getValue()).then(blob => {',
'            biometricImages.file(model.get(''Position'').name + "."+apex.item(''P30_EXPORT_ZIP_FINGERPRINTS_AS'').getValue(), blob); ',
'            faceVoucher.resolve();',
'        })',
'        var faceVoucher2 = makePromiseVoucher();',
'        toDataURL(model.getImageURL()+ ''?format=image/''+apex.item(''P30_EXPORT_ZIP_FINGERPRINTS_AS'').getValue()).then(dataUrl => {',
'            tempFinger.push({',
'            "image": {',
'              "data": dataUrl,',
'              "guid": null,',
'              "href": null',
'            },',
'            "nistImpressionType": model.get(''ImpressionType'').ordinal,',
'            "nistPosition": model.get(''Position'').ordinal',
'         });',
'           faceVoucher2.resolve();',
'        })',
'    }',
'});',
'',
'$(''.FaceItem'').each(function(i, el){ ',
'    var model = $(this).FaceItem(''broadcast'');',
'    if(model.has(''ImageGuid'') || model.has(''ImageUrl'')){',
'        var fingerVoucher = makePromiseVoucher();',
'        toBlob(model.getImageURL()+ ''?format=image/''+apex.item(''P30_EXPORT_ZIP_FACEPHOTOS_AS'').getValue()).then(blob => {',
'            fingerVoucher.resolve();',
'            biometricImages.file(model.get(''Position'').name + "-" + i + "."+apex.item(''P30_EXPORT_ZIP_FACEPHOTOS_AS'').getValue(), blob); ',
'        })',
'        var fingerVoucher2 = makePromiseVoucher();',
'        toDataURL(model.getImageURL()+ ''?format=image/''+apex.item(''P30_EXPORT_ZIP_FACEPHOTOS_AS'').getValue()).then(dataUrl => {',
'          tempFaces.push({',
'            "image": {',
'              "data": dataUrl,',
'              "guid": null,',
'              "href": null',
'            },',
'            "nistPosition": 1',
'            });',
'            fingerVoucher2.resolve();',
'        })',
'    }',
'});',
'',
'var endpoint = ''/ords/dl_bordercontrol/blacklist/case/''+apex.item(''P30_CASE_ID'').getValue();',
'var lspinner$ = apex.widget.waitPopup();',
'var caseRequest = $.ajax({',
'  type: ''GET'',',
'  url: endpoint',
'});',
'',
'caseRequest.done(function (data) {',
'    Promise.all(loadingPromises).then(values => {',
'        data.biometric.faces = tempFaces;',
'        data.biometric.fingerprints = tempFinger;',
'        let bstr = JSON.stringify(data), n = bstr.length, u8arr = new Uint8Array(n);',
'        while (n--) {',
'          u8arr[n] = bstr.charCodeAt(n);',
'        }',
'        var blob1 = new Blob([u8arr], {type: "application/octet-stream"});',
'        var fileName1 = "Exported.json";',
'            zip.file("Exported.json", blob1);',
'            zip.generateAsync({type:"blob"}).then(function(content) {',
'                lspinner$.remove();',
'                saveAs(content, apex.item(''P30_CASE_NUMBER'').getValue() + "-export.zip");',
'            });',
'        }, reason => {',
'            lspinner$.remove();',
'            apex.message.showErrors({',
'            type: ''error'',',
'            location: ''page'',',
'            message: apex.lang.getMessage(''Creating ZIP Export file failed!''),',
'            unsafe: true',
'        })',
'        });',
'    ',
'});',
'',
'caseRequest.fail(function (data) {',
'  lspinner$.remove();',
'    ',
'});',
'',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67568297031613630)
,p_name=>'SetBiometricJSON'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23326088089712919)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171899675286228220)
,p_event_id=>wwv_flow_api.id(67568297031613630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_error VARCHAR2 (4000);',
'    l_count NUMBER;',
'    c_inline_with_field            constant varchar2(40):=''INLINE_WITH_FIELD'';',
'    c_inline_with_field_and_notif  constant varchar2(40):=''INLINE_WITH_FIELD_AND_NOTIFICATION'';',
'    c_inline_in_notification       constant varchar2(40):=''INLINE_IN_NOTIFICATION'';',
'    c_on_error_page                constant varchar2(40):=''ON_ERROR_PAGE'';',
'BEGIN',
'  SELECT COUNT(case_number) ',
'  INTO l_count',
'  FROM dl_blacklist.blacklist_cases bc',
'  WHERE bc.id != :P30_CASE_ID ',
'  AND bc.case_number = :P30_CASE_NUMBER;',
'  if l_count > 0 THEN',
'    v_error := apex_lang.message(''CASE_NUMBER_ALLREADY_USED'');',
'    :P30_GOTO_TAB := ''bogus'';',
'  apex_error.add_error (',
'    p_error_code       => ''CASE_NUMBER_ALLREADY_USED'',',
'      p_additional_info => ''bogus'',',
'    p_display_location => c_inline_with_field,',
'    p_page_item_name   => ''P30_CASE_NUMBER'' );',
'  END IF;',
'END;'))
,p_attribute_02=>'P30_CASE_ID , P30_CASE_NUMBER'
,p_attribute_03=>'P30_GOTO_TAB'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67568333975613631)
,p_event_id=>wwv_flow_api.id(67568297031613630)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var tempFinger = [];',
'var tempFaces = [];',
'',
'function getGuidFromUrl( url ){',
'    var matches = url.match(/\/([^\/\?]{32})($|\?)/);',
'    if (matches) return matches[1];',
'    return null;',
'}',
'',
'$(''#BiometricFingerprints .FingerItem'').each(function(i, el){ ',
'    var model = $(this).FingerItem(''broadcast'');',
'    ',
'    if(!model.has(''MissingReason'') && model.has(''ImageUrl'')){',
'         tempFinger.push({',
'            "image": {',
'              "data": null,',
'              "guid": getGuidFromUrl(model.getImageURL()),',
'              "href": null',
'            },',
'            "nistImpressionType": model.get(''ImpressionType'').ordinal,',
'            "nistPosition": model.get(''Position'').ordinal',
'         });',
'    }',
'});',
'',
'$(''#BiometricPhotos .FaceItem'').each(function(i, el){ ',
'    var model = $(this).FaceItem(''broadcast'');',
'    if(model.has(''ImageGuid'') || model.has(''ImageUrl'')){',
'        tempFaces.push({',
'            "image": {',
'              "data": null,',
'              "guid": model.get(''ImageGuid''),',
'              "href": null',
'            },',
'            "nistPosition": 1',
'        });',
'    }',
'});',
'setTimeout(function(){',
'    var biometric = {',
'        abisId: apex.item("P30_ABIS_ID").getValue(),',
'        fingerprints: tempFinger,',
'        faces: tempFaces',
'    };',
'    console.log(biometric);',
'    apex.item("P30_BIOMETRIC_JSON").setValue(JSON.stringify(biometric));',
'    apex.submit({ request:"UPDATE" });',
'}, 300);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89401685900832223)
,p_name=>'gotoTab'
,p_event_sequence=>210
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89401711050832224)
,p_event_id=>wwv_flow_api.id(89401685900832223)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("P30_GOTO_TAB") != '''') {',
'  setTimeout(gotoTab, 500);',
'};',
'if (apex.item(''P30_RELOAD_TO_TAB'').getValue() != '''') {',
'  setTimeout(gotoReloadTab, 500);',
'};'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56764031589779633)
,p_name=>'ReleaseFingerDevice'
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56764183456779634)
,p_event_id=>wwv_flow_api.id(56764031589779633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'parent.$(''.FingerCaptureContainer'').each(function () {',
'      parent.$(this).FingerCapture(''releaseDevice'');',
'    });',
'var deviceProvidersBmBS = new DeviceProviderPlugin(null, null, null, function() {});',
'deviceProvidersBmBS.connect().done(function(){',
'    deviceProvidersBmBS.destroyProvider("Webcam");',
'    deviceProvidersBmBS.destroyProvider("Regula");',
'    deviceProvidersBmBS.destroyProvider("LF10");',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3133131891378718)
,p_name=>'Nistexport'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3133000688378717)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3133275127378719)
,p_event_id=>wwv_flow_api.id(3133131891378718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var demographicJSON = regionToJson(''.case-details'');',
'var faces = [];',
'var finger = [];',
'window.nistspinner = apex.widget.waitPopup();',
'',
'$(''.FaceItem'').each(function(i, el){ ',
'    var model = $(this).FaceItem(''broadcast'');',
'    if(model.getImageURL){',
'        faces.push(model);',
'    }',
'});',
'$(''.FingerItem'').each(function(i, el){ ',
'    var model = $(this).FingerItem(''broadcast'');',
'    if(model.getImageURL){',
'        finger.push(model);',
'    }',
'        ',
'});',
'if(!faces.length && !finger.length){',
'    apex.message.showErrors({',
'        type: ''error'',',
'        location: ''page'',',
'        message: apex.lang.getMessage(''NIST.ERROR.NO_BIOMETRIC_DATA'')',
'  });',
'    window.nistspinner.remove();',
'    return false;',
'}',
'',
'var endpoint    = "/ords/dl_bordercontrol/blacklist/nist/tcn";',
'var requestBody = {',
'	"blacklistCaseId": apex.item(''P30_CASE_ID'').getValue(),',
'	"user": ''testuser''',
'}',
'',
'var request = $.ajax({',
'    type: ''POST'',',
'    contentType: "application/json; charset=utf-8",',
'    url: endpoint,',
'    data: JSON.stringify(requestBody)',
'});',
'',
'request.done(function (data) {',
'    console.log(''success'', data);',
'    var nistConfig = {',
'        ExportFinger: apex.item(''P30_EXPORTFINGER'').getValue()  == ''YES'' || null,',
'        ExportPalms: null,',
'        ExportFace: apex.item(''P30_EXPORTFACE'').getValue()  == ''YES'' || null,',
'        ExportDemographics: true,',
'        format: ''ANSI-NIST-ITL-1-2007'',',
'        Typeoftransaction: apex.item(''P30_TYPEOFTRANSACTION'').getValue(),',
'        Destinationagencyidentifier: apex.item(''P30_TYPEOFTRANSACTION'').getValue(),',
'        transactionControlNumber: data.tcnNo',
'    }',
'    console.log(''exportNistFile'', demographicJSON, faces, finger, nistConfig); ',
'    $(''#NistExport .NistExportHandler'').Nist(''exportNistFile'', demographicJSON, faces, finger, nistConfig);',
'});',
'',
'request.fail(function (data) {',
'    var text = data.responseText;',
'    apex.message.clearErrors();',
'    apex.message.showErrors({',
'        type: ''error'',',
'        location: ''page'',',
'        message: ''Error getting the NIST Transaction Control Number.''',
'    })',
'    window.nistspinner.remove();',
'',
'});',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3134255564378729)
,p_name=>'NistDetailChanged'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_NIST_DETAILS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3134389654378730)
,p_event_id=>wwv_flow_api.id(3134255564378729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'null;'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3135645614378743)
,p_name=>'NistDownloadStarted'
,p_event_sequence=>250
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(3135512100378742)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistdownloadstarted'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3135741538378744)
,p_event_id=>wwv_flow_api.id(3135645614378743)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.nistspinner.remove();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(52385091988219244)
,p_name=>'DateValidation'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_OVERSTAY_CREATED_DATE,P30_LOST_PP_LOST_DATE,P30_NEW_PASSPORT_ISSUE_DATE,P30_LOST_PP_NOTIFY_DATE,P30_TRAVEL_PERMIT_DATE_INSERT,P30_PASSPORT_EXPIRE_DATE,P30_LOST_PP_VISA_EXP_DATE,P30_OSTAY_ARRIVAL_DATE,P30_ARRESTED_WARRANT_DATE,P30_ARRESTED_WARRANT'
||'_EXPIRY_DATE,P30_TRAVEL_PERMIT_FROM, P30_TRAVEL_PERMIT_TO, P30_TRAVEL_PERMIT_DATE_DELETE, P30_OSTAY_DEPARTURE_DATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52385458850219345)
,p_event_id=>wwv_flow_api.id(52385091988219244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!/INPUT/.test(this.triggeringElement.nodeName)) return;',
'    var id = this.triggeringElement.id;',
'    var item = apex.item(id);',
'    var value = item.getValue();',
'    var message = "";',
'    if(value !== '''' && !value.match(/^((0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/(19|20)\d\d)?$/)){',
'        console.log(value);',
'        message = apex.lang.getMessage(''FORM.VALIDATION_ERROR.WRONG_DATE_FORMAT'');',
'        apex.message.alert(message);',
'        $(''#''+id+''_error_placeholder:not(.error-shown)'')',
'            .addClass(''t-Form-error error-shown'')',
'            .append(''<span class="charset-error">''+message+ ''</span>'' );',
'    }',
'    else{',
'        $(''#''+id).parent().parent().find(''.error-shown'').removeClass(''error-shown'').find(''.charset-error'').remove();',
'    }',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67105185731079821)
,p_name=>'ReplaceNotValidChars'
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_OVERSTAY_CREATED_DATE,P30_LOST_PP_LOST_DATE,P30_NEW_PASSPORT_ISSUE_DATE,P30_LOST_PP_NOTIFY_DATE,P30_TRAVEL_PERMIT_DATE_INSERT,P30_PASSPORT_EXPIRE_DATE,P30_LOST_PP_VISA_EXP_DATE,P30_OSTAY_ARRIVAL_DATE,P30_ARRESTED_WARRANT_DATE,P30_ARRESTED_WARRANT'
||'_EXPIRY_DATE,P30_TRAVEL_PERMIT_FROM, P30_TRAVEL_PERMIT_TO, P30_TRAVEL_PERMIT_DATE_DELETE, P30_OSTAY_DEPARTURE_DATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'keypress'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67105226931079822)
,p_event_id=>wwv_flow_api.id(67105185731079821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!/INPUT/.test(this.triggeringElement.nodeName)) return;',
'    var id = this.triggeringElement.id;',
'    var item = apex.item(id);',
'    var value = item.getValue();',
' if(!/^(\d|\/)+$/.test(value)){',
'     this.browserEvent.stopPropagation();',
'     item.setValue(value.replace(/[^\/\d]/g,''''))',
' }'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67107008033079840)
,p_name=>'ReloadBiometricJSON'
,p_event_sequence=>280
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(48313377646575017)
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'pass-added'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67107173148079841)
,p_event_id=>wwv_flow_api.id(67107008033079840)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P30_BIOMETRIC_JSON := dl_blacklist.pkg_camunda_rest.get_biometric_data$json(:P30_CASE_ID);'
,p_attribute_02=>'P30_CASE_ID'
,p_attribute_03=>'P30_BIOMETRIC_JSON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171897726428228201)
,p_event_id=>wwv_flow_api.id(67107008033079840)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var biometricJSON = JSON.parse(apex.item(''P30_BIOMETRIC_JSON'').getValue());',
'var tempExistingFaceIds = []; ',
'var tempNewFaceIds = [];',
'',
'$(''.FaceItem'').each(function(i, el){ ',
'    var model = $(this).FaceItem(''broadcast'');',
'    if(model.has(''ImageGuid'') || model.has(''ImageUrl'')){',
'        tempExistingFaceIds.push(model.get(''ImageGuid''));',
'    }',
'});',
'_.each(biometricJSON.faces, function(obj,i){',
'    tempNewFaceIds.push(obj.image.guid); ',
'})',
'_.each(tempExistingFaceIds, function(guid,i){',
'    if(!_.contains(tempNewFaceIds, guid)){',
'        tempNewFaceIds.push(guid);',
'    }',
'})',
'',
'_.each(tempNewFaceIds, function(guid,i){',
'    $(''.FaceItem'').eq(i).FaceItem(''urlToModel'', ''/image/''+guid); ',
'})',
'if(biometricJSON.abisId){',
'    apex.item(''P30_ABIS_ID'').setValue(biometricJSON.abisId);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(171899918415228223)
,p_name=>'CheckIfUnique'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_CASE_NUMBER'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171900017918228224)
,p_event_id=>wwv_flow_api.id(171899918415228223)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var request = { ',
'    x01 : apex.item( "P30_CASE_NUMBER" ).getValue(),',
'    x02 : apex.item( "P30_CASE_ID" ).getValue()',
'};',
'',
'apex.server.process( ',
' "CheckIfCaseNumberIsUnique", ',
' request,',
' { dataType : "text",',
'   success  : function( pData ) {',
'      var result = $.parseJSON(pData );                           ',
'      var result_sqlcode = result["sqlcode"]; ',
'      var result_sqlerrm = result["sqlerrm"];  ',
'      apex.message.clearErrors();',
'          if ( result_sqlcode != "0" ) {',
'              document.getElementById("UpdateButton").disabled = true;',
'              apex.item( "P30_CASE_NUMBER" ).setFocus();',
'              apex.message.showErrors([',
'                {',
'                    type:       "error",',
'                    location:   ["inline", "page"],',
'                    pageItem:   "P30_CASE_NUMBER",',
'                    message:    result_sqlerrm,',
'                    unsafe:     true',
'                }]);',
'          }',
'          else',
'          {',
'               document.getElementById("UpdateButton").disabled = false;   ',
'          }',
'      }',
' }',
');',
'',
'',
'',
'',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1600624590907926)
,p_name=>'SetFaceItemReference'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(89411585998940379)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1600789925907927)
,p_event_id=>wwv_flow_api.id(1600624590907926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'top.window.FaceWindow = window;'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111341398259156007)
,p_name=>'TabsActivate'
,p_event_sequence=>310
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111341470043156008)
,p_event_id=>wwv_flow_api.id(111341398259156007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#TabContainer").on("atabsactivate", function(event, ui) {',
'    //convert to generic if/when required',
'    if (ui.showing && ui.active.href === "#SR_CriminalRecord") {',
'        //apex.event.trigger("#id-ir-crd-result-xml-report", "apexrefresh");',
'        $("#CriminalRecord").trigger("loadCriminalRecord");',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111341527675156009)
,p_name=>'UpdateCriminalRecord'
,p_event_sequence=>320
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(111341218712156006)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111341610273156010)
,p_event_id=>wwv_flow_api.id(111341527675156009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P30_SELECTED_IDENTITY_ID IS NOT NULL THEN',
'        UPDATE dl_blacklist.identities SET',
'            crd_flag = ''X''',
'            , crd_result_flag = NULL',
'            , crd_result_xml = NULL',
'            , crd_updated_datetime = NULL',
'            , crd_blin_seq = NULL',
'        WHERE key_value = :P30_SELECTED_IDENTITY_ID;',
'    END IF;',
'END;'))
,p_attribute_02=>'P30_SELECTED_IDENTITY_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111341730993156011)
,p_event_id=>wwv_flow_api.id(111341527675156009)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#CriminalRecord").trigger("loadCriminalRecord");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111341849021156012)
,p_name=>'LoadCriminalRecord'
,p_event_sequence=>330
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(95832355597545140)
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'loadCriminalRecord'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111341920893156013)
,p_event_id=>wwv_flow_api.id(111341849021156012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P30_SELECTED_IDENTITY_ID IS NOT NULL THEN',
'        SELECT ',
'            given_name',
'            , surname',
'            ---------',
'            , CASE ',
'                  WHEN crd_result_flag = 1 THEN ''พบผู้เข้าข่าย''',
'                  WHEN crd_result_flag = 0 THEN ''ไม่พบผู้เข้าข่าย''',
'                  WHEN crd_result_flag = 2 THEN ''เอกสารไม่ครบ''',
'                  ELSE ''-''',
'              END AS CRD_RESULT_FLAG',
'            ---------',
'            , CASE ',
'                  WHEN crd_flag = ''N'' THEN ''ยังไม่ได้รับการตรวจสอบประวัติอาชญากร''',
'                  WHEN crd_flag = ''Y'' THEN ''ตรวจสอบประวัติอาชญากรแล้ว''',
'                  WHEN crd_flag = ''W'' THEN ''กำลังดำเนินการตรวจสอบประวัติอาชญากร''',
'                  WHEN crd_flag = ''X'' THEN ''กำลังดำเนินการตรวจสอบประวัติอาชญากร''',
'                  ELSE '' ''',
'              END AS CRD_FLAG',
'            ---------',
'            , crd_updated_datetime',
'        INTO ',
'            :P30_CRD_NAME',
'            , :P30_CRD_SURNAME',
'            , :P30_CRD_RESULT_FLAG',
'            , :P30_CRD_FLAG',
'            , :P30_CRD_UPDATED_DATETIME',
'        FROM dl_blacklist.identities',
'        WHERE key_value = :P30_SELECTED_IDENTITY_ID;',
'    END IF;',
'END;'))
,p_attribute_02=>'P30_SELECTED_IDENTITY_ID'
,p_attribute_03=>'P30_CRD_NAME,P30_CRD_SURNAME,P30_CRD_RESULT_FLAG,P30_CRD_FLAG,P30_CRD_UPDATED_DATETIME'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111342093251156014)
,p_event_id=>wwv_flow_api.id(111341849021156012)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(95832528285545142)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5194481778864012)
,p_name=>'OpenReasonDialog'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(56761307645779606)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5194561144864013)
,p_event_id=>wwv_flow_api.id(5194481778864012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'openModal("closingReason");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5194688629864014)
,p_name=>'CloseReasonDialog'
,p_event_sequence=>350
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5194342247864011)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5194789370864015)
,p_event_id=>wwv_flow_api.id(5194688629864014)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'closeModal(''closingReason'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5195304619864021)
,p_name=>'ReactivateInactiveCase'
,p_event_sequence=>360
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5195255187864020)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5195416757864022)
,p_event_id=>wwv_flow_api.id(5195304619864021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P30_IS_ACTIVE'').setValue(''Y'');',
'apex.item(''P30_CLOSING_REASON'').setValue('''');',
'apex.item(''P30_CLOSING_REASON'').hide('''');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5195587994864023)
,p_event_id=>wwv_flow_api.id(5195304619864021)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(5195255187864020)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5195606061864024)
,p_name=>'SetBiometrics'
,p_event_sequence=>370
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5195736750864025)
,p_event_id=>wwv_flow_api.id(5195606061864024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P30_BIOMETRIC_JSON'').getValue()!=''''){',
'    setCaseDetails({biometric: JSON.parse(apex.item(''P30_BIOMETRIC_JSON'').getValue())})',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28686014615891946)
,p_name=>'NistImportFace'
,p_event_sequence=>380
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(28685751564891943)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistaddfacemodel'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28686168289891947)
,p_event_id=>wwv_flow_api.id(28686014615891946)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.getImageURL()){',
'    setFaceToItem(this.data.getImageURL());',
'}',
'try{',
'    window.currentApexSpinner.remove();',
'}',
'catch(e){}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28686413216891950)
,p_name=>'NistImportFinger'
,p_event_sequence=>400
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(28685751564891943)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistaddfingermodel'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42843491936172101)
,p_event_id=>wwv_flow_api.id(28686413216891950)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try{',
'    window.currentApexSpinner.remove();',
'}',
'catch(e){}',
'if(this.data.getImageURL()){',
'    var currentModel = this.data;',
'    var position = currentModel.get(''Position'').ordinal;',
'    var impressionType = currentModel.get(''ImpressionType'').ordinal;',
'    $(''#BiometricFingerprints .FingerItem'').each(function(i, el){ ',
'        var model = $(this).FingerItem(''broadcast'');',
'        if(model.getImageURL && position == model.get(''Position'').ordinal && (impressionType == 0 || impressionType == 2)){',
'            if(confirm(apex.lang.getMessage(''Do you want to replace the existing fingerprint: '') + currentModel.get(''Position'').name)){',
'                $(this).FingerItem(''update'', currentModel, this);',
'            }',
'        }',
'        else{',
'            $(this).FingerItem(''update'', currentModel, this);',
'        }',
'',
'    });',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42843570433172102)
,p_name=>'NistImportDescription'
,p_event_sequence=>410
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(28685751564891943)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistloadednistjson'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42843685682172103)
,p_event_id=>wwv_flow_api.id(42843570433172102)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(JSON.stringify(this.data));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42846165164172128)
,p_name=>'CalculateOverstayDays'
,p_event_sequence=>420
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_VISA_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'keypress'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42846236447172129)
,p_event_id=>wwv_flow_api.id(42846165164172128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try{',
'    var overstayDays = getDays(''P30_OSTAY_DEPARTURE_DATE'')-getDays(''P30_OSTAY_ARRIVAL_DATE'')-apex.item(''P30_VISA_DAYS'').getValue();',
'    if (overstayDays>0){',
'        apex.item(''P30_OSTAY_NO_DAYS'').setValue(overstayDays);',
'        setBlockingPeriod();',
'    }',
'    else{',
'        apex.item(''P30_OSTAY_NO_DAYS'').setValue(''0'');',
'    }',
'    function getDays(fieldname){',
'        var date = new Date($(''#''+fieldname).datepicker("getDate"));',
'        if(fieldname == ''P30_OSTAY_DEPARTURE_DATE'' && apex.item(''P30_OSTAY_DEPARTURE_DATE'').getValue() == ''''){',
'            date = new Date();',
'        }',
'        ',
'        return Math.ceil(date.getTime() / (1000 * 3600 * 24));',
'    }',
'}catch(e){',
'    alert(''please fill arrival and departure date'');',
'}',
'',
'    '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42846386275172130)
,p_name=>'SetBlockingPeriod'
,p_event_sequence=>430
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_OSTAY_NO_DAYS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42846498718172131)
,p_event_id=>wwv_flow_api.id(42846386275172130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setBlockingPeriod();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(42846505364172132)
,p_name=>'CheckBlockingPeriod'
,p_event_sequence=>440
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_OSTAY_SELF_INDICTMENT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(42846694786172133)
,p_event_id=>wwv_flow_api.id(42846505364172132)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setBlockingPeriod();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(51374889112666645)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'FetchCaseRow'
,p_attribute_02=>'BLACKLIST_CASES'
,p_attribute_03=>'P30_CASE_ID'
,p_attribute_04=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67107744548079847)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetBiometricJSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P30_BIOMETRIC_JSON := dl_blacklist.pkg_camunda_rest.get_biometric_data$json(:P30_CASE_ID);',
'EXCEPTION ',
'WHEN no_data_found THEN',
'   :P30_BIOMETRIC_JSON := '''';',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89402623571832233)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CheckForImageURL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P30_GOTO_TAB = ''BiometricImages'' THEN',
'  :P30_LIVE_IMAGE_URL := :P5_IMAGE_URL;',
'END IF;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(171899889924228222)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CheckIfCaseNumberIsUnique'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_error VARCHAR2 (4000);',
'    l_count NUMBER;',
'    l_case_number dl_blacklist.blacklist_cases.case_number%TYPE := apex_application.g_x01;',
'    l_case_id     dl_blacklist.blacklist_cases.id%TYPE          := apex_application.g_x02;',
'    c_inline_with_field            constant varchar2(40):=''INLINE_WITH_FIELD'';',
'    c_inline_with_field_and_notif  constant varchar2(40):=''INLINE_WITH_FIELD_AND_NOTIFICATION'';',
'    c_inline_in_notification       constant varchar2(40):=''INLINE_IN_NOTIFICATION'';',
'    c_on_error_page                constant varchar2(40):=''ON_ERROR_PAGE'';',
'BEGIN',
'',
'  SELECT COUNT(case_number) ',
'  INTO l_count',
'  FROM dl_blacklist.blacklist_cases bc',
'  WHERE bc.id != l_case_id',
'  AND bc.case_number = l_case_number;',
'  ',
'  apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'  ',
'  if l_count > 0 THEN',
'        apex_json.open_object;',
'        apex_json.write( ''sqlcode'', 1 );',
'        apex_json.write( ''sqlerrm'', apex_lang.message(''CASE_NUMBER_ALLREADY_USED'') );',
'        apex_json.close_object;',
'   ELSE',
'    apex_json.open_object;',
'    apex_json.write( ''sqlcode'', 0 );',
'    apex_json.close_object;',
'    ',
'  END IF;',
'',
'    htp.p( apex_json.get_clob_output );',
'',
'EXCEPTION   ',
'   WHEN OTHERS THEN',
'       apex_json.open_object;',
'       apex_json.write( ''sqlcode'', SQLCODE );',
'       apex_json.write( ''sqlerrm'', SUBSTR( SQLERRM, 11 ));',
'       apex_json.close_object;',
'       htp.p( apex_json.get_clob_output );  ',
'  ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(51374946026666646)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'SaveDBChanges'
,p_attribute_02=>'BLACKLIST_CASES'
,p_attribute_03=>'P30_CASE_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'U'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Changes saved'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67107884359079848)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UpdateBiometrics'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_biometric_json json_object_t;',
'begin',
'',
'IF :P30_BIOMETRIC_JSON is null then return; END IF;',
'',
'l_biometric_json := json_object_t.parse(:P30_BIOMETRIC_JSON);',
'',
'IF :P30_CASE_TYPE NOT LIKE ''LOST_PASSPORT''',
'THEN',
'   IF l_biometric_json.get_number(''abisId'') > 0 then ',
'    dl_blacklist.pkg_camunda_rest.update_biometrics(:P30_BIOMETRIC_JSON , :P30_CASE_ID);',
'   else ',
'    dl_blacklist.pkg_camunda_rest.insert_biometrics(:P30_BIOMETRIC_JSON , :P30_CASE_ID);',
'   end if;',
'END IF;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56761863895779611)
,p_process_sequence=>30
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DeleteFromAbis'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_params          VARCHAR2(200) := :P30_ABIS_ID;',
'    l_host            VARCHAR2(200) := :P30_HOST;',
'    l_clob            CLOB;',
'BEGIN',
'',
'    IF :P30_BIOMETRIC_JSON is null then return; END IF;',
'',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';   ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';  ',
'    l_clob           := apex_web_service.make_rest_request(',
'                                                         p_url         => :CAMUNDA_URL||''/blacklist/delete/''||l_params,',
'                                                         p_http_method => ''DELETE''',
'		                                            );',
'    UPDATE dl_blacklist.biometrics',
'    SET    dl_blacklist.biometrics.abis_id = null',
'    WHERE  dl_blacklist.biometrics.blacklist_case_id = :P30_CASE_ID;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P30_IS_ACTIVE'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'N'
);
end;
/
