prompt --application/pages/page_05005
begin
wwv_flow_api.create_page(
 p_id=>5005
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Blacklist History'
,p_page_mode=>'NORMAL'
,p_step_title=>'Blacklist History'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180730111505'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940520008279186621)
,p_plug_name=>'Blacklist History'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''REF_DOCNO'' as "REF_DOCNO",',
'       ''REF_ISSUING_COUNTRY'' as "REF_ISSUING_COUNTRY",',
'       ''REF_NAME'' as REF_NAME,',
'       ''REF_DOB'' as REF_DOB,',
'       ''REF_ACTIVE'' as "REF_ACTIVE",',
'       ''REF_FIRSTNAME'' as "REF_FIRSTNAME",',
'       ''REF_REASON'' as "REF_REASON",',
'       ''ACTION'' as "ACTION",',
'       ''ACTION_WHEN'' as "ACTION_WHEN",',
'       ''ACTION_WHO'' as "ACTION_WHO"',
'  from dual',
'  --from BLACKLIST_LOG '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(940520306886186625)
,p_name=>'REG_HISTORY'
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
,p_internal_uid=>663165137726227082
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(940520425857186629)
,p_db_column_name=>'REF_DOCNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Passport Number'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(940520846957186630)
,p_db_column_name=>'REF_ISSUING_COUNTRY'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Issuing Country'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(236810439642363107)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(940521211863186630)
,p_db_column_name=>'REF_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(940522467919186634)
,p_db_column_name=>'REF_FIRSTNAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(940522779337186635)
,p_db_column_name=>'REF_REASON'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Reason'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(940524033639186637)
,p_db_column_name=>'ACTION_WHO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Officer'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(191038247759524412)
,p_db_column_name=>'REF_DOB'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'Ref dob'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(191038380205524413)
,p_db_column_name=>'REF_ACTIVE'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Ref active'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(191038440057524414)
,p_db_column_name=>'ACTION'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>'Action'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(191038540930524415)
,p_db_column_name=>'ACTION_WHEN'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>'Action when'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(940524372330186641)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6631693'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'REF_DOCNO:REF_ISSUING_COUNTRY:REF_NAME:REF_FIRSTNAME:REF_REASON_WHEN_WHO'
,p_sort_column_1=>'ACTION_WHEN'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940525576685192228)
,p_plug_name=>'Black List History'
,p_icon_css_classes=>'fa-info'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'',
'<li>Inspect all changes made to the blacklist</li>',
'<li>for changed records, only the changed fields are shown</li>',
'<li>to see the changed for a dedicated blacklist entry, select the entry in the blacklist management and see the history in the detail</li>'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
