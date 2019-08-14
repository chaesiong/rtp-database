prompt --application/pages/page_00082
begin
wwv_flow_api.create_page(
 p_id=>82
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Passport Management dummy'
,p_page_mode=>'NORMAL'
,p_step_title=>'Passport Management dummy'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Passport Management dummy'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
'#WORKSPACE_IMAGES#FaceVerifyer.js',
'#WORKSPACE_IMAGES#FingerprintVerifyer.js',
'#WORKSPACE_IMAGES#jquery-asPieProgress.js',
'#WORKSPACE_IMAGES#fotorama.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var noSupportMessage = "Your browser cannot support WebSocket!";',
'var ws_passport;',
'var current_progress = 0;',
'var current_progress_text = "";',
'',
'PluginProtocol = ''&AI_WEBSOCKET_PROTOCOL.'';',
'',
'            function appendMessage(message) {',
'                $(''#messages'').append(message);',
'            }',
'',
'            function onMessage(sender, resp) {',
'                if (resp.State == "connected") {',
'                    ',
'                } else if (resp.State == "disconnected") {',
'                    resetPassport();',
'                    appendMessage("# " + resp.State + "<br />");',
'                } else if (resp.State == "reconfigured") {',
'                    $(''#messages'').empty();',
'                    resetPassport();',
'                    appendMessage("# " + resp.Message + "<br />");',
'                } else if (resp.State == "message") {',
'                    appendMessage("# " +resp.MessageType + ": " + resp.Message + "<br />");',
'                    RenderMessage(resp);',
'                } else {',
'                    $(''#messages'').empty();',
'                    resetPassport();',
'                    $(''#picturerange'').show();',
'                    appendPassportData(resp.Data);',
'                }',
'            }',
'',
'            function onOpen(resp) {',
'                appendMessage(''Passport Reader connected and ready<br/>'');',
'                //connectPassReader();',
'',
'            }',
'',
'            function onClose(resp) {',
'                $(''#messages'').empty();',
'                resetPassport();',
'                appendMessage(''* Connection closed<br/>'');',
'',
'            }',
'',
'            function appendPassportData(pass) {',
'                ',
'                if (pass != null) {',
'                    var dgd = pass.DemographicData;',
'                    ',
'                    for(var propertyName in dgd) {',
'                       $s(''DG_'' + propertyName.toUpperCase(), dgd[propertyName]);',
'                    }                    ',
'                    ',
'                    var img;',
'                    if (pass.ImageLightWhite != null){',
'                        img = pass.ImageLightWhite;                        ',
'                        StoreValueInSessionBag(''PASS_VISUALPAGE'', img.Image);',
'                    }',
'                    if (pass.ImageLightIR != null){',
'                        img = pass.ImageLightIR;',
'                        StoreValueInSessionBag(''PASS_IRPAGE'', img.Image);',
'                    }',
'                    if (pass.ImageLightUV != null){',
'                        img = pass.ImageLightUV;',
'                        StoreValueInSessionBag(''PASS_UVPAGE'', img.Image);',
'                    }',
'                    if (pass.ImagePortrait != null){',
'                        img = pass.ImagePortrait;',
'                        StoreValueInSessionBag(''PASS_VISUAL_FACE'', img.Image);',
'                    }                    ',
'                    if (pass.RFIDChip.StatusPassiveAuthentication != null)',
'                    {',
'                        if (pass.RFIDChip.DG1 != null){',
'                            for(var propertyName in pass.RFIDChip.DG1) {',
'                               $s(''DG1_'' + propertyName.toUpperCase(), pass.RFIDChip.DG1[propertyName]);',
'                            }',
'                        }',
'                        ',
'                        if (pass.RFIDChip.DG2 != null){',
'                            img = pass.RFIDChip.DG2;',
'                            if (img != null) {                                ',
'                                StoreValueInSessionBag(''PASS_ICAO_FACE'', img.Image);',
'                            }                            ',
'                            ',
'                        }',
'                        if (pass.RFIDChip.DG3 != null){',
'                            for (var i = 0; i < pass.RFIDChip.DG3.length; i++) {',
'                                img = pass.RFIDChip.DG3[i];',
'                                StoreValueInSessionBag(''PASS_DG3_''+i, img.Image);                                ',
'                            }',
'                        }',
'                    }',
'                    apex.submit({request:''REQUEST_STOREINSESSIONBAG''});',
'                }',
'            }',
'',
'function RenderMessage(par_message){',
'    ',
'    if (par_message.MessageType == ''StartReading''){',
'        //TODO JETZT ANIMATION einblenden',
'        current_progress = 5;',
'        $(''.pie_progress'').asPieProgress(''go'',current_progress);',
'    }   ',
'',
'    ',
'    if (par_message.MessageType == ''Progress''){',
'        if (parseInt(par_message.Message) > 5)',
'        {',
'            current_progress = parseInt(par_message.Message);        ',
'            $(''.pie_progress'').asPieProgress(''go'',current_progress);',
'        }',
'',
'    }',
'    else',
'    {',
'        current_progress_text = par_message.MessageType;',
'    }    ',
'    $(''.pie_progress__label'').text(current_progress_text);    ',
'}',
'',
'function compare_callback(resp){',
'    ',
'    if (resp.Message == "0")',
'    {',
'        $("#ID_FPMATCHED").text("Fingerprints matched successfully");',
'        $("#ID_FPMATCHED").css("background-color", "green");				',
'        $s(''DG_FINGERCHECKED'', 1);',
'    }',
'    else',
'    {',
'        $("#FP_COMPARE_RESULT").val( "Fingerprints did not match");',
'        $("#ID_FPMATCHED").text("Fingerprints did not match");',
'        $("#ID_FPMATCHED").css("background-color", "red");				',
'    }',
'}',
'',
'function connectWebSocket() {',
'',
'                ws_passport = new PassReaderPlugin(0, null, appendMessage, onMessage);',
'                ws_passport.Plugin().onOpen = onOpen;',
'                ws_passport.Plugin().onClose = onClose;',
'',
'                $(''#messages'').empty();',
'                $.when(ws_passport.connect()).done(function(){                    ',
'                    ',
'                    $.when(ws_passport.selectDevice("XF9")).done(function(){',
'                        connectPassReader();',
'                    });',
'                });',
'            }',
'',
'            function disconnectWebSocket() {',
'                if (ws_passport != null)',
'                    ws_passport.disconnect();',
'            }',
'',
'',
'            function connectPassReader() {',
'                ws_passport.connectDevice();',
'            }',
'',
'            function disconnectPassReader() {',
'                ws_passport.disconnectDevice();',
'            }',
'',
'            function doSetSettings(value) {',
'                ws_passport.setSettings(value);',
'            }',
'',
'            function resetPassport() {',
'                $(''#passport'').empty();',
'            }',
'',
'            function getHtmlImage(imgBase64, type) {',
'                return "data:image/" + type + ";base64, " + imgBase64;',
'            }',
'',
'',
'',
'function d_fp(blob){',
'    var fp1 = {Hand:0, Image:blob, ImageType:"Png", Type:10}; ',
'    fp_images_to_compare.push(fp1);',
'}',
'',
'function d_face(blob){',
'    fv_facetocheckagainst = blob;',
'    if (fv_facetocheckagainst != null)',
'        fv_IsReadyForFaceVerify = true;',
'}',
'',
'function DownloadFingerprints() {',
'    fp_images_to_compare = [];',
'    if ($(''#PASS_DG3_0'').length > 0)',
'        DownloadBLOB($(''#PASS_DG3_0'')[0].src, d_fp);',
'    if ($(''#PASS_DG3_1'').length > 0)',
'        DownloadBLOB($(''#PASS_DG3_1'')[0].src, d_fp);',
'}',
'',
'function DownloadPhotoToCheckAgainst(){',
'    fv_facetocheckagainst = null;',
'    if ($(''#PHOTO_TO_MATCH_AGAINST'').length > 0)',
'        DownloadBLOB($(''#PHOTO_TO_MATCH_AGAINST'')[0].src, d_face);',
'}',
'',
'function SameValues(id1, id2){',
'    return $(''#''+id1).val() == $(''#''+id2).val();',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//prevent use of back button, for not resubmitting the page...',
'//window.location.replace();',
'',
'fv_IsReadyForFaceVerify = false;',
'$("#REG_HiddenItems").hide();',
'$("#REG_PassportAnimation").show();',
'',
'$(''span:contains(Blacklist)'').parent().css(''background-color'',''#ff6666'');',
'',
'/*collapse all hidden form labels*/',
'$(''.t-Form-labelContainer--hiddenLabel.col-3'').removeClass(''col-3'');',
'',
'',
'$(''.pie_progress'').asPieProgress({',
'            ''namespace'': ''pie_progress''',
'});',
'var $fotoramaDiv = $(''#fotorama'').fotorama();',
'var fotorama = $fotoramaDiv.data(''fotorama'');',
'',
'if ($(''#PASS_ICAO_FACE2'').length > 0)',
'    fotorama.push({img: $(''#PASS_ICAO_FACE2'').attr(''src''), thumb: $(''#PASS_ICAO_FACE2'').attr(''src'')});',
'if ($(''#PASS_VISUAL_FACE'').length > 0)',
'fotorama.push({img: $(''#PASS_VISUAL_FACE'').attr(''src''), thumb: $(''#PASS_VISUAL_FACE'').attr(''src'')});',
'if ($(''#PASS_VISUALPAGE'').length > 0)',
'fotorama.push({img: $(''#PASS_VISUALPAGE'').attr(''src''), thumb: $(''#PASS_VISUALPAGE'').attr(''src'')});',
'if ($(''#PASS_UVPAGE'').length > 0)',
'fotorama.push({img: $(''#PASS_UVPAGE'').attr(''src''), thumb: $(''#PASS_UVPAGE'').attr(''src'')});',
'if ($(''#PASS_IRPAGE'').length > 0)',
'fotorama.push({img: $(''#PASS_IRPAGE'').attr(''src''), thumb: $(''#PASS_IRPAGE'').attr(''src'')});',
'if ($(''#PASS_DG3_1'').length > 0)',
'fotorama.push({img: $(''#PASS_DG3_1'').attr(''src''), thumb: $(''#PASS_DG3_1'').attr(''src'')});',
'if ($(''#PASS_DG3_0'').length > 0)',
'fotorama.push({img: $(''#PASS_DG3_0'').attr(''src''), thumb: $(''#PASS_DG3_0'').attr(''src'')});',
'',
'',
'',
'fp_func_compare_callback = compare_callback;',
'DownloadPhotoToCheckAgainst();',
'DownloadFingerprints();'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#font-awesome-animation.min.css',
'#WORKSPACE_IMAGES#progress.css',
'#WORKSPACE_IMAGES#fotorama.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-Region-carouselItems {',
'margin:10px;',
'}',
'',
'',
'.a-Region-carouselLabel {',
'font-weight:bold;',
'}',
'',
'.t-Form-labelContainer {',
'font-weight:bold;',
'}',
'',
'.t-login-Region ',
' {',
'font-weight:bold;',
'}',
'',
''))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180730110159'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456847636308606045)
,p_plug_name=>'REG_ShowWhenPassportNotRead'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456848016000606058)
,p_plug_name=>'PassportAnimation'
,p_parent_plug_id=>wwv_flow_api.id(456847636308606045)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>2
,p_plug_display_column=>6
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    <div  class="pie_progress" role="progressbar" data-goal="100" data-barcolor="#3daf2c" data-barsize="3" >',
'      <div class="pie_progress__number">0%</div>',
'      <div class="pie_progress__label"></div>',
'    </div>    ',
''))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456848427823606060)
,p_plug_name=>'PassportAnimation'
,p_parent_plug_id=>wwv_flow_api.id(456847636308606045)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      <center><img style="margin-top:-70px" src = "#WORKSPACE_IMAGES#Anim_PassportReading.gif"/></center>',
'',
'<div id="passport"></div>',
'<div id="messages" style="margin-top:5px;font-weight:bold;visibility:hidden;"></div>'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456848806289606062)
,p_plug_name=>'In case traveller has not a readable document'
,p_parent_plug_id=>wwv_flow_api.id(456847636308606045)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_grid_column_span=>4
,p_plug_display_column=>9
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456850043956606073)
,p_plug_name=>'&SECURITY_DUPLICATE_MOVEMENTS. wrong movements detected in travel history'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'SECURITY_DUPLICATE_MOVEMENTS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456850474591606076)
,p_plug_name=>'Scan Traveller''s Passport or key in Temporary Document Number '
,p_icon_css_classes=>'flaticon-passport4'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'Use this Page to scan the passport of the current traveller or manually handle a document'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'DG_DOCUMENTNUMBER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456850826428606078)
,p_plug_name=>'REG_HiddenItems'
,p_region_name=>'REG_HiddenItems'
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
 p_id=>wwv_flow_api.id(456854339650606089)
