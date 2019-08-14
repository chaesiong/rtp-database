prompt --application/pages/page_05010
begin
wwv_flow_api.create_page(
 p_id=>5010
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Incident Management'
,p_page_mode=>'NORMAL'
,p_step_title=>'Incident Management'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body-content {',
'    padding-bottom: 2rem !important;',
'}',
'',
'.t-Body-topButton {',
'    display: none !important;',
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
,p_last_upd_yyyymmddhh24miss=>'20180730111540'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(428531328703220143)
,p_plug_name=>'Incidents'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT docno',
'      ,pkg_common.resolve_host(client_ip) AS client_ip',
'      ,officer',
'      ,pkg_common.parse_date(dob,1,0,0,1) AS dob',
'      ,lastname',
'      ,gender',
'      ,issuingcountry',
'      ,ins_at ts',
'      ,givenname',
'      ,id',
'      ,type',
'  FROM incidents;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(428531599834220143)
,p_name=>'Incidents'
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
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>7610001261646326
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428531780848220143)
,p_db_column_name=>'DOCNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Document No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428532175956220144)
,p_db_column_name=>'CLIENT_IP'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Host'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428532536703220144)
,p_db_column_name=>'OFFICER'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Officer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428533349677220145)
,p_db_column_name=>'LASTNAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428533704259220145)
,p_db_column_name=>'GENDER'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428534158680220145)
,p_db_column_name=>'ISSUINGCOUNTRY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Issuing Country'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428534516433220146)
,p_db_column_name=>'TS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428534936150220146)
,p_db_column_name=>'GIVENNAME'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428535301040220146)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(428535742312220147)
,p_db_column_name=>'TYPE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(428410676674707226)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(932530311490744199)
,p_db_column_name=>'DOB'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Date of Birth'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(428536179198220147)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'76146'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'DOCNO:DOB:LASTNAME:GIVENNAME:ISSUINGCOUNTRY:CLIENT_IP:OFFICER:TYPE:TS:'
,p_sort_column_1=>'TS'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(171641040260322875)
,p_report_id=>wwv_flow_api.id(428536179198220147)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TS'
,p_operator=>'is in the last'
,p_expr=>'3'
,p_expr2=>'months'
,p_condition_sql=>'"TS" between add_months(sysdate,-1 * #APXWS_EXPR#) and sysdate'
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME# 3 #APXWS_EXPR2_NAME#'
,p_enabled=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(428537939889239080)
,p_plug_name=>'Traveler matching Blacklist'
,p_icon_css_classes=>'fa-bell'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'	Use this page to view all incidents that happened in the past. You can see where the incidents happened and the passport data which was collected when the incident happened.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(171546200621071696)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(428531328703220143)
,p_button_name=>'CREATE_RANDOM'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create random test datasets'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(171546238212071697)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE: RANDOM DATASETS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_range_borderdocument    NUMBER;',
'    l_range_terminals         NUMBER;',
'    l_range_users             NUMBER;',
'',
'BEGIN',
'',
'    SELECT COUNT(1)',
'      INTO l_range_borderdocument',
'      FROM dl_bordercontrol.borderdocuments;',
'    ',
'    SELECT COUNT(1)',
'      INTO l_range_terminals',
'      FROM dl_bordercontrol.terminals;',
'      ',
'    SELECT COUNT(1)',
'      INTO l_range_users',
'      FROM user_management.users;',
'',
'    FOR i IN 1 .. 10',
'    LOOP',
'',
'        INSERT INTO dl_bordercontrol.incidents (client_ip',
'                                               ,dob',
'                                               ,docno',
'                                               ,gender',
'                                               ,givenname',
'                                               ,ins_borderpost',
'                                               ,ins_terminal',
'                                               ,issuingcountry',
'                                               ,lastname',
'                                               ,officer',
'                                               ,type)',
'        (SELECT t.ipaddress',
'               ,brddoc.dob',
'               ,brddoc.docno',
'               ,brddoc.sex',
'               ,brddoc.givenname',
'               ,t.border_post',
'               ,t.id',
'               ,brddoc.issuectry',
'               ,brddoc.surname',
'               ,(SELECT username FROM (SELECT username, ROWNUM AS rwnum FROM user_management.users WHERE username IS NOT NULL) WHERE rwnum = floor(dbms_random.value(1, l_range_users)) AND ROWNUM = 1)',
'               ,1 -- 1 = Blacklist',
'           FROM (SELECT borderdocuments.*',
'                       ,ROWNUM AS rwnum',
'                   FROM dl_bordercontrol.borderdocuments) brddoc',
'           JOIN (SELECT terminals.*',
'                       ,ROWNUM AS rwnum',
'                   FROM dl_bordercontrol.terminals) t ON floor(dbms_random.value(1, l_range_terminals)) = t.rwnum',
'          WHERE brddoc.rwnum = floor(dbms_random.value(1, l_range_borderdocument))',
'         );',
'',
'    END LOOP;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
