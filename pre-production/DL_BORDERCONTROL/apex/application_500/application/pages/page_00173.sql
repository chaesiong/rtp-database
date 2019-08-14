prompt --application/pages/page_00173
begin
wwv_flow_api.create_page(
 p_id=>173
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Movement Detail Base64'
,p_page_mode=>'NORMAL'
,p_step_title=>'Movement Detail Base64'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Movement Detail Base64'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#jQueryRotate.js',
'#WORKSPACE_IMAGES#fotorama.js',
'#WORKSPACE_IMAGES#MovementDetail.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
'#APP_IMAGES#MovementDetails.js',
''))
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
'showDetails();',
'',
'$("#ID_REG_HIDDEN").hide();',
'',
'',
'var $fotoramaDiv = $(''#fotorama'').fotorama();',
'var fotorama = $fotoramaDiv.data(''fotorama'');',
'',
'if ($(''#P171_PASS_VISUALPAGE'').length > 0)',
'fotorama.push({img: $(''#P171_PASS_VISUALPAGE'').attr(''src''), thumb: $(''#P171_PASS_VISUALPAGE'').attr(''src''), caption: ''Passport''});',
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
'(function() {',
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
'})();',
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
'var url = "../JasperReportsIntegration/report?_repName=TravelHistory_Person&_repFormat=pdf&_dataSource=default&_outFilename=&_repLocale=&_repEncoding=&_printIsEnabled=&_printPrinterName=&_printPrinterTray=&_printCopies=&_printDuplex=&_printCollate=&_'
||'saveIsEnabled=&_saveFileName=&P_BRDDOCID=&P171_BRDDOCID.";',
'',
'  $("#pdfrenderer").attr("href", url + "#zoom=85");',
'  $("#pdfrendererobject").attr("data", url + "#zoom=85");',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#fotorama.css',
'#WORKSPACE_IMAGES#MovementDetail.css'))
,p_page_css_classes=>'css_white_background'
,p_dialog_height=>'980'
,p_dialog_width=>'1000'
,p_dialog_css_classes=>'css_white_background'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190113073636'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960894033204356241)
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
 p_id=>wwv_flow_api.id(960900324031356302)
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
 p_id=>wwv_flow_api.id(960902324985356346)
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
 p_id=>wwv_flow_api.id(960906653681356365)
,p_plug_name=>'Fingerprints'
,p_parent_plug_id=>wwv_flow_api.id(960902324985356346)
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
 p_id=>wwv_flow_api.id(960911048576356391)
,p_plug_name=>'Form on V_M_D photo'
,p_parent_plug_id=>wwv_flow_api.id(960902324985356346)
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
 p_id=>wwv_flow_api.id(960912258115356402)
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
 p_id=>wwv_flow_api.id(960912654130356406)
,p_plug_name=>'Print PDF'
,p_parent_plug_id=>wwv_flow_api.id(960912258115356402)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--<div>',
'    --><object id="pdfrendererobject" type="application/pdf" width="100%" height="760" style="border: 1px solid rgba(0, 0, 0, 0.15);">',
'        alt : <a id="pdfrenderer" ></a>',
'    </object><!--',
'</div>-->'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960913068566356409)
,p_plug_name=>'Deport'
,p_parent_plug_id=>wwv_flow_api.id(960912258115356402)
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
 p_id=>wwv_flow_api.id(960913417269356411)
,p_plug_name=>'Deport this Movement'
,p_parent_plug_id=>wwv_flow_api.id(960913068566356409)
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
 p_id=>wwv_flow_api.id(960913810034356418)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(960913068566356409)
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
 p_id=>wwv_flow_api.id(960915023629356424)
,p_plug_name=>'Main Data'
,p_parent_plug_id=>wwv_flow_api.id(960912258115356402)
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
 p_id=>wwv_flow_api.id(960915376213356428)
,p_plug_name=>'COL_LEFT'
,p_parent_plug_id=>wwv_flow_api.id(960915023629356424)
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
 p_id=>wwv_flow_api.id(960915859434356430)
,p_plug_name=>'Passport Information'
,p_parent_plug_id=>wwv_flow_api.id(960915376213356428)
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
 p_id=>wwv_flow_api.id(960916267896356433)
