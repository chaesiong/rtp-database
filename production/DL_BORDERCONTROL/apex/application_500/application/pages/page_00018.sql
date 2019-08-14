prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Form on WWV_FLOW_COLLECTION_MEMBERS$'
,p_page_mode=>'NORMAL'
,p_step_title=>'Form on WWV_FLOW_COLLECTION_MEMBERS$'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180321134847'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192787716379888435)
,p_plug_name=>'Form on FELLOW_PASSENGER'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(902183513159920220)
,p_plug_name=>'Form on WWV_FLOW_COLLECTION_MEMBERS$'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(902183936026920221)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(902183513159920220)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(902184372545920223)
,p_branch_action=>'f?p=&APP_ID.:16:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192787798941888436)
,p_name=>'P18_IMAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(192787716379888435)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Image'
,p_source=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192787938019888438)
,p_name=>'P18_KEY_VALUE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(192787716379888435)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Key value'
,p_source=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(902184854597920226)
,p_name=>'P18_COLLECTION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(902183513159920220)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Collection Id'
,p_source=>'COLLECTION_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(902185221128920270)
,p_name=>'P18_BLOB001'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(902183513159920220)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Blob001'
,p_source=>'BLOB001'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>60
,p_cMaxlength=>255
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(902196940142977522)
,p_name=>'P18_C001'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(902183513159920220)
,p_use_cache_before_default=>'NO'
,p_prompt=>'C001'
,p_source=>'C001'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(902197248978992200)
,p_name=>'P18_TEST'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(902183513159920220)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Test'
,p_source=>'BLOB001'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(902186211668920273)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from WWV_FLOW_COLLECTION_MEMBERS$'
,p_attribute_02=>'V_COLLECTION_MEMBERS'
,p_attribute_03=>'P18_COLLECTION_ID'
,p_attribute_04=>'COLLECTION_ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(192787880361888437)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from FELLOW_PASSENGER'
,p_attribute_02=>'FELLOW_PASSENGER'
,p_attribute_03=>'P18_KEY_VALUE'
,p_attribute_04=>'KEY_VALUE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(902186583484920276)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WWV_FLOW_COLLECTION_MEMBERS$'
,p_attribute_01=>'APEX_050000'
,p_attribute_02=>'WWV_FLOW_COLLECTION_MEMBERS$'
,p_attribute_03=>'P18_COLLECTION_ID'
,p_attribute_04=>'COLLECTION_ID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(902186984525920277)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/