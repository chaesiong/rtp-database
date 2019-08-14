prompt --application/pages/page_00060
begin
wwv_flow_api.create_page(
 p_id=>60
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Edit Identity'
,p_page_mode=>'MODAL'
,p_step_title=>'Edit Identity'
,p_step_sub_title=>'Add Identity'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_IMAGES#css/application-overwrite.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190711121641'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(344362959886685818)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(15256924031705251)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50305068203241121)
,p_plug_name=>'Nist Import'
,p_parent_plug_id=>wwv_flow_api.id(344362959886685818)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.DERMALOG.NIST'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'nist-import-page'
,p_attribute_02=>'standard'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148097327533362884)
,p_plug_name=>'Demographic and Biometric Description'
,p_parent_plug_id=>wwv_flow_api.id(344362959886685818)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(51373727361666634)
,p_plug_name=>'Biometric Description'
,p_parent_plug_id=>wwv_flow_api.id(148097327533362884)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51373858284666635)
,p_plug_name=>'Demographic Description'
,p_parent_plug_id=>wwv_flow_api.id(148097327533362884)
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
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(344362865451685817)
,p_name=>'History'
,p_parent_plug_id=>wwv_flow_api.id(344362959886685818)
,p_template=>wwv_flow_api.id(15253766136705247)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'return DL_BLACKLIST.PKG_DL_HISTORY.GET_CHANGES_HISTORY_FROM_TABLE(',
'    ''IDENTITIES'', ',
'    ''BODY_HEIGHT, BODY_SHAPE, BODY_WEIGHT, COUNTRY_OF_BIRTH, DATE_OF_BIRTH_PARTIAL, ',
'     DML_AT, DML_BY, DML_TYPE, DOMINANT_CHARACTERISTIC, EYE_COLOR, FACE_SHAPE, GIVENNAME_THAI, GIVEN_NAME, ',
'    HAIR_CHARACTERISTIC, HAIR_COLOR, INS_AT, INS_BY, MIDDLENAME_THAI, MIDDLE_NAME, ',
'    NATIONALITY, NOTICE, OWNER, PHONE_NUMBER_0, PHONE_NUMBER_1, ',
'    PHONE_NUMBER_2, PLACE_OF_BIRTH, PROFESSION, SALUTATION, SEX, SKIN, SPECIAL_CHARACTERISTIC, SURNAME, SURNAME_THAI'',',
'    :P60_IDENTITY_ID',
'   );',
'END;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_display_when_condition=>'P60_IDENTITY_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P60_IDENTITY_ID'
,p_query_row_template=>wwv_flow_api.id(15263708918705266)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363077063685819)
,p_query_column_id=>1
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Column name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363134206685820)
,p_query_column_id=>2
,p_column_alias=>'PREVIOUS_VALUE'
,p_column_display_sequence=>2
,p_column_heading=>'Previous value'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363296387685821)
,p_query_column_id=>3
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>3
,p_column_heading=>'New value'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363361054685822)
,p_query_column_id=>4
,p_column_alias=>'CHANGED_AT'
,p_column_display_sequence=>4
,p_column_heading=>'Changed at'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(344363489337685823)
,p_query_column_id=>5
,p_column_alias=>'CHANGED_BY'
,p_column_display_sequence=>5
,p_column_heading=>'Changed by'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(51559700774444526)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(148097327533362884)
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
 p_id=>wwv_flow_api.id(51559394891444522)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(148097327533362884)
