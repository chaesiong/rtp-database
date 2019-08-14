prompt --application/pages/page_00112
begin
wwv_flow_api.create_page(
 p_id=>112
,p_user_interface_id=>wwv_flow_api.id(92393441321433977)
,p_name=>'Login Progress'
,p_page_mode=>'MODAL'
,p_step_title=>'Login Progress'
,p_step_sub_title=>'Other User Sessions'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(92344533253433677)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'950'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190324041539'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(350405222336813025)
,p_plug_name=>'User Information'
,p_region_name=>'user_info'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(92349780431433729)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You have other sessions where you are logged on.<br>',
'This can happen even if you have not logged off correctly. For example, because the browser has been closed.<br><br>',
'<!--',
'<b>Security Policy:</b><br>',
'You can only log in once with your data. Multiple logins with the same data are not allowed.',
'Click on the button to delete (log off) the other sessions now and log in here.<br>',
'See the list below for more informations about the other sessions!',
'<br>',
'<br>',
'<br>',
'-->'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(350762273110989769)
,p_plug_name=>'Session List'
,p_region_name=>'session_list'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(92356180518433747)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   --apex_item.checkbox2(1, apex_session_id, ''CHECKED'') as chkbox',
'         apex_session_id',
'         , workspace_name',
'         , session_created',
'         , replace(to_char(to_timestamp(to_char(least(idle_timeout_on, life_timeout_on), ''dd.mm.yyyy hh24:mi:ss''), ''dd.mm.yyyy hh24:mi:ss'') - systimestamp), ''000'', ''00'') as Session_Time_Left',
'         , idle_timeout_on, life_timeout_on',
'         , remote_addr',
'         , user_name',
'         , session_time_zone',
'         , session_lang',
'         , session_territory',
'         , ras_sessionid',
'         , workspace_user_id',
'         , debug_level',
'         , trace_mode',
'         , timeout_computation',
'from     dl_common.v_apex_sessions',
'where    user_name = v(''APP_USER'')',
'         and apex_session_id != v(''APP_SESSION'')',
'         and workspace_user_id is null;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(350762395377989769)
,p_name=>'Other User Sessions'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'E1MLANGER'
,p_internal_uid=>350762395377989769
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350763081458989838)
,p_db_column_name=>'APEX_SESSION_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Session ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350763452062989839)
,p_db_column_name=>'WORKSPACE_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Workspace Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350763888814989841)
,p_db_column_name=>'SESSION_CREATED'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Session Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350764257321989842)
,p_db_column_name=>'SESSION_TIME_LEFT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Session Time Left'
,p_column_type=>'STRING'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350764646438989843)
,p_db_column_name=>'IDLE_TIMEOUT_ON'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Idle Timeout On'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'dd.mm.yyyy hh24:mi:ss'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350765007051989845)
,p_db_column_name=>'LIFE_TIMEOUT_ON'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Life Timeout On'
,p_column_type=>'DATE'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'dd.mm.yyyy hh24:mi:ss'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350765417133989846)
,p_db_column_name=>'REMOTE_ADDR'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Remote Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350766248388989848)
,p_db_column_name=>'SESSION_TIME_ZONE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Session Time Zone'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350766613868989849)
,p_db_column_name=>'SESSION_LANG'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Session Lang'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350767043853989852)
,p_db_column_name=>'SESSION_TERRITORY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Session Territory'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350767845856989855)
,p_db_column_name=>'WORKSPACE_USER_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Workspace User Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350768298033989856)
,p_db_column_name=>'DEBUG_LEVEL'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Debug Level'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350768643949989857)
,p_db_column_name=>'TRACE_MODE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Trace Mode'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350769013961989858)
,p_db_column_name=>'TIMEOUT_COMPUTATION'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Timeout Computation'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(171792610927151525)
,p_db_column_name=>'RAS_SESSIONID'
,p_display_order=>27
,p_column_identifier=>'R'
,p_column_label=>'Ras sessionid'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(350405380056813026)
,p_db_column_name=>'USER_NAME'
,p_display_order=>37
,p_column_identifier=>'S'
,p_column_label=>'User Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(350772214135004519)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3507723'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'APEX_SESSION_ID:WORKSPACE_NAME:SESSION_CREATED:SESSION_TIME_LEFT:IDLE_TIMEOUT_ON:LIFE_TIMEOUT_ON:REMOTE_ADDR:SESSION_TIME_ZONE:SESSION_LANG:SESSION_TERRITORY:WORKSPACE_USER_ID:DEBUG_LEVEL:TRACE_MODE:TIMEOUT_COMPUTATION:USER_NAME'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2729912919736547127)
,p_plug_name=>'Button Region'
,p_region_name=>'footer_buttons'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(92350242746433731)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2729913080007547128)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2729912919736547127)
,p_button_name=>'BTN_DEL_SESSIONS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete other Sessions and log in here'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-trash'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(350404482536813017)
,p_branch_action=>'P112_TARGET_URL'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_URL_IDENT_BY_ITEM'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171792790124151526)
,p_name=>'P112_TARGET_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(350762273110989769)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(350404111268813014)
,p_name=>'P112_CHECK_SESSIONS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(350762273110989769)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(350403661171813009)
,p_computation_sequence=>10
,p_computation_item=>'P112_TARGET_URL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>':P111_TARGET_URL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(350404301370813016)
,p_computation_sequence=>20
,p_computation_item=>'P112_CHECK_SESSIONS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select dl_common.pkg_apex_util.f_user_has_other_sessions from dual;'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(350403046435813003)
,p_name=>'OnPageLoad'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(350403144091813004)
,p_event_id=>wwv_flow_api.id(350403046435813003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Check other User Session',
'declare',
'    l_result number;',
'    ',
'begin',
'    return;',
'    l_result := dl_common.pkg_apex_util.f_user_has_other_sessions;',
'    :P112_CHECK_SESSIONS := l_result;',
'end;'))
,p_attribute_02=>'P112_CHECK_SESSIONS'
,p_attribute_03=>'P112_CHECK_SESSIONS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(350404213950813015)
,p_event_id=>wwv_flow_api.id(350403046435813003)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var l_cnt = $v("P112_CHECK_SESSIONS");',
'var url = $v("P112_TARGET_URL");',
'var ModalTitle1 = "Security Policy Violation";',
'var ModalTitle2 = "Please wait! Your landing page is loading.";',
'var ModalTitle1Th = "นโยบายด้านความปลอดภัย";',
'var ModalTitle2Th = "กรุณา รอสักครู่";',
'',
'if (document.documentElement.lang && document.documentElement.lang.substr(0, 2).toLowerCase() == "th") {',
'    ModalTitle1 = ModalTitle1Th;',
'    ModalTitle2 = ModalTitle2Th;',
'}',
'',
'if ( l_cnt > 0 ) {',
'  apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", ModalTitle1);',
'  $("#user_info").css("display","");',
'  $("#session_list").css("display","");',
'  $("#footer_buttons").css("display","");',
'  return false;',
'} else {',
'  apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", ModalTitle2);',
'  apex.widget.waitPopup();',
'  apex.submit();',
'}',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2729913188731547129)
,p_name=>'daDeleteotherSessions'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2729913080007547128)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729913240632547130)
,p_event_id=>wwv_flow_api.id(2729913188731547129)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for i in ( select apex_session_id from dl_common.v_apex_sessions where user_name = v(''APP_USER'') and apex_session_id != v(''APP_SESSION'') and workspace_user_id is null ) loop',
'    dl_common.pkg_apex_util.prc_kill_apex_session ( i.apex_session_id );',
'end loop;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729913312214547131)
,p_event_id=>wwv_flow_api.id(2729913188731547129)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.widget.waitPopup();',
'apex.submit();',
'//apex.navigation.dialog.close(true);',
'',
''))
);
end;
/
