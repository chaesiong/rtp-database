prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'SEARCH_BORDERDOCUMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Find document for manual processing'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'SEARCH_BORDERDOCUMENT'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_css_file_urls=>'#APP_IMAGES#Layout.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'768'
,p_dialog_width=>'1280'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180730093219'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(854690357202941938)
,p_plug_name=>'SEARCH_BORDERDOCUMENT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select '''' as link, docs.*, decode(length(trim(translate(docs.dob, ''0123456789X'', '' ''))), null, PKG_COMMON.Parse_Date(docs.dob, 1, 0, 0, 1)) as dob_date from v_borderocuments docs where ',
'(ISSUECTRY = v(''DG_ENTERMANUAL_ISSUINGCODE'') OR v(''DG_ENTERMANUAL_ISSUINGCODE'') IS NULL)',
'AND',
'(sex = v(''DG_ENTERMANUAL_GENDER'') OR v(''DG_ENTERMANUAL_GENDER'') IS NULL)',
'AND ',
'(doctype = v(''DG_ENTERMANUAL_DOCTYPE'') OR v(''DG_ENTERMANUAL_DOCTYPE'') IS NULL)',
'AND ',
'(expirydate = v(''DG_ENTERMANUAL_EXPIRYDATE'') OR v(''DG_ENTERMANUAL_EXPIRYDATE'') IS NULL)',
'AND',
'(DOCNO = v(''DG_ENTERMANUAL_PASSNUMBER'') OR v(''DG_ENTERMANUAL_PASSNUMBER'') IS NULL)',
'AND ',
'(dob = to_char(to_date(:DG_ENTERMANUAL_DOB, ''DD/MM/YYYY''), ''YYMMDD'') OR :DG_ENTERMANUAL_DOB IS NULL)',
'AND',
'(SURNAME like v(''DG_ENTERMANUAL_LASTNAME'') || ''%'' OR v(''DG_ENTERMANUAL_LASTNAME'') IS NULL)',
'AND',
'(GIVENNAME like v(''DG_ENTERMANUAL_FIRSTNAME'') || ''%'' OR v(''DG_ENTERMANUAL_FIRSTNAME'') IS NULL)',
'order by created desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(854690390271941938)
,p_name=>'SEARCH_BORDERDOCUMENT'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_max_rows_per_page=>'15'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>577335221111982395
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854690777850941984)
,p_db_column_name=>'BRDDOCID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Brddocid'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854691145281941993)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854691562680941994)
,p_db_column_name=>'DOCNO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Document No'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854691961962941996)
,p_db_column_name=>'ISSUECTRY'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Issuing Country'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(235003938973929034)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854692295710941999)
,p_db_column_name=>'NAT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Nat'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854692708094942001)
,p_db_column_name=>'DOB'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Date of Birth'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854693132841942003)
,p_db_column_name=>'SEX'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(577782878906762560)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854693521662942005)
,p_db_column_name=>'EXPIRYDATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Expiry Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854693914114942006)
,p_db_column_name=>'GIVENNAME'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854694278066942008)
,p_db_column_name=>'SURNAME'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854694730455942009)
,p_db_column_name=>'OPTIONALDATA'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Optionaldata'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854695084973942011)
,p_db_column_name=>'AFISID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Afisid'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854695516015942013)
,p_db_column_name=>'CREATED'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854695908321942015)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854696308664942020)
,p_db_column_name=>'WORKSTATION_NAME'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Workstation Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854696768820942022)
,p_db_column_name=>'SERVER_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Server Id'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854697139789942023)
,p_db_column_name=>'OFFICER_OBSERVATION'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Officer Observation'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854704383990177799)
,p_db_column_name=>'PASS_VISUAL_FACE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Pass Visual Face'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854705101560177807)
,p_db_column_name=>'PASS_ICAO_FACE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Pass Icao Face'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854705782515177811)
,p_db_column_name=>'PASS_VISUALPAGE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Pass Visualpage'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854706494690177815)
,p_db_column_name=>'PASS_UVPAGE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Pass Uvpage'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854707215570177818)
,p_db_column_name=>'PASS_IRPAGE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Pass Irpage'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854707947789177822)
,p_db_column_name=>'PASS_DG3_0'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Pass Dg3 0'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854708543741177904)
,p_db_column_name=>'PASS_DG3_1'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Pass Dg3 1'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(854709214844177908)
,p_db_column_name=>'DOB_DATE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Date of Birth'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(856958651901324192)
,p_db_column_name=>'LINK'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Link'
,p_column_link=>'javascript:$.event.trigger(''DA_EVT_TAKEOVERDATA'',''#BRDDOCID#'');'
,p_column_linktext=>'Take over Passport #DOCNO#'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(854700238223955600)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5773451'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'LINK:DOCTYPE:DOCNO:ISSUECTRY:DOB_DATE:SEX:EXPIRYDATE:GIVENNAME:SURNAME:CREATED:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855585551537525830)
,p_name=>'P3_BRDDOCID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855706085453394298)
,p_name=>'P3_COUNTRY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855706372386394303)
,p_name=>'P3_GENDER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855706798500394305)
,p_name=>'P3_SURNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855707210222394306)
,p_name=>'P3_GIVENNAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855707580587394307)
,p_name=>'P3_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855708022039394308)
,p_name=>'P3_DOB'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855708382418394309)
,p_name=>'P3_DOCNO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855708812410394310)
,p_name=>'P3_EXPIRY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(854690357202941938)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(855633282887730148)
,p_name=>'DA_ONCLOSE'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DA_EVT_TAKEOVERDATA'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(855658688283248399)
,p_event_id=>wwv_flow_api.id(855633282887730148)
,p_event_result=>'TRUE'
,p_action_sequence=>8
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$s(''P3_BRDDOCID'', this.data);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(855650745540228929)
,p_event_id=>wwv_flow_api.id(855633282887730148)
,p_event_result=>'TRUE'
,p_action_sequence=>9
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select sex, to_char(EXPIRYDATE, ''DD/MM/YYYY''), to_char(to_date(dob,''RRMMDD''), ''DD/MM/YYYY''), ISSUECTRY, docno, surname, givenname, doctype into :DG_ENTERMANUAL_GENDER, :DG_ENTERMANUAL_EXPIRYDATE, :DG_ENTERMANUAL_DOB, :DG_ENTERMANUAL_ISSUINGCODE, :D'
||'G_ENTERMANUAL_PASSNUMBER, :DG_ENTERMANUAL_LASTNAME, :DG_ENTERMANUAL_FIRSTNAME, :DG_ENTERMANUAL_DOCTYPE from borderdocuments where brddocid = :P3_BRDDOCID;*/',
'select sex, to_char(EXPIRYDATE, ''DD/MM/YYYY''), to_char(PKG_COMMON.Parse_Date(dob, 1, 0, 0, 1), ''DD/MM/YYYY''), ISSUECTRY, docno, surname, givenname, doctype, manualexpirydate, dateofissue, nationality, placeofbirth',
'into :DG_ENTERMANUAL_GENDER, :DG_ENTERMANUAL_EXPIRYDATE, :DG_ENTERMANUAL_DOB, :DG_ENTERMANUAL_ISSUINGCODE, :DG_ENTERMANUAL_PASSNUMBER, :DG_ENTERMANUAL_LASTNAME, :DG_ENTERMANUAL_FIRSTNAME, :DG_ENTERMANUAL_DOCTYPE, :DG_ENTERMANUAL_EXTEXPIRYDATE, :DG_EN'
||'TERMANUAL_DATEOFISSUE, :DG_ENTERMANUAL_NATIONALITY, :DG_ENTERMANUAL_PLACEOFBIRTH',
'from (',
'SELECT',
'    bd.DOCNO, bd.ISSUECTRY, bd.EXPIRYDATE, bd.SEX, bd.DOB, bd.SURNAME, bd.GIVENNAME, bd.doctype,',
'    (select attrvarchar from movement_attr ma where ma.mvmntid = m.mvmntid and seqno = 21) manualexpirydate,',
'    (select attrvarchar from movement_attr ma where ma.mvmntid = m.mvmntid and seqno = 22) dateofissue,',
'    (select attrvarchar from movement_attr ma where ma.mvmntid = m.mvmntid and seqno = 23) nationality,',
'    (select attrvarchar from movement_attr ma where ma.mvmntid = m.mvmntid and seqno = 24) placeofbirth',
'FROM ',
'   MOVEMENTS m join BORDERDOCUMENTS bd on m.BRDDOCID=bd.BRDDOCID',
'where bd.brddocid = :P3_BRDDOCID and m.brddocid = :P3_BRDDOCID order by m.INS_AT desc)',
'where rownum < 2;'))
,p_attribute_02=>'P3_BRDDOCID'
,p_attribute_03=>'DG_ENTERMANUAL_ISSUINGCODE,DG_ENTERMANUAL_GENDER,DG_ENTERMANUAL_PASSNUMBER,DG_ENTERMANUAL_LASTNAME,DG_ENTERMANUAL_FIRSTNAME,DG_ENTERMANUAL_DOCTYPE,DG_ENTERMANUAL_EXPIRYDATE,DG_ENTERMANUAL_DOB,DG_ENTERMANUAL_GENDER,DG_ENTERMANUAL_NATIONALITY,DG_ENTERM'
||'ANUAL_DATEOFISSUE,DG_ENTERMANUAL_PLACEOFBIRTH,DG_ENTERMANUAL_EXTEXPIRYDATE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(855633724600730151)
,p_event_id=>wwv_flow_api.id(855633282887730148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
end;
/