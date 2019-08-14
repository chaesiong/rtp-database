prompt --application/pages/page_00074
begin
wwv_flow_api.create_page(
 p_id=>74
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Elastic Multibiometric Search'
,p_page_mode=>'NORMAL'
,p_step_title=>'Elastic Multibiometric Search'
,p_step_sub_title=>'Elastic Multibiometric Search'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_IMAGES#Dermalog.DeviceProviderWebPlugin.js'
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
'    ',
'	// serialize textfields',
'	$(regionSelector).find(''.text_field, .apex-item-text, .textarea, input[type="hidden"]'').each((i,field)=>{',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'		Demographic[name] = field.value;',
'	});',
'	',
'    $(regionSelector).find(''.datepicker'').each((i, field) => {',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'		if(field.value && field.value !== ''''){',
'			var date = new Date($(''#''+field.name).datepicker("getDate"));',
'			date.setMinutes(date.getMinutes() - date.getTimezoneOffset());',
'			var value = date.toISOString();',
'			Demographic[name] = value;',
'		}',
'	});',
'	',
'    // serialize selectlist',
'    $(regionSelector).find(''.selectlist'').each((i,field)=>{',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'        var val = apex.item(field.name).getValue();',
'        if(val && val !== '''' ){',
'            Demographic[name] = val;',
'        }',
'	});',
'	',
'    $(regionSelector).find(''.multi_selectlist'').each((i,field)=>{',
'		var name = originalName ? nameWithoutPage(field) : convertNameOfFieldToCamelCase(field);',
'		Demographic[name] = apex.item(field.id).getValue();',
'	});',
'	',
'    // all checked radio buttons',
'    $(regionSelector).find(''input[type="radio"]:checked'').each((i, field) => {',
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
'}',
'function resetPage(){',
'    document.location.reload();',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.person .FaceItem'').attr(''style'', ''height:''+parseInt($(''.person .FaceItem'').width()*1.3+20)+''px !important'');',
'',
' $("body").keydown(function(e){',
'     var keyCode = e.keyCode || e.which;',
'     if(keyCode === 118){',
'         resetPage();',
'         e.preventDefault();',
'     }',
'});',
'window.onbeforeunload = function(){',
'$(''.PassportCaptureContainer'').each(function () {',
' //$(this).PassportCapture(''releaseDevice'');',
'});',
'$(''.FingerCaptureContainer'').each(function () {',
' //$(this).FingerCapture(''releaseDevice'');',
' });',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'html, body, #wwvFlowForm, .full-height {',
'    height: 100%;',
'}',
'.t-Footer-top {',
'    display:none;',
'}',
'.apex-icons-fontawesome .fa:before {',
'    font-family: FontAwesome;',
'    vertical-align: middle;',
'}',
'',
'.t-Header-nav, .t-Footer, .t-Footer-srMode {',
'    display:none;',
'}',
'#t_Body_content_offset {',
'    height: 48px !important;',
'}',
'.container, .row, .col {',
'    flex-direction: column;',
'    flex:1;',
'}',
'.apex-side-nav .t-Body-content {',
'    margin-left: 0',
'}',
'.t-Body-contentInner {',
'    border-right: solid 40px #2578CF;',
'    border-left: solid 40px #2578CF;',
'    border-bottom: solid 40px #2578CF;',
'    height: 100%;',
'    padding: 8px;',
'}',
'/*   -------------- Colors -------------- */',
'.u-ColorBG--6 {',
'',
'}',
'body .ui-dialog .ui-dialog-titlebar .ui-dialog-title,',
'body .ui-dialog .ui-dialog-titlebar, ',
'.u-Color-6-BG--bg,',
'.t-Region-header,',
'.region-blue,',
'.t-Region--noBorder>.t-Region-header  {',
' background-color: #2074d3;',
' color: #f5f9fd;',
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
'/*   -------------- Colors -------------- */',
'body .ui-datepicker select.ui-datepicker-month, body .ui-datepicker select.ui-datepicker-year {',
'    width: 41%;',
'}',
'.fa-2x {',
'   font-size: 1.5em !important;',
'}',
'',
'.row,',
'.col>.t-Form-fieldContainer {',
'    margin:0;',
'}',
'.container-region .col {',
'    padding: 1px;',
'}',
'.container-region>.t-Region-bodyWrap>.t-Region-body>.container>.row {',
'       height: 50%;',
'}',
'.i-h320 .FingerCapture.default .preview {',
'    height: 190px;',
'    width: 240px;',
'    ',
'}',
'.FaceItem {',
'    margin-top:0px;',
'    box-shadow:none;',
'    width:100%;',
'}',
'.FaceCaptureLayout .fc-workflow-info-list {',
'    display: none;',
'}',
'.FaceCaptureLayout .fc-face-overview-list,',
'.FaceCaptureLayout .capture-overlay,',
'.FaceCaptureContainer .FaceOverlayInner {',
'    height: 100% !important;',
'}',
'',
'.capture-container {',
'    background-color:#2074d3;',
'}',
'.fingercapture-container {',
'    height:100%;',
'    background-color:#2074d3;',
'    background-image:url(#APP_IMAGES#background/fingerprint_bottom.png);',
'    background-position: center bottom;',
'    background-size: 100px 100px;',
'    background-repeat: no-repeat;',
'}',
'.fingercapture-region {',
'    margin:0;',
'    background-color: transparent;',
'}',
'.t-Body-contentInner>.container,',
'.t-Body-contentInner>.container>.row,',
'.t-Body-contentInner>.container>.row>.col,',
'.person .row,',
'.person .container,',
'.col-100,',
'.identity,',
'.identity>.t-Region-bodyWrap,',
'.identity>.t-Region-bodyWrap>.t-Region-body,',
'.facecapture-region,',
'.facecapture-region>.t-Region-bodyWrap,',
'.facecapture-region>.t-Region-bodyWrap>.t-Region-body,',
'.fingercapture-container.i-h320>.t-Region-bodyWrap,',
'.fingercapture-container.i-h320>.t-Region-bodyWrap>.t-Region-body,',
'.fingercapture-container.i-h320>.t-Region-bodyWrap>.t-Region-body>.container,',
'.fingercapture-container.i-h320>.t-Region-bodyWrap>.t-Region-body>.container>.row.fingeritem-row,',
'.fingercapture-container.i-h320>.t-Region-bodyWrap>.t-Region-body>.container>.row.fingeritem-row>.col {',
'    height:100%;',
'    margin: 0;',
'}',
'.region-100>.t-Region-bodyWrap, ',
'.region-100>.t-Region-bodyWrap>.t-Region-body {',
'    overflow: hidden;',
'}',
'.region-100-with-header>.t-Region-bodyWrap {',
'    max-height: calc(100% - 50px) !important;',
'}',
'.identity-info {',
'    background-color:#2074d3;',
'    max-height: 100% !important;',
'    height:auto;',
'    border: none;',
'    border-right: 1px solid transparent;',
'    box-shadow: none;',
'}',
'.identity-info>.t-Region-bodyWrap {',
'    max-height: 100% !important;',
'    height:auto;',
'}',
'',
'.capture-region .container {',
'    display:none;',
'}',
'.fingeritem-region {',
'    height: auto;',
'    padding:0;',
'    transition: all 1s;',
'}',
'.region-blue {',
'    background: none;',
'    background-color: #2074d3;',
'    color: white;',
'    box-shadow:none;',
'    border-color: white;',
'}',
'.region-blue label {',
'    color: white !important;',
'}',
'.container-region.t-Region>.t-Region-bodyWrap>.t-Region-body {',
'    height: calc(100% - 50px);',
'}',
'.container-region.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row,',
'.fingeritem-region>.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row{',
'    height:50% !important;',
'}',
'.fingeritem-region .col-2 {',
'    height:100%;',
'    width:20%;',
'    padding:0;',
'}',
'.fingeritem-region .t-Form-itemWrapper,',
'.fingeritem-region>.t-Region,',
'.fingeritem-region>.t-Region>.t-Region-bodyWrap,',
'.fingeritem-region>.t-Region>.t-Region-bodyWrap>.t-Region-body,',
'.fingeritem-region>.t-Region>.t-Region-bodyWrap>.t-Region-body>.container,',
'.region-100,',
'.region-100>.t-Region-bodyWrap,',
'.region-100>.t-Region-bodyWrap>.t-Region-body,',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container,',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row,',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row>.col,',
'.fingeritem-region .col-2 .rel-col,',
'.fingeritem-region .col-2{',
'    height:100%;',
'    padding:0;',
'}',
'.region-100>.t-Region-bodyWrap {',
'    overflow:hidden;',
'}',
'',
'.FaceItemLayout .fc-item-content.hasImage {',
'   background-color: #f5f9fd;',
'}',
'.fingercapture-container:not(.finger-capture-completed) .fingeritem-region:not(:hover) {',
'     animation: regionmoveout 0.7s linear forwards;',
'}',
'.fingercapture-container .fingeritem-region:hover {',
'    animation: regionmovein 0.4s linear forwards;',
'}',
'.fingercapture-container.finger-capture-completed .fingeritem-region:last-of-type {',
'    animation: regionmovein 0.4s linear forwards;',
'}',
'.fingercapture-container.i-h320>.t-Region-bodyWrap>.t-Region-body {',
'    overflow: hidden;',
'}',
'',
'@keyframes regionmovein {',
'    0%   {',
'        position:absolute;',
'        top: 320px; ',
'        height:30%;',
'        overflow: hidden;',
'    }',
'    100% {',
'        position:absolute;',
'        top: 0px; ',
'        height:100%;',
'        z-index: 12;',
'    }',
'}',
'@keyframes regionmoveout {',
'    0%   {',
'        position:absolute;',
'        top: 0px; ',
'        height:100%;',
'        opacity:1;',
'    }',
'    99% {',
'        top: 330px; ',
'        height:20%;',
'        opacity:0.5;',
'    }',
'    100% {',
'        position:relative;',
'        opacity:0;',
'        top: 0px; ',
'        height:auto;',
'    }',
'}',
'.expand-collapse-layout>.preview {',
'    top: 330px;',
'    height: calc(90vh - 330px);',
'    left:0;',
'    width:29vw; ',
'}',
'.alt.is-valid .fc-facelive {',
'    width:100% !important;',
'}',
'.t-Body {',
'    height: 100%',
'}',
'',
'.t-Body .t-Body-main {',
'    height: 100%',
'}',
'',
'.t-Body .t-Body-main .t-Body-content {',
'    height: calc(100% - 50px);',
'    display: block;',
'}',
'.t-Body .t-Body-main .t-Body-content>.t-Body-contentInner {',
'    height: calc(100% - 50px);',
'}',
'.t-Body .t-Body-main .t-Body-content>.t-Body-contentInner>.container {',
'    height: 100%',
'}',
'',
'.t-Body .t-Body-main .t-Body-content>.t-Body-contentInner>.container>.row {',
'    height: 100%',
'}',
'.demographic-data label, .case-details label{',
'    padding-right: 5px;',
'}',
'.demographic-data .margin-top-md {',
'    margin-top: 1.3vh !important;',
'}',
'.demographic-data .margin-top-lg {',
'    margin-top: 2vh !important;',
'}',
'.t-Footer {',
'    display: flex;',
'    position: absolute;',
'    bottom: 0;',
'    width: 100%;',
'    padding: 3px;',
'    border: none;',
'    padding-left: 41px;',
'    background-color: transparent;',
'}',
'.capture-button {',
'    position: absolute;',
'    left: 0;',
'    top: 2px;',
'    height: 40px;',
'    background-color: #2074d3 !important;',
'    color: #f5f9fd !important; ',
'}',
'.release-devices-button,',
'.release-devices-button:hover {',
'    position: fixed;',
'    right: 39px;',
'    top: 5px;',
'    height: 40px;',
'    background-color: #2074d3 !important;',
'    color: #f5f9fd !important;',
'    z-index: 888;',
'}',
'.case-details {',
'    background-color: #2074d3;',
'    color: #fff;',
'}',
'.case-details .container{',
'    padding-right: 15px !important;',
'}',
'.case-details label{',
'    color: #f5f9fd !important;',
'}',
'.case-details .row,',
'.case-details .col {',
'    height: auto !important;',
'}',
'.pass-photo-region {',
'    margin-left: 10px;',
'}',
'.passport-reader-status.ready {',
'    background-color: #2074d3;',
'    color: #fff;',
'}',
'.passport-reader-status.ready .st0 {',
'    fill: #fff !important;',
'}',
'.passport-reader-status.ready .st1 {',
'    stroke: #fff !important;',
'}',
'.passport-reader-status.disconnected .st0 {',
'    fill: #bbb !important;',
'}',
'.passport-reader-status.disconnected .st1 {',
'    stroke: #bbb !important;',
'}',
'.pass-photo-region svg[data-face-position="Portrait"]{',
'    display: none;',
'}',
'input:placeholder-shown,  textarea:placeholder-shown, select:placeholder-shown{',
'    background-color: #fbf5e3 !important;',
'}',
'',
'.t-Header-logo {',
'    margin-left: 23px;',
'}',
'#InsertPreview {',
'    display:none;',
'}',
'.FaceItem .button-rotate {',
'    ',
'}',
'.i-h320 .FingerprintItemLayout .fp-item-header .quality-indicator,',
'.i-h240 .FingerprintItemLayout .fp-item-header .quality-indicator{',
'    left: 5px !important;',
'    width: 23px;',
'}',
'#EventTrap1, #EventTrap2 {',
'    width: 46%;',
'    height: 90px;',
'    position: absolute;',
'    z-index: 1;',
'}',
'#EventTrap2 {',
'    right:0;',
'}',
'',
'/*',
'    This a fix for FingerCapture component in Person and Document, ',
'    to remove extra border and aligning subregions, resolving issue',
'    with cropped hand, changing plugin title font-size to 16px as in other',
'    subregions. Also added special classes for main subregions to be able ',
'    to be able safe to overwrite styles and moved the release button ',
'    to the left, to avoid covering Log Out Link',
'    victor.sembelidis@dermalog.com',
'*/',
'.person-and-document-container {',
'    border: 1px white solid;',
'    border-right: 0;',
'}',
'.person-and-document-container .region-blue {',
'    border: 0;',
'}',
'.person-and-document-container .t-Region-header {',
'    border-bottom: 0;',
'}',
'',
'.case-details-container {',
'    border: 1px white solid;',
'    border-top: 0;',
'    border-right: 0;',
'}',
'',
'.finger-capture-container {',
'    border: 1px white solid;',
'}',
'.finger-capture-container .fingercapture-region {',
'    border: 0;',
'}',
'.finger-capture-container .FingerCaptureHeaderControls {',
'    z-index: 10;',
'}',
'.finger-capture-container .FingerCaptureHeaderMessages .message {',
'    font-size: 16px;',
'}',
'',
'.pass-capture-container {',
'    border: 1px white solid;',
'    border-top: 0;',
'}',
'.pass-capture-container .t-Region {',
'    border: 0;',
'}',
'.pass-capture-container .PassportCapture .content-wrapper {',
'    padding: 0;',
'}',
'',
'.pass-capture-container .PassportCapture .message {',
'    font-size: 16px;',
'}',
'',
'.pass-capture-container {',
'    border: 1px white solid;',
'    border-top: 0;',
'}',
'.pass-capture-container .t-Region {',
'    border: 0;',
'}',
'.pass-capture-container .PassportCapture .content-wrapper {',
'    padding: 0;',
'}',
'',
'.release-devices-button, .release-devices-button:hover {',
'    right: 120px;',
'}',
''))
,p_step_template=>wwv_flow_api.id(15240695234705229)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190627152747'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(429856705982689583)
,p_plug_name=>'BlacklistContainer'
,p_region_css_classes=>'container-region region-100'
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
 p_id=>wwv_flow_api.id(417505047153488150)