,p_plug_name=>'REG_ShowWhenPassportRead'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(456854768141606090)
,p_plug_name=>'REG_LEFT'
,p_parent_plug_id=>wwv_flow_api.id(456854339650606089)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(456855196525606094)
,p_plug_name=>'Passport Details'
,p_parent_plug_id=>wwv_flow_api.id(456854768141606090)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456855579837606096)
,p_plug_name=>'TABS_PassportData'
,p_parent_plug_id=>wwv_flow_api.id(456855196525606094)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:t-Form--slimPadding:t-Form--stretchInputs:t-Form--leftLabels'
,p_plug_template=>wwv_flow_api.id(563823021746049617)
,p_plug_display_sequence=>80
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
 p_id=>wwv_flow_api.id(456855970328606098)
,p_plug_name=>'Blacklist'
,p_parent_plug_id=>wwv_flow_api.id(456855579837606096)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'P82_BLACKLISTHIT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456856384003606099)
,p_plug_name=>'Blacklist Entries of &DG_DOCUMENTNUMBER.'
,p_parent_plug_id=>wwv_flow_api.id(456855970328606098)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456856703529606101)
,p_plug_name=>'Blacklist Report'
,p_parent_plug_id=>wwv_flow_api.id(456856384003606099)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from dual',
'',
'--select * ',
'--from DL_V_PERSONBL p',
'--where p.ACTIVE > 0 ',
'--    AND :DG_DOCUMENTNUMBER = PASSPORTNO;',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456857165541606103)
,p_name=>'Blacklist Entries'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>35935566969032286
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456857284659606104)
,p_db_column_name=>'1'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'1'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456857631790606112)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'359361'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'1'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456858120058606114)
,p_plug_name=>'Passport Check & Movement'
,p_parent_plug_id=>wwv_flow_api.id(456855579837606096)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(456858520667606116)
,p_plug_name=>'REG_STATUS'
,p_parent_plug_id=>wwv_flow_api.id(456858120058606114)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456858987457606117)
,p_plug_name=>'Biometric / Security Checks'
,p_parent_plug_id=>wwv_flow_api.id(456858120058606114)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(456861397540606128)
,p_plug_name=>'Passport Security Checks'
,p_parent_plug_id=>wwv_flow_api.id(456858987457606117)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456863713087606135)
,p_plug_name=>'Visual MRZ / Photo'
,p_parent_plug_id=>wwv_flow_api.id(456858120058606114)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456864138046606137)
,p_plug_name=>'Passport Visuals'
,p_parent_plug_id=>wwv_flow_api.id(456863713087606135)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--danger'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="fotorama"',
'     id="fotorama"     ',
'     data-nav="thumbs" data-thumbheight="48" data-auto="false" data-allowfullscreen="true" data-height="400" data-width="100%">      ',
'    ',
'</div>',
''))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456864578867606139)
,p_plug_name=>'Fingerprint Verification'
,p_parent_plug_id=>wwv_flow_api.id(456863713087606135)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<!--img id="video" width="300" height="200px"/-->	'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456865340279606141)
,p_plug_name=>'Fingerprints'
,p_parent_plug_id=>wwv_flow_api.id(456864578867606139)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>8
,p_plug_display_point=>'BODY'
,p_plug_source=>'<img id="fp_video" width="100%" height="350px">'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456865781202606143)
,p_plug_name=>'Fingerprint Result'
,p_parent_plug_id=>wwv_flow_api.id(456864578867606139)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
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
 p_id=>wwv_flow_api.id(456866512491606145)
