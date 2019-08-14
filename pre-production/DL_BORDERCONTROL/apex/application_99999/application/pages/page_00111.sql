prompt --application/pages/page_00111
begin
wwv_flow_api.create_page(
 p_id=>111
,p_user_interface_id=>wwv_flow_api.id(92393441321433977)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'Login Page'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Login Page'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#global_include.js',
'#WORKSPACE_IMAGES#GenericFunctions.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*var SESSION_IDLE_TIMEOUT = 900000; //15 Minutes',
'addTime = 36000;  //10 Hours',
'',
'window.setInterval(function(){',
'    addTime = addTime + SESSION_IDLE_TIMEOUT/1000;',
'    ',
'    apex.server.process(',
'        ''EXTEND_SESSION_IDLE_TIMEOUT'',   // Process or AJAX Callback name',
'        {',
'            x01: addTime',
'        }, //No Parameters',
'        {',
'            success: function (pData) ',
'            {        ',
'                console.log(''Session Lifetime extended to '' + pData.SET_SESSION_LIFETIME_SECONDS + '' seconds for session '' + pData.APEX_SESSION_ID);',
'                console.log(pData);',
'            }',
'        }',
'    );',
'}, SESSION_IDLE_TIMEOUT);*/'))
,p_css_file_urls=>'#WORKSPACE_IMAGES#roboto.css'
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
'}',
'',
'body {',
'    font-family: "Roboto";',
'}',
'',
'#id-div-userMessage {',
'    text-align: center;',
'    margin-top: 2em;',
'}'))
,p_step_template=>wwv_flow_api.id(92343242614433675)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190719005818'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(264762124580425291)
,p_plug_name=>'Wrapper'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_region_attributes=>'style="border-radius: 10px;"'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_column_width=>'style="filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, 0.3))"'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44647325433055098)
,p_plug_name=>'No Terminal'
,p_parent_plug_id=>wwv_flow_api.id(264762124580425291)
,p_region_css_classes=>' t-Region--noBorder'
,p_icon_css_classes=>'fa-sign-in'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(92356496799433749)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'No valid terminal. Please contact your system administrator to enable access for this terminal with IP Address &P111_CLIENT_IP_ADDR..'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P111_TERMINAL_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(264762236476425292)
,p_plug_name=>'Thai Police Logo'
,p_parent_plug_id=>wwv_flow_api.id(264762124580425291)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>50
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
 p_id=>wwv_flow_api.id(264762276416425293)
,p_plug_name=>'Headlines'
,p_region_name=>'headlinesRegion'
,p_parent_plug_id=>wwv_flow_api.id(264762124580425291)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="loginHeadline" id="loginHeadline">&P111_MODULE_DESC.<br/>',
'<span class="loginAppAlias" id="loginAppAlias">&P111_APPLICATION_NAME.</span><br/></span>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(274193748927161303)
,p_plug_name=>'Login'
,p_parent_plug_id=>wwv_flow_api.id(264762124580425291)
,p_region_css_classes=>' t-Region--noBorder'
,p_icon_css_classes=>'fa-sign-in'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(92356496799433749)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P111_TERMINAL_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(158574533830568734)
,p_plug_name=>'Version Number'
,p_parent_plug_id=>wwv_flow_api.id(274193748927161303)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92349780431433729)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'pkg_common.print_loginversion_html(:P111_MODULE_NAME);'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4686930098933369046)
,p_plug_name=>'User Message'
,p_region_name=>'id-div-userMessage'
,p_parent_plug_id=>wwv_flow_api.id(264762124580425291)
,p_region_css_classes=>'userMessage'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<span class="cl-span-userMessage">&P111_USER_MESSAGE.</span>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(650057233598784421)
,p_plug_name=>'<h1>BmBS - Biometric Bordercontrol System</h1> #APP_VERSION# <div id="P101_CAPSLOCK_WARNING" style="display: none"><h2 style="color: red">CAPS-LOCK is enabled!</h2></div>'
,p_region_name=>'ID_REG_LOGIN'
,p_region_css_classes=>'font-size:large;'
,p_region_sub_css_classes=>'font-size:large;'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding:30px;border-radius:15px"'
,p_plug_template=>wwv_flow_api.id(92356496799433749)
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
 p_id=>wwv_flow_api.id(639906429018092883)
,p_plug_name=>'Image'
,p_parent_plug_id=>wwv_flow_api.id(650057233598784421)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92349780431433729)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><img style="width:250px" src="#WORKSPACE_IMAGES#cambodia_logo_immigration.png"/></center>'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(639907257986099247)
,p_plug_name=>'Login'
,p_parent_plug_id=>wwv_flow_api.id(650057233598784421)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92349780431433729)
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
 p_id=>wwv_flow_api.id(106822406508488953)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(650057233598784421)