,p_plug_name=>'Passport Data'
,p_parent_plug_id=>wwv_flow_api.id(960915376213356428)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning'
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
 p_id=>wwv_flow_api.id(960921355904356458)
,p_plug_name=>'COL_RIGHT'
,p_parent_plug_id=>wwv_flow_api.id(960915023629356424)
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
 p_id=>wwv_flow_api.id(960921699931356460)
,p_plug_name=>'Movement Information'
,p_parent_plug_id=>wwv_flow_api.id(960921355904356458)
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
 p_id=>wwv_flow_api.id(960922107120356461)
,p_plug_name=>'Biometric Data'
,p_parent_plug_id=>wwv_flow_api.id(960921699931356460)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960923311096356466)
,p_plug_name=>'Travel Data'
,p_parent_plug_id=>wwv_flow_api.id(960921699931356460)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning'
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
 p_id=>wwv_flow_api.id(960927272724356489)
,p_plug_name=>'Movement Information'
,p_parent_plug_id=>wwv_flow_api.id(960921355904356458)
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
 p_id=>wwv_flow_api.id(960927688109356490)
,p_plug_name=>'Visuals'
,p_parent_plug_id=>wwv_flow_api.id(960912258115356402)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>0
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960928161122356491)
,p_plug_name=>'Visual Data of Passport and Movement'
,p_region_name=>'ID_REG_HEADER'
,p_parent_plug_id=>wwv_flow_api.id(960927688109356490)
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
 p_id=>wwv_flow_api.id(960928555451356493)
,p_plug_name=>'photo_pana'
,p_region_name=>'PHOTO_PANA'
,p_parent_plug_id=>wwv_flow_api.id(960927688109356490)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="margin-left:50px;margin-top:10px;"'
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
 p_id=>wwv_flow_api.id(960928870038356494)
,p_plug_name=>'Children Data'
,p_parent_plug_id=>wwv_flow_api.id(960912258115356402)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
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
 p_id=>wwv_flow_api.id(960929367292356496)
,p_plug_name=>'Data of Children traveling with this Passport'
,p_parent_plug_id=>wwv_flow_api.id(960928870038356494)
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
 p_id=>wwv_flow_api.id(960929710266356497)
,p_plug_name=>'Children'
,p_parent_plug_id=>wwv_flow_api.id(960928870038356494)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'''<img style="border: 0px solid #CCC; -moz-border-radius: 0px; -webkit-border-radius: 0px;object-fit:contain; max-height: 120px" ''||''src="''||decode(nvl(dbms_lob.getlength(attrblob),0),0,''data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAA'
||'ABAAEAAAIBRAA7'',apex_util.get_blob_file_src(''P24_ATTRBLOB'',ROWID))||''"  />'' img_icao_face,',
'',
'ROWID, to_char(floor((seqno - 200) / 10) + 1, ''FM09'') ChildID, DECODE(MOD(SEQNO, 10) , 0, ''Last Name'', 1, ''First Name'', 2, ''Observation'', 3, ''Sex'', 4, ''Date of Birth'', 5, ''Photo'') caption , decode(mod(seqno, 10), 3, decode(attrvarchar, 1, ''Male'', 2, '
||'''Female'', ''Unknown''), 4, substr(attrvarchar, 7, 2) || ''/'' || substr(attrvarchar, 5, 2) || ''/'' || substr(attrvarchar, 1, 4), attrvarchar) attrvarchar, attrblob from MOVEMENT_ATTR where MVMNTID = :P173_MVMNTID and seqno >= 200 and seqno < 400;',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(960930123287356501)
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
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_ROWID:#ROWID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#e2.gif"  border="0">'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>683574954127396958
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(960930259724356531)
,p_db_column_name=>'ROWID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(960930573644356543)
,p_db_column_name=>'ATTRVARCHAR'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Value'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(960930987302356544)
,p_db_column_name=>'CHILDID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Child'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(960931394967356545)
,p_db_column_name=>'CAPTION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Caption'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(960931810434356546)
,p_db_column_name=>'ATTRBLOB'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Value'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(960932178926356547)
,p_db_column_name=>'IMG_ICAO_FACE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Picture'
,p_column_linktext=>'#IMG_ICAO_FACE#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(960932657816356551)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6835775'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'CAPTION:ATTRVARCHAR:CHILDID:IMG_ICAO_FACE:'
,p_break_on=>'CHILDID:0:0:0:0:0'
,p_break_enabled_on=>'CHILDID:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960933143764356565)
,p_plug_name=>'VISA Data'
,p_parent_plug_id=>wwv_flow_api.id(960912258115356402)
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
 p_id=>wwv_flow_api.id(960933388584356567)
