prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(71772255799297339)
,p_name=>'Blacklist Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Blacklist Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Decrease the padding - that way more will fit on the page*/',
'.t-Form-inputContainer, .t-Form-inputContainer.col, .t-Form-labelContainer, .t-Form-labelContainer.col',
'{',
'    padding: .4rem;',
'}',
'',
'/*Show a Hand Cursor for the Row Hover*/',
'tr{',
'    cursor: pointer;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'900'
,p_dialog_width=>'1200'
,p_dialog_attributes=>'resizable:true'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DNOTZON'
,p_last_upd_yyyymmddhh24miss=>'20180517144730'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67919528476258274)
,p_plug_name=>'Blacklist Details'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(67996839796883650)
,p_name=>'Search Results'
,p_region_name=>'blacklistSearchResults'
,p_template=>wwv_flow_api.id(71735574935297143)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    rownum,',
'    jt.*',
'from APEX_collections,',
'     JSON_TABLE(APEX_collections.clob001, ''$.demographics.candidates[*]''',
'         COLUMNS ("Record ID"    VARCHAR2(512 CHAR) PATH ''$.blacklistId'',',
'                  firstname    VARCHAR2(512 CHAR) PATH ''$.demographics.details.firstname'',',
'                  givenname    VARCHAR2(512 CHAR) PATH ''$.demographics.details.middlename'',',
'                  lastname    VARCHAR2(512 CHAR) PATH ''$.demographics.details.lastname'',',
'                  firstnameThai    VARCHAR2(512 CHAR) PATH ''$.demographics.firstnameThai'',',
'                  givennameThai    VARCHAR2(512 CHAR) PATH ''$.demographics.details.middlenameThai'',',
'                  lastnameThai    VARCHAR2(512 CHAR) PATH ''$.demographics.details.lastnameThai'',',
'                  gender     VARCHAR2(512 CHAR) PATH ''$.demographics.details.gender'',',
'                  dateofbirth     VARCHAR2(512 CHAR) PATH ''$.demographics.details.dateOfBirth'')) jt',
'WHERE collection_name = ''BLACKLIST_HITS'';'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(71748540619297181)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429081696753151)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>1
,p_column_heading=>'Rownum'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429144677753152)
,p_query_column_id=>2
,p_column_alias=>'Record ID'
,p_column_display_sequence=>2
,p_column_heading=>'Record id'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429204206753153)
,p_query_column_id=>3
,p_column_alias=>'FIRSTNAME'
,p_column_display_sequence=>3
,p_column_heading=>'Firstname'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429357664753154)
,p_query_column_id=>4
,p_column_alias=>'GIVENNAME'
,p_column_display_sequence=>4
,p_column_heading=>'Givenname'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429412373753155)
,p_query_column_id=>5
,p_column_alias=>'LASTNAME'
,p_column_display_sequence=>5
,p_column_heading=>'Lastname'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429533662753156)
,p_query_column_id=>6
,p_column_alias=>'FIRSTNAMETHAI'
,p_column_display_sequence=>6
,p_column_heading=>'Firstnamethai'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429685339753157)
,p_query_column_id=>7
,p_column_alias=>'GIVENNAMETHAI'
,p_column_display_sequence=>7
,p_column_heading=>'Givennamethai'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429731242753158)
,p_query_column_id=>8
,p_column_alias=>'LASTNAMETHAI'
,p_column_display_sequence=>8
,p_column_heading=>'Lastnamethai'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429791416753159)
,p_query_column_id=>9
,p_column_alias=>'GENDER'
,p_column_display_sequence=>9
,p_column_heading=>'Gender'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(78429896003753160)
,p_query_column_id=>10
,p_column_alias=>'DATEOFBIRTH'
,p_column_display_sequence=>10
,p_column_heading=>'Dateofbirth'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(74733595227622767)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71735574935297143)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74733731997622768)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(74733595227622767)
,p_button_name=>'Proceed'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71761555200297242)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Proceed'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_grid_column_attributes=>'style="margin-left: 40%"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74733845966622769)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(74733595227622767)
,p_button_name=>'Deny'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71761555200297242)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Deny'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-ban'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67919687359258275)
,p_name=>'P10_RECORD_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Record No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67919690601258276)
,p_name=>'P10_LAST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67919817074258277)
,p_name=>'P10_FIRST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67919933645258278)
,p_name=>'P10_MIDDLE_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67920040738258279)
,p_name=>'P10_LAST_NAME_THAI'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Last Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67920176683258280)
,p_name=>'P10_FIRST_NAME_THAI'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'First Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67920231536258281)
,p_name=>'P10_MIDDLE_NAME_THAI'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Middle Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67920354743258282)
,p_name=>'P10_GENDER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>'STATIC:Display1;Return1,Display2;Return2'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67920562461258284)
,p_name=>'P10_BIRTHDAY'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67920602143258285)
,p_name=>'P10_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67920732270258286)
,p_name=>'P10_AUTHORITY'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Authority:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67920788076258287)
,p_name=>'P10_BEHAVIOUR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Behaviour:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67995655414883638)
,p_name=>'P10_CASE_NO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Case No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67995765796883639)
,p_name=>'P10_LEVEL_OF_CONFIDENTIALLY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Level of Confidentially:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67995869425883640)
,p_name=>'P10_NEXT_STEPS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Next steps:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67995965608883641)
,p_name=>'P10_REASON'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Reason:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67996042089883642)
,p_name=>'P10_CONTACT_REQUIRED'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Contact Required:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67996156933883643)
,p_name=>'P10_PHONE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Phone:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67996234069883644)
,p_name=>'P10_ENTRY_DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Entry Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67996329987883645)
,p_name=>'P10_ARRIVAL_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Arrival Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67996466306883646)
,p_name=>'P10_PASSPORT_NO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67996545983883647)
,p_name=>'P10_TM6_NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(67919528476258274)
,p_prompt=>'TM6 Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71760942043297231)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(78430126056753162)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74733731997622768)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(78430254754753163)
,p_event_id=>wwv_flow_api.id(78430126056753162)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(78430296767753164)
,p_name=>'Cancel Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74733845966622769)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(78430428022753165)
,p_event_id=>wwv_flow_api.id(78430296767753164)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(62340235982561397)
,p_name=>'Show Details on rowclick'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'tbody .reportRow'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#blacklistSearchResults'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(62340393614561398)
,p_event_id=>wwv_flow_api.id(62340235982561397)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var cols = $(this.triggeringElement).children();',
'var blacklistID = $(cols[1]).text();',
'',
'apex.server.process("GET_DETAILS_FOR_BLACKLISTID", ',
'{',
'    x01: blacklistID',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        var details = JSON.parse(pData.details);',
'        var suspect = details[0];',
'        ',
'        apex.item( "P10_RECORD_NO" ).setValue(blacklistID);',
'        apex.item( "P10_LAST_NAME" ).setValue(suspect.lastname);',
'        apex.item( "P10_FIRST_NAME" ).setValue(suspect.firstname);',
'        apex.item( "P10_MIDDLE_NAME" ).setValue(suspect.middlename);',
'        apex.item( "P10_GENDER" ).setValue(suspect.gender);',
'        apex.item( "P10_NATIONALITY" ).setValue(suspect.nationality);',
'        apex.item( "P10_BEHAVIOUR" ).setValue(suspect.behaviour);',
'        apex.item( "P10_LEVEL_OF_CONFIDENTIALLY" ).setValue(suspect.levelOfConfidentially);',
'        apex.item( "P10_NEXT_STEPS" ).setValue(suspect.nextStep);',
'        apex.item( "P10_PHONE" ).setValue(suspect.phone);',
'        apex.item( "P10_LAST_NAME_THAI" ).setValue(suspect.lastnameThai);',
'        apex.item( "P10_FIRST_NAME_THAI" ).setValue(suspect.firstnameThai);',
'        apex.item( "P10_MIDDLE_NAME_THAI" ).setValue(suspect.middlenameThai);',
'        apex.item( "P10_BIRTHDAY" ).setValue(suspect.dateOfBirth);',
'        apex.item( "P10_AUTHORITY" ).setValue(suspect.authority);',
'        apex.item( "P10_CONTACT_REQUIRED" ).setValue(suspect.contactRequired);',
'        apex.item( "P10_REASON" ).setValue(suspect.reason);',
'        apex.item( "P10_CASE_NO" ).setValue(suspect.caseNumber);',
'',
'        apex.item( "P10_ENTRY_DATE" ).setValue(suspect.entryDate);',
'        apex.item( "P10_PASSPORT_NO" ).setValue(suspect.passportNo);',
'        apex.item( "P10_ARRIVAL_DATE" ).setValue(suspect.arrivalDate);',
'        apex.item( "P10_TM6_NUMBER" ).setValue(suspect.tM6Number);',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78429999006753161)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_DETAILS_FOR_BLACKLISTID'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_details VARCHAR2(4000);',
'BEGIN',
'    SELECT ',
'        jt."Details" INTO l_details',
'    from APEX_collections,',
'         JSON_TABLE(APEX_collections.clob001, ''$.demographics.candidates[*]''',
'             COLUMNS (',
'             "Record ID"    VARCHAR2(512 CHAR) PATH ''$.blacklistId'',',
'             "Details"    VARCHAR2(4000 CHAR) FORMAT JSON WITH WRAPPER PATH ''$.demographics.details'')) jt',
'    WHERE collection_name = ''BLACKLIST_HITS'' AND "Record ID" = apex_application.g_x01;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''details'', l_details);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/