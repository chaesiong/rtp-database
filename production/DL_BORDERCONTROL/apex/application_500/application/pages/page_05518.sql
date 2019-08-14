prompt --application/pages/page_05518
begin
wwv_flow_api.create_page(
 p_id=>5518
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Manual PIBICS Request'
,p_page_mode=>'MODAL'
,p_step_title=>'Manual PIBICS Request'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1MSTAHL'
,p_last_upd_yyyymmddhh24miss=>'20181115163248'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137378044518572321)
,p_plug_name=>'Data'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>22
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137379025366572331)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>12
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Please select an Entity to send to PIBICS. You also need to supply the corresponding unique identifier i.e. KEY_VALUE. After the "Send to Pibics" Button is pressed, the action will be send to PIBICS and the underlying table will be refreshed. '
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(137378511824572325)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(137378044518572321)
,p_button_name=>'SEND'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send to PIBICS'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-server-arrow-up'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137378151184572322)
,p_name=>'P5518_ENTITY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(137378044518572321)
,p_prompt=>'Entity:'
,p_source=>'MOV'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Movement;MOV,Crew;CREW,Voa;VOA'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137378286322572323)
,p_name=>'P5518_KEY_VALUE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(137378044518572321)
,p_prompt=>'ID.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137378362217572324)
,p_name=>'P5518_TYPE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(137378044518572321)
,p_prompt=>'DML-Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Update (U);U,Insert (I);I,Delete (D);D'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171973796571248404)
,p_name=>'P5518_INTERFACE_ERROR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(137378044518572321)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(171973662243248403)
,p_computation_sequence=>10
,p_computation_item=>'P5518_INTERFACE_ERROR'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>' Please note that the connection between BMBS and PIBICS is not installed yet. Please ask the deployment team to get more information.'
,p_compute_when=>'select 1 from all_procedures where owner = ''DL_STAGING4PIBICS_INTF'''
,p_compute_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(137379130784572332)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>'P5518_KEY_VALUE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'You have to enter a unique identifier.'
,p_always_execute=>'N'
,p_associated_item=>wwv_flow_api.id(137378286322572323)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(137378578317572326)
,p_name=>'Send to Pibics'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(137378511824572325)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(137378662606572327)
,p_event_id=>wwv_flow_api.id(137378578317572326)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DL_BORDERCONTROL.PKG_PIBICS_HOOK.set_action_movement(',
'    p_mvmntid => :P5518_KEY_VALUE, ',
'    p_dml_type => :P5518_TYPE);'))
,p_attribute_02=>'P5518_ENTITY,P5518_KEY_VALUE,P5518_TYPE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(137379019539572330)
,p_event_id=>wwv_flow_api.id(137378578317572326)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(171973572109248402)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND: PIBICS HOOK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P5518_ENTITY = ''MOV''',
'THEN ',
'    DL_BORDERCONTROL.PKG_PIBICS_HOOK.set_action_movement(',
'        p_mvmntid  => :P5518_KEY_VALUE, ',
'        p_dml_type => :P5518_TYPE);',
'ELSIF :P5518_ENTITY = ''CREW''',
'THEN',
'    DL_BORDERCONTROL.PKG_PIBICS_HOOK.set_action_crew(',
'        p_mvmntid  => :P5518_KEY_VALUE, ',
'        p_dml_type => :P5518_TYPE);',
'ELSIF :P5518_ENTITY = ''VOA''',
'THEN',
'    DL_BORDERCONTROL.PKG_PIBICS_HOOK.set_action_visa_on_arrival(',
'        p_key_value => :P5518_KEY_VALUE, ',
'        p_dml_type  => :P5518_TYPE);',
'END IF;'))
,p_process_error_message=>'An error occurred while sending the log to the PIBICS interface.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'ISDS log was successfully send to the PIBICS interface.'
);
end;
/
