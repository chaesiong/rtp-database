prompt --application/pages/page_00301
begin
wwv_flow_api.create_page(
 p_id=>301
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Menu Item Manager'
,p_page_mode=>'MODAL'
,p_step_title=>'Menu Item Manager'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180925144938'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177467962255074787)
,p_plug_name=>'Menu Item Manager'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177468669463074790)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177469093133074793)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(177468669463074790)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177468606054074790)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(177468669463074790)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P301_KEY_VALUE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-times-circle'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177468457095074790)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(177468669463074790)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P301_KEY_VALUE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177468376392074790)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(177468669463074790)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P301_KEY_VALUE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-plus-square'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44587245159043650)
,p_name=>'P301_CHILD_PAGES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(177467962255074787)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Child Pages:'
,p_source=>'CHILD_PAGES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>64
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Comma separated list with Page IDs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177471356770074994)
,p_name=>'P301_KEY_VALUE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177467962255074787)
,p_use_cache_before_default=>'NO'
,p_source=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177471702027075058)
,p_name=>'P301_PARENT_KEY_VALUE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(177467962255074787)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Parent: '
,p_source=>'PARENT_KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISPLAY_VALUE, KEY_VALUE ',
'FROM DL_COMMON.APEX_MENU ',
'WHERE KEY_VALUE != NVL(:P301_KEY_VALUE,-999999)',
'Order by DISPLAY_VALUE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177472052883075065)
,p_name=>'P301_DISPLAY_VALUE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(177467962255074787)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Label:'
,p_source=>'DISPLAY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1020
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177472436578075066)
,p_name=>'P301_IMAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(177467962255074787)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Icon-Name: '
,p_source=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1020
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177472851654075067)
,p_name=>'P301_APP_ALIAS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(177467962255074787)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Application:'
,p_source=>'APP_ALIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT APPLICATION_ID || '' '' || APPLICATION_NAME, ALIAS ',
'FROM apex_applications',
'Order by APPLICATION_NAME;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177473221449075069)
,p_name=>'P301_PAGE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(177467962255074787)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Page:'
,p_source=>'PAGE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PAGE_NAME || '' (#'' || PAGE_ID || '')'', PAGE_ID ',
'FROM APEX_APPLICATION_PAGES ',
'WHERE APPLICATION_ID = (SELECT APPLICATION_ID FROM APEX_APPLICATIONS WHERE ALIAS = :P301_APP_ALIAS)',
'Order by PAGE_NAME'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(177469172773074793)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(177469093133074793)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(177469971287074800)
,p_event_id=>wwv_flow_api.id(177469172773074793)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(177459368580050894)
,p_name=>'Show Possible Pages'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P301_APP_ALIAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(177459501958050895)
,p_event_id=>wwv_flow_api.id(177459368580050894)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P301_APP_ALIAS'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(177459618926050896)
,p_event_id=>wwv_flow_api.id(177459368580050894)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P301_PAGE_ID'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(177475282629075079)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from APEX_MENU'
,p_attribute_01=>'DL_COMMON'
,p_attribute_02=>'APEX_MENU'
,p_attribute_03=>'P301_KEY_VALUE'
,p_attribute_04=>'KEY_VALUE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(177459632041050897)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERT NEW ITEM'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO DL_COMMON.APEX_MENU ',
'(',
'KEY_VALUE,',
'PARENT_KEY_VALUE, ',
'DISPLAY_VALUE, ',
'IMAGE, ',
'APP_ALIAS, ',
'PAGE_ID, ',
'TARGET,',
'LOCALE,',
'DISPLAY_ORDER,',
'OWNER,',
'CHILD_PAGES',
')',
'VALUES',
'(',
'(SELECT MAX(KEY_VALUE)+1 FROM DL_COMMON.APEX_MENU),',
':P301_PARENT_KEY_VALUE,',
':P301_DISPLAY_VALUE,',
':P301_IMAGE,',
':P301_APP_ALIAS,',
':P301_PAGE_ID,',
'''f?p=''||:P301_APP_ALIAS||'':''||:P301_PAGE_ID||'':&SESSION.::&DEBUG.::::'',',
'''en_US'',',
'(SELECT MAX(DISPLAY_ORDER)+10 FROM DL_COMMON.APEX_MENU),',
'''DL_BORDERCONTROL'',',
':P301_CHILD_PAGES',
');',
'',
'commit;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(177468376392074790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(177459889145050899)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE ITEM'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE DL_COMMON.APEX_MENU ',
'SET ',
'	PARENT_KEY_VALUE = :P301_PARENT_KEY_VALUE, ',
'	DISPLAY_VALUE = :P301_DISPLAY_VALUE, ',
'	IMAGE = :P301_IMAGE, ',
'	APP_ALIAS = :P301_APP_ALIAS, ',
'	PAGE_ID = :P301_PAGE_ID, ',
'	TARGET = ''f?p=''||:P301_APP_ALIAS||'':''||:P301_PAGE_ID||'':&'' || ''SESSION.::&'' || ''DEBUG.::::'',',
'    CHILD_PAGES = :P301_CHILD_PAGES',
'WHERE',
'	KEY_VALUE = :P301_KEY_VALUE;',
'',
'commit;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(177459797652050898)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE ITEM'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM DL_COMMON.APEX_MENU WHERE KEY_VALUE = :P301_KEY_VALUE;',
'commit;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(177468606054074790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(177476243721075082)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(177468606054074790)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(177476670216075082)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
