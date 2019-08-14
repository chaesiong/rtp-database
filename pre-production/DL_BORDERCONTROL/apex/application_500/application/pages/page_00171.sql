prompt --application/pages/page_00171
begin
wwv_flow_api.create_page(
 p_id=>171
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Movement Detail '
,p_page_mode=>'MODAL'
,p_step_title=>'Passport & Movement Details'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#jQueryRotate.js',
'#WORKSPACE_IMAGES#fotorama.js',
'#WORKSPACE_IMAGES#MovementDetail.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
'#APP_IMAGES#wsq.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'var ws;',
'function appendPluginMessage(sender, message) {',
'	appendMessage(message);',
'}',
'',
'function wsOnOpen(resp) {',
'}',
'',
'function wsOnClose(resp) {',
'}',
'',
'',
'function getHtmlImage(imgBase64, type) {',
'	return "data:image/" + type + ";base64, " + imgBase64;',
'}',
'',
'function setOutputImage(resp, caption) {',
'	var $fotoramaDiv = $(''#fotorama'').fotorama();',
'	var fotorama = $fotoramaDiv.data(''fotorama'');',
'	fotorama.push({img: getHtmlImage(resp.ImageBase64, resp.ImageType), thumb: getHtmlImage(resp.ImageBase64, resp.ImageType), caption: caption});',
'}',
'',
'',
'$(".t-TabsRegion-items").attr("style", "");',
'window.setTimeout(function() { $(".t-TabsRegion-items").attr("style", ""); }, 100);',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#ID_REG_HIDDEN").hide();',
'',
'',
'var $fotoramaDiv = $(''#fotorama'').fotorama();',
'var fotorama = $fotoramaDiv.data(''fotorama'');',
'',
'if ($(''#P171_PASS_VISUALPAGE'').length > 0)',
'fotorama.push({img: $(''#P171_PASS_VISUALPAGE'').attr(''src''), thumb: $(''#P171_PASS_VISUALPAGE'').attr(''src''), caption: ''Passport''});',
'',
'if ($(''#P171_PASS_VISUALPAGE_PIB'').length > 0)',
'fotorama.push({img: $(''#P171_PASS_VISUALPAGE_PIB'').attr(''src''), thumb: $(''#P171_PASS_VISUALPAGE_PIB'').attr(''src''), caption: ''Passport Pibics''});',
'',
'if ($(''#P171_MVMNT_SCANPHOTO'').length > 0) {',
'    fotorama.push({img: $(''#P171_MVMNT_SCANPHOTO'').attr(''src''), thumb: $(''#P171_MVMNT_SCANPHOTO'').attr(''src''),caption: ''Pass Photo''});',
'} else {',
'    fotorama.push({img: $(''#P171_PASS_VISUAL_FACE'').attr(''src''), thumb: $(''#P171_PASS_VISUAL_FACE'').attr(''src''),caption: ''Pass Photo''});',
'}',
'',
'',
'if ($(''#P171_PASS_ICAO_FACE'').length > 0)',
'fotorama.push({img: $(''#P171_PASS_ICAO_FACE'').attr(''src''), thumb: $(''#P171_PASS_ICAO_FACE'').attr(''src''), caption: ''Chip Photo''});',
'',
'',
'if ($(''#P171_LIVE_PHOTO'').length > 0)',
'fotorama.push({img: $(''#P171_LIVE_PHOTO'').attr(''src''), thumb: $(''#P171_LIVE_PHOTO'').attr(''src''), caption: ''Live Photo''});',
'',
'if ($(''#P171_LIVE_PHOTO_PIB'').length > 0)',
'fotorama.push({img: $(''#P171_LIVE_PHOTO_PIB'').attr(''src''), thumb: $(''#P171_LIVE_PHOTO_PIB'').attr(''src''), caption: ''Live Photo Pibics''});',
'',
'',
'if ($(''#P171_VISA_1'').length > 0)',
'fotorama.push({img: $(''#P171_VISA_1'').attr(''src''), thumb: $(''#P171_VISA_1'').attr(''src''), caption: ''Visa''});',
'',
'',
'',
'if ($(''#P171_LANDINGCARD_1'').length > 0)',
'    fotorama.push({img: $(''#P171_LANDINGCARD_1'').attr(''src''), thumb: $(''P171_LANDINGCARD_1'').attr(''src''), caption: ''Travel Card''});',
'',
'',
'/*(function() {',
'	var convert = function(imgID) {',
'		return new Promise(function(done, fail) {',
'			var ws = new ImageConverterPlugin(0, null, null, function() {});',
'			ws.connect().then(function() {',
'				DownloadBLOB($("#" + imgID).attr("src"), function(b64Image) {',
'					ws.convertImage(b64Image).then(done, fail);',
'				});',
'			});',
'		});',
'	};',
'	var remainingImages = 10;',
'	var images = [null, null, null, null, null, null, null, null, null, null, null];',
'	var names = ["", "Right Thumb", "Right Index Finger", "Right Middle Finger", "Right Ring Finger", "Right Little Finger", "Left Thumb", "Left Index Finger", "Left Middle Finger", "Left Ring Finger", "Left Little Finger"];',
'	var collectImages = function(position, img) {',
'		var cnt = (--remainingImages);',
'		images[position] = img;',
'		if (cnt == 0) {',
'			for (var i = 1; i < images.length; i++) {',
'				if (images[i] != null) {',
'					var imgData = getHtmlImage(images[i].ImageBase64, images[i].ImageType);',
'					fotorama.push({img: imgData, thumb: imgData, caption: names[i]});',
'				}',
'			}',
'		}',
'	};',
'	convert(''P171_WSQ_RT'').then(function(img) { collectImages(1, img); }, function() { collectImages(1, null); });',
'	convert(''P171_WSQ_RI'').then(function(img) { collectImages(2, img); }, function() { collectImages(2, null); });',
'	convert(''P171_WSQ_RM'').then(function(img) { collectImages(3, img); }, function() { collectImages(3, null); });',
'	convert(''P171_WSQ_RR'').then(function(img) { collectImages(4, img); }, function() { collectImages(4, null); });',
'	convert(''P171_WSQ_RL'').then(function(img) { collectImages(5, img); }, function() { collectImages(5, null); });',
'	convert(''P171_WSQ_LT'').then(function(img) { collectImages(6, img); }, function() { collectImages(6, null); });',
'	convert(''P171_WSQ_LI'').then(function(img) { collectImages(7, img); }, function() { collectImages(7, null); });',
'	convert(''P171_WSQ_LM'').then(function(img) { collectImages(8, img); }, function() { collectImages(8, null); });',
'	convert(''P171_WSQ_LR'').then(function(img) { collectImages(9, img); }, function() { collectImages(9, null); });',
'	convert(''P171_WSQ_LL'').then(function(img) { collectImages(10, img); }, function() { collectImages(10, null); });',
'})();*/',
'',
'(function() {',
'	var convert = function(imgID) {',
'		return new Promise(function(done, fail) {',
'			var ws = new ImageConverterPlugin(0, null, null, function() {});',
'			ws.connect().then(function() {',
'				var url = $("#" + imgID).attr("src");',
'				if (url) {',
'					DownloadBLOB($("#" + imgID).attr("src"), function(b64Image) {',
'						if (b64Image) {',
'							ws.convertImage(b64Image).then(done, fail);',
'						} else {',
'							fail(null);',
'						}',
'					});',
'				} else {',
'					fail();',
'				}',
'			});',
'		});',
'	};',
'	var remainingImages = 10;',
'	var images = [null, null, null, null, null, null, null, null, null, null, null];',
'	var names = ["", "Right Thumb", "Right Index Finger", "Right Middle Finger", "Right Ring Finger", "Right Little Finger", "Left Thumb", "Left Index Finger", "Left Middle Finger", "Left Ring Finger", "Left Little Finger"];',
'	var collectImages = function(position, img) {',
'		var cnt = (--remainingImages);',
'		images[position] = img;',
'		if (cnt == 0) {',
'			var display_positions = [10, 9, 8, 7, 6, 1, 2, 3, 4, 5];',
'			for (var idx in display_positions) {',
'				var i = display_positions[idx];',
'				if (images[i] != null) {',
'					console.log("Inserting fingerprint image for position ", i);',
'					var imgData = getHtmlImage(images[i].ImageBase64, images[i].ImageType);',
'					fotorama.push({img: imgData, thumb: imgData, caption: names[i]});',
'				} else {',
'					console.log("Fingerprint position ", i, " is null");',
'				}',
'			}',
'		}',
'	};',
'	/*convert(''P177_WSQ_RT'').then(function(img) { collectImages(1, img); }, function() { collectImages(1, null); });',
'	convert(''P177_WSQ_RI'').then(function(img) { collectImages(2, img); }, function() { collectImages(2, null); });',
'	convert(''P177_WSQ_RM'').then(function(img) { collectImages(3, img); }, function() { collectImages(3, null); });',
'	convert(''P177_WSQ_RR'').then(function(img) { collectImages(4, img); }, function() { collectImages(4, null); });',
'	convert(''P177_WSQ_RL'').then(function(img) { collectImages(5, img); }, function() { collectImages(5, null); });',
'	convert(''P177_WSQ_LT'').then(function(img) { collectImages(6, img); }, function() { collectImages(6, null); });',
'	convert(''P177_WSQ_LI'').then(function(img) { collectImages(7, img); }, function() { collectImages(7, null); });',
'	convert(''P177_WSQ_LM'').then(function(img) { collectImages(8, img); }, function() { collectImages(8, null); });',
'	convert(''P177_WSQ_LR'').then(function(img) { collectImages(9, img); }, function() { collectImages(9, null); });',
'	convert(''P177_WSQ_LL'').then(function(img) { collectImages(10, img); }, function() { collectImages(10, null); });*/',
'	var fingerpositions = ["WSQ_RT", "WSQ_RI", "WSQ_RM", "WSQ_RR", "WSQ_RL", "WSQ_LT", "WSQ_LI", "WSQ_LM", "WSQ_LR", "WSQ_LL"];',
'	var idx = 0;',
'	var decoder = new WsqDecoder();',
'	for (var i in fingerpositions) {',
'		idx++;',
'		var fp = fingerpositions[i];',
'		//if (v_fingerprints_wsq && v_fingerprints_wsq[fp] && v_fingerprints_wsq[fp].length > 0) {',
'		if (v_row && v_row[fp] && v_row[fp].length > 0) {',
'			var fp_wsq = v_row[fp];',
'			(function(idx, img) {',
'				/*var ws = new ImageConverterPlugin(0, null, null, function() {});',
'				ws.connect().then(function() {',
'					ws.convertImage(img).then(function(img) { collectImages(idx, img); }, function(img) { collectImages(idx, null); });',
'				});*/',
'				collectImages(idx, {ImageBase64: decoder.decodeBase64(img).split(",")[1], ImageType: "bmp"});',
'			})(idx, fp_wsq);',
'		} else {',
'			collectImages(idx, null);',
'		}',
'	}',
'})();',
'',
'',
'$(".a-MediaBlock").hide();',
'window.setInterval(function() {',
'	$(".t-TabsRegion-items").css("min-height", "0");',
'}, 100);',
'',
'',
'',
'',
'',
'var url = "../JasperReportsIntegration/report?_repName=travel_history_person&_repFormat=pdf&_dataSource=default&_outFilename=&_repLocale=&_repEncoding=&_printIsEnabled=&_printPrinterName=&_printPrinterTray=&_printCopies=&_printDuplex=&_printCollate=&'
||'_saveIsEnabled=&_saveFileName=&P_BRDDOCID=&P171_BRDDOCID.";',
'',
'  $("#pdfrenderer").attr("href", url + "#zoom=80");',
'  $("#pdfrendererobject").attr("data", url + "#zoom=80");',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#fotorama.css',
'#WORKSPACE_IMAGES#MovementDetail.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form--large .t-Form-label, .t-Form-fieldContainer--large .t-Form-label{',
'    font-size: 1.8rem;',
'    white-space: nowrap;',
'}',
'',
'.t-Form--large .t-Form-inputContainer input[type=text], .t-Form--large input.datepicker, .t-Form--large input.password, .t-Form--large input.popup_lov, .t-Form--large input.text_field, .t-Form--large select.selectlist[size="1"], .t-Form--large select'
||'.yes_no, .t-Form--large span.display_only, .t-Form-fieldContainer--large .t-Form-inputContainer input[type=text], .t-Form-fieldContainer--large input.datepicker, .t-Form-fieldContainer--large input.password, .t-Form-fieldContainer--large input.popup_'
||'lov, .t-Form-fieldContainer--large input.text_field, .t-Form-fieldContainer--large select.selectlist[size="1"], .t-Form-fieldContainer--large select.yes_no, .t-Form-fieldContainer--large span.display_only {',
'    font-size: 1.7rem;',
'}',
'',
'.t-Tabs-link {',
'    font-size: 1.7rem;',
'}',
'',
'.cl-h100 {',
'    height: 100% !important;',
'}',
'',
'.cl-red {',
'    color: red !important;',
'}'))
,p_page_css_classes=>'css_white_background'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_height=>'980'
,p_dialog_width=>'1100'
,p_dialog_css_classes=>'css_white_background'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190725181553'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460741210200069164)
,p_plug_name=>'Movement Detail '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460741828570069167)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(844053499558175274)
,p_plug_name=>'REG_HIDDEN'
,p_region_name=>'ID_REG_HIDDEN'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(844409607782296618)
,p_plug_name=>'Form on V_M_D photo'
,p_parent_plug_id=>wwv_flow_api.id(844053499558175274)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="max-height: 1000px; max-width:800px; margin-left: -150px; margin-right: -250px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(870739046069626847)
,p_plug_name=>'Fingerprints'
,p_parent_plug_id=>wwv_flow_api.id(844053499558175274)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(911242294983997345)
,p_plug_name=>'Detail'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(563823021746049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843679301406768484)
,p_plug_name=>'Offload'
,p_parent_plug_id=>wwv_flow_api.id(911242294983997345)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(955947641417745489)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'AI_P_1014_see_set_offload'
,p_plug_display_when_cond2=>'1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843679482945768486)
,p_plug_name=>'Offload this Movement'
,p_parent_plug_id=>wwv_flow_api.id(843679301406768484)
,p_icon_css_classes=>'fa-info-circle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Offload this movement: use the button below to offload this movement. This action will be logged.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843679605165768487)
,p_plug_name=>'Offload'
,p_parent_plug_id=>wwv_flow_api.id(843679301406768484)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843679690085768488)
,p_plug_name=>'Deport'
,p_parent_plug_id=>wwv_flow_api.id(911242294983997345)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(955947781612748242)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'AI_P_1013_see_set_deport'
,p_plug_display_when_cond2=>'1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843680124549768492)
,p_plug_name=>'Deport this Movement'
,p_parent_plug_id=>wwv_flow_api.id(843679690085768488)
,p_icon_css_classes=>'fa-info-circle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'deport this movement: use the button below to deport this movement. This action will be logged.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843680183633768493)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(843679690085768488)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(911364938116758444)
,p_plug_name=>'Main Data'
,p_parent_plug_id=>wwv_flow_api.id(911242294983997345)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934014038703259467)
,p_plug_name=>'COL_LEFT'
,p_parent_plug_id=>wwv_flow_api.id(911364938116758444)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934012933909259456)
,p_plug_name=>'Passport Information'
,p_parent_plug_id=>wwv_flow_api.id(934014038703259467)
,p_icon_css_classes=>'fa-info-circle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934013560841259462)
,p_plug_name=>'Passport Data'
,p_parent_plug_id=>wwv_flow_api.id(934014038703259467)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934014117183259468)
,p_plug_name=>'COL_RIGHT'
,p_parent_plug_id=>wwv_flow_api.id(911364938116758444)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934012996793259457)
,p_plug_name=>'Movement Information'
,p_parent_plug_id=>wwv_flow_api.id(934014117183259468)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934013218770259459)
,p_plug_name=>'Biometric Data'
,p_parent_plug_id=>wwv_flow_api.id(934012996793259457)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934013349991259460)
,p_plug_name=>'Travel Data'
,p_parent_plug_id=>wwv_flow_api.id(934012996793259457)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934014249556259469)
,p_plug_name=>'Movement Information'
,p_parent_plug_id=>wwv_flow_api.id(934014117183259468)
,p_icon_css_classes=>'fa-info-circle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(911627816348154863)
,p_plug_name=>'Visuals'
,p_parent_plug_id=>wwv_flow_api.id(911242294983997345)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P171_MVMNTID IS NOT NULL',
'OR :P171_CHECK_PIBICS_CONN = 1'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(844053434445175273)
,p_plug_name=>'photo_pana'
,p_region_name=>'PHOTO_PANA'
,p_parent_plug_id=>wwv_flow_api.id(911627816348154863)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="margin-left:100px;margin-top:10px;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="fotorama"',
'     data-nav="thumbs"',
'     data-arrows="true"',
'     data-click="true"',
'     data-swipe="false"',
'     ',
'     id="fotorama"',
'     style="float:left; min-height:600px; min-width:300px;"',
'     data-allowfullscreen="native" data-height="500px" data-width="840px">   ',
'    ',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(911365024239758445)
,p_plug_name=>'Visual Data of Passport and Movement'
,p_region_name=>'ID_REG_HEADER'
,p_parent_plug_id=>wwv_flow_api.id(911627816348154863)
,p_icon_css_classes=>'fa-info-circle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(911895482321431381)
,p_plug_name=>'Children Data'
,p_parent_plug_id=>wwv_flow_api.id(911242294983997345)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P171_DATA_SOURCE'
,p_plug_display_when_cond2=>'PIBICS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(911931135738529185)
,p_plug_name=>'Children'
,p_parent_plug_id=>wwv_flow_api.id(911895482321431381)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select last_name,',
'       ',
'       first_name,',
'       ',
'       date_of_birth,',
'        ',
'       sex,',
'        ',
'      ''<img src="''||APEX_UTIL.GET_BLOB_FILE_SRC(''P18_IMAGE'',KEY_VALUE,null,''inline'')||''" height="100" width="140"/>'' childphoto ',
'from dl_bordercontrol.fellow_passenger',
'where MVMNTID = :P171_MVMNTID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(911931391923529191)
,p_name=>'Children'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>634576222763569648
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176610308155283429)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Last name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176610345995283430)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'First name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176610512036283431)
,p_db_column_name=>'DATE_OF_BIRTH'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Date of birth'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176610595823283432)
,p_db_column_name=>'SEX'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(185689583249632996)
,p_db_column_name=>'CHILDPHOTO'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'Childphoto'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(911933953571529199)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6345788'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'LAST_NAME:FIRST_NAME:DATE_OF_BIRTH:SEX:CHILDPHOTO:'
,p_break_on=>'CHILDID:0:0:0:0:0'
,p_break_enabled_on=>'CHILDID:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(930710308576621618)
,p_plug_name=>'Data of Children traveling with this Passport'
,p_parent_plug_id=>wwv_flow_api.id(911895482321431381)
,p_icon_css_classes=>'fa-info-circle'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(911895967326437123)
,p_plug_name=>'VISA Data'
,p_parent_plug_id=>wwv_flow_api.id(911242294983997345)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P171_NATIONALITY'
,p_plug_display_when_cond2=>'THA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(844053018430175269)
,p_plug_name=>'VISA-Image'
,p_parent_plug_id=>wwv_flow_api.id(911895967326437123)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>31
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(930711045604634503)
,p_plug_name=>'VISA Data and Image'
,p_parent_plug_id=>wwv_flow_api.id(911895967326437123)
,p_icon_css_classes=>'fa-info-circle'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(930711547053648041)
,p_plug_name=>'VISA-Data'
,p_parent_plug_id=>wwv_flow_api.id(911895967326437123)
,p_region_template_options=>'#DEFAULT#:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(911896361058439695)
,p_plug_name=>'Travel Card Data'
,p_parent_plug_id=>wwv_flow_api.id(911242294983997345)
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(914176834720385395)
,p_plug_name=>'Travel Card-Image'
,p_parent_plug_id=>wwv_flow_api.id(911896361058439695)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(930713878509672363)
,p_plug_name=>'Travel Card-Data'
,p_parent_plug_id=>wwv_flow_api.id(911896361058439695)
,p_region_template_options=>'#DEFAULT#:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(930715027395695509)
,p_plug_name=>'Travel Card Data and Image'
,p_parent_plug_id=>wwv_flow_api.id(911896361058439695)
,p_icon_css_classes=>'fa-info-circle'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(951882879294415189)
,p_plug_name=>'Print PDF'
,p_parent_plug_id=>wwv_flow_api.id(911242294983997345)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div>',
'    <object id="pdfrendererobject" type="application/pdf" width="100%" height="760" style="border: 1px solid rgba(0, 0, 0, 0.15);">',
'        alt : <a id="pdfrenderer" ></a>',
'    </object>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P171_DATA_SOURCE'
,p_plug_display_when_cond2=>'PIBICS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(906224950666759666)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(843680183633768493)
,p_button_name=>'BTN_DEPORTEE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--large:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Deport this Movement'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-gavel'
,p_grid_column_attributes=>'style="padding: 8px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_api.id(955947781612748242)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(906571276111809840)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(843679605165768487)
,p_button_name=>'BTN_OFFLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--large:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Offload this Movement'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-gavel'
,p_grid_column_attributes=>'style="padding: 8px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_api.id(955947641417745489)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(460742214716069168)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(460741828570069167)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(460741689319069167)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(460741828570069167)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(460741565952069167)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(460741828570069167)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(460741521131069167)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(460741828570069167)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(844410399699296622)
,p_branch_action=>'f?p=&APP_ID.:171:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6935485988734815)
,p_name=>'P171_DATA_SOURCE'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6935599741734816)
,p_name=>'P171_DATA_SOURCE_SEC'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Data Source Secondary (usually from PIBICS) - ',
'TMINOUT_MA',
'TMINOUT',
'TMMAIN'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6935973386734820)
,p_name=>'P171_DATA_SOURCE_SEC_PK_VAL'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137870536227874833)
,p_name=>'P171_PERSONID'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137870632558874834)
,p_name=>'P171_PASS_VISUALPAGE_PIB'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_prompt=>'Pass Visualpage PIBICS'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="max-height:280px"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''COLL_PIBICS_PASSPORT_IMAGE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137870762028874835)
,p_name=>'P171_LIVE_PHOTO_PIB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(844409607782296618)
,p_prompt=>'Live photo PIBICS'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="border-radius:15px; max-height: 600px; max-width:450px"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''COLL_PIBICS_MOVEMENT_IMAGE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137870981207874837)
,p_name=>'P171_CHECK_PIBICS_CONN'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143925529281387923)
,p_name=>'P171_SUPERVISOR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Supervisor:'
,p_source=>'GRANTED_BY_SUPERVISOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143925629297387924)
,p_name=>'P171_SUPERVISOR_REASON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Supervisor Reason:'
,p_source=>'SUPERVISOR_REASON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-h100'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143927257073387940)
,p_name=>'P171_IS_CREW_NUM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143927344065387941)
,p_name=>'P171_IS_CREW'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Is Crew:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'YES_NO_ALFA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    dl_common.yes_nos$lc',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_tag_css_classes=>'cl-red'
,p_grid_label_column_span=>5
,p_display_when=>'P171_IS_CREW'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176610899171283435)
,p_name=>'P171_VISA_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'VISA_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.VISA_TYPES$LC',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176611003221283436)
,p_name=>'P171_PERMIT_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_prompt=>'Permit Type:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176611138368283437)
,p_name=>'P171_PERMIT_EXPIRY_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_prompt=>'Date of Permit Expiry:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176611188339283438)
,p_name=>'P171_TM6_NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(930713878509672363)
,p_prompt=>'TM6 Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176611288459283439)
,p_name=>'P171_PROVINCE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(930713878509672363)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_adm_class_province;'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176611357073283440)
,p_name=>'P171_AMPUR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(930713878509672363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ampur:'
,p_source=>'DISTRICT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176611451377283441)
,p_name=>'P171_TAMBON'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(930713878509672363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tambon:'
,p_source=>'SUBDISTRICT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176611613845283442)
,p_name=>'P171_NOTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(930713878509672363)
,p_prompt=>'Note:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(179343828387484131)
,p_name=>'P171_MVMNT_SOURCE_SYSTEM'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Source System:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_SOURCE_SYSTEMS'
,p_lov=>'.'||wwv_flow_api.id(4684663447151108195)||'.'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181669357658336833)
,p_name=>'P171_INS_AT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Created at:'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(428924896112452922)
,p_name=>'P171_LANDINGCARD'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'LANDINGCARD_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(428961856281488262)
,p_name=>'P171_VISA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'VISA_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460744582859069195)
,p_name=>'P171_MVMNTID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'MVMNTID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460745051235069214)
,p_name=>'P171_BRDDOCID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'BRDDOCID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460745428097069216)
,p_name=>'P171_LANDBARCD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'LANDBARCD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460745832787069217)
,p_name=>'P171_EXITFLG'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Direction:'
,p_source=>'EXITFLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460746219209069218)
,p_name=>'P171_MAX_STAY_DT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'MAX_STAY_DT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460746586431069218)
,p_name=>'P171_FINGERMATCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(934013218770259459)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fingers:'
,p_source=>'FINGERMATCH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_YESNO'
,p_lov=>'.'||wwv_flow_api.id(558108972921270797)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460747023592069218)
,p_name=>'P171_FACEMATCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(934013218770259459)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Face:'
,p_source=>'FACEMATCH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_YESNO'
,p_lov=>'.'||wwv_flow_api.id(558108972921270797)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460747463657069218)
,p_name=>'P171_MVMNTADDR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'MVMNTADDR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460747833122069219)
,p_name=>'P171_ORIDEST'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'ORIDEST'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460748225317069219)
,p_name=>'P171_TRAVEL_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Travel Date:'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460748965455069220)
,p_name=>'P171_INS_BY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Created By:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_USERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    UPPER(NVL(TRIM(first_name || '' '' || last_name), username)) as d,',
'    username as r',
'FROM apex_user_management.users;'))
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460749381714069220)
,p_name=>'P171_WORKSTATION_NAME'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_source=>'TERMINAL_IP_ADDR'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460749788214069220)
,p_name=>'P171_SERVER_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Border Post:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-h100'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460750233446069220)
,p_name=>'P171_REFUSEDFLG'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'REFUSEDFLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460750645517069221)
,p_name=>'P171_OBSERVATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Note:'
,p_source=>'OBSERVATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460751045235069221)
,p_name=>'P171_PSSNGRSTATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'PERSON_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460751784557069221)
,p_name=>'P171_MVMNT_PHOTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'LIVE_PHOTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844051456632175253)
,p_name=>'P171_SURNAME'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844052908395175268)
,p_name=>'P171_BIOMETRIC_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_prompt=>'Biometric status:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844053263386175271)
,p_name=>'P171_VISA_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(844053018430175269)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Visa '
,p_source=>'VISA_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'rotate90onclick'
,p_tag_attributes=>'style="border-radius:15px; border: 1px solid black; max-height: 400px"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844053341746175272)
,p_name=>'P171_LANDINGCARD_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(914176834720385395)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Landingcard '
,p_source=>'LANDINGCARD_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'rotate90onclick'
,p_tag_attributes=>'style="border-radius:15px; border: 1px solid black; max-height: 400px"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844053599629175275)
,p_name=>'P171_PASS_VISUAL_FACE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Pass visual face'
,p_source=>'PASS_VISUAL_FACE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="max-height:300px; max-width:200px;height:300px;width:200px";'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844054129484175280)
,p_name=>'P171_EXIT_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Exit type'
,p_source=>'EXITFLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844054234137175281)
,p_name=>'P171_FLIGHT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Transport:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_FLIGHTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  f.flightnum || '' (''|| o.IATA_FAA_CODE || '' -> '' || d.IATA_FAA_CODE || '')'' as d, f.flghtid as r from flights f',
'join airports o on o.id = f.originairportid',
'join airports d on d.id = f.destinairportid',
'order by f.flightnum;'))
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844054432823175283)
,p_name=>'P171_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc no'
,p_source=>'DOCNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844410860741296624)
,p_name=>'P171_MVMNTID_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(844409607782296618)
,p_use_cache_before_default=>'NO'
,p_source=>'MVMNTID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844411193845296683)
,p_name=>'P171_LIVE_PHOTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(844409607782296618)
,p_use_cache_before_default=>'NO'
,p_source=>'LIVE_PHOTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="border-radius:15px; max-height: 600px; max-width:450px"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844702506464174437)
,p_name=>'P171_VISA_COM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Visa Comments:'
,p_source=>'VISUM_INFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'style="font-style:italic"'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(844702825819174439)
,p_name=>'P171_LAND_COM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(930713878509672363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travelcard Comments:'
,p_source=>'LC_INFO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'style="font-style:italic"'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(845320612510330272)
,p_name=>'P171_PASS_ICAO_FACE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Icao Face'
,p_source=>'PASS_ICAO_FACE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(845719472649871450)
,p_name=>'P171_EXITFLG_DISPLAY'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(845763112800585909)
,p_name=>'P171_DOCNUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(850416015974064815)
,p_name=>'P171_MVMNT_SCANPHOTO'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_use_cache_before_default=>'NO'
,p_source=>'PSBLOB_1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(850425391545270226)
,p_name=>'P171_DOCFACE_CAMERA_SCORE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(460741210200069164)
,p_use_cache_before_default=>'NO'
,p_source=>'PS_5'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870739492257635525)
,p_name=>'P171_WSQ_LL'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Ll'
,p_source=>'WSQ_LL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870739828785639313)
,p_name=>'P171_WSQ_LI'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Li'
,p_source=>'WSQ_LI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870740155985641714)
,p_name=>'P171_WSQ_LM'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Lm'
,p_source=>'WSQ_LM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870740370425644418)
,p_name=>'P171_WSQ_LR'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Lr'
,p_source=>'WSQ_LR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870740755723646961)
,p_name=>'P171_WSQ_LT'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Lt'
,p_source=>'WSQ_LT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870741068210649070)
,p_name=>'P171_WSQ_RL'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Rl'
,p_source=>'WSQ_RL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870741284411650887)
,p_name=>'P171_WSQ_RI'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Ri'
,p_source=>'WSQ_RI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870741591647652984)
,p_name=>'P171_WSQ_RM'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Rm'
,p_source=>'WSQ_RM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870741928301655543)
,p_name=>'P171_WSQ_RR'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Rr'
,p_source=>'WSQ_RR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(870742206840657785)
,p_name=>'P171_WSQ_RT'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(870739046069626847)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Wsq Rt'
,p_source=>'WSQ_RT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911365174772758447)
,p_name=>'P171_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>150
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911365500282758450)
,p_name=>'P171_VISUM_NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_prompt=>'Visa Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911365614151758451)
,p_name=>'P171_VISUM_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of Issue:'
,p_source=>'VISUM_LOCATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911365736892758452)
,p_name=>'P171_VISUM_DURATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Length of Stay:'
,p_source=>'VISUM_DURATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911365784200758453)
,p_name=>'P171_VISUM_START'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Start Date:'
,p_source=>'VISUM_START'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911365945442758454)
,p_name=>'P171_VISUM_END'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(930711547053648041)
,p_prompt=>'Date of Expiry:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911366025703758455)
,p_name=>'P171_LC_LENGTH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(930713878509672363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Length of Stay:'
,p_source=>'LC_LENGTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911366076611758456)
,p_name=>'P171_LC_ADDRESS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(930713878509672363)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Address:'
,p_source=>'LC_ADDRESS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(911893384952359062)
,p_name=>'P171_MANUALEXPIRYDATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Manual Expiry Date:'
,p_source=>'MANUALEXPIRYDATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(912003664498688728)
,p_name=>'P171_DIRECTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Direction:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(920287021326666102)
,p_name=>'P171_DATEOFISSUE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date of Issue:'
,p_source=>'DATEOFISSUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(920287294720672229)
,p_name=>'P171_NATIONALITY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(920287618506675490)
,p_name=>'P171_PLACEOFBIRTH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of Birth:'
,p_source=>'PLACEOFBIRTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934011739902259444)
,p_name=>'P171_REASON_OFFLOAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(843679605165768487)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reason for offload procedure:'
,p_source=>'REASON_OFFLOAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>128
,p_cHeight=>5
,p_tag_attributes=>'style="resize: none; width: 470px;"'
,p_colspan=>9
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934011809873259445)
,p_name=>'P171_REASON_DEPORTEE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(843680183633768493)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reason for deportee procedure:'
,p_source=>'REASON_DEPORTEE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>128
,p_cHeight=>5
,p_tag_attributes=>'style="resize: none; width: 470px;"'
,p_colspan=>9
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934013626185259463)
,p_name=>'P171_GIVENNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Given Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>150
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934013703915259464)
,p_name=>'P171_ISSUECTRY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Issuing Country:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
,p_grid_label_column_span=>5
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934013794253259465)
,p_name=>'P171_EXPIRYDATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Expiry Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934013957815259466)
,p_name=>'P171_GENDER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934014331225259470)
,p_name=>'P171_VISATYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'VISA_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.VISA_TYPES$LC',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(935571141748714544)
,p_name=>'P171_PASS_VISUALPAGE'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Pass Visualpage'
,p_source=>'PASS_VISUALPAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(940582465011865381)
,p_name=>'IS_BLACKLISTED'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(844053499558175274)
,p_prompt=>'Blacklisted'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942307680499771919)
,p_name=>'P171_DOB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942307983404782005)
,p_name=>'P171_DOCTYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_DOCUEMENT_CLASS_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686928075744369026)
,p_name=>'P171_NAME_THAI'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Thai Last Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P171_NATIONALITY = ''THA''',
'AND :P171_NAME_THAI IS NOT NULL'))
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686928112948369027)
,p_name=>'P171_GIVENNAME_THAI'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Thai Given Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P171_NATIONALITY = ''THA''',
'AND :P171_GIVENNAME_THAI IS NOT NULL'))
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686928246598369028)
,p_name=>'P171_CITIZEN_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Thai Citizen ID:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P171_NATIONALITY = ''THA''',
'AND :P171_CITIZEN_ID IS NOT NULL'))
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686928433199369030)
,p_name=>'P171_LAST_EDIT_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Last Edit Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>5
,p_display_when=>'P171_LAST_EDIT_DATE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686928597690369031)
,p_name=>'P171_LAST_EDIT_BY'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Last Edit By:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_USERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    UPPER(NVL(TRIM(first_name || '' '' || last_name), username)) as d,',
'    username as r',
'FROM apex_user_management.users;'))
,p_grid_label_column_span=>5
,p_display_when=>'P171_LAST_EDIT_BY'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686928657313369032)
,p_name=>'P171_LAST_EDIT_REMARK'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(934013349991259460)
,p_prompt=>'Last Edit Remark:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-h100'
,p_grid_label_column_span=>5
,p_display_when=>'P171_LAST_EDIT_REMARK'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686929780515369043)
,p_name=>'P171_MIDDLENAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(934013560841259462)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>150
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(6936176580734822)
,p_computation_sequence=>10
,p_computation_item=>'P171_DATA_SOURCE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'SELECT NVL2(:P171_MVMNTID, ''BIO'', ''PIBICS'') FROM DUAL;'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(845720052250881134)
,p_computation_sequence=>20
,p_computation_item=>'P171_EXITFLG_DISPLAY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select decode(exitflg, 1, ''Departure'', ''Arrival'') from movements where mvmntid = :P171_MVMNTID;'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(940590803969872959)
,p_computation_sequence=>30
,p_computation_item=>'IS_BLACKLISTED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select ''This Document is currently blacklisted'' from dual'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(460748669898069220)
,p_validation_name=>'P171_CREATED must be timestamp'
,p_validation_sequence=>100
,p_validation=>'P171_TRAVEL_DATE'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(460748225317069219)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(460742266349069168)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(460742214716069168)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(460743161336069170)
,p_event_id=>wwv_flow_api.id(460742266349069168)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(844052707057175266)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(460741210200069164)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(844052824683175267)
,p_event_id=>wwv_flow_api.id(844052707057175266)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_CSS'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(460741210200069164)
,p_attribute_01=>'color'
,p_attribute_02=>'red'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(934039167545349186)
,p_name=>'DA_TOGGLE_DEPORT_BTN'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P171_REASON_DEPORTEE'
,p_condition_element=>'P171_REASON_DEPORTEE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(934039518364349191)
,p_event_id=>wwv_flow_api.id(934039167545349186)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(906224950666759666)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(934040012786353344)
,p_event_id=>wwv_flow_api.id(934039167545349186)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(906224950666759666)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(934040547336360815)
,p_name=>'DA_TOGGLE_OFFLOAD_BTN'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P171_REASON_OFFLOAD'
,p_condition_element=>'P171_REASON_OFFLOAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(934040887595360818)
,p_event_id=>wwv_flow_api.id(934040547336360815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(906571276111809840)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(934041378702360818)
,p_event_id=>wwv_flow_api.id(934040547336360815)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(906571276111809840)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(906224668360755559)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SET_DEPORTEE'
,p_process_sql_clob=>'UPDATE MOVEMENTS SET EXITFLG = 2, REASON_DEPORTEE=:P171_REASON_DEPORTEE WHERE MVMNTID=:P171_MVMNTID;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(906224950666759666)
,p_process_success_message=>'Successfully changed Movement to Deportee'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(906570693519808122)
,p_process_sequence=>11
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SET_OFFLOAD'
,p_process_sql_clob=>'UPDATE MOVEMENTS SET EXITFLG = 3,REASON_OFFLOAD=:P171_REASON_OFFLOAD WHERE MVMNTID=:P171_MVMNTID;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(906571276111809840)
,p_process_success_message=>'Successfully changed Movement to Offload'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(844419196787296710)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of V_M_D'
,p_attribute_02=>'V_M_D'
,p_attribute_03=>'P171_MVMNTID'
,p_attribute_04=>'MVMNTID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(460754343690069225)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(460741689319069167)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(460754740243069225)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107621063242742939)
,p_process_sequence=>30
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Images BIO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    procedure HtpPrn(pclob in clob) is',
'     v_excel varchar2(32000);',
'     v_clob clob := pclob;',
'    begin',
'      while length(v_clob) > 0 loop',
'        begin',
'          if length(v_clob) > 16000 then',
'             v_excel:= substr(v_clob,1,16000);',
'             htp.prn(v_excel);',
'             v_clob:= substr(v_clob,length(v_excel)+1);',
'          else',
'             v_excel := v_clob;',
'             htp.prn(v_excel);',
'             v_clob:='''';',
'             v_excel := '''';',
'          end if;',
'        end;',
'      end loop;',
'    end;',
'    FUNCTION base64encode(p_blob IN BLOB)',
'      RETURN CLOB',
'    IS',
'      l_clob CLOB;',
'      l_step PLS_INTEGER := 12000; -- make sure you set a multiple of 3 not higher than 24573',
'      l_temp VARCHAR2(32000);',
'      l_size NUMBER;',
'      l_pos NUMBER;',
'      l_remaining NUMBER;',
'      l_read NUMBER;',
'      l_outsize NUMBER;',
'    BEGIN',
'      IF p_blob IS NULL THEN',
'        RETURN NULL;',
'      END IF;',
'',
'      l_size := dbms_lob.getlength(p_blob);',
'      l_pos := 0;',
'',
'      while l_pos < l_size loop',
'        l_read := l_size - l_pos;',
'        if l_read > l_step then',
'          l_read := l_step;',
'        end if;',
'        l_clob := l_clob || replace(replace(utl_raw.cast_to_varchar2(utl_encode.base64_encode(dbms_lob.substr(p_blob, l_read, l_pos + 1))), chr(13)), chr(10));',
'        l_outsize := dbms_lob.getlength(l_clob);',
'        l_pos := l_pos + l_read;',
'      end loop;',
'',
'      RETURN l_clob;',
'    END;',
'begin',
'	htpprn(''<script>v_row = {};'');',
'	begin',
'		for c_row in (select * from movements_blob where mvmnt_id = :P171_MVMNTID) loop',
'			htpprn(''v_row["WSQ_RT"] = "'' || nvl(base64encode(c_row.WSQ_RT), '''') || ''";'');',
'			htpprn(''v_row["WSQ_RI"] = "'' || nvl(base64encode(c_row.WSQ_RI), '''') || ''";'');',
'			htpprn(''v_row["WSQ_RM"] = "'' || nvl(base64encode(c_row.WSQ_RM), '''') || ''";'');',
'			htpprn(''v_row["WSQ_RR"] = "'' || nvl(base64encode(c_row.WSQ_RR), '''') || ''";'');',
'			htpprn(''v_row["WSQ_RL"] = "'' || nvl(base64encode(c_row.WSQ_RL), '''') || ''";'');',
'			htpprn(''v_row["WSQ_LT"] = "'' || nvl(base64encode(c_row.WSQ_LT), '''') || ''";'');',
'			htpprn(''v_row["WSQ_LI"] = "'' || nvl(base64encode(c_row.WSQ_LI), '''') || ''";'');',
'			htpprn(''v_row["WSQ_LM"] = "'' || nvl(base64encode(c_row.WSQ_LM), '''') || ''";'');',
'			htpprn(''v_row["WSQ_LR"] = "'' || nvl(base64encode(c_row.WSQ_LR), '''') || ''";'');',
'			htpprn(''v_row["WSQ_LL"] = "'' || nvl(base64encode(c_row.WSQ_LL), '''') || ''";'');',
'			--htpprn(''v_row["VISA_PAGE"] = "'' || nvl(base64encode(c_row.VISA_PAGE), '''') || ''";'');',
'			--htpprn(''v_row["LANDINGCARD_PAGE"] = "'' || nvl(base64encode(c_row.LANDINGCARD_PAGE), '''') || ''";'');',
'			htpprn(''v_row["LIVE_PHOTO"] = "'' || nvl(base64encode(c_row.LIVE_PHOTO), '''') || ''";'');',
'			htpprn(''v_row["PSBLOB_1"] = "'' || nvl(base64encode(c_row.PSBLOB_1), '''') || ''";'');',
'		end loop;',
'		htpprn(''v_row["DOCIMAGE_0"] = "";'');',
'		htpprn(''v_row["DOCIMAGE_1"] = "";'');',
'		htpprn(''v_row["DOCIMAGE_2"] = "";'');',
'		htpprn(''v_row["DOCIMAGE_3"] = "";'');',
'		htpprn(''v_row["DOCIMAGE_4"] = "";'');',
'		htpprn(''v_row["DOCIMAGE_5"] = "";'');',
'		htpprn(''v_row["DOCIMAGE_6"] = "";'');',
'        for c_row in (select seqno, image from borderdocimages where brddocid = (select brddocid from movements where mvmntid = :P171_MVMNTID)) loop',
'			htpprn(''v_row["DOCIMAGE_'' || c_row.seqno || ''"] = "'' || nvl(base64encode(c_row.image), '''') || ''";'');',
'		end loop;',
'		for c_row in (select * from borderdocuments where brddocid  = (select brddocid from movements where mvmntid = :P171_MVMNTID)) loop',
'			htpprn(''v_row["BRDDOCID"] = "'' || replace(replace(c_row.BRDDOCID, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["DOCTYPE"] = "'' || replace(replace(c_row.DOCTYPE, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["DOCNO"] = "'' || replace(replace(c_row.DOCNO, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["ISSUECTRY"] = "'' || replace(replace(c_row.ISSUECTRY, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["NAT"] = "'' || replace(replace(c_row.NAT, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["DOB"] = "'' || replace(replace(c_row.DOB, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["SEX"] = "'' || replace(replace(c_row.SEX, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["EXPIRYDATE"] = "'' || replace(replace(c_row.EXPIRYDATE, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["GIVENNAME"] = "'' || replace(replace(c_row.GIVENNAME, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["SURNAME"] = "'' || replace(replace(c_row.SURNAME, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["OPTIONALDATA"] = "'' || replace(replace(c_row.OPTIONALDATA, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["AFISID"] = "'' || replace(replace(c_row.AFISID, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["CREATED"] = "'' || replace(replace(c_row.CREATED, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["CREATED_BY"] = "'' || replace(replace(c_row.CREATED_BY, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["WORKSTATION_NAME"] = "'' || replace(replace(c_row.WORKSTATION_NAME, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["SERVER_ID"] = "'' || replace(replace(c_row.SERVER_ID, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["OFFICER_OBSERVATION"] = "'' || replace(replace(c_row.OFFICER_OBSERVATION, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["MRZDG1"] = "'' || replace(replace(c_row.MRZDG1, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["P_01"] = "'' || replace(replace(c_row.P_01, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["P_02"] = "'' || replace(replace(c_row.P_02, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["P_03"] = "'' || replace(replace(c_row.P_03, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["P_04"] = "'' || replace(replace(c_row.P_04, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["P_05"] = "'' || replace(replace(c_row.P_05, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'		end loop;',
'		for c_row in (select * from movements where mvmntid = :P171_MVMNTID) loop',
'			htpprn(''v_row["MVMNTID"] = "'' || replace(replace(c_row.MVMNTID, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["BRDDOCID"] = "'' || replace(replace(c_row.BRDDOCID, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["LANDBARCD"] = "'' || replace(replace(c_row.LANDBARCD, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["EXITFLG"] = "'' || replace(replace(c_row.EXITFLG, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["VISAEXPDT"] = "'' || replace(replace(c_row.VISAEXPDT, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["FINGERMATCH"] = "'' || replace(replace(c_row.FINGERMATCH, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["FACEMATCH"] = "'' || replace(replace(c_row.FACEMATCH, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["MVMNTADDR"] = "'' || replace(replace(c_row.MVMNTADDR, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["ORIDEST"] = "'' || replace(replace(c_row.ORIDEST, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["CREATED"] = "'' || replace(replace(c_row.CREATED, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["CREATED_BY"] = "'' || replace(replace(c_row.CREATED_BY, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["WORKSTATION_NAME"] = "'' || replace(replace(c_row.WORKSTATION_NAME, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["SERVER_ID"] = "'' || replace(replace(c_row.SERVER_ID, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["REFUSEDFLG"] = "'' || replace(replace(c_row.REFUSEDFLG, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["OBSERVATION"] = "'' || replace(replace(c_row.OBSERVATION, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["TRNSPRTUNITID"] = "'' || replace(replace(c_row.TRNSPRTUNITID, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["PSSNGRSTATUS"] = "'' || replace(replace(c_row.PSSNGRSTATUS, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			--htpprn(''v_row["RNKDSGNTDID"] = "'' || replace(replace(c_row.RNKDSGNTDID, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["SCANNED_FLIGHT"] = "'' || replace(replace(c_row.SCANNED_FLIGHT, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["VISA"] = "'' || replace(replace(c_row.VISA, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_1"] = "'' || replace(replace(c_row.PS_1, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_2"] = "'' || replace(replace(c_row.PS_2, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_3"] = "'' || replace(replace(c_row.PS_3, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_4"] = "'' || replace(replace(c_row.PS_4, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_5"] = "'' || replace(replace(c_row.PS_5, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_6"] = "'' || replace(replace(c_row.PS_6, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_7"] = "'' || replace(replace(c_row.PS_7, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_8"] = "'' || replace(replace(c_row.PS_8, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_9"] = "'' || replace(replace(c_row.PS_9, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["PS_10"] = "'' || replace(replace(c_row.PS_10, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["FINGERMATCH_HISTORY"] = "'' || replace(replace(c_row.FINGERMATCH_HISTORY, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["FACEMATC_HISTORY"] = "'' || replace(replace(c_row.FACEMATC_HISTORY, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["REASON_OFFLOAD"] = "'' || replace(replace(c_row.REASON_OFFLOAD, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'			htpprn(''v_row["REASON_DEPORTEE"] = "'' || replace(replace(c_row.REASON_DEPORTEE, ''\\'', '' \\\\''), ''"'', ''\\"'') ||  ''";'');',
'		end loop;',
'	exception when others then',
'		htpprn(''console.error("ERROR_FETCH_BLOB", "'' || replace(replace(DBMS_UTILITY.FORMAT_ERROR_STACK(), ''\'', ''\\''), ''"'', ''\"'') || ''", "'' || replace(replace(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE(), ''\'', ''\\''), ''"'', ''\"'') || ''");'');',
'	end;',
'	htpprn(''</script>'');',
'	--htpprn(''<script>console.log(v_row)</script>'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P171_MVMNTID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(137870475136874832)
,p_process_sequence=>40
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Images PIBICS PRD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    DL_BORDERCONTROL.PKG_APEX_UTIL.Get_Pibics_Image',
'    (',
'        p_COLLECTION_NAME => ''COLL_PIBICS_PASSPORT_IMAGE'',',
'        p_IMAGE_TYPE      => ''PASSPORT'',',
'        p_PK_VAL          => :P171_PERSONID',
'    );',
'    ',
'    DL_BORDERCONTROL.PKG_APEX_UTIL.Get_Pibics_Image',
'    (',
'        p_COLLECTION_NAME => ''COLL_PIBICS_MOVEMENT_IMAGE'',',
'        p_IMAGE_TYPE      => ''MOVEMENT'',',
'        p_PK_VAL          => :P171_DATA_SOURCE_SEC_PK_VAL,',
'        p_MVMNT_SRC       => REPLACE(:P171_DATA_SOURCE_SEC, ''_PRD'')',
'        ',
'    );',
'    ',
'    htp.prn(''<script>v_row = {};</script>'');',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P171_DATA_SOURCE = ''PIBICS''',
'AND :P171_CHECK_PIBICS_CONN = 1'))
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(137870800295874836)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init Collections'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    DL_BORDERCONTROL.PKG_APEX_UTIL.COLL_Init(''COLL_PIBICS_PASSPORT_IMAGE'');',
'    DL_BORDERCONTROL.PKG_APEX_UTIL.COLL_Init(''COLL_PIBICS_MOVEMENT_IMAGE'');',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(189140155685218990)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from V_M_D'
,p_attribute_02=>'V_M_D'
,p_attribute_03=>'P171_MVMNTID'
,p_attribute_04=>'MVMNTID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P171_DATA_SOURCE'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'BIO'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6936051721734821)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch BIO Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    SELECT ',
'        -- passport data',
'        surname',
'        , givenname',
'        , middlename',
'        , sex',
'        , dob',
'        , nationality',
'        , docno',
'        , docclass --doctype',
'        , issuectry',
'        , expirydate',
'        -- travel data',
'        , date_of_entry',
'        , exitflg',
'        , scanned_flight',
'        , DECODE(person_type, 2, ''Y'', ''N'')',
'        , visa_type',
'        , creation_date',
'        , TRIM(SUBSTR(ins_by, 1, INSTR(ins_by, '' '') - 1)) --ins_by',
'        , ins_borderpost',
'        , source_system',
'        -- visa data',
'        , visum_number',
'        , visa_type_name',
'        , visum_end',
'        , permit_type',
'        , permit_expiry_date',
'        -- travel card data',
'        , tm6_number',
'        , province',
'        --, district',
'        --, subdistrict',
'        --, lc_address',
'        , note',
'        -- exitflag',
'        , DECODE(exitflg, 1, ''Departure'', ''Arrival'')',
'    INTO ',
'        -- passport data',
'        :P171_NAME',
'        , :P171_GIVENNAME',
'        , :P171_MIDDLENAME',
'        , :P171_GENDER',
'        , :P171_DOB',
'        , :P171_NATIONALITY',
'        , :P171_DOCNUMBER',
'        , :P171_DOCTYPE',
'        , :P171_ISSUECTRY',
'        , :P171_EXPIRYDATE',
'        -- travel data',
'        , :P171_TRAVEL_DATE',
'        , :P171_DIRECTION',
'        , :P171_FLIGHT',
'        , :P171_IS_CREW',
'        , :P171_VISATYPE',
'        , :P171_INS_AT',
'        , :P171_INS_BY',
'        , :P171_SERVER_ID',
'        , :P171_MVMNT_SOURCE_SYSTEM',
'        -- visa data',
'        , :P171_VISUM_NUMBER',
'        , :P171_VISA_TYPE',
'        , :P171_VISUM_END',
'        , :P171_PERMIT_TYPE',
'        , :P171_PERMIT_EXPIRY_DATE',
'        -- travel card data',
'        , :P171_TM6_NUMBER',
'        , :P171_PROVINCE',
'        --, :P171_AMPUR',
'        --, :P171_TAMBON',
'        --, :P171_LC_ADDRESS',
'        , :P171_NOTE',
'        -- exitflag',
'        , :P171_EXITFLG_DISPLAY',
'    FROM dl_bordercontrol.v_m_d',
'    WHERE mvmntid = :P171_MVMNTID;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P171_DATA_SOURCE'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'BIO'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6936229750734823)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch PIBICS Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_data_src            VARCHAR2(50) := :P171_DATA_SOURCE;',
'    l_data_src_sec        VARCHAR2(50) := :P171_DATA_SOURCE_SEC;',
'    l_data_src_sec_pk_val VARCHAR2(100) := :P171_DATA_SOURCE_SEC_PK_VAL;',
'    ',
'    l_locale              VARCHAR2(10) := DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();',
'BEGIN',
'',
'    IF l_data_src_sec_pk_val IS NULL THEN ',
'        RETURN;',
'    END IF;',
'    ',
'    IF l_data_src_sec = ''TMINOUT_MA'' THEN',
'        SELECT ',
'            -- passport data',
'            efamilynm',
'            , efirstnm',
'            , emiddlenm',
'            , DECODE(SUBSTR(UPPER(sex), 1, 1), ''M'', 1, ''F'', 2, sex)',
'            , birthdte',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd)',
'            , tdtno',
'            , tdtcd --(SELECT NVL(display_value, display_value$dlc) FROM dl_common.bc_doc_class$lc WHERE key_value = v.tdtcd)',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd)',
'            , passportexpdte',
'            -- travel data',
'            , TO_CHAR(inoutdte, ''DD/MM/YYYY HH24:MI'')',
'            , DECODE(cardtype, 1, 0, 2, 1, cardtype)',
'            , NVL(TRIM(flightprefix || '' '' || flightnumber), convregno)',
'            , DECODE(visatypecd, ''0023'', ''Y'', ''N'')',
'            , visatypecd',
'            , TO_CHAR(create_date, ''DD/MM/YYYY HH24:MI'')',
'            , UPPER(create_by)',
'            , (',
'                SELECT DECODE(l_locale, ''th_TH'', depttnm, deptenm)',
'                FROM dl_bordercontrol.v_department',
'                WHERE dept_seqno = v.dept_seqno',
'              )',
'            , DECODE(typedata, ''ATC'', 3, 2)',
'            -- visa data',
'            , NULL',
'            , visatypecd',
'            , visaexpdte',
'            , permit_seqno',
'            , newpermit - 1',
'            -- travel card data',
'            , tm6no',
'            , (',
'                  SELECT acp.key_value',
'                  FROM dl_bordercontrol.v_province vp,',
'                  dl_bordercontrol.adm_class_province acp',
'                  WHERE vp.pv_seqno = v.pv_seqno',
'                  AND acp.display_code = vp.pvcd',
'              ) PROVINCE',
'            --, NULL',
'            --, NULL',
'            --, NULL',
'            , remark',
'            -- exitflag',
'            , DECODE(cardtype, 2, ''Departure'', ''Arrival'')',
'            , personid',
'        INTO ',
'            -- passport data',
'            :P171_NAME',
'            , :P171_GIVENNAME',
'            , :P171_MIDDLENAME',
'            , :P171_GENDER',
'            , :P171_DOB',
'            , :P171_NATIONALITY',
'            , :P171_DOCNUMBER',
'            , :P171_DOCTYPE',
'            , :P171_ISSUECTRY',
'            , :P171_EXPIRYDATE',
'            -- travel data',
'            , :P171_TRAVEL_DATE',
'            , :P171_DIRECTION',
'            , :P171_FLIGHT',
'            , :P171_IS_CREW',
'            , :P171_VISATYPE',
'            , :P171_INS_AT',
'            , :P171_INS_BY',
'            , :P171_SERVER_ID',
'            , :P171_MVMNT_SOURCE_SYSTEM',
'            -- visa data',
'            , :P171_VISUM_NUMBER',
'            , :P171_VISA_TYPE',
'            , :P171_VISUM_END',
'            , :P171_PERMIT_TYPE',
'            , :P171_PERMIT_EXPIRY_DATE',
'            -- travel card data',
'            , :P171_TM6_NUMBER',
'            , :P171_PROVINCE',
'            --, :P171_AMPUR',
'            --, :P171_TAMBON',
'            --, :P171_LC_ADDRESS',
'            , :P171_NOTE',
'            -- exitflag',
'            , :P171_EXITFLG_DISPLAY',
'            , :P171_PERSONID',
'        FROM dl_bordercontrol.v_tminout_ma v',
'        WHERE seqno = l_data_src_sec_pk_val;',
'    ELSIF l_data_src_sec = ''TMINOUT'' THEN',
'        SELECT ',
'            -- passport data',
'            efamilynm',
'            , efirstnm',
'            , emiddlenm',
'            , DECODE(SUBSTR(UPPER(sex), 1, 1), ''M'', 1, ''F'', 2, sex)',
'            , birthdte',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , tdtno',
'            , tdtcd --(SELECT NVL(display_value, display_value$dlc) FROM dl_common.bc_doc_class$lc WHERE key_value = tdtcd)',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , passportexpdte',
'            -- travel data',
'            , TO_CHAR(inoutdte, ''DD/MM/YYYY HH24:MI'')',
'            , DECODE(cardtype, 1, 0, 2, 1, cardtype)',
'            , NVL(TRIM(flightprefix || '' '' || flightnumber), convregno)',
'            , DECODE(visatypecd, ''0023'', ''Y'', ''N'')',
'            , visatypecd',
'            , TO_CHAR(create_date, ''DD/MM/YYYY HH24:MI'')',
'            , UPPER(create_by)',
'            , (',
'                SELECT DECODE(l_locale, ''th_TH'', depttnm, deptenm)',
'                FROM dl_bordercontrol.v_department',
'                WHERE dept_seqno = v.dept_seqno',
'              )',
'            , DECODE(typedata, ''ATC'', 3, 2)',
'            -- visa data',
'            , NULL',
'            , visatypecd',
'            , visaexpdte',
'            , permit_seqno',
'            , newpermit - 1',
'            -- travel card data',
'            , tm6no',
'            , (',
'                  SELECT acp.key_value',
'                  FROM dl_bordercontrol.v_province vp,',
'                  dl_bordercontrol.adm_class_province acp',
'                  WHERE vp.pv_seqno = v.pv_seqno',
'                  AND acp.display_code = vp.pvcd',
'              ) PROVINCE',
'            --, NULL',
'            --, NULL',
'            --, NULL',
'            , remark',
'            -- exitflag',
'            , DECODE(cardtype, 2, ''Departure'', ''Arrival'')',
'            , personid',
'        INTO ',
'            -- passport data',
'            :P171_NAME',
'            , :P171_GIVENNAME',
'            , :P171_MIDDLENAME',
'            , :P171_GENDER',
'            , :P171_DOB',
'            , :P171_NATIONALITY',
'            , :P171_DOCNUMBER',
'            , :P171_DOCTYPE',
'            , :P171_ISSUECTRY',
'            , :P171_EXPIRYDATE',
'            -- travel data',
'            , :P171_TRAVEL_DATE',
'            , :P171_DIRECTION',
'            , :P171_FLIGHT',
'            , :P171_IS_CREW',
'            , :P171_VISATYPE',
'            , :P171_INS_AT',
'            , :P171_INS_BY',
'            , :P171_SERVER_ID',
'            , :P171_MVMNT_SOURCE_SYSTEM',
'            -- visa data',
'            , :P171_VISUM_NUMBER',
'            , :P171_VISA_TYPE',
'            , :P171_VISUM_END',
'            , :P171_PERMIT_TYPE',
'            , :P171_PERMIT_EXPIRY_DATE',
'            -- travel card data',
'            , :P171_TM6_NUMBER',
'            , :P171_PROVINCE',
'            --, :P171_AMPUR',
'            --, :P171_TAMBON',
'            --, :P171_LC_ADDRESS',
'            , :P171_NOTE',
'            -- exitflag',
'            , :P171_EXITFLG_DISPLAY',
'            , :P171_PERSONID',
'        FROM dl_bordercontrol.v_tminout v',
'        WHERE seqno = l_data_src_sec_pk_val;',
'    ELSIF l_data_src_sec = ''TMMAIN_IN'' THEN',
'        SELECT ',
'            -- passport data',
'            efamilynm',
'            , efirstnm',
'            , emiddlenm',
'            , DECODE(SUBSTR(UPPER(sex), 1, 1), ''M'', 1, ''F'', 2, sex)',
'            , birthdte',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , intdtno',
'            , intdtcd --(SELECT NVL(display_value, display_value$dlc) FROM dl_common.bc_doc_class$lc WHERE key_value = intdtcd)',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , inpassportexpdte',
'            -- travel data',
'            , TO_CHAR(indte, ''DD/MM/YYYY HH24:MI'')',
'            , 0',
'            , NVL(TRIM(inflightprefix || '' '' || inflightnumber), inconvregno)',
'            , DECODE(invisatypecd, ''0023'', ''Y'', ''N'')',
'            , invisatypecd',
'            , TO_CHAR(incredte, ''DD/MM/YYYY HH24:MI'')',
'            , UPPER(increusr)',
'            , (',
'                SELECT DECODE(l_locale, ''th_TH'', depttnm, deptenm)',
'                FROM dl_bordercontrol.v_department',
'                WHERE dept_seqno = v.indept_seqno',
'              )',
'            , DECODE(typedata, ''ATC'', 3, 2)',
'            -- visa data',
'            , visano',
'            , invisatypecd',
'            , invisaexpdte',
'            , inpermit_seqno',
'            , inpermitdte',
'            -- travel card data',
'            , intm6no',
'            , (',
'                  SELECT acp.key_value',
'                  FROM dl_bordercontrol.v_province vp,',
'                  dl_bordercontrol.adm_class_province acp',
'                  WHERE vp.pv_seqno = v.pv_seqno',
'                  AND acp.display_code = vp.pvcd',
'              ) PROVINCE',
'            --, NULL',
'            --, NULL',
'            --, NULL',
'            , inremark',
'            -- exitflag',
'            , ''Arrival''',
'            , personid',
'        INTO ',
'            -- passport data',
'            :P171_NAME',
'            , :P171_GIVENNAME',
'            , :P171_MIDDLENAME',
'            , :P171_GENDER',
'            , :P171_DOB',
'            , :P171_NATIONALITY',
'            , :P171_DOCNUMBER',
'            , :P171_DOCTYPE',
'            , :P171_ISSUECTRY',
'            , :P171_EXPIRYDATE',
'            -- travel data',
'            , :P171_TRAVEL_DATE',
'            , :P171_DIRECTION',
'            , :P171_FLIGHT',
'            , :P171_IS_CREW',
'            , :P171_VISATYPE',
'            , :P171_INS_AT',
'            , :P171_INS_BY',
'            , :P171_SERVER_ID',
'            , :P171_MVMNT_SOURCE_SYSTEM',
'            -- visa data',
'            , :P171_VISUM_NUMBER',
'            , :P171_VISA_TYPE',
'            , :P171_VISUM_END',
'            , :P171_PERMIT_TYPE',
'            , :P171_PERMIT_EXPIRY_DATE',
'            -- travel card data',
'            , :P171_TM6_NUMBER',
'            , :P171_PROVINCE',
'            --, :P171_AMPUR',
'            --, :P171_TAMBON',
'            --, :P171_LC_ADDRESS',
'            , :P171_NOTE',
'            -- exitflag',
'            , :P171_EXITFLG_DISPLAY',
'            , :P171_PERSONID',
'        FROM dl_bordercontrol.v_tmmain v',
'        WHERE tmrunno = l_data_src_sec_pk_val;',
'    ELSIF l_data_src_sec = ''TMMAIN_OUT'' THEN',
'        SELECT ',
'            -- passport data',
'            efamilynm',
'            , efirstnm',
'            , emiddlenm',
'            , DECODE(SUBSTR(UPPER(sex), 1, 1), ''M'', 1, ''F'', 2, sex)',
'            , birthdte',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , outtdtno',
'            , outtdtcd --(SELECT NVL(display_value, display_value$dlc) FROM dl_common.bc_doc_class$lc WHERE key_value = outtdtcd)',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , outpassportexpdte',
'            -- travel data',
'            , TO_CHAR(outdte, ''DD/MM/YYYY HH24:MI'')',
'            , 1',
'            , NVL(TRIM(outflightprefix || '' '' || outflightnumber), outconvregno)',
'            , DECODE(outvisatypecd, ''0023'', ''Y'', ''N'')',
'            , outvisatypecd',
'            , TO_CHAR(outcredte, ''DD/MM/YYYY HH24:MI'')',
'            , UPPER(outcreusr)',
'            , (',
'                SELECT DECODE(l_locale, ''th_TH'', depttnm, deptenm)',
'                FROM dl_bordercontrol.v_department',
'                WHERE dept_seqno = v.outdept_seqno',
'              )',
'            , DECODE(typedata, ''ATC'', 3, 2)',
'            -- visa data',
'            , visano',
'            , outvisatypecd',
'            , outvisaexpdte',
'            , outpermit_seqno',
'            , outpermitdte',
'            -- travel card data',
'            , outtm6no',
'            , (',
'                  SELECT acp.key_value',
'                  FROM dl_bordercontrol.v_province vp,',
'                  dl_bordercontrol.adm_class_province acp',
'                  WHERE vp.pv_seqno = v.pv_seqno',
'                  AND acp.display_code = vp.pvcd',
'              ) PROVINCE',
'            --, NULL',
'            --, NULL',
'            --, NULL',
'            , outremark',
'            -- exitflag',
'            , ''Departure''',
'            , personid',
'        INTO ',
'            -- passport data',
'            :P171_NAME',
'            , :P171_GIVENNAME',
'            , :P171_MIDDLENAME',
'            , :P171_GENDER',
'            , :P171_DOB',
'            , :P171_NATIONALITY',
'            , :P171_DOCNUMBER',
'            , :P171_DOCTYPE',
'            , :P171_ISSUECTRY',
'            , :P171_EXPIRYDATE',
'            -- travel data',
'            , :P171_TRAVEL_DATE',
'            , :P171_DIRECTION',
'            , :P171_FLIGHT',
'            , :P171_IS_CREW',
'            , :P171_VISATYPE',
'            , :P171_INS_AT',
'            , :P171_INS_BY',
'            , :P171_SERVER_ID',
'            , :P171_MVMNT_SOURCE_SYSTEM',
'            -- visa data',
'            , :P171_VISUM_NUMBER',
'            , :P171_VISA_TYPE',
'            , :P171_VISUM_END',
'            , :P171_PERMIT_TYPE',
'            , :P171_PERMIT_EXPIRY_DATE',
'            -- travel card data',
'            , :P171_TM6_NUMBER',
'            , :P171_PROVINCE',
'            --, :P171_AMPUR',
'            --, :P171_TAMBON',
'            --, :P171_LC_ADDRESS',
'            , :P171_NOTE',
'            -- exitflag',
'            , :P171_EXITFLG_DISPLAY',
'            , :P171_PERSONID',
'        FROM dl_bordercontrol.v_tmmain v',
'        WHERE tmrunno = l_data_src_sec_pk_val;',
'    END IF;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P171_DATA_SOURCE = ''PIBICS''',
'AND :P171_DATA_SOURCE_SEC NOT LIKE ''%PRD'''))
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(137869557689874823)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch PIBICS PRD Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_data_src            VARCHAR2(50) := :P171_DATA_SOURCE;',
'    l_data_src_sec        VARCHAR2(50) := :P171_DATA_SOURCE_SEC;',
'    l_data_src_sec_pk_val VARCHAR2(100) := :P171_DATA_SOURCE_SEC_PK_VAL;',
'    ',
'    l_locale              VARCHAR2(10) := DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();',
'BEGIN',
'',
'    IF l_data_src_sec_pk_val IS NULL THEN ',
'        RETURN;',
'    END IF;',
'    ',
'    IF l_data_src_sec = ''TMINOUT_MA_PRD'' THEN',
'        SELECT ',
'            -- passport data',
'            efamilynm',
'            , efirstnm',
'            , emiddlenm',
'            , DECODE(SUBSTR(UPPER(sex), 1, 1), ''M'', 1, ''F'', 2, sex)',
'            , birthdte',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd)',
'            , tdtno',
'            , tdtcd --(SELECT NVL(display_value, display_value$dlc) FROM dl_common.bc_doc_class$lc WHERE key_value = v.tdtcd)',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd)',
'            , passportexpdte',
'            -- travel data',
'            , TO_CHAR(inoutdte, ''DD/MM/YYYY HH24:MI'')',
'            , DECODE(cardtype, 1, 0, 2, 1, cardtype)',
'            , NVL(TRIM(flightprefix || '' '' || flightnumber), convregno)',
'            , DECODE(visatypecd, ''0023'', ''Y'', ''N'')',
'            , visatypecd',
'            , TO_CHAR(create_date, ''DD/MM/YYYY HH24:MI'')',
'            , UPPER(create_by)',
'            , (',
'                SELECT DECODE(l_locale, ''th_TH'', depttnm, deptenm)',
'                FROM dl_bordercontrol.v_department',
'                WHERE dept_seqno = v.dept_seqno',
'              )',
'            , DECODE(typedata, ''ATC'', 3, 2)',
'            -- visa data',
'            , NULL',
'            , visatypecd',
'            , visaexpdte',
'            , permit_seqno',
'            , newpermit - 1',
'            -- travel card data',
'            , tm6no',
'            , (',
'                  SELECT acp.key_value',
'                  FROM dl_bordercontrol.v_province vp,',
'                  dl_bordercontrol.adm_class_province acp',
'                  WHERE vp.pv_seqno = v.pv_seqno',
'                  AND acp.display_code = vp.pvcd',
'              ) PROVINCE',
'            --, NULL',
'            --, NULL',
'            --, NULL',
'            , remark',
'            -- exitflag',
'            , DECODE(cardtype, 2, ''Departure'', ''Arrival'')',
'            , personid',
'        INTO ',
'            -- passport data',
'            :P171_NAME',
'            , :P171_GIVENNAME',
'            , :P171_MIDDLENAME',
'            , :P171_GENDER',
'            , :P171_DOB',
'            , :P171_NATIONALITY',
'            , :P171_DOCNUMBER',
'            , :P171_DOCTYPE',
'            , :P171_ISSUECTRY',
'            , :P171_EXPIRYDATE',
'            -- travel data',
'            , :P171_TRAVEL_DATE',
'            , :P171_DIRECTION',
'            , :P171_FLIGHT',
'            , :P171_IS_CREW',
'            , :P171_VISATYPE',
'            , :P171_INS_AT',
'            , :P171_INS_BY',
'            , :P171_SERVER_ID',
'            , :P171_MVMNT_SOURCE_SYSTEM',
'            -- visa data',
'            , :P171_VISUM_NUMBER',
'            , :P171_VISA_TYPE',
'            , :P171_VISUM_END',
'            , :P171_PERMIT_TYPE',
'            , :P171_PERMIT_EXPIRY_DATE',
'            -- travel card data',
'            , :P171_TM6_NUMBER',
'            , :P171_PROVINCE',
'            --, :P171_AMPUR',
'            --, :P171_TAMBON',
'            --, :P171_LC_ADDRESS',
'            , :P171_NOTE',
'            -- exitflag',
'            , :P171_EXITFLG_DISPLAY',
'            , :P171_PERSONID',
'        FROM dl_bordercontrol.v_tminout_ma_1hr_prod v',
'        WHERE seqno = l_data_src_sec_pk_val;',
'    ELSIF l_data_src_sec = ''TMINOUT_PRD'' THEN',
'        SELECT ',
'            -- passport data',
'            efamilynm',
'            , efirstnm',
'            , emiddlenm',
'            , DECODE(SUBSTR(UPPER(sex), 1, 1), ''M'', 1, ''F'', 2, sex)',
'            , birthdte',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , tdtno',
'            , tdtcd --(SELECT NVL(display_value, display_value$dlc) FROM dl_common.bc_doc_class$lc WHERE key_value = tdtcd)',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , passportexpdte',
'            -- travel data',
'            , TO_CHAR(inoutdte, ''DD/MM/YYYY HH24:MI'')',
'            , DECODE(cardtype, 1, 0, 2, 1, cardtype)',
'            , NVL(TRIM(flightprefix || '' '' || flightnumber), convregno)',
'            , DECODE(visatypecd, ''0023'', ''Y'', ''N'')',
'            , visatypecd',
'            , TO_CHAR(create_date, ''DD/MM/YYYY HH24:MI'')',
'            , UPPER(create_by)',
'            , (',
'                SELECT DECODE(l_locale, ''th_TH'', depttnm, deptenm)',
'                FROM dl_bordercontrol.v_department',
'                WHERE dept_seqno = v.dept_seqno',
'              )',
'            , DECODE(typedata, ''ATC'', 3, 2)',
'            -- visa data',
'            , NULL',
'            , visatypecd',
'            , visaexpdte',
'            , permit_seqno',
'            , newpermit - 1',
'            -- travel card data',
'            , tm6no',
'            , (',
'                  SELECT acp.key_value',
'                  FROM dl_bordercontrol.v_province vp,',
'                  dl_bordercontrol.adm_class_province acp',
'                  WHERE vp.pv_seqno = v.pv_seqno',
'                  AND acp.display_code = vp.pvcd',
'              ) PROVINCE',
'            --, NULL',
'            --, NULL',
'            --, NULL',
'            , remark',
'            -- exitflag',
'            , DECODE(cardtype, 2, ''Departure'', ''Arrival'')',
'            , personid',
'        INTO ',
'            -- passport data',
'            :P171_NAME',
'            , :P171_GIVENNAME',
'            , :P171_MIDDLENAME',
'            , :P171_GENDER',
'            , :P171_DOB',
'            , :P171_NATIONALITY',
'            , :P171_DOCNUMBER',
'            , :P171_DOCTYPE',
'            , :P171_ISSUECTRY',
'            , :P171_EXPIRYDATE',
'            -- travel data',
'            , :P171_TRAVEL_DATE',
'            , :P171_DIRECTION',
'            , :P171_FLIGHT',
'            , :P171_IS_CREW',
'            , :P171_VISATYPE',
'            , :P171_INS_AT',
'            , :P171_INS_BY',
'            , :P171_SERVER_ID',
'            , :P171_MVMNT_SOURCE_SYSTEM',
'            -- visa data',
'            , :P171_VISUM_NUMBER',
'            , :P171_VISA_TYPE',
'            , :P171_VISUM_END',
'            , :P171_PERMIT_TYPE',
'            , :P171_PERMIT_EXPIRY_DATE',
'            -- travel card data',
'            , :P171_TM6_NUMBER',
'            , :P171_PROVINCE',
'            --, :P171_AMPUR',
'            --, :P171_TAMBON',
'            --, :P171_LC_ADDRESS',
'            , :P171_NOTE',
'            -- exitflag',
'            , :P171_EXITFLG_DISPLAY',
'            , :P171_PERSONID',
'        FROM dl_bordercontrol.v_tminout_1hr_prod v',
'        WHERE seqno = l_data_src_sec_pk_val;',
'    ELSIF l_data_src_sec = ''TMMAIN_IN_PRD'' THEN',
'        SELECT ',
'            -- passport data',
'            efamilynm',
'            , efirstnm',
'            , emiddlenm',
'            , DECODE(SUBSTR(UPPER(sex), 1, 1), ''M'', 1, ''F'', 2, sex)',
'            , birthdte',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , intdtno',
'            , intdtcd --(SELECT NVL(display_value, display_value$dlc) FROM dl_common.bc_doc_class$lc WHERE key_value = intdtcd)',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , inpassportexpdte',
'            -- travel data',
'            , TO_CHAR(indte, ''DD/MM/YYYY HH24:MI'')',
'            , 0',
'            , NVL(TRIM(inflightprefix || '' '' || inflightnumber), inconvregno)',
'            , DECODE(invisatypecd, ''0023'', ''Y'', ''N'')',
'            , invisatypecd',
'            , TO_CHAR(incredte, ''DD/MM/YYYY HH24:MI'')',
'            , UPPER(increusr)',
'            , (',
'                SELECT DECODE(l_locale, ''th_TH'', depttnm, deptenm)',
'                FROM dl_bordercontrol.v_department',
'                WHERE dept_seqno = v.indept_seqno',
'              )',
'            , DECODE(typedata, ''ATC'', 3, 2)',
'            -- visa data',
'            , visano',
'            , invisatypecd',
'            , invisaexpdte',
'            , inpermit_seqno',
'            , inpermitdte',
'            -- travel card data',
'            , intm6no',
'            , (',
'                  SELECT acp.key_value',
'                  FROM dl_bordercontrol.v_province vp,',
'                  dl_bordercontrol.adm_class_province acp',
'                  WHERE vp.pv_seqno = v.pv_seqno',
'                  AND acp.display_code = vp.pvcd',
'              ) PROVINCE',
'            --, NULL',
'            --, NULL',
'            --, NULL',
'            , inremark',
'            -- exitflag',
'            , ''Arrival''',
'            , personid',
'        INTO ',
'            -- passport data',
'            :P171_NAME',
'            , :P171_GIVENNAME',
'            , :P171_MIDDLENAME',
'            , :P171_GENDER',
'            , :P171_DOB',
'            , :P171_NATIONALITY',
'            , :P171_DOCNUMBER',
'            , :P171_DOCTYPE',
'            , :P171_ISSUECTRY',
'            , :P171_EXPIRYDATE',
'            -- travel data',
'            , :P171_TRAVEL_DATE',
'            , :P171_DIRECTION',
'            , :P171_FLIGHT',
'            , :P171_IS_CREW',
'            , :P171_VISATYPE',
'            , :P171_INS_AT',
'            , :P171_INS_BY',
'            , :P171_SERVER_ID',
'            , :P171_MVMNT_SOURCE_SYSTEM',
'            -- visa data',
'            , :P171_VISUM_NUMBER',
'            , :P171_VISA_TYPE',
'            , :P171_VISUM_END',
'            , :P171_PERMIT_TYPE',
'            , :P171_PERMIT_EXPIRY_DATE',
'            -- travel card data',
'            , :P171_TM6_NUMBER',
'            , :P171_PROVINCE',
'            --, :P171_AMPUR',
'            --, :P171_TAMBON',
'            --, :P171_LC_ADDRESS',
'            , :P171_NOTE',
'            -- exitflag',
'            , :P171_EXITFLG_DISPLAY',
'            , :P171_PERSONID',
'        FROM dl_bordercontrol.v_tmmain_in_1hr_prod v',
'        WHERE tmrunno = l_data_src_sec_pk_val;',
'    ELSIF l_data_src_sec = ''TMMAIN_OUT_PRD'' THEN',
'        SELECT ',
'            -- passport data',
'            efamilynm',
'            , efirstnm',
'            , emiddlenm',
'            , DECODE(SUBSTR(UPPER(sex), 1, 1), ''M'', 1, ''F'', 2, sex)',
'            , birthdte',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , outtdtno',
'            , outtdtcd --(SELECT NVL(display_value, display_value$dlc) FROM dl_common.bc_doc_class$lc WHERE key_value = outtdtcd)',
'            , (SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = nationcd)',
'            , outpassportexpdte',
'            -- travel data',
'            , TO_CHAR(outdte, ''DD/MM/YYYY HH24:MI'')',
'            , 1',
'            , NVL(TRIM(outflightprefix || '' '' || outflightnumber), outconvregno)',
'            , DECODE(outvisatypecd, ''0023'', ''Y'', ''N'')',
'            , outvisatypecd',
'            , TO_CHAR(outcredte, ''DD/MM/YYYY HH24:MI'')',
'            , UPPER(outcreusr)',
'            , (',
'                SELECT DECODE(l_locale, ''th_TH'', depttnm, deptenm)',
'                FROM dl_bordercontrol.v_department',
'                WHERE dept_seqno = v.outdept_seqno',
'              )',
'            , DECODE(typedata, ''ATC'', 3, 2)',
'            -- visa data',
'            , visano',
'            , outvisatypecd',
'            , outvisaexpdte',
'            , outpermit_seqno',
'            , outpermitdte',
'            -- travel card data',
'            , outtm6no',
'            , (',
'                  SELECT acp.key_value',
'                  FROM dl_bordercontrol.v_province vp,',
'                  dl_bordercontrol.adm_class_province acp',
'                  WHERE vp.pv_seqno = v.pv_seqno',
'                  AND acp.display_code = vp.pvcd',
'              ) PROVINCE',
'            --, NULL',
'            --, NULL',
'            --, NULL',
'            , outremark',
'            -- exitflag',
'            , ''Departure''',
'            , personid',
'        INTO ',
'            -- passport data',
'            :P171_NAME',
'            , :P171_GIVENNAME',
'            , :P171_MIDDLENAME',
'            , :P171_GENDER',
'            , :P171_DOB',
'            , :P171_NATIONALITY',
'            , :P171_DOCNUMBER',
'            , :P171_DOCTYPE',
'            , :P171_ISSUECTRY',
'            , :P171_EXPIRYDATE',
'            -- travel data',
'            , :P171_TRAVEL_DATE',
'            , :P171_DIRECTION',
'            , :P171_FLIGHT',
'            , :P171_IS_CREW',
'            , :P171_VISATYPE',
'            , :P171_INS_AT',
'            , :P171_INS_BY',
'            , :P171_SERVER_ID',
'            , :P171_MVMNT_SOURCE_SYSTEM',
'            -- visa data',
'            , :P171_VISUM_NUMBER',
'            , :P171_VISA_TYPE',
'            , :P171_VISUM_END',
'            , :P171_PERMIT_TYPE',
'            , :P171_PERMIT_EXPIRY_DATE',
'            -- travel card data',
'            , :P171_TM6_NUMBER',
'            , :P171_PROVINCE',
'            --, :P171_AMPUR',
'            --, :P171_TAMBON',
'            --, :P171_LC_ADDRESS',
'            , :P171_NOTE',
'            -- exitflag',
'            , :P171_EXITFLG_DISPLAY',
'            , :P171_PERSONID',
'        FROM dl_bordercontrol.v_tmmain_out_1hr_prod v',
'        WHERE tmrunno = l_data_src_sec_pk_val;',
'    END IF;',
'    ',
'    -- complete db transaction',
'    COMMIT;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P171_DATA_SOURCE = ''PIBICS''',
'AND :P171_DATA_SOURCE_SEC LIKE ''%PRD'''))
,p_process_when_type=>'SQL_EXPRESSION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4686928356939369029)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Thai Passport Info'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT tfamilynm, tfirstnm || NVL2(tmiddlenm, '' '' || tmiddlenm, NULL), citizenid',
'    INTO :P171_NAME_THAI, :P171_GIVENNAME_THAI, :P171_CITIZEN_ID',
'    FROM dl_bordercontrol.v_thaipassport',
'    WHERE passportno = :P171_DOCNUMBER;',
'EXCEPTION',
'    WHEN no_data_found THEN',
'        :P171_NAME_THAI := NULL;',
'        :P171_GIVENNAME_THAI := NULL;',
'        :P171_CITIZEN_ID := NULL;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P171_NATIONALITY = ''THA''',
'AND NVL(:P171_DOCTYPE, 1) = 1'))
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4686928795326369033)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Last Edit Info'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT note, ins_at, ins_by',
'    INTO :P171_LAST_EDIT_REMARK, :P171_LAST_EDIT_DATE, :P171_LAST_EDIT_BY',
'    FROM ',
'    (',
'        SELECT note, TO_CHAR(ins_at, ''DD/MM/YYYY HH24:MI'') INS_AT, TRIM(SUBSTR(ins_by, 1, INSTR(ins_by, '' '') - 1)) INS_BY, ROW_NUMBER() OVER (ORDER BY ins_at DESC) RN',
'        FROM dl_bordercontrol.mscs_movements_manual_update',
'        WHERE mvmntid = :P171_MVMNTID',
'    )',
'    WHERE RN = 1;',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'        :P171_LAST_EDIT_DATE := NULL;',
'        :P171_LAST_EDIT_BY := NULL;',
'        :P171_LAST_EDIT_REMARK := NULL;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P171_DATA_SOURCE'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'BIO'
);
end;
/
