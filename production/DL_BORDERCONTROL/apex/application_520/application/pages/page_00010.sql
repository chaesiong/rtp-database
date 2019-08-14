prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(58823889429541094)
,p_name=>'Save and Edit'
,p_page_mode=>'MODAL'
,p_step_title=>'Receipt'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form--stretchInputs .t-Form-fieldContainer select.selectlist.apex-page-item-error {',
'    border-color: #eb6562;',
'}',
''))
,p_page_css_classes=>'feeAndFineDialog'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_height=>'1100'
,p_dialog_width=>'1300'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180719131950'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50832338552475571)
,p_plug_name=>'Receipt Information'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50832354508475572)
,p_plug_name=>'Personal Data'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50832461739475573)
,p_plug_name=>'Travel Information'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50833132882475579)
,p_plug_name=>'Note'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56616907218018565)
,p_plug_name=>'FEES_BUTTONREGION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(68655285845327527)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_column=>12
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P10_CANCEL = ''N'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(57611464551628178)
,p_name=>'Payment rates'
,p_template=>wwv_flow_api.id(68676409649327574)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'t-Form--large'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_region_attributes=>'style="margin-bottom: 50px;"'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT tbl.*',
'      ,key_value AS key_value_unchanged',
'      ,payment_rate AS payment_rate_unchanged',
'      ,seq_id AS seq_id_unchanged',
'      ,costs AS costs_unchanged',
'      ,overstayed_days AS overstayed_days_unchanged',
'  FROM (SELECT col.faf_fees_and_fines_details AS key_value',
'              ,NVL(det.payment_rate, col.key_value) AS payment_rate',
'              ,col.seq_id',
'              ,NVL(col.costs, det.costs) AS costs',
'              ,col.overstayed_days',
'          FROM dl_bordercontrol.col_faf_payment_rate col ',
'          LEFT JOIN dl_bordercontrol.faf_fees_and_fines_details det ON det.key_value = col.faf_fees_and_fines_details) tbl',
'',
'UNION ALL',
'SELECT NULL AS key_value',
'      ,''-'' AS payment_rate',
'      ,NULL AS seq_id',
'      ,NULL AS costs',
'      ,NULL AS overstayed_days',
'      ,NULL AS key_value_unchanged',
'      ,NULL AS payment_rate_unchanged',
'      ,NULL AS seq_id_unchanged',
'      ,NULL AS costs_unchanged',
'      ,NULL AS overstayed_days_unchanged',
'  FROM dual',
' WHERE NOT EXISTS (SELECT 1 FROM dl_bordercontrol.col_faf_payment_rate)'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(68696884961327629)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align: center; margin-top: 50px;">',
'  <span style="color: lightgrey;" aria-hidden="true" class="fa fa-archive fa-5x"></span><br>',
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
 p_id=>wwv_flow_api.id(69407942294780651)