,p_plug_name=>'Case Details'
,p_parent_plug_id=>wwv_flow_api.id(429856705982689583)
,p_region_css_classes=>'case-details region-100'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>7
,p_plug_grid_column_css_classes=>'case-details-container'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(429856787413689584)
,p_plug_name=>'Person and Document'
,p_parent_plug_id=>wwv_flow_api.id(429856705982689583)
,p_region_css_classes=>'person region-100 region-100-with-header too-small-for-overlay region-blue'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>7
,p_plug_grid_column_css_classes=>'person-and-document-container'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(416929602983576050)
,p_plug_name=>'FaceLivePhoto'
,p_parent_plug_id=>wwv_flow_api.id(429856787413689584)
,p_region_css_classes=>'too-small-for-overlay region-100'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(429858634443689702)
,p_plug_name=>'FacePhoto'
,p_parent_plug_id=>wwv_flow_api.id(429856787413689584)
,p_region_css_classes=>'too-small-for-overlay region-100 pass-photo-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h240:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'col-100'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(430972412739520883)
,p_plug_name=>'DemographicData'
,p_parent_plug_id=>wwv_flow_api.id(429856787413689584)
,p_region_css_classes=>'demographic-data region-blue'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'region-blue'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(429856845457689585)
,p_plug_name=>'FingerCaptureContainer'
,p_parent_plug_id=>wwv_flow_api.id(429856705982689583)
,p_region_css_classes=>'fingercapture-container'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'finger-capture-container'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(387426401212024868)
,p_plug_name=>'EventTrap1'
,p_region_name=>'EventTrap1'
,p_parent_plug_id=>wwv_flow_api.id(429856845457689585)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15243749782705235)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(387426517336024869)
,p_plug_name=>'EventTrap2'
,p_region_name=>'EventTrap2'
,p_parent_plug_id=>wwv_flow_api.id(429856845457689585)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15243749782705235)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(429857253272689589)
,p_plug_name=>'FingerCapture'
,p_parent_plug_id=>wwv_flow_api.id(429856845457689585)
,p_region_css_classes=>'fingercapture-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
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
,p_attribute_22=>'Y'
,p_attribute_23=>'FINGERPRINTS'
,p_attribute_24=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "UseImageService": false,',
'  "WarnOnRemoveFinger": false,',
'  "DeviceSettings": {',
'    "Beep": "Both",',
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
 p_id=>wwv_flow_api.id(429857408378689590)
