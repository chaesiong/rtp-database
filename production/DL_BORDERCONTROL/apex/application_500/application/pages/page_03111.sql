prompt --application/pages/page_03111
begin
wwv_flow_api.create_page(
 p_id=>3111
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Residentinfo Details'
,p_page_mode=>'NORMAL'
,p_step_title=>'Residentinfo Details'
,p_step_sub_title=>'Residentinfo Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190330020828'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(500877366610590490)
,p_plug_name=>'Residentinfo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
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
 p_id=>wwv_flow_api.id(172565397381591726)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(500877366610590490)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P3111_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172566214968591729)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(500877366610590490)
,p_button_name=>'GET_PREVIOUS_ROWID'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P3111_ROWID_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172566612960591730)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(500877366610590490)
,p_button_name=>'GET_NEXT_ROWID'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P3111_ROWID_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172566981424591731)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(500877366610590490)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:3101:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172565753285591727)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(500877366610590490)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P3111_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172564975140591724)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(500877366610590490)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P3111_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(172572649381591758)
,p_branch_name=>'Go To Page 3101'
,p_branch_action=>'f?p=&APP_ID.:3101:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'SAVE,DELETE,CREATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(172573084522591760)
,p_branch_name=>'Go To Page 3111'
,p_branch_action=>'f?p=&APP_ID.:3111:&SESSION.::&DEBUG.::P3111_ROWID:&P3111_ROWID_NEXT.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(172566612960591730)
,p_branch_sequence=>1
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(172573473960591761)
,p_branch_name=>'Go To Page 3111'
,p_branch_action=>'f?p=&APP_ID.:3111:&SESSION.::&DEBUG.::P3111_ROWID:&P3111_ROWID_PREV.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(172566214968591729)
,p_branch_sequence=>1
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172350474410488226)
,p_name=>'P3111_RESIDENT_ADDR_L1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Resident Addr L1'
,p_source=>'RESIDENT_ADDR_L1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172350531600488227)
,p_name=>'P3111_RESIDENT_ADDR_L2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Resident Addr L2'
,p_source=>'RESIDENT_ADDR_L2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172350715119488228)
,p_name=>'P3111_RESIDENT_ADDR_L3'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Resident Addr L3'
,p_source=>'RESIDENT_ADDR_L3'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172350788905488229)
,p_name=>'P3111_ENDORSEMENT_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Endorsement No'
,p_source=>'ENDORSEMENT_NO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172350912412488230)
,p_name=>'P3111_ENDORSEMENT_FROM'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Endorsement From'
,p_source=>'ENDORSEMENT_FROM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172350951607488231)
,p_name=>'P3111_ENDORSEMENT_UNTIL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Endorsement Until'
,p_source=>'ENDORSEMENT_UNTIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172351021288488232)
,p_name=>'P3111_ENDORSEMENT_BY'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Endorsement By'
,p_source=>'ENDORSEMENT_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172567380187591734)
,p_name=>'P3111_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rowid'
,p_source=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172567741923591738)
,p_name=>'P3111_RESIDENTID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_source=>'RESIDENTID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172568183271591739)
,p_name=>'P3111_DOCUMENTNO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Document Number'
,p_source=>'DOCUMENTNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172568539538591741)
,p_name=>'P3111_ISSUINGCOUNTRY'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Issuing Country'
,p_source=>'ISSUINGCOUNTRY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172568926043591743)
,p_name=>'P3111_EXPIRYDATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expirydate'
,p_source=>'EXPIRYDATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>6
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172569345023591744)
,p_name=>'P3111_RESIDENT_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Resident no'
,p_source=>'RESIDENT_NO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172569740677591746)
,p_name=>'P3111_ROWID_NEXT'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172570207093591747)
,p_name=>'P3111_ROWID_PREV'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172570547280591749)
,p_name=>'P3111_ROWID_COUNT'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'class="fielddata"'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177575945277428399)
,p_name=>'P3111_RESIDENTBOOK_NO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(500877366610590490)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Residentbook No'
,p_source=>'RESIDENTBOOK_NO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(172570961867591751)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from X_RESIDENTINFO'
,p_attribute_02=>'X_RESIDENTINFO'
,p_attribute_03=>'P3111_ROWID'
,p_attribute_04=>'ROWID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(172572199845591755)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_PAGINATION'
,p_process_name=>'Get Next or Previous Primary Key Value'
,p_attribute_02=>'X_RESIDENTINFO'
,p_attribute_03=>'P3111_ROWID'
,p_attribute_04=>'ROWID'
,p_attribute_07=>'RESIDENTID'
,p_attribute_09=>'P3111_ROWID_NEXT'
,p_attribute_10=>'P3111_ROWID_PREV'
,p_attribute_13=>'P3111_ROWID_COUNT'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(172571416941591752)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of X_RESIDENTINFO'
,p_attribute_02=>'X_RESIDENTINFO'
,p_attribute_03=>'P3111_ROWID'
,p_attribute_04=>'ROWID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(172571759780591754)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(172564975140591724)
);
end;
/
