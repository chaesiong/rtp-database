prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(71772255799297339)
,p_name=>'Confirm'
,p_page_mode=>'MODAL'
,p_step_title=>'Confirmation Dialog'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Decrease the padding - that way more will fit on the page*/',
'.t-Form-inputContainer, .t-Form-inputContainer.col, .t-Form-labelContainer, .t-Form-labelContainer.col',
'{',
'    padding: .4rem;',
'}',
'',
'#confirmdialog .t-Region-body',
'{',
'    background: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_attributes=>'resizable:true'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DNOTZON'
,p_last_upd_yyyymmddhh24miss=>'20180726113141'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74731542051622746)
,p_plug_name=>'Confirm'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(71726843211297091)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Do you really want to revoke this Re-Entry Permit? This can not be undone.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74731927691622750)
,p_plug_name=>'Confirm Dialog'
,p_region_name=>'confirmdialog'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_region_attributes=>'style="background: none;"'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74732011438622751)
,p_plug_name=>'Summary'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74734116666622772)
,p_plug_name=>'Requester Information'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74731711371622748)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(74731927691622750)
,p_button_name=>'Confirm'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71761555200297242)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Confirm'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'style="margin-left:35%"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74731799543622749)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(74731927691622750)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71761555200297242)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74731641599622747)
,p_name=>'P16_APPLICATION_PK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(74731542051622746)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74732278709622753)
,p_name=>'P16_APPLICANT_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(74734116666622772)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name: '
,p_source=>'SELECT FIRST_NAME || '' '' || MIDDLE_NAME || '' '' || LAST_NAME FROM PERSON WHERE KEY_VALUE = :P16_PERSON_FK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74732342552622754)
,p_name=>'P16_PERSON_FK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(74731542051622746)
,p_use_cache_before_default=>'NO'
,p_source=>'SELECT PERSON_FK FROM TM8_APPLICATION WHERE APPLICATION_NUMBER = :P16_APPLICATION_PK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74732458276622755)
,p_name=>'P16_APPLICATION_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(74732011438622751)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Application No.:'
,p_source=>'P16_APPLICATION_PK'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74733962742622770)
,p_name=>'P16_PLACE_OF_ISSUE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(74732011438622751)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place Of Issue:'
,p_source=>'SELECT ISSUING_PLACE FROM VISAS WHERE KEY_VALUE = :P16_VISA_PK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74734262802622773)
,p_name=>'P16_GENDER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(74734116666622772)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Gender:'
,p_source=>'SELECT SEX FROM PERSON WHERE KEY_VALUE = :P16_PERSON_FK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74734328652622774)
,p_name=>'P16_NATIONALITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(74734116666622772)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nationality:'
,p_source=>'SELECT NATIONALITY FROM PERSON WHERE KEY_VALUE = :P16_PERSON_FK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74734428067622775)
,p_name=>'P16_RECEIPT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(74734116666622772)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Receipt No.:'
,p_source=>'SELECT FEES_FK FROM TM8_APPLICATION WHERE APPLICATION_NUMBER = :P16_APPLICATION_PK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74734540592622776)
,p_name=>'P16_PERMIT_EXPIRY_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(74734116666622772)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expiry Date:'
,p_source=>'SELECT ENDPERMIT_DATE FROM TM8_APPLICATION WHERE APPLICATION_NUMBER = :P16_APPLICATION_PK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74734680468622777)
,p_name=>'P16_VISA_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(74734116666622772)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Visa Type:'
,p_source=>'SELECT VISA_TYPE FROM VISAS WHERE KEY_VALUE = :P16_VISA_PK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74734739081622778)
,p_name=>'P16_PERMIT_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(74734116666622772)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Permit Type:'
,p_source=>'SELECT TM8_TYPE FROM TM8_APPLICATION WHERE APPLICATION_NUMBER = :P16_APPLICATION_PK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_item_comment=>'Single or Multiple'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74734815437622779)
,p_name=>'P16_VISA_PK'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(74731542051622746)
,p_use_cache_before_default=>'NO'
,p_source=>'SELECT VISA_FK FROM TM8_APPLICATION WHERE APPLICATION_NUMBER = :P16_APPLICATION_PK'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74732500587622756)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74731799543622749)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74732680116622757)
,p_event_id=>wwv_flow_api.id(74732500587622756)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74732762374622758)
,p_name=>'Revoke Re-Entry Permit'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74731711371622748)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74732790234622759)
,p_event_id=>wwv_flow_api.id(74732762374622758)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE TM8_APPLICATION SET APPROVAL_STATUS = ''CANCELED'' WHERE APPLICATION_NUMBER = :P16_APPLICATION_PK;',
'commit;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74732894122622760)
,p_event_id=>wwv_flow_api.id(74732762374622758)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
end;
/
