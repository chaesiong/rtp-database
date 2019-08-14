prompt --application/pages/page_00141
begin
wwv_flow_api.create_page(
 p_id=>141
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Travel ABIS Results Opener'
,p_page_mode=>'NORMAL'
,p_step_title=>'Travel ABIS Results Opener'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.hidden {',
'    display: none;',
'}',
''))
,p_step_template=>wwv_flow_api.id(563808039840049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'MSTEPHAN'
,p_last_upd_yyyymmddhh24miss=>'20181024174508'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(159277154334564131)
,p_plug_name=>'Result uploader'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(159277340374564133)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(159277154334564131)
,p_button_name=>'BTN_SHOW_RESULTS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Show Travel ABIS Results'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159277288076564132)
,p_name=>'P141_ABIS_RESULTS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(159277154334564131)
,p_prompt=>'Abis results'
,p_placeholder=>'abisid,score,is_expected'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_colspan=>12
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159277420725564134)
,p_name=>'P141_BRDDOCID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(159277154334564131)
,p_prompt=>'Border Document ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>12
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159277561527564135)
,p_name=>'P141_DATEOFBIRTH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(159277154334564131)
,p_prompt=>'Date of Birth'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>12
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159277913789564139)
,p_name=>'P141_DIALOG_URL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(159277154334564131)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(159277599330564136)
,p_name=>'Show Results'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(159277340374564133)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(159277740014564137)
,p_event_id=>wwv_flow_api.id(159277599330564136)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P141_DIALOG_URL := APEX_UTIL.PREPARE_URL(',
'    p_url => ''f?p=&APP_ID.:140:&APP_SESSION.::NO::'' || ''P140_DATEOFBIRTH,P140_REQUEST_DOC_ID:03/04/1982,76AD498064A0BA93E053E026780AC7E6''',
'  , p_checksum_type => ''SESSION''',
');',
''))
,p_attribute_02=>'P141_ABIS_RESULTS,P141_BRDDOCID,P141_DATEOFBIRTH'
,p_attribute_03=>'P141_DIALOG_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(159277864090564138)
,p_event_id=>wwv_flow_api.id(159277599330564136)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let url = "&P141_DIALOG_URL.";',
'if (!!url) apex.navigation.redirect(url);'))
,p_stop_execution_on_error=>'Y'
);
end;
/
