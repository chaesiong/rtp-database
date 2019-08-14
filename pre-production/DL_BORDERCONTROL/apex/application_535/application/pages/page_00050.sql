prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'EditTraveldoc'
,p_page_mode=>'MODAL'
,p_step_title=>'Edit a Traveldoc'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function setFaceToItem (url){',
'    var bestMatch = false;',
'    var newGguid  = getGuidFromUrl(url);',
'    var allreadyExists = false;',
'    $(''.FaceItem'').each(function(i, el){',
'        if(!bestMatch){',
'            var faceModel = $(this).FaceItem(''broadcast'');',
'            if(!faceModel.getImageURL){',
'                bestMatch = this;',
'            }',
'            else{',
'                if(newGguid && getGuidFromUrl(faceModel.getImageURL()) == newGguid){',
'                    allreadyExists = true;',
'                }',
'            }',
'        }',
'    })',
'  if(bestMatch && !allreadyExists){',
'      $(bestMatch).FaceItem(''urlToModel'', url );',
'  }',
'}',
'function getGuidFromUrl(url) {',
'        var matches = url.match(/\/([^\/\?]{32})($|\?)/);',
'        if (matches) return matches[1];',
'        return null;',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(top).find(''.PassportCaptureContainer'').each(function () {',
'      $(this).PassportCapture(''releaseDevice'');',
'});'))
,p_css_file_urls=>'#APP_IMAGES#css/application-overwrite.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.FaceItem {',
'    width: 100%;',
'    height: 320px;',
'    margin-top: 1px;',
'    box-shadow: none;',
'}',
'.FaceItemLayout .fc-item-content.hasImage {',
'    background-color: #fff;',
'}',
'.col>.pass-photo.t-Form-fieldContainer {',
'    margin: 0 !important;',
'}',
'.PassportCapture .pp-header {',
' height: 48px;   ',
'}',
'.PassportCapture .passport-contents .security-overlay .image-ir {',
'    height: auto;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1280'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190705131853'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48315211965575036)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(15256924031705251)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50304200442241113)
,p_plug_name=>'NIST Import'
,p_parent_plug_id=>wwv_flow_api.id(48315211965575036)
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
 p_id=>wwv_flow_api.id(343406040210553106)
,p_plug_name=>'Travel Document'
,p_parent_plug_id=>wwv_flow_api.id(48315211965575036)
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
 p_id=>wwv_flow_api.id(139790447045414348)
,p_plug_name=>'Person and Document'
,p_parent_plug_id=>wwv_flow_api.id(343406040210553106)
,p_region_css_classes=>'person region-100 region-100-with-header too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>7
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139792294075414466)
,p_plug_name=>'FacePhoto'
,p_parent_plug_id=>wwv_flow_api.id(139790447045414348)
,p_region_css_classes=>'too-small-for-overlay region-100 pass-photo-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h240:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'col-100'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(140906072371245647)
,p_plug_name=>'DemographicData'
,p_parent_plug_id=>wwv_flow_api.id(139790447045414348)
,p_region_css_classes=>'demographic-data region-blue'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'region-blue'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139796246365417524)
,p_plug_name=>'PassCapture'
,p_parent_plug_id=>wwv_flow_api.id(343406040210553106)
,p_region_css_classes=>'region-100 i-h400'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.DERMALOG.PASSPORTCAPTURE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'Y'
,p_attribute_02=>'XF09'
,p_attribute_03=>'N'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(343406152977553107)
,p_plug_name=>'History'
,p_parent_plug_id=>wwv_flow_api.id(48315211965575036)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P50_TRAVELDOC_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(343406288723553108)
,p_name=>'History'
,p_parent_plug_id=>wwv_flow_api.id(343406152977553107)
,p_template=>wwv_flow_api.id(15253766136705247)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'return DL_BLACKLIST.PKG_DL_HISTORY.GET_CHANGES_HISTORY_FROM_TABLE(',
'    ''travel_docs'', ',
'    ''DOC_TYPE',
'	,ISSUING_COUNTRY',
'	,DOC_NUMBER',
'	,DATE_OF_ISSUE',
'	,DATE_OF_EXPIRY$VC',
'	,DATE_OF_EXPIRY',
'	,SURNAME',
'	,GIVEN_NAME',
'	,NATIONALITY',
'	,PLACE_OF_BIRTH',
'	,SEX',
'	,ISSUING_AUTHORITY',
'	,DATE_OF_BIRTH_PARTIAL',
'	,MRZ_FORMAT',
'	,MRZ_DATA',
'	,DATA_ACQUISITION_TYPE',
'	,INS_AT',
'	,INS_BY',
'	,DML_AT',
'	,DML_BY',
'	,DML_TYPE',
'	,OWNER',
'	,IDENTITY'',',
'    :P50_TRAVELDOC_ID',
'   );',
'END;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_ajax_enabled=>'Y'
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
 p_id=>wwv_flow_api.id(349024029223836702)
