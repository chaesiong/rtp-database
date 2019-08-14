prompt --application/pages/page_05000
begin
wwv_flow_api.create_page(
 p_id=>5000
,p_user_interface_id=>wwv_flow_api.id(165585018976055186)
,p_name=>'ICRS Logs'
,p_page_mode=>'NORMAL'
,p_step_title=>'ICRS Logs'
,p_step_sub_title=>'ICRS Logs'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(75628207662254518)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181023113145'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86710365796866418)
,p_plug_name=>'ICRS Logs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(165558317635055064)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT logs_icrs_v.*',
'      ,dbms_lob.getlength(nist_file) AS nist_file_length',
'      ,dbms_lob.substr(service_response, 4000, 1) AS service_response_small ',
'  FROM dl_blacklist.logs_icrs_v ',
'  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(86710471737866418)
,p_name=>'ICRS Logs'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'E1CHAGEMANN'
,p_internal_uid=>44926343351810968
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86710861045866432)
,p_db_column_name=>'KEY_VALUE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Key Value'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86711250045866436)
,p_db_column_name=>'BLACKLIST_CASE_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Blacklist Case Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86714115233866445)
,p_db_column_name=>'AUTHORITY'
,p_display_order=>12
,p_column_identifier=>'I'
,p_column_label=>'Case Authority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86714506690866446)
,p_db_column_name=>'INS_AT'
,p_display_order=>22
,p_column_identifier=>'J'
,p_column_label=>'Case inserted at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86714921044866446)
,p_db_column_name=>'DML_AT'
,p_display_order=>32
,p_column_identifier=>'K'
,p_column_label=>'Case last modified at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86712463947866444)
,p_db_column_name=>'SERVICE_SEND'
,p_display_order=>82
,p_column_identifier=>'E'
,p_column_label=>'ICRS Sent'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86712901208866444)
,p_db_column_name=>'SERVICE_RECEIVE'
,p_display_order=>92
,p_column_identifier=>'F'
,p_column_label=>'ICRS Received'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86713323770866445)
,p_db_column_name=>'SERVICE_RESULT'
,p_display_order=>102
,p_column_identifier=>'G'
,p_column_label=>'ICRS Result'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86713653856866445)
,p_db_column_name=>'STATUS'
,p_display_order=>112
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(86978157518966304)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355347662243894)
,p_db_column_name=>'NIST_FILE_LENGTH'
,p_display_order=>122
,p_column_identifier=>'L'
,p_column_label=>'NIST file'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:LOGS_ICRS_V:NIST_FILE:KEY_VALUE:::FILENAME:::attachment:Download:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86711690754866437)
,p_db_column_name=>'NIST_FILE'
,p_display_order=>132
,p_column_identifier=>'C'
,p_column_label=>'Nist File'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86712052789866443)
,p_db_column_name=>'SERVICE_RESPONSE'
,p_display_order=>142
,p_column_identifier=>'D'
,p_column_label=>'ICRS Response'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355625256243896)
,p_db_column_name=>'SERVICE_RESPONSE_SMALL'
,p_display_order=>152
,p_column_identifier=>'M'
,p_column_label=>'ICRS Response'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355658422243897)
,p_db_column_name=>'FILENAME'
,p_display_order=>162
,p_column_identifier=>'N'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(48355758891243898)
,p_db_column_name=>'CASE_NUMBER'
,p_display_order=>172
,p_column_identifier=>'O'
,p_column_label=>'Case number'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(86773927736940190)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'449898'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'CASE_NUMBER:AUTHORITY:INS_AT:DML_AT:SERVICE_SEND:SERVICE_RECEIVE:SERVICE_RESULT:STATUS:NIST_FILE_LENGTH:SERVICE_RESPONSE_SMALL:'
,p_sort_column_1=>'SERVICE_SEND'
,p_sort_direction_1=>'DESC NULLS LAST'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_flashback_enabled=>'N'
);
end;
/
