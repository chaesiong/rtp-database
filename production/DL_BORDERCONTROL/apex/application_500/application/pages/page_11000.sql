prompt --application/pages/page_11000
begin
wwv_flow_api.create_page(
 p_id=>11000
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'BMIS: Borderdocument'
,p_page_mode=>'NORMAL'
,p_step_title=>'BMIS: Borderdocument'
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
,p_last_upd_yyyymmddhh24miss=>'20181023180707'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134947327690522619)
,p_plug_name=>'REST Request information'
,p_region_name=>'requestInformation'
,p_region_template_options=>'#DEFAULT#:i-h640:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b>URL Webservice</b>: /ords/dl_bordercontrol/dataServices/borderdocument<br>',
'<b>Method</b>: POST<br><br>',
'<div id="copyJSONCode">&P11000_JSON.</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139502893722699663)
,p_plug_name=>'BMIS: Borderdocument'
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
 p_id=>wwv_flow_api.id(134947421650522620)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(139502893722699663)
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
 p_id=>wwv_flow_api.id(134947756170522623)
,p_name=>'P11000_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139505584824699855)
,p_name=>'P11000_BRDDOCID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139505853718699917)
,p_name=>'P11000_DOCTYPE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Document type'
,p_placeholder=>'P'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>80
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139506168117699921)
,p_name=>'P11000_DOCNO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Passport No.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>60
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139506515228699922)
,p_name=>'P11000_ISSUECTRY'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Issuing Country'
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
 p_id=>wwv_flow_api.id(139506944480699923)
,p_name=>'P11000_NAT'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Nationality'
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
 p_id=>wwv_flow_api.id(139507331600699924)
,p_name=>'P11000_DOB'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Date of Birth'
,p_placeholder=>'181231'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>40
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139507760525699926)
,p_name=>'P11000_EXPIRYDATE'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Expirydate'
,p_format_mask=>'YYYY-MM-DDTHH24:MI:SSZ'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139508121126699928)
,p_name=>'P11000_GIVENNAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Givenname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>600
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
 p_id=>wwv_flow_api.id(139508582534699930)
,p_name=>'P11000_SURNAME'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Surname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>600
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139508953322699931)
,p_name=>'P11000_OPTIONALDATA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Optionaldata'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>64
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
 p_id=>wwv_flow_api.id(139509380089699937)
,p_name=>'P11000_INS_TERMINAL'
,p_is_required=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Terminal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ipaddress AS display_value',
'      ,id as return_value',
'  FROM dl_bordercontrol.terminals',
' WHERE border_post = :P11000_INS_BORDERPOST'))
,p_lov_cascade_parent_items=>'P11000_INS_BORDERPOST'
,p_ajax_items_to_submit=>'P11000_INS_BORDERPOST'
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
 p_id=>wwv_flow_api.id(139509737656699938)
,p_name=>'P11000_INS_BORDERPOST'
,p_is_required=>true
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Borderpost'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139510147883699939)
,p_name=>'P11000_MRZDG1'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'MRZ'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>360
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
 p_id=>wwv_flow_api.id(139510567339699940)
,p_name=>'P11000_MIDDLENAME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Middlename'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>600
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
 p_id=>wwv_flow_api.id(139510944127699942)
,p_name=>'P11000_GIVENNAME_THAI'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Givenname Thai'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>600
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
 p_id=>wwv_flow_api.id(139511393695699943)
,p_name=>'P11000_MIDDLENAME_THAI'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Middlename Thai'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>600
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
 p_id=>wwv_flow_api.id(139511738804699944)
,p_name=>'P11000_SURNAME_THAI'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Surname Thai'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>600
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
 p_id=>wwv_flow_api.id(139512177936699945)
,p_name=>'P11000_MANUAL_EXPIRY_DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Manual Expiry Date'
,p_format_mask=>'YYYY-MM-DDTHH24:MI:SSZ'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139512564892699946)
,p_name=>'P11000_MANUAL_ISSUING_DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Manual Issuing Date'
,p_format_mask=>'YYYY-MM-DDTHH24:MI:SSZ'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139512936653699947)
,p_name=>'P11000_MANUAL_NATIONALITY'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Manual Nationality'
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
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139513337973699948)
,p_name=>'P11000_MANUAL_PLACEOFBIRTH'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Manual Placeofbirth'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139513749432699949)
,p_name=>'P11000_SEX'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Sex'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139514154678699950)
,p_name=>'P11000_DOCCLASS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Document Class'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDER_DOCUMENT_CLASS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
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
 p_id=>wwv_flow_api.id(139514598473699952)
,p_name=>'P11000_SUB_NATIONALITY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(139502893722699663)
,p_prompt=>'Sub Nationality'
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134948041493522626)
,p_name=>'PAGELOAD: BEAUTIFY JAVASCRIPT'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134948103077522627)
,p_event_id=>wwv_flow_api.id(134948041493522626)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#requestInformation .t-Region-body #copyJSONCode").html("<pre>" + JSON.stringify(JSON.parse($("#requestInformation .t-Region-body #copyJSONCode").text()), null, 4) + "</pre>");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(134947979262522625)
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
'                  "documentType": "'' || :P11000_DOCTYPE || ''",',
'                  "passportNumber": "'' || :P11000_DOCNO || ''",',
'                  "issuingCountry": "'' || :P11000_ISSUECTRY || ''",',
'                  "nationality": "'' || :P11000_NAT || ''",',
'                  "dateOfBirth": "'' || :P11000_DOB || ''",',
'                  "expiryDate": "'' || :P11000_EXPIRYDATE || ''",',
'                  "givenname": "'' || :P11000_GIVENNAME || ''",',
'                  "surname": "'' || :P11000_SURNAME || ''",',
'                  "middlename": "'' || :P11000_MIDDLENAME || ''",',
'                  "optionalData": "'' || :P11000_OPTIONALDATA || ''",',
'                  "terminal": "'' || :P11000_INS_TERMINAL || ''",',
'                  "borderpost": "'' || :P11000_INS_BORDERPOST || ''",',
'                  "givennameThai": "'' || :P11000_GIVENNAME_THAI || ''",',
'                  "middlenameThai": "'' || :P11000_MIDDLENAME_THAI || ''",',
'                  "surnameThai": "'' || :P11000_SURNAME_THAI || ''",',
'                  "manualExpiryDate": "'' || :P11000_MANUAL_EXPIRY_DATE || ''",',
'                  "manualIssuingDate": "'' || :P11000_MANUAL_ISSUING_DATE || ''",',
'                  "manualNationality": "'' || :P11000_MANUAL_NATIONALITY || ''",',
'                  "manualPlaceOfBirth": "'' || :P11000_MANUAL_PLACEOFBIRTH || ''",',
'                  "gender": "'' || :P11000_SEX || ''",',
'                  "documentClass": "'' || :P11000_DOCCLASS || ''",',
'                  "subNationalities": "'' || :P11000_SUB_NATIONALITY || ''"',
'                  }''; ',
'    ',
'    :P11000_JSON := dbms_lob.substr(l_result, 32000, 1);',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