,p_query_column_id=>1
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Column name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(349024142131836703)
,p_query_column_id=>2
,p_column_alias=>'PREVIOUS_VALUE'
,p_column_display_sequence=>2
,p_column_heading=>'Previous value'
,p_use_as_row_header=>'N'
,p_report_column_width=>270
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(349024275641836704)
,p_query_column_id=>3
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>3
,p_column_heading=>'New value'
,p_use_as_row_header=>'N'
,p_report_column_width=>270
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(349024307668836705)
,p_query_column_id=>4
,p_column_alias=>'CHANGED_AT'
,p_column_display_sequence=>4
,p_column_heading=>'Changed at'
,p_use_as_row_header=>'N'
,p_column_format=>'dd/mm/yyyy HH24:MI'
,p_report_column_width=>120
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(349024463631836706)
,p_query_column_id=>5
,p_column_alias=>'CHANGED_BY'
,p_column_display_sequence=>5
,p_column_heading=>'Changed by'
,p_use_as_row_header=>'N'
,p_report_column_width=>270
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89403846729832245)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(343406040210553106)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94387513478593103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(343406040210553106)
,p_button_name=>'UPDATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48315313990575037)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(343406040210553106)
,p_button_name=>'Add'
,p_button_static_id=>'ADD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89402740340832234)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(343406040210553106)
,p_button_name=>'Delete'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Delete Traveldoc'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P50_TRAVELDOC_ID IS NOT NULL'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(250014985189795713)
,p_branch_name=>'GotoExistingPassport'
,p_branch_action=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP:P70_CASE_ID,P70_IDENTITY_ID,P70_CASE_JSON,P70_SUBMITTED:&P50_CASE_ID.,&P50_EXISTING_IDENTITY.,,&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3135081682378737)
,p_name=>'P50_DOC_CLASS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_item_default=>'5'
,p_prompt=>'Document Type'
,p_source=>'DOC_CLASS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DOCUMENT_CLASSES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.BC_DOC_CLASS$LC',
'    where IS_ACTIVE=''Y''',
'    order by display_value, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3135819356378745)
,p_name=>'P50_ISSUING_DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Issuing Date'
,p_source=>'DATE_OF_ISSUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1970:2030'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48316328359575047)
,p_name=>'P50_IDENTITY_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(139790447045414348)
,p_use_cache_before_default=>'NO'
,p_source=>'IDENTITY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48431378987453335)
,p_name=>'P50_FACE_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139792294075414466)
,p_prompt=>'Portrait Pass'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_grid_column_css_classes=>'field-100'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_css_classes=>'pass-photo field-100'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'FACE'
,p_attribute_07=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'}'))
,p_attribute_08=>'Y'
,p_attribute_09=>'Y'
,p_attribute_10=>'/image'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48431995042453338)
,p_name=>'P50_FIRSTNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_prompt=>'First Name'
,p_placeholder=>' '
,p_source=>'GIVEN_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48432352766453339)
,p_name=>'P50_SURNAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname'
,p_placeholder=>' '
,p_source=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48432762372453340)
,p_name=>'P50_DATE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_prompt=>'Date of Birth'
,p_placeholder=>' '
,p_source=>'select td.date_of_birth_partial.getFormatData(''DD/MM/YYYY'') FROM travel_docs td WHERE key_value = :P50_TRAVELDOC_ID;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'1910:2037'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48433105044453341)
,p_name=>'P50_PLACE_OF_BIRTH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of Birth'
,p_placeholder=>' '
,p_source=>'PLACE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48433536619453342)
,p_name=>'P50_SEX'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48433950101453346)
,p_name=>'P50_NATIONALITY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
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
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48434379656453349)
,p_name=>'P50_PASSPORT_NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc Number'
,p_placeholder=>'   '
,p_source=>'DOC_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>36
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48434734577453350)
,p_name=>'P50_PASSPORT_ISSUING_COUNTRY'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc Iss. Country'
,p_source=>'ISSUING_COUNTRY'
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48435157288453351)
,p_name=>'P50_PASSPORT_EXPIRY_DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Expiry Date'
,p_placeholder=>' '
,p_source=>'DATE_OF_EXPIRY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48928897155296303)
,p_name=>'P50_TRAVELDOC_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(139790447045414348)
,p_use_cache_before_default=>'NO'
,p_source=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50304567385241116)
,p_name=>'P50_NATIONALITY_LOOKUP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67105519709079825)
,p_name=>'P50_DOC_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_source=>'DOC_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67105855481079828)
,p_name=>'P50_PASSPHOTO_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_source=>'SELECT image_id FROM dl_blacklist.faces WHERE id=:P50_FACE_ID AND ROWNUM =1;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67105930448079829)
,p_name=>'P50_FACE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(140906072371245647)
,p_use_cache_before_default=>'NO'
,p_source=>'FACE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67106761971079837)
,p_name=>'P50_CASE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139790447045414348)
,p_source=>'P50_CASE_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89404394651832250)
,p_name=>'P50_TRAVELDOC_DELETE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(48315211965575036)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(250014510416795709)
,p_name=>'P50_REDIRECT_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(48315211965575036)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(250015075491795714)
,p_name=>'P50_EXISTING_IDENTITY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(48315211965575036)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(3135984835378746)
,p_validation_name=>'ValidDate'
,p_validation_sequence=>10
,p_validation=>'P50_PASSPORT_EXPIRY_DATE'
,p_validation_type=>'ITEM_IS_DATE'
,p_error_message=>'Please enter a valid date'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(48435157288453351)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48438118502481694)
,p_name=>'PassCaptured'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(139796246365417524)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.PASSPORTCAPTURE|REGION TYPE|passportcapturemodelchanged'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48438579712481698)
,p_event_id=>wwv_flow_api.id(48438118502481694)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''Passmodel: '', this.data.toJSON());',
'var model = this.data.getPhotoImageURL ? this.data : this.data.get(''passport'');',
'var url = model.getPhotoImageURL();',
'var mrz = model.get(''DigitalMRZ'') || model.get(''OpticalMRZ'');',
'if(url){',
'    if(/^data:/.test(url)){',
'        apex.message.alert(''Passport image is Base64 encoded'');',
'    }',
'}',
'$(''.pass-photo .FaceItem'').FaceItem(''urlToModel'',url  );',
'',
'if(!mrz) return false;',
'var dateOfBirthParts = {};',
'if(/\d\d/.test(mrz.DateOfBirth.substr(0,2))){',
'    if(mrz.DateOfBirth.substr(0,2) < (new Date()).getFullYear() - 2000){',
'        dateOfBirthParts.year = ''20'' + mrz.DateOfBirth.substr(0,2);',
'    }',
'    else{',
'        dateOfBirthParts.year = ''19'' + mrz.DateOfBirth.substr(0,2);',
'    }',
'}',
'if(/\d\d/.test(mrz.DateOfBirth.substr(2,2))){',
'    dateOfBirthParts.month = mrz.DateOfBirth.substr(2,2);',
'}',
'if(/\d\d/.test(mrz.DateOfBirth.substr(4,2))){',
'    dateOfBirthParts.day = mrz.DateOfBirth.substr(4,2);',
'}',
'apex.item(''P50_DATE_OF_BIRTH'').setValue(   ',
'    (dateOfBirthParts.day ? dateOfBirthParts.day + ''/'' : '''') + ',
'    (dateOfBirthParts.month ? dateOfBirthParts.month + ''/'' : '''') + ',
'    (dateOfBirthParts.year ? dateOfBirthParts.year : '''')',
');',
'',
'var year             = dateOfBirthParts.year;',
'var month            = dateOfBirthParts.month;',
'var day              = dateOfBirthParts.day;',
'',
'apex.item(''P50_DATE_OF_BIRTH_YEAR'').setValue(year);',
'apex.item(''P50_DATE_OF_BIRTH_MONTH'').setValue(month);',
'apex.item(''P50_DATE_OF_BIRTH_MONTH'').setValue(parseInt(month));',
'apex.item(''P50_DATE_OF_BIRTH_DAY'').setValue(day);',
'apex.item(''P50_DATE_OF_BIRTH_DAY'').setValue(parseInt(day));',
'',
'apex.item(''P50_FIRSTNAME'').setValue(mrz.GivenNames);',
'apex.item(''P50_SURNAME'').setValue(mrz.Surname);',
'//$(''#P50_DATE_OF_BIRTH'').datepicker( "setDate", (new Date(mrz.DateOfBirth)) );',
'$(''#P50_ISSUING_DATE'').datepicker( "setDate", (new Date(mrz.IssuingDate)) );',
'apex.item(''P50_NATIONALITY'').setValue(mrz.Nationality);',
'apex.item(''P50_PASSPORT_ISSUING_COUNTRY'').setValue(mrz.IssuingState);',
'apex.item(''P50_PASSPORT_NUMBER'').setValue(mrz.PassportNo);',
'var dateOfExpiryParts = {};',
'if(/\d\d/.test(mrz.DateOfExpiry.substr(0,2))){',
'    dateOfExpiryParts.year = ''20'' + mrz.DateOfExpiry.substr(0,2);',
'}',
'if(/\d\d/.test(mrz.DateOfExpiry.substr(2,2))){',
'    dateOfExpiryParts.month = mrz.DateOfExpiry.substr(2,2);',
'}',
'if(/\d\d/.test(mrz.DateOfExpiry.substr(4,2))){',
'    dateOfExpiryParts.day = mrz.DateOfExpiry.substr(4,2);',
'}',
'apex.item(''P50_PASSPORT_EXPIRY_DATE'').setValue(',
'    (dateOfExpiryParts.day ? dateOfExpiryParts.day + ''/'' : '''') + ',
'    (dateOfExpiryParts.month ? dateOfExpiryParts.month + ''/'' : '''') + ',
'    (dateOfExpiryParts.year ? dateOfExpiryParts.year : '''')',
');',
'//$(''#P50_PASSPORT_EXPIRY_DATE'').datepicker( "setDate", (new Date(mrz.DateOfExpiry)) );',
'switch(mrz.Sex){',
'    case 1: apex.item(''P50_SEX'').setValue(''M'');',
'        break;',
'    case 2: apex.item(''P50_SEX'').setValue(''F'');',
'        break;',
'    case 3: apex.item(''P50_SEX'').setValue(''X'');',
'        break;',
'}',
'switch(mrz.DocumentType){',
'    case 1: apex.item(''P50_DOC_TYPE'').setValue(''1'');',
'            apex.item(''P50_DOC_CLASS'').setValue(''1'');',
'        break;',
'    case 2: ',
'        break;',
'    case 3: ',
'        break;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48315444983575038)
,p_name=>'SaveDocument'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48315313990575037)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67105780062079827)
,p_event_id=>wwv_flow_api.id(48315444983575038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.waitSpinnerRef = apex.widget.waitPopup();',
'var faceImageId = '''';',
'function getGuidFromUrl( url ){',
'    var matches = url.match(/\/([^\/\?]{32})($|\?)/);',
'    if (matches) return matches[1];',
'    return null;',
'}',
'',
'$(''.FaceItem'').each(function(i, el){ ',
'    var model = $(this).FaceItem(''broadcast'');',
'    if(model.has(''ImageGuid'') || model.has(''ImageUrl'')){',
'        apex.item("P50_PASSPHOTO_ID").setValue(getGuidFromUrl( model.getImageURL() ) );',
'    }',
'    else{',
'        apex.item("P50_PASSPHOTO_ID").setValue('''');',
'    }',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(250014473599795708)
,p_event_id=>wwv_flow_api.id(48315444983575038)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- P50_CASE_ID,P50_IDENTITY_ID,P50_PASSPORT_NUMBER,P50_PASSPORT_ISSUING_COUNTRY',
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'    l_identity dl_blacklist.travel_docs.identity%TYPE;',
'    v_SEQ_ID       INTEGER;',
'BEGIN ',
'    SELECT identity',
'    INTO l_identity',
'    FROM dl_blacklist.travel_docs',
'    WHERE issuing_country = :P50_PASSPORT_ISSUING_COUNTRY AND doc_number = :P50_PASSPORT_NUMBER AND identity != :P50_IDENTITY_ID;',
'    ',
'    IF l_identity IS NOT NULL THEN',
'        IF NOT APEX_COLLECTION.collection_exists(p_collection_name => ''EXISTING_IDENTITY'')',
'          THEN',
'            APEX_COLLECTION.create_or_truncate_collection(p_collection_name => ''EXISTING_IDENTITY'');',
'            v_SEQ_ID := APEX_COLLECTION.ADD_MEMBER(p_collection_name => ''EXISTING_IDENTITY'');',
'        END IF;',
'        APEX_COLLECTION.UPDATE_MEMBER(',
'            p_collection_name  => ''EXISTING_IDENTITY''',
'            , p_seq            => 1',
'            , p_n001            => 0 --',
'            , p_c001            => l_identity',
'            , p_clob001         => null',
'            , p_blob001         => null',
'          );',
'    ',
'        l_url := APEX_UTIL.PREPARE_URL(',
'            p_url => ''f?p='' || l_app || '':70:''||l_session||''::NO:70:P70_IDENTITY_ID,P70_CASE_ID:'' || l_identity || '','' || :P50_CASE_ID,',
'            p_checksum_type => ''SESSION'');',
'        :P50_REDIRECT_URL := l_url;',
'        APEX_UTIL.SET_SESSION_STATE(''P50_EXISTING_IDENTITY'', l_identity);',
'    END IF;',
'    ',
'EXCEPTION WHEN no_data_found THEN   ',
' :P50_REDIRECT_URL := '''';',
' :P50_EXISTING_IDENTITY := '''';',
'END;'))
,p_attribute_02=>'P50_CASE_ID,P50_IDENTITY_ID,P50_PASSPORT_NUMBER,P50_PASSPORT_ISSUING_COUNTRY'
,p_attribute_03=>'P50_REDIRECT_URL,P50_EXISTING_IDENTITY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(250014620801795710)
,p_event_id=>wwv_flow_api.id(48315444983575038)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P50_EXISTING_IDENTITY'').getValue()!=''''){',
'    apex.page.submit({ request:"UPDATE" });',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48315517039575039)
,p_event_id=>wwv_flow_api.id(48315444983575038)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_traveldoc         pkg_db_access.traveldoc_1_r;',
'    l_id                pkg_utils.id_t;',
'    l_blacklist_case_id pkg_utils.id_t;',
'    l_biometric_id      pkg_utils.id_t;',
'    l_image_test_id     pkg_utils.id_t;',
'    l_face_id           pkg_utils.id_t;',
'    l_new_face          pkg_db_access.face_guid_1_tt;',
'    l_face_position_id  pkg_utils.id_t; ',
'    l_error_json        JSON_OBJECT_T;',
'begin',
'    l_traveldoc.surname:= :P50_SURNAME;',
'    l_traveldoc.given_name := :P50_FIRSTNAME;',
'    l_traveldoc.nationality := :P50_NATIONALITY;',
'    l_traveldoc.place_of_birth := :P50_PLACE_OF_BIRTH;',
'    l_traveldoc.date_of_birth := :P50_DATE_OF_BIRTH;',
'    l_traveldoc.doc_number := :P50_PASSPORT_NUMBER;',
'    l_traveldoc.doc_type := :P50_DOC_TYPE;',
'    l_traveldoc.identity := :P50_IDENTITY_ID;',
'    l_traveldoc.sex := UPPER(SUBSTR(:P50_SEX , 1, 1));',
'    l_traveldoc.issuing_country := :P50_PASSPORT_ISSUING_COUNTRY;',
'    l_traveldoc.date_of_issue := :P50_ISSUING_DATE;',
'    l_traveldoc.date_of_expiry := TO_DATE(:P50_PASSPORT_EXPIRY_DATE );',
'    l_traveldoc.doc_class := :P50_DOC_CLASS;',
'    l_traveldoc.id := :P50_TRAVELDOC_ID;',
'    ',
'    l_id  := :P50_IDENTITY_ID;',
'    ',
'    l_blacklist_case_id := :P50_CASE_ID;',
'    ',
'    IF :P50_PASSPHOTO_ID IS NOT NULL',
'    THEN',
'        BEGIN',
'            SELECT id',
'            INTO   l_biometric_id',
'            FROM   dl_blacklist.biometrics b',
'            WHERE  b.blacklist_case_id = l_blacklist_case_id;',
'        EXCEPTION',
'            WHEN no_data_found THEN',
'                INSERT INTO dl_blacklist.biometrics',
'                    (blacklist_case_id)',
'                VALUES',
'                    (l_blacklist_case_id)',
'                RETURNING id INTO l_biometric_id;',
'        END;',
'        ',
'        IF l_biometric_id IS NOT NULL',
'        THEN',
'            DECLARE',
'                l_biometric_json JSON_OBJECT_T;',
'                l_faces          JSON_ARRAY_T;',
'            BEGIN',
'                SELECT id, image_id',
'                INTO   l_face_id, l_image_test_id',
'                FROM   dl_blacklist.faces',
'                WHERE  image_id = :P50_PASSPHOTO_ID;',
'            EXCEPTION',
'                WHEN no_data_found THEN',
'                ',
'                UPDATE images i',
'                SET i.lifetime = 0',
'                WHERE i.id = :P50_PASSPHOTO_ID;',
'                ',
'                l_biometric_json := JSON_OBJECT_T.parse( dl_blacklist.pkg_camunda_rest.get_biometric_data$json(:P50_CASE_ID) );',
'                l_faces := l_biometric_json.get_Array(''faces'');',
'                l_faces.append(JSON_OBJECT_T.parse(''{"image": {"guid": ''|| ''"'' || :P50_PASSPHOTO_ID || ''"''  ||''}, "nistPosition": 1}''));',
'                l_biometric_json.put(''faces'', l_faces);',
'                dl_blacklist.pkg_camunda_rest.update_biometrics(l_biometric_json.to_string, :P50_CASE_ID);',
'                ',
'                SELECT id',
'                INTO   l_face_id',
'                FROM   dl_blacklist.faces',
'                WHERE  image_id = :P50_PASSPHOTO_ID;',
'                ',
'           END;',
'           ',
'           ',
'        END IF;',
'    END IF;',
'    ',
'    l_traveldoc.face_id := l_face_id;',
'    pkg_db_access.put_traveldoc_for_identity(l_traveldoc, l_id);',
'    ',
'EXCEPTION',
'',
'WHEN DUP_VAL_ON_INDEX THEN',
'   --APEX_ERROR.ADD_ERROR (',
'   --p_message          => ''xy'',',
'   -- p_additional_info  => ''Additional Info from Robert'',',
'   -- p_display_location => apex_error.c_on_error_page ',
'   --);',
'    null;',
'   -- OWA_UTIL.status_line(200, ''OK'', true);',
'    --htp.p(''{"error": "xy", "location": "page"}'');',
'    --raise_application_error (-20101, apex_lang.message(''FACECAPTURE:FACEDETAILS.QUALITY''));',
'',
'end;',
''))
,p_attribute_02=>'P50_FIRSTNAME,P50_SURNAME,P50_DATE_OF_BIRTH,P50_SEX,P50_NATIONALITY,P50_PASSPORT_NUMBER,P50_PASSPORT_ISSUING_COUNTRY,P50_PASSPORT_EXPIRY_DATE,P50_IDENTITY_ID,P50_TRAVELDOC_ID,P50_ISSUING_DATE,P50_DOC_TYPE,P50_DOC_CLASS,P50_PLACE_OF_BIRTH,P50_CASE_ID,'
||'P50_PASSPHOTO_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48929253937296307)
,p_event_id=>wwv_flow_api.id(48315444983575038)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.waitSpinnerRef.remove();',
'top.windowToRefresh.apex.region(''TravelDocs'').refresh();',
'top.windowToRefresh.reloadBiometrics();',
'top.windowToRefresh = null;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48316519045575049)
,p_event_id=>wwv_flow_api.id(48315444983575038)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P50_TRAVELDOC_ID'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89403645277832243)
,p_name=>'DeleteDocument'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(89402740340832234)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89404216990832249)
,p_event_id=>wwv_flow_api.id(89403645277832243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'&P50_TRAVELDOC_DELETE.'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89403530657832242)
,p_event_id=>wwv_flow_api.id(89403645277832243)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'BEGIN',
'  pkg_db_access.delete_traveldoc(:P50_TRAVELDOC_ID);',
'END;'))
,p_attribute_02=>'P50_FIRSTNAME,P50_SURNAME,P50_DATE_OF_BIRTH,P50_SEX,P50_NATIONALITY,P50_PASSPORT_NUMBER,P50_PASSPORT_ISSUING_COUNTRY,P50_PASSPORT_EXPIRY_DATE,P50_IDENTITY_ID,P50_TRAVELDOC_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89403365508832240)
,p_event_id=>wwv_flow_api.id(89403645277832243)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh.apex.region(''TravelDocs'').refresh();',
'top.windowToRefresh = null;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89403446114832241)
,p_event_id=>wwv_flow_api.id(89403645277832243)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P50_TRAVELDOC_ID'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89403931047832246)
,p_name=>'OnClickCancel'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(89403846729832245)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89404199036832248)
,p_event_id=>wwv_flow_api.id(89403931047832246)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P50_TRAVELDOC_ID'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94387612086593104)
,p_name=>'OnClickUpdate'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94387513478593103)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94387726492593105)
,p_event_id=>wwv_flow_api.id(94387612086593104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#ADD").click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94387892017593106)
,p_name=>'OnPageLoad_ShowADD'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P50_TRAVELDOC_ID IS NULL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94387924134593107)
,p_event_id=>wwv_flow_api.id(94387892017593106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(48315313990575037)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94388071475593108)
,p_event_id=>wwv_flow_api.id(94387892017593106)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(94387513478593103)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94388170300593109)
,p_name=>'OnPageLoad?ShowUPDATE'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P50_TRAVELDOC_ID IS NOT NULL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94388247648593110)
,p_event_id=>wwv_flow_api.id(94388170300593109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(94387513478593103)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94388399690593111)
,p_event_id=>wwv_flow_api.id(94388170300593109)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(48315313990575037)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63404125617478085)
,p_name=>'DateValidation'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_ISSUING_DATE,P50_PASSPORT_EXPIRY_DATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63404538975478128)
,p_event_id=>wwv_flow_api.id(63404125617478085)
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
'    if(value !== '''' && !value.match(/^((0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/(19|20)\d\d)?$/)){',
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
 p_id=>wwv_flow_api.id(352428880867813209)
