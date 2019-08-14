prompt --application/pages/page_08005
begin
wwv_flow_api.create_page(
 p_id=>8005
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Passenger Display Maintenance'
,p_page_mode=>'NORMAL'
,p_step_title=>'Passenger Display Maintenance'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
'#APP_IMAGES#BioScreenDisplayControl.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#APP_IMAGES#BioScreenMaintenance.js'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#TRANSFER_PROGRESS_AREA>div {',
'    min-height: 2em;',
'}'))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'CHRISTINA'
,p_last_upd_yyyymmddhh24miss=>'20181114144514'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(155983333700829695)
,p_plug_name=>'Dynamic Object List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>42
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<script>v_display_objects = []'');',
'for c_row in (select object_id, object_name, decode(delete_flag, 0, ''false'', ''true'') delete_flag, decode(is_default, 0, ''false'', ''true'') is_default, decode(is_video, 0, ''false'', ''true'') is_video from display_objects) loop',
'    htp.p(''v_display_objects.push({object_id:'' || c_row.object_id || '',object_name:"'' || c_row.object_name || ''",delete_flag:'' || c_row.delete_flag || '',is_default:'' || c_row.is_default || '',is_video:'' || c_row.is_video || ''});'');',
'end loop;',
'htp.p(''</script>'');',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(155983864399829700)
,p_plug_name=>'Passenger Display Status'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>62
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(155985230161829714)
,p_plug_name=>'Transfer Display Content'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>82
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Click the Button below to start the transfer to the display.<br>',
'Warning: This will remove all existing content from the display before uploading the new content.</p>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(155985505221829716)
,p_plug_name=>'Transfer Progress'
,p_region_name=>'TRANSFER_PROGRESS_AREA'
,p_parent_plug_id=>wwv_flow_api.id(155985230161829714)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-md'
,p_region_attributes=>'style="display:none"'
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
 p_id=>wwv_flow_api.id(177576041657428400)
,p_plug_name=>'WebSocket Server Version Check'
,p_region_name=>'dialogVersionCheck'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>92
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177576307955428402)
,p_plug_name=>'WebSocket Server Version Too Old'
,p_region_name=>'serverTooOld'
,p_parent_plug_id=>wwv_flow_api.id(177576041657428400)
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Your version of the WebSocket Server is too old!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177576345061428403)
,p_plug_name=>'WebSocket Server Not Available'
,p_region_name=>'serverNotAvailable'
,p_parent_plug_id=>wwv_flow_api.id(177576041657428400)
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'The local WebSocket Server could not be contacted! Please contact your System Administrator!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177576642851428406)
,p_plug_name=>'Passenger Display Not Available'
,p_region_name=>'displayNotAvailable'
,p_parent_plug_id=>wwv_flow_api.id(177576041657428400)
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Could not connect to the Passenger Display! Please contact your System Administrator!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(155985409434829715)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(155985230161829714)
,p_button_name=>'P8005_START_TRANSFER'
,p_button_static_id=>'P8005_START_TRANSFER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Start Transfer'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'deletebutton'
,p_icon_css_classes=>'fa-cloud-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177576168124428401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(177576041657428400)
,p_button_name=>'CLOSE_VERSION_CHECK'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155984010871829701)
,p_name=>'P8005_TOTAL_OBJECTS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(155983864399829700)
,p_prompt=>'Total Display Objects:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155984042304829702)
,p_name=>'P8005_NEW_OBJECTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(155983864399829700)
,p_prompt=>'New Display Objects:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155984184674829703)
,p_name=>'P8005_DELETE_OBJECTS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(155983864399829700)
,p_prompt=>'Obsolete Display Objects:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(155984308500829704)
,p_name=>'Test existing Videos'
,p_event_sequence=>20
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'testExistingVideos'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(155983592403829697)
,p_event_id=>wwv_flow_api.id(155984308500829704)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let disableStartButton = function() {',
'    $("#P8005_START_TRANSFER").prop("disabled", true);',
'};',
'',
'let enableStartButton = function() {',
'    $("#P8005_START_TRANSFER").prop("disabled", false);',
'};',
'',
'disableStartButton();',
'',
'checkServerIsOnline()',
'    .then((isOnline) => {',
'        console.log("is online: ", isOnline);',
'        if (isOnline) {',
'            return displayVersionCheckOkay();',
'        } else {',
'            HideSpinner();',
'            $("#serverNotAvailable").show();',
'            openModal("dialogVersionCheck");',
'        }',
'    })',
'    .then((versionOkay) => {',
'        return displayClear();',
'    }, () => {',
'        HideSpinner();',
'        $("#serverTooOld").show();',
'        openModal("dialogVersionCheck");',
'    })',
'	.then(() => {',
'		return displayCheck();',
'    }, () => {',
'        HideSpinner();',
'        $("#displayNotAvailable").show();',
'        openModal("dialogVersionCheck");',
'	})',
'    .then((actions) => {',
'        let counts = actions[1];',
'        actions = actions[0];',
'        let sizes = [];',
'        let promises = [];',
'        for (let i in actions) {',
'            let action = actions[i].action;',
'            let id = actions[i].id;',
'            if (action == "insert") {',
'                promises.push(new Promise(function(done) {',
'                    executePageProcess("GET_DISPLAY_OBJECT_SIZE", [id], (data) => done({id:id,size:JSON.parse(data).size}));',
'                }));',
'            }',
'        }',
'        Promise.all(promises).then((sizes) => {',
'            let uploadFiles = {};',
'',
'            for (let i in sizes) {',
'                uploadFiles[sizes[i].id] = Object.assign({size: sizes[i].size}, getDisplayObjectById(sizes[i].id));;',
'            }',
'            ',
'            refreshUploadInformation(uploadFiles, counts);',
'            ',
'            enableStartButton();',
'        })',
'    }, () => {',
'		console.error("DISPLAY could not be checked! 2");',
'    })',
';',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(155984858291829710)
,p_name=>'Test Display'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(155984989738829711)
,p_event_id=>wwv_flow_api.id(155984858291829710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ShowSpinner();',
'apexCustomEvent("testExistingVideos");',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(155985598966829717)
,p_name=>'Click: Start Transfer'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(155985409434829715)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(155985651170829718)
,p_event_id=>wwv_flow_api.id(155985598966829717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P8005_START_TRANSFER").hide();',
'ShowSpinner();',
'uploadVideos().then(() => {',
'    HideSpinner();',
'    $("#P8005_START_TRANSFER").show();',
'}, (msg) => {',
'    HideSpinner();',
'    alert(msg);',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(177576445918428404)
,p_name=>'Close Dialog'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(177576168124428401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(177576565523428405)
,p_event_id=>wwv_flow_api.id(177576445918428404)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(155983630239829698)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOAD_DISPLAY_OBJECT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_bool boolean;',
'begin',
'    apex_json.open_object();',
'    for c_row in (select is_video, is_default, content from display_objects where object_id = apex_application.g_x01) loop',
'        l_bool := case when c_row.is_video = 0 then false else true end;',
'        apex_json.write(''is_video'', l_bool);',
'        l_bool := case when c_row.is_default = 0 then false else true end;',
'        apex_json.write(''is_default'', l_bool);',
'        apex_json.write(''content'', dl_common.pkg_util.encode_base64(c_row.content));',
'    end loop;',
'    apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(155983733626829699)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_DISPLAY_OBJECT_SIZE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object();',
'for c_row in (select content from display_objects where object_id = apex_application.g_x01) loop',
'    apex_json.write(''size'', dbms_lob.getlength(c_row.content));',
'end loop;',
'apex_json.close_object();',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
