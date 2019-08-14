prompt --application/pages/page_00050
begin
wwv_flow_api.create_page(
 p_id=>50
,p_user_interface_id=>wwv_flow_api.id(58823889429541094)
,p_name=>'Fee Exception'
,p_page_mode=>'MODAL'
,p_step_title=>'Receipt'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_attributes=>'open: function() {parent.$(''.ui-button.ui-widget.ui-state-default.ui-corner-all.ui-button-icon-only.ui-dialog-titlebar-close'').css("display", "none");}'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180628191320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108339238719909571)
,p_plug_name=>'&nbsp;'
,p_icon_css_classes=>'fa-refresh fa-anim-spin fa-lg'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--customIcons:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(68651617957327511)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Please wait a few seconds. Your receipt will be created...'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_column_width=>'style="text-align: center;"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108339772378909577)
,p_name=>'P50_KEY_VALUE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108339914984909578)
,p_name=>'P50_PRINT_RECEIPT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108339959605909579)
,p_name=>'P50_NUMBER_REFERENCE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108340057877909580)
,p_name=>'P50_WORKING_SYSTEM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108340209938909581)
,p_name=>'P50_REFERENCE_ENTITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108340251184909582)
,p_name=>'P50_FEE_OR_FINE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108340432982909583)
,p_name=>'P50_RETURN_RECEIPT_NO1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108340522210909584)
,p_name=>'P50_RETURN_RECEIPT_NO2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108340541054909585)
,p_name=>'P50_CHOOSE_MANUAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_item_default=>'AUTO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108340644112909586)
,p_name=>'P50_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(108339238719909571)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(108340931243909588)
,p_computation_sequence=>10
,p_computation_item=>'P50_URL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'pkg_apex_fee_and_fine.get_receipt_link(:P50_KEY_VALUE)'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108339427011909573)
,p_name=>'TIMER TO CREATE RECEIPT'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108339535680909574)
,p_event_id=>wwv_flow_api.id(108339427011909573)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function() {',
'    apex.submit("SAVE");',
'}, 3000)'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108340941063909589)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'dl_bordercontrol.pkg_apex_fee_and_fine.save (p_key_value         => :P10_KEY_VALUE',
'                                            ,p_booking_number    => :P10_RETURN_RECEIPT_NO1',
'                                            ,p_receipt_number    => :P10_RETURN_RECEIPT_NO2',
'                                            ,p_reference_entity  => :P50_REFERENCE_ENTITY',
'                                            ,p_reference_number  => :P50_NUMBER_REFERENCE',
'                                            ,p_owner             => :P50_WORKING_SYSTEM',
'                                            ,p_print_flag        => :P50_PRINT_RECEIPT',
'                                            ,p_fee_or_fine       => :P50_FEE_OR_FINE',
'                                            ,p_ins_terminal      => :AI_TERMINAL_ID',
'                                            ,p_ins_borderpost    => :AI_BORDERPOST_ID);',
'                                            ',
':P10_CHOOSE_MANUAL := ''AUTO'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108339673100909576)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CLOSE DIALOG'
,p_attribute_01=>'P10_RETURN_RECEIPT_NO1,P10_RETURN_RECEIPT_NO2,P10_CHOOSE_MANUAL,P10_KEY_VALUE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
