prompt --application/pages/page_01000
begin
wwv_flow_api.create_page(
 p_id=>1000
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Change Your Password'
,p_page_mode=>'NORMAL'
,p_step_title=>'Change Your Password'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Change Your Password'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(63083691516202944)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'Y'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'Here you can change your personal password.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20170411081401'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59109746420959452)
,p_plug_name=>'Change Your Password'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY_1'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59110194389959476)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(59109746420959452)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59110547442959488)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(59109746420959452)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(59115227236959600)
,p_branch_action=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:1000::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(59115697553959608)
,p_branch_name=>'Logout'
,p_branch_action=>'&LOGOUT_URL.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59110977108959491)
,p_name=>'P1000_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59109746420959452)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Username'
,p_source=>'APP_USER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_colspan=>7
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59111357426959504)
,p_name=>'P1000_OLD_PW'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(59109746420959452)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Old Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59111716797959511)
,p_name=>'P1000_NEW_PW'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(59109746420959452)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Enter a new password for your user account. Recommendation - the password should contain at least 8 characters, an Upper case character, an lower case character and a digit. When the administrator has enables stong password rules, this rules will be '
||'enforced.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59112637587959528)
,p_name=>'P1000_NEW_PW2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(59109746420959452)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirm New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Please repeat the new password.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(59113612681959575)
,p_validation_name=>'P1000_NEW_PW2_check'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'  w_fehler varchar2(200) := ''The password does not match the repetition.'';',
'BEGIN',
'  if :P1000_NEW_PW != :P1000_NEW_PW2 then',
'    return w_fehler;',
'  else ',
'    return null;',
'  end if;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(59112637587959528)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(59114315538959590)
,p_name=>'Set Focus'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(59114768629959594)
,p_event_id=>wwv_flow_api.id(59114315538959590)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1000_NEW_PW'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(59113895378959583)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Change Custom Password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_man_users.CHANGE_PASSWORD (',
'      i_username => :P1000_USER_NAME, i_password_new => :P1000_NEW_PW, i_password_old => :P1000_OLD_PW',
'   );'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST != ''CANCEL'''
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Password saved.'
);
end;
/