,p_plug_name=>'FingerprintView'
,p_parent_plug_id=>wwv_flow_api.id(429856845457689585)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_css_classes=>'hide-me fingeritem-region'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(429857099363689587)
,p_plug_name=>'PassCapture'
,p_parent_plug_id=>wwv_flow_api.id(429856705982689583)
,p_region_css_classes=>'region-100'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'pass-capture-container'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.DERMALOG.PASSPORTCAPTURE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'Y'
,p_attribute_02=>'XF09'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'passport'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'UseImageService: false',
'}'))
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338497754074728586)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(429856705982689583)
,p_button_name=>'ResetForm'
,p_button_static_id=>'ResetForm'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Reset Form'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338498116351728589)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(429856705982689583)
,p_button_name=>'OpenCase'
,p_button_static_id=>'OpenCase'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Opencase'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338498553539728591)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(429856705982689583)
,p_button_name=>'ReleaseDevices'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_image_alt=>'Release devices for other use'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'release-devices-button'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338504603100728620)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(416929602983576050)
,p_button_name=>'Capture'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276401767705294)
,p_button_image_alt=>'Capture'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5::'
,p_button_css_classes=>'capture-button'
,p_icon_css_classes=>'fa fa-camera'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338498946679728592)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(429856705982689583)
,p_button_name=>'Search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:RP::'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa fa-search '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338499310446728592)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(429856705982689583)
,p_button_name=>'InsertPreview'
,p_button_static_id=>'InsertPreview'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Insertpreview'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338499753586728593)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(429856705982689583)
,p_button_name=>'Insert'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insert'
,p_button_position=>'REGION_TEMPLATE_HELP'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338500166458728594)
,p_name=>'P74_REDIRECT_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(429856705982689583)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338500535087728597)
,p_name=>'P74_CASE_JSON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(429856705982689583)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338500918527728598)
,p_name=>'P74_EXISTING_IDENTITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(429856705982689583)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338501631684728606)
,p_name=>'P74_CASE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(417505047153488150)
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
 p_id=>wwv_flow_api.id(338502013662728609)
