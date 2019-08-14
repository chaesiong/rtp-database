prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(45965479290928181)
,p_name=>'Summary'
,p_page_mode=>'MODAL'
,p_step_title=>'Summary'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'1200'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180509112723'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(46776335408322763)
,p_name=>'Report'
,p_template=>wwv_flow_api.id(45928798426927985)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 AS reihe',
'      ,''S025856'' AS datensatznummer',
'      ,''YADAV - CHAND - PREM'' AS name',
'      ,null AS name_tha',
'      ,''M'' AS geschlecht',
'      ,''10/01/1960'' AS geburtsdatum',
'  FROM dual',
'UNION ALL',
'SELECT 2',
'      ,''S027815''',
'      ,''YADAC - PREM - CHAND''',
'      ,null',
'      ,''M''',
'      ,''10/01/1960''',
'  FROM dual'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(45941764110928023)
,p_query_num_rows=>15
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
 p_id=>wwv_flow_api.id(46776462520322764)
,p_query_column_id=>1
,p_column_alias=>'REIHE'
,p_column_display_sequence=>1
,p_column_heading=>'Row'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(46776552620322765)
,p_query_column_id=>2
,p_column_alias=>'DATENSATZNUMMER'
,p_column_display_sequence=>2
,p_column_heading=>'No.'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(46776674234322766)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(46776772447322767)
,p_query_column_id=>4
,p_column_alias=>'NAME_THA'
,p_column_display_sequence=>4
,p_column_heading=>'Name (Thai)'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(46776827740322768)
,p_query_column_id=>5
,p_column_alias=>'GESCHLECHT'
,p_column_display_sequence=>5
,p_column_heading=>'Sex'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(46776955294322769)
,p_query_column_id=>6
,p_column_alias=>'GEBURTSDATUM'
,p_column_display_sequence=>6
,p_column_heading=>'Date of Birth'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46777017651322770)
,p_plug_name=>'Summary'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--noPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47020822826797462)
,p_plug_name=>'Approve Visa'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47021315051797467)
,p_plug_name=>'Notification'
,p_parent_plug_id=>wwv_flow_api.id(47020822826797462)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45921816286927968)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47021419348797468)
,p_plug_name=>'Buttoncontainer Visa'
,p_parent_plug_id=>wwv_flow_api.id(47020822826797462)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45921816286927968)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47021535033797469)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(47021419348797468)
,p_button_name=>'ACCEPT_VISA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_image_alt=>'Approve Visa'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47021660640797470)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(47021419348797468)
,p_button_name=>'DENY_VISA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_image_alt=>'Decline Visa'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-ban'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47022101985797474)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(47021419348797468)
,p_button_name=>'PRINT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(45954588625928076)
,p_button_image_alt=>'Drucken'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_icon_css_classes=>'fa-print fa-2x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46777119091322771)
,p_name=>'P10_ANTRAG_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46777353540322773)
,p_name=>'P10_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Family Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46777483415322774)
,p_name=>'P10_LAST_NAME_THA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Family Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46777569628322775)
,p_name=>'P10_FIRST_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46777656104322776)
,p_name=>'P10_FIRST_NAME_THA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'First Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46777750419322777)
,p_name=>'P10_MIDDLE_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46777899490322778)
,p_name=>'P10_MIDDLE_NAME_THA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Middle Name (Thai):'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46777928969322779)
,p_name=>'P10_SEX'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Sex:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46778027980322780)
,p_name=>'P10_BIRTHDAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47018129813797435)
,p_name=>'P10_NATIONALITY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47018374351797437)
,p_name=>'P10_BEHOERDE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Office:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47018446928797438)
,p_name=>'P10_ZUSTAENDIGE_BEHOERDE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Competent Authority:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47018517486797439)
,p_name=>'P10_TAT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Act:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47018668823797440)
,p_name=>'P10_FALLNUMMER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Case Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47018788977797441)
,p_name=>'P10_GEHEIMSTUFE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Secret Stage:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47018895228797442)
,p_name=>'P10_CONTACT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Contact:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47018936289797443)
,p_name=>'P10_CASE_CREATED'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Created at:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019088039797444)
,p_name=>'P10_TRAVEL_DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Travel Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019167014797445)
,p_name=>'P10_PASSPORT_NO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019313457797446)
,p_name=>'P10_TM6_NO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'TM6-No.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019326187797447)
,p_name=>'P10_CONTACT_IMMEDIATELY'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Contact Immediately:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019509153797448)
,p_name=>'P10_NEXT_STEPS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Next Steps:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019528769797449)
,p_name=>'P10_GRUND_DER_TAT'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Motive:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019654030797450)
,p_name=>'P10_APPEARANCE_HEIGHT'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Size:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019746070797451)
,p_name=>'P10_APPEARANCE_WEIGHT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Weight:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47019887755797452)
,p_name=>'P10_APPEARANCE_HAIR_COLOR'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Hair color:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47020372876797457)
,p_name=>'P10_APPEARANCE_HAIR_TYPE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Hair type:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47020475192797458)
,p_name=>'P10_APPEARANCE_FACE_SHAPE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Face Shape:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47020566775797459)
,p_name=>'P10_APPEARANCE_FIGUR'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(46777017651322770)
,p_prompt=>'Figure:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47020959840797463)
,p_name=>'P10_ATTENTION_MESSAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47021315051797467)
,p_item_default=>'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea tak'
||'imata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et e'
||'a rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'
,p_prompt=>'Note:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47021296545797466)
,p_name=>'P10_NOTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(47021419348797468)
,p_prompt=>'Reason / Note:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(45954422530928074)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59299345366346481)
,p_name=>'P10_BLACKLIST_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47021419348797468)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(59299450393346482)
,p_computation_sequence=>10
,p_computation_item=>'P10_BLACKLIST_STATUS'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'ACCEPT'
,p_compute_when=>'ACCEPT_VISA'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(59299589069346483)
,p_computation_sequence=>20
,p_computation_item=>'P10_BLACKLIST_STATUS'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'DENY'
,p_compute_when=>'DENY_VISA'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(59299158968346479)
,p_validation_name=>'VALIDATE: P10_NOTE'
,p_validation_sequence=>10
,p_validation=>'P10_NOTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'The reason / note has to be filled.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(47021535033797469)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59298909641346476)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CLOSE: DIALOG AFTER ACCEPT_VISA'
,p_attribute_01=>'P10_NOTE,P10_BLACKLIST_STATUS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(47021535033797469)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59299004655346477)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CLOSE: DIALOG AFTER DENY_VISA'
,p_attribute_01=>'P10_BLACKLIST_STATUS'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(47021660640797470)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47020769034797461)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROTOTYPE: FILL FIELDS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P10_ANTRAG_NO              := ''S025856'';',
':P10_LAST_NAME              := ''YADAV'';',
':P10_LAST_NAME_THA          := ''YADAV'';',
':P10_FIRST_NAME             := ''CHAND'';',
':P10_FIRST_NAME_THA         := ''CHAND'';',
':P10_MIDDLE_NAME            := ''PREM'';',
':P10_MIDDLE_NAME_THA        := ''PREM'';',
':P10_SEX                    := ''M'';',
':P10_BIRTHDAY               := ''10/01/1960'';',
':P10_NATIONALITY            := ''INDIAN/INDIAN(Thai)'';',
':P10_BEHOERDE               := ''Behördenname'';',
':P10_ZUSTAENDIGE_BEHOERDE   := ''Behördenname'';',
':P10_TAT                    := ''03-Haftbefehl'';',
':P10_FALLNUMMER             := ''XYZ'';',
':P10_GEHEIMSTUFE            := ''04-Stufe 4'';',
':P10_CONTACT_IMMEDIATELY    := ''Ja'';',
':P10_NEXT_STEPS             := ''verhaften'';',
':P10_GRUND_DER_TAT          := '''';',
':P10_CONTACT                := ''073-581196'';',
':P10_CASE_CREATED           := ''05/01/2010'';',
':P10_TRAVEL_DATE            := ''03/07/2554'';',
':P10_PASSPORT_NO            := ''C74ZMJ13N'';',
':P10_TM6_NO                 := ''YU15975'';',
':P10_APPEARANCE_HEIGHT      := ''170'';',
':P10_APPEARANCE_WEIGHT      := ''-'';',
':P10_APPEARANCE_HAIR_COLOR  := ''blond'';',
':P10_APPEARANCE_HAIR_TYPE   := ''-'';',
':P10_APPEARANCE_FACE_SHAPE  := ''-'';',
':P10_APPEARANCE_FIGUR       := ''-'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
