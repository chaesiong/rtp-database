prompt --application/pages/page_07005
begin
wwv_flow_api.create_page(
 p_id=>7005
,p_user_interface_id=>wwv_flow_api.id(92393441321433977)
,p_name=>'Change Your Password (First Login)'
,p_page_mode=>'NORMAL'
,p_step_title=>'Change Your Password (First Login)'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Change Your Password (First Login)'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(92347225088433695)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'Here you can change your personal password.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190822023656'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(224318450424484834)
,p_plug_name=>'Change Your Password'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
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
 p_id=>wwv_flow_api.id(106935408049608372)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(224318450424484834)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(92382587160433869)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106935794570608373)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(224318450424484834)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(92382587160433869)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4683851359900328606)
,p_branch_name=>'Go To P7005_REDIRECT_TO'
,p_branch_action=>'DECLARE'||wwv_flow.LF||
'    l_url    VARCHAR2(2000) := NULL;'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'    SELECT notice'||wwv_flow.LF||
'    INTO l_url'||wwv_flow.LF||
'    FROM user_management.lookups'||wwv_flow.LF||
'    WHERE key_category = :P7005_REDIRECT_TO'||wwv_flow.LF||
'    AND key_value = 0'||wwv_flow.LF||
'    AND is_active = ''Y'''||wwv_flow.LF||
'    AND notice IS NOT NULL;'||wwv_flow.LF||
'    '||wwv_flow.LF||
'    RETURN l_url;'||wwv_flow.LF||
'END;'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NULL',
'FROM user_management.lookups',
'WHERE key_category = :P7005_REDIRECT_TO',
'AND key_value = 0',
'AND is_active = ''Y''',
'AND notice IS NOT NULL',
'AND TRIM(:P7005_REDIRECT_TO) IS NOT NULL',
';'))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(106940610281608393)
,p_branch_name=>'Go To Page 111'
,p_branch_action=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:7005:P101_USERNAME:&P7005_USER_NAME.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(106940971133608395)
,p_branch_name=>'Logout'
,p_branch_action=>'&LOGOUT_URL.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106936184223608375)
,p_name=>'P7005_USER_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(224318450424484834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Username'
,p_source=>'APP_USER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(92382317437433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106936566508608376)
,p_name=>'P7005_OLD_PW'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(224318450424484834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Old Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(92382317437433857)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106937000775608377)
,p_name=>'P7005_NEW_PW'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(224318450424484834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(92382317437433857)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Enter a new password for your user account. Recommendation - the password should contain at least 8 characters, an Upper case character, an lower case character and a digit. When the administrator has enables stong password rules, this rules will be '
||'enforced.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106937857679608384)
,p_name=>'P7005_NEW_PW2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(224318450424484834)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirm New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(92382317437433857)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Please repeat the new password.'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683851109572328604)
,p_name=>'P7005_REDIRECT_TO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(224318450424484834)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(106938885563608386)
,p_validation_name=>'P7005_NEW_PW2_check'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'  w_fehler varchar2(200) := ''The password does not match the repetition.'';',
'BEGIN',
'  if :P7005_NEW_PW != :P7005_NEW_PW2 then',
'    return w_fehler;',
'  else ',
'    return null;',
'  end if;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'N'
,p_validation_condition=>':REQUEST != ''CANCEL'''
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(106937857679608384)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106939611911608389)
,p_name=>'Set Focus'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106940090822608390)
,p_event_id=>wwv_flow_api.id(106939611911608389)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7005_NEW_PW'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106939229982608388)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Change Custom Password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'user_management.pkg_man_users.CHANGE_PASSWORD (',
'      i_username => :P7005_USER_NAME, i_password_new => :P7005_NEW_PW, i_password_old => :P7005_OLD_PW',
'   );'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST != ''CANCEL'''
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Password saved.'
);
end;
/
