prompt --application/pages/page_00330
begin
wwv_flow_api.create_page(
 p_id=>330
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'User Permissionmatrix'
,p_page_mode=>'NORMAL'
,p_step_title=>'User Permissionmatrix'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Permissions'
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
,p_last_upd_yyyymmddhh24miss=>'20180905172722'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59080450001609286)
,p_plug_name=>'Permissions'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096075490202982)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ogr.OBJECT_ID',
'      ,ogr.GRANT_ID',
'      ,coalesce(rogr.ROLE_ID',
'               ,rogr.ROLE_DN) as ROLE_ID_OR_DN',
'      ,''\'' || coalesce(rogr.ROLE_ID',
'                      ,rogr.ROLE_DN) || ''\'' as ORIG_ROLE_ID_OR_DN',
'      ,LISTAGG(case up.SOURCE',
'                 when 2 then',
'                  ''UM: ''',
'                 when 1 then',
'                  ''AD: ''',
'                 else',
'                  case',
'                    when (up.USERNAME is null) then',
'                     ''''',
'                    else',
'                     ''UNK: ''',
'                  end',
'               end || up.USERNAME',
'              ,'', '') WITHIN group(order by up.SOURCE desc, up.USERNAME) as USERS',
'  from OBJECT_GRANT_REL ogr',
'  left join ROLE_OBJECT_GRANT_REL rogr',
'    on ogr.ID = rogr.OBJECT_GRANT_REL_ID',
'  left join USER_ROLE_REL_POOL urrp',
'    on coalesce(rogr.ROLE_ID',
'               ,rogr.ROLE_DN) = urrp.ROLE_ID_OR_DN',
'  left join USER_POOL up',
'    on urrp.USER_ID_OR_DN = up.ID_OR_DN',
' group by ogr.OBJECT_ID',
'         ,ogr.GRANT_ID',
'         ,coalesce(rogr.ROLE_ID',
'                  ,rogr.ROLE_DN)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(59080555005609286)
,p_name=>'Permissions'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>2082138243428916
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59080953065609313)
,p_db_column_name=>'OBJECT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Object'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(63181764527769610)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59081260005609320)
,p_db_column_name=>'GRANT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Grant '
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(63181511342767875)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59081638528609322)
,p_db_column_name=>'ROLE_ID_OR_DN'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Role'
,p_column_link=>'f?p=&APP_ID.:321:&SESSION.::&DEBUG.::P321_ROLE_ID:#ORIG_ROLE_ID_OR_DN#'
,p_column_linktext=>'#ROLE_ID_OR_DN#'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(60720725395184309)
,p_rpt_show_filter_lov=>'1'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59082021024609324)
,p_db_column_name=>'USERS'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Users'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59093235923680115)
,p_db_column_name=>'ORIG_ROLE_ID_OR_DN'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Orig Role Id Or Dn'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(59082492666609719)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20841'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'OBJECT_ID:GRANT_ID:ROLE_ID_OR_DN:USERS:ORIG_ROLE_ID_OR_DN'
,p_break_on=>'ROLE_ID_OR_DN:0:0:0:0:0'
,p_break_enabled_on=>'ROLE_ID_OR_DN:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
end;
/
