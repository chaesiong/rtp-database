prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Vehicle Detail'
,p_page_mode=>'MODAL'
,p_step_title=>'Vehicle Detail'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-labelContainerx {',
'font-weight:bold !important;',
'}',
'',
'.t-Form--large .t-Form-field, .t-Form--large .t-Form-inputContainer input[type=text], .t-Form--large .t-Form-select[size="1"], .t-Form--large input.datepicker, .t-Form--large input.password, .t-Form--large input.popup_lov, .t-Form--large input.text_f'
||'ield, .t-Form--large select.selectlist[size="1"], .t-Form--large select.yes_no, .t-Form--large span.display_only, .t-Form-fieldContainer--large .t-Form-field, .t-Form-fieldContainer--large .t-Form-inputContainer input[type=text], .t-Form-fieldContain'
||'er--large .t-Form-select[size="1"], .t-Form-fieldContainer--large input.datepicker, .t-Form-fieldContainer--large input.password, .t-Form-fieldContainer--large input.popup_lov, .t-Form-fieldContainer--large input.text_field, .t-Form-fieldContainer--l'
||'arge select.selectlist[size="1"], .t-Form-fieldContainer--large select.yes_no, .t-Form-fieldContainer--large span.display_only {',
'    font-size: 1.4rem;',
'    padding: .1rem;',
'    height: 3.2rem;',
'}',
'',
'.t-Form-inputContainer input[type="text"]:focus,',
'.t-Form-inputContainer input.text_field:focus,',
'.t-Form-inputContainer textarea.textarea:focus,',
'.t-Form-inputContainer input.datepicker:focus,',
'.t-Form-inputContainer select:focus {',
'    background-color: #d6f5d6 !important;',
'    border-color: green !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190123010418'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213779588627220118)
,p_plug_name=>'Vehicle Detail'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(197228723828066395)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(213779588627220118)
,p_button_name=>'SAVE_CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save and Close'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-circle-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43030339196716828)
,p_name=>'P13_DIRECTION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'Direction:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIRECTION'
,p_lov=>'.'||wwv_flow_api.id(566472220048858865)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43030424767716829)
,p_name=>'P13_CONVEYANCE_NO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'Conveyance No:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43030565924716830)
,p_name=>'P13_FROM_TO_COUNTRY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'From / To Country:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43030636087716831)
,p_name=>'P13_PORT_NAME'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'Port Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>250
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43030781166716832)
,p_name=>'P13_FROM_TO_OTHER_PORT'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'From / To Other Port:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>250
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43030867698716833)
,p_name=>'P13_FROM_TO_PORT_IN_THAI'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'From / To Port in Thai:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43030967947716834)
,p_name=>'P13_IN_OUT_PORT_IN_THAI'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'In / Out Port in Thai:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197249993422600943)
,p_name=>'P13_VEHICLE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'Vehicle/Conveyance Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_VEHICLE_TYPE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.DISPLAY_VALUE, t0.key_value',
'  from dl_common.TRANS_VEHICLES$LC t0',
' inner join dl_common.TRANS_MODES t1',
'    on (t0.TRANS_MODE is null or t0.TRANS_MODE = t1.KEY_VALUE)',
' inner join dl_common.BORDER_TYPES t2',
'    on (t1.BORDER_TYPE is null or t1.BORDER_TYPE = t2.KEY_VALUE)',
' where t2.KEY_VALUE = :AI_BORDER_TYPE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197250407780600955)
,p_name=>'P13_VEHICLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'Vehicle/Conveyance Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197250667410600956)
,p_name=>'P13_OWNER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'Vehicle/Conveyance Owner:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197251078328600957)
,p_name=>'P13_FROM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'From:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197251479740600958)
,p_name=>'P13_TO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'To:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197251872728600958)
,p_name=>'P13_PROVINCE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_adm_class_province;'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197252295066600959)
,p_name=>'P13_DATE_TIME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'In Out Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197252653173600960)
,p_name=>'P13_FROM2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'From:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(197253045345600961)
,p_name=>'P13_TO2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(213779588627220118)
,p_prompt=>'To:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181670081119336840)
,p_name=>'Save and Close'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(197228723828066395)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181670162308336841)
,p_event_id=>wwv_flow_api.id(181670081119336840)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#VEHICLE_DETAIL'').css(''background-color'', ''green'');',
'apex.submit(''SAVE_CLOSE'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(197228782252066396)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save in Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DL_MOVEMENTHANDLING.Store_Vehicle_Details(:P17_MVMNTID',
'                                         ,:P13_VEHICLE_TYPE',
'                                         ,:P13_VEHICLE_NAME',
'                                         ,:P13_OWNER',
'                                         ,:P13_FROM',
'                                         ,:P13_TO',
'                                         ,:P13_PROVINCE',
'                                         ,:P13_DATE_TIME',
'                                         ,:P13_FROM2',
'                                         ,:P13_TO2',
'                                         -- cols added by MSCS --',
'                                         ,:P13_DIRECTION',
'                                         ,:P13_CONVEYANCE_NO',
'                                         ,:P13_FROM_TO_COUNTRY',
'                                         ,:P13_PORT_NAME',
'                                         ,:P13_FROM_TO_OTHER_PORT',
'                                         ,:P13_FROM_TO_PORT_IN_THAI',
'                                         ,:P13_IN_OUT_PORT_IN_THAI',
'                                          --------------------------',
'                                         );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE_CLOSE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(197259494211668985)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'PROC_CLOSE_DIALOG'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE_CLOSE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
