prompt --application/pages/page_11100
begin
wwv_flow_api.create_page(
 p_id=>11100
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'BMIS: Movement'
,p_page_mode=>'NORMAL'
,p_step_title=>'BMIS: Movement'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'CHRISTINA'
,p_last_upd_yyyymmddhh24miss=>'20181023180824'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134948332029522629)
,p_plug_name=>'REST Request Information'
,p_region_name=>'requestInformation'
,p_region_template_options=>'#DEFAULT#:i-h640:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b>URL Webservice</b>: /ords/dl_bordercontrol/dataServices/movement<br>',
'<b>Method</b>: POST<br><br>',
'<div id="copyJSONCode">&P11100_JSON.</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139940627913786639)
,p_plug_name=>'BMIS: Movement'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(134948735342522633)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(139940627913786639)
,p_button_name=>'CREATE_JSON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create JSON'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134948261193522628)
,p_name=>'P11100_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139943310033786795)
,p_name=>'P11100_MVMNTID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139943652241786851)
,p_name=>'P11100_BRDDOCID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Borderdocument'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''['' || docno || ''] '' || givenname || '', '' || surname || '', '' || middlename AS display_value',
'      ,brddocid AS return_value',
'  FROM dl_bordercontrol.borderdocuments',
' ORDER BY docno, givenname, surname, middlename'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139943944556786858)
,p_name=>'P11100_EXITFLG'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Direction'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139944351613786859)
,p_name=>'P11100_MAX_STAY_DT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Max Date of Stay'
,p_format_mask=>'YYYY-MM-DDTHH24:MI:SSZ'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139944783535786860)
,p_name=>'P11100_INS_TERMINAL'
,p_is_required=>true
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Terminal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ipaddress AS display_value',
'      ,id as return_value',
'  FROM dl_bordercontrol.terminals',
' WHERE border_post = :P11100_INS_BORDERPOST'))
,p_lov_cascade_parent_items=>'P11100_INS_BORDERPOST'
,p_ajax_items_to_submit=>'P11100_INS_BORDERPOST'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139945119620786861)
,p_name=>'P11100_INS_BORDERPOST'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Borderpost'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139945592705786863)
,p_name=>'P11100_TRNSPRTUNITID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Transportunit (also Flight no.)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>128
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139945920992786864)
,p_name=>'P11100_PERSON_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Person Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Crew;1,Traveler;1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139946358170786868)
,p_name=>'P11100_SCANNED_FLIGHT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Flight No.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139946773931786870)
,p_name=>'P11100_VISA_TYPE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Visa Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) AS display_value',
'      ,key_value AS return_value',
'  FROM dl_common.visa_types$lc',
' ORDER BY display_value'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139947186731786870)
,p_name=>'P11100_VISA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Visa'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT v.visa_number || '': '' || TO_CHAR(v.issuing_date, ''DD/MM/YYYY'') || '', '' || p.first_name || '' '' || p.middle_name || '' '' || p.last_name AS display_value',
'      ,v.key_value AS return_value',
'-- visa_type, visa_number, issuing_Date, p.last_name, p.first_name',
'  FROM dl_bordercontrol.visas v',
'  LEFT JOIN dl_bordercontrol.person p ON v.person = p.key_value',
' WHERE v.visa_type = :P11100_VISA_TYPE',
' ORDER BY v.visa_number ASC'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11100_VISA_TYPE'
,p_ajax_items_to_submit=>'P11100_VISA_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139947569571786871)
,p_name=>'P11100_IS_FINISHED'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Is Finished'
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139947944829786872)
,p_name=>'P11100_PRIOR_MOVEMENT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Prior Movement'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TO_CHAR(movement_dt, ''DD/MM/YYYY HH24:MI:SS'') AS display_value',
'      ,mvmntid AS return_value',
'  FROM dl_bordercontrol.movements',
' WHERE brddocid = :P11100_BRDDOCID',
'   AND exitflg  != :P11100_EXITFLG',
' ORDER BY movement_dt DESC'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P11100_BRDDOCID,P11100_EXITFLG'
,p_ajax_items_to_submit=>'P11100_BRDDOCID,P11100_EXITFLG'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139948346001786873)
,p_name=>'P11100_ENTRY_FORM'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Entry Form'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT form_no AS display_value',
'      ,key_value as return_value',
'  FROM dl_bordercontrol.entry_forms',
' ORDER BY display_value ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139948747110786879)
,p_name=>'P11100_MOVEMENT_DT'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Movement Date'
,p_format_mask=>'YYYY-MM-DDTHH24:MI:SSZ'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139949535753786881)
,p_name=>'P11100_DATE_OF_ENTRY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'Date Of Entry'
,p_format_mask=>'YYYY-MM-DDTHH24:MI:SSZ'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139949990082786882)
,p_name=>'P11100_MRZVISA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(139940627913786639)
,p_prompt=>'MRZ Visa'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1020
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134948436151522630)
,p_name=>'PAGELOAD: BEAUTIFY JS'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134948530909522631)
,p_event_id=>wwv_flow_api.id(134948436151522630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#requestInformation .t-Region-body #copyJSONCode").html("<pre>" + JSON.stringify(JSON.parse($("#requestInformation .t-Region-body #copyJSONCode").text()), null, 4) + "</pre>");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134948615472522632)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_result CLOB;',
'    ',
'BEGIN',
'',
'    l_result := ''{',
'                  "borderdocumentId": "'' || :P11100_BRDDOCID || ''",',
'                  "exitFlag": "'' || :P11100_EXITFLG || ''",',
'                  "maxStayDate": "'' || :P11100_MAX_STAY_DT || ''",',
'                  "terminal": "'' || :P11100_INS_TERMINAL || ''",',
'                  "borderpost": "'' || :P11100_INS_BORDERPOST || ''",',
'                  "transportUnit": "'' || :P11100_TRNSPRTUNITID || ''",',
'                  "personType": "'' || :P11100_PERSON_TYPE || ''",',
'                  "scannedFlight": "'' || :P11100_SCANNED_FLIGHT || ''",',
'                  "visaType": "'' || :P11100_VISA_TYPE || ''",',
'                  "visaId": "'' || :P11100_VISA || ''",',
'                  "isFinished": "'' || :P11100_IS_FINISHED || ''",',
'                  "priorMovementId": "'' || :P11100_PRIOR_MOVEMENT || ''",',
'                  "entryFormId": "'' || :P11100_ENTRY_FORM || ''",',
'                  "movementDate": "'' || :P11100_MOVEMENT_DT || ''",',
'                  "dateOfEntry": "'' || :P11100_DATE_OF_ENTRY || ''",',
'                  "mrzVisa": "'' || :P11100_MRZVISA || ''"',
'                  }''; ',
'    ',
'    :P11100_JSON := dbms_lob.substr(l_result, 32000, 1);',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
