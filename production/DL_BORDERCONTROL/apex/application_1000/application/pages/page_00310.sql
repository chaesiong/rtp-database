prompt --application/pages/page_00310
begin
wwv_flow_api.create_page(
 p_id=>310
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Users'
,p_page_mode=>'NORMAL'
,p_step_title=>'Users'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Users'
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
,p_last_upd_yyyymmddhh24miss=>'20180924120146'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63136252592240942)
,p_plug_name=>'Users'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096075490202982)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.ID',
'      ,t0.USERNAME',
'      ,t0.FIRST_NAME',
'      ,t0.LAST_NAME',
'      ,t0.MAIL_ADDRESS',
'      ,t0.PHONE_NUMBER',
'      ,t1.LAST_LOGIN',
'      ,t0.STATE',
'      ,t0.INS_AT as INSERT_DATE',
'      ,t0.INS_BY as INSERT_SOURCE',
'      ,cast(t0.DML_AT as date) as UPDATE_DATE',
'      ,t0.DML_BY as UPDATE_SOURCE',
'  from USERS t0',
' inner join USERS$SGD t1',
'    on t0.ID = t1.ID',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(63136285867240942)
,p_name=>'Users'
,p_max_row_count=>'1000000'
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
,p_detail_link=>'f?p=&APP_ID.:311:&SESSION.::&DEBUG.::P311_ID,P311_USERNAME:#ID#,#USERNAME#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil-alt.png" class="apex-edit-pencil-alt" alt="">'
,p_detail_link_auth_scheme=>wwv_flow_api.id(59023663688969588)
,p_owner=>'ADMIN'
,p_internal_uid=>2515720864576593
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63136760503240949)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63137129674240953)
,p_db_column_name=>'USERNAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63137483191240954)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63137867575240956)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63138312900240957)
,p_db_column_name=>'MAIL_ADDRESS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Mail Address'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41748652299075687)
,p_db_column_name=>'PHONE_NUMBER'
,p_display_order=>15
,p_column_identifier=>'L'
,p_column_label=>'Phone Number'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63138677113240959)
,p_db_column_name=>'LAST_LOGIN'
,p_display_order=>25
,p_column_identifier=>'F'
,p_column_label=>'Last Login'
,p_column_type=>'DATE'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63139071971240960)
,p_db_column_name=>'STATE'
,p_display_order=>35
,p_column_identifier=>'G'
,p_column_label=>'State'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(64204814375699790)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63139547578240963)
,p_db_column_name=>'INSERT_DATE'
,p_display_order=>45
,p_column_identifier=>'H'
,p_column_label=>'Insert Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63139892527240964)
,p_db_column_name=>'INSERT_SOURCE'
,p_display_order=>55
,p_column_identifier=>'I'
,p_column_label=>'Insert Source'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63140348116240966)
,p_db_column_name=>'UPDATE_DATE'
,p_display_order=>65
,p_column_identifier=>'J'
,p_column_label=>'Update Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(63140733845240967)
,p_db_column_name=>'UPDATE_SOURCE'
,p_display_order=>75
,p_column_identifier=>'K'
,p_column_label=>'Update Source'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(63141119131245782)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'25206'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID:USERNAME:FIRST_NAME:LAST_NAME:MAIL_ADDRESS:LAST_LOGIN:STATE:INSERT_DATE:INSERT_SOURCE:UPDATE_DATE:UPDATE_SOURCE:PHONE_NUMBER'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63717668445429614)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(63136252592240942)
,p_button_name=>'NEW_USER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New User'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:311:&SESSION.::&DEBUG.:311::'
,p_icon_css_classes=>'fa-plus-circle'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
end;
/