,p_query_column_id=>1
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(69408045394780652)
,p_query_column_id=>2
,p_column_alias=>'PAYMENT_RATE'
,p_column_display_sequence=>4
,p_column_heading=>'Payment rate'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(71074422475450206)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(69408143394780653)
,p_query_column_id=>3
,p_column_alias=>'SEQ_ID'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-inputContainer" style="padding: 0px;">',
'    <fieldset class="checkbox_group">',
'        <input type="checkbox" value="#SEQ_ID#" id="delPaymentRates#SEQ_ID#" class="apex-item-checkbox" name="f01">',
'        <label for="delPaymentRates#SEQ_ID#" style="padding-right: 0px;"></label>',
'    </fieldset>',
'</div>'))
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM dl_bordercontrol.col_faf_payment_rate',
' WHERE :P10_CANCEL = ''N'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(69408289673780654)
,p_query_column_id=>4
,p_column_alias=>'COSTS'
,p_column_display_sequence=>7
,p_column_heading=>'Costs'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<input type="hidden" name="f02" id="f02-#SEQ_ID_UNCHANGED#" value="#SEQ_ID_UNCHANGED#">',
'<input type="hidden" name="f04" id="f03-#KEY_VALUE_UNCHANGED#" value="#KEY_VALUE_UNCHANGED#">',
'<input type="hidden" name="f03" id="f04-#PAYMENT_RATE_UNCHANGED#" value="#PAYMENT_RATE_UNCHANGED#">',
'',
'<div class="t-Form-fieldContainer--stretchInputs">',
'    <div class="t-Form-inputContainer" style="padding: 0px;">',
'        <div class="t-Form-itemWrapper">',
'            <input style="text-align: right;" type="number" maxlength="38" class="text_field apex-item-text" name="f05" value="#COSTS#">',
'        </div>',
'    </div>',
'</div>'))
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM col_faf_payment_rate',
' WHERE :P10_CANCEL = ''N'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(69408363348780655)
,p_query_column_id=>5
,p_column_alias=>'OVERSTAYED_DAYS'
,p_column_display_sequence=>5
,p_column_heading=>'Overstayed days'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-fieldContainer--stretchInputs">',
'    <div class="t-Form-inputContainer">',
'        <div class="t-Form-itemWrapper">',
'            <input style="text-align: right;" type="number" maxlength="38" class="text_field apex-item-text" name="f06" value="#OVERSTAYED_DAYS#">',
'        </div>',
'    </div>',
'</div>'))
,p_column_alignment=>'RIGHT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM dl_bordercontrol.col_faf_payment_rate',
' WHERE :P10_FEE_OR_FINE = ''FINE'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68222310900006787)
,p_query_column_id=>6
,p_column_alias=>'KEY_VALUE_UNCHANGED'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68222413467006788)
,p_query_column_id=>7
,p_column_alias=>'PAYMENT_RATE_UNCHANGED'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68222453099006789)
,p_query_column_id=>8
,p_column_alias=>'SEQ_ID_UNCHANGED'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68222623502006790)
,p_query_column_id=>9
,p_column_alias=>'COSTS_UNCHANGED'
,p_column_display_sequence=>8
,p_column_heading=>'Costs'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM dual',
' WHERE NOT EXISTS (SELECT 1 FROM dl_bordercontrol.col_faf_payment_rate)',
'   OR :P10_CANCEL = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68222693172006791)
,p_query_column_id=>10
,p_column_alias=>'OVERSTAYED_DAYS_UNCHANGED'
,p_column_display_sequence=>6
,p_column_heading=>'Overstayed days'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'NOT_EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM dl_bordercontrol.col_faf_payment_rate',
' WHERE :P10_FEE_OR_FINE = ''FINE'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(112241966669349172)
,p_query_column_id=>11
,p_column_alias=>'DERIVED$01'
,p_column_display_sequence=>2
,p_column_heading=>'&nbsp;'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM dual',
' WHERE NOT EXISTS (SELECT 1 FROM dl_bordercontrol.col_faf_payment_rate)',
'   OR :P10_CANCEL = ''Y'''))
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112241884620349171)
,p_plug_name=>'Lawsuit information'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P10_FEE_OR_FINE = ''FINE'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50834154625475590)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_api.id(50832338552475571)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_button_condition=>':P10_CANCEL = ''N'' AND :P10_KEY_VALUE IS NULL'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57673189828702168)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(50832338552475571)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_condition=>':P10_CANCEL = ''N'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58419760104471752)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(50832338552475571)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP,40:P40_KEY_VALUE,P40_FAMILY_NAME,P40_FIRST_NAME,P40_BOOKING_AUTO,P40_BOOKING_MANU:&P10_KEY_VALUE.,&P10_FAMILY_NAME.,&P10_FIRST_NAME.,&P10_RECEIPT_NO1_AUTO./&P10_RECEIPT_NO2_AUTO.,&P10_RECEIPT_NO1_MANUAL./&P10_RECEIPT_NO2_MANUAL.'
,p_button_condition=>':P10_CANCEL = ''Y'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52512715350833162)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(56616907218018565)
,p_button_name=>'OPEN_FEE3'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rates'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP:P30_FEE_OR_FINE:&P10_FEE_OR_FINE.'
,p_button_condition=>':P10_CANCEL = ''N'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(56616735548018563)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(56616907218018565)
,p_button_name=>'REMOVE_MARKED_PAYMENT_RATES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_image_alt=>'Remove'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-file-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(65267136156919955)
,p_branch_name=>'PRINT RECEIPT'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.:PRINT_RECEIPT:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(57673189828702168)
,p_branch_sequence=>10
,p_branch_condition_type=>'PLSQL_EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P10_CANCEL = ''N'' AND ',
':P10_PRINT_RECEIPT = ''Y'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(68223000119006794)
,p_branch_name=>'SEARCH REFERENCE'
,p_branch_action=>'f?p=&APP_ID.:10:&SESSION.:SEARCH:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(50834154625475590)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50833183601475580)
,p_name=>'P10_NOTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50833132882475579)
,p_prompt=>'Note:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>500
,p_cHeight=>5
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721499588327701)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50833337635475581)
,p_name=>'P10_RECEIPT_NO1_AUTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_prompt=>'Receipt No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_colspan=>2
,p_grid_label_column_span=>1
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50833358451475582)
,p_name=>'P10_RECEIPT_NO2_MANUAL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50833448601475583)
,p_name=>'P10_PRINT_RECEIPT'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_prompt=>'Print receipt:'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>1
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50833624427475584)
,p_name=>'P10_WORKING_SYSTEM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_prompt=>'Working system:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_WORKING_SYSTEMS_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value',
'  FROM lov_owners ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag   = ''LOV_WORKING_SYSTEM'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when=>':P10_CANCEL = ''Y'' OR :P10_KEY_VALUE IS NOT NULL'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50833756431475586)
,p_name=>'P10_RECEIPT_NO1_MANUAL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50833854389475587)
,p_name=>'P10_RECEIPT_NO2_AUTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_prompt=>'Receipt no2 auto'
,p_pre_element_text=>'<span class="t-Form-label" style="margin-right: 20px">/</span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_label_column_span=>0
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721305130327698)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50833978335475588)
,p_name=>'P10_CHOOSE_MANUAL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834045095475589)
,p_name=>'P10_NUMBER_REFERENCE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_prompt=>'Number Reference:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_read_only_when=>':P10_KEY_VALUE IS NOT NULL'
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834265414475591)
,p_name=>'P10_PASSPORT_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834418865475592)
,p_name=>'P10_TM6_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_prompt=>'TM6 No:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834513086475593)
,p_name=>'P10_FAMILY_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_prompt=>'FAMILY NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834591345475594)
,p_name=>'P10_FIRST_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_prompt=>'FIRST NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834654365475595)
,p_name=>'P10_MIDDLE_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_prompt=>'MIDDLE NAME:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834750261475596)
,p_name=>'P10_SEX'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
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
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834878599475597)
,p_name=>'P10_DATE_OF_BIRTH'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_LG.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50834975189475598)
,p_name=>'P10_NATIONALITY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT key_value || '' '' || NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' ORDER BY display_order ASC;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50835057417475599)
,p_name=>'P10_TRANSPORT_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_prompt=>'Transport Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TRANS_VEHICLES_PK'
,p_lov=>'SELECT display_value, return_value FROM lov_trans_vehicles'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50835201095475600)
,p_name=>'P10_TRANSPORT_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_prompt=>'Transport Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52511565579833151)
,p_name=>'P10_TRAVEL_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_prompt=>'Travel Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'&AI_DATE_RANGE_PAST_SM.:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52511699109833152)
,p_name=>'P10_VISA_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_VISA_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.VISA_TYPES$LC',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52511774683833153)
,p_name=>'P10_ACTUAL_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Actual Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56523190667245373)
,p_name=>'P10_FEE_OR_FINE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56524977432245391)
,p_name=>'P10_KEY_VALUE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56525126381245392)
,p_name=>'P10_INITIAL_LOAD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57675001308702186)
,p_name=>'P10_BORDERDOCUMENT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57675067010702187)
,p_name=>'P10_PERSON'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57675236415702188)
,p_name=>'P10_ENTRY_FORM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57675406633702190)
,p_name=>'P10_REFERENCE_ENTITY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57675584730702192)
,p_name=>'P10_SALUTATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50832354508475572)
,p_prompt=>'Salutation'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SALUTATIONS_PK'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_salutations'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P10_FEE_OR_FINE'
,p_display_when2=>'FINE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57676004351702196)
,p_name=>'P10_DEPARTURE_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_prompt=>'Departure Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_display_when=>'P10_FEE_OR_FINE'
,p_display_when2=>'FINE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57676061453702197)
,p_name=>'P10_VISA_EXPIRY_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_prompt=>'VISA Expiry Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_display_when=>'P10_FEE_OR_FINE'
,p_display_when2=>'FINE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57676142456702198)
,p_name=>'P10_PERMIT_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_prompt=>'Permit Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PERMIT_TYPE'
,p_lov=>'select display_value, return_value FROM lov_permit_type'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P10_FEE_OR_FINE'
,p_display_when2=>'FINE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57676244211702199)
,p_name=>'P10_PERMIT_DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(50832461739475573)
,p_prompt=>'Permit Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_display_when=>'P10_FEE_OR_FINE'
,p_display_when2=>'FINE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>':P10_CANCEL = ''Y'''
,p_read_only_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(68721374158327700)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58266082074009988)
,p_name=>'P10_CANCEL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58266992561009997)
,p_name=>'P10_THAI_LAST_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58267082249009998)
,p_name=>'P10_STATUS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_item_default=>'ACTIVE'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58267213728009999)
,p_name=>'P10_THAI_FIRST_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59435275318545766)
,p_name=>'P10_REFERENCE_ENTITY_LOADED'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59435403979545767)
,p_name=>'P10_RETURN_RECEIPT_NO1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59435520182545768)
,p_name=>'P10_RETURN_RECEIPT_NO2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65267443256919959)
,p_name=>'P10_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50832338552475571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112242119401349173)
,p_name=>'P10_LAWSUIT_NUMBER'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112241884620349171)
,p_prompt=>'Lawsuit number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(68721585959327701)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(58421697613471771)
,p_computation_sequence=>10
,p_computation_item=>'P10_CANCEL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>':P10_CANCEL IS NULL'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(58422278370471777)
,p_computation_sequence=>20
,p_computation_item=>'P10_RECEIPT_NO1_AUTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'dl_bordercontrol.pkg_apex_fee_and_fine.get_next_booking_number()'
,p_compute_when=>'P10_RECEIPT_NO1_AUTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(58422414752471778)
,p_computation_sequence=>30
,p_computation_item=>'P10_RECEIPT_NO2_AUTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'dl_bordercontrol.pkg_apex_fee_and_fine.get_next_receipt_number()'
,p_compute_when=>'P10_RECEIPT_NO2_AUTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(65267596670919960)
,p_computation_sequence=>40
,p_computation_item=>'P10_URL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>'RETURN pkg_apex_fee_and_fine.get_receipt_link(:P10_KEY_VALUE);'
,p_compute_when=>':REQUEST = ''PRINT_RECEIPT'''
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56522793406245369)
,p_name=>'DIALOG CLOSED: FEES'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(52512715350833162)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57673035746702166)
,p_event_id=>wwv_flow_api.id(56522793406245369)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(57611464551628178)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57673349837702170)
,p_name=>'READONLY: ITEMS'
,p_event_sequence=>20
,p_condition_element=>'P10_CHOOSE_MANUAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71061152280382151)
,p_event_id=>wwv_flow_api.id(57673349837702170)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P10_RECEIPT_NO1_AUTO,P10_RECEIPT_NO2_AUTO'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'this.affectedElements.each(function() {',
'   $(this).attr("readonly", "readonly").addClass("apex_disabled");',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(58421346369471768)
,p_name=>'DIALOG CLOSED: CANCEL'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(58419760104471752)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(58421485906471769)
,p_event_id=>wwv_flow_api.id(58421346369471768)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P10_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65267226566919956)
,p_name=>'PAGELOAD: PRINT RECEIPT'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':REQUEST = ''PRINT_RECEIPT'''
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65267284308919957)
,p_event_id=>wwv_flow_api.id(65267226566919956)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.popup({',
'    url: apex.item("P10_URL").getValue(),',
'    name: ''Print receipt''',
'})'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(71061680120382156)
,p_name=>'CLOSE DIALOG'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':REQUEST = ''PRINT_RECEIPT'''
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(71061764242382157)
,p_event_id=>wwv_flow_api.id(71061680120382156)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P10_RETURN_RECEIPT_NO1,P10_RETURN_RECEIPT_NO2,P10_CHOOSE_MANUAL,P10_KEY_VALUE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91689759749161384)
,p_name=>'MANDATORY: ITEMS'
,p_event_sequence=>70
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[aria-required=''true'']'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.value == ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91689900914161385)
,p_event_id=>wwv_flow_api.id(91689759749161384)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91689992189161386)
,p_event_id=>wwv_flow_api.id(91689759749161384)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108338930499909568)
,p_name=>'HIDE: CLOSE BUTTON'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P10_REFERENCE_ENTITY IS NOT NULL AND :P10_KEY_VALUE IS NULL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108338976236909569)
,p_event_id=>wwv_flow_api.id(108338930499909568)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'parent.$(''.ui-button.ui-widget.ui-state-default.ui-corner-all.ui-button-icon-only.ui-dialog-titlebar-close'').css(''display'', ''none'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57675477695702191)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEARCH: REFERENCE ENTITY'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'  l_tmp_value VARCHAR2(1000 CHAR);',
'  l_tmp_date  DATE;',
'',
'  l_choose_manual dl_bordercontrol.faf_fees_and_fines.generation_status%TYPE;',
'  l_print_flag    dl_bordercontrol.faf_fees_and_fines.print_flag%TYPE;',
'',
'BEGIN',
'',
'  dl_bordercontrol.pkg_apex_fee_and_fine.search_reference_data (p_owner              => :P10_WORKING_SYSTEM',
'                                                               ,p_reference_entity   => :P10_REFERENCE_ENTITY',
'                                                               ,p_reference_number   => :P10_NUMBER_REFERENCE',
'                                                               ,x_print_flag         => l_print_flag',
'                                                               ,x_borderdocument     => :P10_BORDERDOCUMENT',
'                                                               ,x_docno              => :P10_PASSPORT_NO',
'                                                               ,x_tm6no              => :P10_TM6_NO',
'                                                               ,x_entry_form         => :P10_ENTRY_FORM',
'                                                               ,x_person             => :P10_PERSON',
'                                                               ,x_first_name         => :P10_FIRST_NAME',
'                                                               ,x_last_name          => :P10_FAMILY_NAME',
'                                                               ,x_middle_name        => :P10_MIDDLE_NAME',
'                                                               ,x_thai_last_name     => :P10_THAI_LAST_NAME',
'                                                               ,x_thai_first_name    => :P10_THAI_FIRST_NAME ',
'                                                               ,x_sex                => :P10_SEX',
'                                                               ,x_date_of_birth      => :P10_DATE_OF_BIRTH',
'                                                               ,x_nationality        => :P10_NATIONALITY',
'                                                               ,x_trans_vehicles     => :P10_TRANSPORT_TYPE',
'                                                               ,x_trans_number       => :P10_TRANSPORT_NUMBER',
'                                                               ,x_arrival_date       => :P10_TRAVEL_DATE',
'                                                               ,x_visa_type          => :P10_VISA_TYPE',
'                                                               ,x_visa_expiry_date   => :P10_VISA_EXPIRY_DATE',
'                                                               ,x_departure_date     => :P10_DEPARTURE_DATE',
'                                                               ,x_status             => :P10_STATUS',
'                                                               ,x_status_note        => :P10_NOTE',
'                                                               ,x_permit             => :P10_PERMIT_TYPE',
'                                                               ,x_permit_date        => :P10_PERMIT_DATE',
'                                                               ,x_generation_status  => l_choose_manual',
'                                                               ,x_salutation         => :P10_SALUTATION);',
'',
'  :P10_REFERENCE_ENTITY_LOADED := ''Y'';',
'',
'  CASE l_choose_manual',
'    WHEN ''MANUAL'' THEN :P10_CHOOSE_MANUAL := 1;',
'    ELSE NULL;',
'  END CASE;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P10_KEY_VALUE IS NULL AND',
'((:REQUEST = ''SEARCH'' AND :P10_CANCEL = ''N'') OR',
'(:P10_REFERENCE_ENTITY IS NOT NULL AND :P10_REFERENCE_ENTITY_LOADED IS NULL))'))
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68222754519006792)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE: PAYMENT_RATE INFORMATION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'  /*',
'      f01: SEQ_ID delete',
'      f02: SEQ_ID save',
'      f03: KEY_VALUE',
'      f04: PAYMENT_RATE',
'      f05: COSTS',
'      f06: OVERSTAYED_DAYS',
'  */',
'    ',
'  FOR i IN 1 .. APEX_APPLICATION.G_F02.COUNT',
'  LOOP',
'    ',
'      dl_bordercontrol.pkg_apex_fee_and_fine.upd_col_payment_rate (',
'           p_apex_status            => ''U''',
'          ,p_seq_id                 => APEX_APPLICATION.G_F02(i)',
'          ,p_key_value              => APEX_APPLICATION.G_F03(i)',
'          ,p_fees_and_fines_details => APEX_APPLICATION.G_F04(i)',
'          ,p_costs                  => APEX_APPLICATION.G_F05(i)',
'          ,p_overstayed_days        => CASE WHEN :P10_FEE_OR_FINE = ''FEE'' THEN 0 ELSE APEX_APPLICATION.G_F06(i) END',
'      );',
'  END LOOP;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P10_CANCEL = ''N'' AND :REQUEST NOT IN (''REMOVE_MARKED_PAYMENT_RATES'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68222233248006786)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE: PAYMENT_RATE_INFORMATION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'  /*',
'      f01: SEQ_ID delete',
'  */',
'    ',
'  FOR i IN 1 .. APEX_APPLICATION.G_F01.COUNT',
'  LOOP',
'    ',
'      dl_bordercontrol.pkg_apex_fee_and_fine.upd_col_payment_rate (',
'           p_apex_status            => ''D''',
'          ,p_seq_id                 => APEX_APPLICATION.G_F01(i)',
'          ,p_key_value              => NULL',
'          ,p_fees_and_fines_details => NULL',
'          ,p_costs                  => NULL',
'          ,p_overstayed_days        => NULL',
'      );',
'  END LOOP;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(56616735548018563)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57675316446702189)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE: FEES AND FINES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'dl_bordercontrol.pkg_apex_fee_and_fine.save (p_key_value           => :P10_KEY_VALUE',
'                                            ,p_reference_entity    => :P10_REFERENCE_ENTITY',
'                                            ,p_reference_number    => :P10_NUMBER_REFERENCE',
'                                            ,p_booking_number      => :P10_RECEIPT_NO1_AUTO',
'                                            ,p_receipt_number      => :P10_RECEIPT_NO2_AUTO',
'                                            ,p_issuing_date        => SYSDATE',
'                                            ,p_print_flag          => :P10_PRINT_RECEIPT',
'                                            ,p_borderdocument      => :P10_BORDERDOCUMENT',
'                                            ,p_docno               => :P10_PASSPORT_NO',
'                                            ,p_tm6no               => :P10_TM6_NO',
'                                            ,p_entry_form          => :P10_ENTRY_FORM',
'                                            ,p_person              => :P10_PERSON',
'                                            ,p_first_name          => :P10_FIRST_NAME',
'                                            ,p_last_name           => :P10_FAMILY_NAME',
'                                            ,p_middle_name         => :P10_MIDDLE_NAME',
'                                            ,p_thai_last_name      => :P10_THAI_LAST_NAME',
'                                            ,p_thai_first_name     => :P10_THAI_FIRST_NAME',
'                                            ,p_sex                 => :P10_SEX',
'                                            ,p_date_of_birth       => :P10_DATE_OF_BIRTH',
'                                            ,p_nationality         => :P10_NATIONALITY',
'                                            ,p_trans_vehicles      => :P10_TRANSPORT_TYPE',
'                                            ,p_trans_number        => :P10_TRANSPORT_NUMBER',
'                                            ,p_arrival_date        => :P10_TRAVEL_DATE',
'                                            ,p_visa_type           => :P10_VISA_TYPE',
'                                            ,p_visa_expiry_date    => :P10_VISA_EXPIRY_DATE',
'                                            ,p_departure_date      => :P10_DEPARTURE_DATE',
'                                            ,p_status              => :P10_STATUS',
'                                            ,p_status_note         => :P10_NOTE',
'                                            ,p_owner               => :P10_WORKING_SYSTEM',
'                                            ,p_permit              => :P10_PERMIT_TYPE',
'                                            ,p_permit_date         => :P10_PERMIT_DATE',
'                                            ,p_generation_status   => ''AUTO''',
'                                            ,p_salutation          => :P10_SALUTATION',
'                                            ,p_fee_or_fine         => :P10_FEE_OR_FINE',
'                                            ,p_ins_terminal        => :AI_TERMINAL_ID',
'                                            ,p_borderpost          => :AI_BORDERPOST_ID',
'                                            ,p_charge_number       => :P10_LAWSUIT_NUMBER);',
'                                            ',
':P10_RETURN_RECEIPT_NO1 := :P10_RECEIPT_NO1_AUTO;',
':P10_RETURN_RECEIPT_NO2 := :P10_RECEIPT_NO2_AUTO;'))
,p_process_error_message=>'An error occurred while saving the entry. Please contact a system administrator.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(57673189828702168)
,p_process_when=>':P10_CANCEL = ''N'''
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'The entry was successfully saved.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71063349347382173)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CLOSE DIALOG'
,p_attribute_01=>'P10_RETURN_RECEIPT_NO1,P10_RETURN_RECEIPT_NO2,P10_CHOOSE_MANUAL,P10_KEY_VALUE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P10_CANCEL = ''N'' AND ',
':P10_PRINT_RECEIPT = ''N'' AND',
':REQUEST NOT IN (''SEARCH'', ''REMOVE_MARKED_PAYMENT_RATES'')'))
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56524845651245390)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE COLLECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'dl_bordercontrol.pkg_apex_fee_and_fine.init_collection();',
':P10_INITIAL_LOAD := ''N'';',
'',
'IF :P10_KEY_VALUE IS NOT NULL',
'THEN',
'    dl_bordercontrol.pkg_apex_fee_and_fine.fetch_col_payment_rate(:P10_KEY_VALUE);',
'END IF;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P10_INITIAL_LOAD IS NULL'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58419715991471751)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FETCH: DATA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'  l_fee_or_fine_rec pkg_apex_fee_and_fine.fee_or_fine_typ;',
'',
'  l_tmp_value VARCHAR2(1000 CHAR);',
'  l_tmp_date  DATE;',
'  --',
'  l_choose_manual dl_bordercontrol.faf_fees_and_fines.generation_status%TYPE;',
'  l_print_flag    dl_bordercontrol.faf_fees_and_fines.print_flag%TYPE;',
'  --',
'  l_booking_number dl_bordercontrol.faf_fees_and_fines.booking_number%TYPE;',
'  l_receipt_number dl_bordercontrol.faf_fees_and_fines.receipt_number%TYPE;',
'',
'BEGIN',
'',
'    l_fee_or_fine_rec := pkg_apex_fee_and_fine.get_fee_or_fine_by_pk(:P10_KEY_VALUE);',
'  ',
'    :P10_PRINT_RECEIPT      := l_fee_or_fine_rec.print_flag;',
'    :P10_BORDERDOCUMENT     := l_fee_or_fine_rec.borderdocument;',
'    :P10_PASSPORT_NO        := l_fee_or_fine_rec.docno;',
'    :P10_TM6_NO             := pkg_common.get_entry_form_no_by_pk(l_fee_or_fine_rec.entry_form);',
'    :P10_ENTRY_FORM         := l_fee_or_fine_rec.entry_form;',
'    :P10_PERSON             := l_fee_or_fine_rec.person;',
'    :P10_FIRST_NAME         := l_fee_or_fine_rec.first_name;',
'    :P10_FAMILY_NAME        := l_fee_or_fine_rec.last_name;',
'    :P10_MIDDLE_NAME        := l_fee_or_fine_rec.middle_name;',
'    :P10_THAI_LAST_NAME     := l_fee_or_fine_rec.thai_last_name;',
'    :P10_THAI_FIRST_NAME    := l_fee_or_fine_rec.thai_first_name;',
'    :P10_SEX                := l_fee_or_fine_rec.sex;',
'    :P10_DATE_OF_BIRTH      := l_fee_or_fine_rec.date_of_birth;',
'    :P10_NATIONALITY        := l_fee_or_fine_rec.nationality;',
'    :P10_TRANSPORT_TYPE     := l_fee_or_fine_rec.trans_vehicles;',
'    :P10_TRANSPORT_NUMBER   := l_fee_or_fine_rec.trans_number;',
'    :P10_TRAVEL_DATE        := l_fee_or_fine_rec.arrival_date;',
'    :P10_VISA_TYPE          := l_fee_or_fine_rec.visa_type;',
'    :P10_VISA_EXPIRY_DATE   := l_fee_or_fine_rec.visa_expiry_date;',
'    :P10_DEPARTURE_DATE     := l_fee_or_fine_rec.departure_date;',
'    :P10_STATUS             := l_fee_or_fine_rec.status;',
'    :P10_NOTE               := l_fee_or_fine_rec.status_note;',
'    :P10_PERMIT_TYPE        := l_fee_or_fine_rec.permit;',
'    :P10_PERMIT_DATE        := l_fee_or_fine_rec.permit_date;',
'    :P10_SALUTATION         := l_fee_or_fine_rec.salutation;',
'    :P10_WORKING_SYSTEM     := l_fee_or_fine_rec.owner;',
'    :P10_NUMBER_REFERENCE   := l_fee_or_fine_rec.reference_number;',
'    :P10_REFERENCE_ENTITY   := l_fee_or_fine_rec.reference_entity;',
'    :P10_FEE_OR_FINE        := l_fee_or_fine_rec.fee_or_fine;',
'    :P10_LAWSUIT_NUMBER     := l_fee_or_fine_rec.charge_number;',
'',
'  CASE l_fee_or_fine_rec.generation_status',
'    WHEN ''MANUAL'' THEN :P10_CHOOSE_MANUAL := 1;',
'    ELSE NULL;',
'  END CASE;',
'  ',
'  CASE l_fee_or_fine_rec.generation_status',
'    WHEN ''AUTO''',
'    THEN',
'        :P10_RECEIPT_NO1_AUTO := l_fee_or_fine_rec.booking_number;',
'        :P10_RECEIPT_NO2_AUTO := l_fee_or_fine_rec.receipt_number;',
'    ELSE',
'        NULL;',
'  END CASE;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P10_KEY_VALUE IS NOT NULL'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
