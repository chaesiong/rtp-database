prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(58823889429541094)
,p_name=>'Search'
,p_page_mode=>'NORMAL'
,p_step_title=>'Search'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(68641801004327483)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180614105003'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(58236141481887477)
,p_name=>'Results'
,p_template=>wwv_flow_api.id(68676409649327574)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN dl_bordercontrol.pkg_apex_fee_and_fine.search(p_docno                => :P20_PASSPORT_NO',
'                                                      ,p_tm6no                => :P20_TM6NO',
'                                                      ,p_last_name            => :P20_FAMILY_NAME',
'                                                      ,p_first_name           => :P20_FIRST_NAME',
'                                                      ,p_middle_name          => :P20_MIDDLE_NAME',
'                                                      ,p_sex                  => :P20_SEX',
'                                                      ,p_date_of_birth        => TO_DATE(:P20_DATE_OF_BIRTH, :AI_DEFAULT_DATE_FORMAT)',
'                                                      ,p_nationality          => :P20_NATIONALITY',
'                                                      ,p_borderpost           => :P20_BORDERPOST',
'                                                      ,p_terminal             => :P20_TERMINAL',
'                                                      ,p_reference_number     => :P20_REFERENCE_NUMBER',
'                                                      ,p_receipt_number_from  => :P20_RECEIPT_NUMBER_FROM',
'                                                      ,p_receipt_number_to    => :P20_RECEIPT_NUMBER_TO',
'                                                      ,p_fee                  => :P20_FEE',
'                                                      ,p_fine                 => :P20_FINE',
'                                                      ,p_issuing_date_from    => TO_DATE(:P20_ISSUING_DATE_FROM, :AI_DEFAULT_DATE_FORMAT)',
'                                                      ,p_issuing_date_to      => NULL--TO_DATE(:P20_ISSUING_DATE_TO, :AI_DEFAULT_DATE_FORMAT)',
'                                                      ,p_status               => :P20_STATUS',
'                                                      ,p_receipt_type         => :P20_RECEIPT_TYPE ',
'                                                      ,p_fee_or_fine          => :P20_FEE_OR_FINE);  ',
'                                                      '))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P20_PASSPORT_NO          IS NOT NULL OR',
':P20_TM6NO                IS NOT NULL OR',
':P20_FAMILY_NAME          IS NOT NULL OR',
':P20_FIRST_NAME           IS NOT NULL OR',
':P20_MIDDLE_NAME          IS NOT NULL OR',
':P20_SEX                  IS NOT NULL OR',
':P20_DATE_OF_BIRTH        IS NOT NULL OR',
':P20_NATIONALITY          IS NOT NULL OR',
':P20_BORDERPOST           IS NOT NULL OR',
':P20_TERMINAL             IS NOT NULL OR',
':P20_REFERENCE_NUMBER     IS NOT NULL OR',
':P20_RECEIPT_NUMBER_FROM  IS NOT NULL OR',
':P20_RECEIPT_NUMBER_TO    IS NOT NULL OR',
':P20_FEE                  IS NOT NULL OR',
':P20_FINE                 IS NOT NULL OR',
':P20_ISSUING_DATE_FROM    IS NOT NULL OR',
':P20_ISSUING_DATE_TO      IS NOT NULL OR',
':P20_STATUS               IS NOT NULL OR',
':P20_RECEIPT_TYPE         IS NOT NULL'))
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(69341950392012860)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align: center; margin-top: 50px;">',
'  <span style="color: lightgrey;" aria-hidden="true" class="fa fa-search fa-5x"></span><br>',
'<h3>No data found...</h3>',
'</div>'))
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58264522219009972)
,p_query_column_id=>1
,p_column_alias=>'RWNUM'
,p_column_display_sequence=>2
,p_column_heading=>'No.'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58264601102009973)
,p_query_column_id=>2
,p_column_alias=>'RECEIPT_NUMBER'
,p_column_display_sequence=>3
,p_column_heading=>'Book receipt number / Receipt number'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58265831609009985)
,p_query_column_id=>3
,p_column_alias=>'PAYMENT_RATE'
,p_column_display_sequence=>4
,p_column_heading=>'Fee rate type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(71074422475450206)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58264778944009975)
,p_query_column_id=>4
,p_column_alias=>'DOCNO'
,p_column_display_sequence=>5
,p_column_heading=>'Passport number'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58264912221009976)
,p_query_column_id=>5
,p_column_alias=>'NAME'
,p_column_display_sequence=>6
,p_column_heading=>'First name - Family name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58264978834009977)
,p_query_column_id=>6
,p_column_alias=>'SEX'
,p_column_display_sequence=>7
,p_column_heading=>'Sex'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(63503439999278622)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58265077112009978)
,p_query_column_id=>7
,p_column_alias=>'DATE_OF_BIRTH'
,p_column_display_sequence=>8
,p_column_heading=>'Date of birth'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58265217801009979)
,p_query_column_id=>8
,p_column_alias=>'NATIONALITY'
,p_column_display_sequence=>9
,p_column_heading=>'Nationality'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(60857686844055484)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58265239829009980)
,p_query_column_id=>9
,p_column_alias=>'ISSUING_DATE'
,p_column_display_sequence=>10
,p_column_heading=>'Issuing date'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58265390044009981)
,p_query_column_id=>10
,p_column_alias=>'TOTAL_COSTS'
,p_column_display_sequence=>11
,p_column_heading=>'Fee rate (Baht)'
,p_use_as_row_header=>'N'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58265474805009982)
,p_query_column_id=>11
,p_column_alias=>'STATUS'
,p_column_display_sequence=>12
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(70013591496384098)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58266176360009989)
,p_query_column_id=>12
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>15
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58422093151471775)
,p_query_column_id=>13
,p_column_alias=>'CANCEL_ATTRIBUTE'
,p_column_display_sequence=>16
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58422213771471776)
,p_query_column_id=>14
,p_column_alias=>'PRINT_ATTRIBUTE'
,p_column_display_sequence=>17
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58422452478471779)
,p_query_column_id=>15
,p_column_alias=>'REPORT_ROW_COLOR'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68223178400006796)
,p_query_column_id=>16
,p_column_alias=>'PRINT_LINK'
,p_column_display_sequence=>19
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58265570760009983)
,p_query_column_id=>17
,p_column_alias=>'DERIVED$01'
,p_column_display_sequence=>14
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10:P10_KEY_VALUE,P10_CANCEL,P10_FEE_OR_FINE:#KEY_VALUE#,Y,&P20_FEE_OR_FINE.'
,p_column_linktext=>'Cancel <i class="fa fa-ban"></i>'
,p_column_link_attr=>'class="c-cancel-button t-Button t-Button--warning #CANCEL_ATTRIBUTE#"'
,p_column_alignment=>'CENTER'
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58265652057009984)
,p_query_column_id=>18
,p_column_alias=>'DERIVED$02'
,p_column_display_sequence=>13
,p_column_heading=>'Print'
,p_column_link=>'javascript: apex.navigation.popup({url: "#PRINT_LINK#",name: ''Print receipt'' })'
,p_column_linktext=>'<i class="fa fa-print"></i>'
,p_column_link_attr=>'class="t-Button #PRINT_ATTRIBUTE#" '
,p_column_alignment=>'CENTER'
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58421617911471770)
,p_query_column_id=>19
,p_column_alias=>'DERIVED$03'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10:P10_KEY_VALUE:#KEY_VALUE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-page.png" class="apex-edit-page" class="c-edit-link" alt="">'
,p_column_alignment=>'CENTER'
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58422969152471784)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(68685618193327593)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_menu_id=>wwv_flow_api.id(58825154997541203)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(68722709645327716)
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68221234170006776)
,p_plug_name=>'Search'
,p_region_name=>'searchRegion'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(68665272769327553)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58233615788887451)
,p_plug_name=>'Personal Information'
,p_parent_plug_id=>wwv_flow_api.id(68221234170006776)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58234738891887462)
,p_plug_name=>'Borderpost / Terminal Information'
,p_parent_plug_id=>wwv_flow_api.id(68221234170006776)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
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
 p_id=>wwv_flow_api.id(58235613197887471)
