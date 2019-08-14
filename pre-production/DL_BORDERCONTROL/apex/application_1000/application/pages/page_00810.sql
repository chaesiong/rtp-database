prompt --application/pages/page_00810
begin
wwv_flow_api.create_page(
 p_id=>810
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Activities'
,p_page_mode=>'NORMAL'
,p_step_title=>'Activities'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'User Activities'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(58964392495783603)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180912125511'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(60645420608739916)
,p_plug_name=>'Activities'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096075490202982)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.ID',
'      ,A.USER_ID',
'      ,case A.USER_SOURCE',
'         when 1 then',
'          PKG_MAN_USERS.GET_CN_FROM_DN(USER_ID)',
'         when 2 then',
'          U.USERNAME',
'       end as USERNAME',
'      ,case A.OPERATION',
'         when 1 then',
'          ''circle-arrow-in-east''',
'         when 2 then',
'          ''circle-arrow-out-west''',
'         when 3 then',
'          ''exception''',
'       end as OP_ICON_HELPER',
'      ,case A.OPERATION',
'         when 1 then',
'          ''green''',
'         when 2 then',
'          ''blue''',
'         when 3 then',
'          ''red''',
'       end as OP_ICON_COLOR_HELPER',
'      ,A.USER_SOURCE',
'      ,A.DML_BY as OPERATION_BY',
'      ,A.OPERATION',
'      ,A.APP_NAME',
'      ,A.COMMENTS',
'      ,A.DML_AT as OPERATION_TS',
'      ,A.INS_AT as INSERT_DATE',
'      ,A.INS_BY as INSERT_SOURCE',
'  from ACTIVITIES A',
'  left join USERS U',
'    on A.USER_ID = U.ID',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(44010040051063227)
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(60645483249739916)
,p_name=>'User Activities'
,p_max_row_count=>'1000000'
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
,p_internal_uid=>1835942088730739
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60645869921739940)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60646300912739956)
,p_db_column_name=>'USER_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'User '
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60646629544739957)
,p_db_column_name=>'USER_SOURCE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'User Source'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(60653055274747837)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60647416348739958)
,p_db_column_name=>'OPERATION'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Activity'
,p_column_html_expression=>'<span class="fa fa-#OP_ICON_HELPER#" style="color:#OP_ICON_COLOR_HELPER#"></span><span>   #OPERATION#</span>'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(64204969124702397)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60647840763739958)
,p_db_column_name=>'COMMENTS'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Comments'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60648238845739959)
,p_db_column_name=>'OPERATION_TS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SSXFF6'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60648591775739959)
,p_db_column_name=>'INSERT_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Insert Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60649040090739959)
,p_db_column_name=>'INSERT_SOURCE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Insert Source'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60663916431855394)
,p_db_column_name=>'USERNAME'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60668537991903159)
,p_db_column_name=>'OP_ICON_HELPER'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Op Icon Helper'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(60689521153979982)
,p_db_column_name=>'OP_ICON_COLOR_HELPER'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Op Icon Color Helper'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58816671029122929)
,p_db_column_name=>'APP_NAME'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51092531666308196)
,p_db_column_name=>'OPERATION_BY'
,p_display_order=>23
,p_column_identifier=>'N'
,p_column_label=>'Operation by'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(60659998176761543)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'18505'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'OPERATION_TS:OPERATION:APP_NAME:USERNAME:USER_SOURCE:COMMENTS::OPERATION_BY'
,p_sort_column_1=>'OPERATION_TS'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
end;
/