,p_plug_name=>'Data stored with this Movement:'
,p_parent_plug_id=>wwv_flow_api.id(456863713087606135)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456866998245606147)
,p_plug_name=>'MovementData'
,p_parent_plug_id=>wwv_flow_api.id(456866512491606145)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>9
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456870112807606155)
,p_plug_name=>'StoreMovement'
,p_parent_plug_id=>wwv_flow_api.id(456866512491606145)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456870954554606159)
,p_plug_name=>'Passport Data (Optical <-> Chip)'
,p_parent_plug_id=>wwv_flow_api.id(456863713087606135)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456878540927606181)
,p_plug_name=>'Travel History'
,p_parent_plug_id=>wwv_flow_api.id(456855579837606096)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'font-weight: bold;'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(456878923179606183)
,p_plug_name=>'Movements'
,p_parent_plug_id=>wwv_flow_api.id(456878540927606181)
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456879311105606187)
,p_plug_name=>'Movements'
,p_parent_plug_id=>wwv_flow_api.id(456878923179606183)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''entry_img'', ''passedface_img'', ''passedfingerprints_img''',
'    , DECODE (EXITFLG, 0, ''t-Icon fa fa-arrow-right'', 1, ''t-Icon fa fa-arrow-left'', 2, ''t-Icon fa fa-remove'') as icon ',
'    , DECODE (FACEMATCH, 1, ''t-Icon fa fa-check-circle'', 0, ''t-Icon fa fa-remove'') as passedface ',
'    , DECODE (FINGERMATCH, 1, ''t-Icon fa fa-check-circle'', 0, ''t-Icon fa fa-remove'') as passedfingerprints ',
'    , (EXITFLG - (lag(EXITFLG) over (order by CREATED))) as previous_action',
'    , DECODE (EXITFLG, 0, ''Exit'', 1, ''Entry'', 2, ''Offload'') as ACTION',
', m.* , case when m.trnsprtunitid is not null then tu.NAME else f.FLIGHTNUM end as "FLIGHT"',
'FROM MOVEMENTS m',
'left join Transportunits tu on tu.trnsprtunitid = m.trnsprtunitid',
'left join Flights f on f.flghtid = tu.flghtid',
'WHERE BRDDOCID=GBD(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE,:DG_EXPIRATIONDATE) and EXITFLG < 2'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456879662705606188)
,p_name=>'Movements'
,p_max_row_count=>'100'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No Movements yet '
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>35958064133032371
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456882948688606203)
,p_db_column_name=>'ICON'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456883353444606204)
,p_db_column_name=>'''ENTRY_IMG'''
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Movement Action'
,p_column_html_expression=>'<span class="#ICON#">#ACTION#</span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456883756190606205)
,p_db_column_name=>'PREVIOUS_ACTION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Previous Action'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456884163673606207)
,p_db_column_name=>'LANDBARCD'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Landbarcd'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456884576987606208)
,p_db_column_name=>'EXITFLG'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Exitflg'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456884950936606210)
,p_db_column_name=>'VISAEXPDT'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Visaexpdt'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456885359262606211)
,p_db_column_name=>'FINGERMATCH'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Fingermatch'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456885712207606213)
,p_db_column_name=>'FACEMATCH'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Facematch'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456886190835606214)
,p_db_column_name=>'MVMNTADDR'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Mvmntaddr'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456886576608606215)
,p_db_column_name=>'ORIDEST'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Oridest'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456886995145606216)
,p_db_column_name=>'CREATED'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456887364645606217)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456887698849606218)
,p_db_column_name=>'WORKSTATION_NAME'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'processed on workstation'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456888112322606219)
,p_db_column_name=>'SERVER_ID'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'processed on server'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456888542075606227)
,p_db_column_name=>'REFUSEDFLG'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Refusedflg'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456888954929606229)
,p_db_column_name=>'OBSERVATION'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Observation'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456889398202606230)
,p_db_column_name=>'ACTION'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Action'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456889763065606232)
,p_db_column_name=>'MVMNTID'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456890099544606234)
,p_db_column_name=>'BRDDOCID'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Brddocid'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456879733115606189)
,p_db_column_name=>'PASSEDFACE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Passedface'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456880149982606192)
,p_db_column_name=>'''PASSEDFACE_IMG'''
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Face verified'
,p_column_html_expression=>'<span class="#PASSEDFACE#"></span>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456880562734606193)
,p_db_column_name=>'PASSEDFINGERPRINTS'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Fingerprints verified'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456880952849606195)
,p_db_column_name=>'''PASSEDFINGERPRINTS_IMG'''
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Fingerprints verified'
,p_column_html_expression=>'<span class="#PASSEDFINGERPRINTS#"></span>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456881301128606196)
,p_db_column_name=>'TRNSPRTUNITID'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Trnsprtunitid'
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
 p_id=>wwv_flow_api.id(456881776481606198)
,p_db_column_name=>'PSSNGRSTATUS'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Pssngrstatus'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456882104800606200)
,p_db_column_name=>'FLIGHT'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Flight'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456882593706606201)
,p_db_column_name=>'RNKDSGNTDID'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Rnkdsgntdid'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456890596352606235)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'359690'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'''ENTRY_IMG'':CREATED:OBSERVATION:''PASSEDFINGERPRINTS_IMG'':SERVER_ID:WORKSTATION_NAME:TRNSPRTUNITID:PSSNGRSTATUS:FLIGHT:RNKDSGNTDID'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'TS'
,p_sort_direction_2=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(456891049441606236)
,p_report_id=>wwv_flow_api.id(456890596352606235)
,p_name=>'Exits'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'EXITFLG'
,p_operator=>'='
,p_expr=>'0'
,p_condition_sql=>' (case when ("EXITFLG" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#6F97FC'
,p_row_font_color=>'#FFFFFF'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(456891454995606239)
,p_report_id=>wwv_flow_api.id(456890596352606235)
,p_name=>'Entries'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'EXITFLG'
,p_operator=>'='
,p_expr=>'1'
,p_condition_sql=>' (case when ("EXITFLG" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#B5B5B5'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(456891896340606241)
,p_report_id=>wwv_flow_api.id(456890596352606235)
,p_name=>'WrongMovements'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'PREVIOUS_ACTION'
,p_operator=>'='
,p_expr=>'0'
,p_condition_sql=>' (case when ("PREVIOUS_ACTION" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>30
,p_row_bg_color=>'#FF0000'
,p_row_font_color=>'#FFFFFF'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456892255385606243)
,p_plug_name=>'Offloads'
,p_parent_plug_id=>wwv_flow_api.id(456878540927606181)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>12
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456892599739606245)
,p_plug_name=>'Offloads Report'
,p_parent_plug_id=>wwv_flow_api.id(456892255385606243)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rownum,  o.*, tu.NAME as "FLIGHT"',
'FROM MOVEMENTS m',
'inner join OFFLOADS o on m.mvmntid = o.mvmntid',
'left join Transportunits tu on tu.trnsprtunitid = m.trnsprtunitid',
'WHERE BRDDOCID=GBD(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE,:DG_EXPIRATIONDATE) and EXITFLG = 2;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT o.*, m.*, tu.NAME as "FLIGHT"',
'FROM MOVEMENTS m',
'inner join OFFLOADS o on m.mvmntid = o.mvmntid',
'left join Transportunits tu on tu.trnsprtunitid = m.trnsprtunitid',
'WHERE BRDDOCID=GBD(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE,:DG_EXPIRATIONDATE) and EXITFLG = 2;'))
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(456893069038606250)
,p_name=>'Offloads Report'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>35971470466032433
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456893117465606250)
,p_db_column_name=>'OFFLDID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Offldid'
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
 p_id=>wwv_flow_api.id(456893505952606251)
