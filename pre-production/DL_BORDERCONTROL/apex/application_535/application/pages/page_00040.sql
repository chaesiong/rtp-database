prompt --application/pages/page_00040
begin
wwv_flow_api.create_page(
 p_id=>40
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Edit Address'
,p_page_mode=>'MODAL'
,p_step_title=>'Edit Address'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_IMAGES#css/application-overwrite.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20180924142126'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96538677244918430)
,p_plug_name=>'Addresses'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48312599261575009)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(96538677244918430)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94388448105593112)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(96538677244918430)
,p_button_name=>'UPDATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update Address'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48312446604575008)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(96538677244918430)
,p_button_name=>'ADD'
,p_button_static_id=>'ADD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Address'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94389379859593121)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(96538677244918430)
,p_button_name=>'DELETE'
,p_button_static_id=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Delete Address'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P40_ADDRESS_ID IS NOT NULL'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48359700112813851)
,p_name=>'P40_ADDRESS_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'ADDRESS_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48360116855813858)
,p_name=>'P40_ROAD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Road'
,p_source=>'ROAD'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48360514815813859)
,p_name=>'P40_BUILDING'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Building'
,p_source=>'BUILDING'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48360985085813860)
,p_name=>'P40_MOO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Moo'
,p_source=>'MOO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>400
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48361346363813861)
,p_name=>'P40_SUB_DISTRICT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub district'
,p_source=>'SUB_DISTRICT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value ',
'  FROM lov_adm_class_subdistrict ',
'  WHERE adm_class_district = (SELECT return_value from lov_adm_class_district WHERE display_value = :P40_DISTRICT)'))
,p_lov_cascade_parent_items=>'P40_DISTRICT'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'EXACT_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48361726766813862)
,p_name=>'P40_DISTRICT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'District'
,p_source=>'DISTRICT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value FROM lov_adm_class_district',
'  WHERE adm_class_province = (SELECT return_value from lov_adm_class_province WHERE display_value = :P40_PROVINCE)'))
,p_lov_cascade_parent_items=>'P40_PROVINCE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'EXACT_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48362127362813865)
,p_name=>'P40_PROVINCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Province'
,p_source=>'PROVINCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'SELECT display_value FROM lov_adm_class_province'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'EXACT_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48362569228813865)
,p_name=>'P40_ZIPCODE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Zipcode'
,p_source=>'ZIPCODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>8
,p_cMaxlength=>80
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48362965341813866)
,p_name=>'P40_COUNTRY'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Country/ State'
,p_source=>'COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.COUNTRIES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48931101353296326)
,p_name=>'P40_ADDRESS_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49984105443599004)
,p_name=>'P40_IDENTITY_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_use_cache_before_default=>'NO'
,p_source=>'IDENTITY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94390189357593129)
,p_name=>'P40_ADDRESS_DELETE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96538677244918430)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(49984230015599005)
,p_computation_sequence=>10
,p_computation_item=>'P40_ADDRESS_ID'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'sys_guid()'
,p_compute_when=>'P40_ADDRESS_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48315669185575040)
,p_name=>'CancelDialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48312599261575009)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48315703635575041)
,p_event_id=>wwv_flow_api.id(48315669185575040)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48930998054296324)
,p_name=>'LoadExistingAddress'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48931066884296325)
,p_event_id=>wwv_flow_api.id(48930998054296324)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--P40_ADDRESS_ID  P40_ADDRESS_NAME,P40_ROAD,P40_BUILDING,P40_MOO,P40_SUB_DISTRICT,P40_DISTRICT,P40_PROVINCE,P40_ZIPCODE,P40_COUNTRY',
'',
'SELECT ',
'        id',
'        ,identity',
'        ,is_active',
'        ,ins_at',
'        ,ins_by',
'        ,name ',
'        ,noo AS moo',
'        ,building',
'        ,road',
'        ,sub_district',
'        ,district',
'        ,province',
'        ,zipcode',
'        ,country',
'  FROM dl_blacklist.addresses',
'  ',
'WHERE id = :P40_ADDRESS_ID;'))
,p_attribute_02=>'P40_ADDRESS_ID'
,p_attribute_03=>'P40_ADDRESS_NAME,P40_ROAD,P40_BUILDING,P40_MOO,P40_SUB_DISTRICT,P40_DISTRICT,P40_PROVINCE,P40_ZIPCODE,P40_COUNTRY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(48931280114296327)
,p_name=>'New'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(48312446604575008)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48931380787296328)
,p_event_id=>wwv_flow_api.id(48931280114296327)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_address pkg_db_access.address_1_r;',
'    l_id pkg_utils.id_t;',
'begin',
'    l_address.address_name:= :P40_ADDRESS_NAME;',
'    l_address.road := :P40_ROAD;',
'    l_address.moo := :P40_MOO;',
'    l_address.district := :P40_DISTRICT;',
'    l_address.building := :P40_BUILDING;',
'    l_address.sub_district := :P40_SUB_DISTRICT;',
'    l_address.province := :P40_PROVINCE;',
'    l_address.zipcode := :P40_ZIPCODE;',
'    l_address.country := :P40_COUNTRY;',
'    l_address.id := :P40_ADDRESS_ID;',
'    l_address.identity := :P40_IDENTITY_ID;',
'    l_id := :P40_IDENTITY_ID;',
'',
'	pkg_db_access.put_address_for_identity(l_address, l_id);',
'	',
'end;'))
,p_attribute_02=>'P40_IDENTITY_ID,P40_ADDRESS_ID,P40_ADDRESS_NAME,P40_ROAD,P40_BUILDING,P40_MOO,P40_SUB_DISTRICT,P40_DISTRICT,P40_PROVINCE,P40_ZIPCODE,P40_COUNTRY'
,p_attribute_03=>'P40_ADDRESS_ID'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48931458493296329)
,p_event_id=>wwv_flow_api.id(48931280114296327)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh.apex.region(''Addresses'').refresh();',
'top.windowToRefresh = null;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(48931690782296331)
,p_event_id=>wwv_flow_api.id(48931280114296327)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94388511716593113)
,p_name=>'OnClickUpdate'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94388448105593112)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94388616454593114)
,p_event_id=>wwv_flow_api.id(94388511716593113)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#ADD").click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94388725494593115)
,p_name=>'Show_ADD'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P40_ADDRESS_ID IS NULL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94388872248593116)
,p_event_id=>wwv_flow_api.id(94388725494593115)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(48312446604575008)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94388949513593117)
,p_event_id=>wwv_flow_api.id(94388725494593115)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(94388448105593112)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94389005245593118)
,p_name=>'Show_UPDATE'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>':P40_ADDRESS_ID IS NOT NULL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94389276054593120)
,p_event_id=>wwv_flow_api.id(94389005245593118)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(48312446604575008)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94390721686593135)
,p_event_id=>wwv_flow_api.id(94389005245593118)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(94388448105593112)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94389480144593122)
,p_name=>'OnClickDelete'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(94389379859593121)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94390803716593136)
,p_event_id=>wwv_flow_api.id(94389480144593122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'&P40_ADDRESS_DELETE.'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94389679713593124)
,p_event_id=>wwv_flow_api.id(94389480144593122)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'begin',
'	pkg_db_access.delete_address(:P40_ADDRESS_ID);',
'end;'))
,p_attribute_02=>'P40_ADDRESS_ID'
,p_attribute_03=>'P40_ADDRESS_ID'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94389766402593125)
,p_event_id=>wwv_flow_api.id(94389480144593122)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.windowToRefresh.apex.region(''Addresses'').refresh();',
'top.windowToRefresh = null;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94389860043593126)
,p_event_id=>wwv_flow_api.id(94389480144593122)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(49983906316599002)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row'
,p_attribute_02=>'ADDRESSES'
,p_attribute_03=>'P40_ADDRESS_ID'
,p_attribute_04=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94390057446593128)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetItems'
,p_process_sql_clob=>':P40_ADDRESS_DELETE := APEX_LANG.MESSAGE (''ADDRESS.DELETE'');'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
