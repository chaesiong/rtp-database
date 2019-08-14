prompt --application/pages/page_00071
begin
wwv_flow_api.create_page(
 p_id=>71
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Transport Unit Data'
,p_page_mode=>'NORMAL'
,p_step_title=>'Transport Unit Data'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180730111215'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(566496472313099806)
,p_plug_name=>'Transport Unit Data'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(561108225941663683)
,p_plug_name=>'Region Left'
,p_parent_plug_id=>wwv_flow_api.id(566496472313099806)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(561108259399663684)
,p_plug_name=>'Region Right'
,p_parent_plug_id=>wwv_flow_api.id(566496472313099806)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(583792023761890203)
,p_plug_name=>'Passengers'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'(:P71_TRNSPRTUNITID is not null)'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(583785721198881040)
,p_plug_name=>'Transport Unit Passenger Report'
,p_parent_plug_id=>wwv_flow_api.id(583792023761890203)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select d.docno, d.doctype, d.issuectry, d.nat, d.sex, to_date(d.dob, ''yymmdd'')  as "dob", d.givenname, d.surname, m.pssngrstatus, m.RNKDSGNTDID, m.CREATED as "MOVEMENTCREATED"',
' --, tu.* ',
'from movements m',
'--inner join transportunits tu on m.trnsprtunitid = tu.trnsprtunitid',
'inner join borderdocuments d on d.brddocid = m.brddocid',
'where m.trnsprtunitid = :P71_TRNSPRTUNITID and m.exitflg < 2;',
'                                                             '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(583786048956881041)
,p_name=>'Transport Unit Report'
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
,p_internal_uid=>41360696775752493
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583787641157881043)
,p_db_column_name=>'PSSNGRSTATUS'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Passenger Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(583162488425998144)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583788034391881043)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583788422536881044)
,p_db_column_name=>'DOCNO'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Document Number'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583788778013881044)
,p_db_column_name=>'ISSUECTRY'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Issue Country'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583789245696881044)
,p_db_column_name=>'NAT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583789623732881044)
,p_db_column_name=>'SEX'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(577782878906762560)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583790047264881045)
,p_db_column_name=>'GIVENNAME'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Given Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583786119796881042)
,p_db_column_name=>'SURNAME'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Surname'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583786359160881042)
,p_db_column_name=>'RNKDSGNTDID'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Rank Designated'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(583210569027105317)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583786769832881043)
,p_db_column_name=>'MOVEMENTCREATED'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583787237022881043)
,p_db_column_name=>'dob'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Date Of Birth'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-RR'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(583790438497881045)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'413651'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'MOVEMENTCREATED:PSSNGRSTATUS:RNKDSGNTDID:DOCNO:DOCTYPE:ISSUECTRY:NAT:GIVENNAME:SURNAME:SEX:dob:'
,p_sort_column_1=>'PSSNGRSTATUS'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'RNKDSGNTDID'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'MOVEMENTCREATED'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'PSSNGRSTATUS:0:0:0:0:0'
,p_break_enabled_on=>'PSSNGRSTATUS:0:0:0:0:0'
,p_count_columns_on_break=>'PSSNGRSTATUS:dob'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(583793233503930008)
,p_plug_name=>'Offloads'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  offloadcount number := 0;',
'begin',
'  ',
'if(:P71_TRNSPRTUNITID is not null) then',
'  select count(*) ',
'  into offloadcount',
'  from movements ',
'  where TRNSPRTUNITID = :P71_TRNSPRTUNITID and exitflg = 2;',
'end if;',
'  return offloadcount != 0;',
'end;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(583793484199933727)
,p_plug_name=>'Transport Unit Offloads'
,p_parent_plug_id=>wwv_flow_api.id(583793233503930008)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select d.docno, d.doctype, d.issuectry, d.nat, d.sex, to_date(d.dob, ''yymmdd'')  as "dob", d.givenname, d.surname, m.pssngrstatus, m.RNKDSGNTDID, o.CREATED as "OFFLOADDATE"',
' --, tu.* ',
'from movements m',
'--inner join transportunits tu on m.trnsprtunitid = tu.trnsprtunitid',
'inner join borderdocuments d on d.brddocid = m.brddocid',
'inner join offloads o on o.mvmntid = m.mvmntid',
'where m.trnsprtunitid = :P71_TRNSPRTUNITID and m.exitflg = 2;',
'                                                             '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(583793789716933727)
,p_name=>'Transport Unit Report'
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
,p_internal_uid=>41368437535805179
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583795508222933729)
,p_db_column_name=>'PSSNGRSTATUS'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Passenger Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(583162488425998144)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583795887215933729)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583796270100933729)
,p_db_column_name=>'DOCNO'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Document Number'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583796711687933729)
,p_db_column_name=>'ISSUECTRY'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Issue Country'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583797123994933730)
,p_db_column_name=>'NAT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583797455195933730)
,p_db_column_name=>'SEX'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(577782878906762560)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583797922120933730)
,p_db_column_name=>'GIVENNAME'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Given Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583793868078933728)
,p_db_column_name=>'SURNAME'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Surname'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583794284954933728)
,p_db_column_name=>'RNKDSGNTDID'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Rank Designated'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(583210569027105317)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583795053459933728)
,p_db_column_name=>'dob'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Date Of Birth'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-RR'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583799259703944825)
,p_db_column_name=>'OFFLOADDATE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Offloaddate'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(583798319801933730)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'413730'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'DOCNO:DOCTYPE:ISSUECTRY:NAT:GIVENNAME:SURNAME:SEX:PSSNGRSTATUS:RNKDSGNTDID:dob:OFFLOADDATE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(566496991460099807)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P71_TRNSPRTUNITID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(566497187698099807)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(566496922895099807)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P71_TRNSPRTUNITID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(561108393029663685)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'DUPLICATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Duplicate'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'(:P71_TRNSPRTUNITID is not null)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-copy'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(566497064436099807)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P71_TRNSPRTUNITID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(566562578640550846)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'OPEN_TRANSPORT_UNIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Open Transport Unit'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'(:P71_TRNSPRTUNITID is not null) and (:P71_TRNSPRTSTATUS = 0)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-folder-open-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(561108071211663682)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'CLOSE_TRANSPORT_UNIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close Transport Unit'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'(:P71_TRNSPRTUNITID is not null) and (:P71_TRNSPRTSTATUS = 1)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-folder-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(584031082129170702)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'REOPEN_TRANSPORT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reopen Transport'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(''Please confirm to REOPEN Transport Unit.'',''REOPEN_TRANSPORT'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'(:P71_TRNSPRTUNITID is not null) and (:P71_TRNSPRTSTATUS = 2) and :P71_HAS_ROLLBACK_GRANT > 0'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-folder-open-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(584030788948166296)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(566496472313099806)
,p_button_name=>'OFFLOAD_TRANSPORT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Offload Transport'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(''Do you really want to OFFLOAD ALL PASSENGERS?'',''OFFLOAD_TRANSPORT'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'(:P71_TRNSPRTUNITID is not null) and (:P71_TRNSPRTSTATUS = 2) and (:P71_DIRECTIONFLG = 0) and (:P71_HAS_ROLLBACK_GRANT > 0)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(566498764266099812)
,p_branch_action=>'f?p=&APP_ID.:70:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566499213960099813)
,p_name=>'P71_TRNSPRTUNITID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(566496472313099806)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Trnsprtunitid'
,p_source=>'TRNSPRTUNITID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566499650172099814)
,p_name=>'P71_DIRECTIONFLG'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(561108225941663683)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_prompt=>'Direction'
,p_source=>'DIRECTIONFLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIRECTION'
,p_lov=>'.'||wwv_flow_api.id(566472220048858865)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566500044466099816)
,p_name=>'P71_TRNSPRTSTATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(561108225941663683)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Status'
,p_source=>'TRNSPRTSTATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_TRANSPORTSTATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as d,',
'       ID as r',
'  from TRANSPORTSTATUS',
' where ACTIVE > 0',
' order by 1'))
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566500381310099817)
,p_name=>'P71_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(561108225941663683)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566500806640099818)
,p_name=>'P71_TRNSPRTSTATUS2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(561108225941663683)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flight Status'
,p_source=>'TRNSPRTSTATUS2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TRANSPORTSTATUS2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as d,',
'       ID as r',
'  from TRANSPORTSTATUS2',
' order by 2;'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566501223727099819)
,p_name=>'P71_TRNSPRTDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(561108225941663683)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return sysdate;'
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Transport Date and Time'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'TRNSPRTDATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566501600455099820)
,p_name=>'P71_NUMOFPASSENGERNATIVE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(561108259399663684)
,p_use_cache_before_default=>'NO'
,p_prompt=>'No. of Passengers'
,p_source=>'NUMOFPASSENGERNATIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566501994001099821)
,p_name=>'P71_NUMOFPASSENGERFOREIGN'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(561108259399663684)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'No. of Foreign Passengers'
,p_source=>'NUMOFPASSENGERFOREIGN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566502371958099822)
,p_name=>'P71_NUMOFCREWNATIVE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(561108259399663684)
,p_use_cache_before_default=>'NO'
,p_prompt=>'No. of Crew'
,p_source=>'NUMOFCREWNATIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566502851215099823)
,p_name=>'P71_NUMOFCREWFOREIGN'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(561108259399663684)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'No. of Foreign Crew'
,p_source=>'NUMOFCREWFOREIGN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>32
,p_cMaxlength=>255
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566523781292199563)
,p_name=>'P71_TOTALCREW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(561108259399663684)
,p_prompt=>'Total No. of Crews'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="text-align:right;"'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566527159973204548)
,p_name=>'P71_TOTALPASSENGERS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(561108259399663684)
,p_prompt=>'Total No. of Passengers'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="text-align:right;"'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566527696097210226)
,p_name=>'P71_TOTALALL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(561108259399663684)
,p_prompt=>'Total No. of All'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="text-align:right;"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566560202254467763)
,p_name=>'P71_TRNSPRTMODEID'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(566496472313099806)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_source=>'TRNSPRTMODEID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566572016009630576)
,p_name=>'P71_FLGHTID'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(561108225941663683)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flight'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.FLGHTID',
'FROM TRANSPORTUNITS t',
'WHERE t.TRNSPRTUNITID = :P71_TRNSPRTUNITID;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  f.flightnum || '' (''|| o.IATA_FAA_CODE || '' -> '' || d.IATA_FAA_CODE || '')'' as d, f.flghtid as r from flights f',
'join airports o on o.id = f.originairportid',
'join airports d on d.id = f.destinairportid',
'where f.active > 0',
'and f.DIRECTIONFLG = :P71_DIRECTIONFLG',
'order by f.flightnum;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P71_DIRECTIONFLG'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(566572507729638772)
,p_name=>'P71_FLGHTTYPEID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(561108225941663683)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Aircraft Type'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.FLGHTTYPE',
'FROM TRANSPORTUNITS t',
'WHERE t.TRNSPRTUNITID = :P71_TRNSPRTUNITID;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FLIGHTTYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as d,',
'       FLGHTTYPEID as r',
'  from FLIGHTTYPES',
' where ACTIVE > 0',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(583814142769252784)
,p_name=>'P71_CURRENT_PSSNGR_SUM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(566496472313099806)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(584021741085126944)
,p_name=>'P71_HAS_ROLLBACK_GRANT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(566496472313099806)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if( PKG_APEX_AUTHORIZATION.HAS_GRANT(''BC_ROLLBACK_TRANSPORT_UNIT'') ) then',
'return 1;',
'else',
'return 0;',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(583814378751262021)
,p_computation_sequence=>10
,p_computation_item=>'P71_CURRENT_PSSNGR_SUM'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'from Movements m',
'where m.TRNSPRTUNITID = :P71_TRNSPRTUNITID ',
' --and m.PSSNGRSTATUS is not null ',
'and m.EXITFLG < 2'))
,p_compute_when=>'CLOSE_TRANSPORT_UNIT'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(582681108879198603)
,p_validation_name=>'P71_TOTALPASSENGERS'
,p_validation_sequence=>5
,p_validation=>'NVL(:P71_TOTALPASSENGERS,0) > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'#LABEL# must be greater than 0'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(566527159973204548)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(582680797385191191)
,p_validation_name=>'P71_TOTALCREW'
,p_validation_sequence=>10
,p_validation=>'NVL(:P71_TOTALCREW,0) > 0'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'#LABEL# must be greater then 0'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(566523781292199563)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(583814667659289935)
,p_validation_name=>'P71_TOTALALL'
,p_validation_sequence=>20
,p_validation=>':P71_CURRENT_PSSNGR_SUM = :P71_TOTALALL'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Transport Unit can not be closed. Current Passenger & Crew count does not match the total count.'
,p_always_execute=>'Y'
,p_validation_condition=>'CLOSE_TRANSPORT_UNIT'
,p_validation_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(583814142769252784)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(584733861342920827)
,p_validation_name=>'Open 4hrs before departure'
,p_validation_sequence=>30
,p_validation=>'sysdate > (to_date(:P71_TRNSPRTDATE, ''dd-mon-yyyy hh24:mi'') - 4/24)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Transport can be opened only 4 hours before departure'
,p_always_execute=>'N'
,p_validation_condition=>':P71_DIRECTIONFLG = 0 and :REQUEST = ''OPEN_TRANSPORT_UNIT'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(584734360415991340)
,p_validation_name=>'Open 12 hrs before arrival'
,p_validation_sequence=>40
,p_validation=>'sysdate > (to_date(:P71_TRNSPRTDATE, ''dd-mon-yyyy hh24:mi'') - 12/24)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Transport can be opened only 12 hours before arrival'
,p_always_execute=>'N'
,p_validation_condition=>':P71_DIRECTIONFLG = 1 and :REQUEST = ''OPEN_TRANSPORT_UNIT'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(584734926032002849)
,p_validation_name=>'Reopen only 12 hrs after transport date'
,p_validation_sequence=>50
,p_validation=>'sysdate < (to_date(:P71_TRNSPRTDATE, ''dd-mon-yyyy hh24:mi'') + 12/24)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Transport can be reopened only 12 hours after regular transport date'
,p_always_execute=>'Y'
,p_validation_condition=>':REQUEST = ''REOPEN_TRANSPORT'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(585244513223881139)
,p_validation_name=>'Offload only 12 hrs after transport date'
,p_validation_sequence=>60
,p_validation=>'sysdate < (to_date(:P71_TRNSPRTDATE, ''dd-mon-yyyy hh24:mi'') + 12/24)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Transport can be offloaded only 12 hours after regular transport date'
,p_always_execute=>'Y'
,p_validation_condition=>':REQUEST = ''OFFLOAD_TRANSPORT'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_only_for_changed_rows=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(566541832234263636)
,p_name=>'CalcTotals'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P71_NUMOFPASSENGERNATIVE,P71_NUMOFPASSENGERFOREIGN,P71_NUMOFCREWNATIVE,P71_NUMOFCREWFOREIGN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(566542217960263639)
,p_event_id=>wwv_flow_api.id(566541832234263636)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P71_TOTALPASSENGERS := NVL(:P71_NUMOFPASSENGERNATIVE, 0) + NVL(:P71_NUMOFPASSENGERFOREIGN,0);',
':P71_TOTALCREW := NVL(:P71_NUMOFCREWNATIVE,0)+ NVL(:P71_NUMOFCREWFOREIGN,0);',
':P71_TOTALALL := :P71_TOTALCREW + :P71_TOTALPASSENGERS;'))
,p_attribute_02=>'P71_NUMOFPASSENGERNATIVE,P71_NUMOFPASSENGERFOREIGN,P71_NUMOFCREWNATIVE,P71_NUMOFCREWFOREIGN'
,p_attribute_03=>'P71_TOTALALL,P71_TOTALCREW,P71_TOTALPASSENGERS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(566506398445099832)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get PK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P71_TRNSPRTUNITID := sys_guid();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(566496922895099807)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(566506807625099833)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of TRANSPORTUNITS'
,p_attribute_02=>'TRANSPORTUNITS'
,p_attribute_03=>'P71_TRNSPRTUNITID'
,p_attribute_04=>'TRNSPRTUNITID'
,p_attribute_09=>'P71_TRNSPRTUNITID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''DELETE'',''SAVE'',''CREATE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(566635575199442597)
,p_process_sequence=>31
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FixRowProcessing (Set Raw Values)'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE TRANSPORTUNITS t',
'SET t.FLGHTID = :P71_FLGHTID',
', t.FLGHTTYPE = :P71_FLGHTTYPEID ',
'WHERE t.TRNSPRTUNITID = :P71_TRNSPRTUNITID;'))
,p_process_when=>':REQUEST in (''CREATE'',''SAVE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(566587670875768199)
,p_process_sequence=>32
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_OPEN_TRNSPRTUNIT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update TRANSPORTUNITS',
'set TRNSPRTSTATUS = 1',
'where TRNSPRTUNITID = :P71_TRNSPRTUNITID;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'OPEN_TRANSPORT_UNIT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(566588238658771794)
,p_process_sequence=>34
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CLOSE_TRNSPRTUNIT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update TRANSPORTUNITS',
'set TRNSPRTSTATUS = 2',
'where TRNSPRTUNITID = :P71_TRNSPRTUNITID;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CLOSE_TRANSPORT_UNIT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(566625393253140486)
,p_process_sequence=>36
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_DUPLICATE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  olddate date;',
'  newdate date;',
' ',
'begin',
'  olddate := to_date(:P71_TRNSPRTDATE, ''dd-mon-yyyy hh24:mi'');',
'  newdate :=  trunc(sysdate) + (olddate - TRUNC(olddate) ); ',
'  ',
'  INSERT INTO TRANSPORTUNITS ( DIRECTIONFLG, TRNSPRTDATE, TRNSPRTMODEID, TRNSPRTSTATUS, NAME, TRNSPRTSTATUS2,  FLGHTID, FLGHTTYPE, NUMOFPASSENGERNATIVE, NUMOFPASSENGERFOREIGN, NUMOFCREWNATIVE, NUMOFCREWFOREIGN )',
'  VALUES( :P71_DIRECTIONFLG, newdate, :P71_TRNSPRTMODEID, 0, :P71_NAME, :P71_TRNSPRTSTATUS2, :P71_FLGHTID, :P71_FLGHTTYPEID, :P71_NUMOFPASSENGERNATIVE, :P71_NUMOFPASSENGERFOREIGN, :P71_NUMOFCREWNATIVE, :P71_NUMOFCREWFOREIGN)',
'  RETURNING TRNSPRTUNITID into :P71_TRNSPRTUNITID;',
'  ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DUPLICATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(585501955830024603)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CREATE_PAIRED_FLIGHT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  ret number;',
'  ',
'begin',
'  ret := DL_MALE_BC.CREATE_PAIRED_TRANSPORT(:P71_TRNSPRTUNITID);',
'    ',
'',
'end;',
'',
'  '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''CREATE'', ''DUPLICATE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(584019645750116619)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_REOPEN_TRANSPORT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE TRANSPORTUNITS',
'SET TRNSPRTSTATUS = 1',
'WHERE TRNSPRTUNITID = :P71_TRNSPRTUNITID;'))
,p_process_error_message=>'#ERROR#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'REOPEN_TRANSPORT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Successfully reopened flight'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(584020703468120591)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_OFFLOAD_TRANSPORT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  success number;',
'begin',
'  success := DL_MALE_BC.OFFLOAD_TRNSPRTUNIT(:P71_TRNSPRTUNITID, 4, ''Offload Transport Unit'' ,:AI_TERMINAL_IP);',
'  if(success = 0) then',
'    raise NO_DATA_FOUND;',
'  end if;',
'end;'))
,p_process_error_message=>'Failure while offload. No Passenger was offloaded'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'OFFLOAD_TRANSPORT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Successfully offloaded passengers.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(566507235789099833)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(566497064436099807)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(566627848298347627)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'AutomatedRowFetch'
,p_attribute_02=>'TRANSPORTUNITS'
,p_attribute_03=>'P71_TRNSPRTUNITID'
,p_attribute_04=>'TRNSPRTUNITID'
);
end;
/
