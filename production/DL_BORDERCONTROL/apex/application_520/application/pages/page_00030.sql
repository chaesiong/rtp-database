prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(58823889429541094)
,p_name=>'Choose Fee or Fine'
,p_page_mode=>'MODAL'
,p_step_title=>'Choose'
,p_step_sub_title=>'Choose Fee and Fine'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Dialog-body {',
'  padding: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'700'
,p_dialog_width=>'600'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180515171442'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52512860113833164)
,p_plug_name=>'Buttoncontainer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(68656254226327529)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(56617888126018575)
,p_name=>'Fees and Fines (Report)'
,p_template=>wwv_flow_api.id(68676409649327574)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rep_faf_payment_rate.*',
'  FROM rep_faf_payment_rate',
' WHERE CASE',
'         WHEN :P30_FEE_OR_FINE = ''FINE'' AND payment_type =  ''F'' THEN 1',
'         WHEN :P30_FEE_OR_FINE = ''FEE''  AND payment_type != ''F'' THEN 1 ',
'         ELSE 0',
'       END = 1',
'   AND CASE',
'         WHEN :P30_SEARCH_TEXT IS NOT NULL AND UPPER(display_value) LIKE ''%'' || UPPER(:P30_SEARCH_TEXT) || ''%'' THEN 1',
'         WHEN :P30_SEARCH_TEXT IS NULL THEN 1',
'         ELSE 0',
'       END = 1',
' ORDER BY display_order ASC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(68696884961327629)
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
 p_id=>wwv_flow_api.id(57672062871702157)
,p_query_column_id=>1
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(57672226560702158)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY_VALUE'
,p_column_display_sequence=>3
,p_column_heading=>'Payment rate'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<label for="#KEY_VALUE#:#COSTS_REGULAR#">#DISPLAY_VALUE#</label>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(57672339400702159)
,p_query_column_id=>3
,p_column_alias=>'DISPLAY_ORDER'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(57672384752702160)
,p_query_column_id=>4
,p_column_alias=>'DISPLAY_CODE'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(57672514740702161)
,p_query_column_id=>5
,p_column_alias=>'COSTS_REGULAR'
,p_column_display_sequence=>6
,p_column_heading=>'Costs'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(57672562537702162)
,p_query_column_id=>6
,p_column_alias=>'COSTS_LIMIT'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(57672715914702163)
,p_query_column_id=>7
,p_column_alias=>'PAYMENT_TYPE'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(57672792590702164)
,p_query_column_id=>8
,p_column_alias=>'OWNER'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(57672871445702165)
,p_query_column_id=>9
,p_column_alias=>'DISPLAY_VALUE_SHORT'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58422936932471783)
,p_query_column_id=>10
,p_column_alias=>'DERIVED$01'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-inputContainer" style="padding: 0px;">',
'    <fieldset class="checkbox_group">',
'        <input type="checkbox" value="#KEY_VALUE#:#COSTS_REGULAR#"  id="#KEY_VALUE#:#COSTS_REGULAR#" class="apex-item-checkbox" name="f01">',
'        <label for="#KEY_VALUE#:#COSTS_REGULAR#" style="padding-right: 0px;"></label>',
'    </fieldset>',
'</div>'))
,p_column_alignment=>'CENTER'
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68221815942006782)
,p_plug_name=>'Search button'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI:margin-top-none:margin-bottom-md'
,p_plug_template=>wwv_flow_api.id(68656254226327529)
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
 p_id=>wwv_flow_api.id(69408466870780656)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-md:margin-bottom-none:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_api.id(68676409649327574)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52513102335833166)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(52512860113833164)
,p_button_name=>'AGREE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agree'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52513495164833170)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(68221815942006782)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(52512981823833165)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(52512860113833164)
,p_button_name=>'DECLINE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_image_alt=>'Decline'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-times'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68221925431006783)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(68221815942006782)
,p_button_name=>'RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(68721954544327710)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>':P30_SEARCH_TEXT IS NOT NULL'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52513576301833171)
,p_name=>'P30_SEARCH_TEXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69408466870780656)
,p_prompt=>'Search text:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(68721305130327698)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57676419526702200)
,p_name=>'P30_FEE_OR_FINE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(56617888126018575)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56522560059245367)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AGREE: SET P30_RETURN_RESULT'
,p_process_sql_clob=>'dl_bordercontrol.pkg_apex_fee_and_fine.get_payment_rates();'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(52513102335833166)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(52513416241833169)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CLOSE DIALOG'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''AGREE'', ''DECLINE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68222001974006784)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'RESET'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P30_SEARCH_TEXT'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(68221925431006783)
);
end;
/
