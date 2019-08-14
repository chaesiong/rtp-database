prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'COUNTRYMANAGEMENTDETAIL'
,p_page_mode=>'MODAL'
,p_step_title=>'Enter Country Regulations Data'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_css_file_urls=>'#APP_IMAGES#ModalDialogs.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select {',
'    min-width: 10em;',
'}'))
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_height=>'600'
,p_dialog_width=>'800'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'CHRISTINA'
,p_last_upd_yyyymmddhh24miss=>'20181023181600'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165601941907467914)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(563823021746049617)
,p_plug_display_sequence=>42
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
 p_id=>wwv_flow_api.id(165600150219467896)
,p_plug_name=>'Display Messages'
,p_parent_plug_id=>wwv_flow_api.id(165601941907467914)
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<h3>Passenger Display Messages</h3>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(852344079776189299)
,p_plug_name=>'Country Regulations'
,p_parent_plug_id=>wwv_flow_api.id(165601941907467914)
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<h3>Country Regulations</h3>'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940696002199088645)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(852344716095189304)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(940696002199088645)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'deletebutton'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(852344632196189303)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(940696002199088645)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(852344522085189303)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(940696002199088645)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(852344803614189304)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(940696002199088645)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:8010:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(852346463244189327)
,p_branch_action=>'f?p=&APP_ID.:8010:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107621324205742942)
,p_name=>'P7_NEED_HEALTHCHECK'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(852344079776189299)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Health Check Needed?'
,p_source=>'NEED_HEALTHCHECK'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'1'
,p_attribute_03=>'Yes'
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143927466849387942)
,p_name=>'P7_MESSAGE_DONE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(165600150219467896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fingerprint Capture Complete:'
,p_source=>'MESSAGE_DONE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165600225850467897)
,p_name=>'P7_MESSAGE_CAPTURE_RIGHT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(165600150219467896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capture Right Hand:'
,p_source=>'MESSAGE_FINGERS_RIGHT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165600411760467898)
,p_name=>'P7_MESSAGE_CAPTURE_LEFT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(165600150219467896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capture Left Hand:'
,p_source=>'MESSAGE_FINGERS_LEFT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165600466127467899)
,p_name=>'P7_MESSAGE_CAPTURE_THUMBS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(165600150219467896)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Capture Thumbs:'
,p_source=>'MESSAGE_THUMBS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186861813068161700)
,p_name=>'P7_BORDERPOSTID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(852344079776189299)
,p_use_cache_before_default=>'NO'
,p_source=>'INS_BORDERPOST'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(186861914903161701)
,p_name=>'P7_TERMINALID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(852344079776189299)
,p_use_cache_before_default=>'NO'
,p_source=>'INS_TERMINAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852346807669189334)
,p_name=>'P7_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(852344079776189299)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852347194052189388)
,p_name=>'P7_COUTRY_CODE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(852344079776189299)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Country'
,p_source=>'COUTRY_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ICAO_DOC_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852347539340189394)
,p_name=>'P7_DIRECTION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(852344079776189299)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Direction'
,p_source=>'DIRECTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PORT_MOVEMENTS_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.PORT_MOVEMENTS$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852347916563189398)
,p_name=>'P7_NEED_LC'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(852344079776189299)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Travel Card Needed?'
,p_source=>'NEED_LC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'1'
,p_attribute_03=>'Yes'
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852348338076189400)
,p_name=>'P7_NEED_VISUM'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(852344079776189299)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Visa Needed?'
,p_source=>'NEED_VISUM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'1'
,p_attribute_03=>'Yes'
,p_attribute_04=>'0'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(880793450834269483)
,p_validation_name=>'VAL_UNQ_COUNTRYDIRECTION'
,p_validation_sequence=>10
,p_validation=>'select 1 from COUNTRY_MANAGEMENT where COUTRY_CODE = :P7_COUTRY_CODE and DIRECTION = :P7_DIRECTION and (:P7_ID is null or :P7_ID <> id)'
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Regulation for this Country and Direction exists!'
,p_always_execute=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(165600741529467902)
,p_name=>'Load Messages'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'loadMessages'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165600912727467903)
,p_event_id=>wwv_flow_api.id(165600741529467902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(message_fingers_right), max(message_fingers_left), max(message_thumbs) into :P7_MESSAGE_CAPTURE_RIGHT, :P7_MESSAGE_CAPTURE_LEFT, :P7_MESSAGE_CAPTURE_THUMBS from country_management where coutry_code = :P7_COUTRY_CODE;',
'select max(message_done) into :P7_MESSAGE_DONE from country_management where coutry_code = :P7_COUTRY_CODE and direction = :P7_DIRECTION;',
''))
,p_attribute_02=>'P7_COUTRY_CODE,P7_DIRECTION'
,p_attribute_03=>'P7_MESSAGE_CAPTURE_RIGHT,P7_MESSAGE_CAPTURE_LEFT,P7_MESSAGE_CAPTURE_THUMBS,P7_MESSAGE_DONE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(165600960063467904)
,p_name=>'P7_COUTRY_CODE: Change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_COUTRY_CODE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165601021103467905)
,p_event_id=>wwv_flow_api.id(165600960063467904)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger(document, ''loadMessages'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(165601168462467906)
,p_name=>'P7_DIRECTION: Change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_DIRECTION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165601224856467907)
,p_event_id=>wwv_flow_api.id(165601168462467906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger(document, ''loadMessages'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(852349131721189408)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from COUNTRY_MANAGEMENT'
,p_attribute_02=>'COUNTRY_MANAGEMENT'
,p_attribute_03=>'P7_ID'
,p_attribute_04=>'ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(852354815375220142)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_GENERATE_UID'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (:P7_ID IS NULL) THEN',
'    :P7_ID := sys_guid();',
'END IF;',
'',
'begin',
'    select',
'          terminalid',
'        , borderpostid',
'    into',
'          :P7_TERMINALID',
'        , :P7_BORDERPOSTID',
'    from (',
'      select id terminalid, border_post borderpostid, 1 rank from terminals where IPADDRESS = :AI_TERMINAL_IP',
'      union',
'      select id, border_post, 2 from terminals where IPADDRESS = :AI_TERMINAL_NAME',
'      order by',
'      rank',
'    )',
'    where',
'      rownum < 2',
'    ;',
'exception when no_data_found then',
'    null;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(852349565374189410)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of COUNTRY_MANAGEMENT'
,p_attribute_02=>'COUNTRY_MANAGEMENT'
,p_attribute_03=>'P7_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(165600591002467900)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Finger Capture Messages'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update country_management set message_fingers_right = :P7_MESSAGE_CAPTURE_RIGHT, message_fingers_left = :P7_MESSAGE_CAPTURE_LEFT, message_thumbs = :P7_MESSAGE_CAPTURE_THUMBS where coutry_code = :P7_COUTRY_CODE;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(852349953952189411)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(852344716095189304)
);
end;
/
