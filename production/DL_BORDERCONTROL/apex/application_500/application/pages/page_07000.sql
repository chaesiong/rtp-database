prompt --application/pages/page_07000
begin
wwv_flow_api.create_page(
 p_id=>7000
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Change Password'
,p_page_mode=>'MODAL'
,p_step_title=>'Change Password'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Change Password'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'Here you can change your personal password.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190208005035'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187818275854181520)
,p_plug_name=>'Change Your Password'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
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
 p_id=>wwv_flow_api.id(187818715338181528)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(187818275854181520)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save and Close'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187819071017181532)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(187818275854181520)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187819524106181542)
,p_name=>'P7000_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(187818275854181520)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Username'
,p_source=>'APP_USER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187819851492181546)
,p_name=>'P7000_OLD_PW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(187818275854181520)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Old Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187820281382181547)
,p_name=>'P7000_NEW_PW'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(187818275854181520)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Enter a new password for your user account. Recommendation - the password should contain at least 8 characters, an Upper case character, an lower case character and a digit. When the administrator has enables stong password rules, this rules will be '
||'enforced.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187821219428181554)
,p_name=>'P7000_NEW_PW2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(187818275854181520)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirm New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Please repeat the new password.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187822100451181569)
,p_validation_name=>'P7000_NEW_PW2_check'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'  w_fehler varchar2(200) := ''The password does not match the repetition.'';',
'BEGIN',
'  if :P7000_NEW_PW != :P7000_NEW_PW2 then',
'    return w_fehler;',
'  else ',
'    return null;',
'  end if;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'N'
,p_validation_condition=>':REQUEST != ''CANCEL'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(187821219428181554)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(187822776035181573)
,p_name=>'Set Focus'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187823304143181577)
,p_event_id=>wwv_flow_api.id(187822776035181573)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7000_NEW_PW'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187822392344181570)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Change Custom Password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'USER_MANAGEMENT.pkg_man_users.CHANGE_PASSWORD (',
'      i_username => :P7000_USER_NAME, i_password_new => :P7000_NEW_PW, i_password_old => :P7000_OLD_PW',
'   );'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST != ''CANCEL'''
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Password saved.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187830861301253559)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal Form'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
