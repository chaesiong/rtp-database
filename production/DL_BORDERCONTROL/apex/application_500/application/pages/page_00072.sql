prompt --application/pages/page_00072
begin
wwv_flow_api.create_page(
 p_id=>72
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Transport Unit Report'
,p_page_mode=>'NORMAL'
,p_step_title=>'Transport Unit Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Transport Unit Report'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180730110213'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(583711585884573042)
,p_plug_name=>'Transport Unit Report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select d.docno, d.doctype, d.issuectry, d.nat, d.sex, to_date(d.dob, ''yymmdd'')  as "dob", d.givenname, d.surname, m.pssngrstatus, m.RNKDSGNTDID, m.CREATED as "MOVEMENTCREATED"',
' --, tu.* ',
'from movements m',
'--inner join transportunits tu on m.trnsprtunitid = tu.trnsprtunitid',
'inner join borderdocuments d on d.brddocid = m.brddocid',
'where m.trnsprtunitid = :P72_TRNSPRTUNITID and m.exitflg < 2;',
'                                                             '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(583711700145573042)
,p_name=>'Transport Unit Report'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>41286347964444494
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583718889799573046)
,p_db_column_name=>'PSSNGRSTATUS'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Passenger Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(583162488425998144)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583738966450664594)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583739693028664594)
,p_db_column_name=>'DOCNO'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Document Number'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583740389583664595)
,p_db_column_name=>'ISSUECTRY'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Issue Country'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583741056901664595)
,p_db_column_name=>'NAT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583742481930664596)
,p_db_column_name=>'SEX'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(577782878906762560)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583743870774664600)
,p_db_column_name=>'GIVENNAME'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Given Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583744606939664601)
,p_db_column_name=>'SURNAME'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Surname'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583747377153664603)
,p_db_column_name=>'RNKDSGNTDID'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Rank Designated'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(583210569027105317)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583756352928693555)
,p_db_column_name=>'MOVEMENTCREATED'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583761261113715763)
,p_db_column_name=>'dob'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Date Of Birth'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-RR'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(583727001838591713)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'413017'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'DOCNO:DOCTYPE:ISSUECTRY:NAT:GIVENNAME:SURNAME:SEX:PSSNGRSTATUS:RNKDSGNTDID:MOVEMENTCREATED:dob'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(583719821936578292)
,p_name=>'P72_TRNSPRTUNITID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(583711585884573042)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(185707744172174908)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>':MOVEMENT_ENTRY_EXIT := :AI_DEFAULT_DIRECTION;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
