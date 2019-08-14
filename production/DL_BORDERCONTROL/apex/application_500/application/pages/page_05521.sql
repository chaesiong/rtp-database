prompt --application/pages/page_05521
begin
wwv_flow_api.create_page(
 p_id=>5521
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Blacklist Hit Log Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Blacklist Hit Log Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(563808839563049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_width=>'1200'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20181031174253'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46065708092049314)
,p_plug_name=>'Request Message'
,p_region_name=>'formRequestMessage'
,p_region_template_options=>'#DEFAULT#:is-expanded:i-h240:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_sender_request CLOB;',
'    --',
'    l_amount NUMBER := 1000;',
'    l_offset NUMBER := 1;',
'',
'BEGIN',
'',
'    SELECT sender_request',
'      INTO l_sender_request',
'      FROM dl_interface.log_blacklist_hits',
'     WHERE key_value = :P5521_KEY_VALUE;',
'     ',
'    FOR i IN 1 .. CEIL(dbms_lob.getlength(l_sender_request) / l_amount)',
'    LOOP',
'    ',
'        htp.prn(dbms_lob.substr(l_sender_request, l_amount, l_offset));',
'    ',
'        l_offset := l_offset + l_amount;',
'    END LOOP;',
'    ',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46065815662049315)
,p_plug_name=>'Response Message'
,p_region_name=>'formResponseMessage'
,p_region_template_options=>'#DEFAULT#:is-expanded:i-h240:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_response CLOB;',
'    --',
'    l_amount NUMBER := 1000;',
'    l_offset NUMBER := 1;',
'',
'BEGIN',
'',
'    SELECT response',
'      INTO l_response',
'      FROM dl_interface.log_blacklist_hits',
'     WHERE key_value = :P5521_KEY_VALUE;',
'     ',
'     ',
'    FOR i IN 1 .. CEIL(dbms_lob.getlength(l_response) / l_amount)',
'    LOOP',
'    ',
'        htp.prn(dbms_lob.substr(l_response, l_amount, l_offset));',
'    ',
'        l_offset := l_offset + l_amount;',
'    END LOOP;',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79195920285138536)
,p_plug_name=>'Blacklist Hit Log Details'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46066100523049318)
,p_name=>'P5521_SENDER_OBJECT_ID'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_prompt=>'Object ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79199443582138586)
,p_name=>'P5521_KEY_VALUE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79199799455138596)
,p_name=>'P5521_DML_AT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79200229312138596)
,p_name=>'P5521_DML_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79200607049138596)
,p_name=>'P5521_DML_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79201048951138597)
,p_name=>'P5521_INS_AT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_prompt=>'Created at'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79201447950138597)
,p_name=>'P5521_INS_BY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79201802071138597)
,p_name=>'P5521_SENDER_SYSTEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_prompt=>'Sender system'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79202254892138598)
,p_name=>'P5521_SENDER_USER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_prompt=>'User'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79203487843138599)
,p_name=>'P5521_ELAPSED_TIME_SECONDS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_prompt=>'Elapsed time in seconds'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79203804192138599)
,p_name=>'P5521_NUMBER_OF_HITS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(79195920285138536)
,p_prompt=>'Number of hits'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46065963465049316)
,p_name=>'PAGELOAD: BEAUTIFY JS'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46066086631049317)
,p_event_id=>wwv_flow_api.id(46065963465049316)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#formRequestMessage .t-Region-body").html("<pre>" + JSON.stringify(JSON.parse($("#formRequestMessage .t-Region-body").text()), null, 4) + "</pre>");',
'$("#formResponseMessage .t-Region-body").html("<pre>" + JSON.stringify(JSON.parse($("#formResponseMessage .t-Region-body").text()), null, 4) + "</pre>");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46065626830049313)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FETCH'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dml_at',
'      ,dml_by',
'      ,dml_type',
'      ,ins_at',
'      ,ins_by',
'      ,sender_system',
'      ,sender_user',
'      --,sender_request',
'      --,response',
'      ,elapsed_time_seconds',
'      ,number_of_hits',
'      ,sender_object_id',
'  INTO :P5521_DML_AT',
'      ,:P5521_DML_BY',
'      ,:P5521_DML_TYPE',
'      ,:P5521_INS_AT',
'      ,:P5521_INS_BY',
'      ,:P5521_SENDER_SYSTEM',
'      ,:P5521_SENDER_USER',
'      --,:P5521_SENDER_REQUEST',
'      --,:P5521_RESPONSE',
'      ,:P5521_ELAPSED_TIME_SECONDS',
'      ,:P5521_NUMBER_OF_HITS',
'      ,:P5521_SENDER_OBJECT_ID',
'  FROM dl_interface.log_blacklist_hits',
' WHERE key_value = :P5521_KEY_VALUE;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