,p_name=>'P74_CASE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(417505047153488150)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338502468670728610)
,p_name=>'P74_REASON'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(417505047153488150)
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
,p_field_template=>wwv_flow_api.id(15276268480705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338502826424728611)
,p_name=>'P74_AUTHORITY'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(417505047153488150)
,p_prompt=>'Authority'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276268480705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338503270857728612)
,p_name=>'P74_CONTACT_TELEPHONE_NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(417505047153488150)
,p_prompt=>'Contact Telephone Number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338503646527728612)
,p_name=>'P74_NOTICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(417505047153488150)
,p_prompt=>'Notice'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338505006880728622)
,p_name=>'P74_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(416929602983576050)
,p_prompt=>'Photo Live/Upload'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
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
,p_attribute_11=>'http://chh0567:8080/face/detection/portrait'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338505656365728628)
,p_name=>'P74_FACE_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(429858634443689702)
,p_prompt=>'Portrait Pass'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_css_classes=>'pass-photo'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'FACE'
,p_attribute_07=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'}'))
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_attribute_10=>'/image'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338506355324728632)
,p_name=>'P74_FIRSTNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
,p_prompt=>'First Name'
,p_placeholder=>' '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-none'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338506759339728632)
,p_name=>'P74_SURNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
,p_prompt=>'Surname'
,p_placeholder=>' '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338507160410728633)
,p_name=>'P74_DATE_OF_BIRTH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
,p_prompt=>'Date of Birth'
,p_placeholder=>' '
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1910:2037'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338507545513728634)
,p_name=>'P74_PLACE_OF_BIRTH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
,p_prompt=>'Place of Birth'
,p_placeholder=>' '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338507959596728635)
,p_name=>'P74_SEX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
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
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338508364047728637)
,p_name=>'P74_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
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
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338508730510728638)
,p_name=>'P74_PASSPORT_NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
,p_prompt=>'Passport Number'
,p_placeholder=>'   '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338509177148728639)
,p_name=>'P74_PASSPORT_ISSUING_COUNTRY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
,p_prompt=>'Pass Iss. Country'
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
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338509584886728640)
,p_name=>'P74_PASSPORT_EXPIRY_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(430972412739520883)
,p_prompt=>'Expiry Date'
,p_placeholder=>' '
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1910:2037'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338511428690728652)
,p_name=>'P74_RIGHT_THUMB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'Right thumb'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338511821819728657)
,p_name=>'P74_RIGHT_INDEX'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'2'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338512270989728658)
,p_name=>'P74_RIGHT_MIDDLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'3'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338512679163728661)
,p_name=>'P74_RIGHT_RING'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'4'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338513045241728662)
,p_name=>'P74_RIGHT_LITTLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'5'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338513410024728663)
,p_name=>'P74_LEFT_THUMB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'6'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338513886570728666)
,p_name=>'P74_LEFT_INDEX'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'7'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338514242869728666)
,p_name=>'P74_LEFT_MIDDLE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'8'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338514607927728667)
,p_name=>'P74_LEFT_RING'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'9'
,p_attribute_02=>'0'
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
 p_id=>wwv_flow_api.id(338515078002728668)