,p_plug_name=>'VISA Data and Image'
,p_parent_plug_id=>wwv_flow_api.id(960933143764356565)
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
 p_id=>wwv_flow_api.id(960933806252356568)
,p_plug_name=>'VISA-Data'
,p_parent_plug_id=>wwv_flow_api.id(960933143764356565)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960936588605356578)
,p_plug_name=>'VISA-Image'
,p_parent_plug_id=>wwv_flow_api.id(960933143764356565)
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
 p_id=>wwv_flow_api.id(960937377491356580)
,p_plug_name=>'Travel Card Data'
,p_parent_plug_id=>wwv_flow_api.id(960912258115356402)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960937787148356583)
,p_plug_name=>'Travel Card Data and Image'
,p_parent_plug_id=>wwv_flow_api.id(960937377491356580)
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
 p_id=>wwv_flow_api.id(960938211065356584)
,p_plug_name=>'Travel Card-Data'
,p_parent_plug_id=>wwv_flow_api.id(960937377491356580)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960939855942356588)
,p_plug_name=>'Travel Card-Image'
,p_parent_plug_id=>wwv_flow_api.id(960937377491356580)
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
 p_id=>wwv_flow_api.id(960940666487356590)
,p_plug_name=>'Offload'
,p_parent_plug_id=>wwv_flow_api.id(960912258115356402)
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
 p_id=>wwv_flow_api.id(960941065841356592)
,p_plug_name=>'Offload'
,p_parent_plug_id=>wwv_flow_api.id(960940666487356590)
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
 p_id=>wwv_flow_api.id(960942201139356603)
,p_plug_name=>'Offload this Movement'
,p_parent_plug_id=>wwv_flow_api.id(960940666487356590)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(960914184223356420)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(960913810034356418)
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
 p_id=>wwv_flow_api.id(960941397813356599)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(960941065841356592)
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
 p_id=>wwv_flow_api.id(960900720695356303)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(960900324031356302)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(960901110504356335)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(960900324031356302)
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
 p_id=>wwv_flow_api.id(960901522447356338)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(960900324031356302)
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
 p_id=>wwv_flow_api.id(960901960723356344)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(960900324031356302)
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
 p_id=>wwv_flow_api.id(960950808475356742)
,p_branch_action=>'f?p=&APP_ID.:173:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960894456971356273)
,p_name=>'P173_MVMNT_PHOTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'LIVE_PHOTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960894690204356277)
,p_name=>'P173_MVMNTID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960895102121356277)
,p_name=>'P173_BRDDOCID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
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
 p_id=>wwv_flow_api.id(960895472145356278)
,p_name=>'P173_LANDBARCD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'LANDBARCD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960895966502356279)
,p_name=>'P173_VISAEXPDT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'VISAEXPDT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960896369127356280)
,p_name=>'P173_MVMNTADDR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'MVMNTADDR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960896765408356281)
,p_name=>'P173_ORIDEST'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'ORIDEST'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960897099212356289)
,p_name=>'P173_VISA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'VISA_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960897524940356290)
,p_name=>'P173_LANDINGCARD'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'LANDINGCARD_PAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960897957654356291)
,p_name=>'P173_WORKSTATION_NAME'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'WORKSTATION_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960898334848356292)
,p_name=>'P173_REFUSEDFLG'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'REFUSEDFLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960898732766356292)
,p_name=>'P173_PSSNGRSTATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'PSSNGRSTATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960899082956356293)
,p_name=>'P173_RNKDSGNTDID'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'RNKDSGNTDID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960899518743356294)
,p_name=>'P173_SURNAME'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_source=>'SURNAME'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_item_css_classes=>'dbcol_SURNAME'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960899931034356294)
,p_name=>'P173_DOCFACE_CAMERA_SCORE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(960894033204356241)
,p_use_cache_before_default=>'NO'
,p_source=>'PS_5'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960902673342356348)
,p_name=>'P173_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
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
 p_id=>wwv_flow_api.id(960903116806356350)