,p_db_column_name=>'OFFLDRSNID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Offload Reason'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(496660971664852361)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456893914342606253)
,p_db_column_name=>'OBSERVATION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Observation'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456894321370606254)
,p_db_column_name=>'CREATED'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456894770751606255)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456895168410606257)
,p_db_column_name=>'WORKSTATION_NAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Workstation Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456895507655606258)
,p_db_column_name=>'SERVER_ID'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Server Id'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456895936938606260)
,p_db_column_name=>'MVMNTID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456896386266606261)
,p_db_column_name=>'FLIGHT'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Flight'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(456896795176606263)
,p_db_column_name=>'ROWNUM'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(456897104893606264)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'359756'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ROWNUM:CREATED:FLIGHT:CREATED_BY:WORKSTATION_NAME:OFFLDRSNID:OBSERVATION:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456897632734606266)
,p_plug_name=>'REG_RIGHT'
,p_parent_plug_id=>wwv_flow_api.id(456854339650606089)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456898035387606268)
,p_plug_name=>'Actions available:'
,p_parent_plug_id=>wwv_flow_api.id(456897632734606266)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_component_template_options=>'t-MediaList--showBadges:t-MediaList--showIcons:t-MediaList--horizontal'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(563837543247049624)
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456898423486606270)
,p_plug_name=>'<b>BLACKLIST ALERT</b>'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_region_attributes=>'style="background-color:#ff6666;font-weight: bolder"'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'P82_BLACKLISTHIT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456864936424606140)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(456864578867606139)
,p_button_name=>'BTN_RESULT'
,p_button_static_id=>'ID_MATCHED'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Matched Face'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check-square-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456849270926606063)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_api.id(456848806289606062)
,p_button_name=>'TAKE_OVER_THIS_PASSPORT_DATA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Take Over This Passport Data'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456870515059606156)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(456870112807606155)
,p_button_name=>'SAVEMOVEMENT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Movement'
,p_button_position=>'TOP'
,p_button_redirect_url=>'javascript:apex.confirm(''This will complete this process and save the movement - proceed?'', '||wwv_flow.LF||
'{'||wwv_flow.LF||
'  request:"REQUEST_PROCESSBORDERDOCUMENT",'||wwv_flow.LF||
'  showWait: true'||wwv_flow.LF||
'  }'||wwv_flow.LF||
');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'flaticon-passport4'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456866116306606144)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(456865781202606143)
,p_button_name=>'BTN_RESULT_FP'
,p_button_static_id=>'ID_FPMATCHED'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Please place Fingerprints'
,p_button_position=>'TOP'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456916657059606352)
,p_branch_name=>'ResetScanPassport'
,p_branch_action=>'f?p=&APP_ID.:17:&SESSION.:REQ_RESETSCAN:&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'REQUEST_PROCESSBORDERDOCUMENT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456849674210606066)
,p_name=>'P82_PASSPORT_NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(456848806289606062)
,p_prompt=>'Passport Number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456851203561606079)
,p_name=>'82_PASS_VISUAL_FACE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(456850826428606078)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="max-height:300px; max-width:200px;height:300px;width:200px";'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUAL_FACE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456851649129606080)
,p_name=>'82_PASS_VISUALPAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456850826428606078)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'height="400"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUALPAGE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456852071715606081)
,p_name=>'82_PASS_UVPAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456850826428606078)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'height="400"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_UVPAGE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456852496120606082)
,p_name=>'82_PASS_IRPAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456850826428606078)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'height="400"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_IRPAGE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456852805537606085)
,p_name=>'82_PASS_DG3_0'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456850826428606078)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_0'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456853122823606086)
,p_name=>'82_PASS_DG3_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456850826428606078)
,p_prompt=>'DG3'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'height="400"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_1'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456853516261606087)
,p_name=>'82_PASS_ICAO_FACE2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(456850826428606078)
,p_prompt=>'ICAO Face'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="max-height:300px; max-width:200px;height:300px;width:200px";'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456853900999606088)
,p_name=>'82_PHOTO_TO_MATCH_AGAINST'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(456850826428606078)
,p_prompt=>'To Match Against'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_tag_attributes=>'width="250" height="320"'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT NVL(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE''), PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUAL_FACE'')) face from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456859370380606120)
,p_name=>'P82_OVERALL_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456858987457606117)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' iconclass varchar2(4000) := '''';',
' htmlText varchar2(4000) := '''';',
'begin',
'',
'',
'',
'htmlText := ''<p>'' ;',
'htmlText := htmlText || ''<b>Passport checks: </b><br/>'';',
'',
'if(:DG_CHECKRESULTDATEOFBIRTH= ''true'') ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Date of Birth</span><br/>'';',
'',
'if(:DG_CHECKRESULTDOCUMENTNUMBER = ''true'') ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Document</span><br/>'';',
'',
'if(:DG_CHECKRESULTEXPIRATIONDATE = ''true'') ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Expiration Date</span><br/>'';',
'',
'if(:DG_CHECKRESULTOPTIONALDATA = ''true'') ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Optional Data Result</span><br/>'';',
'',
'',
'if(:DG_DOCUMENTNUMBER = :DG1_DOCUMENTNUMBER) ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Passport-Number</span><br/>'';',
'',
'if(:DG_LASTNAME = :DG1_LASTNAME) ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Last Name</span><br/>'';',
'',
'htmlText := htmlText || ''<br/><b>DG<->DG1: </b><br/>'';',
'if(NVL(:DG_GIVENNAME, '' '') = NVL(:DG1_GIVENNAME, '''')) ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Given Name</span><br/>'';',
'',
'if(:DG_DOCUMENTCLASSCODE = :DG1_DOCUMENTCLASSCODE) ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Document Class</span><br/>'';',
'',
'if(:DG_ISSUINGSTATECODE = :DG1_ISSUINGSTATECODE) ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Issuing State</span><br/>'';',
'',
'if(:DG_EXPIRATIONDATE = :DG1_EXPIRATIONDATE) ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Expiration Date</span><br/>'';',
'',
'if(:DG_GENDER= :DG1_GENDER) ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Gender</span><br/>'';',
'',
'if(:DG_DATEOFBIRTH= :DG1_DATEOFBIRTH) ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Date of Birth</span><br/>'';',
'',
'',
'',
'htmlText := htmlText || ''</p>'';',
'',
'return htmlText;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456859700076606121)
,p_name=>'P82_BLACKLISTHIT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456858987457606117)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456860136056606124)
,p_name=>'82_DG_FACECHECKED'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456858987457606117)
,p_prompt=>'Face verified'
,p_display_as=>'NATIVE_YES_NO'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'1'
,p_attribute_03=>'Face verified'
,p_attribute_04=>'0'
,p_attribute_05=>'Face not verified'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456860580644606125)
,p_name=>'82_DG_FINGERCHECKED'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456858987457606117)
,p_prompt=>'Fingerprints checked:'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'1'
,p_attribute_03=>'Fingerprints verified'
,p_attribute_04=>'0'
,p_attribute_05=>'Fingerprints not verified'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456860951780606126)
,p_name=>'P82_DUPLICATE_MOVEMENT_COUNT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(456858987457606117)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456861734185606129)
,p_name=>'82_DG_CHECKRESULTDATEOFBIRTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456861397540606128)
,p_prompt=>'Check Date of Birth:'
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
 p_id=>wwv_flow_api.id(456862176571606130)
,p_name=>'82_DG_CHECKRESULTDOCUMENTNUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456861397540606128)
,p_prompt=>'Check Document Number:'
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
 p_id=>wwv_flow_api.id(456862545869606131)
,p_name=>'82_DG_CHECKRESULTEXPIRATIONDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456861397540606128)
,p_prompt=>'Check Expiration Date:'
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
 p_id=>wwv_flow_api.id(456862924927606133)
,p_name=>'82_DG_CHECKRESULTFINAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456861397540606128)
,p_prompt=>'Check Result Final'
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
 p_id=>wwv_flow_api.id(456863344241606134)
,p_name=>'82_DG_CHECKRESULTOPTIONALDATA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(456861397540606128)
,p_prompt=>'Check Result Optional Data:'
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
 p_id=>wwv_flow_api.id(456867376734606148)
,p_name=>'P82_RANKDESIGNATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(456866998245606147)
,p_prompt=>'Rank Designation'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_RANKDESIGNATION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.NAME as d, p.id as r ',
'from RANKDESIGNATION p',
'where p.active > 0',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456867776939606149)
,p_name=>'82_TRNSPRTUNITID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456866998245606147)
,p_prompt=>'Flight'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.FLIGHTNUM || '' - '' || t.name || '' - '' || t2.name as d, t.trnsprtunitid as r ',
'from transportunits t',
'inner join flights f on f.flghtid = t.flghtid',
'inner join TRANSPORTSTATUS2 t2 on t2.id = t.TRNSPRTSTATUS2',
'inner join TRANSPORTSTATUS s on s.id = t.trnsprtstatus',
'where t.active > 0 and upper(s.name) = ''OPEN'' and t.DIRECTIONFLG = :MOVEMENT_ENTRY_EXIT',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'MOVEMENT_ENTRY_EXIT'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456868100825606150)
,p_name=>'82_MOVEMENT_ENTRY_EXIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456866998245606147)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Movement Type'
,p_source=>'AI_DEFAULT_EXITFLG'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_MOVEMENTACTION'
,p_lov=>'.'||wwv_flow_api.id(570709530368811123)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456868506175606151)
,p_name=>'82_SECURITY_DUPLICATE_MOVEMENTS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(456866998245606147)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456868981166606152)
,p_name=>'82_MVT_OBSERVATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(456866998245606147)
,p_prompt=>'Observation for this movement:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>250
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456869309272606153)
,p_name=>'P82_OFFLDRSNID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456866998245606147)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Offload Reason'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_OFFLOADREASON'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       offldrsnid as r',
'  from OFFLOADREASON',
'where active = 1',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456869785282606154)
,p_name=>'P82_PSSNGRSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(456866998245606147)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Passenger Status'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PASSENGERSTATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    nvl(display_value,display_value$dlc) d,',
'    num_value r',
'FROM',
'    dl_common.on_board_types$lc t',
'WHERE',
'    is_active = ''Y''',
'ORDER BY display_order;'))
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456871372735606160)
,p_name=>'82_DG_ISSUINGSTATENAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Issuing State Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456871751612606161)
,p_name=>'82_DG_DOCUMENTCLASSCODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Document Class Code:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456872138562606162)
,p_name=>'82_DG1_LASTNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456872593577606164)
,p_name=>'82_DG1_GIVENNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Given Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456872898837606165)
,p_name=>'82_DG1_DOCUMENTNUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Document Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456873368597606166)
,p_name=>'82_DG1_DOCUMENTCLASSCODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Document Class Code:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456873742066606167)
,p_name=>'82_DG1_ISSUINGSTATECODE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Issuing State Code:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456874157800606168)
,p_name=>'82_DG1_ISSUINGSTATENAME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Issuing State Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456874536571606169)
,p_name=>'82_DG1_EXPIRATIONDATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Expiration Date:'
,p_format_mask=>'YYMMDD'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456874906727606170)
,p_name=>'82_DG1_GENDER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ICAO_GENDER'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, ICAO r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where ICAO is not null',
'order by DISPLAY_ORDER;'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456875319059606172)
,p_name=>'82_DG1_DATEOFBIRTH'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Date of Birth'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456875716035606173)
,p_name=>'82_DG_LASTNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>4000
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456876101637606174)
,p_name=>'82_DG_GIVENNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Given Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>4000
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456876556439606175)
,p_name=>'82_DG_DOCUMENTNUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Document Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>15
,p_cMaxlength=>4000
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456876932478606176)
,p_name=>'82_DG_ISSUINGSTATECODE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Issuing State Code:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456877298698606178)
,p_name=>'82_DG_EXPIRATIONDATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Expiration Date  (YYMMDD):'
,p_format_mask=>'YYMMDD'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456877750007606179)
,p_name=>'82_DG_GENDER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ICAO_GENDER'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, ICAO r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where ICAO is not null',
'order by DISPLAY_ORDER;'))
,p_cHeight=>1
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456878112749606180)
,p_name=>'82_DG_DATEOFBIRTH'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(456870954554606159)
,p_prompt=>'Date of Birth (YYMMDD)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_cMaxlength=>4000
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(456898973552606284)
,p_computation_sequence=>10
,p_computation_item=>'P82_DUPLICATE_MOVEMENT_COUNT'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'from (',
'select row_number() over (PARTITION BY m.BRDDOCID ORDER BY m.BRDDOCID, m.CREATED desc) as rn, m.*',
'from MOVEMENTS m',
'where m.BRDDOCID = PKG_BORDERDOCUMENTS.Get_Document(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, :DG_EXPIRATIONDATE)',
') ',
'where rn = 1 ',
' and TRNSPRTUNITID = :TRNSPRTUNITID',
' and EXITFLG = :MOVEMENT_ENTRY_EXIT'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(456899332617606285)
,p_computation_sequence=>10
,p_computation_item=>'P82_BLACKLISTHIT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) ',
'FROM DL_V_PERSONBL p',
'where p.ACTIVE > 0 AND :DG_DOCUMENTNUMBER = PASSPORTNO;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(456899754732606286)
,p_computation_sequence=>10
,p_computation_item=>'SECURITY_DUPLICATE_MOVEMENTS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(BRDDOCID) ',
'from (',
'  select BRDDOCID, exitflg',
'  , lag(exitflg) over (order by CREATED) as previous',
'  from ( ',
'    select BRDDOCID, exitflg, CREATED',
'    from  MOVEMENTS ',
'    where BRDDOCID = PKG_BORDERDOCUMENTS.Get_Document(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, :DG_EXPIRATIONDATE)',
'      and exitflg < 2',
'    order by CREATED',
'  ) ',
')',
'where previous is not null and (exitflg - previous) = 0;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(456900134884606287)
,p_validation_name=>'VAL_DG_EXPIRATIONDATE'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       DECLARE',
'      v_currentdate DATE;',
'    BEGIN',
'IF (LENGTH(:DG_EXPIRATIONDATE) != 6) THEN',
'RETURN FALSE;',
'END IF;',
'      SELECT TO_DATE(:DG_EXPIRATIONDATE, ''YYMMDD'')',
'      INTO v_currentdate',
'      FROM dual;',
'      RETURN TRUE;',
'EXCEPTION WHEN OTHERS THEN',
'RETURN FALSE;',
'    END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Expiration Date must be valid and exactly 6 characters (YYMMDD)'
,p_always_execute=>'Y'
,p_validation_condition=>'REQUEST_PROCESSBORDERDOCUMENT'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(456877298698606178)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(456900580002606290)
,p_validation_name=>'VAL_DG_PASSEXPIRED'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       DECLARE',
'      v_currentdate DATE;',
'    BEGIN',
'IF (trunc(TO_DATE(:DG_EXPIRATIONDATE, ''YYMMDD'')) < trunc(sysdate)) THEN',
'RETURN FALSE;',
'END IF;',
'      RETURN TRUE;',
'EXCEPTION WHEN OTHERS THEN',
'RETURN FALSE;',
'    END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Attention - Passport expired'
,p_always_execute=>'Y'
,p_validation_condition=>'REQUEST_PROCESSBORDERDOCUMENT'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(456877298698606178)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(456900990818606291)
,p_validation_name=>'VAL_DG_ISSUINGSTATECODE'
,p_validation_sequence=>30
,p_validation=>'DG_ISSUINGSTATECODE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Issuing State Code must be filled'
,p_always_execute=>'Y'
,p_validation_condition=>'REQUEST_PROCESSBORDERDOCUMENT'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(456876932478606176)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(456901341797606292)
,p_validation_name=>'VAL_DG_DOCUMENTNUMBER'
,p_validation_sequence=>40
,p_validation=>'DG_DOCUMENTNUMBER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Passport Number must be filled!'
,p_always_execute=>'Y'
,p_validation_condition=>'REQUEST_PROCESSBORDERDOCUMENT'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(456876556439606175)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(456901765845606294)
,p_validation_name=>'TRNSPRTUNITID'
,p_validation_sequence=>50
,p_validation=>'TRNSPRTUNITID'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition=>':REQUEST = ''REQUEST_PROCESSBORDERDOCUMENT'' and :MOVEMENT_ENTRY_EXIT < 2'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(456867776939606149)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(456902194533606295)
,p_validation_name=>'P82_PSSNGRSTATUS'
,p_validation_sequence=>60
,p_validation=>'P82_PSSNGRSTATUS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition=>':MOVEMENT_ENTRY_EXIT < 2'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(456902587552606295)
,p_validation_name=>'P82_OFFLDRSNID'
,p_validation_sequence=>70
,p_validation=>'P82_OFFLDRSNID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition=>':MOVEMENT_ENTRY_EXIT = 2'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(456902970828606296)
,p_validation_name=>'NoDoubleMovement'
,p_validation_sequence=>80
,p_validation=>':P82_DUPLICATE_MOVEMENT_COUNT = 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Identical movement found. Movement cannot be processed twice.'
,p_always_execute=>'N'
,p_validation_condition=>':REQUEST = ''REQUEST_PROCESSBORDERDOCUMENT'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456905259095606308)
,p_name=>'DA_ToggleRegion'
,p_event_sequence=>1
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#DG_DOCUMENTNUMBER").val() != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456905753981606314)
,p_event_id=>wwv_flow_api.id(456905259095606308)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456854339650606089)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456906237886606317)
,p_event_id=>wwv_flow_api.id(456905259095606308)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456854339650606089)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456906740278606319)
,p_event_id=>wwv_flow_api.id(456905259095606308)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456847636308606045)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456907289262606320)
,p_event_id=>wwv_flow_api.id(456905259095606308)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456847636308606045)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456907749885606322)
,p_event_id=>wwv_flow_api.id(456905259095606308)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#REG_HIDEME").hide();',
'disconnectWebSocket();',
'//fv_connectFace();',
'fp_connectLF10();',
'//fv_connectWebCam();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456908222777606324)
,p_event_id=>wwv_flow_api.id(456905259095606308)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'connectWebSocket();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456908695969606325)
,p_name=>'DA_HideHighlights'
,p_event_sequence=>11
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456909133453606326)
,p_event_id=>wwv_flow_api.id(456908695969606325)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#R10871178105636500_control_panel'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456909533489606327)
,p_name=>'DA_TakeOverPassportData'
,p_event_sequence=>21
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(474069286518832365)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456910073785606329)
,p_event_id=>wwv_flow_api.id(456909533489606327)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'select trim(upper(:P82_PASSPORT_NUMBER)), ''MANUAL'', ''MANUAL'', ''500101''',
'into :DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, :DG_DOCUMENTCLASSCODE, :DG_EXPIRATIONDATE',
'from dual;',
'',
'select SURNAME, FIRSTNAME, DOCNO, DOCCODE, CNTRYCODE, COUNTRY, to_char(EXPIRYDATE,''yymmdd''), case when GENDER = 1 then 2 else 1 end as GENDER, to_char(DATEOFBIRTH,''yymmdd'')',
'into :DG_LASTNAME, :DG_GIVENNAME, :DG_DOCUMENTNUMBER, :DG_DOCUMENTCLASSCODE, :DG_ISSUINGSTATECODE, :DG_ISSUINGSTATENAME, :DG_EXPIRATIONDATE, :DG_GENDER, :DG_DATEOFBIRTH',
'from MDV_PASSPORTS',
'where docno = trim(upper(:P82_PASSPORT_NUMBER));',
'',
'exception ',
'when others then null; ',
'end;',
''))
,p_attribute_02=>'P82_PASSPORT_NUMBER'
,p_attribute_03=>'DG_LASTNAME,DG_GIVENNAME,DG_DOCUMENTNUMBER,DG_DOCUMENTCLASSCODE,DG_ISSUINGSTATECODE,DG_ISSUINGSTATENAME,DG_EXPIRATIONDATE,DG_GENDER,DG_DATEOFBIRTH'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456910583743606331)
,p_event_id=>wwv_flow_api.id(456909533489606327)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit({request:''REQUEST_STOREINSESSIONBAG''});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456910979508606332)
,p_name=>'DA_SetStatus'
,p_event_sequence=>31
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456911410261606334)
,p_event_id=>wwv_flow_api.id(456910979508606332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var statusDiv = $(''#REG_STATUS'')[0];',
'if(statusDiv != null){',
'  statusDiv.innerHTML = ''&P82_OVERALL_STATUS.'' ;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456911865755606335)
,p_name=>'DA_SetBlacklistTabBackground'
,p_event_sequence=>41
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456912337239606336)
,p_event_id=>wwv_flow_api.id(456911865755606335)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456854768141606090)
,p_attribute_01=>'$(''span:contains(Blacklist)'').parent().css(''background-color'',''#ff6666'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456912760863606337)
,p_name=>'DA_ChangeDirection'
,p_event_sequence=>51
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'MOVEMENT_ENTRY_EXIT'
,p_condition_element=>'MOVEMENT_ENTRY_EXIT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456913209793606339)
,p_event_id=>wwv_flow_api.id(456912760863606337)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P82_OFFLDRSNID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456913795658606340)
,p_event_id=>wwv_flow_api.id(456912760863606337)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P82_OFFLDRSNID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456914220907606342)
,p_event_id=>wwv_flow_api.id(456912760863606337)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'TRNSPRTUNITID,P82_PSSNGRSTATUS,P82_RANKDESIGNATION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456914760998606343)
,p_event_id=>wwv_flow_api.id(456912760863606337)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'TRNSPRTUNITID,P82_PSSNGRSTATUS,P82_RANKDESIGNATION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456915142179606344)
,p_name=>'DA_ChangePassangerStatus'
,p_event_sequence=>61
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P82_PSSNGRSTATUS'
,p_condition_element=>'P82_PSSNGRSTATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456915643863606345)
,p_event_id=>wwv_flow_api.id(456915142179606344)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P82_RANKDESIGNATION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456916189793606347)
,p_event_id=>wwv_flow_api.id(456915142179606344)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P82_RANKDESIGNATION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456903241229606297)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CRATEBORDERDOCUMENT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--CREATEBORDERDOCUMENT(:DG_DOCUMENTNUMBER, :DG_DOCUMENTCLASSCODE, :DG_ISSUINGSTATECODE, :DG_EXPIRATIONDATE, :DG_LASTNAME, :DG_GIVENNAME, :DG_GENDER, :DG_DATEOFBIRTH, SB(''PASS_VISUAL_FACE''), SB(''PASS_ICAO_FACE''), SB(''PASS_VISUALPAGE''), SB(''PASS_UVPAGE'
||'''), SB(''PASS_IRPAGE''), SB(''PASS_DG3_0''), SB(''PASS_DG3_1'') );',
'PKG_BORDERDOCUMENTS.Create_Document(:DG_DOCUMENTNUMBER, ',
'                                    :DG_DOCUMENTCLASSCODE, ',
'                                    :DG_ISSUINGSTATECODE, ',
'                                    :DG_EXPIRATIONDATE, ',
'                                    :DG_LASTNAME, ',
'                                    :DG_GIVENNAME, ',
'                                    :DG_GENDER, ',
'                                    :DG_DATEOFBIRTH,',
'                                    :DG_MRZ,',
'                                    PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUAL_FACE''), ',
'                                    PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE''), ',
'                                    PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUALPAGE''), ',
'                                    null, ',
'                                    null, ',
'                                    PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_0''), ',
'                                    PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_1'') );'))
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Error during processinng the passport - possible corrupted! ',
'#SQLERRM#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':REQUEST = ''REQUEST_PROCESSBORDERDOCUMENT'' ',
''))
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Border Control Record processed'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456903656370606300)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATEBORDERMOVEMENT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DL_MALE_BC.CREATEBORDERMOVEMENT(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, :DG_EXPIRATIONDATE, :MOVEMENT_ENTRY_EXIT, :MVT_OBSERVATION, 0, :DG_FINGERCHECKED, :TRNSPRTUNITID, :AI_TERMINAL_IP, :P82_PSSNGRSTATUS, :P82_RANKDESIGNATION);',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST = ''REQUEST_PROCESSBORDERDOCUMENT'' and :MOVEMENT_ENTRY_EXIT <> 2'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456904087416606303)
,p_process_sequence=>22
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OFFLOAD_PERSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' success number;',
'begin',
'    success := DL_MALE_BC.OFFLOAD_PERSON(TRIM(:DG_DOCUMENTNUMBER), :P82_OFFLDRSNID, :MVT_OBSERVATION, :AI_TERMINAL_IP);',
'    if(success = 0)then',
'        raise NO_DATA_FOUND ;',
'    end if;',
'end;'))
,p_process_error_message=>'Cannot Offload. Last Movement is not an exit.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST = ''REQUEST_PROCESSBORDERDOCUMENT'' and :MOVEMENT_ENTRY_EXIT = 2'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Successfully Offloaded &DG_DOCUMENTNUMBER.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456904487701606305)
,p_process_sequence=>25
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear_Session_Bag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUAL_FACE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_ICAO_FACE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUALPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_UVPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_IRPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG3_0'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG3_1'');',
''))
,p_process_when=>'REQ_RESETSCAN, REQUEST_PROCESSBORDERDOCUMENT'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456904815596606306)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear_Page_Items'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'17'
,p_process_when=>'REQ_RESETSCAN, REQUEST_PROCESSBORDERDOCUMENT'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
