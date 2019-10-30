prompt --application/pages/page_08011
begin
wwv_flow_api.create_page(
 p_id=>8011
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Children Movements'
,p_page_mode=>'NORMAL'
,p_step_title=>'Children Movements'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Children Movements'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
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
,p_last_upd_yyyymmddhh24miss=>'20190820022019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(933835177310626393)
,p_plug_name=>'Movements'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select m.mvmntid, m.MOVEMENT_DT, bd.docno,bd.SURNAME, bd.GIVENNAME,bd.SEX,PKG_COMMON.Parse_Date(bd.DOB, 1, 0, 0, 1) dob,bd.nat nationality, m.scanned_flight transport,',
'',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''200'' and mvmntid = m.mvmntid) as LN_CHILD1, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''201'' and mvmntid = m.mvmntid) as FN_CHILD1, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''210'' and mvmntid = m.mvmntid) as LN_CHILD2, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''211'' and mvmntid = m.mvmntid) as FN_CHILD2, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''220'' and mvmntid = m.mvmntid) as LN_CHILD3, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''221'' and mvmntid = m.mvmntid) as FN_CHILD3, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''230'' and mvmntid = m.mvmntid) as LN_CHILD4, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''231'' and mvmntid = m.mvmntid) as FN_CHILD4, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''240'' and mvmntid = m.mvmntid) as LN_CHILD5, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''241'' and mvmntid = m.mvmntid) as FN_CHILD5,',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''250'' and mvmntid = m.mvmntid) as LN_CHILD6, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''251'' and mvmntid = m.mvmntid) as FN_CHILD6, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''260'' and mvmntid = m.mvmntid) as LN_CHILD7, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''261'' and mvmntid = m.mvmntid) as FN_CHILD7, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''270'' and mvmntid = m.mvmntid) as LN_CHILD8, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''271'' and mvmntid = m.mvmntid) as FN_CHILD8, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''280'' and mvmntid = m.mvmntid) as LN_CHILD9, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''281'' and mvmntid = m.mvmntid) as FN_CHILD9, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''290'' and mvmntid = m.mvmntid) as LN_CHILD10, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''291'' and mvmntid = m.mvmntid) as FN_CHILD10, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''300'' and mvmntid = m.mvmntid) as LN_CHILD11, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''301'' and mvmntid = m.mvmntid) as FN_CHILD11, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''310'' and mvmntid = m.mvmntid) as LN_CHILD12, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''311'' and mvmntid = m.mvmntid) as FN_CHILD12, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''320'' and mvmntid = m.mvmntid) as LN_CHILD13, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''321'' and mvmntid = m.mvmntid) as FN_CHILD13, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''330'' and mvmntid = m.mvmntid) as LN_CHILD14, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''331'' and mvmntid = m.mvmntid) as FN_CHILD14,',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''340'' and mvmntid = m.mvmntid) as LN_CHILD15, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''341'' and mvmntid = m.mvmntid) as FN_CHILD15, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''350'' and mvmntid = m.mvmntid) as LN_CHILD16, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''351'' and mvmntid = m.mvmntid) as FN_CHILD16, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''360'' and mvmntid = m.mvmntid) as LN_CHILD17, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''361'' and mvmntid = m.mvmntid) as FN_CHILD17, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''370'' and mvmntid = m.mvmntid) as LN_CHILD18, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''371'' and mvmntid = m.mvmntid) as FN_CHILD18,',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''380'' and mvmntid = m.mvmntid) as LN_CHILD19, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''381'' and mvmntid = m.mvmntid) as FN_CHILD19,',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''390'' and mvmntid = m.mvmntid) as LN_CHILD20, ',
'(select attrvarchar from MOVEMENT_ATTR where SEQNO=''391'' and mvmntid = m.mvmntid) as FN_CHILD20 ',
'',
'FROM MOVEMENTS m, BORDERDOCUMENTS bd',
'where bd.brddocid = m.brddocid and',
'trunc(m.MOVEMENT_DT) >= trunc(to_date(:P8011_DATE, ''DD/MM/YYYY'')) and',
'trunc(m.MOVEMENT_DT) <= trunc(to_date(:P8011_DATETO, ''DD/MM/YYYY'')) and ',
'(upper(m.INS_BORDERPOST) = :P8011_SELECT_SERVER or nvl(:P8011_SELECT_SERVER, ''N/A'') = ''N/A'') and',
'(bd.nat = :P8011_NATIONALITY or nvl(:P8011_NATIONALITY, ''all'') = ''all'') and',
'(upper((scanned_flight)) like ''%'' ||upper(:P8011_TRANSPORT) ||''%'' or :P8011_TRANSPORT IS NULL) and',
'(upper((docno)) like ''%'' ||upper(:P8011_DOCNO) ||''%'' or :P8011_DOCNO IS NULL) and',
'(upper((givenname||'' ''||surname)) like ''%'' ||upper(:P8011_NAME) ||''%'' or :P8011_NAME IS NULL)',
')',
'where',
'(',
'(fn_child1 is not null or ln_child1 is not null or ',
'fn_child2 is not null or ln_child2 is not null or ',
'fn_child3 is not null or ln_child3 is not null or ',
'fn_child4 is not null or ln_child4 is not null or ',
'fn_child5 is not null or ln_child5 is not null or ',
'fn_child6 is not null or ln_child6 is not null or ',
'fn_child7 is not null or ln_child7 is not null or ',
'fn_child8 is not null or ln_child8 is not null or ',
'fn_child9 is not null or ln_child9 is not null or ',
'fn_child10 is not null or ln_child10 is not null or ',
'fn_child11 is not null or ln_child11 is not null or ',
'fn_child12 is not null or ln_child12 is not null or ',
'fn_child13 is not null or ln_child13 is not null or ',
'fn_child14 is not null or ln_child14 is not null or ',
'fn_child15 is not null or ln_child15 is not null or ',
'fn_child16 is not null or ln_child16 is not null or ',
'fn_child17 is not null or ln_child17 is not null or ',
'fn_child18 is not null or ln_child18 is not null or ',
'fn_child19 is not null or ln_child19 is not null or ',
'fn_child20 is not null or ln_child20 is not null) and',
'                                               ',
'(',
'(',
'(upper(fn_child1) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child1) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child2) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child2) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child3) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child3) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child4) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child4) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child5) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child5) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child6) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child6) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child7) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child7) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child8) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child8) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child9) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child9) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child10) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child10) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child11) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child11) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child12) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child12) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child13) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child13) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child14) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child14) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child15) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child15) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child16) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child16) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or                                               ',
'(upper(fn_child17) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child17) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child18) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child18) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child19) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child19) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(fn_child20) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' ) or',
'(upper(ln_child20) like ''%'' ||upper(:P8011_CHILDNAME) ||''%'' )                                                ',
'                                               ',
'or :P8011_CHILDNAME IS NULL)',
')                                               ',
'                                               ',
'                                               ',
'                                               ',
')',
'order by MOVEMENT_DT desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(933835590967626423)
,p_name=>'Border Control System'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_finder_drop_down=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_filter=>'N'
,p_show_sort=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:PDF'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.::P171_MVMNTID:#MVMNTID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>656480421807666880
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933848419035626534)
,p_db_column_name=>'DOCNO'
,p_display_order=>84
,p_column_identifier=>'BN'
,p_column_label=>'Passport No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933892599857634617)
,p_db_column_name=>'SURNAME'
,p_display_order=>85
,p_column_identifier=>'BO'
,p_column_label=>'Holders Surname'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933893288637634626)
,p_db_column_name=>'GIVENNAME'
,p_display_order=>86
,p_column_identifier=>'BP'
,p_column_label=>'Holders Given Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933895387015634637)
,p_db_column_name=>'LN_CHILD1'
,p_display_order=>89
,p_column_identifier=>'BS'
,p_column_label=>'Last Name (1)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933896107305634640)
,p_db_column_name=>'FN_CHILD1'
,p_display_order=>90
,p_column_identifier=>'BT'
,p_column_label=>'First Name (1)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933896812873634643)
,p_db_column_name=>'LN_CHILD2'
,p_display_order=>91
,p_column_identifier=>'BU'
,p_column_label=>'Last Name (2)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933897533866634647)
,p_db_column_name=>'FN_CHILD2'
,p_display_order=>92
,p_column_identifier=>'BV'
,p_column_label=>'First Name (2)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933898227730634650)
,p_db_column_name=>'LN_CHILD3'
,p_display_order=>93
,p_column_identifier=>'BW'
,p_column_label=>'Last Name (3)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933898891679634654)
,p_db_column_name=>'FN_CHILD3'
,p_display_order=>94
,p_column_identifier=>'BX'
,p_column_label=>'First Name (3)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933899591428634657)
,p_db_column_name=>'LN_CHILD4'
,p_display_order=>95
,p_column_identifier=>'BY'
,p_column_label=>'Last Name (4)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933900242341634660)
,p_db_column_name=>'FN_CHILD4'
,p_display_order=>96
,p_column_identifier=>'BZ'
,p_column_label=>'First Name (4)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933900951941634663)
,p_db_column_name=>'LN_CHILD5'
,p_display_order=>97
,p_column_identifier=>'CA'
,p_column_label=>'Last Name (5)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933901637719634666)
,p_db_column_name=>'FN_CHILD5'
,p_display_order=>98
,p_column_identifier=>'CB'
,p_column_label=>'First Name (5)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933902288027634668)
,p_db_column_name=>'LN_CHILD6'
,p_display_order=>99
,p_column_identifier=>'CC'
,p_column_label=>'Last Name (6)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933903003609634670)
,p_db_column_name=>'FN_CHILD6'
,p_display_order=>100
,p_column_identifier=>'CD'
,p_column_label=>'First Name (6)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933903757580634674)
,p_db_column_name=>'LN_CHILD7'
,p_display_order=>101
,p_column_identifier=>'CE'
,p_column_label=>'Last Name (7)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933904411395634677)
,p_db_column_name=>'FN_CHILD7'
,p_display_order=>102
,p_column_identifier=>'CF'
,p_column_label=>'First Name (7)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933905156876634680)
,p_db_column_name=>'LN_CHILD8'
,p_display_order=>103
,p_column_identifier=>'CG'
,p_column_label=>'Last Name (8)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933905837995634683)
,p_db_column_name=>'FN_CHILD8'
,p_display_order=>104
,p_column_identifier=>'CH'
,p_column_label=>'First Name (8)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933906486721634686)
,p_db_column_name=>'LN_CHILD9'
,p_display_order=>105
,p_column_identifier=>'CI'
,p_column_label=>'Last Name (9)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933907227847634694)
,p_db_column_name=>'FN_CHILD9'
,p_display_order=>106
,p_column_identifier=>'CJ'
,p_column_label=>'First Name (9)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933907912619634697)
,p_db_column_name=>'LN_CHILD10'
,p_display_order=>107
,p_column_identifier=>'CK'
,p_column_label=>'Last Name (10)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933908614516634700)
,p_db_column_name=>'FN_CHILD10'
,p_display_order=>108
,p_column_identifier=>'CL'
,p_column_label=>'First Name (10)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933909295431634703)
,p_db_column_name=>'LN_CHILD11'
,p_display_order=>109
,p_column_identifier=>'CM'
,p_column_label=>'Last Name (11)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933910019135634705)
,p_db_column_name=>'FN_CHILD11'
,p_display_order=>110
,p_column_identifier=>'CN'
,p_column_label=>'First Name (11)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933910741908634709)
,p_db_column_name=>'LN_CHILD12'
,p_display_order=>111
,p_column_identifier=>'CO'
,p_column_label=>'Last Name (12)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933911438581634715)
,p_db_column_name=>'FN_CHILD12'
,p_display_order=>112
,p_column_identifier=>'CP'
,p_column_label=>'First Name (12)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933912166862634719)
,p_db_column_name=>'LN_CHILD13'
,p_display_order=>113
,p_column_identifier=>'CQ'
,p_column_label=>'Last Name (13)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933912789242634727)
,p_db_column_name=>'FN_CHILD13'
,p_display_order=>114
,p_column_identifier=>'CR'
,p_column_label=>'First Name (13)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933913495101634734)
,p_db_column_name=>'LN_CHILD14'
,p_display_order=>115
,p_column_identifier=>'CS'
,p_column_label=>'Last Name (14)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933914179273634741)
,p_db_column_name=>'FN_CHILD14'
,p_display_order=>116
,p_column_identifier=>'CT'
,p_column_label=>'First Name (14)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933914871718634745)
,p_db_column_name=>'LN_CHILD15'
,p_display_order=>117
,p_column_identifier=>'CU'
,p_column_label=>'Last Name (15)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933915617382634752)
,p_db_column_name=>'FN_CHILD15'
,p_display_order=>118
,p_column_identifier=>'CV'
,p_column_label=>'First Name (15)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933916362001634757)
,p_db_column_name=>'LN_CHILD16'
,p_display_order=>119
,p_column_identifier=>'CW'
,p_column_label=>'Last Name (16)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933916928796634761)
,p_db_column_name=>'FN_CHILD16'
,p_display_order=>120
,p_column_identifier=>'CX'
,p_column_label=>'First Name (16)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933917605059634766)
,p_db_column_name=>'LN_CHILD17'
,p_display_order=>121
,p_column_identifier=>'CY'
,p_column_label=>'Last Name (17)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933918271518634769)
,p_db_column_name=>'FN_CHILD17'
,p_display_order=>122
,p_column_identifier=>'CZ'
,p_column_label=>'First Name (17)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933918986452634775)
,p_db_column_name=>'LN_CHILD18'
,p_display_order=>123
,p_column_identifier=>'DA'
,p_column_label=>'Last Name (18)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933919712030634781)
,p_db_column_name=>'FN_CHILD18'
,p_display_order=>124
,p_column_identifier=>'DB'
,p_column_label=>'First Name (18)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933920439128634786)
,p_db_column_name=>'LN_CHILD19'
,p_display_order=>125
,p_column_identifier=>'DC'
,p_column_label=>'Last Name (19)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933921073344634791)
,p_db_column_name=>'FN_CHILD19'
,p_display_order=>126
,p_column_identifier=>'DD'
,p_column_label=>'First Name (19)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933921794177634795)
,p_db_column_name=>'LN_CHILD20'
,p_display_order=>127
,p_column_identifier=>'DE'
,p_column_label=>'Last Name (20)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933922529480634799)
,p_db_column_name=>'FN_CHILD20'
,p_display_order=>128
,p_column_identifier=>'DF'
,p_column_label=>'First Name (20)'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(933938498001654293)
,p_db_column_name=>'MVMNTID'
,p_display_order=>129
,p_column_identifier=>'DG'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(934423145237523507)
,p_db_column_name=>'DOB'
,p_display_order=>130
,p_column_identifier=>'DH'
,p_column_label=>'Holders Date of Birth'
,p_column_type=>'DATE'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(951900305931837731)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>132
,p_column_identifier=>'DJ'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(236810439642363107)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(951901020151837745)
,p_db_column_name=>'TRANSPORT'
,p_display_order=>133
,p_column_identifier=>'DK'
,p_column_label=>'Transport'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(187083972088646602)
,p_db_column_name=>'MOVEMENT_DT'
,p_display_order=>143
,p_column_identifier=>'DL'
,p_column_label=>'Movement dt'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(187084068105646603)
,p_db_column_name=>'SEX'
,p_display_order=>153
,p_column_identifier=>'DM'
,p_column_label=>'Sex'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(933865933581626658)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6565108'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'DOCNO:SURNAME:GIVENNAME:NATIONALITY:TRANSPORT:DOB:LN_CHILD1:FN_CHILD1:LN_CHILD2:FN_CHILD2:LN_CHILD3:FN_CHILD3:LN_CHILD4:FN_CHILD4:LN_CHILD5:FN_CHILD5:LN_CHILD6:FN_CHILD6:LN_CHILD7:FN_CHILD7:LN_CHILD8:FN_CHILD8:LN_CHILD9:FN_CHILD9:LN_CHILD10:FN_CHILD1'
||'0:LN_CHILD11:FN_CHILD11:LN_CHILD12:FN_CHILD12:LN_CHILD13:FN_CHILD13:LN_CHILD14:FN_CHILD14:LN_CHILD15:FN_CHILD15:LN_CHILD16:FN_CHILD16:LN_CHILD17:FN_CHILD17:LN_CHILD18:FN_CHILD18:LN_CHILD19:FN_CHILD19:LN_CHILD20:FN_CHILD20::MOVEMENT_DT'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'MOVEMENTCREATED'
,p_sort_direction_2=>'DESC'
,p_break_on=>'0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(933867144657626689)
,p_plug_name=>'Travel History (Children)'
,p_icon_css_classes=>'fa-database'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this page to inspect all movements along with passport number, holders information as well as all (up to) 20 children names.',
'',
'Use the various filter options to generate reports on demand.'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(933867503327626691)
,p_plug_name=>'Server Selector'
,p_parent_plug_id=>wwv_flow_api.id(933867144657626689)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 30rem"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(951943903091160715)
,p_plug_name=>'Filter Options'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(951944212084160729)
,p_plug_name=>'Selection_Col_1'
,p_parent_plug_id=>wwv_flow_api.id(951943903091160715)
,p_region_template_options=>'t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(951949010919160752)
,p_plug_name=>'Selection_Col_2'
,p_parent_plug_id=>wwv_flow_api.id(951943903091160715)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(951944651537160730)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(951944212084160729)
,p_button_name=>'BTN_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show Report'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(933869265015626778)
,p_branch_action=>'f?p=&APP_ID.:8011:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(842354300176477328)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(933867879497626692)
,p_name=>'P8011_SELECT_SERVER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(933867503327626691)
,p_item_default=>'&AI_BORDERPOST_NAME.'
,p_prompt=>'Border Post:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(ALL POSTS)'
,p_lov_null_value=>'N/A'
,p_cHeight=>1
,p_tag_attributes=>'style="width:22rem; text-align: left"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934016588743259493)
,p_name=>'P8011_CHILDNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(951949010919160752)
,p_prompt=>'Child Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(951945008541160737)
,p_name=>'P8011_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(951944212084160729)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Date from:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_tag_css_classes=>'autovalidatedatepicker datetypepast'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(951945381781160743)
,p_name=>'P8011_DATETO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(951949010919160752)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Date to:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_tag_css_classes=>'autovalidatedatepicker datetypepast'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(951947051664160747)
,p_name=>'P8011_NATIONALITY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(951944212084160729)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ICAO_DOC_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'all'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(951947454689160748)
,p_name=>'P8011_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(951949010919160752)
,p_prompt=>'Parent Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(951947857260160749)
,p_name=>'P8011_DOCNO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(951944212084160729)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(951952513319160766)
,p_name=>'P8011_TRANSPORT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(951944212084160729)
,p_prompt=>'Transport:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(933868302564626765)
,p_name=>'DA_PRESELECT_SERVER'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(933868720645626772)
,p_event_id=>wwv_flow_api.id(933868302564626765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P8011_SELECT_SERVER := nvl(:P8011_SELECT_SERVER, :AI_BORDERPOST_NAME);'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(951980999482343250)
,p_name=>'DA_ShowReport'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(951944651537160730)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(951981455514343260)
,p_event_id=>wwv_flow_api.id(951980999482343250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P8011_CHILDNAME,P8011_DATE,P8011_DATETO,P8011_DOCNO,P8011_NAME,P8011_NATIONALITY,P8011_TRANSPORT,P8011_SELECT_SERVER'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(951981853288345668)
,p_event_id=>wwv_flow_api.id(951980999482343250)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(933835177310626393)
,p_stop_execution_on_error=>'Y'
);
end;
/
