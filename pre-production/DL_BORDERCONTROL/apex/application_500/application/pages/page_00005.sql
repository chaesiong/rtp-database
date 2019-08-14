prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Supervisor Login'
,p_page_mode=>'MODAL'
,p_step_title=>'Supervisor Login'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#jquery.ambiance.js',
'#WORKSPACE_IMAGES#GenericFunctions.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function showTimeoutMessage(regionId, timeoutSeconds) {',
'	var reg = $("#" + regionId);',
'	var cnt = reg.find(".countdown");',
'	if (cnt.length == 0) {',
'		reg.append(''<span class="countdown"></span>'');',
'		cnt = reg.find(".countdown");',
'	}',
'	reg.show();',
'	var showCountdown = function() {',
'		cnt.text(timeoutSeconds);',
'	}',
'	var counter = function() {',
'		timeoutSeconds -= 1;',
'		showCountdown();',
'		if (timeoutSeconds < 1) {',
'			window.clearInterval(timer);',
'			reg.hide();',
'		}',
'	}',
'	showCountdown();',
'	var timer = window.setInterval(counter, 1000);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//$("#REG_HIDDEN").hide();',
'',
'$s("P5_IS_AUTHENTICATED", "0");',
'$("#P5_SUPERVISOR_LOGIN").focus();'))
,p_css_file_urls=>'#APP_IMAGES#workflow.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.problemdetail {',
'	    color: red;',
'	    font-size: 1.6rem;',
'	    padding-left: 5%;',
'	    margin-bottom: 1rem;',
'}',
'',
'/*.problemarea {',
'	    font-family: ''Helvetica Neue'',''Segoe UI'',Helvetica,Arial,sans-serif !important;',
'    padding-top: 1em;',
'	}',
'',
'b {',
'		    font-family: ''Helvetica Neue'',''Segoe UI'',Helvetica,Arial,sans-serif !important;',
'}*/',
'',
'.problemnote {',
'	    font-size: 1.6rem;',
'	    padding-left: 5%;',
'	    line-height: 1.5;',
'	    margin-bottom: 1em;',
'}',
'',
'.countdown {',
'    position: absolute;',
'	    right: 1em;',
'	    top: 50%;',
'	    transform: translateY(-50%);',
'	    font-size: 1.2em;',
'}',
'',
'.t-Dialog-body {',
'    padding: 0 !important;',
'}',
'',
'.workflow-check-entry-logo {',
'    width: 2rem;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'650'
,p_dialog_width=>'900'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190522013419'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(841916343893743989)
,p_plug_name=>'Login'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(852089825762274901)
,p_plug_name=>'Un-processed items detected'
,p_icon_css_classes=>'fa-key'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'In case of exception, please specify the reason'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(894907416027996905)
,p_plug_name=>'Login Failed'
,p_region_name=>'REG_ALERT_LOGIN_FAILED'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_region_attributes=>'style="display:none"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940462356397497691)
,p_plug_name=>'REG_PROBLEMS'
,p_region_name=>'REG_PROBLEMS'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>9
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940474181013620090)
,p_plug_name=>'REG_HIDDEN'
,p_region_name=>'REG_HIDDEN'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_region_attributes=>'style="display: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940696301666088648)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(941923106693684489)
,p_plug_name=>'Need Other Supervisor'
,p_region_name=>'REG_ALERT_NEED_OTHER_SUPERVISOR'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_region_attributes=>'style="display: none;"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>6
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(941997851097948258)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(940474181013620090)
,p_button_name=>'P5_HIDDEN_BTN_APPROVE'
,p_button_static_id=>'P5_HIDDEN_BTN_APPROVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Hidden Btn Approve'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(841916647773747973)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(940696301666088648)
,p_button_name=>'approve'
,p_button_static_id=>'P5_BTN_APPROVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Approve this Action'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-key'
,p_button_cattributes=>'style="margin-right: 8px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(940561320098811966)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(940696301666088648)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119106570577171029)
,p_name=>'P5_DUMMY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(940474181013620090)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>0
,p_cMaxlength=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313155178646585793)
,p_name=>'P5_SUPERVISOR_LOGIN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(841916343893743989)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Supervisor Login:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'autofocus'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' l_count number;',
'begin',
'  ',
'  -- no supervisor login in case of zero/approved/cancelled blacklist hit',
'  if :CHECK_BLACKLISTALERT = 0 OR (:CHECK_BLACKLISTALERT = 1 AND :P17_BLACKLISTALERT_ACTION IN (''A'', ''C'')) then',
'    return false;',
'  end if;',
'  ',
'  select Count(*)',
'  into l_count',
'  from user_management.role_object_grant_rel rogr',
'  join USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'  join user_management.users u on u.id = user_id',
'  join user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'  where u.username = upper(:APP_USER)',
'  and urr.role_id = ''BMBS_SUP''',
'  ;',
'  ',
'  if l_count > 0 then',
'    return false;',
'  else',
'    return true;',
'  end if;',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'notify_enterpressed'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(841931971472263408)
,p_name=>'P5_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(841916343893743989)
,p_prompt=>'Supervisor Password:'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' l_count number;',
'begin',
'  ',
'  -- no supervisor login in case of zero/approved/cancelled blacklist hit',
'  if :CHECK_BLACKLISTALERT = 0 OR (:CHECK_BLACKLISTALERT = 1 AND :P17_BLACKLISTALERT_ACTION IN (''A'', ''C'')) then',
'    return false;',
'  end if;',
'  ',
'  select Count(*)',
'  into l_count',
'  from user_management.role_object_grant_rel rogr',
'  join USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'  join user_management.users u on u.id = user_id',
'  join user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'  where u.username = upper(:APP_USER)',
'  and urr.role_id = ''BMBS_SUP''',
'  ;',
'  ',
'  if l_count > 0 then',
'    return false;',
'  else',
'    return true;',
'  end if;',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'notify_enterpressed'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852088806376187972)
,p_name=>'P5_IS_AUTHENTICATED'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(841916343893743989)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(894672446739431746)
,p_name=>'P5_LOGIN_SUCCESSFUL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(841916343893743989)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(917448403435325809)
,p_name=>'P5_REASON'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(841916343893743989)
,p_prompt=>'Reason:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>256
,p_cHeight=>1
,p_tag_css_classes=>'notify_enterpressed'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(940033864508233457)
,p_name=>'P5_WORKFLOWPROBLEMS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(940474181013620090)
,p_prompt=>'Workflow Problems'
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
 p_id=>wwv_flow_api.id(941922888313669352)
