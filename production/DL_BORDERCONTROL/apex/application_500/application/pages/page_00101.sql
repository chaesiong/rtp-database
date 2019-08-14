prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'Login Page'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Login Page'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_IMAGES#css/background.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'    padding-right: 0;',
'}',
'',
'.t-Region .t-Region-body',
'{',
'    padding: 0px !important;',
'}',
'',
'.t-Login-header ',
'{',
'    padding: 0px !important;',
'}',
'',
'.loginVersion',
'{',
'    font-size: small;',
'}',
'',
'div.row {',
'    margin: initial;',
'}'))
,p_step_template=>wwv_flow_api.id(563806730438049611)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'CHRISTINA'
,p_last_upd_yyyymmddhh24miss=>'20181107144215'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(234468013539523075)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_region_attributes=>'style="border-radius: 10px;"'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(234468125435523076)
,p_plug_name=>'Thai Police Logo'
,p_region_name=>'loginAppLogo'
,p_parent_plug_id=>wwv_flow_api.id(234468013539523075)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(234468165375523077)
,p_plug_name=>'Headlines'
,p_region_name=>'headlinesRegion'
,p_parent_plug_id=>wwv_flow_api.id(234468013539523075)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(243899637886259087)
,p_plug_name=>'Login'
,p_region_name=>'loginRegion'
,p_parent_plug_id=>wwv_flow_api.id(234468013539523075)
,p_region_css_classes=>' t-Region--noBorder'
,p_icon_css_classes=>'fa-sign-in'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(563820671301049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(128280422789666518)
,p_plug_name=>'Version Number'
,p_parent_plug_id=>wwv_flow_api.id(243899637886259087)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*htp.prn(''<span class="loginVersion" id="loginVersion">'');',
'for c_row in (select pkg_common.get_module_version(:P0_MODULE_NAME_LOOKUP) module_version, pkg_common.get_release_version() release_version from dual) loop',
'    htp.prn(''Release: <span id="versionNumberRelease">'' || replace(c_row.release_version, ''<'', ''&lt;'') || ''</span>'');',
'    htp.prn(''Module: <span id="versionNumberModule">'' || replace(c_row.module_version, ''<'', ''&lt;'') || ''</span>'');',
'end loop;',
'htp.prn(''</span>'');',
'*/',
'pkg_common.print_loginversion_html(''bmbs'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(619763122557882205)
,p_plug_name=>'<h1>BmBS - Biometric Bordercontrol System</h1> #APP_VERSION# <div id="P101_CAPSLOCK_WARNING" style="display: none"><h2 style="color: red">CAPS-LOCK is enabled!</h2></div>'
,p_region_name=>'ID_REG_LOGIN'
,p_region_css_classes=>'font-size:large;'
,p_region_sub_css_classes=>'font-size:large;'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding:30px;border-radius:15px"'
,p_plug_template=>wwv_flow_api.id(563820671301049617)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(609613146945197031)
,p_plug_name=>'Login'
,p_parent_plug_id=>wwv_flow_api.id(619763122557882205)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183733306670438649)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(619763122557882205)
,p_button_name=>'RESETHARDWARE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Restart Hardware'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-wrench'
,p_button_cattributes=>'style="margin-top:-350px;margin-left:800px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183731791014438646)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(243899637886259087)
,p_button_name=>'LOGIN'
,p_button_static_id=>'loginButton'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In to &P101_MODULE_NAME.'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-circle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(183734341575438651)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(609613146945197031)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log in to BmBS'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-circle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(133529896569270538)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(243899637886259087)
,p_button_name=>'GLOBAL_LOGIN'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Go To Global Login'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=99999:111:&SESSION.::&DEBUG.:RP,111:P111_REFERING_APP:&APP_ID.'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(181669301147336832)
,p_branch_name=>'To Page 7005 (New Password)'
,p_branch_action=>'f?p=&APP_ID.:7005:&SESSION.::&DEBUG.::P7005_USER_NAME:&P101_USERNAME.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'FUNCTION_BODY'
,p_branch_condition=>'return user_management.pkg_man_users.IS_PWD_CHANGE_NECESSARY ( i_username => :P101_USERNAME );'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(143924580459387913)
,p_branch_name=>'Go to global login page'
,p_branch_action=>'f?p=99999:111:&SESSION.::&DEBUG.:RP,111:P111_REFERING_APP:500&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183730496780438642)
,p_name=>'P101_MODULE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(234468013539523075)
,p_use_cache_before_default=>'NO'
,p_source=>'SELECT APPLICATION_NAME FROM apex_applications WHERE APPLICATION_ID = NV(''APP_ID'')'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183732159367438646)
,p_name=>'P101_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(243899637886259087)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete=off'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183732566879438648)
,p_name=>'P101_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(243899637886259087)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="off"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183734648318438652)
,p_name=>'P101_USERNAME_1'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(609613146945197031)
,p_prompt=>'Username'
,p_placeholder=>'username'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete=off'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183735116051438654)
,p_name=>'P101_PASSWORD_1'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(609613146945197031)
,p_prompt=>'Password'
,p_placeholder=>'password'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(183735509546438654)
,p_name=>'P101_TERMINALOK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(609613146945197031)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(183737525189438658)
,p_name=>'DA_RESTARTHW'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(183733306670438649)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(183737948839438659)
,p_event_id=>wwv_flow_api.id(183737525189438658)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'callSystemServlet("restart");',
'alert(''Hardware Reset in progress, please wait 10 seconds before you log-on to the System'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183736317602438656)
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
 p_id=>wwv_flow_api.id(183735846740438656)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'--  Define Landing Page',
'   PKG_DL_AUTHORIZATION.Define_Landing_Page(:P101_USERNAME);',
'   ',
'   apex_authentication.login(p_username => :P101_USERNAME, p_password =>',
'   :P101_PASSWORD) ;',
'  ',
'   select PKG_APEX_UTIL.Get_Authorisation_Level(:P101_USERNAME, :P101_PASSWORD, :AI_PARAMETER_OPENLDAPBASE,:AI_PARAMETER_OPENLDAPHOST) INTO :AI_CURRENT_USER_RIGHTS from dual;',
'/*  ',
'   select DECODE(:AI_CURRENT_USER_RIGHTS, 100, ''Management'', 200, ''Secondary'', 300, ''Primary'', ''No Role'') INTO :AI_CURRENT_USER_RIGHTS_HR from dual;',
'   select DECODE(:AI_CURRENT_USER_RIGHTS, 100, 5, 200, 5, 300, 2,2) INTO :AI_MAX_MOVEMENTS_TO_SHOW from dual;',
'*/',
'   ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183737129602438657)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(183736663293438657)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_when_type=>'NEVER'
);
end;
/
