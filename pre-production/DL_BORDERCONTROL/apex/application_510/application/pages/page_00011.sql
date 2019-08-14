prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(45965479290928181)
,p_name=>'Blacklist Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Blacklist Details'
,p_step_sub_title=>'Blacklist Details'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#blacklist.js'
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
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180514144045'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68213064178005436)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65265694169918682)
,p_plug_name=>'Notification'
,p_parent_plug_id=>wwv_flow_api.id(68213064178005436)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea tak'
||'imata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et e'
||'a rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68212994225005435)
,p_plug_name=>'Buttonregion'
,p_parent_plug_id=>wwv_flow_api.id(68213064178005436)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_column=>10
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103135438845568727)
,p_plug_name=>'Approve'
,p_parent_plug_id=>wwv_flow_api.id(68213064178005436)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
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
 p_id=>wwv_flow_api.id(96321372094204234)
,p_plug_name=>'Blacklist Details'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(96398683414829610)
,p_name=>'Search Results'
,p_region_name=>'blacklistSearchResults'
,p_template=>wwv_flow_api.id(45928798426927985)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--xlarge'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rownum',
'      ,rec_id',
'      ,firstname',
'      ,middlename AS givenname',
'      ,lastname',
'      ,firstnamethai',
'      ,middlenamethai AS givennamethai',
'      ,lastnamethai',
'      ,gender',
'      ,dateofbirth',
' FROM col_blacklist_hits',
' '))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(45941764110928023)
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
 p_id=>wwv_flow_api.id(67962370611816233)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>1