,p_name=>'P74_LEFT_LITTLE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(429857408378689590)
,p_prompt=>'New'
,p_display_as=>'PLUGIN_COM.DERMALOG.FINGERITEM'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'10'
,p_attribute_02=>'0'
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
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(338515819030728671)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>'P74_REASON'
,p_validation2=>'[^\s]+$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Please give a reason for this case'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(338502468670728610)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338517979804728683)
,p_name=>'FingerCaptured'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(429857253272689589)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.FINGERCAPTURE|REGION TYPE|fingercapturecaptured'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338518417663728685)
,p_event_id=>wwv_flow_api.id(338517979804728683)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.FINGERITEM.UPDATE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(429857408378689590)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338518819939728686)
,p_name=>'SetMissingFinger'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(429857408378689590)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.FINGERITEM|ITEM TYPE|fingeritemstatechanged'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338519327764728687)
,p_event_id=>wwv_flow_api.id(338518819939728686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_COM.DERMALOG.FINGERCAPTURE.STATE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(429857253272689589)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338519725691728687)
,p_name=>'PassCaptured'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(429857099363689587)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.PASSPORTCAPTURE|REGION TYPE|passportcapturemodelchanged'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338520284246728688)
,p_event_id=>wwv_flow_api.id(338519725691728687)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''Passmodel: '', this.data.toJSON());',
'var model = this.data.getPhotoImageURL ? this.data : this.data.get(''passport'');',
'var url = model.getPhotoImageURL();',
'var mrz = model.get(''DigitalMRZ'') || model.get(''OpticalMRZ'');',
'if(url){',
'    if(/^data:/.test(url)){',
'        apex.message.alert(''Passport image is Base64 encoded'');',
'    }',
'}',
'$(''.pass-photo .FaceItem'').FaceItem(''urlToModel'',url  );',
'',
'if(!mrz) return false;',
'',
'$s(''P74_FIRSTNAME'', mrz.GivenNames);',
'$s(''P74_SURNAME'', mrz.Surname);',
'$(''#P74_DATE_OF_BIRTH'').datepicker( "setDate", (new Date(mrz.DateOfBirth)) );',
'apex.item(''P74_NATIONALITY'').setValue(mrz.Nationality);',
'apex.item(''P74_PASSPORT_ISSUING_COUNTRY'').setValue(mrz.IssuingState);',
'apex.item(''P74_PASSPORT_NUMBER'').setValue(mrz.PassportNo);',
'//apex.item(''P74_PASSPORT_EXPIRY_DATE'').setValue(model.get(''OpticalMRZ'').DateOfExpiry);',
'$(''#P74_PASSPORT_EXPIRY_DATE'').datepicker( "setDate", (new Date(mrz.DateOfExpiry)) );',
'switch(mrz.Sex){',
'    case 1: apex.item(''P74_SEX'').setValue(''MALE'');',
'        break;',
'    case 2: apex.item(''P74_SEX'').setValue(''FEMALE'');',
'        break;',
'    case 3: apex.item(''P74_SEX'').setValue(''OTHER'');',
'        break;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338520612908728689)
,p_name=>'FingerCaptureCompleted'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(429857253272689589)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.FINGERCAPTURE|REGION TYPE|fingercapturecompleted'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338521136519728691)
,p_event_id=>wwv_flow_api.id(338520612908728689)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(this);',
'$(''.fingercapture-container'').addClass(''finger-capture-completed'');',
'console.log(''completeted'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338521666947728692)
,p_event_id=>wwv_flow_api.id(338520612908728689)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'null;'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338522020625728692)
,p_name=>'OnUploadError'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(429858634443689702)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.FACEITEM|ITEM TYPE|faceitemworkflowerror'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338522516258728693)
,p_event_id=>wwv_flow_api.id(338522020625728692)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P74_FACE_ITEM'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(this.data);',
'apex.message.showErrors({',
'    type: ''error'',',
'    location: ''page'',',
'    message: apex.lang.getMessage(this.data.ErrorMessage),',
'    unsafe: true',
'})'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338522941616728693)
,p_name=>'Release Devices'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(338498553539728591)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338523424737728694)
,p_event_id=>wwv_flow_api.id(338522941616728693)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'this.affectedElements.find(''.PassportCaptureContainer'').each(function () {',
'      $(this).PassportCapture(''releaseDevice'');',
'});',
'this.affectedElements.find(''.FingerCaptureContainer'').each(function () {',
'      $(this).FingerCapture(''releaseDevice'');',
'    });',
'this.affectedElements.find(''.FaceCaptureContainer'').each(function () {',
'      $(this).FaceCapture(''releaseDevice'');',
'    });',
'',
'var deviceProviders = new DeviceProviderPlugin(',
'    {',
'        protocol: ''wss'',',
'        port: 2018',
'    }, null, null, function() {});',
'deviceProviders.connect().done(function(){',
'    deviceProviders.restartFactory();',
'});',
'var deviceProvidersBmBS = new DeviceProviderPlugin(null, null, null, function() {});',
'deviceProvidersBmBS.connect().done(function(){',
'    deviceProvidersBmBS.destroyProvider("Webcam");',
'    deviceProvidersBmBS.destroyProvider("Regula");',
'    deviceProvidersBmBS.destroyProvider("LF10");',
'});',
'',
'',
'return true;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338523858729728695)
,p_name=>'InsertCollection'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(338499753586728593)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338525810503728699)
,p_event_id=>wwv_flow_api.id(338523858729728695)
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
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338526384729728700)
,p_event_id=>wwv_flow_api.id(338523858729728695)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var CaseDetails = regionToJson(''.case-details'');',
'var tempFinger = [];',
'var tempFaces = [];',
'function getGuidFromUrl(url) {',
'    var matches = url.match(/\/([^\/\?]{32})($|\?)/);',
'    if (matches) return matches[1];',
'    return null;',
'}',
'top.$(''.FingerItem'').each(function (i, el) {',
'    var model = top.$(this).FingerItem(''broadcast'');',
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
'top.$(''.FaceItem'').each(function (i, el) {',
'    var model = top.$(this).FaceItem(''broadcast'');',
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
'console.log(blacklistRequestBody);',
'apex.item(''P74_CASE_JSON'').setValue(JSON.stringify(blacklistRequestBody));'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338524880817728697)
,p_event_id=>wwv_flow_api.id(338523858729728695)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'    l_identity dl_blacklist.travel_docs.identity%TYPE;',
'    v_SEQ_ID       INTEGER;',
'BEGIN ',
'    SELECT identity',
'    INTO l_identity',
'    FROM dl_blacklist.travel_docs',
'    WHERE issuing_country = :P74_PASSPORT_ISSUING_COUNTRY AND doc_number = :P74_PASSPORT_NUMBER;',
'    ',
'    IF l_identity IS NOT NULL THEN',
'        IF NOT APEX_COLLECTION.collection_exists(p_collection_name => ''EXISTING_IDENTITY'')',
'          THEN',
'            APEX_COLLECTION.create_or_truncate_collection(p_collection_name => ''EXISTING_IDENTITY'');',
'            v_SEQ_ID := APEX_COLLECTION.ADD_MEMBER(p_collection_name => ''EXISTING_IDENTITY'');',
'        END IF;',
'        APEX_COLLECTION.UPDATE_MEMBER(',
'            p_collection_name  => ''EXISTING_IDENTITY''',
'            , p_seq            => 1',
'',
'            , p_n001            => 0 --',
'',
'            , p_c001            => l_identity',
'',
'            , p_clob001         => :P74_CASE_JSON',
'            , p_blob001         => null',
'          );',
'    ',
'        l_url := APEX_UTIL.PREPARE_URL(',
'            p_url => ''f?p='' || l_app || '':70:''||l_session||''::YES:70:P70_IDENTITY_ID:'' || l_identity,',
'            p_checksum_type => ''SESSION'');',
'        :P74_REDIRECT_URL := l_url;',
'        :P74_EXISTING_IDENTITY := l_identity;',
'        :P70_CASE_JSON := :P74_CASE_JSON;',
'',
'',
'      ',
'    END IF;',
'    ',
'EXCEPTION WHEN no_data_found THEN   ',
' :P74_REDIRECT_URL := '''';',
' :P74_EXISTING_IDENTITY := '''';',
' ',
'END;'))
,p_attribute_02=>'P74_PASSPORT_NUMBER,P74_PASSPORT_ISSUING_COUNTRY,P74_CASE_JSON'
,p_attribute_03=>'P74_REDIRECT_URL,P74_EXISTING_IDENTITY,P70_CASE_JSON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338525358725728698)
,p_event_id=>wwv_flow_api.id(338523858729728695)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P74_EXISTING_IDENTITY'').getValue() != ''''){',
'    apex.navigation.redirect(apex.item("P74_REDIRECT_URL").getValue() );',
'    return false;',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338524389221728696)
,p_event_id=>wwv_flow_api.id(338523858729728695)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var Demographic = regionToJson(''.demographic-data'');',
'if (!Demographic.givenName){',
'    Demographic.givenName = Demographic.firstname;',
'} ',
'    Demographic.surName = Demographic.surname;',
'',
'var CaseDetails = regionToJson(''.case-details'');',
'var TravelDoc = _.clone(Demographic);',
'if( Demographic.sex) TravelDoc.sex = Demographic.sex.substring(0, 1);',
'',
'var blacklistRequestBody = JSON.parse(apex.item(''P74_CASE_JSON'').getValue());',
'',
'TravelDoc.docNumber = Demographic.passportNumber;',
'TravelDoc.issuingCountry = Demographic.passportIssuingCountry;',
'TravelDoc.dateOfExpiry = Demographic.passportExpiryDate;',
'Demographic.traveldocs = [];',
'Demographic.traveldocs.push(TravelDoc);',
'blacklistRequestBody.case.identities = [];',
'blacklistRequestBody.case.identities.push(Demographic);',
'',
'console.log(''Demo '', blacklistRequestBody);',
'',
'var endpoint = ''/bpm/blacklist/insert'';',
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
'        apex.item(''P74_CASE_ID'').setValue(data.blacklistid);',
'    }',
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
'    lspinner$.remove();',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338526794025728700)
,p_name=>'Reset'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(45905746278550650)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338527240308728701)
,p_event_id=>wwv_flow_api.id(338526794025728700)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'document.location.reload();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338527678495728701)
,p_name=>'OpenCreatedCase'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(338498116351728589)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338528073326728702)
,p_name=>'OpenInsertedCase'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P74_CASE_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338528542548728703)
,p_event_id=>wwv_flow_api.id(338528073326728702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P74_CASE_ID'').getValue()==''''){',
' return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338529097109728704)
,p_event_id=>wwv_flow_api.id(338528073326728702)
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
'        p_url => ''f?p='' || l_app || '':30:''||l_session||''::YES:30:P30_CASE_ID:'' || :P74_CASE_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P74_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P74_CASE_ID'
,p_attribute_03=>'P74_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338529515816728704)
,p_event_id=>wwv_flow_api.id(338528073326728702)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.redirect(apex.item("P74_REDIRECT_URL").getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338516105941728678)
,p_name=>'DateValidation'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P74_PASSPORT_EXPIRY_DATE,P74_DATE_OF_BIRTH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338516673616728681)
,p_event_id=>wwv_flow_api.id(338516105941728678)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(this); ',
'',
'if(!/INPUT/.test(this.triggeringElement.nodeName)) return;',
'    var id = this.triggeringElement.id;',
'    var item = apex.item(id);',
'    var value = item.getValue();',
'    var message = "";',
'    console.log(value);',
'    if(!value.match(/^((0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/(19|20)\d\d)?$/)){',
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
 p_id=>wwv_flow_api.id(338517070426728682)
,p_name=>'ReplaceNotValidChars'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P74_PASSPORT_EXPIRY_DATE,P74_DATE_OF_BIRTH'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338517578392728682)
,p_event_id=>wwv_flow_api.id(338517070426728682)
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
'     item.setValue(value.replace(/[^\/\d]/g,''''))',
' }'))
,p_stop_execution_on_error=>'Y'
);
end;
/
