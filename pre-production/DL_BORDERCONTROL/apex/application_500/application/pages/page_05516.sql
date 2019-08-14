prompt --application/pages/page_05516
begin
wwv_flow_api.create_page(
 p_id=>5516
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'ISDS Logs'
,p_page_mode=>'NORMAL'
,p_step_title=>'ISDS Logs'
,p_step_sub_title=>'ISDS Logs'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20181102141642'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80598067610939638)
,p_plug_name=>'Breadcrumb'
,p_icon_css_classes=>'fa-server-search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(563848260072049643)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(563842240471049627)
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80598601997939675)
,p_plug_name=>'ISDS Logs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "KEY_VALUE", ',
'"DML_AT",',
'"DML_BY",',
'"DML_TYPE",',
'sender_object             AS "BORDERCONTROL_OBJECT",',
'sender_object_id          AS "BORDERCONTROL_OBJECT_ID",',
'sender_response_code      AS "RESPONSE_CODE",',
'sender_response_message   AS "ERROR_MESSAGE",',
'receiver_response_id      AS "PIBICS_RESPONSE_ID",',
'"PROCESS_TIME",',
''' '' as "EDIT"',
'from dl_interface.log_sync_webservices'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(80598646672939676)
,p_name=>'ISDS Logs'
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
,p_internal_uid=>6561930993186455
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80599050242939708)
,p_db_column_name=>'KEY_VALUE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Key Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80599433011939722)
,p_db_column_name=>'DML_AT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Dml At'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80599911871939723)
,p_db_column_name=>'DML_BY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Dml By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80600244457939724)
,p_db_column_name=>'DML_TYPE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Dml Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80600684789939725)
,p_db_column_name=>'BORDERCONTROL_OBJECT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Bordercontrol Object'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80601056091939726)
,p_db_column_name=>'BORDERCONTROL_OBJECT_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Bordercontrol Object Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80601455040939726)
,p_db_column_name=>'RESPONSE_CODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Response Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80602129621939728)
,p_db_column_name=>'PIBICS_RESPONSE_ID'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Pibics Response Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80602531202939729)
,p_db_column_name=>'PROCESS_TIME'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Process Time'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44586645298043644)
,p_db_column_name=>'EDIT'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'View'
,p_column_link=>'f?p=&APP_ID.:5517:&SESSION.::&DEBUG.:RP:P5517_KEY_VALUE:#KEY_VALUE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46069859931049355)
,p_db_column_name=>'ERROR_MESSAGE'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Error message'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(80620188066949677)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'65835'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'KEY_VALUE:DML_AT:DML_BY:DML_TYPE:BORDERCONTROL_OBJECT:BORDERCONTROL_OBJECT_ID:RESPONSE_CODE:PIBICS_RESPONSE_ID:PROCESS_TIME:EDIT'
,p_sort_column_1=>'DML_AT'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80603679844941622)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(80598601997939675)
,p_button_name=>'EXECUTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Execute Request'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:5518:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-server-play'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(167983463851408445)
,p_name=>'DIALOG CLOSED: NEW REQUEST'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(80598601997939675)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(167983591015408446)
,p_event_id=>wwv_flow_api.id(167983463851408445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(80598601997939675)
,p_stop_execution_on_error=>'Y'
);
end;
/