,p_name=>'P173_BIOMETRIC_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
,p_prompt=>'Biometric status:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960903559102356350)
,p_name=>'P173_PASS_VISUAL_FACE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
,p_prompt=>'Pass visual face'
,p_source=>'data:'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_PASS_VISUAL_FACE'
,p_tag_attributes=>'style="max-height:300px; max-width:200px;height:300px;width:200px";'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960903904788356353)
,p_name=>'P173_EXIT_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
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
 p_id=>wwv_flow_api.id(960904285144356355)
,p_name=>'P173_MVMNT_SCANPHOTO'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
,p_use_cache_before_default=>'NO'
,p_source=>'PSBLOB_1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960904747849356356)
,p_name=>'P173_EXITFLG'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
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
 p_id=>wwv_flow_api.id(960905008514356359)
,p_name=>'P173_PASS_ICAO_FACE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
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
 p_id=>wwv_flow_api.id(960905393669356360)
,p_name=>'P173_EXITFLG_DISPLAY'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960905861011356362)
,p_name=>'P173_PASS_VISUALPAGE'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
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
 p_id=>wwv_flow_api.id(960906178815356364)
,p_name=>'173_IS_BLACKLISTED'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(960902324985356346)
,p_prompt=>'Blacklisted'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960906993838356366)
,p_name=>'P173_WSQ_LL'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
,p_prompt=>'Wsq Ll'
,p_source=>'data:'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_WSQ_LL'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960907411519356371)
,p_name=>'P173_WSQ_LI'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
,p_prompt=>'Wsq Li'
,p_source=>'data:'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_WSQ_LI'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960907809440356373)
,p_name=>'P173_WSQ_LM'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
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
 p_id=>wwv_flow_api.id(960908178171356375)
,p_name=>'P173_WSQ_LR'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
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
 p_id=>wwv_flow_api.id(960908630243356377)
,p_name=>'P173_WSQ_LT'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
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
 p_id=>wwv_flow_api.id(960909029551356380)
,p_name=>'P173_WSQ_RL'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
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
 p_id=>wwv_flow_api.id(960909417305356383)
,p_name=>'P173_WSQ_RI'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
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
 p_id=>wwv_flow_api.id(960909777998356387)
,p_name=>'P173_WSQ_RM'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
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
 p_id=>wwv_flow_api.id(960910176181356388)
,p_name=>'P173_WSQ_RR'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
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
 p_id=>wwv_flow_api.id(960910644343356390)
,p_name=>'P173_WSQ_RT'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(960906653681356365)
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
 p_id=>wwv_flow_api.id(960911412492356397)
,p_name=>'P173_MVMNTID_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960911048576356391)
,p_use_cache_before_default=>'NO'
,p_source=>'MVMNTID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960911784799356399)
,p_name=>'P173_LIVE_PHOTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960911048576356391)
,p_source=>'data:'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_LIVE_PHOTO'
,p_tag_attributes=>'style="border-radius:15px; max-height: 600px; max-width:450px"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960914660239356421)
,p_name=>'P173_REASON_DEPORTEE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960913810034356418)
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
 p_id=>wwv_flow_api.id(960916664161356436)