,p_plug_name=>'Fee Information'
,p_parent_plug_id=>wwv_flow_api.id(68221234170006776)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58236008581887475)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(58233615788887451)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58236098936887476)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(58233615788887451)
,p_button_name=>'RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58233723713887452)
,p_name=>'P20_PASSPORT_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58233765457887453)
,p_name=>'P20_SEX'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_prompt=>'Sex:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.human_sexes$lc',
' WHERE num_value IS NOT NULL',
' ORDER BY display_order;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58233866549887454)
,p_name=>'P20_TM6NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_prompt=>'TM6 No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58234007482887455)
,p_name=>'P20_DATE_OF_BIRTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_prompt=>'Date of birth:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58234091547887456)
,p_name=>'P20_FAMILY_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_prompt=>'FAMILY NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58234187408887457)
,p_name=>'P20_NATIONALITY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ICAO_DOC_CODES'
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
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58234322058887458)
,p_name=>'P20_FIRST_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_prompt=>'FIRST NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58234473826887460)
,p_name=>'P20_MIDDLE_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_prompt=>'MIDDLE NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58234574404887461)
,p_name=>'P20_BORDERPOST'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(58234738891887462)
,p_prompt=>'Borderpost:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_BORDERPOSTS_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58234838974887463)
,p_name=>'P20_TERMINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(58234738891887462)
,p_prompt=>'Terminal:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value, return_value',
'  FROM dl_bordercontrol.lov_terminals',
' WHERE :P20_BORDERPOST IS NULL',
'    OR border_post = :P20_BORDERPOST'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P20_BORDERPOST'
,p_ajax_items_to_submit=>'P20_BORDERPOST'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58234933898887464)
,p_name=>'P20_FEE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'Fee:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PAYMENT_RATES_FEE'
,p_lov=>'select display_value, return_value FROM lov_payment_rate WHERE payment_type != ''F'''
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>7
,p_display_when=>':P20_FEE_OR_FINE = ''FEE'''
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235009815887465)
,p_name=>'P20_RECEIPT_NUMBER_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'Receipt number from:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235090807887466)
,p_name=>'P20_ISSUING_DATE_TO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'to:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235212069887467)
,p_name=>'P20_REFERENCE_NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'Reference document:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>255
,p_cMaxlength=>20
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235298978887468)
,p_name=>'P20_RECEIPT_NUMBER_TO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'to:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235439013887469)
,p_name=>'P20_ISSUING_DATE_FROM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'Issuing date from:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235498442887470)
,p_name=>'P20_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'Status:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FAF_STATUS'
,p_lov=>'.'||wwv_flow_api.id(58347795149860780)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235644652887472)
,p_name=>'P20_RECEIPT_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'Receipt Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FAF_GENERATIONS_STATUS'
,p_lov=>'.'||wwv_flow_api.id(58348792737862871)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235778473887473)
,p_name=>'P20_FEE_OR_FINE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(58233615788887451)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58235923352887474)
,p_name=>'P20_FINE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(58235613197887471)
,p_prompt=>'Fine:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PAYMENT_RATES_FINE'
,p_lov=>'select display_value, return_value FROM lov_payment_rate WHERE payment_type = ''F'''
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>7
,p_display_when=>':P20_FEE_OR_FINE = ''FINE'''
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(58421773358471772)
,p_name=>'CLOSE DIALOG: CANCEL'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(58236141481887477)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68223515790006799)
,p_event_id=>wwv_flow_api.id(58421773358471772)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.data.P10_CANCEL == ''Y'') {',
'    apex.message.showPageSuccess("The entry was successfully cancelled!");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68223549567006800)
,p_event_id=>wwv_flow_api.id(58421773358471772)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(58236141481887477)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(58422732594471781)
,p_name=>'CLOSE DIALOG: EDIT'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.c-edit-link'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(58422823948471782)
,p_event_id=>wwv_flow_api.id(58422732594471781)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(58236141481887477)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(68221466938006779)
,p_name=>'ON PAGELOAD: COLLAPSE REGION'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P20_PASSPORT_NO          IS NOT NULL OR',
':P20_TM6NO                IS NOT NULL OR',
':P20_FAMILY_NAME          IS NOT NULL OR',
':P20_FIRST_NAME           IS NOT NULL OR',
':P20_MIDDLE_NAME          IS NOT NULL OR',
':P20_SEX                  IS NOT NULL OR',
':P20_DATE_OF_BIRTH        IS NOT NULL OR',
':P20_NATIONALITY          IS NOT NULL OR',
':P20_BORDERPOST           IS NOT NULL OR',
':P20_TERMINAL             IS NOT NULL OR',
':P20_REFERENCE_NUMBER     IS NOT NULL OR',
':P20_RECEIPT_NUMBER_FROM  IS NOT NULL OR',
':P20_RECEIPT_NUMBER_TO    IS NOT NULL OR',
':P20_FEE                  IS NOT NULL OR',
':P20_FINE                 IS NOT NULL OR',
':P20_ISSUING_DATE_FROM    IS NOT NULL OR',
':P20_ISSUING_DATE_TO      IS NOT NULL OR',
':P20_STATUS               IS NOT NULL OR',
':P20_RECEIPT_TYPE         IS NOT NULL'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68221567352006780)
,p_event_id=>wwv_flow_api.id(68221466938006779)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#searchRegion button.t-Button--hideShow[aria-expanded="true"]'').click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58266025856009987)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'RESET: ITEMS'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P20_RECEIPT_TYPE,P20_PASSPORT_NO,P20_TM6NO,P20_FAMILY_NAME,P20_FIRST_NAME,P20_MIDDLE_NAME,P20_SEX,P20_DATE_OF_BIRTH,P20_NATIONALITY,P20_BORDERPOST,P20_TERMINAL,P20_REFERENCE_NUMBER,P20_RECEIPT_NUMBER_FROM,P20_RECEIPT_NUMBER_TO,P20_FEE,P20_FINE,P20_IS'
||'SUING_DATE_FROM,P20_ISSUING_DATE_TO,P20_STATUS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(58236098936887476)
);
end;
/