,p_button_name=>'RESETHARDWARE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_image_alt=>'Restart Hardware'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-wrench'
,p_button_cattributes=>'style="margin-top:-350px;margin-left:800px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106820617190488939)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(274193748927161303)
,p_button_name=>'LOGIN'
,p_button_static_id=>'loginButton'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In to &P111_MODULE_NAME.'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-circle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106823382571488956)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(639907257986099247)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log in to BmBS'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-chevron-circle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(96566925200556235)
,p_branch_name=>'Go to App Home URL'
,p_branch_action=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:RP,112::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(106827652876488974)
,p_branch_name=>'To Page 7005 (New Password)'
,p_branch_action=>'f?p=&APP_ID.:7005:&SESSION.::&DEBUG.::P7005_USER_NAME:&P111_USERNAME.'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'FUNCTION_BODY'
,p_branch_condition=>'return user_management.pkg_man_users.IS_PWD_CHANGE_NECESSARY ( i_username => :P111_USERNAME );'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44646757531055093)
,p_name=>'P111_TERMINAL_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44647708752055102)
,p_name=>'P111_CLIENT_IP_ADDR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96566454777556230)
,p_name=>'P111_REFERER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96566587997556232)
,p_name=>'P111_TARGET_URL_RAW'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96566790314556234)
,p_name=>'P111_REFERING_APP'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106819342171488927)
,p_name=>'P111_MODULE_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106821042499488943)
,p_name=>'P111_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(274193748927161303)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete=off'
,p_field_template=>wwv_flow_api.id(92381973140433851)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106821360751488944)
,p_name=>'P111_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(274193748927161303)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="off"'
,p_field_template=>wwv_flow_api.id(92381973140433851)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106823789458488956)
,p_name=>'P111_USERNAME_1'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(639907257986099247)
,p_prompt=>'Username'
,p_placeholder=>'username'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete=off'
,p_field_template=>wwv_flow_api.id(92381973140433851)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106824171240488957)
,p_name=>'P111_PASSWORD_1'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(639907257986099247)
,p_prompt=>'Password'
,p_placeholder=>'password'
,p_post_element_text=>'<span class="t-Login-iconValidation a-Icon icon-check"</span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(92381973140433851)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106824648460488957)
,p_name=>'P111_TERMINALOK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(639907257986099247)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106959177882673586)
,p_name=>'P111_TARGET_URL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106959998090673594)
,p_name=>'P111_MODULE_DESC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106960211070673596)
,p_name=>'P111_APPLICATION_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686929875528369044)
,p_name=>'P111_USER_MESSAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(264762124580425291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(106959519210673589)
,p_computation_sequence=>10
,p_computation_item=>'P111_REFERING_APP'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'regexp_replace(:P111_REFERER, ''.*p=([^:]*).*'', ''\1'')'
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(106959584825673590)
,p_computation_sequence=>20
,p_computation_item=>'P111_MODULE_NAME'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select alias from apex_applications where application_id = :P111_REFERING_APP or alias = :P111_REFERING_APP'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(106960371451673598)
,p_computation_sequence=>30
,p_computation_item=>'P111_APPLICATION_NAME'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select application_name from apex_applications where application_id = :P111_REFERING_APP or alias = :P111_REFERING_APP'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(106959697809673591)
,p_computation_sequence=>40
,p_computation_item=>'P111_TARGET_URL_RAW'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select home_url from apex_applications, apex_appl_user_interfaces where apex_applications.application_id = apex_appl_user_interfaces.application_id and apex_applications.application_id = :P111_REFERING_APP or alias = :P111_REFERING_APP'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(106959777286673592)
,p_computation_sequence=>50
,p_computation_item=>'P111_TARGET_URL'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'replace(replace(:P111_TARGET_URL_RAW, ''&'' || ''APP_ID.'', :P111_REFERING_APP), ''&'' || ''SESSION.'', :APP_SESSION)'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(106960116242673595)
,p_computation_sequence=>10
,p_computation_item=>'P111_MODULE_DESC'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select nvl(message_value, message_value$dlc) translation from dl_common.messages$lc where message_key = :P111_MODULE_NAME || ''\LOGIN\ModuleDescription'';'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4686929900791369045)
,p_computation_sequence=>20
,p_computation_item=>'P111_USER_MESSAGE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(message_text_thai, message_text_english)',
'        ELSE NVL(message_text_english, message_text_thai)',
'    END AS MESSAGE',
'FROM dl_common.user_messages',
'WHERE name = ''LOGIN_PAGE_DISPLAY''',
'AND applications = :P111_MODULE_NAME',
';'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106826637833488972)
,p_name=>'DA_RESTARTHW'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(146769943386724342)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106827108468488973)
,p_event_id=>wwv_flow_api.id(106826637833488972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'callSystemServlet("restart");',
'alert(''Hardware Reset in progress, please wait 10 seconds before you log-on to the System'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(128638994595753611)
,p_name=>'Determine Client IP'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128639062992753612)
,p_event_id=>wwv_flow_api.id(128638994595753611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'getClientIP((ip) => {',
'    executePageProcess(''setClientIP'', [ip]);',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106825400924488970)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P111_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106824994220488969)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'--  Define Landing Page',
'--   PKG_DL_AUTHORIZATION.Define_Landing_Page(:P111_USERNAME);',
'   ',
'   apex_authentication.login(p_username => :P111_USERNAME, p_password => :P111_PASSWORD) ;',
'  ',
'   --apex_util.set_session_state(''AI_LANDING_PAGE'',:P111_TARGET_URL);',
'   ',
'   select PKG_APEX_UTIL.Get_Authorisation_Level(:P111_USERNAME, :P111_PASSWORD, :AI_PARAMETER_OPENLDAPBASE,:AI_PARAMETER_OPENLDAPHOST) INTO :AI_CURRENT_USER_RIGHTS from dual;',
'/*  ',
'   select DECODE(:AI_CURRENT_USER_RIGHTS, 100, ''Management'', 200, ''Secondary'', 300, ''Primary'', ''No Role'') INTO :AI_CURRENT_USER_RIGHTS_HR from dual;',
'   select DECODE(:AI_CURRENT_USER_RIGHTS, 100, 5, 200, 5, 300, 2,2) INTO :AI_MAX_MOVEMENTS_TO_SHOW from dual;',
'*/',
'   ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106826160396488971)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44646742000055092)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_VALID_TERMINAL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_borderpost_name VARCHAR2(32000);',
'    l_borderpost_id   VARCHAR2(32000);',
'BEGIN',
'    :P111_CLIENT_IP_ADDR := DL_COMMON.PKG_UTIL.GET_CLIENT_IP();',
'    :AI_CLIENT_IP := :P111_CLIENT_IP_ADDR;',
'    --owa_util.get_cgi_env(''REMOTE_ADDR'');',
'    ',
'    dl_bordercontrol.pkg_apex_util.get_location_data (p_remote_addr     => :P111_CLIENT_IP_ADDR',
'                                                     ,x_borderpost_id   => l_borderpost_id',
'                                                     ,x_borderpost_name => l_borderpost_name',
'                                                     ,x_terminal_id     => :P111_TERMINAL_ID);',
'                                                                                                      ',
'EXCEPTION',
'    WHEN OTHERS',
'    THEN',
'        apex_error.add_error (',
'            p_message          => ''Your Terminal could not be registered'',',
'            p_display_location => apex_error.c_inline_in_notification);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106825767259488970)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P111_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96566320671556229)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Referer'
,p_process_sql_clob=>':P111_REFERER := owa_util.get_cgi_env(''HTTP_REFERER'');'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(128639256222753613)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'setClientIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_ip varchar2(255) := apex_application.g_x01;',
'begin',
'    :AI_CLIENT_IP := v_ip;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44649703927055122)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EXTEND_SESSION_IDLE_TIMEOUT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_timeout_seconds NUMBER := apex_application.g_x01;',
'    ',
'    l_session VARCHAR2(3200);',
'    l_username VARCHAR2(3200);',
'    l_session_created VARCHAR2(3200);',
'    l_session_idle_timeout_on VARCHAR2(3200);',
'    l_session_life_timeout_on VARCHAR2(3200);',
'    l_session_max_idle_sec NUMBER;',
'    l_current_date VARCHAR2(3200);',
'BEGIN',
'    --APEX_UTIL.SET_SESSION_LIFETIME_SECONDS ( l_timeout_seconds );',
'    --Extends the Current Apex Session by l_timeout_seconds/60 Minutes',
'',
'    SELECT ',
'        APEX_SESSION_ID,',
'        USER_NAME, ',
'        to_char(SESSION_CREATED,''dd.mm.yyyy HH24:MI:SS''), ',
'        to_char(SESSION_IDLE_TIMEOUT_ON,''dd.mm.yyyy HH24:MI:SS''),  ',
'        to_char(SESSION_LIFE_TIMEOUT_ON,''dd.mm.yyyy HH24:MI:SS''),  ',
'        SESSION_MAX_IDLE_SEC,',
'        to_char(sysdate,''dd.mm.yyyy HH24:MI:SS'')',
'    INTO',
'        l_session,',
'        l_username,',
'        l_session_created,',
'        l_session_idle_timeout_on,',
'        l_session_life_timeout_on,',
'        l_session_max_idle_sec,',
'        l_current_date',
'    FROM ',
'        APEX_WORKSPACE_SESSIONS ',
'    WHERE ',
'        APEX_SESSION_ID = :APP_SESSION;',
'',
'    apex_json.open_object;  ',
'    apex_json.write(''SET_SESSION_LIFETIME_SECONDS'', l_timeout_seconds);  ',
'    apex_json.write(''APEX_SESSION_ID'', l_session );  ',
'    apex_json.write(''USER_NAME'', l_username ); ',
'    apex_json.write(''SESSION_CREATED'', l_session_created ); ',
'    apex_json.write(''SESSION_IDLE_TIMEOUT_ON'', l_session_idle_timeout_on ); ',
'    apex_json.write(''SESSION_LIFE_TIMEOUT_ON'', l_session_life_timeout_on ); ',
'    apex_json.write(''SESSION_MAX_IDLE_SEC'', l_session_max_idle_sec ); ',
'    apex_json.write(''SYSDATE'', l_current_date ); ',
'    apex_json.close_object;  ',
'',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
