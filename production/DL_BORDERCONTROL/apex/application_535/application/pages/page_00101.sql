prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'BBS - Biometric Blacklist System - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Login-container {',
'width: 1000px;',
'}',
'.t-Form-itemWrapper {',
'    padding:7px;',
'}',
'form[name="wwv_flow"] {',
'    background: linear-gradient(141deg, #8aa5d1 0%, #4f73ad 41%, #8aa5d1 95%);',
'}',
'',
'.t-Login-container',
'{',
'    max-width:1000px;    ',
'    width: 1000px;',
'    font-weight:bold;',
'}',
'',
'.t-Login-region {',
'    box-shadow: none !important;',
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
'/*.t-Region .t-Region-body',
'{',
'    padding: 0px !important;',
'}*/',
'',
'.t-Login-header ',
'{',
'    padding: 0px !important;',
'}',
'',
'.t-Login-region .t-Form-inputContainer, .t-Login-region .t-Form-labelContainer {',
'    padding-bottom: 0px;',
'}',
'',
'.t-Login-body .t-Form-inputContainer:before {',
'    padding-top: 0.6rem;',
'}',
'',
'.loginVersion',
'{',
'    font-size: small;',
'}',
''))
,p_step_template=>wwv_flow_api.id(15237154593705223)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20180615182652'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35296093513869546)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_region_attributes=>'style="border-radius: 10px;"'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15287854343705318)
,p_plug_name=>'Login'
,p_region_name=>'loginRegion'
,p_parent_plug_id=>wwv_flow_api.id(35296093513869546)
,p_region_css_classes=>' t-Region--noBorder'
,p_icon_css_classes=>'fa-sign-in'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(15253521093705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--span class="loginVersion" id="loginVersion">Version &AI_VERSION./&AI_VERSION_BBS.',
'</span-->'))
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56762035593779613)
,p_plug_name=>'VersionNumber'
,p_parent_plug_id=>wwv_flow_api.id(15287854343705318)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15243749782705235)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'dl_bordercontrol.pkg_common.print_loginversion_html(''bbs'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35295932309869545)
,p_plug_name=>'Logo'
,p_region_name=>'loginAppLogo'
,p_parent_plug_id=>wwv_flow_api.id(35296093513869546)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center style="margin-top: 100px;"><img style="width:300px" src="#WORKSPACE_IMAGES#Immigration_Thai.png"/></center>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35296296010869548)
,p_plug_name=>'Royal Thai Police'
,p_region_name=>'headlinesRegion'
,p_parent_plug_id=>wwv_flow_api.id(35296093513869546)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="loginHeadline" id="loginHeadline">Royal Thai Police Immigration Bureau<br/>',
'Biometric and demographic Blacklist System<br/>',
'<span class="loginAppAlias" id="loginAppAlias">&P101_MODULE_NAME.</span><br/></span>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15288137892705319)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(15287854343705318)
,p_button_name=>'LOGIN'
,p_button_static_id=>'loginButton'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In to BBS'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-circle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15287997463705318)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15287854343705318)
,p_prompt=>'username'
,p_placeholder=>'username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="off"'
,p_field_template=>wwv_flow_api.id(15275973429705290)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15288045037705318)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(15287854343705318)
,p_prompt=>'password'
,p_placeholder=>'password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="off"'
,p_field_template=>wwv_flow_api.id(15275973429705290)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42986260657754401)
,p_name=>'P101_MODULE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(35296093513869546)
,p_source=>'SELECT APPLICATION_NAME FROM apex_applications WHERE APPLICATION_ID = NV(''APP_ID'')'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15288333413705319)
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
 p_id=>wwv_flow_api.id(15288286877705319)
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
 p_id=>wwv_flow_api.id(15288568790705320)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15288431188705319)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_when_type=>'NEVER'
);
end;
/
