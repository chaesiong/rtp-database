prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(71772255799297339)
,p_name=>'Transfer Visum'
,p_page_mode=>'NORMAL'
,p_step_title=>'Transfer Visum'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(71725998477297085)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DNOTZON'
,p_last_upd_yyyymmddhh24miss=>'20180710094625'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65571328771430285)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
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
 p_id=>wwv_flow_api.id(67917050118258249)
,p_plug_name=>'Current Passport'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67917148878258250)
,p_plug_name=>'New Passport'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67918084853258259)
,p_plug_name=>'Photos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'    <div class="col col-6">',
'        <span style="float: right">',
'            <div style="margin-right: auto; margin-left:auto; width: 25%;">Old Photo</div>',
'            <img src="#WORKSPACE_IMAGES#person_noaspect.svg" height="300px">',
'        </span>',
'    </div>',
'',
'    <div class="col col-6" style="max-width: 325px">',
'        <span>',
'            <div style="margin-right: auto; margin-left:auto; width: 25%;">New Photo</div>',
'            <img src="#WORKSPACE_IMAGES#person_noaspect.svg" height="300px">',
'        </span>',
'    </div>',
'</div>',
'',
'<div class="row>',
'    <div class="col col-12" style="margin-right: auto; margin-left:auto; width: 5%;">',
'        <button class="t-Button t-Button--icon t-Button--iconRight lto12276724712196325_0 t-Button--hot" onclick="apex.submit({request:''Transfer_Visa'',validate:true});" type="button" id="B12276724712196325"><span class="t-Icon t-Icon--left " aria-hid'
||'den="true"></span><span class="t-Button-label">Transfer visa</span><span class="t-Icon t-Icon--right " aria-hidden="true"></span></button>',
'    </div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67918553629258264)
,p_plug_name=>'Reason for Transfer'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67918623199258265)
,p_plug_name=>'Visa'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99807581886740508)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65571425264430286)
,p_name=>'P5_SALUTATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Salutation:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Display1;Return1,Display2;Return2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65571545497430287)
,p_name=>'P5_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Last name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67915914890258238)
,p_name=>'P5_LAST_NAME_THAI'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Last name (Thai):'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916055490258239)
,p_name=>'P5_FIRST_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'First name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916099680258240)
,p_name=>'P5_FIRST_NAME_THAI'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'First name (Thai):'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916216045258241)
,p_name=>'P5_MIDDLE_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Middle name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916371814258242)
,p_name=>'P5_MIDDLE_NAME_THAI'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Middle name (Thai):'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916401611258243)
,p_name=>'P5_NATIONALITY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.COUNTRIES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916539215258244)
,p_name=>'P5_BIRTHDAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Birthday:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916649235258245)
,p_name=>'P5_BIRTHPLACE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Birthplace:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916778926258246)
,p_name=>'P5_GENDER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_GENDERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916816423258247)
,p_name=>'P5_AGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Age:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67916963870258248)
,p_name=>'P5_PROFESSION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(65571328771430285)
,p_prompt=>'Profession:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67917232585258251)
,p_name=>'P5_CURRENT_PASSPORT_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67917050118258249)
,p_prompt=>'Current Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67917341777258252)
,p_name=>'P5_CURRENT_ISSUED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(67917050118258249)
,p_prompt=>'Issued By:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67917435946258253)
,p_name=>'P5_CURRENT_ISSUED_AT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(67917050118258249)
,p_prompt=>'Issued At:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67917531009258254)
,p_name=>'P5_CURRENT_EXPIRES_AT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(67917050118258249)
,p_prompt=>'Expiry Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67917656346258255)
,p_name=>'P5_NEW_PASSPORT_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67917148878258250)
,p_prompt=>'New Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67917764365258256)
,p_name=>'P5_NEW_ISSUED_BY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(67917148878258250)
,p_prompt=>'Issued By:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67917863899258257)
,p_name=>'P5_NEW_ISSUED_AT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(67917148878258250)
,p_prompt=>'Issued At:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67917895647258258)
,p_name=>'P5_NEW_EXPIRES_AT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(67917148878258250)
,p_prompt=>'Expiry Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67918470410258263)
,p_name=>'P5_REASONS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67918553629258264)
,p_prompt=>'Reasons:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67918773375258266)
,p_name=>'P5_VISA_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67918623199258265)
,p_prompt=>'Visa type'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67918825856258267)
,p_name=>'P5_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(67918623199258265)
,p_prompt=>'Date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67918971909258268)
,p_name=>'P5_TRANSPORT_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(67918623199258265)
,p_prompt=>'Transport Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TRAVEL_MODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.BC_PERSON_TYPES$LC ',
'WHERE IS_ACTIVE = ''Y''',
'AND (TRANS_MODE is null OR TRANS_MODE = (SELECT KEY_VALUE from DL_COMMON.TRANS_MODES where NUM_VALUE = :AI_TRANSPORT_MODE))',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67918996610258269)
,p_name=>'P5_ENTRY_STADIUM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(67918623199258265)
,p_prompt=>'Entry Stadium:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Display1;Return1,Display2;Return2'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67919170513258270)
,p_name=>'P5_TM6_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(67918623199258265)
,p_prompt=>'Tm6 number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67919282074258271)
,p_name=>'P5_DATE2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(67918623199258265)
,p_prompt=>'Date2'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67919357171258272)
,p_name=>'P5_NEW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(67918623199258265)
,p_prompt=>'At'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67919396255258273)
,p_name=>'P5_NEW_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(67918623199258265)
,p_prompt=>'Stay Until'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99807646561740509)
,p_name=>'P5_APPLICATION_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(99807581886740508)
,p_prompt=>'Application No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/