,p_name=>'P173_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Name:'
,p_source=>'SURNAME'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>150
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_SURNAME'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960917000209356437)
,p_name=>'P173_GIVENNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Given Name:'
,p_source=>'GIVENNAME'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>150
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_GIVENNAME'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960917370171356438)
,p_name=>'P173_GENDER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Gender:'
,p_source=>'GENDER'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'ICAO_GENDER'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, ICAO r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where ICAO is not null',
'order by DISPLAY_ORDER;'))
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_GENDER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960917845081356440)
,p_name=>'P173_PLACEOFBIRTH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Place of Birth:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_PLACEOFBIRTH'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960918208484356441)
,p_name=>'P173_DOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_DOB'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960918635734356442)
,p_name=>'P173_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_ISOCOUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CTRYNAME || '' ('' || CTRYCD || '')'' d, CTRYCD r',
'from ICAOCOUNTRIES',
'order by 1'))
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_NATIONALITY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960919040547356444)
,p_name=>'P173_DOCNUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_DOCNO'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960919384194356452)
,p_name=>'P173_DOCTYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_DOCTYPE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960919797587356453)
,p_name=>'P173_ISSUECTRY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Issuing Country:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_ISOCOUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CTRYNAME || '' ('' || CTRYCD || '')'' d, CTRYCD r',
'from ICAOCOUNTRIES',
'order by 1'))
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_ISSUECTRY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960920261851356454)
,p_name=>'P173_DATEOFISSUE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Date of Issue:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_DATEOFISSUE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960920660593356456)
,p_name=>'P173_EXPIRYDATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Expiry Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_EXPIRYDATE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960921044383356457)
,p_name=>'P173_MANUALEXPIRYDATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(960916267896356433)
,p_prompt=>'Manual Expiry Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_MANUALEXPIRYDATE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960922514230356462)
,p_name=>'P173_FINGERMATCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960922107120356461)
,p_prompt=>'Fingers:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_YESNO'
,p_lov=>'.'||wwv_flow_api.id(558108972921270797)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_FINGERMATCH'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960922890956356465)
,p_name=>'P173_FACEMATCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960922107120356461)
,p_prompt=>'Face:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_YESNO'
,p_lov=>'.'||wwv_flow_api.id(558108972921270797)||'.'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_FACEMATCH'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960923761303356468)
,p_name=>'P173_CREATED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Travel Date:'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_CREATED'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960924099082356472)
,p_name=>'P173_DIRECTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Direction:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_ENTRYEXITDEPORTEEOFFLOAD'
,p_lov=>'.'||wwv_flow_api.id(905971316972710065)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_EXITFLG'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960924520049356473)
,p_name=>'P173_FLIGHT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Transport:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_FLIGHTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  f.flightnum || '' (''|| o.IATA_FAA_CODE || '' -> '' || d.IATA_FAA_CODE || '')'' as d, f.flghtid as r from flights f',
'join airports o on o.id = f.originairportid',
'join airports d on d.id = f.destinairportid',
'order by f.flightnum;'))
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_SCANNED_FLIGHT'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960924883184356483)
,p_name=>'P173_VISATYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'VISA_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.VISA_TYPES$LC',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_VISA'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960925342890356484)
,p_name=>'P173_OBSERVATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Note:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>5
,p_tag_css_classes=>'dbcol_OBSERVATION'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960925677018356485)
,p_name=>'P173_CREATED_BY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Created By:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_CREATED_BY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960926074366356486)
,p_name=>'P173_SUPERVISOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Granted by Supervisor:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_GRANTED_BY_SUPERVISOR'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960926528761356487)
,p_name=>'P173_SUPERVISOR_REASON'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Supervisor Reason:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_SUPERVISOR_REASON'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960926967196356488)
,p_name=>'P173_SERVER_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(960923311096356466)
,p_prompt=>'Border Post:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>40
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_SERVER_ID'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960934253133356569)
,p_name=>'P173_VISUM_NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960933806252356568)
,p_prompt=>'Visa Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_VISUM_NUMBER'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960934642239356571)
,p_name=>'P173_VISA_COM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960933806252356568)
,p_prompt=>'Visa Comments:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_VISUM_INFO'
,p_tag_attributes=>'style="font-style:italic"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960935053243356572)
,p_name=>'P173_VISUM_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960933806252356568)
,p_prompt=>'Place of Issue:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_VISUM_LOCATION'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960935385272356572)
,p_name=>'P173_VISUM_DURATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(960933806252356568)
,p_prompt=>'Length:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_VISUM_DURATION'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960935817575356576)
,p_name=>'P173_VISUM_START'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(960933806252356568)
,p_prompt=>'Start Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_VISUM_START'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960936264556356577)
,p_name=>'P173_VISUM_END'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(960933806252356568)
,p_prompt=>'End Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_VISUM_END'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960937045664356579)
,p_name=>'P173_VISA_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960936588605356578)
,p_prompt=>'Visa '
,p_source=>'data:'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'rotate90onclick dbcol_VISA_PAGE'
,p_tag_attributes=>'style="border-radius:15px; border: 1px solid black; max-height: 400px"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960938661977356585)
,p_name=>'P173_LC_LENGTH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(960938211065356584)
,p_prompt=>'Length of Stay:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_LC_LENGTH'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960939061594356586)
,p_name=>'P173_LC_ADDRESS'
,p_item_sequence=>35
,p_item_plug_id=>wwv_flow_api.id(960938211065356584)
,p_prompt=>'Address:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_LC_ADDRESS'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960939426593356587)
,p_name=>'P173_LAND_COM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(960938211065356584)
,p_prompt=>'Travelcard Comments:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_LC_INFO'
,p_tag_attributes=>'style="font-style:italic"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960940226096356589)
,p_name=>'P173_LANDINGCARD_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(960939855942356588)
,p_prompt=>'Landingcard '
,p_source=>'data:'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'rotate90onclick dbcol_LANDINGCARD_PAGE'
,p_tag_attributes=>'style="border-radius:15px; border: 1px solid black; max-height: 400px"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960941794326356601)
,p_name=>'P173_REASON_OFFLOAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(960941065841356592)
,p_prompt=>'Reason for offload procedure:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>128
,p_cHeight=>5
,p_tag_css_classes=>'dbcol_REASON_OFFLOAD'
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(960942742179356669)
,p_computation_sequence=>10
,p_computation_item=>'P173_EXITFLG_DISPLAY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select decode(exitflg, 1, ''Departure'', ''Arrival'') from movements where mvmntid = :P173_MVMNTID;'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(960943055846356676)
,p_computation_sequence=>10
,p_computation_item=>'IS_BLACKLISTED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select ''This Document is currently blacklisted'' from dual'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(960943438766356678)
,p_validation_name=>'P173_CREATED must be timestamp'
,p_validation_sequence=>100
,p_validation=>'P173_CREATED'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(960923761303356468)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(960946159883356696)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(460742214716069168)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(960946609802356709)
,p_event_id=>wwv_flow_api.id(960946159883356696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(960946995351356712)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(960894033204356241)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(960947505016356717)
,p_event_id=>wwv_flow_api.id(960946995351356712)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_CSS'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(960894033204356241)
,p_attribute_01=>'color'
,p_attribute_02=>'red'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(960949284061356729)
,p_name=>'DA_TOGGLE_DEPORT_BTN'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P173_REASON_DEPORTEE'
,p_condition_element=>'P173_REASON_DEPORTEE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(960949800709356733)
,p_event_id=>wwv_flow_api.id(960949284061356729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(960950304241356734)
,p_event_id=>wwv_flow_api.id(960949284061356729)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(960947889327356721)
,p_name=>'DA_TOGGLE_OFFLOAD_BTN'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P173_REASON_OFFLOAD'
,p_condition_element=>'P173_REASON_OFFLOAD'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(960948417377356724)
,p_event_id=>wwv_flow_api.id(960947889327356721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(960941397813356599)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(960948933755356728)
,p_event_id=>wwv_flow_api.id(960947889327356721)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(960941397813356599)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960945277432356692)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SET_DEPORTEE'
,p_process_sql_clob=>'UPDATE MOVEMENTS SET EXITFLG = 2, REASON_DEPORTEE=:P173_REASON_DEPORTEE WHERE MVMNTID=:P173_MVMNTID;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(906224950666759666)
,p_process_success_message=>'Successfully changed Movement to Deportee'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960945732919356694)
,p_process_sequence=>11
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SET_OFFLOAD'
,p_process_sql_clob=>'UPDATE MOVEMENTS SET EXITFLG = 3,REASON_OFFLOAD=:P173_REASON_OFFLOAD WHERE MVMNTID=:P173_MVMNTID;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(960941397813356599)
,p_process_success_message=>'Successfully changed Movement to Offload'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960944913628356692)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of V_M_D'
,p_attribute_02=>'V_M_D'
,p_attribute_03=>'P173_MVMNTID'
,p_attribute_04=>'MVMNTID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960943724944356686)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(960901110504356335)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960944158343356689)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(961006623854783220)
,p_process_sequence=>60
,p_process_point=>'BEFORE_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_Fetch_CLOB'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	procedure htpprnclob(pclob in clob) is',
'	  v_excel varchar2(32000);',
'	  v_clob clob := pclob;',
'	begin',
'	  while length(v_clob) > 0 loop',
'		begin',
'		  if length(v_clob) > 16000 then',
'			 v_excel:= substr(v_clob,1,16000);',
'			 htp.prn(v_excel);',
'			 v_clob:= substr(v_clob,length(v_excel)+1);',
'		  else',
'			 v_excel := v_clob;',
'			 htp.prn(v_excel);',
'			 v_clob:='''';',
'			 v_excel := '''';',
'		  end if;',
'		end;',
'	  end loop;',
'	end;',
'	procedure printCLOB(name in varchar2, value in clob) as',
'	begin',
'		htp.prn(''details.'' || name || '' = '');',
'		if value is null then',
'			htp.prn(''null'');',
'		else',
'			htp.prn(''"'');',
'			htpprnclob(value);',
'			htp.prn(''"'');',
'		end if;',
'		htp.p('';'');',
'	end;',
'	procedure printNumber(name in varchar2, value in number) as',
'	begin',
'		htp.prn(''details.'' || name || '' = '');',
'		if value is null then',
'			htp.prn(''null'');',
'		else',
'			htp.prn(to_char(value));',
'		end if;',
'		htp.p('';'');',
'	end;',
'	procedure printDate(name in varchar2, value in date) as',
'	begin',
'		htp.prn(''details.'' || name || '' = '');',
'		if value is null then',
'			htp.prn(''null'');',
'		else',
'			/*htp.prn(''"'' || to_char(value, ''YYYY-MM-DD HH24:MI:SS'') || ''"'');*/',
'			htp.prn(''"'' || to_char(value, ''DD/MM/YYYY HH24:MI'') || ''"'');',
'		end if;',
'		htp.p('';'');',
'	end;',
'begin',
'	',
'	htp.p(''<script>'');',
'	htp.p(''var details = {};'');',
'',
'	for row in (select * from v_m_d_base64 where mvmntid = :P173_MVMNTID) loop',
'		printCLOB(''MANUALEXPIRYDATE'', row.MANUALEXPIRYDATE);',
'		printCLOB(''MVMNTID'', row.MVMNTID);',
'		printCLOB(''BRDDOCID'', row.BRDDOCID);',
'		printCLOB(''MVMNTADDR'', row.MVMNTADDR);',
'		printCLOB(''ORIDEST'', row.ORIDEST);',
'		printCLOB(''CREATED_BY'', row.CREATED_BY);',
'		printCLOB(''WORKSTATION_NAME'', row.WORKSTATION_NAME);',
'		printCLOB(''SERVER_ID'', row.SERVER_ID);',
'		printCLOB(''OBSERVATION'', row.OBSERVATION);',
'		printCLOB(''TRNSPRTUNITID'', utl_raw.cast_to_varchar2(row.TRNSPRTUNITID));',
'		printCLOB(''SCANNED_FLIGHT'', row.SCANNED_FLIGHT);',
'		printCLOB(''MVMNT_ID'', row.MVMNT_ID);',
'		printCLOB(''WSQ_RT'', row.WSQ_RT);',
'		printCLOB(''WSQ_RI'', row.WSQ_RI);',
'		printCLOB(''WSQ_RM'', row.WSQ_RM);',
'		printCLOB(''WSQ_RR'', row.WSQ_RR);',
'		printCLOB(''WSQ_RL'', row.WSQ_RL);',
'		printCLOB(''WSQ_LT'', row.WSQ_LT);',
'		printCLOB(''WSQ_LI'', row.WSQ_LI);',
'		printCLOB(''WSQ_LM'', row.WSQ_LM);',
'		printCLOB(''WSQ_LR'', row.WSQ_LR);',
'		printCLOB(''WSQ_LL'', row.WSQ_LL);',
'		printCLOB(''VISA_PAGE'', row.VISA_PAGE);',
'		printCLOB(''LANDINGCARD_PAGE'', row.LANDINGCARD_PAGE);',
'		printCLOB(''LIVE_PHOTO'', row.LIVE_PHOTO);',
'		printCLOB(''VISUM_INFO'', row.VISUM_INFO);',
'		printCLOB(''LC_INFO'', row.LC_INFO);',
'		printCLOB(''GRANTED_BY_SUPERVISOR'', row.GRANTED_BY_SUPERVISOR);',
'		printCLOB(''SUPERVISOR_REASON'', row.SUPERVISOR_REASON);',
'		printCLOB(''PS_5'', row.PS_5);',
'		printCLOB(''PSBLOB_1'', row.PSBLOB_1);',
'		printCLOB(''PSBLOB_2'', row.PSBLOB_2);',
'		printCLOB(''PSBLOB_3'', row.PSBLOB_3);',
'		printCLOB(''PSBLOB_4'', row.PSBLOB_4);',
'		printCLOB(''PSBLOB_5'', row.PSBLOB_5);',
'		printCLOB(''PSBLOB_6'', row.PSBLOB_6);',
'		printCLOB(''PSBLOB_7'', row.PSBLOB_7);',
'		printCLOB(''PSBLOB_8'', row.PSBLOB_8);',
'		printCLOB(''PSBLOB_9'', row.PSBLOB_9);',
'		printCLOB(''PSBLOB_10'', row.PSBLOB_10);',
'		printCLOB(''DOCNO'', row.DOCNO);',
'		printCLOB(''PASS_VISUAL_FACE'', row.PASS_VISUAL_FACE);',
'		printCLOB(''PASS_ICAO_FACE'', row.PASS_ICAO_FACE);',
'		printCLOB(''PASS_VISUALPAGE'', row.PASS_VISUALPAGE);',
'		printCLOB(''GIVENNAME'', row.GIVENNAME);',
'		printCLOB(''SURNAME'', row.SURNAME);',
'		printCLOB(''SEX'', row.SEX);',
'		printCLOB(''GENDER'', row.GENDER);',
'		printCLOB(''EXPIRYDATE'', row.EXPIRYDATE);',
'		printCLOB(''DOB'', row.DOB);',
'		printCLOB(''DOCTYPE'', row.DOCTYPE);',
'		printCLOB(''ISSUECTRY'', row.ISSUECTRY);',
'		printCLOB(''DATEOFISSUE'', row.DATEOFISSUE);',
'		printCLOB(''NATIONALITY'', row.NATIONALITY);',
'		printCLOB(''PLACEOFBIRTH'', row.PLACEOFBIRTH);',
'		printCLOB(''VISUM_NUMBER'', row.VISUM_NUMBER);',
'		printCLOB(''VISUM_LOCATION'', row.VISUM_LOCATION);',
'		printCLOB(''VISUM_DURATION'', row.VISUM_DURATION);',
'		printCLOB(''VISUM_START'', row.VISUM_START);',
'		printCLOB(''VISUM_END'', row.VISUM_END);',
'		printCLOB(''LC_LENGTH'', row.LC_LENGTH);',
'		printCLOB(''LC_ADDRESS'', row.LC_ADDRESS);',
'		/*printCLOB('''', row.);',
'		printCLOB('''', row.);',
'		printCLOB('''', row.);',
'		printCLOB('''', row.);',
'		printCLOB('''', row.);*/',
'		printNUMBER(''LANDBARCD'', row.LANDBARCD);',
'		printNUMBER(''EXITFLG'', row.EXITFLG);',
'		printNUMBER(''FINGERMATCH'', row.FINGERMATCH);',
'		printNUMBER(''FACEMATCH'', row.FACEMATCH);',
'		printNUMBER(''REFUSEDFLG'', row.REFUSEDFLG);',
'		printNUMBER(''PSSNGRSTATUS'', row.PSSNGRSTATUS);',
'		printNUMBER(''RNKDSGNTDID'', row.RNKDSGNTDID);',
'		printNUMBER(''VISA'', row.VISA);',
'		printNUMBER(''PS_6'', row.PS_6);',
'		printNUMBER(''PS_7'', row.PS_7);',
'		printNUMBER(''PS_8'', row.PS_8);',
'		printNUMBER(''PS_9'', row.PS_9);',
'		printNUMBER(''PS_10'', row.PS_10);',
'		/*printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);*/',
'		printCLOB(''REASON_OFFLOAD'', row.REASON_OFFLOAD);',
'		printCLOB(''REASON_DEPORTEE'', row.REASON_DEPORTEE);',
'		printDATE(''VISAEXPDT'', row.VISAEXPDT);',
'		printDATE(''CREATED'', row.CREATED);',
'		/*printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);*/',
'	end loop;',
'	htp.p(''window.details = details;'');',
'	',
'	htp.p(''</script>'');',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960944527643356691)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from V_M_D'
,p_attribute_02=>'V_M_D_BASE64'
,p_attribute_03=>'P173_MVMNTID'
,p_attribute_04=>'MVMNTID'
,p_process_when_type=>'NEVER'
);
end;
/
