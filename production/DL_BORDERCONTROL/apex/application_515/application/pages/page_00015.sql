prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(71772255799297339)
,p_name=>'Search Form'
,p_page_mode=>'NORMAL'
,p_step_title=>'Search Form'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'td a span.fa{',
'    font-size: 23px!important;',
'}',
'',
'td[headers="editButton"],td[headers="deleteButton"],td[headers="printButton"] {',
'    padding-right:0px;',
'    padding-left:0px;',
'}'))
,p_step_template=>wwv_flow_api.id(71725998477297085)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DNOTZON'
,p_last_upd_yyyymmddhh24miss=>'20180717130748'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71522236712903853)
,p_plug_name=>'Application Number and Date'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71522747945903858)
,p_plug_name=>'Search Results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71735090454297137)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ROWNUM,',
'    tm8_application.application_number,',
'    tm8_application.doc_date,',
'    person.first_name || '' '' || person.middle_name || '' '' || person.last_name as "Name",',
'    person.sex,',
'    tm8_application.passportno,',
'    DECODE(tm8_application.tm8_type,''S'',''Single'',''M'',''Multiple'') as tm8_type,',
'    tm8_application.endpermit_date,',
'    lov_statuses.DISPLAY_VALUE as APPROVAL_STATUS,    ',
'    FAF_FEES_AND_FINES.BOOKING_NUMBER as "Receipt No.",',
'    BORDERPOSTS.NAME as "Department",',
'    ''edit'' as "Edit",',
'    ''delete'' as "Delete",',
'    ''print'' as "Print",',
'    tm8_application.FEES_FK,',
'    dl_bordercontrol.pkg_apex_fee_and_fine.get_receipt_link(tm8_application.FEES_FK) AS print_link ',
'FROM',
'    tm8_application',
'    INNER JOIN person ON person.key_value = tm8_application.person_fk',
'    LEFT JOIN FAF_FEES_AND_FINES ON FAF_FEES_AND_FINES.key_value = tm8_application.FEES_FK',
'    LEFT JOIN TERMINALS ON TERMINALS.ID = tm8_application.INS_TERMINAL',
'    LEFT JOIN BORDERPOSTS ON BORDERPOSTS.KEY_VALUE = TERMINALS.BORDER_POST,',
'    lov_statuses',
'WHERE',
'    (lov_statuses.RETURN_VALUE = tm8_application.APPROVAL_STATUS AND lov_statuses.owner$tag = ''APEX_REENTRY'' AND lov_statuses.tag$tag = ''REENTRY_TM8STATUS'') AND',
'    (PERSON.TA_ADM_CLASS_PROVINCE = :P15_CITY OR :P15_CITY IS NULL) AND',
'    (PERSON.TA_ADM_CLASS_DISTRICT = :P15_DISTRICT OR :P15_DISTRICT IS NULL) AND',
'    (PERSON.TA_ADM_CLASS_SUBDISTRICT = :P15_SUBDISTRICT OR :P15_SUBDISTRICT IS NULL) AND',
'    --TODO: ZONE',
'    (PERSON.FIRST_NAME = :P15_FIRST_NAME OR :P15_FIRST_NAME IS NULL) AND',
'    (PERSON.MIDDLE_NAME = :P15_MIDDLE_NAME OR :P15_MIDDLE_NAME IS NULL) AND',
'    (PERSON.LAST_NAME = :P15_LAST_NAME OR :P15_LAST_NAME IS NULL) AND',
'    (PERSON.NATIONALITY = :P15_NATIONALITY OR :P15_NATIONALITY IS NULL) AND',
'    (PERSON.DATE_OF_BIRTH = :P15_BIRTHDAY OR :P15_BIRTHDAY IS NULL) AND',
'    (PERSON.SEX = :P15_GENDER OR :P15_GENDER IS NULL) AND',
'    (TM8_APPLICATION.PASSPORTNO = :P15_PASSPORT_NO OR :P15_PASSPORT_NO IS NULL) AND',
'    --TODO: Extension stay',
'    --TODO: Fee Receipt',
'    (TM8_APPLICATION.TM6_NUMBER = :P15_TM6_NUMBER OR :P15_TM6_NUMBER IS NULL) AND',
'    (TM8_APPLICATION.TM8_TYPE = :P15_ENTRY_TYPE OR :P15_ENTRY_TYPE IS NULL) AND',
'    (TM8_APPLICATION.APPROVAL_STATUS = :P15_APPLICATION_STATUS OR :P15_APPLICATION_STATUS IS NULL) AND',
'    (:P15_APPLICATION_NO_FROM IS NULL OR (TM8_APPLICATION.APPLICATION_NUMBER BETWEEN :P15_APPLICATION_NO_FROM AND :P15_APPLICATION_NO_TO)) AND',
'    (:P15_APPLICATION_DATE_FROM IS NULL OR (TM8_APPLICATION.DOC_DATE BETWEEN :P15_APPLICATION_DATE_FROM AND :P15_APPLICATION_DATE_TO))',
'    --(TM8_APPLICATION.DOC_DATE BETWEEN :P15_APPLICATION_DATE_FROM AND :P15_APPLICATION_DATE_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(71522873289903859)
,p_max_row_count=>'500'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'DNOTZON'
,p_internal_uid=>15881285719841922
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71525616533903887)
,p_db_column_name=>'ROWNUM'
,p_display_order=>10
,p_column_identifier=>'AB'
,p_column_label=>'No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71523619926903867)
,p_db_column_name=>'DOC_DATE'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Application Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71524020398903871)
,p_db_column_name=>'ENDPERMIT_DATE'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Re-Entry Valid Until'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71524102084903872)
,p_db_column_name=>'PASSPORTNO'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>'Passport No.'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71524516690903876)
,p_db_column_name=>'TM8_TYPE'
,p_display_order=>50
,p_column_identifier=>'Q'
,p_column_label=>'Permit Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71524705142903878)
,p_db_column_name=>'APPROVAL_STATUS'
,p_display_order=>60
,p_column_identifier=>'S'
,p_column_label=>'Status'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71524906100903880)
,p_db_column_name=>'APPLICATION_NUMBER'
,p_display_order=>70
,p_column_identifier=>'U'
,p_column_label=>'Application No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71525193907903883)
,p_db_column_name=>'Name'
,p_display_order=>80
,p_column_identifier=>'X'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71525383994903884)
,p_db_column_name=>'SEX'
,p_display_order=>90
,p_column_identifier=>'Y'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(71525568262903886)
,p_db_column_name=>'Department'
,p_display_order=>110
,p_column_identifier=>'AA'
,p_column_label=>'Department'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74730725164622738)
,p_db_column_name=>'Edit'
,p_display_order=>120
,p_column_identifier=>'AC'
,p_column_label=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1:P1_APPLICATION_NO:#APPLICATION_NUMBER#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-file-edit"></span>'
,p_column_link_attr=>'class="t-Button" '
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'editButton'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74731322421622744)
,p_db_column_name=>'Delete'
,p_display_order=>130
,p_column_identifier=>'AD'
,p_column_label=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP:P16_APPLICATION_PK:#APPLICATION_NUMBER#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-trash-o"></span>'
,p_column_link_attr=>'class="t-Button t-Button--danger cancelbutton" tm8status="#APPROVAL_STATUS#"'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'deleteButton'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74731404222622745)
,p_db_column_name=>'Print'
,p_display_order=>140
,p_column_identifier=>'AE'
,p_column_label=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-print"></span>'
,p_column_link_attr=>'class="t-Button" '
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'printButton'
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91171787276386775)
,p_db_column_name=>'Receipt No.'
,p_display_order=>150
,p_column_identifier=>'AF'
,p_column_label=>'Receipt no.'
,p_column_link=>'javascript: apex.navigation.popup({url: "#PRINT_LINK#",name: ''Print receipt'' })'
,p_column_linktext=>'#Receipt No.#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99807398789740506)
,p_db_column_name=>'FEES_FK'
,p_display_order=>160
,p_column_identifier=>'AG'
,p_column_label=>'Fees fk'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99807463781740507)
,p_db_column_name=>'PRINT_LINK'
,p_display_order=>170
,p_column_identifier=>'AH'
,p_column_label=>'Print link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(74697795761549613)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'190563'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ROWNUM:APPLICATION_NUMBER:DOC_DATE:Name:SEX:PASSPORTNO:TM8_TYPE:ENDPERMIT_DATE:APPROVAL_STATUS:Department:Receipt No.:Edit:Delete::FEES_FK:PRINT_LINK'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74731098445622742)
,p_plug_name=>'Search Button'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(84387649954673553)
,p_plug_name=>'Search Form'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84412671094725276)
,p_plug_name=>'PERSONAL_DETAILS'
,p_region_name=>'passportRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<span id="scannedPassportInfosButton" aria-hidden="true" class="fa fa-question-circle" style="cursor: pointer; display: none; color: grey; position:absolute; top: 17px; right: 8px;></span>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84419929069728230)
,p_plug_name=>'PASSPORT_DETAILS'
,p_region_name=>'passportRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74731062020622741)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(74731098445622742)
,p_button_name=>'Search'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71761555200297242)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search for Applications'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-database-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>6
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71521717162903848)
,p_name=>'P15_ZONE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(84387649954673553)
,p_prompt=>'Zone'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71521921181903850)
,p_name=>'P15_EXTENSION_STAY_APPLICATION_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84419929069728230)
,p_prompt=>'Extension stay application number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71522035710903851)
,p_name=>'P15_FEE_RECEIPT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84419929069728230)
,p_prompt=>'Fee receipt'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71522172857903852)
,p_name=>'P15_APPLICATION_STATUS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84419929069728230)
,p_prompt=>'Application status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_APPLICATION_STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM lov_statuses ',
' WHERE owner$tag = ''APEX_REENTRY''',
'   AND tag$tag = ''REENTRY_TM8STATUS'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71522308779903854)
,p_name=>'P15_APPLICATION_NO_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71522236712903853)
,p_prompt=>'Application No. - From:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71522422692903855)
,p_name=>'P15_APPLICATION_NO_TO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(71522236712903853)
,p_prompt=>'Application No. - To:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71522556415903856)
,p_name=>'P15_APPLICATION_DATE_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71522236712903853)
,p_prompt=>'Application Date - From:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71522667279903857)
,p_name=>'P15_APPLICATION_DATE_TO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(71522236712903853)
,p_prompt=>'Application Date - To:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74626149366418356)
,p_name=>'P15_CITY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(84387649954673553)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_province'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74626516786418357)
,p_name=>'P15_DISTRICT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(84387649954673553)
,p_prompt=>'District:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_district WHERE adm_class_province = :P15_CITY'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P15_CITY'
,p_ajax_items_to_submit=>'P15_CITY'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74626970059418358)
,p_name=>'P15_SUBDISTRICT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(84387649954673553)
,p_prompt=>'Subdistrict:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_subdistrict WHERE adm_class_district = :P15_DISTRICT'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P15_DISTRICT'
,p_ajax_items_to_submit=>'P15_DISTRICT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74652599543470073)
,p_name=>'P15_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(84412671094725276)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74653036390470074)
,p_name=>'P15_FIRST_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84412671094725276)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74653440257470075)
,p_name=>'P15_MIDDLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(84412671094725276)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74653833053470076)
,p_name=>'P15_NATIONALITY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84412671094725276)
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
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74654228217470078)
,p_name=>'P15_BIRTHDAY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84412671094725276)
,p_prompt=>'Birthday:'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74655442088470082)
,p_name=>'P15_GENDER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(84412671094725276)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_GENDERS_VC'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, KEY_VALUE r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74657725053473004)
,p_name=>'P15_PASSPORT_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(84419929069728230)
,p_prompt=>'Passport Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74662481967474573)
,p_name=>'P15_TM6_NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(84419929069728230)
,p_prompt=>'TM6 Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74663152115478251)
,p_name=>'P15_ENTRY_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(84419929069728230)
,p_prompt=>'Entry Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Single;S,Multiple;M'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74733064609622761)
,p_name=>'Refresh Search Results'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "16"'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74733127632622762)
,p_event_id=>wwv_flow_api.id(74733064609622761)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(71522747945903858)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66473986961557980)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Item Defaults'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.set_session_state(',
'p_name => ''P15_APPLICATION_STATUS''',
', p_value => ''A'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_is_stateful_y_n=>'Y'
);
end;
/