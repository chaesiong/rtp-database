prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(106430524328307700)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'Login Page'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Login Page'
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
,p_step_template=>wwv_flow_api.id(106380345870307428)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DNOTZON'
,p_last_upd_yyyymmddhh24miss=>'20180625120701'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146615363913815342)
,p_plug_name=>'Login Screen'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134462112353750832)
,p_plug_name=>'Version Number'
,p_parent_plug_id=>wwv_flow_api.id(146615363913815342)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(106386861324307487)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'pkg_common.print_loginversion_html(''reentry'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146615447950815343)
,p_plug_name=>'Login'
,p_parent_plug_id=>wwv_flow_api.id(146615363913815342)
,p_region_template_options=>'#DEFAULT#:t-Form--xlarge'
,p_plug_template=>wwv_flow_api.id(106393659084307503)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146615625362815344)
,p_plug_name=>'Thai Police Logo'
,p_parent_plug_id=>wwv_flow_api.id(146615363913815342)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(158680643548902231)
,p_plug_name=>'Headlines'
,p_region_name=>'headlinesRegion'
,p_parent_plug_id=>wwv_flow_api.id(146615363913815342)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
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
 p_id=>wwv_flow_api.id(132966126697853131)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(146615447950815343)
,p_button_name=>'LOGIN'
,p_button_static_id=>'loginButton'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(106419823729307603)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In to Re-Entry'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-circle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(132965473578853122)
,p_name=>'P101_MODULE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146615363913815342)
,p_source=>'SELECT APPLICATION_NAME FROM apex_applications WHERE APPLICATION_ID = NV(''APP_ID'')'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(132966537863853132)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146615447950815343)
,p_prompt=>'username'
,p_placeholder=>'username'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="off"'
,p_field_template=>wwv_flow_api.id(106419109317307585)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(132966912888853134)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(146615447950815343)
,p_prompt=>'password'
,p_placeholder=>'password'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="off"'
,p_field_template=>wwv_flow_api.id(106419109317307585)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(132968343322853144)
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
 p_id=>wwv_flow_api.id(132967919773853143)
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
 p_id=>wwv_flow_api.id(132969115340853145)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(132968724876853144)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_when_type=>'NEVER'
);
end;
/
