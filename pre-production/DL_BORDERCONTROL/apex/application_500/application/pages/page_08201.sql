prompt --application/pages/page_08201
begin
wwv_flow_api.create_page(
 p_id=>8201
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Traveler In/Out transaction Report'
,p_page_mode=>'NORMAL'
,p_step_title=>'Traveler In/Out transaction Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Traveler In/Out transaction Report'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.maltetest {',
'    font-size: 6px;',
'}',
'',
'body.t-PageBody.js-rightCollapsed .t-Body-actions {',
'    -webkit-transform: translate3d(300px, 0, 0);',
'    -ms-transform: translate(300px);',
'    transform: translate3d(300px, 0, 0);',
'}',
'',
'',
'',
''))
,p_step_template=>wwv_flow_api.id(563809244131049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190330020828'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(166816867992510709)
,p_plug_name=>'Search criteria'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(166844068971601734)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(212704641426753851)
,p_plug_name=>'Traveler In/Out Report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>31
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT (Select NVL(DISPLAY_VALUE, NAME$DLC) FROM DL_BORDERCONTROL.ADM_CLASS_PROVINCE$LC where KEY_VALUE = (Select PROVINCE from DL_BORDERCONTROL.ENTRY_FORMS Where KEY_VALUE = m.entry_form)) "Province of Arrival Record"',
'      ,q.docno "Passport No."',
'      ,q.givenname || '' ''|| q.surname "Traveler Name"',
'      ,(Select NVL(display_value,display_value$dlc) FROM dl_common.human_sexes$lc where num_value = q.sex) "Sex"',
'      ,(SELECT NVL(display_value,display_value$dlc) FROM dl_common.icao_doc_codes$lc WHERE key_value = q.nat) "Nationality"',
'      ,dl_bordercontrol.PKG_COMMON.Parse_Date(dob, 1, 0, 0, 1) "Birth Day"',
'      ,m.movement_dt "Travel Date"',
'      ,(Select NVL(display_value,display_value$dlc) FROM DL_COMMON.VISA_TYPES$LC WHERE key_value = m.visa_type) "Visa Type"',
'      ,(select FORM_NO from DL_BORDERCONTROL.ENTRY_FORMS Where KEY_VALUE = m.entry_form) "TM6 No."',
'      ,m.SCANNED_FLIGHT "Flight No."',
'      ,(Select NVL(NAME, NAME$DLC) from DL_BORDERCONTROL.BORDERPOSTS$LC where key_value = m.INS_BORDERPOST) "Borderpost"',
'      ,REGEXP_REPLACE(DECODE(m.dml_by, ''n.a.'', ''EGATE'', m.dml_by), ''([^@]*).*'', ''\1'') "Record by"',
'      ,to_char(m.ins_at, ''DD.MM.RRRR HH24:MI:SS'') "Record Date"',
'      ,(select IPADDRESS from dl_bordercontrol.terminals where ID = m.ins_terminal) "IP Address"',
'      ,(SELECT NVL(display_value,display_value$dlc) FROM DL_COMMON.PORT_MOVEMENTS$LC WHERE NUM_VALUE = m.EXITFLG) "Counter"',
'  FROM dl_bordercontrol.v_borderocuments q ',
'  JOIN dl_bordercontrol.v_movements m ON m.BRDDOCID = q.BRDDOCID',
' WHERE m.is_finished = ''Y''',
'  --Filter',
'   AND (m.movement_dt BETWEEN :P8201_DATE_FROM AND :P8201_DATE_TO)',
'   AND (q.sex = :P8201_SEX or :P8201_SEX is null)',
'   AND (q.NAt = :P8201_NATIONALITY or :P8201_NATIONALITY is null)',
'   AND (q.DOCNO = :P8201_DOC_NO or :P8201_DOC_NO is null)',
'   AND (q.expirydate = :P8201_EXPIRYDATE or :P8201_EXPIRYDATE is null)',
'   AND (m.exitflg = :P8201_MOVEMENT_TYPE or :P8201_MOVEMENT_TYPE is null)',
'   AND (trim(regexp_replace(decode(m.dml_by, ''n.a.'', ''EGATE'', m.dml_by), ''([^@]*).*'', ''\1'')) = upper(:P8201_OFFICERS) or :P8201_OFFICERS is null)',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_output_show_link=>'Y'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(169831978729443009)
,p_max_row_count=>'500'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'E1CHAGEMANN'
,p_internal_uid=>95795263049689788
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78482694344700558)
,p_db_column_name=>'Province of Arrival Record'
,p_display_order=>10
,p_column_identifier=>'P'
,p_column_label=>'Province of Arrival Record'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78482792592700559)
,p_db_column_name=>'Passport No.'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'Passport No.'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78482824563700560)
,p_db_column_name=>'Traveler Name'
,p_display_order=>30
,p_column_identifier=>'R'
,p_column_label=>'Traveler Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483005211700561)
,p_db_column_name=>'Sex'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483056429700562)
,p_db_column_name=>'Nationality'
,p_display_order=>50
,p_column_identifier=>'T'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483173509700563)
,p_db_column_name=>'Birth Day'
,p_display_order=>60
,p_column_identifier=>'U'
,p_column_label=>'Birth Day'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483234114700564)
,p_db_column_name=>'Travel Date'
,p_display_order=>70
,p_column_identifier=>'V'
,p_column_label=>'Travel Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483399993700565)
,p_db_column_name=>'Visa Type'
,p_display_order=>80
,p_column_identifier=>'W'
,p_column_label=>'Visa Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483466510700566)
,p_db_column_name=>'TM6 No.'
,p_display_order=>90
,p_column_identifier=>'X'
,p_column_label=>'TM6 No.'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483586078700567)
,p_db_column_name=>'Flight No.'
,p_display_order=>100
,p_column_identifier=>'Y'
,p_column_label=>'Flight No.'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483683774700568)
,p_db_column_name=>'Borderpost'
,p_display_order=>110
,p_column_identifier=>'Z'
,p_column_label=>'Borderpost'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483762826700569)
,p_db_column_name=>'Record by'
,p_display_order=>120
,p_column_identifier=>'AA'
,p_column_label=>'Record by'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483831654700570)
,p_db_column_name=>'Record Date'
,p_display_order=>130
,p_column_identifier=>'AB'
,p_column_label=>'Record Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78483942433700571)
,p_db_column_name=>'IP Address'
,p_display_order=>140
,p_column_identifier=>'AC'
,p_column_label=>'IP Address'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79852673875791222)
,p_db_column_name=>'Counter'
,p_display_order=>150
,p_column_identifier=>'AD'
,p_column_label=>'Counter'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(177285255859495386)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'57312'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>':Province of Arrival Record:Passport No.:Traveler Name:Sex:Nationality:Birth Day:Travel Date:Visa Type:TM6 No.:Flight No.:Borderpost:Record by:Record Date:IP Address:Counter'
,p_sort_column_1=>'MOVEMENT_DT'
,p_sort_direction_1=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(79768413575124919)
,p_report_id=>wwv_flow_api.id(177285255859495386)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'MOVEMENT_DT'
,p_operator=>'is in the last'
,p_expr=>'3'
,p_expr2=>'months'
,p_condition_sql=>'"MOVEMENT_DT" between add_months(sysdate,-1 * #APXWS_EXPR#) and sysdate'
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME# 3 #APXWS_EXPR2_NAME#'
,p_enabled=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79768960093124952)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_api.id(166816867992510709)
,p_button_name=>'BTN_SHOW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Show'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79769343540124970)
,p_button_sequence=>300
,p_button_plug_id=>wwv_flow_api.id(166816867992510709)
,p_button_name=>'BTN_RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Reset'
,p_button_position=>'BOTTOM'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(79775321414125062)
,p_branch_name=>'Show Results'
,p_branch_action=>'f?p=&APP_ID.:8201:&SESSION.::&DEBUG.::P8201_SHOW_RESULTS:1'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(79768960093124952)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(79775660392125073)
,p_branch_name=>'Reset'
,p_branch_action=>'f?p=&APP_ID.:8201:&SESSION.::&DEBUG.:8201:P8201_SHOW_RESULTS:0'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(79769343540124970)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79769772570124971)
,p_name=>'P8201_DATE_FROM'
,p_is_required=>true
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'From Date'
,p_source=>'SYSDATE()-INTERVAL''3''MONTH'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841469540049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79770180222124999)
,p_name=>'P8201_DATE_TO'
,p_is_required=>true
,p_item_sequence=>11
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'To Date'
,p_source=>'SYSDATE-1'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841469540049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79770520335125000)
,p_name=>'P8201_SEX'
,p_item_sequence=>21
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Sex'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79770926721125002)
,p_name=>'P8201_NATIONALITY'
,p_item_sequence=>31
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Nationality'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79771380362125003)
,p_name=>'P8201_DOC_NO'
,p_item_sequence=>41
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Document No.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79771728497125004)
,p_name=>'P8201_EXPIRYDATE'
,p_item_sequence=>51
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Expiry Date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79772198149125005)
,p_name=>'P8201_TRANSPORT'
,p_item_sequence=>61
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Transport Mode'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TRANSPORTMODE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.TRANS_MODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79772575742125007)
,p_name=>'P8201_MOVEMENT_TYPE'
,p_item_sequence=>71
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Movement Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79772938734125008)
,p_name=>'P8201_OFFICERS'
,p_item_sequence=>81
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Officer'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79773353143125009)
,p_name=>'P8201_MAX_STAY_DATE'
,p_item_sequence=>91
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Max Stay Date'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79773750802125009)
,p_name=>'P8201_DIM_MOVEMENT_TYPES'
,p_item_sequence=>101
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Movement Type'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79774155845125010)
,p_name=>'P8201_DIM_TIMES_YEAR'
,p_item_sequence=>111
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Year'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIM_TIME_YEARS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct year_numeric as d, year_numeric as r from dl_bordercontrol_datamart.dim_times',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79774557559125011)
,p_name=>'P8201_SHOW_RESULTS'
,p_item_sequence=>121
,p_item_plug_id=>wwv_flow_api.id(166816867992510709)
,p_prompt=>'Show Results'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
end;
/