,p_button_name=>'IdentityButton'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94390928558593137)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(148097327533362884)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P60_IDENTITY_ID IS NOT NULL'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50305387046241124)
,p_name=>'P60_NATIONALITY_LOOKUP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51370725190666604)
,p_name=>'P60_SALUTATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Salutation'
,p_source=>'SALUTATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SALUTATIONS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_value,',
'       KEY_VALUE',
'  from dl_common.salutations$LC',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51370863481666605)
,p_name=>'P60_SURNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname'
,p_source=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51370920949666606)
,p_name=>'P60_MIDDLE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Middle name'
,p_source=>'MIDDLE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51371039474666607)
,p_name=>'P60_GIVEN_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Given name'
,p_source=>'GIVEN_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-bottom-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51371148715666608)
,p_name=>'P60_DATE_OF_BIRTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_prompt=>'Date of birth'
,p_source=>'select i.date_of_birth_partial.getFormatData(''DD/MM/YYYY'') FROM identities i WHERE key_value = :P60_IDENTITY_ID;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1900:2040'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51371262302666609)
,p_name=>'P60_PLACE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of birth'
,p_source=>'PLACE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51371363951666610)
,p_name=>'P60_COUNTRY_OF_BIRTH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Country of birth'
,p_source=>'COUNTRY_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.COUNTRIES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51371474671666611)
,p_name=>'P60_NATIONALITY'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nationality'
,p_source=>'NATIONALITY'
,p_source_type=>'DB_COLUMN'
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
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51371530537666612)
,p_name=>'P60_SEX'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sex'
,p_source=>'SEX'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ICAO_SEXES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE) display_value,',
'   icao return_value',
'FROM',
'    DL_COMMON.HUMAN_SEXES$LC',
'WHERE icao IS NOT NULL',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;',
'',
'    '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51371635357666613)
,p_name=>'P60_NOTICE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notice'
,p_source=>'NOTICE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51371799442666614)
,p_name=>'P60_PROFESSION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Profession'
,p_source=>'PROFESSION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROFESSIONS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISPLAY_VALUE,',
'       KEY_VALUE',
'  from dl_common.professions$LC',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372183500666618)
,p_name=>'P60_BODY_HEIGHT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body height'
,p_source=>'BODY_HEIGHT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372253243666619)
,p_name=>'P60_BODY_SHAPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body shape'
,p_source=>'BODY_SHAPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372391660666620)
,p_name=>'P60_HAIR_COLOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hair color'
,p_source=>'HAIR_COLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372434997666621)
,p_name=>'P60_HAIR_CHARACTERISTIC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Hair characteristic'
,p_source=>'HAIR_CHARACTERISTIC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372516226666622)
,p_name=>'P60_FACE_SHAPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Face shape'
,p_source=>'FACE_SHAPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372607903666623)
,p_name=>'P60_EYE_COLOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Eye color'
,p_source=>'EYE_COLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372714849666624)
,p_name=>'P60_SKIN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Skin'
,p_source=>'SKIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372819210666625)
,p_name=>'P60_DOMINANT_CHARACTERISTIC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Dominant characteristic'
,p_source=>'DOMINANT_CHARACTERISTIC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51372918255666626)
,p_name=>'P60_SPECIAL_CHARACTERISTIC'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Special characteristic'
,p_source=>'SPECIAL_CHARACTERISTIC'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51373907083666636)
,p_name=>'P60_CASE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(148097327533362884)
,p_source=>'P60_CASE_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51375036708666647)
,p_name=>'P60_BODY_WEIGHT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(51373727361666634)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Body weight'
,p_source=>'BODY_WEIGHT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51560173393444540)
,p_name=>'P60_IDENTITY_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(148097327533362884)
,p_source=>'P60_IDENTITY_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52726594817484232)
,p_name=>'P60_SURNAME_THAI'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname thai'
,p_source=>'SURNAME_THAI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52726644835484233)
,p_name=>'P60_MIDDLE_NAME_THAI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Middle name Thai'
,p_source=>'MIDDLENAME_THAI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52726773732484234)
,p_name=>'P60_GIVEN_NAME_THAI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(51373858284666635)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Given name thai'
,p_source=>'GIVENNAME_THAI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-bottom-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94391061661593138)
,p_name=>'P60_IDENTITY_DELETE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(148097327533362884)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171898555999228209)
,p_name=>'P60_TRAVEL_DOCUMENT_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(148097327533362884)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51567930393444642)
,p_name=>'CancelDialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(51559700774444526)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51568478943444643)
,p_event_id=>wwv_flow_api.id(51567930393444642)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51565254142444628)
,p_name=>'SaveIdentityData'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(51559394891444522)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51566185012444636)
,p_event_id=>wwv_flow_api.id(51565254142444628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_identity_t pkg_db_access.identity_1_r;',
'    l_case_id pkg_utils.id_t;',
'    l_identity_id pkg_utils.id_t;',
'begin',
'    l_case_id := :P60_CASE_ID;',
'    ',
'    l_identity_t.id := :P60_IDENTITY_ID;',
'    l_identity_t.blacklist := :P60_CASE_ID;',
'',
'    l_identity_t.salutation := :P60_SALUTATION;',
'    l_identity_t.surname := :P60_SURNAME;',
'    l_identity_t.middle_name := :P60_MIDDLE_NAME;',
'    l_identity_t.given_name := :P60_GIVEN_NAME;',
'    l_identity_t.date_of_birth := :P60_DATE_OF_BIRTH;',
'    l_identity_t.place_of_birth := :P60_PLACE_OF_BIRTH;',
'    l_identity_t.country_of_birth := :P60_COUNTRY_OF_BIRTH;',
'    l_identity_t.nationality := :P60_NATIONALITY;',
'    l_identity_t.sex := :P60_SEX;',
'    l_identity_t.notice := :P60_NOTICE;',
'    l_identity_t.profession := :P60_PROFESSION;',
'    l_identity_t.body_height := :P60_BODY_HEIGHT;',
'    l_identity_t.body_weight := :P60_BODY_WEIGHT;',
'    l_identity_t.body_shape := :P60_BODY_SHAPE;',
'    l_identity_t.hair_color := :P60_HAIR_COLOR;',
'    l_identity_t.hair_characteristic := :P60_HAIR_CHARACTERISTIC;',
'    l_identity_t.face_shape := :P60_FACE_SHAPE;',
'    l_identity_t.eye_color := :P60_EYE_COLOR;',
'    l_identity_t.skin := :P60_SKIN;',
'    l_identity_t.dominant_characteristic := :P60_DOMINANT_CHARACTERISTIC;',
'    l_identity_t.special_characteristic := :P60_SPECIAL_CHARACTERISTIC;',
'    l_identity_t.surname_thai         := :P60_SURNAME_THAI;',
'    l_identity_t.middlename_thai      := :P60_MIDDLE_NAME_THAI;',
'    l_identity_t.givenname_thai       := :P60_GIVEN_NAME_THAI;',
'    ',
'',
'	pkg_db_access.put_identity_for_blacklist(',
'        pi_identity => l_identity_t, ',
'        pi_blacklist => l_case_id, ',
'        po_identity_id => l_identity_id',
'    );',
'	',
'end;'))
,p_attribute_02=>'P60_CASE_ID,P60_SALUTATION,P60_SURNAME,P60_MIDDLE_NAME_THAI,P60_GIVEN_NAME,P60_DATE_OF_BIRTH,P60_PLACE_OF_BIRTH,P60_COUNTRY_OF_BIRTH,P60_NATIONALITY,P60_SEX,P60_NOTICE,P60_PROFESSION,P60_BODY_HEIGHT,P60_BODY_WEIGHT,P60_BODY_SHAPE,P60_HAIR_COLOR,P60_H'
||'AIR_CHARACTERISTIC,P60_FACE_SHAPE,P60_EYE_COLOR,P60_SKIN,P60_DOMINANT_CHARACTERISTIC,P60_SPECIAL_CHARACTERISTIC,P60_IDENTITY_ID,P60_SURNAME_THAI,P60_GIVEN_NAME_THAI,P60_MIDDLE_NAME'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51565740561444634)
,p_event_id=>wwv_flow_api.id(51565254142444628)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh.apex.region(''IdentitiesGrid'').refresh();',
'top.windowToRefresh = null;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51566613917444638)
,p_event_id=>wwv_flow_api.id(51565254142444628)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94633034230066761)
,p_name=>'DeleteIdentity'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94390928558593137)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171898487649228208)
,p_event_id=>wwv_flow_api.id(94633034230066761)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select count(identity)',
'    into :P60_TRAVEL_DOCUMENT_COUNT',
'    from dl_blacklist.travel_docs where identity = :P60_IDENTITY_ID;',
'end;'))
,p_attribute_02=>'P60_IDENTITY_ID'
,p_attribute_03=>'P60_TRAVEL_DOCUMENT_COUNT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171898628114228210)
,p_event_id=>wwv_flow_api.id(94633034230066761)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*var td = parseInt(apex.item(''P60_TRAVEL_DOCUMENT_COUNT'').getValue());',
'if(td>0){',
'    apex.message.alert(apex.lang.getMessage(''IDENTITY_DELETE.WARNING.TRAVEL_DOCS_MUST_BE_DELETED_BEFORE''));',
'    return false;',
'}*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94634948932066766)
,p_event_id=>wwv_flow_api.id(94633034230066761)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'&P60_IDENTITY_DELETE.'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94634423116066766)
,p_event_id=>wwv_flow_api.id(94633034230066761)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'BEGIN',
'  pkg_db_access.delete_identity_for_blacklist(:P60_IDENTITY_ID,:P60_CASE_ID);',
'  commit;',
'END;'))
,p_attribute_02=>'P60_CASE_ID,P60_IDENTITY_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94633401725066764)
,p_event_id=>wwv_flow_api.id(94633034230066761)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh.apex.region(''IdentitiesGrid'').refresh();',
'top.windowToRefresh = null;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94633982970066765)
,p_event_id=>wwv_flow_api.id(94633034230066761)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63379933957424477)
,p_name=>'DateValidation'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P60_DATE_OF_BIRTH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63380369044424569)
,p_event_id=>wwv_flow_api.id(63379933957424477)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!/INPUT/.test(this.triggeringElement.nodeName)) return;',
'    var id = this.triggeringElement.id;',
'    var item = apex.item(id);',
'    var value = item.getValue();',
'    var message = "";',
'    if(value !== '''' && !value.match(/^((0[1-9]|[12][0-9]|3[01]|00)\/(0[1-9]|1[012]|00)\/(19|20)\d\d)|^(0[1-9]|1[012])\/(19|20)\d\d|^(19|20)\d\d$/)){',
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
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134218590205935820)
,p_name=>'ReplaceNotValidChars'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P60_DATE_OF_BIRTH'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134218977908935821)
,p_event_id=>wwv_flow_api.id(134218590205935820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!/INPUT/.test(this.triggeringElement.nodeName)) return;',
'    var id = this.triggeringElement.id;',
'    var item = apex.item(id);',
'    var value = item.getValue();',
'console.log(''ewewr'');',
' if(!/^(\d|\/)+$/.test(value)){',
'     this.browserEvent.stopPropagation();',
'     item.setValue(value.replace(/[^\/\d]/g,''''))',
' }'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67105389584079823)
,p_name=>'ValidateOnlyNumber'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P60_BODY_HEIGHT,P60_BODY_WEIGHT'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67105495266079824)
,p_event_id=>wwv_flow_api.id(67105389584079823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!/INPUT/.test(this.triggeringElement.nodeName)) return;',
'    var id = this.triggeringElement.id;',
'    var item = apex.item(id);',
'    var value = item.getValue();',
'console.log(''OnlyNumber'');',
' if(!/^(\d)+$/.test(value)){',
'     this.browserEvent.stopPropagation();',
'     item.setValue(value.replace(/[^\d]/g,''''))',
'     message = apex.lang.getMessage(''FORM.VALIDATION_ERROR.ONLY_NUMBERS_ARE_ALLOWED'');',
'     $(''#''+id+''_error_placeholder:not(.error-shown)'')',
'            .addClass(''t-Form-error error-shown'')',
'            .append(''<span class="charset-error">''+message+ ''</span>'' );',
' }',
'else{',
'        $(''#''+id).parent().parent().find(''.error-shown'').removeClass(''error-shown'').find(''.charset-error'').remove();',
'    }',
'',
'    '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50305136478241122)
,p_name=>'New'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(344362959886685818)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistloadednistjson'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50305209007241123)
,p_event_id=>wwv_flow_api.id(50305136478241122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(this.data);',
'try{',
'    window.currentApexSpinner.remove();',
'}',
'catch(e){}',
'function setName(nameStr){',
'    if(nameStr.indexOf('','')>-1){',
'        var names = nameStr.split('','');',
'        apex.item(''P60_GIVEN_NAME'').setValue(names[0])',
'        if(names[1]){',
'            apex.item(''P60_SURNAME'').setValue(names[1])',
'        }',
'    }',
'    else{',
'        var names = nameStr.split(''/'');',
'        var surname = names.shift();',
'        apex.item(''P60_GIVEN_NAME'').setValue(names.join('' ''))',
'        apex.item(''P60_SURNAME'').setValue(surname)',
'    }',
'}',
'',
'var descText = this.data.descriptiveText',
'if(descText[0][''010'']){',
'    apex.item(''P60_REFERENCE_DOCUMENT_NUMBER'').setValue(descText[0][''010''][0][0])',
'}',
'if(descText[0][''030'']){',
'    setName(descText[0][''030''][0][0]);',
'}',
'if(descText[0][''039'']){',
'    var val = ''M'';',
'    switch(descText[0][''039''][0][0]){',
'            case''F'':',
'            case''Female'':',
'            val = ''F''; break;',
'            case''U'':',
'            case''Other'':',
'            val = ''X''; break;',
'    }',
'    apex.item(''P60_SEX'').setValue(val);',
'}',
'if(descText[0][''047'']){',
'    apex.item(''P60_PASSPORT_NUMBER'').setValue(descText[0][''047''][0][0])',
'}',
'if(descText[0][''038'']){',
'    var twoLetterCode = descText[0][''038''][0][0].split(''/'')[0];',
'    if(twoLetterCode != ''undefined'' && twoLetterCode != ''''){',
'        apex.item(''P60_NATIONALITY_LOOKUP'').setValue(twoLetterCode)',
'    }',
'}',
'if(descText[0][''035'']){',
'    var dobStr = descText[0][''035''][0][0].replace(/-/g,'''');',
'    apex.item(''P60_DATE_OF_BIRTH'').setValue(dobStr.substr(6,2)+''/''+dobStr.substr(4,2)+''/''+dobStr.substr(0,4))',
'}',
'if(descText[0][''037'']){',
'    apex.item(''P60_PLACE_OF_BIRTH'').setValue(descText[0][''037''][0][0])',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50305407472241125)
,p_name=>'SetNationality'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P60_NATIONALITY_LOOKUP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50305570619241126)
,p_event_id=>wwv_flow_api.id(50305407472241125)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select icao',
'    into :P60_NATIONALITY',
'    from dl_common.icao_doc_codes$lc ',
'    where country like :P60_NATIONALITY_LOOKUP||''%'' and rownum = 1;',
'',
'end;'))
,p_attribute_02=>'P60_NATIONALITY_LOOKUP'
,p_attribute_03=>'P60_NATIONALITY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(51564827921444623)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row'
,p_attribute_02=>'IDENTITIES'
,p_attribute_03=>'P60_IDENTITY_ID'
,p_attribute_04=>'KEY_VALUE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94638237093108683)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetItems'
,p_process_sql_clob=>':P60_IDENTITY_DELETE := APEX_LANG.MESSAGE (''IDENTITY.DELETE'');'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