,p_name=>'DateOfBirthValidation'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_DATE_OF_BIRTH'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(352428952787813210)
,p_event_id=>wwv_flow_api.id(352428880867813209)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(134217533145930842)
,p_name=>'ReplaceNotValidChars'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_ISSUING_DATE,P50_PASSPORT_EXPIRY_DATE,P50_DATE_OF_BIRTH'
,p_bind_type=>'bind'
,p_bind_event_type=>'keypress'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(134217981326930849)
,p_event_id=>wwv_flow_api.id(134217533145930842)
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
 p_id=>wwv_flow_api.id(67106023285079830)
,p_name=>'SetPassPhoto'
,p_event_sequence=>120
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67106192352079831)
,p_event_id=>wwv_flow_api.id(67106023285079830)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P50_PASSPHOTO_ID'').getValue() !== ''''){',
'    $(''.FaceItem'').first().FaceItem(''urlToModel'', ''/image/''+apex.item(''P50_PASSPHOTO_ID'').getValue());',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(250014743792795711)
,p_name=>'CloseEvent'
,p_event_sequence=>130
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'close-dialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(250014834587795712)
,p_event_id=>wwv_flow_api.id(250014743792795711)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50304367444241114)
,p_name=>'NistDescriptionLoaded'
,p_event_sequence=>140
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(48315211965575036)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistloadednistjson'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50304499223241115)
,p_event_id=>wwv_flow_api.id(50304367444241114)
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
'        apex.item(''P50_FIRSTNAME'').setValue(names[0])',
'        if(names[1]){',
'            apex.item(''P50_SURNAME'').setValue(names[1])',
'        }',
'    }',
'    else{',
'        var names = nameStr.split(''/'');',
'        var surname = names.shift();',
'        apex.item(''P50_FIRSTNAME'').setValue(names.join('' ''))',
'        apex.item(''P50_SURNAME'').setValue(surname)',
'    }',
'}',
'',
'var descText = this.data.descriptiveText',
'if(descText[0][''010'']){',
'    apex.item(''P80_REFERENCE_DOCUMENT_NUMBER'').setValue(descText[0][''010''][0][0])',
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
'    apex.item(''P50_SEX'').setValue(val);',
'}',
'if(descText[0][''047'']){',
'    apex.item(''P50_PASSPORT_NUMBER'').setValue(descText[0][''047''][0][0])',
'}',
'if(descText[0][''038'']){',
'    var twoLetterCode = descText[0][''038''][0][0].split(''/'')[0];',
'    if(twoLetterCode != ''undefined'' && twoLetterCode != ''''){',
'       apex.item(''P50_NATIONALITY_LOOKUP'').setValue(twoLetterCode) ',
'    }',
'}',
'if(descText[0][''035'']){',
'    var dobStr = descText[0][''035''][0][0].replace(/-/g,'''');',
'    apex.item(''P50_DATE_OF_BIRTH'').setValue(dobStr.substr(6,2)+''/''+dobStr.substr(4,2)+''/''+dobStr.substr(0,4))',
'}',
'if(descText[0][''037'']){',
'    apex.item(''P50_PLACE_OF_BIRTH'').setValue(descText[0][''037''][0][0])',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50304656775241117)
,p_name=>'SetNationality'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_NATIONALITY_LOOKUP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50304734373241118)
,p_event_id=>wwv_flow_api.id(50304656775241117)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select icao, icao',
'    into :P50_NATIONALITY, :P50_PASSPORT_ISSUING_COUNTRY ',
'    from dl_common.icao_doc_codes$lc ',
'    where country like :P50_NATIONALITY_LOOKUP||''%''  and rownum = 1;',
'',
'end;'))
,p_attribute_02=>'P50_NATIONALITY_LOOKUP'
,p_attribute_03=>'P50_NATIONALITY,P50_PASSPORT_ISSUING_COUNTRY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50304814702241119)
,p_name=>'NistFaceLoaded'
,p_event_sequence=>160
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(48315211965575036)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.NIST|REGION TYPE|nistaddfacemodel'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50304989837241120)
,p_event_id=>wwv_flow_api.id(50304814702241119)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.getImageURL()){',
'    setFaceToItem(this.data.getImageURL());',
'}',
'try{',
'    window.currentApexSpinner.remove();',
'}',
'catch(e){}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48933308693296348)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'FetchRow'
,p_attribute_02=>'TRAVEL_DOCS'
,p_attribute_03=>'P50_TRAVELDOC_ID'
,p_attribute_04=>'KEY_VALUE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
