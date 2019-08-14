prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(45965479290928181)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'VOA: Visa on Arrival - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Login-region {',
'    box-shadow: none;',
'}',
'',
'.t-Login-header ',
'{',
'    padding: 0px !important;',
'}',
'',
'.t-Login-container',
'{',
'    max-width:1000px;  ',
'    width: 1000px;  ',
'    font-weight:bold;',
'}',
'',
'.loginHeadline{',
'    font-weight: normal;',
'    font-size: x-large;',
'    line-height: 3rem;',
'}',
'.loginAppAlias',
'{',
'    font-weight: bold;',
'    font-size: x-large;',
'    font-style: italic;',
'    line-height: 7rem;',
'}',
'',
'#headlinesRegion',
'{',
'    padding: 36px;',
'    margin-top: 25px;',
'}',
'',
'.t-Region .t-Region-body',
'{',
'    padding: 0px !important;',
'}',
'',
'.loginVersion',
'{',
'    font-size: small;',
'}',
''))
,p_step_template=>wwv_flow_api.id(45915300832927909)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180626141136'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53198552223831775)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53198636260831776)
,p_plug_name=>'Login'
,p_region_name=>'loginRegion'
,p_parent_plug_id=>wwv_flow_api.id(53198552223831775)
,p_region_template_options=>'#DEFAULT#:t-Form--xlarge'
,p_plug_template=>wwv_flow_api.id(45928614046927984)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>'<span class="loginVersion">Version &AI_APP_VERSION.</span>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(53198813672831777)
,p_plug_name=>'Thai Police Logo'
,p_region_name=>'loginAppLogo'
,p_parent_plug_id=>wwv_flow_api.id(53198552223831775)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center style="margin-top: 50px;"><img style="width:300px" src="#WORKSPACE_IMAGES#Immigration_Thai.png"/></center>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65263831858918664)
,p_plug_name=>'Headlines'
,p_region_name=>'headlinesRegion'
,p_parent_plug_id=>wwv_flow_api.id(53198552223831775)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(45928798426927985)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="loginHeadline" id="loginHeadline">Royal Thai Police Immigration Bureau<br/>',
'Biometric Border Control System Home<br/>',
'<span class="loginAppAlias" id="loginAppAlias">&P101_MODULE_NAME.</span><br/></span>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45966303554928274)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(53198636260831776)
,p_button_name=>'LOGIN'
,p_button_static_id=>'loginButton'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In to Visa On Arrival'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-circle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(108332131406908242)
,p_branch_name=>'Go to global login page'
,p_branch_action=>'f?p=GLOBAL_DIALOGS:LOGIN_DESKTOP:&SESSION.::&DEBUG.:RP,111:P111_REFERING_APP:&APP_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45966091439928269)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53198636260831776)
,p_prompt=>'username'
,p_placeholder=>'username'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="off"'
,p_field_template=>wwv_flow_api.id(45954064279928066)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45966115460928272)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53198636260831776)
,p_prompt=>'password'
,p_placeholder=>'password'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="off"'
,p_field_template=>wwv_flow_api.id(45954064279928066)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65263715577918663)
,p_name=>'P101_MODULE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(53198552223831775)
,p_source=>'SELECT APPLICATION_NAME FROM apex_applications WHERE APPLICATION_ID = NV(''APP_ID'')'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108332453869908245)
,p_name=>'P101_LOGIN_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(53198552223831775)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45966497880928283)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45966384914928276)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45966677962928289)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45966577457928284)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_when_type=>'NEVER'
);
end;
/