,p_name=>'P5_P_1005_MST_PASSCHECK_4EYES'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(940474181013620090)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P 1005 Mst Passcheck 4eyes'
,p_source=>'AI_P_1005_mst_passcheck_4eyes'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5173630591291838611)
,p_name=>'P5_WF_PROBLEMS_12'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(940474181013620090)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(852294926860983785)
,p_name=>'DA_CLEARDATA'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(852295353073983791)
,p_event_id=>wwv_flow_api.id(852294926860983785)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P5_SUPERVISOR_LOGIN").empty();',
'$("#P5_PASSWORD").empty();',
'$("#P5_WORKFLOWPROBLEMS").empty();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(841916929561750466)
,p_name=>'DA_CLOSEME_ONBUTTONCLICK'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(841916647773747973)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(852082234720142171)
,p_event_id=>wwv_flow_api.id(841916929561750466)
,p_event_result=>'TRUE'
,p_action_sequence=>9
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_authenticated number := 0;',
'    l_is_auth_required varchar2(1) := ''Y'';',
'begin',
'    -- no supervisor login in case of zero/approved/cancelled blacklist hit',
'    if :CHECK_BLACKLISTALERT = 0 OR (:CHECK_BLACKLISTALERT = 1 AND :P17_BLACKLISTALERT_ACTION IN (''A'', ''C'')) then',
'        l_is_auth_required := ''N'';',
'    end if;',
'    ',
'    if l_is_auth_required = ''Y'' then',
'        begin',
'            -- supervisor does not need to login',
'            select 1',
'            into l_authenticated',
'            from dual',
'            where exists (select 1',
'                from user_management.role_object_grant_rel rogr',
'                join USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'                join user_management.users u on u.id = user_id',
'                join user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'                where u.username = upper(:APP_USER)',
'                and urr.role_id = ''BMBS_SUP''',
'            );',
'        exception when others then',
'            null;',
'        end;',
'        begin',
'            if l_authenticated < 1 then',
'                -- Check password',
'                user_management.pkg_man_users.authenticate(:P5_SUPERVISOR_LOGIN, :P5_PASSWORD);',
'                -- Check permissions',
'                select 1',
'                into l_authenticated',
'                from dual',
'                where exists (select 1',
'                    from user_management.role_object_grant_rel rogr',
'                    join USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'                    join user_management.users u on u.id = user_id',
'                    join user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'                    where u.username = upper(nvl(:P5_SUPERVISOR_LOGIN, :APP_USER))',
'                    and urr.role_id = ''BMBS_SUP''',
'                );',
'            end if;',
'        exception when others then',
'            null;',
'        end;',
'    end if;',
'    ',
'    :P17_SUPERVISOR_AUTHENTICATED := l_authenticated;',
'    ',
'    if l_authenticated > 0 or l_is_auth_required = ''N'' then',
'        select nvl(:P5_SUPERVISOR_LOGIN, :APP_USER), ',
'             :P5_REASON ',
'        into :P17_SUPERVISOR_NAME, ',
'             :P17_SUPERVISOR_REASON ',
'        from dual;',
'    end if;',
'',
'    :P5_IS_AUTHENTICATED := case when l_is_auth_required = ''N'' then 1 else :P17_SUPERVISOR_AUTHENTICATED end;',
'end;',
'',
''))
,p_attribute_02=>'P17_MVMNTID,P5_SUPERVISOR_LOGIN,P5_PASSWORD,P5_REASON'
,p_attribute_03=>'P17_SUPERVISOR_AUTHENTICATED,P5_IS_AUTHENTICATED'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(894747364065672054)
,p_event_id=>wwv_flow_api.id(841916929561750466)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($("#P5_IS_AUTHENTICATED").val() == 1) {',
'    apexCustomEvent(''saveProblemsList'');',
'    return true;',
'}else{',
'',
'showTimeoutMessage("REG_ALERT_LOGIN_FAILED", 5);',
'/*$("#REG_ALERT_LOGIN_FAILED").show();',
'window.setTimeout(function() {$("#REG_ALERT_LOGIN_FAILED").hide();}, 5000);*/',
'return false;',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(841917346923750469)
,p_event_id=>wwv_flow_api.id(841916929561750466)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(894958636628138919)
,p_name=>'DA_CLOSEME'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(941997851097948258)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(917647552572763976)
,p_event_id=>wwv_flow_api.id(894958636628138919)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var empty = false;',
'empty = empty || $("#P5_SUPERVISOR_LOGIN").val().trim().length == 0;',
'empty = empty || $("#P5_PASSWORD").val().trim().length == 0;',
'empty = empty || $("#P5_REASON").val().trim().length == 0;',
'',
'return !empty;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941924137681719539)
,p_event_id=>wwv_flow_api.id(894958636628138919)
,p_event_result=>'TRUE'
,p_action_sequence=>7
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var need4Eyes = parseInt($("#P5_P_1005_MST_PASSCHECK_4EYES").val()) > 0;',
'var supervisor = $v("P5_SUPERVISOR_LOGIN").trim().toUpperCase();',
'var user = "&APP_USER.".trim().toUpperCase();',
'',
'if (need4Eyes && supervisor == user) {',
'  showTimeoutMessage("REG_ALERT_NEED_OTHER_SUPERVISOR", 8);',
'  /*$("#REG_ALERT_NEED_OTHER_SUPERVISOR").show();',
'  window.setTimeout(function() { $("#REG_ALERT_NEED_OTHER_SUPERVISOR").hide(); }, 8000);*/',
'  return false;',
'}',
'return true;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(894959430272138947)
,p_event_id=>wwv_flow_api.id(894958636628138919)
,p_event_result=>'TRUE'
,p_action_sequence=>9
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_count number;',
'begin',
'  select count(*)',
'  into l_count',
'  from user_management.role_object_grant_rel rogr',
'  join USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'  join user_management.users u on u.id = user_id',
'  join user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'  where u.username = upper(:P5_SUPERVISOR_LOGIN)',
'  and urr.role_id = ''BMBS_SUP'';',
'  ',
'  if l_count = 0 ',
'    then :P17_SUPERVISOR_AUTHENTICATED := 0;',
'  else',
'    :P17_SUPERVISOR_AUTHENTICATED := 1;',
'  end if;',
'',
'  select :P5_SUPERVISOR_LOGIN, ',
'         :P5_REASON ',
'    into :P17_SUPERVISOR_NAME, ',
'         :P17_SUPERVISOR_REASON ',
'  from dual;',
'  ',
'  :P5_IS_AUTHENTICATED := :P17_SUPERVISOR_AUTHENTICATED;',
'end;'))
,p_attribute_02=>'P5_SUPERVISOR_LOGIN,P5_PASSWORD,P5_REASON'
,p_attribute_03=>'P17_SUPERVISOR_AUTHENTICATED,P5_IS_AUTHENTICATED'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(894958981627138947)
,p_event_id=>wwv_flow_api.id(894958636628138919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($("#P5_IS_AUTHENTICATED").val() == 1) {',
'  return true;',
'}',
'',
'showTimeoutMessage("REG_ALERT_LOGIN_FAILED", 8);',
'/*$("#REG_ALERT_LOGIN_FAILED").show();',
'window.setTimeout(function() {$("#REG_ALERT_LOGIN_FAILED").hide();}, 2000);*/',
'return false;',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(894959870260138949)
,p_event_id=>wwv_flow_api.id(894958636628138919)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(940463068347511177)
,p_name=>'DA_SHOWPROBLEMS'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(940463422613511179)
,p_event_id=>wwv_flow_api.id(940463068347511177)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(940462356397497691)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var problems = parent.getProblemList() || [];',
'',
'if (!!problems && problems.length > 0) {',
'    $s("P5_WORKFLOWPROBLEMS", JSON.stringify(problems));',
'    ',
'    if (parent.$(".logo-fp-vs-history-check").parent().hasClass("workflow-check-entry-bad"))',
'        $s("P5_WF_PROBLEMS_12", "1");',
'}',
'',
'var ul = $("<ul>").addClass("supervisor-dialog supervisor-workflow-problems");',
'',
'problems.slice().forEach(function(problem) {',
'    let li = [];',
'    if (Array.isArray(problem)) {',
'        let problemText = problem[0];',
'        let problemItems = problem.slice(1)[0];',
'        let subItems = $("<ul>");',
'        problemItems.forEach(function(problem) {',
'            subItems.append($("<li>").text(problem));',
'        });',
'        li.push(',
'            $("<li>").append(',
'                $("<div>")',
'                    .addClass("supervisor-dialog workflow-check-entry workflow-check-entry-bad")',
'                    .append(',
'                        $("<div>")',
'                            .addClass("fa fa-minus-circle workflow-check-entry-logo")',
'                    ).append(',
'                        $("<div>")',
'                            .addClass("supervisor-dialog workflow-check-entry-text")',
'                            .text(problemText)',
'                    )',
'            )',
'        );',
'        li.push(',
'            $("<li>").append(',
'                $("<div>")',
'                    .addClass("supervisor-dialog workflow-check-entry workflow-check-entry-bad")',
'                    .append(',
'                        $("<div>")',
'                            .addClass("fa workflow-check-entry-logo")',
'                    ).append(',
'                        $("<div>")',
'                            .addClass("supervisor-dialog workflow-check-entry-text")',
'                            .append(subItems)',
'                    )',
'            )',
'        );',
'    } else {',
'        li.push(',
'            $("<li>").append(',
'                $("<div>")',
'                    .addClass("supervisor-dialog workflow-check-entry workflow-check-entry-bad")',
'                    .append(',
'                        $("<div>")',
'                            .addClass("fa fa-minus-circle workflow-check-entry-logo")',
'                    ).append(',
'                        $("<div>")',
'                            .addClass("supervisor-dialog workflow-check-entry-text")',
'                            .text(problem)',
'                    )',
'            )',
'        );',
'    }',
'    ul.append(li);',
'});',
'',
'$("#REG_PROBLEMS").html(ul);//.append($v("P5_WORKFLOWPROBLEMS"));',
'',
'// default reason for health check',
'if (!$v("P5_REASON") && parent.$(".logo-health-check").parent().hasClass("workflow-check-entry-bad")) {',
'    let v_r = "ผ่านการตรวจโรคแล้ว";',
'    if (document.getElementById("REG_PROBLEMS").querySelectorAll("ul.supervisor-dialog.supervisor-workflow-problems > li").length > 2) v_r += " ";',
'    $("#P5_REASON").val(v_r);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(940569326838817165)
,p_name=>'DA_CLOSEDIALOG'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(940561320098811966)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(940569717420817166)
,p_event_id=>wwv_flow_api.id(940569326838817165)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(942013176431982993)
,p_name=>'DA_CLOSEME_ONENTERPRESSED'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.notify_enterpressed'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === 13 && $("#P5_REASON").val().trim().length != 0'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(942013573423982995)
,p_event_id=>wwv_flow_api.id(942013176431982993)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//$("#P5_HIDDEN_BTN_APPROVE").trigger("click");',
'$("#P5_BTN_APPROVE").trigger("click");',
'return false;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(155987619126829737)
,p_name=>'P5_REASON: Activate Save Button'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_REASON'
,p_condition_element=>'P5_REASON'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(155987642611829738)
,p_event_id=>wwv_flow_api.id(155987619126829737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(841916647773747973)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(155987746639829739)
,p_event_id=>wwv_flow_api.id(155987619126829737)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(841916647773747973)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5173630650422838612)
,p_name=>'Save Workflow Problems list'
,p_event_sequence=>70
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'saveProblemsList'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173630793734838613)
,p_event_id=>wwv_flow_api.id(5173630650422838612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_seqno    NUMBER := 17;',
'    l_seqno_12 NUMBER := 1712;',
'    l_data     VARCHAR2(4000) := SUBSTR(TRIM(:P5_WORKFLOWPROBLEMS), 1, 4000);',
'    l_return   NUMBER;',
'BEGIN',
'    IF l_data IS NOT NULL THEN',
'        l_return := dl_bordercontrol.dl_movementhandling.add_modify_varchar',
'                    (',
'                        p_MVMNTID         => :P17_MVMNTID',
'                        ,p_SEQNO          => l_seqno',
'                        ,p_DATA           => l_data',
'                        ,p_INS_TERMINAL   => :AI_TERMINAL_ID',
'                        ,p_INS_BORDERPOST => :AI_BORDERPOST_ID',
'                    );',
'                    ',
'        -- extra record for FP vs History',
'        IF TO_NUMBER(:P5_WF_PROBLEMS_12) = 1 THEN',
'            l_return := dl_bordercontrol.dl_movementhandling.add_modify_varchar',
'                        (',
'                            p_MVMNTID         => :P17_MVMNTID',
'                            ,p_SEQNO          => l_seqno_12',
'                            ,p_DATA           => ''Y''',
'                            ,p_INS_TERMINAL   => :AI_TERMINAL_ID',
'                            ,p_INS_BORDERPOST => :AI_BORDERPOST_ID',
'                        );',
'        END IF;',
'    END IF;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        NULL;',
'        ',
'END;'))
,p_attribute_02=>'P5_WORKFLOWPROBLEMS,P5_WF_PROBLEMS_12'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(852294447239966923)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'PROC_CLEAR'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(940147176566549746)
,p_process_sequence=>11
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_TAKEOVERPROBLEMDATA'
,p_process_sql_clob=>':P5_WORKFLOWPROBLEMS := :P17_WORKFLOW_PROBLEMS;'
);
end;
/
