prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Create Simple Text Case'
,p_page_mode=>'MODAL'
,p_step_title=>'Create Simple Text Case'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#javascript/helper-functions.js',
'#WORKSPACE_IMAGES#underscore-min.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.onbeforeunload = null;',
'window.onunload = null;',
'apex.page.warnOnUnsavedChanges = function (e) { } ;'))
,p_css_file_urls=>'#APP_IMAGES#css/application-overwrite.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190523134915'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52726862266484235)
,p_plug_name=>'New Case'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52727492623484241)
,p_plug_name=>'Case Data'
,p_parent_plug_id=>wwv_flow_api.id(52726862266484235)
,p_region_css_classes=>'case-details'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148881393247273971)
,p_plug_name=>'Demographic Data'
,p_parent_plug_id=>wwv_flow_api.id(52726862266484235)
,p_region_css_classes=>'demographic-data region-blue'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_css_classes=>'region-blue'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52727093360484237)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(148881393247273971)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52726916744484236)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(148881393247273971)
,p_button_name=>'Submit'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52727376721484240)
,p_name=>'P10_NEW_CASE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52727594974484242)
,p_name=>'P10_REASON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(52727492623484241)
,p_prompt=>'Reason'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_REASON_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) ,',
'       KEY_VALUE',
'  from dl_common.reason_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52727690722484243)
,p_name=>'P10_AUTHORITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(52727492623484241)
,p_prompt=>'Authority'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52728130462484248)
,p_name=>'P10_CASE_REDIRECT_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56406349079481683)
,p_name=>'P10_FIRSTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'First Name'
,p_placeholder=>' '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56406707856481695)
,p_name=>'P10_SURNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'Surname'
,p_placeholder=>' '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56407197168481697)
,p_name=>'P10_DATE_OF_BIRTH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'Date of Birth'
,p_placeholder=>' '
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1910:2037'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56407585296481698)
,p_name=>'P10_PLACE_OF_BIRTH'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'Place of Birth'
,p_placeholder=>' '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56407934578481699)
,p_name=>'P10_SEX'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'Sex'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_HUMAN_SEXES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.HUMAN_SEXES$LC',
'WHERE ICAO is not null',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56408310239481702)
,p_name=>'P10_NATIONALITY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'Nationality'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ICAO_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56408768211481703)
,p_name=>'P10_PASSPORT_NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'Passport Number'
,p_placeholder=>'   '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>9
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56409120414481705)
,p_name=>'P10_PASSPORT_ISSUING_COUNTRY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'Pass Iss. Country'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ICAO_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56409503103481706)
,p_name=>'P10_PASSPORT_EXPIRY_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(148881393247273971)
,p_prompt=>'Expiry Date'
,p_placeholder=>' '
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56760961867779602)
,p_name=>'P10_CASE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52727492623484241)
,p_prompt=>'Case type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_CASES_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.case_types$LC',
'  where NVL( is_active, ''Y'' ) = ''Y''',
' order by DISPLAY_ORDER ASC',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(52727138061484238)
,p_name=>'CloseDialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(52727093360484237)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52727240699484239)
,p_event_id=>wwv_flow_api.id(52727138061484238)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(52727716171484244)
,p_name=>'CreateNewCase'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(52726916744484236)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52727806032484245)
,p_event_id=>wwv_flow_api.id(52727716171484244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!apex.page.validate()) {',
'    apex.message.clearErrors();',
'    apex.message.showErrors({',
'        type: ''error'',',
'        location: ''page'',',
'        message: apex.lang.getMessage(''INSERT.VALIDATION.FILL-ALL-REQUIRED-FIELDS'')',
'    });',
'    return false;',
'}',
'',
'var Demographic = regionToJson(''.demographic-data'');',
'if (!Demographic.givenName){',
'    Demographic.givenName = Demographic.firstname;',
'} ',
'    Demographic.surName = Demographic.surname;',
'',
'var CaseDetails = regionToJson(''.case-details'');',
'var TravelDoc = _.clone(Demographic);',
'     if( Demographic.sex) TravelDoc.sex = Demographic.sex.substring(0, 1);',
'    TravelDoc.docNumber = Demographic.passportNumber;',
'    TravelDoc.issuingCountry = Demographic.passportIssuingCountry;',
'    TravelDoc.dateOfExpiry = Demographic.passportExpiryDate;',
'    Demographic.traveldocs = [];',
'    Demographic.traveldocs.push(TravelDoc);',
'    CaseDetails.identities = [];',
'    CaseDetails.identities.push(Demographic);',
'    CaseDetails.relatedPersons = [{}];',
'    var tempFinger = [];',
'    var tempFaces = [];',
'',
'var blacklistRequestBody = {',
'    case: CaseDetails',
'};',
'',
'console.log(''Demo '', blacklistRequestBody);',
'',
'var endpoint = ''/bpm/blacklist/insert'';',
'var endpoint = ''/ords/dl_bordercontrol/blacklist/case/insert'';',
'',
'var lspinner$ = apex.util.showSpinner();',
'var request = $.ajax({',
'    type: ''POST'',',
'    contentType: "application/json; charset=utf-8",',
'    url: endpoint,',
'    data: JSON.stringify(blacklistRequestBody)',
'});',
'',
'request.done(function (data) {',
'    console.log(''success'', data);',
'    lspinner$.remove();',
'    if (data.status.code === ''ERROR'') {',
'        apex.message.clearErrors();',
'        apex.message.showErrors({',
'            type: ''error'',',
'            location: ''page'',',
'            message: ''Record could not be inserted.''',
'        });',
'    }',
'    else {',
'        try{',
'            apex.message.showPageSuccess(apex.lang.getMessage(''RECORD.INSERTED''));',
'        }',
'        catch(e){console.log(e)}',
'        apex.item(''P10_NEW_CASE_ID'').setValue(data.blacklistid);',
'    }',
'',
'    return;',
'});',
'',
'request.fail(function (data) {',
'    var text = data.responseText;',
'    try {',
'        var json = JSON.parse(text);',
'        if (json.status.code === ''ERROR'' || json.error) {',
'            var message = json.message || json.status.message;',
'            apex.message.clearErrors();',
'            apex.message.showErrors({',
'                type: ''error'',',
'                location: ''page'',',
'                message: ''Record could not be inserted. Message: '' + message',
'            });',
'        }',
'    }',
'    catch (e) {',
'        apex.message.clearErrors();',
'        apex.message.showErrors({',
'            type: ''error'',',
'            location: ''page'',',
'            message: ''Insert Service is unavailable''',
'        })',
'    }',
'    console.log(''error'',);',
'    lspinner$.remove();',
'',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(52727987234484246)
,p_name=>'OpenEditCaseDialog'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_NEW_CASE_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52728096220484247)
,p_event_id=>wwv_flow_api.id(52727987234484246)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':30:''||l_session||''::NO:30:P30_CASE_ID:'' || :P10_NEW_CASE_ID, ',
'        p_checksum_type => ''SESSION'');',
'    :P10_CASE_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P10_NEW_CASE_ID'
,p_attribute_03=>'P10_CASE_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(52728223993484249)
,p_event_id=>wwv_flow_api.id(52727987234484246)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.navigation.redirect(apex.item("P10_CASE_REDIRECT_URL").getValue() );',
'//setTimeout(function(){apex.navigation.dialog.close(true, apex.item("P10_CASE_REDIRECT_URL").getValue())},2000);',
'var redirectUrl = apex.item("P10_CASE_REDIRECT_URL").getValue();',
'$(''#wwvFlowForm'').get(0).reset();',
'apex.navigation.dialog.close(true, redirectUrl);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63423095244494237)
,p_name=>'DateValidation'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_PASSPORT_EXPIRY_DATE,P10_DATE_OF_BIRTH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63423487273494279)
,p_event_id=>wwv_flow_api.id(63423095244494237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(this); ',
'',
'if(!/INPUT/.test(this.triggeringElement.nodeName)) return;',
'    var id = this.triggeringElement.id;',
'    var item = apex.item(id);',
'    var value = item.getValue();',
'    var message = "";',
'    console.log(value);',
'    if(!value.match(/^((0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/(19|20)\d\d)?$/)){',
'        console.log(value);',
'        message = apex.lang.getMessage(''FORM.VALIDATION_ERROR.WRONG_DATE_FORMAT'');',
'        apex.message.alert(message);',
'        $(''#''+id+''_error_placeholder:not(.error-shown)'')',
'            .addClass(''t-Form-error error-shown'')',
'            .append(''<span class="charset-error">''+message+ ''</span>'' );',
'    }',
'    else{',
'        $(''#''+id).parent().parent().find(''.error-shown'').removeClass(''error-shown'').find(''.charset-error'').remove();',
'    }',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134216798121924765)
,p_name=>'ReplaceNotValidChars'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_DATE_OF_BIRTH,P10_PASSPORT_EXPIRY_DATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'keypress'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134217196533924894)
,p_event_id=>wwv_flow_api.id(134216798121924765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!/INPUT/.test(this.triggeringElement.nodeName)) return;',
'    var id = this.triggeringElement.id;',
'    var item = apex.item(id);',
'    var value = item.getValue();',
' if(!/^(\d|\/)+$/.test(value)){',
'     this.browserEvent.stopPropagation();',
'     item.setValue(value.replace(/[^\/\d]/g,''''))',
' }'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28684571199891931)
,p_name=>'LostPassportTypeCheck'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_CASE_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28684699493891932)
,p_event_id=>wwv_flow_api.id(28684571199891931)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($(this.browserEvent.target).val() === ''LOST_PASSPORT''){',
'    apex.item(''P10_REASON'').setValue(76);',
'}'))
,p_stop_execution_on_error=>'Y'
);
end;
/
