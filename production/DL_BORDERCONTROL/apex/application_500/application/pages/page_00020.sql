prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Flight Management'
,p_page_mode=>'NORMAL'
,p_step_title=>'Flight Management'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'BIO.TEST.ALL'
,p_last_upd_yyyymmddhh24miss=>'20190530005325'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(551280908874462733)
,p_plug_name=>'Flight Management'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    flghtid,',
'    flightnum,',
'    originairportid,',
'    destinairportid,',
'    timedeparture,',
'    timearrival,',
'    active,',
'    directionflg,',
'    agentid,',
'    ins_terminal,',
'    ins_borderpost',
'FROM',
'    dl_bordercontrol.flights;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(551281253994462733)
,p_name=>'Flight Management'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_saving=>'N'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21:P21_FLGHTID:#FLGHTID#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil-alt.png" class="apex-edit-pencil-alt" alt=""></center>'
,p_owner=>'ADMIN'
,p_internal_uid=>8855901813334185
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(551281823696462734)
,p_db_column_name=>'FLIGHTNUM'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Flight Number'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(551282161480462734)
,p_db_column_name=>'ORIGINAIRPORTID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Origin Airport'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(186692193158153892)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(551282648275462734)
,p_db_column_name=>'DESTINAIRPORTID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Destination Airport'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(186692193158153892)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(551282989637462734)
,p_db_column_name=>'TIMEDEPARTURE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Flight Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH12:MI:SS AM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(551283431423462735)
,p_db_column_name=>'TIMEARRIVAL'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Flight End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH12:MI:SS AM'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(552758050405422447)
,p_db_column_name=>'ACTIVE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Active'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(558108972921270797)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(584711738632237930)
,p_db_column_name=>'DIRECTIONFLG'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Direction'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(262034404724586336)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(584713073637237931)
,p_db_column_name=>'AGENTID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Airline'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(584693088801564950)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(137872039651874848)
,p_db_column_name=>'FLGHTID'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'Flghtid'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(137872161349874849)
,p_db_column_name=>'INS_TERMINAL'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Terminal'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(137872205045874850)
,p_db_column_name=>'INS_BORDERPOST'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>'Borderpost'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(182747869576861229)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(551284339137463346)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'88590'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'FLIGHTNUM:ORIGINAIRPORTID:DESTINAIRPORTID:TIMEARRIVAL:TIMEDEPARTURE:DIRECTIONFLG:INS_BORDERPOST:AGENTID:ACTIVE:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(865595404977863938)
,p_plug_name=>'Flights'
,p_icon_css_classes=>'fa-info'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'Use this page to manage all flights.'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(551283774078462735)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(551280908874462733)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21::'
,p_grid_new_grid=>false
);
end;
/
