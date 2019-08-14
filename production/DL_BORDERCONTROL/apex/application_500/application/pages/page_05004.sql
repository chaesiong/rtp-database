prompt --application/pages/page_05004
begin
wwv_flow_api.create_page(
 p_id=>5004
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Passport -> Blacklist '
,p_page_mode=>'NORMAL'
,p_step_title=>'Passport -> Blacklist '
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Passport -> Blacklist '
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-content {',
'    padding-bottom: 2rem !important;',
'}',
'',
'.t-Body-topButton {',
'    display: none !important;',
'}',
'',
'td {',
'	    background: linear-gradient(transparent, transparent, rgba(0, 0, 0, 0.12));',
'}'))
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
,p_last_upd_yyyymmddhh24miss=>'20180730111434'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(941194472615145740)
,p_plug_name=>'Passports'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'''putonblacklist'' PUT_ON_BLACKLIST,',
'--PKG_BORDERDOCUMENTS.Is_On_Blacklist(q.DOCNO, q.ISSUECTRY, '''', q.SURNAME, q.GIVENNAME,  NULL, q.DOB, 0) ON_BLACKLIST,',
'q.BRDDOCID,',
'q.DOCNO DocNo,',
'q.sex,',
'q.NAt Nat,',
'q.givenname "Given Name",',
'q.surname "Surname",',
'PKG_COMMON.Parse_Date(dob, 1, 0, 0, 1) dob, -- to_date(q.dob, ''RRMMDD'') dob,',
'q.expirydate,',
'q.doctype',
'',
'from',
'V_BORDEROCUMENTS q ',
'--where PKG_BORDERDOCUMENTS.Is_On_Blacklist(q.DOCNO, q.ISSUECTRY, '''', q.SURNAME, q.GIVENNAME,  NULL, q.DOB, 0) = 0'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(941194891600145746)
,p_name=>'Border Control System'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_finder_drop_down=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_sort=>'N'
,p_show_control_break=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.::P171_MVMNTID:#MVMNTID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>663839722440186203
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941207784010145804)
,p_db_column_name=>'DOCNO'
,p_display_order=>84
,p_column_identifier=>'BN'
,p_column_label=>'Document No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941208569926145807)
,p_db_column_name=>'Given Name'
,p_display_order=>86
,p_column_identifier=>'BP'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941208989329145808)
,p_db_column_name=>'Surname'
,p_display_order=>87
,p_column_identifier=>'BQ'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941218223066145843)
,p_db_column_name=>'DOB'
,p_display_order=>110
,p_column_identifier=>'CN'
,p_column_label=>'Date of Birth'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941219458888145848)
,p_db_column_name=>'EXPIRYDATE'
,p_display_order=>114
,p_column_identifier=>'CR'
,p_column_label=>'Expiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941220191302145851)
,p_db_column_name=>'NAT'
,p_display_order=>116
,p_column_identifier=>'CT'
,p_column_label=>'Issue Country Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941223741970145863)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>125
,p_column_identifier=>'DC'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941224929083145868)
,p_db_column_name=>'PUT_ON_BLACKLIST'
,p_display_order=>128
,p_column_identifier=>'DF'
,p_column_label=>'Add to Blacklist'
,p_column_link=>'f?p=&APP_ID.:5001:&SESSION.::&DEBUG.:5001:P5001_PREFETCHID:#BRDDOCID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil-alt.png" class="apex-edit-pencil-alt" alt="">'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch" style="display:#PUT_ON_BLACKLIST#"'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_security_scheme=>wwv_flow_api.id(944242548244030831)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(941271783985238037)
,p_db_column_name=>'BRDDOCID'
,p_display_order=>129
,p_column_identifier=>'DG'
,p_column_label=>'Brddocid'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(191038728055524416)
,p_db_column_name=>'SEX'
,p_display_order=>139
,p_column_identifier=>'DH'
,p_column_label=>'Sex'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(941230471414145886)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6638754'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'PUT_ON_BLACKLIST:DOCNO:Surname:Given Name:DOB:EXPIRYDATE'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'MOVEMENTCREATED'
,p_sort_direction_2=>'DESC'
,p_break_on=>'0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(941231800583145900)
,p_plug_name=>'Passports'
,p_icon_css_classes=>'fa-database'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'Use this page to add passports to the blacklist. Only non-blacklisted passports are shown.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(941234019243145930)
,p_branch_action=>'f?p=&APP_ID.:5004:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(842354300176477328)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(941233060825145922)
,p_name=>'DA_PRESELECT_SERVER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941233566194145925)
,p_event_id=>wwv_flow_api.id(941233060825145922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P5004_SELECT_SERVER := nvl(:P5004_SELECT_SERVER, :AI_BORDERPOST_NAME);'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
