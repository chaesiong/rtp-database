prompt --application/pages/page_00340
begin
wwv_flow_api.create_page(
 p_id=>340
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Computers'
,p_page_mode=>'NORMAL'
,p_step_title=>'Computers'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Computers'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(58964392495783603)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180905170221'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65672518826669471)
,p_plug_name=>'Computers'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096075490202982)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.ID',
'      ,t0.NAME',
'      ,t0.DESCRIPTION',
'      ,t0.DNS_NAME',
'      ,t0.SORT_ORDER',
'      ,t0.IS_ACTIVE',
'      ,t0.INS_AT as INSERT_DATE',
'      ,t0.INS_BY as INSERT_SOURCE',
'      ,cast(t0.DML_AT as date) as UPDATE_DATE',
'      ,t0.DML_BY as UPDATE_SOURCE',
'  from COMPUTERS t0',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(65672552101669471)
,p_name=>'Users'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:341:&SESSION.::&DEBUG.::P341_ID,P341_NAME:#ID#,#NAME#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil-alt.png" class="apex-edit-pencil-alt" alt="">'
,p_detail_link_auth_scheme=>wwv_flow_api.id(59023663688969588)
,p_owner=>'ADMIN'
,p_internal_uid=>24057655363735749
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44152200158362287)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44215433583090823)
,p_db_column_name=>'NAME'
,p_display_order=>2
,p_column_identifier=>'L'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44215546496090824)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'M'
,p_column_label=>'Description'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44215650316090825)
,p_db_column_name=>'DNS_NAME'
,p_display_order=>4
,p_column_identifier=>'N'
,p_column_label=>'DNS Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44215759091090826)
,p_db_column_name=>'SORT_ORDER'
,p_display_order=>5
,p_column_identifier=>'O'
,p_column_label=>'Sort Order'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44215868484090827)
,p_db_column_name=>'IS_ACTIVE'
,p_display_order=>6
,p_column_identifier=>'P'
,p_column_label=>'Is Active'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(63181780146773720)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44155017532362288)
,p_db_column_name=>'INSERT_DATE'
,p_display_order=>7
,p_column_identifier=>'H'
,p_column_label=>'Insert Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44155456629362288)
,p_db_column_name=>'INSERT_SOURCE'
,p_display_order=>8
,p_column_identifier=>'I'
,p_column_label=>'Insert Source'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44155863000362288)
,p_db_column_name=>'UPDATE_DATE'
,p_display_order=>9
,p_column_identifier=>'J'
,p_column_label=>'Update Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(44156228898362289)
,p_db_column_name=>'UPDATE_SOURCE'
,p_display_order=>10
,p_column_identifier=>'K'
,p_column_label=>'Update Source'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(65677385365674311)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'25417'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'NAME:DESCRIPTION:DNS_NAME:SORT_ORDER:IS_ACTIVE:INSERT_DATE:INSERT_SOURCE:UPDATE_DATE:UPDATE_SOURCE:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44157028142362292)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(65672518826669471)
,p_button_name=>'NEW_COMPUTER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Computer'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:341:&SESSION.::&DEBUG.:341::'
,p_icon_css_classes=>'fa-plus-circle'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
end;
/