,p_column_heading=>'Row'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(65265576433918681)
,p_query_column_id=>2
,p_column_alias=>'REC_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Record Id'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(67963198872816241)
,p_query_column_id=>3
,p_column_alias=>'FIRSTNAME'
,p_column_display_sequence=>3
,p_column_heading=>'First Name'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(67963529049816242)
,p_query_column_id=>4
,p_column_alias=>'GIVENNAME'
,p_column_display_sequence=>4
,p_column_heading=>'Middle Name'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(67963924724816243)
,p_query_column_id=>5
,p_column_alias=>'LASTNAME'
,p_column_display_sequence=>5
,p_column_heading=>'Last Name'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(67964361099816244)
,p_query_column_id=>6
,p_column_alias=>'FIRSTNAMETHAI'
,p_column_display_sequence=>6
,p_column_heading=>'First Name (Thai)'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(67964780632816245)
,p_query_column_id=>7
,p_column_alias=>'GIVENNAMETHAI'
,p_column_display_sequence=>7
,p_column_heading=>'Middle Name (Thai)'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(67965199315816246)
,p_query_column_id=>8
,p_column_alias=>'LASTNAMETHAI'
,p_column_display_sequence=>8
,p_column_heading=>'Last Name (Thai)'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(67965595320816252)
,p_query_column_id=>9
,p_column_alias=>'GENDER'
,p_column_display_sequence=>9
,p_column_heading=>'Gender'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(67965937550816253)
,p_query_column_id=>10
,p_column_alias=>'DATEOFBIRTH'
,p_column_display_sequence=>10
,p_column_heading=>'Date of Birth'
,p_use_as_row_header=>'N'
,p_column_css_class=>'reportRow'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(67966672091816261)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(68212994225005435)
,p_button_name=>'PROCEED'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--iconRight:t-Button--pillStart'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_image_alt=>'Proceed'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(67967024870816267)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(68212994225005435)
,p_button_name=>'DENY'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--danger:t-Button--iconLeft:t-Button--pillEnd'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_image_alt=>'Deny'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68213132927005437)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(68212994225005435)
,p_button_name=>'PRINT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Print'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65265811783918683)
,p_name=>'P11_NOTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103135438845568727)
,p_prompt=>'Reason / Note:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large:margin-left-sm:margin-right-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67953315955816182)
,p_name=>'P11_RECORD_NO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Record No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(45954381728928073)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67953801780816193)
,p_name=>'P11_LAST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67954153203816195)
,p_name=>'P11_FIRST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67954527386816196)
,p_name=>'P11_MIDDLE_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67954992450816198)
,p_name=>'P11_GENDER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>'STATIC:Display1;Return1,Display2;Return2'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67955307695816201)
,p_name=>'P11_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67955706830816202)
,p_name=>'P11_BEHAVIOUR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Behaviour:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67956068429816203)
,p_name=>'P11_LEVEL_OF_CONFIDENTIALLY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Level of Confidentially:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67956438194816204)
,p_name=>'P11_NEXT_STEPS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Next steps:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67956885830816205)
,p_name=>'P11_PHONE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Phone:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67957255333816206)
,p_name=>'P11_ARRIVAL_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Arrival Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67957709493816207)
,p_name=>'P11_TM6_NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'TM6 Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67958021618816208)
,p_name=>'P11_LAST_NAME_THAI'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Last Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67958469413816209)
,p_name=>'P11_FIRST_NAME_THAI'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'First Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67958828454816210)
,p_name=>'P11_MIDDLE_NAME_THAI'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Middle Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67959281194816211)
,p_name=>'P11_BIRTHDAY'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67959620505816213)
,p_name=>'P11_AUTHORITY'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Authority:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67960014937816214)
,p_name=>'P11_CASE_NO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Case No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67960513258816215)
,p_name=>'P11_CONTACT_REQUIRED'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Contact Required:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67960817398816216)
,p_name=>'P11_REASON'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Reason:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67961243710816217)
,p_name=>'P11_ENTRY_DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Entry Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67961668346816218)
,p_name=>'P11_PASSPORT_NO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(96321372094204234)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68212882511005434)
,p_name=>'P11_BLACKLIST_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65265694169918682)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67967782970816321)
,p_name=>'ON CLICK ROW: SHOW DETAILS'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.reportRow'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#blacklistSearchResults'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67968242377816328)
,p_event_id=>wwv_flow_api.id(67967782970816321)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var cols = $(this.triggeringElement.parentNode.parentNode.childNodes);',
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
'        apex.item( "P11_RECORD_NO" ).setValue(blacklistID);',
'        apex.item( "P11_LAST_NAME" ).setValue(suspect.lastname);',
'        apex.item( "P11_FIRST_NAME" ).setValue(suspect.firstname);',
'        apex.item( "P11_MIDDLE_NAME" ).setValue(suspect.middlename);',
'        apex.item( "P11_GENDER" ).setValue(suspect.gender);',
'        apex.item( "P11_NATIONALITY" ).setValue(suspect.nationality);',
'        apex.item( "P11_BEHAVIOUR" ).setValue(suspect.behaviour);',
'        apex.item( "P11_LEVEL_OF_CONFIDENTIALLY" ).setValue(suspect.levelOfConfidentially);',
'        apex.item( "P11_NEXT_STEPS" ).setValue(suspect.nextStep);',
'        apex.item( "P11_PHONE" ).setValue(suspect.phone);',
'        apex.item( "P11_LAST_NAME_THAI" ).setValue(suspect.lastnameThai);',
'        apex.item( "P11_FIRST_NAME_THAI" ).setValue(suspect.firstnameThai);',
'        apex.item( "P11_MIDDLE_NAME_THAI" ).setValue(suspect.middlenameThai);',
'        apex.item( "P11_BIRTHDAY" ).setValue(suspect.dateOfBirth);',
'        apex.item( "P11_AUTHORITY" ).setValue(suspect.authority);',
'        apex.item( "P11_CONTACT_REQUIRED" ).setValue(suspect.contactRequired);',
'        apex.item( "P11_REASON" ).setValue(suspect.reason);',
'        apex.item( "P11_CASE_NO" ).setValue(suspect.caseNumber);',
'',
'        apex.item( "P11_ENTRY_DATE" ).setValue(suspect.entryDate);',
'        apex.item( "P11_PASSPORT_NO" ).setValue(suspect.passportNo);',
'        apex.item( "P11_ARRIVAL_DATE" ).setValue(suspect.arrivalDate);',
'        apex.item( "P11_TM6_NUMBER" ).setValue(suspect.tM6Number);',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(68213787057005443)
,p_name=>'ON CLICK: ACCEPT WINDOW'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(67966672091816261)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68214332213005449)
,p_event_id=>wwv_flow_api.id(68213787057005443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.page.validate();',
'',
'if(apex.item("P11_RECORD_NO").getValue() == "" || !apex.page.validate()) {',
'    ',
'    if(apex.item("P11_RECORD_NO").getValue() == "") {',
'        $("#P11_RECORD_NO_error_placeholder")',
'            .html("<span class=''t-Form-error''>Please choose the right blacklist entry.</span>")',
'            .removeClass("u-hidden")',
'            .addClass("apex-page-item-error");',
'    }',
'}',
'else {',
'    apex.item("P11_BLACKLIST_STATUS").setValue("ACCEPT");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(68214075915005446)
,p_name=>'ON CLICK: DENY WINDOW'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(67967024870816267)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68214309576005448)
,p_event_id=>wwv_flow_api.id(68214075915005446)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_BLACKLIST_STATUS'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'DENY'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68214118530005447)
,p_event_id=>wwv_flow_api.id(68214075915005446)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P11_NOTE,P11_BLACKLIST_STATUS,P11_RECORD_NO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(68214758374005453)
,p_name=>'ON CHANGE: P11_BLACKLIST_STATUS'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_BLACKLIST_STATUS'
,p_condition_element=>'P11_BLACKLIST_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ACCEPT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68214815061005454)
,p_event_id=>wwv_flow_api.id(68214758374005453)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P11_NOTE,P11_BLACKLIST_STATUS,P11_RECORD_NO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(65265054827918676)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET COLLECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'  l_blacklist_rec  pkg_blacklist_util.blacklist_search_typ;',
'',
'BEGIN',
' ',
'  l_blacklist_rec.date_of_birth := TO_DATE(:P1_BIRTHDAY, :AI_DEFAULT_DATE_FORMAT);',
'  l_blacklist_rec.expiry_date  := TO_DATE(:P1_PASSPORT_TILL, :AI_DEFAULT_DATE_FORMAT);',
'  l_blacklist_rec.first_name := :P1_FIRST_NAME;',
'  l_blacklist_rec.middle_name  := :P1_MIDDLE_NAME;',
'  l_blacklist_rec.last_name := :P1_LAST_NAME;',
'  l_blacklist_rec.nationality := :P1_NATIONALITY;',
'  l_blacklist_rec.passport_no := :P1_PASS_NO;',
'  l_blacklist_rec.sex := :P1_SEX;',
'',
'  pkg_blacklist_util.set_coll_by_advanced_search(l_blacklist_rec);',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(67967496032816312)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_DETAILS_FOR_BLACKLISTID'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    dl_bordercontrol.pkg_blacklist_util.get_details_from_collection(apex_application.g_x01); ',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
