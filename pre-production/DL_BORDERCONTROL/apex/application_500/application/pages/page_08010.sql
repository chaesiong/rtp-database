prompt --application/pages/page_08010
begin
wwv_flow_api.create_page(
 p_id=>8010
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Country Rules'
,p_page_mode=>'NORMAL'
,p_step_title=>'Country Rules'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_css_file_urls=>'#APP_IMAGES#ModalDialogs.css'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'MSTEPHAN'
,p_last_upd_yyyymmddhh24miss=>'20180924154019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(852351282929189538)
,p_plug_name=>'Country Rules'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID", ',
'"COUTRY_CODE",',
'"DIRECTION",',
'"NEED_LC",',
'"NEED_VISUM",',
'"NEED_HEALTHCHECK"',
'from "#OWNER#"."COUNTRY_MANAGEMENT" ',
'order by',
'coutry_code, direction'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(852351656827189539)
,p_name=>'Country Rules'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::P7_ID:#ID#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil-alt.png" class="apex-edit-pencil-alt" alt=""></center>'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>574996487667229996
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(852351744011189559)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(852352163349189567)
,p_db_column_name=>'COUTRY_CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Country'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(235003938973929034)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(852352377534189568)
,p_db_column_name=>'DIRECTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Direction'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(262034404724586336)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(852352836665189569)
,p_db_column_name=>'NEED_LC'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Travel Card needed?'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(558108972921270797)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(852353215462189570)
,p_db_column_name=>'NEED_VISUM'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Visa needed?'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(558108972921270797)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(107621243912742941)
,p_db_column_name=>'NEED_HEALTHCHECK'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'Health Check needed?'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(558108972921270797)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(852354119365190095)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5749990'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'COUTRY_CODE:DIRECTION:NEED_LC:NEED_VISUM::NEED_HEALTHCHECK'
,p_sort_column_1=>'COUTRY_CODE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'DIRECTION'
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
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(128275276736635351)
,p_report_id=>wwv_flow_api.id(852354119365190095)
,p_name=>'Countries that require Health Check'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'NEED_HEALTHCHECK'
,p_operator=>'='
,p_expr=>'Yes'
,p_condition_sql=>' (case when ("NEED_HEALTHCHECK" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Yes''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#CC000033'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(865723007992886092)
,p_plug_name=>'Country Regulations'
,p_icon_css_classes=>'fa-info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'This page allows you to manage the various country regulations. For each country and direction, you can define if a visa or travel card is required during passport check using the BmBS.'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(852353582975189571)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(852351282929189538)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7'
,p_grid_new_grid=>false
);
end;
/
