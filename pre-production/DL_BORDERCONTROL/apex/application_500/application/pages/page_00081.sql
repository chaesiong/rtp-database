prompt --application/pages/page_00081
begin
wwv_flow_api.create_page(
 p_id=>81
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Form on TRANSPORTUNITS'
,p_page_mode=>'NORMAL'
,p_step_title=>'Form on TRANSPORTUNITS'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'CHRISTINA'
,p_last_upd_yyyymmddhh24miss=>'20180410135916'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456356571927472889)
,p_plug_name=>'Movement Data'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(455844063748552731)
,p_plug_name=>'Land Items'
,p_parent_plug_id=>wwv_flow_api.id(456356571927472889)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(455844522293552736)
,p_plug_name=>'Movement Items'
,p_parent_plug_id=>wwv_flow_api.id(456356571927472889)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456943182559610271)
,p_plug_name=>'Air and Sea Items'
,p_parent_plug_id=>wwv_flow_api.id(456356571927472889)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(455842899930552720)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(455844063748552731)
,p_button_name=>'REUSE_LAST'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Reuse Last Vehicle'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(455843026421552721)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(455844063748552731)
,p_button_name=>'RESET'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Reset'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456356918142472891)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(455844063748552731)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P81_TRNSPRTUNITID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(456358809568472900)
,p_branch_action=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456359283730473420)
,p_name=>'P81_TRNSPRTUNITID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456356571927472889)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456359501501473490)
,p_name=>'P81_DIRECTIONFLG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456356571927472889)
,p_prompt=>'Direction'
,p_source=>'AI_DEFAULT_DIRECTION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_MOVEMENTACTION'
,p_lov=>'.'||wwv_flow_api.id(570709530368811123)||'.'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456359826794473501)
,p_name=>'P81_TRNSPRTMODEID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(456356571927472889)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Transport Mode'
,p_source=>'AI_TRANSPORT_MODE'
,p_source_type=>'ITEM'
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
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456360220789473503)
,p_name=>'P81_TRNSPRTSTATUS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(456356571927472889)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456360663619473504)
,p_name=>'P81_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(455844063748552731)
,p_use_cache_before_default=>'NO'
,p_prompt=>'License Plate Number'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456364289414473524)
,p_name=>'P81_VEHICLEMODELID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(455844063748552731)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vehiclemodelid'
,p_source=>'VEHICLEMODELID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from VEHICLEMODEL',
'  where MAKE_ID = :P81_VEHICLEMAKER',
' order by 1'))
,p_lov_cascade_parent_items=>'P81_VEHICLEMAKER'
,p_ajax_items_to_submit=>'P81_VEHICLEMAKER'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456372103048535499)
,p_name=>'P81_VEHICLEMAKER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(455844063748552731)
,p_prompt=>'Vehicle Maker'
,p_source=>'Volkswagen'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_VEHICLEMAKER'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select make_id as d,',
'       make_id as r',
'  from (select distinct make_id from vehiclemodel)',
' order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456943440519610273)
,p_name=>'P81_RANKDESIGNATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(456943182559610271)
,p_prompt=>'Rank Designation'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_RANKDESIGNATION'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.NAME as d, p.id as r ',
'from RANKDESIGNATION p',
'where p.active > 0',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456943858120610274)
,p_name=>'P81_FLIGHT_TRNSPRTUNITID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(456943182559610271)
,p_prompt=>'Flight'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.FLIGHTNUM || '' - '' || t.name || '' - '' || t2.name as d, t.trnsprtunitid as r ',
'from transportunits t',
'inner join flights f on f.flghtid = t.flghtid',
'inner join TRANSPORTSTATUS2 t2 on t2.id = t.TRNSPRTSTATUS2',
'inner join TRANSPORTSTATUS s on s.id = t.trnsprtstatus',
'where t.active > 0 and upper(s.name) = ''OPEN'' and t.DIRECTIONFLG = :P81_DIRECTIONFLG and t.TRNSPRTMODEID = 0',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P81_DIRECTIONFLG'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456944632382610276)
,p_name=>'P81_SECURITY_DUPLICATE_MOVEMENTS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(456943182559610271)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456945069397610277)
,p_name=>'P81_MVT_OBSERVATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(455844522293552736)
,p_prompt=>'Observation for this movement:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>250
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456945457215610279)
,p_name=>'P81_OFFLDRSNID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(456943182559610271)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Offload Reason'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_OFFLOADREASON'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       offldrsnid as r',
'  from OFFLOADREASON',
'where active = 1',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456945873237610280)
,p_name=>'P81_PSSNGRSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(456943182559610271)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Passenger Status'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PASSENGERSTATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    nvl(display_value,display_value$dlc) d,',
'    num_value r',
'FROM',
'    dl_common.on_board_types$lc t',
'WHERE',
'    is_active = ''Y''',
'ORDER BY display_order;'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(456687833059878129)
,p_computation_sequence=>10
,p_computation_item=>'P81_TRNSPRTUNITID'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'AI_LAST_USED_TRNSPRT_UNIT'
,p_compute_when=>'REUSE_LAST'
,p_compute_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(456390009987619721)
,p_computation_sequence=>20
,p_computation_item=>'P81_VEHICLEMAKER'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MAKE_ID',
'from VEHICLEMODEL',
'WHERE ID = :P81_VEHICLEMODELID'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456688258695887336)
,p_name=>'DisableReuseLast'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'AI_LAST_USED_TRNSPRT_UNIT'
,p_condition_element=>'AI_LAST_USED_TRNSPRT_UNIT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456688655434887341)
,p_event_id=>wwv_flow_api.id(456688258695887336)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(455842899930552720)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456689184718892641)
,p_event_id=>wwv_flow_api.id(456688258695887336)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(455842899930552720)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456696372671973584)
,p_name=>'Button REUSE_LAST Click'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(455842899930552720)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456696796385973586)
,p_event_id=>wwv_flow_api.id(456696372671973584)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.TRNSPRTUNITID,t.NAME,m.MAKE_ID,t.VEHICLEMODELID',
'into :P81_TRNSPRTUNITID,:P81_NAME,:P81_VEHICLEMAKER,:P81_VEHICLEMODELID',
'from TRANSPORTUNITS t',
'left join VEHICLEMODEL m on m.id = t.VEHICLEMODELID',
'where t.TRNSPRTUNITID = :AI_LAST_USED_TRNSPRT_UNIT;'))
,p_attribute_03=>'P81_TRNSPRTUNITID,P81_NAME,P81_VEHICLEMAKER,P81_VEHICLEMODELID'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(455843149530552722)
,p_name=>'P81_TRNSPRTUNITID changed'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P81_TRNSPRTUNITID'
,p_condition_element=>'P81_TRNSPRTUNITID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455843286881552723)
,p_event_id=>wwv_flow_api.id(455843149530552722)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81_VEHICLEMAKER,P81_VEHICLEMODELID,P81_NAME'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455843375313552724)
,p_event_id=>wwv_flow_api.id(455843149530552722)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81_VEHICLEMAKER,P81_VEHICLEMODELID,P81_NAME'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455843662480552727)
,p_event_id=>wwv_flow_api.id(455843149530552722)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(455843026421552721)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455843700879552728)
,p_event_id=>wwv_flow_api.id(455843149530552722)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(455843026421552721)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455843893447552729)
,p_event_id=>wwv_flow_api.id(455843149530552722)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(455842899930552720)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455843933696552730)
,p_event_id=>wwv_flow_api.id(455843149530552722)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(455842899930552720)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(455843495486552725)
,p_name=>'Button RESET Click'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(455843026421552721)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455843517186552726)
,p_event_id=>wwv_flow_api.id(455843495486552725)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P81_TRNSPRTUNITID := null;',
':P81_VEHICLEMAKER := null;',
':P81_VEHICLEMODELID := null;',
':P81_NAME := null;'))
,p_attribute_03=>'P81_TRNSPRTUNITID,P81_VEHICLEMAKER,P81_VEHICLEMODELID,P81_NAME'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456950038099695303)
,p_name=>'P81_DIRECTIONFLG changed'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P81_DIRECTIONFLG'
,p_condition_element=>'P81_DIRECTIONFLG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456950440415695306)
,p_event_id=>wwv_flow_api.id(456950038099695303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81_OFFLDRSNID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456950951113695308)
,p_event_id=>wwv_flow_api.id(456950038099695303)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81_OFFLDRSNID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456951469961695309)
,p_event_id=>wwv_flow_api.id(456950038099695303)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81_PSSNGRSTATUS,P81_RANKDESIGNATION,P81_FLIGHT_TRNSPRTUNITID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456951948439695309)
,p_event_id=>wwv_flow_api.id(456950038099695303)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81_PSSNGRSTATUS,P81_RANKDESIGNATION,P81_FLIGHT_TRNSPRTUNITID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(456952342007697627)
,p_name=>'P81_PSSNGRSTATUS changed'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P81_PSSNGRSTATUS'
,p_condition_element=>'P81_PSSNGRSTATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456952771135697629)
,p_event_id=>wwv_flow_api.id(456952342007697627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81_RANKDESIGNATION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(456953245262697630)
,p_event_id=>wwv_flow_api.id(456952342007697627)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81_RANKDESIGNATION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(455844103506552732)
,p_name=>'P81_TRNSPRTMODEID changed to LAND'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P81_TRNSPRTMODEID'
,p_condition_element=>'P81_TRNSPRTMODEID'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455844276650552733)
,p_event_id=>wwv_flow_api.id(455844103506552732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(455844063748552731)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455844385764552734)
,p_event_id=>wwv_flow_api.id(455844103506552732)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(455844063748552731)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455844612700552737)
,p_event_id=>wwv_flow_api.id(455844103506552732)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456943182559610271)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455844700986552738)
,p_event_id=>wwv_flow_api.id(455844103506552732)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(456943182559610271)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456672736045754398)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CREATE_LAND_TRANSPORT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--:P81_TRNSPRTUNITID := sys_guid;',
'',
'INSERT into TRANSPORTUNITS(DIRECTIONFLG,TRNSPRTMODEID,TRNSPRTSTATUS,NAME,TRNSPRTDATE,ACTIVE,VEHICLEMODELID,CONTAININGTRNSPRTUNITID)',
'VALUES(:P81_DIRECTIONFLG, :P81_TRNSPRTMODEID, :P81_TRNSPRTSTATUS, :P81_NAME, sysdate(), 1, :P81_VEHICLEMODELID, null) returning TRNSPRTUNITID into :P81_TRNSPRTUNITID;',
'',
':AI_LAST_USED_TRNSPRT_UNIT := :P81_TRNSPRTUNITID;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST = ''CREATE'' and :P81_TRNSPRTUNITID is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456368617930473545)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST = ''CREATE'''
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(456946947599612746)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATEBORDERMOVEMENT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DL_MALE_BC.CREATEBORDERMOVEMENT(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, :DG_EXPIRATIONDATE, :MOVEMENT_ENTRY_EXIT, :MVT_OBSERVATION, 0, :DG_FINGERCHECKED, :TRNSPRTUNITID, :AI_TERMINAL_IP, :P82_PSSNGRSTATUS, :P82_RANKDESIGNATION);',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST = ''REQUEST_PROCESSBORDERDOCUMENT'' and :P81_DIRECTIONFLG <> 2'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
