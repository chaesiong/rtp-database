prompt --application/pages/page_00311
begin
wwv_flow_api.create_page(
 p_id=>311
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Edit User'
,p_page_mode=>'NORMAL'
,p_step_title=>'Edit User'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function showPWD(pwdField, visBtn){',
'    $(''#'' + pwdField).attr(''type'', ''text'');',
'    $(''#'' + visBtn + '' span'').attr(''class'', ''t-Icon fa fa-eye'');',
'}',
'',
' function hidePWD(pwdField, visBtn){',
'    $(''#'' + pwdField).attr(''type'', ''password'');',
'    $(''#'' + visBtn + '' span'').attr(''class'', ''t-Icon fa fa-eye-slash'');',
'}',
'',
'function genPWD( pwdField1, pwdField2, visBtn) {',
'    var pwd_len = $(''#P311_PWD_LENGTH'').val();',
'    var smallAlpha = ''abcdefghijklmnopqrstuvwxyz'';',
'    var bigAlpha = ''ABCDEFGHIJKLMNOPQRSTUVWXYZ'';',
'    var numbers = ''0123456789'';',
'    var special = ''!"#$%&()``*+,-/:;<=>?_'';',
'    var all = smallAlpha + bigAlpha + special;',
'    var result = '''';',
'',
'    result += smallAlpha.charAt(Math.floor(Math.random() * smallAlpha.length));',
'    result += bigAlpha.charAt(Math.floor(Math.random() * bigAlpha.length));',
'    result += numbers.charAt(Math.floor(Math.random() * numbers.length));',
'    result += special.charAt(Math.floor(Math.random() * special.length));',
'',
'    for (var i = 0; i < (pwd_len - 4); i++){',
'        result += all.charAt(Math.floor(Math.random() * all.length));',
'    }',
'',
'    result = result.split('''').sort(function(){return 0.5-Math.random()}).join('''');',
'  ',
'    $(''#'' + pwdField1).val(result);',
'    $(''#'' + pwdField2).val(result);',
'    showPWD(pwdField1, visBtn);',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#genPWD, #visibilityPWD, #newGenPWD, #newVisibilityPWD{',
'    height: 24px;',
'    padding: unset;',
'    margin-top: 4px;',
'    margin-bottom: 4px;',
'}',
'',
'#genUSER {',
'    margin-top: 4px;',
'    margin-bottom: 4px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(58964392495783603)
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190724113037'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54887290570643504)
,p_plug_name=>'Reset Password'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P311_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(59067645884438908)
,p_name=>'Permissions of this User'
,p_template=>wwv_flow_api.id(63092884436202977)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select obj.ID as OBJECT_ID',
'      ,LISTAGG(g.NAME',
'              ,'', '') WITHIN group(order by g.SORT_ORDER) as GRANTS',
'      ,r0.ROLE_ID_OR_DN',
'      ,decode(r0.INHERIT_LEVEL',
'             ,0',
'             ,r0.ROLE_ID_OR_DN',
'             ,r0.ROOT_ROLE_ID_OR_DN) as INHERITED_BY_ROLE',
'  from (',
'        --',
'        select CONNECT_BY_ROOT t0.ROLE_ID_OR_DN as ROOT_ROLE_ID_OR_DN',
'               ,t0.ROLE_ID_OR_DN',
'               ,level - 1 as INHERIT_LEVEL',
'          from ROLE_ROLE_ROLES_POOL t0',
'          left join ROLE_ROLE_REL t1',
'            on t0.ROLE_ID_OR_DN = coalesce(t1.ROLE_ID',
'                                          ,t1.ROLE_DN)',
'        -- "Start with" and "connect by" UPWARDS not DOWNWARDS!',
'         start with t0.ROLE_ID_OR_DN in (select coalesce(s0.ROLE_ID',
'                                                        ,s0.ROLE_DN) as ROLE_ID_OR_DN',
'                                           from USER_ROLE_REL_POOL s0',
'                                          where s0.USER_ID_OR_DN = :P311_ID',
'                                         )',
'        connect by nocycle prior t0.ROLE_ID_OR_DN = coalesce(t1.MEMBER_ROLE_ID',
'                                                    ,t1.MEMBER_ROLE_DN)',
'        --',
'        ) r0',
' inner join(',
'--',
'ROLE_OBJECT_GRANT_REL r',
' inner join OBJECT_GRANT_REL o',
'    on r.OBJECT_GRANT_REL_ID = o.ID',
' inner join OBJECTS obj',
'    on o.OBJECT_ID = obj.ID',
' inner join GRANTS g',
'    on o.GRANT_ID = g.ID',
'--',
' ) on r0.ROLE_ID_OR_DN = coalesce(r.ROLE_ID, r.ROLE_DN)',
' where 1 = 1',
'   and (r0.INHERIT_LEVEL > 0 or (obj.ID is not null and g.NAME is not null))',
'   and obj.ID is not null',
' group by r0.ROOT_ROLE_ID_OR_DN',
'         ,obj.ID',
'         ,obj.SORT_ORDER',
'         ,r0.ROLE_ID_OR_DN',
'         ,r0.INHERIT_LEVEL',
' order by obj.SORT_ORDER',
'         ,r0.INHERIT_LEVEL desc',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'P311_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(63105422961203007)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(59068642669438945)
,p_query_column_id=>1
,p_column_alias=>'OBJECT_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Object'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(63181764527769610)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(59069513675438947)
,p_query_column_id=>2
,p_column_alias=>'GRANTS'
,p_column_display_sequence=>3
,p_column_heading=>'Grants'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(59068240672438940)
,p_query_column_id=>3
,p_column_alias=>'ROLE_ID_OR_DN'
,p_column_display_sequence=>1
,p_column_heading=>'Role '
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(60720725395184309)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(46404623944805399)
,p_query_column_id=>4
,p_column_alias=>'INHERITED_BY_ROLE'
,p_column_display_sequence=>4
,p_column_heading=>'Inherited by Role'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(60720725395184309)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63146096326580406)
,p_plug_name=>'&P311_REGION_NAME.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4683853130379328624)
,p_plug_name=>'Sub Left'
,p_parent_plug_id=>wwv_flow_api.id(63146096326580406)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4683853217572328625)
,p_plug_name=>'Sub Right'
,p_parent_plug_id=>wwv_flow_api.id(63146096326580406)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4683853397982328626)
,p_plug_name=>'Sub Bottom'
,p_parent_plug_id=>wwv_flow_api.id(63146096326580406)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63162035051607118)
,p_plug_name=>'Audit Information'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P311_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122598229442713095)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(54887290570643504)
,p_button_name=>'newGenPWD'
,p_button_static_id=>'genPWD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117487642203047)
,p_button_image_alt=>'Generate Password'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>3
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122598318888713096)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(54887290570643504)
,p_button_name=>'newVisibilityPWD'
,p_button_static_id=>'newVisibilityPWD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117487642203047)
,p_button_image_alt=>'Change Password Visibility'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-eye-slash'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4683853465917328627)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_button_name=>'genUSER'
,p_button_static_id=>'genUSER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117487642203047)
,p_button_image_alt=>'Generate Username'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-user-check'
,p_grid_new_row=>'N'
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122597428256713087)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_button_name=>'genPWD'
,p_button_static_id=>'genPWD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117487642203047)
,p_button_image_alt=>'Generate Password'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_row=>'Y'
,p_grid_column=>3
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122597575854713088)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_button_name=>'visibilityPWD'
,p_button_static_id=>'visibilityPWD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117487642203047)
,p_button_image_alt=>'Change Password Visibility'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-eye-slash'
,p_grid_new_row=>'N'
,p_grid_column=>3
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63146649671580407)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(63146096326580406)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63146818156580408)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(63146096326580406)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63728409626909012)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(63146096326580406)
,p_button_name=>'CREATE_USER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54894494306708867)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(54887290570643504)
,p_button_name=>'RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Reset Password'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63146723373580407)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(63146096326580406)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P311_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(53073817285351812)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(63148404831580416)
,p_branch_action=>'f?p=&APP_ID.:310:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41748703121075688)
,p_name=>'P311_PHONE_NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Phone Number'
,p_source=>'PHONE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44216871829090837)
,p_name=>'P311_ORG_UNITS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(4683853397982328626)
,p_prompt=>'Organisational Units (Available <-> Assigned)'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.ORG_UNIT_ID_OR_DN',
'  from USER_ORG_UNIT_REL_POOL t',
' where t.USER_ID_OR_DN = :P311_ID'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_named_lov=>'ORG_UNITS_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case t.SOURCE',
'         when 1 then',
'          ''AD''',
'         else',
'          ''UM''',
'       end || '': '' || t.NAME as d',
'      ,t.ID_OR_DN as r',
'  from ORG_UNIT_POOL t',
' order by t.SOURCE desc',
'         ,t.SORT_ORDER',
'         ,t.NAME',
''))
,p_cHeight=>10
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' IF :AUTHORIZATION_ACTIVE = ''Y'' AND APEX_AUTHORIZATION.IS_AUTHORIZED( p_authorization_name => ''UM_EDIT_ADMINISTRATION'') THEN',
'   return FALSE;',
' ELSE',
'   return TRUE;',
' END IF;',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54893166559665039)
,p_name=>'P311_REPEAT_RESET_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(54887290570643504)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirm New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>'P311_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54893415193672784)
,p_name=>'P311_NEW_RESET_PASSWORD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(54887290570643504)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>'P311_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59135811736248705)
,p_name=>'P311_REGION_NAME'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(63146096326580406)
,p_use_cache_before_default=>'NO'
,p_source=>'select case when :P311_ID is null then ''Add User'' else ''Edit User'' end from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63148806100580418)
,p_name=>'P311_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(63146096326580406)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63149215390580443)
,p_name=>'P311_USERNAME'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Username'
,p_source=>'USERNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_read_only_when=>'P311_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63149514948580448)
,p_name=>'P311_FIRST_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'First Name'
,p_source=>'FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63149954841580450)
,p_name=>'P311_LAST_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Name'
,p_source=>'LAST_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63150326925580451)
,p_name=>'P311_MAIL_ADDRESS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mail Address'
,p_source=>'MAIL_ADDRESS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>320
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63150680543580452)
,p_name=>'P311_LAST_LOGIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(63162035051607118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Login'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_source=>'LAST_LOGIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63151102557580454)
,p_name=>'P311_STATE'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'State'
,p_source=>'STATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'USER STATES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.DISPLAY_VALUE',
'          ,t.DISPLAY_VALUE$DLC) as d',
'      ,t.KEY_VALUE as r',
'  from LOOKUPS$LC t',
' where t.KEY_CATEGORY = ''user_state''',
' order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63151494870580455)
,p_name=>'P311_INSERT_DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(63162035051607118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Insert Date'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_source=>'INS_AT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63151868931580455)
,p_name=>'P311_INSERT_SOURCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(63162035051607118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Insert Source'
,p_source=>'INS_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63152281144580456)
,p_name=>'P311_UPDATE_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(63162035051607118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Update Date'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_source=>'DML_AT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63152681605580457)
,p_name=>'P311_UPDATE_SOURCE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(63162035051607118)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Update Source'
,p_source=>'DML_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63183160150800142)
,p_name=>'P311_ROLES'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(4683853397982328626)
,p_prompt=>'Roles (Available <-> Assigned)'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select role_id_or_dn',
'from user_role_rel_pool',
'where user_id_or_dn = :P311_ID'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
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
,p_cHeight=>10
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' IF :AUTHORIZATION_ACTIVE = ''Y'' AND APEX_AUTHORIZATION.IS_AUTHORIZED( p_authorization_name => ''UM_EDIT_ADMINISTRATION'') THEN',
'   return FALSE;',
' ELSE',
'   return TRUE;',
' END IF;',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63718900827503547)
,p_name=>'P311_PASSWORD'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>'P311_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63719440175512261)
,p_name=>'P311_REPEAT_PASSWORD'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confirm Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when=>'P311_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(63727688725875718)
,p_name=>'P311_RETURN'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(63146096326580406)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122598037665713093)
,p_name=>'P311_PWD_LENGTH'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(active_value, 8)',
'from dl_user_management.parameter_settings',
'where name = ''pwd_min_length'';'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122598867902713101)
,p_name=>'P311_CHANGE_PASSWORD'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_prompt=>'Change Password on first login'
,p_source=>'Y'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'Y'
,p_attribute_03=>'Yes'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4682029920251563601)
,p_name=>'P311_OFFLINE_PIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4683853130379328624)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Offline pin'
,p_source=>'OFFLINE_PIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_display_when=>'P311_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683854234334328635)
,p_name=>'P311_FIRST_NAME_THAI'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'First Name Thai'
,p_source=>'FIRST_NAME_THAI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683854315461328636)
,p_name=>'P311_LAST_NAME_THAI'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Last Name Thai'
,p_source=>'LAST_NAME_THAI'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683854454802328637)
,p_name=>'P311_DOB'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date of Birth'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'DOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683854510330328638)
,p_name=>'P311_NATIONAL_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'National ID'
,p_source=>'NATIONAL_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>100
,p_cMaxlength=>13
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683854709264328640)
,p_name=>'P311_RANK'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Rank'
,p_source=>'RANK'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ranknm d, rank_seqno r',
'FROM apex_user_management.v_rank',
'ORDER BY TO_NUMBER(rank_seqno);'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select--'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683854883778328641)
,p_name=>'P311_DEPARTMENT_LEVEL_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Department (1)'
,p_source=>'DEPARTMENT_LEVEL_1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END AS d,',
'    dept_seqno AS r',
'FROM apex_user_management.v_department',
'WHERE actflag = ''Y''',
'AND deptlevel = 1',
'ORDER BY dept_seqno',
';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select--'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683854943453328642)
,p_name=>'P311_DEPARTMENT_LEVEL_2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Department (2)'
,p_source=>'DEPARTMENT_LEVEL_2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END AS d,',
'    dept_seqno AS r',
'FROM apex_user_management.v_department',
'WHERE actflag = ''Y''',
'AND deptlevel = 2',
'AND rel_code = :P311_DEPARTMENT_LEVEL_1',
'ORDER BY dept_seqno',
';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select--'
,p_lov_cascade_parent_items=>'P311_DEPARTMENT_LEVEL_1'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683855090339328643)
,p_name=>'P311_DEPARTMENT_LEVEL_3'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Department (3)'
,p_source=>'DEPARTMENT_LEVEL_3'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END AS d,',
'    dept_seqno AS r',
'FROM apex_user_management.v_department',
'WHERE actflag = ''Y''',
'AND deptlevel = 3',
'AND rel_code = :P311_DEPARTMENT_LEVEL_2',
'ORDER BY dept_seqno',
';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select--'
,p_lov_cascade_parent_items=>'P311_DEPARTMENT_LEVEL_2'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683855113851328644)
,p_name=>'P311_POSITION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4683853217572328625)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Position'
,p_source=>'POSITION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(63720114502542639)
,p_validation_name=>'P311_PASSWORD'
,p_validation_sequence=>10
,p_validation=>':P311_PASSWORD = :P311_REPEAT_PASSWORD'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Password confirmation doesn''t match password.'
,p_always_execute=>'Y'
,p_validation_condition=>'P311_PASSWORD'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(63728409626909012)
,p_associated_item=>wwv_flow_api.id(63718900827503547)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(54885319817055950)
,p_validation_name=>'P311_MAIL_ADDRESS'
,p_validation_sequence=>20
,p_validation=>'P311_MAIL_ADDRESS'
,p_validation2=>'^[a-zA-Z0-9]{1}[a-zA-Z0-9\.\-]{1,}@[a-zA-Z0-9]{1}[a-zA-Z0-9\.\-]{1,}\.{1}[a-zA-Z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'The entered e-mail address is not valid.'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(63150326925580451)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(54901892577669494)
,p_validation_name=>'P311_NEW_RESET_PASSWORD'
,p_validation_sequence=>30
,p_validation=>':P311_NEW_RESET_PASSWORD = :P311_REPEAT_RESET_PASSWORD'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Password confirmation doesn''t match password.'
,p_always_execute=>'N'
,p_validation_condition=>'P311_ID'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(54894494306708867)
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(54893415193672784)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4683854117542328634)
,p_validation_name=>'P311_USERNAME'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NULL',
'FROM users#sgd ',
'WHERE username = :P311_USERNAME'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Username already exists.'
,p_always_execute=>'N'
,p_validation_condition=>'P311_USERNAME'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(63728409626909012)
,p_associated_item=>wwv_flow_api.id(63149215390580443)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4683854695647328639)
,p_validation_name=>'P311_NATIONAL_ID'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NULL',
'FROM users#sgd ',
'WHERE national_id = :P311_NATIONAL_ID',
'AND (:P311_ID IS NULL OR ID != :P311_ID)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'National ID is associated with an existing username.'
,p_always_execute=>'N'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':REQUEST IN (''CREATE_USER'', ''SAVE'')',
'AND :P311_NATIONAL_ID IS NOT NULL'))
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(4683854510330328638)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122597652082713089)
,p_name=>'Click genPWD'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(122597428256713087)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122598546069713098)
,p_event_id=>wwv_flow_api.id(122597652082713089)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'genPWD(''P311_PASSWORD'', ''P311_REPEAT_PASSWORD'', ''visibilityPWD'' );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122597857918713091)
,p_name=>'click visibilityPWD'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(122597575854713088)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122598758709713100)
,p_event_id=>wwv_flow_api.id(122597857918713091)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($(''#visibilityPWD span'').hasClass(''fa-eye-slash'') == true){',
'    showPWD(''P311_PASSWORD'', ''visibilityPWD'');',
'} else if ($(''#visibilityPWD span'').hasClass(''fa-eye'') == true){',
'    hidePWD(''P311_PASSWORD'', ''visibilityPWD'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122598382278713097)
,p_name=>'newGenPWD'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(122598229442713095)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122597729895713090)
,p_event_id=>wwv_flow_api.id(122598382278713097)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'genPWD(''P311_NEW_RESET_PASSWORD'', ''P311_REPEAT_RESET_PASSWORD'', ''newVisibilityPWD'' );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122598589537713099)
,p_name=>'newVisibilityPWD'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(122598318888713096)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122597893969713092)
,p_event_id=>wwv_flow_api.id(122598589537713099)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($(''#newVisibilityPWD span'').hasClass(''fa-eye-slash'') == true){',
'    showPWD(''P311_NEW_RESET_PASSWORD'', ''newVisibilityPWD'');',
'} else if ($(''#newVisibilityPWD span'').hasClass(''fa-eye'') == true){',
'    hidePWD(''P311_NEW_RESET_PASSWORD'', ''newVisibilityPWD'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683853504349328628)
,p_name=>'Click genUSER'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4683853465917328627)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P311_ID'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683853690575328629)
,p_event_id=>wwv_flow_api.id(4683853504349328628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger(document, ''generateUser'');'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683853799954328630)
,p_name=>'P311_FIRST_NAME: Change'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_FIRST_NAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P311_ID'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683853869583328631)
,p_event_id=>wwv_flow_api.id(4683853799954328630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger(document, ''generateUser'');'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683853915649328632)
,p_name=>'P311_LAST_NAME: Change'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P311_LAST_NAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P311_ID'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683854002295328633)
,p_event_id=>wwv_flow_api.id(4683853915649328632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger(document, ''generateUser'');'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683855256193328645)
,p_name=>'Generate User'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'generateUser'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683855357410328646)
,p_event_id=>wwv_flow_api.id(4683855256193328645)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!$v("P311_FIRST_NAME") && !$v("P311_LAST_NAME"))',
'    return;',
'',
'apex.server.process("GENERATE_USER", ',
'{',
'    x01: $v("P311_FIRST_NAME"),',
'    x02: $v("P311_LAST_NAME")',
'	',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        console.log(''GENERATE_USER Result: '', pData);',
'        $("#P311_USERNAME").val(pData.user).trigger("change");',
'    }',
'});'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63153476874580461)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from USERS'
,p_attribute_01=>'DL_USER_MANAGEMENT'
,p_attribute_02=>'USERS#SGD'
,p_attribute_03=>'P311_ID'
,p_attribute_04=>'ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63153923584580462)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of USERS'
,p_attribute_01=>'DL_USER_MANAGEMENT'
,p_attribute_02=>'USERS#SGD'
,p_attribute_03=>'P311_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63726068296820020)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE_USER'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P311_ID := pkg_man_users.add_user(',
'i_username => :P311_USERNAME,',
'i_first_name => :P311_FIRST_NAME,',
'i_last_name => :P311_LAST_NAME,',
'i_mail_address => :P311_MAIL_ADDRESS,',
'i_phone_number => :P311_PHONE_NUMBER,',
'i_state => :P311_STATE,',
'i_password => :P311_PASSWORD,',
'i_pwd_must_be_changed => :P311_CHANGE_PASSWORD,',
'i_national_id => :P311_NATIONAL_ID,',
'i_first_name_thai => :P311_FIRST_NAME_THAI,',
'i_last_name_thai => :P311_LAST_NAME_THAI,',
'i_dob => :P311_DOB,',
'i_rank => :P311_RANK,',
'i_department_level_1 => :P311_DEPARTMENT_LEVEL_1,',
'i_department_level_2 => :P311_DEPARTMENT_LEVEL_2,',
'i_department_level_3 => :P311_DEPARTMENT_LEVEL_3,',
'i_position => :P311_POSITION',
');'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63728409626909012)
,p_process_success_message=>'User created'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63183742577084753)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Roles_and_Org_Units'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_man_users.Save_User_Roles(i_user_id => :P311_ID, i_roles_list => :P311_ROLES);',
'begin',
'  pkg_man_users.Save_User_Org_Units(i_user_id => :P311_ID, i_org_unit_list => :P311_ORG_UNITS);',
'exception',
'  when DUP_VAL_ON_INDEX then',
'    Raise_application_error(-20000, ''The user could only be member of ONE organisational unit!'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63146649671580407)
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44216721452090836)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create_Roles_and_Org_Units'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_man_users.Save_User_Roles(i_user_id => :P311_ID, i_roles_list => :P311_ROLES);',
'begin',
'  pkg_man_users.Save_User_Org_Units(i_user_id => :P311_ID, i_org_unit_list => :P311_ORG_UNITS);',
'exception',
'  when DUP_VAL_ON_INDEX then',
'    Raise_application_error(-20000, ''The user could only be member of ONE organisational unit!'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63728409626909012)
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54895266239736987)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset_Password'
,p_process_sql_clob=>'pkg_man_users.Reset_Password ( i_username => :P311_USERNAME, i_password_new => :P311_NEW_RESET_PASSWORD);'
,p_process_error_message=>'Error during password reset!'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(54894494306708867)
,p_process_success_message=>'Password successfully reset.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63154335523580463)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4683855472799328647)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GENERATE_USER'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_first  VARCHAR2(100) := UPPER(TRIM(apex_application.g_x01));',
'    l_last   VARCHAR2(100) := UPPER(TRIM(apex_application.g_x02));',
'    l_user   VARCHAR2(50);',
'BEGIN',
'',
'    WITH names(first, last) AS',
'    (',
'        SELECT REGEXP_SUBSTR(l_first, ''[A-z]*'') AS FIRST, REGEXP_SUBSTR(l_last, ''[A-z]*'') AS LAST',
'        FROM DUAL',
'    )',
'    SELECT username',
'    INTO l_user',
'    FROM',
'    (',
'        SELECT *',
'        FROM',
'        (',
'            ',
'            SELECT LEVEL AS RN, NVL2(first, first, last) || NVL2(first, NVL2(last, ''.'' || SUBSTR(last, 1, LEVEL), NULL), NULL) AS USERNAME',
'            FROM names',
'            WHERE first IS NOT NULL OR last IS NOT NULL',
'            CONNECT BY LEVEL <= LENGTH(last)',
'        ) x',
'        WHERE NOT EXISTS',
'        (',
'            SELECT NULL',
'            FROM dl_user_management.users#sgd',
'            WHERE username = x.username',
'        )',
'        ORDER BY RN',
'    )',
'    WHERE ROWNUM = 1;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''status'', 1);',
'    apex_json.write(''user'', l_user);',
'    apex_json.close_object();',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        apex_json.open_object();',
'        apex_json.write(''status'', 0);',
'        apex_json.write(''user'', l_user);',
'        apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
