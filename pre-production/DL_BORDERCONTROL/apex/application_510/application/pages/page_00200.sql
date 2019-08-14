prompt --application/pages/page_00200
begin
wwv_flow_api.create_page(
 p_id=>200
,p_user_interface_id=>wwv_flow_api.id(45965479290928181)
,p_name=>'Reports VISAS'
,p_page_mode=>'NORMAL'
,p_step_title=>'&P200_PAGE_TITLE.'
,p_step_sub_title=>'Reports VISAS'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(45917100384927921)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180614172043'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71058811564380868)
,p_plug_name=>'Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--noPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71060109632380881)
,p_plug_name=>'Breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45933240196927994)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(45966744858928290)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(45955125154928085)
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(90613240605390398)
,p_plug_name=>'Reports VISAS'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(45928313945927979)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT s.* ',
'      ,s.sex AS filter_sex',
'      ,s.nationality AS filter_nationality',
'      ,s.borderpost AS filter_borderpost',
'      ,s.workstation AS filter_workstation',
'      ,s.trans_vehicle AS filter_trans_vehicle',
'  FROM dl_bordercontrol.rep_voa_statistics s'))
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
 p_id=>wwv_flow_api.id(90613317723390398)
,p_name=>'Reports VISAS'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_filter=>'N'
,p_show_sort=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'XLS:PDF'
,p_owner=>'E1CHAGEMANN'
,p_internal_uid=>51065403027520865
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(90614519341390439)
,p_db_column_name=>'VISA_NUMBER'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Visa No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(90616166483390443)
,p_db_column_name=>'SEX'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(50645029860665709)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(90617010523390446)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(50654925745736719)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(90617383229390447)
,p_db_column_name=>'BORDERPOST'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Borderpost'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(55138297768512750)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91431920428204259)
,p_db_column_name=>'REQUESTED_DATE'
,p_display_order=>20
,p_column_identifier=>'L'
,p_column_label=>'Requested date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91432047041204260)
,p_db_column_name=>'OFFICER'
,p_display_order=>30
,p_column_identifier=>'M'
,p_column_label=>'Officer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91432122341204261)
,p_db_column_name=>'WORKSTATION'
,p_display_order=>40
,p_column_identifier=>'N'
,p_column_label=>'Workstation'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(91635859798849878)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91432310173204262)
,p_db_column_name=>'TRANS_VEHICLE'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Vehicle type'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(58888425582919466)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91432354904204263)
,p_db_column_name=>'TRANS_NUMBER'
,p_display_order=>60
,p_column_identifier=>'P'
,p_column_label=>'Vehicle number'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91432458370204264)
,p_db_column_name=>'REPORT_TYPE'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'Report type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91432524797204265)
,p_db_column_name=>'RECEIPT_BOOKING_NUMBER'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>'Receipt book number'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91432648731204266)
,p_db_column_name=>'RECEIPT_NUMBER'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'Receipt number'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91434261874204282)
,p_db_column_name=>'BORDERPOST_NAME'
,p_display_order=>100
,p_column_identifier=>'T'
,p_column_label=>'Borderpost name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91434351597204283)
,p_db_column_name=>'WORKSTATION_ADDRESS'
,p_display_order=>110
,p_column_identifier=>'U'
,p_column_label=>'Workstation address'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91680709704160034)
,p_db_column_name=>'FILTER_SEX'
,p_display_order=>120
,p_column_identifier=>'V'
,p_column_label=>'Filter sex'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91680767478160035)
,p_db_column_name=>'FILTER_NATIONALITY'
,p_display_order=>130
,p_column_identifier=>'W'
,p_column_label=>'Filter nationality'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91680911729160036)
,p_db_column_name=>'FILTER_BORDERPOST'
,p_display_order=>140
,p_column_identifier=>'X'
,p_column_label=>'Filter borderpost'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91680957192160037)
,p_db_column_name=>'FILTER_WORKSTATION'
,p_display_order=>150
,p_column_identifier=>'Y'
,p_column_label=>'Filter workstation'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91681068266160038)
,p_db_column_name=>'FILTER_TRANS_VEHICLE'
,p_display_order=>160
,p_column_identifier=>'Z'
,p_column_label=>'Filter trans vehicle'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91685374859160081)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>170
,p_column_identifier=>'AA'
,p_column_label=>'Created by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(90618520080391432)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'PRIMARY_REPORT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'REQUESTED_DATE:RECEIPT_BOOKING_NUMBER:RECEIPT_NUMBER:OFFICER:BORDERPOST:WORKSTATION:REPORT_TYPE:SEX:NATIONALITY:TRANS_NUMBER:TRANS_VEHICLE:VISA_NUMBER::BORDERPOST_NAME:WORKSTATION_ADDRESS:FILTER_SEX:FILTER_NATIONALITY:FILTER_BORDERPOST:FILTER_WORKSTA'
||'TION:FILTER_TRANS_VEHICLE:CREATED_BY'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(91671068090097832)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Visa on Arrival'
,p_report_seq=>10
,p_report_alias=>'VISA_ON_ARRIVAL'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'REQUESTED_DATE:NATIONALITY:VISA_NUMBER:SEX:OFFICER:BORDERPOST:WORKSTATION:TRANS_VEHICLE:TRANS_NUMBER:REPORT_TYPE:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(91671862709105170)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Departure Information'
,p_report_seq=>10
,p_report_alias=>'DEPARTURE_INFORMATION'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'REQUESTED_DATE:NATIONALITY:VISA_NUMBER:SEX:OFFICER:BORDERPOST:WORKSTATION:TRANS_VEHICLE:TRANS_NUMBER:REPORT_TYPE:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(91672475947108397)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Daily statistics'
,p_report_seq=>10
,p_report_alias=>'DAILY_STATISTICS'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'REQUESTED_DATE:OFFICER:BORDERPOST:WORKSTATION:REPORT_TYPE:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(91673102509111760)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Cancel payment'
,p_report_seq=>10
,p_report_alias=>'CANCEL_PAYMENT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'REQUESTED_DATE:RECEIPT_BOOKING_NUMBER:RECEIPT_NUMBER:OFFICER:BORDERPOST:WORKSTATION:CREATED_BY:REPORT_TYPE:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(91673676115113967)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Daily payment'
,p_report_seq=>10
,p_report_alias=>'DAILY_PAYMENT'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'REQUESTED_DATE:RECEIPT_BOOKING_NUMBER:RECEIPT_NUMBER:OFFICER:BORDERPOST:WORKSTATION:CREATED_BY:REPORT_TYPE:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91433935584204279)
,p_plug_name=>'Buttonregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(45922244475927968)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71060118868380882)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(71058811564380868)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(71060253569380883)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(71058811564380868)
,p_button_name=>'RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P200_ISSUING_DATE IS NOT NULL OR',
':P200_NATIONALITY IS NOT NULL OR',
':P200_VISA_NUMBER IS NOT NULL OR',
':P200_SEX IS NOT NULL OR',
':P200_OFFICER IS NOT NULL OR',
':P200_BORDERPOST IS NOT NULL OR',
':P200_WORKSTATION IS NOT NULL OR',
':P200_VEHICLE_TYPE IS NOT NULL OR',
':P200_VEHICLE_NUMBER IS NOT NULL OR',
':P200_RECEIPT_BOOKING_NUMBER IS NOT NULL OR',
':P200_RECEIPT_NUMBER IS NOT NULL OR',
':P200_REPORT_TYPE IS NOT NULL OR',
':P200_CREATED_BY IS NOT NULL'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(91434047038204280)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(91433935584204279)
,p_button_name=>'PRINT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=510:200:12121217360340:PDF::::'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(91681375597160041)
,p_branch_name=>'RESET REPORT'
,p_branch_action=>'f?p=&APP_ID.:200:&SESSION.:IR_&P200_REPORT.:&DEBUG.:RP,CIR::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(71060253569380883)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71058905098380869)
,p_name=>'P200_ISSUING_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Requested date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059068604380871)
,p_name=>'P200_NATIONALITY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
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
,p_display_when=>':P200_REPORT IN (''VISA_ON_ARRIVAL'', ''DEPARTURE_INFORMATION'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059183016380872)
,p_name=>'P200_VISA_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Visa No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>':P200_REPORT IN (''VISA_ON_ARRIVAL'', ''DEPARTURE_INFORMATION'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059242898380873)
,p_name=>'P200_SEX'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.human_sexes$lc',
' WHERE num_value IS NOT NULL',
' ORDER BY display_order;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>':P200_REPORT IN (''VISA_ON_ARRIVAL'', ''DEPARTURE_INFORMATION'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059398029380874)
,p_name=>'P200_OFFICER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Officer:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059510124380875)
,p_name=>'P200_BORDERPOST'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Borderpost:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059579026380876)
,p_name=>'P200_WORKSTATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Workstation:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.display_value_ip, return_value',
'  FROM dl_bordercontrol.lov_terminals t',
' WHERE border_post = :P200_BORDERPOST',
'    OR :P200_BORDERPOST IS NULL'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P200_BORDERPOST'
,p_ajax_items_to_submit=>'P200_BORDERPOST'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059680815380877)
,p_name=>'P200_VEHICLE_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Vehicle Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TRANS_VEHICLES_PK'
,p_lov=>'SELECT display_value, return_value FROM lov_trans_vehicles'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>':P200_REPORT IN (''VISA_ON_ARRIVAL'',''DEPARTURE_INFORMATION'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059804543380878)
,p_name=>'P200_VEHICLE_NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Vehicle number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>':P200_REPORT IN (''VISA_ON_ARRIVAL'',''DEPARTURE_INFORMATION'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(71059829638380879)
,p_name=>'P200_REPORT_TYPE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Report Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91432986719204269)
,p_name=>'P200_RECEIPT_BOOKING_NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Receipt book number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>':P200_REPORT IN (''CANCEL_PAYMENT'',''DAILY_PAYMENT'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91433060850204270)
,p_name=>'P200_RECEIPT_NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Receipt number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>':P200_REPORT IN (''CANCEL_PAYMENT'',''DAILY_PAYMENT'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91433407009204273)
,p_name=>'P200_PAGE_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71060109632380881)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91433437193204274)
,p_name=>'P200_REPORT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71060109632380881)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(91685433562160082)
,p_name=>'P200_CREATED_BY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(71058811564380868)
,p_prompt=>'Created by:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>':P200_REPORT IN (''CANCEL_PAYMENT'',''DAILY_PAYMENT'')'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(45954251363928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(91681449289160042)
,p_computation_sequence=>10
,p_computation_item=>'P200_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(message_value, message_value$dlc)',
'  FROM dl_common.messages$lc',
' WHERE is_active = ''Y''',
'   AND message_key = ''VOA\200\page_title\'' || LOWER(:P200_REPORT);'))
,p_computation_error_message=>'#SQLERRM#'
,p_compute_when=>'P200_PAGE_TITLE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(91433743629204277)
,p_name=>'HIDE: IRR-TOOLBAR'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91433822802204278)
,p_event_id=>wwv_flow_api.id(91433743629204277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'.a-IRR-toolbar'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(91434182566204281)
,p_event_id=>wwv_flow_api.id(91433743629204277)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'.a-IRR-controlsContainer'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91432833730204268)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FILTER REPORT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'dl_bordercontrol.voa_apex_pkg.get_report_search_query (p_app_id                 => :APP_ID',
'                                                      ,p_page_id                => :APP_PAGE_ID',
'                                                      ,p_requesting_date        => :P200_ISSUING_DATE',
'                                                      ,p_nationality            => :P200_NATIONALITY',
'                                                      ,p_visa_number            => :P200_VISA_NUMBER',
'                                                      ,p_sex                    => :P200_SEX',
'                                                      ,p_officer                => :P200_OFFICER',
'                                                      ,p_borderpost_id          => :P200_BORDERPOST',
'                                                      ,p_terminal_id            => :P200_WORKSTATION',
'                                                      ,p_transport_type         => :P200_VEHICLE_TYPE',
'                                                      ,p_transport_number       => :P200_VEHICLE_NUMBER',
'                                                      ,p_report_type            => :P200_REPORT_TYPE',
'                                                      ,p_receipt_booking_number => :P200_RECEIPT_BOOKING_NUMBER',
'                                                      ,p_receipt_number         => :P200_RECEIPT_NUMBER',
'                                                      ,p_created_by             => :P200_CREATED_BY);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(71060118868380882)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(91681175998160039)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'RESET'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P200_ISSUING_DATE,P200_NATIONALITY,P200_VISA_NUMBER,P200_SEX,P200_OFFICER,P200_BORDERPOST,P200_WORKSTATION,P200_VEHICLE_TYPE,P200_VEHICLE_NUMBER,P200_RECEIPT_BOOKING_NUMBER,P200_RECEIPT_NUMBER,P200_REPORT_TYPE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(71060253569380883)
);
end;
/
