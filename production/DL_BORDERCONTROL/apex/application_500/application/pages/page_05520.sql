prompt --application/pages/page_05520
begin
wwv_flow_api.create_page(
 p_id=>5520
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Blacklist Hit Log'
,p_page_mode=>'NORMAL'
,p_step_title=>'Blacklist Hit Log'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Blacklist Hit Log'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190702235037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78075931857123134)
,p_plug_name=>'Blacklist Hit Log'
,p_region_css_classes=>'cl-ir-dynamic-display'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>300
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    key_value',
'    ,dml_at',
'    ,dml_by',
'    ,dml_type',
'    ,ins_at',
'    ,ins_by',
'    ,sender_system',
'    ,sender_user',
'    ,elapsed_time_seconds',
'    ,number_of_hits',
'    ,sender_object_id',
'FROM dl_interface.log_blacklist_hits',
'WHERE CASE WHEN REGEXP_LIKE(:REQUEST, ''(CSV|HTMLD|PDF)$'') THEN ''Y'' ELSE :P5520_DR END = ''Y''',
'AND',
'(',
'    :P5520_SENDER_OBJECT_ID IS NULL ',
'    OR ',
'    (:P5520_SENDER_OBJECT_ID IS NOT NULL AND sender_object_id = UPPER(:P5520_SENDER_OBJECT_ID))',
')',
'AND',
'(',
'    :P5520_DOC_NUMBER IS NULL ',
'    OR ',
'    (',
'        :P5520_DOC_NUMBER IS NOT NULL ',
'        AND sender_object_id IN ',
'        (',
'            SELECT m.mvmntid',
'            FROM dl_bordercontrol.movements m, dl_bordercontrol.borderdocuments b',
'            WHERE b.docno = UPPER(:P5520_DOC_NUMBER)',
'            AND m.brddocid = b.brddocid',
'            AND m.is_finished = ''Y''',
'        )',
'    )',
')',
'AND',
'(',
'    (',
'        :P5520_SCOPE = 0',
'        AND ins_at BETWEEN TRUNC(SYSDATE) AND SYSDATE',
'    )',
'    OR',
'    (',
'        :P5520_SCOPE = 1',
'        AND ins_at BETWEEN TO_DATE(:P5520_DATE_FROM, ''DD/MM/YYYY HH24:MI'') AND TO_DATE(:P5520_DATE_TO, ''DD/MM/YYYY HH24:MI'')',
'    )',
')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P5520_DR,P5520_SENDER_OBJECT_ID,P5520_DOC_NUMBER,P5520_SCOPE,P5520_DATE_FROM,P5520_DATE_TO'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(78076057259123134)
,p_name=>'Blacklist Hit Log'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'E1CHAGEMANN'
,p_internal_uid=>38577958666262228
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78076397455123162)
,p_db_column_name=>'KEY_VALUE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:5521:&SESSION.::&DEBUG.:RP,5521:P5521_KEY_VALUE:#KEY_VALUE#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78076750140123176)
,p_db_column_name=>'DML_AT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Dml At'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78077183040123177)
,p_db_column_name=>'DML_BY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Dml By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78077593168123177)
,p_db_column_name=>'DML_TYPE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Dml Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78077944290123177)
,p_db_column_name=>'INS_AT'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78078377586123178)
,p_db_column_name=>'INS_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Ins By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78078789448123178)
,p_db_column_name=>'SENDER_SYSTEM'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Sender system'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78079185578123178)
,p_db_column_name=>'SENDER_USER'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78080320362123180)
,p_db_column_name=>'ELAPSED_TIME_SECONDS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Elapsed time in seconds'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(78080723788123180)
,p_db_column_name=>'NUMBER_OF_HITS'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Number Of Hits'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46066249732049319)
,p_db_column_name=>'SENDER_OBJECT_ID'
,p_display_order=>22
,p_column_identifier=>'M'
,p_column_label=>'Object ID'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(78103625566143754)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'386056'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'KEY_VALUE:INS_AT:SENDER_SYSTEM:SENDER_USER:SENDER_OBJECT_ID:ELAPSED_TIME_SECONDS:NUMBER_OF_HITS:'
,p_sort_column_1=>'INS_AT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179341870277484111)
,p_plug_name=>'Filter'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>200
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179342972481484122)
,p_plug_name=>'HIDDEN'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(179342252157484115)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(179341870277484111)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filter'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(179343708273484130)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(179341870277484111)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Reset'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:5520:&SESSION.::&DEBUG.:RP,5520::'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(179342892879484121)
,p_branch_name=>'Go To Page 5520'
,p_branch_action=>'f?p=&APP_ID.:5520:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(179342252157484115)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(179341928629484112)
,p_name=>'P5520_SCOPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(179341870277484111)
,p_prompt=>'Scope of data :'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d, r',
'FROM',
'(',
'    SELECT ''Today'' AS d, 0 AS r, ''en_US'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''Historical'', 1, ''en_US'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''วันนี้'', 0, ''th_TH'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''ทั้งหมด'', 1, ''th_TH'' AS lang FROM DUAL',
')',
'WHERE ',
'CASE ',
'    WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' AND lang = ''th_TH'' THEN 1',
'    WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() != ''th_TH'' AND lang = ''en_US'' THEN 1',
'END = 1',
'ORDER BY r',
';'))
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(179342096613484113)
,p_name=>'P5520_DATE_FROM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(179341870277484111)
,p_prompt=>'Date From :'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-10:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(179342123849484114)
,p_name=>'P5520_DATE_TO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(179341870277484111)
,p_prompt=>'Date To :'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-10:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(179343035326484123)
,p_name=>'P5520_DR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(179342972481484122)
,p_use_cache_before_default=>'NO'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Dynamic Refresh'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(179343553918484128)
,p_name=>'P5520_DOC_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(179341870277484111)
,p_prompt=>'Document No :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(179343677236484129)
,p_name=>'P5520_SENDER_OBJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(179341870277484111)
,p_prompt=>'Object ID :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>32
,p_tag_css_classes=>'auto-upper-case'
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(179342365571484116)
,p_name=>'P5520_SCOPE: Change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5520_SCOPE'
,p_condition_element=>'P5520_SCOPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179342664890484119)
,p_event_id=>wwv_flow_api.id(179342365571484116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5520_DATE_FROM,P5520_DATE_TO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179342775194484120)
,p_event_id=>wwv_flow_api.id(179342365571484116)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT TO_CHAR(SYSDATE - 1, ''DD/MM/YYYY HH24:MI''), TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')',
'INTO :P5520_DATE_FROM, :P5520_DATE_TO',
'FROM DUAL;'))
,p_attribute_02=>'P5520_DATE_FROM,P5520_DATE_TO'
,p_attribute_03=>'P5520_DATE_FROM,P5520_DATE_TO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179342493130484117)
,p_event_id=>wwv_flow_api.id(179342365571484116)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5520_DATE_FROM,P5520_DATE_TO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179342593652484118)
,p_event_id=>wwv_flow_api.id(179342365571484116)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5520_DATE_FROM,P5520_DATE_TO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(179343165750484124)
,p_name=>'Page Load Actions'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179343228118484125)
,p_event_id=>wwv_flow_api.id(179343165750484124)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' :P5520_DR := ''Y'';',
'END;'))
,p_attribute_02=>'P5520_DR'
,p_attribute_03=>'P5520_DR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179343395240484126)
,p_event_id=>wwv_flow_api.id(179343165750484124)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''div.cl-ir-dynamic-display span.a-IRR-noDataMsg-text, div.cl-r-dynamic-display span.nodatafound'').text(''Please wait..'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179343468983484127)
,p_event_id=>wwv_flow_api.id(179343165750484124)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(78075931857123134)
,p_stop_execution_on_error=>'Y'
);
end;
/
