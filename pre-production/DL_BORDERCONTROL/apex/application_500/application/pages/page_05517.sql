prompt --application/pages/page_05517
begin
wwv_flow_api.create_page(
 p_id=>5517
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'ISDS Log'
,p_page_mode=>'MODAL'
,p_step_title=>'ISDS Log'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20181102132611'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137377556126572316)
,p_plug_name=>'REQUEST_JSON'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_request_json CLOB;',
'    procedure print_clob( p_clob in clob )',
'    as',
'        l_offset number default 1;',
'    begin',
'        loop',
'            exit when l_offset > dbms_lob.getlength(p_clob) OR p_clob IS NULL;  ',
'            htp.prn( dbms_lob.substr( p_clob, 255, l_offset ) );',
'            l_offset := l_offset + 255;',
'        end loop;',
'    end;',
'BEGIN',
'    SELECT sender_message INTO l_request_json FROM dl_interface.log_sync_webservices WHERE KEY_VALUE = :P5517_KEY_VALUE;',
'    print_clob(l_request_json);',
'',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137377622746572317)
,p_plug_name=>'PIBICS_RESPONSE'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>16
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_pibics_response CLOB;',
'    procedure print_clob( p_clob in clob )',
'    as',
'        l_offset number default 1;',
'    begin',
'        loop',
'            exit when l_offset > dbms_lob.getlength(p_clob) OR p_clob IS NULL;',
'            htp.prn( dbms_lob.substr( p_clob, 255, l_offset ) );',
'            l_offset := l_offset + 255;',
'        end loop;',
'    end;',
'BEGIN',
'    SELECT sender_response_message INTO l_pibics_response FROM dl_interface.log_sync_webservices WHERE KEY_VALUE = :P5517_KEY_VALUE;',
'    print_clob(l_pibics_response);',
'',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(170791470576734059)
,p_name=>'Details'
,p_template=>wwv_flow_api.id(563812786985049615)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT key_value',
'      ,dml_at',
'      ,dml_by',
'      ,dml_type',
'      ,ins_at',
'      ,ins_by',
'      ,sender',
'      ,sender_object',
'      ,sender_object_id',
'      ,sender_response_code',
'      ,receiver_response_id',
'      ,process_time',
'  FROM dl_interface.log_sync_webservices',
' WHERE key_value = :P5517_KEY_VALUE'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563830997443049621)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167981745161408428)
,p_query_column_id=>1
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>1
,p_column_heading=>'Key Value'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167981886788408429)
,p_query_column_id=>2
,p_column_alias=>'DML_AT'
,p_column_display_sequence=>2
,p_column_heading=>'DML At'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167981907804408430)
,p_query_column_id=>3
,p_column_alias=>'DML_BY'
,p_column_display_sequence=>3
,p_column_heading=>'DML By'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167982026621408431)
,p_query_column_id=>4
,p_column_alias=>'DML_TYPE'
,p_column_display_sequence=>4
,p_column_heading=>'DML Type'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167982176361408432)
,p_query_column_id=>5
,p_column_alias=>'INS_AT'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167982205597408433)
,p_query_column_id=>6
,p_column_alias=>'INS_BY'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167982355529408434)
,p_query_column_id=>7
,p_column_alias=>'SENDER'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167982494862408435)
,p_query_column_id=>8
,p_column_alias=>'SENDER_OBJECT'
,p_column_display_sequence=>8
,p_column_heading=>'Bordercontrol Object'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167982559721408436)
,p_query_column_id=>9
,p_column_alias=>'SENDER_OBJECT_ID'
,p_column_display_sequence=>9
,p_column_heading=>'Bordercontrol Object ID'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167982701574408438)
,p_query_column_id=>10
,p_column_alias=>'SENDER_RESPONSE_CODE'
,p_column_display_sequence=>10
,p_column_heading=>'Response Code'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167982957104408440)
,p_query_column_id=>11
,p_column_alias=>'RECEIVER_RESPONSE_ID'
,p_column_display_sequence=>11
,p_column_heading=>'PIBICS Response ID'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(167983116025408442)
,p_query_column_id=>12
,p_column_alias=>'PROCESS_TIME'
,p_column_display_sequence=>12
,p_column_heading=>'Process Time'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170792142408734062)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170792015080734062)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(170792142408734062)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close Details'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P5517_KEY_VALUE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170794983398734065)
,p_name=>'P5517_KEY_VALUE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(170791470576734059)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(137377404336572314)
,p_name=>'Close Dialog '
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(170792015080734062)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(137377515724572315)
,p_event_id=>wwv_flow_api.id(137377404336572314)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
