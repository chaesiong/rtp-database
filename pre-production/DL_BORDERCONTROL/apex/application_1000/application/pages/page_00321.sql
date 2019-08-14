prompt --application/pages/page_00321
begin
wwv_flow_api.create_page(
 p_id=>321
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Permissions'
,p_page_mode=>'MODAL'
,p_step_title=>'Permissions (Object/Grants assignments) of selected Role'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_required_role=>wwv_flow_api.id(58964392495783603)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180905145608'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63660664401637309)
,p_plug_name=>'Assign Permissions to Role'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63661225259637310)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(63660664401637309)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63661033889637310)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(63660664401637309)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:320:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(63665617674637329)
,p_branch_action=>'f?p=&APP_ID.:320:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63662836904637318)
,p_name=>'P321_ROLE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(63660664401637309)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROLES_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case t.SOURCE',
'         when 1 then',
'          ''AD''',
'         else',
'          ''UM''',
'       end || '': '' || t.NAME as d',
'      ,t.ID_OR_DN as r',
'  from ROLE_POOL t',
' order by t.SOURCE desc',
'         ,t.SORT_ORDER',
'         ,t.NAME',
''))
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63663183062637322)
,p_name=>'P321_OBJECT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(63660664401637309)
,p_prompt=>'Object'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'OBJECTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.NAME',
'          ,t.NAME$DLC) as d',
'      ,t.ID as r',
'  from OBJECTS$LC t',
' order by t.SORT_ORDER',
'         ,t.NAME',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when=>'P321_OBJECT_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63663587636637323)
,p_name=>'P321_GRANT_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(63660664401637309)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Grants  (Available <-> Assigned)'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select og.grant_id',
'from role_object_grant_rel rog',
'join object_grant_rel og on rog.object_grant_rel_id = og.id',
'where coalesce(rog.role_id,rog.role_dn) = :P321_ROLE_ID',
'and og.object_id = :P321_OBJECT_ID'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select g.name as d, g.id as r',
'from object_grant_rel r',
'join grants g on r.grant_id = g.id',
'where r.object_id = :P321_OBJECT_ID',
'order by 1'))
,p_lov_cascade_parent_items=>'P321_ROLE_ID,P321_OBJECT_ID'
,p_ajax_items_to_submit=>'P321_ROLE_ID,P321_OBJECT_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(63753679451105146)
,p_name=>'GET_GRANTS'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P321_OBJECT_ID,P321_ROLE_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(63754079122105149)
,p_event_id=>wwv_flow_api.id(63753679451105146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P321_GRANT_ID'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select listagg(og.grant_id, '':'') within group (order by og.grant_id) grant_ids',
'from role_object_grant_rel rog',
'join object_grant_rel og on rog.object_grant_rel_id = og.id',
'where coalesce(rog.role_id,rog.role_dn) = :P321_ROLE_ID',
'and og.object_id = :P321_OBJECT_ID'))
,p_attribute_07=>'P321_ROLE_ID,P321_OBJECT_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63684802320002553)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_ROLE_PERMISSIONS'
,p_process_sql_clob=>'pkg_man_users.Save_Role_Permissions ( i_role_id => :P321_ROLE_ID, i_object_id => :P321_OBJECT_ID , i_grants_list => :P321_GRANT_ID );'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63661225259637310)
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
end;
/
