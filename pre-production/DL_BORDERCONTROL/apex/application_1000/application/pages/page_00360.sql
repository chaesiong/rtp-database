prompt --application/pages/page_00360
begin
wwv_flow_api.create_page(
 p_id=>360
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Edit Organisational Units'
,p_page_mode=>'NORMAL'
,p_step_title=>'Edit Organisational Units'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Edit Org Units'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
''))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(58964392495783603)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Here you can edit appliaction roles. ',
'Privileges and Users can be assigned to roles.'))
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180912125010'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49030875512789310)
,p_plug_name=>'Organisational Unit Properties'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46689336353433202)
,p_plug_name=>'Computer Members'
,p_parent_plug_id=>wwv_flow_api.id(49030875512789310)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46875759254671168)
,p_plug_name=>'Member Of Organisational Units'
,p_parent_plug_id=>wwv_flow_api.id(49030875512789310)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>35
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65883712882211482)
,p_plug_name=>'User Members'
,p_parent_plug_id=>wwv_flow_api.id(49030875512789310)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70633267825353922)
,p_plug_name=>'Organisational Unit Members'
,p_parent_plug_id=>wwv_flow_api.id(49030875512789310)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>25
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65886340215211506)
,p_plug_name=>'Organisational Units'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>8
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44275678978514073)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(46875759254671168)
,p_button_name=>'SAVE_MEMBER_OF_ORG_UNITS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P360_ORG_UNIT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44283679409514086)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(46689336353433202)
,p_button_name=>'SAVE_COMPUTER_MEMBERS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P360_ORG_UNIT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44216521255090834)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(65886340215211506)
,p_button_name=>'EDIT_ORG_UNIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:361:&SESSION.::&DEBUG.:361:P361_ID:&P360_ORG_UNIT_ID.'
,p_button_condition=>'P360_ORG_UNIT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-pencil-square-o'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44277146841514076)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(65883712882211482)
,p_button_name=>'SAVE_USER_MEMBERS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P360_ORG_UNIT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44282150796514085)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(70633267825353922)
,p_button_name=>'SAVE_ORG_UNIT_MEMBERS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P360_ORG_UNIT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44324441078100525)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(65886340215211506)
,p_button_name=>'NEW_ORG_UNIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:361:&SESSION.::&DEBUG.:361::'
,p_icon_css_classes=>'fa-plus-circle'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44285135633514086)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(65886340215211506)
,p_button_name=>'DELETE_ORG_UNIT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE_ORG_UNIT'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P360_ORG_UNIT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(53073817285351812)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(44290671266514095)
,p_branch_name=>'Go To Page 360'
,p_branch_action=>'f?p=&APP_ID.:360:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44276017228514074)
,p_name=>'P360_MEMBER_OF_ORG_UNITS_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46875759254671168)
,p_source=>'Above Unit is an organisational member of assigned Units'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44276412750514075)
,p_name=>'P360_MEMBER_OF_ORG_UNITS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46875759254671168)
,p_use_cache_before_default=>'NO'
,p_prompt=>'  Available <-> Assigned'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.ORG_UNIT_ID_OR_DN',
'  from ORG_UNIT_ORG_UNIT_REL_POOL t0',
' inner join ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL t1',
'    on (t0.MEMBER_ORG_UNIT_ID_OR_DN = t1.ORG_UNIT_ID_OR_DN)',
' where t0.MEMBER_ORG_UNIT_ID_OR_DN = :P360_ORG_UNIT_ID',
' order by t0.SOURCE desc',
'         ,t1.NAME'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case t.SOURCE',
'         when 1 then',
'          ''AD''',
'         else',
'          ''UM''',
'       end || '': '' || t.NAME as d',
'      ,t.ID_OR_DN as r',
'  from ORG_UNIT_POOL t',
'-- Showable ORG_UNIT not equal to selected ORG_UNIT',
' where t.ID_OR_DN != nvl(:P360_ORG_UNIT_ID',
'                        ,''$NV$'')',
'      -- Not selected ORG_UNIT already a parent of showable ORG_UNIT, in order to avoid circular reference',
'   and not exists (select null',
'          from ORG_UNIT_ORG_UNIT_REL_POOL e0',
'         where e0.ORG_UNIT_ID_OR_DN = nvl(:P360_ORG_UNIT_ID',
'                                         ,''$NV$'')',
'           and e0.MEMBER_ORG_UNIT_ID_OR_DN = t.ID_OR_DN',
'        --',
'        )',
'   and (',
'       -- Showable ORG_UNIT not already anywhere a parent',
'        not exists (select null',
'                      from ORG_UNIT_ORG_UNIT_REL_POOL e1',
'                     where e1.ORG_UNIT_ID_OR_DN = t.ID_OR_DN',
'                    --',
'                    )',
'       -- Showable ORG_UNIT already a parent of selected ORG_UNIT',
'        or exists (select null',
'                     from ORG_UNIT_ORG_UNIT_REL_POOL e2',
'                    where e2.ORG_UNIT_ID_OR_DN = t.ID_OR_DN',
'                      and e2.MEMBER_ORG_UNIT_ID_OR_DN = nvl(:P360_ORG_UNIT_ID',
'                                                           ,e2.MEMBER_ORG_UNIT_ID_OR_DN)',
'                   --',
'                   )',
'       --',
'       )',
' order by t.SOURCE desc',
'         ,t.SORT_ORDER',
'         ,t.NAME',
''))
,p_cHeight=>12
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' IF :AUTHORIZATION_ACTIVE = ''Y'' and APEX_AUTHORIZATION.IS_AUTHORIZED (',
'    p_authorization_name => ''UM_EDIT_ADMINISTRATION'') THEN',
'   return FALSE;',
' ELSE',
'   return TRUE;',
' END IF;',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44277546305514076)
,p_name=>'P360_USER_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65883712882211482)
,p_source=>'Assigned Users are organisational members of above Unit'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44277972145514076)
,p_name=>'P360_USER_MEMBERS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65883712882211482)
,p_use_cache_before_default=>'NO'
,p_prompt=>' Available <-> Assigned'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id_or_dn ',
'  from user_pool u',
'  join user_org_unit_rel_pool r on u.id_or_dn = r.user_id_or_dn',
' WHERE r.org_unit_ID_or_dn = :P360_ORG_UNIT_ID',
' order by u.source desc, u.username'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case t.SOURCE',
'          when 1 then',
'           ''AD''',
'          else',
'           ''UM''',
'        end || '': '' || t.USERNAME',
'       --',
'        || case t.SOURCE',
'          when 1 then',
'           case',
'             when (t.DISPLAYNAME is not null) then',
'              '' ('' || t.DISPLAYNAME || '')''',
'             else',
'              ''''',
'           end',
'          else',
'           case',
'             when (t.LAST_NAME is not null and t.FIRST_NAME is not null) then',
'              '' ('' || t.LAST_NAME || '', '' || t.FIRST_NAME || '')''',
'             when (t.LAST_NAME is not null) then',
'              '' ('' || t.LAST_NAME || '')''',
'             when (t.FIRST_NAME is not null) then',
'              '' ('' || t.FIRST_NAME || '')''',
'             else',
'              ''''',
'           end',
'        end as d',
'      ,t.ID_OR_DN as r',
'  from USER_POOL t',
' where not exists (select null',
'          from USER_ORG_UNIT_REL_POOL e',
'         where e.user_id_or_dn = t.ID_OR_DN',
'           and e.org_unit_id_or_dn != :P360_ORG_UNIT_ID',
'        --',
'        )',
' order by t.SOURCE desc',
'         ,1',
''))
,p_cHeight=>12
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' IF :AUTHORIZATION_ACTIVE = ''Y'' and APEX_AUTHORIZATION.IS_AUTHORIZED (',
'    p_authorization_name => ''UM_EDIT_ADMINISTRATION'') THEN',
'   return FALSE;',
' ELSE',
'   return TRUE;',
' END IF;',
'end;',
''))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44282529952514085)
,p_name=>'P360_ORG_UNIT_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(70633267825353922)
,p_source=>'Assigned Units are organisational members of above Unit'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44282913524514085)
,p_name=>'P360_ORG_UNIT_MEMBERS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(70633267825353922)
,p_use_cache_before_default=>'NO'
,p_prompt=>'  Available <-> Assigned'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.MEMBER_ORG_UNIT_ID_OR_DN',
'  from ORG_UNIT_ORG_UNIT_REL_POOL t0',
' inner join ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL t1',
'    on (t0.MEMBER_ORG_UNIT_ID_OR_DN = t1.ORG_UNIT_ID_OR_DN)',
' where t0.ORG_UNIT_ID_OR_DN = :P360_ORG_UNIT_ID',
' order by t0.SOURCE desc',
'         ,t1.NAME'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case t.SOURCE',
'         when 1 then',
'          ''AD''',
'         else',
'          ''UM''',
'       end || '': '' || t.NAME as d',
'      ,t.ID_OR_DN as r',
'  from ORG_UNIT_POOL t',
'-- Showable ORG_UNIT not equal to selected ORG_UNIT',
' where t.ID_OR_DN != nvl(:P360_ORG_UNIT_ID',
'                        ,''$NV$'')',
'      -- Not selected ORG_UNIT already a member of showable ORG_UNIT, in order to avoid circular reference',
'   and not exists (select null',
'          from ORG_UNIT_ORG_UNIT_REL_POOL e0',
'         where e0.MEMBER_ORG_UNIT_ID_OR_DN = nvl(:P360_ORG_UNIT_ID',
'                                                ,''$NV$'')',
'           and e0.ORG_UNIT_ID_OR_DN = t.ID_OR_DN',
'        --',
'        )',
'   and (',
'       -- Showable ORG_UNIT not already anywhere a member',
'        not exists (select null',
'                      from ORG_UNIT_ORG_UNIT_REL_POOL e1',
'                     where e1.MEMBER_ORG_UNIT_ID_OR_DN = t.ID_OR_DN',
'                    --',
'                    )',
'       -- Showable ORG_UNIT already a member of selected ORG_UNIT',
'        or exists (select null',
'                     from ORG_UNIT_ORG_UNIT_REL_POOL e2',
'                    where e2.MEMBER_ORG_UNIT_ID_OR_DN = t.ID_OR_DN',
'                      and e2.ORG_UNIT_ID_OR_DN = nvl(:P360_ORG_UNIT_ID',
'                                                    ,e2.ORG_UNIT_ID_OR_DN)',
'                   --',
'                   )',
'       --',
'       )',
' order by t.SOURCE desc',
'         ,t.SORT_ORDER',
'         ,t.NAME',
''))
,p_cHeight=>12
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' IF :AUTHORIZATION_ACTIVE = ''Y'' and APEX_AUTHORIZATION.IS_AUTHORIZED (',
'    p_authorization_name => ''UM_EDIT_ADMINISTRATION'') THEN',
'   return FALSE;',
' ELSE',
'   return TRUE;',
' END IF;',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44284025249514086)
,p_name=>'P360_COMPUTER_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(46689336353433202)
,p_source=>'Assigned Computers are organisational members of above Unit'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44284431994514086)
,p_name=>'P360_COMPUTER_MEMBERS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(46689336353433202)
,p_use_cache_before_default=>'NO'
,p_prompt=>' Available <-> Assigned'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id_or_dn ',
'  from computer_pool u',
'  join computer_org_unit_rel_pool r on u.id_or_dn = r.computer_id_or_dn',
' WHERE r.org_unit_ID_or_dn = :P360_ORG_UNIT_ID',
' order by u.source desc, u.name'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case t.SOURCE',
'         when 1 then',
'          ''AD''',
'         else',
'          ''UM''',
'       end || '': '' || t.NAME as d',
'      ,t.ID_OR_DN as r',
'  from COMPUTER_POOL t',
' where not exists (select null',
'          from COMPUTER_ORG_UNIT_REL_POOL e',
'         where e.COMPUTER_id_or_dn = t.ID_OR_DN',
'           and e.org_unit_id_or_dn != :P360_ORG_UNIT_ID',
'        --',
'        )',
' order by t.SOURCE desc',
'         ,t.NAME',
''))
,p_cHeight=>12
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' IF :AUTHORIZATION_ACTIVE = ''Y'' and APEX_AUTHORIZATION.IS_AUTHORIZED (',
'    p_authorization_name => ''UM_EDIT_ADMINISTRATION'') THEN',
'   return FALSE;',
' ELSE',
'   return TRUE;',
' END IF;',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(63117205206203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44285939511514087)
,p_name=>'P360_ORG_UNIT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65886340215211506)
,p_prompt=>'Organisational Unit for edit'
,p_display_as=>'NATIVE_SELECT_LIST'
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
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select Organisational Unit --'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Select the Organisational Unit that you want to edit.'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44289724096514094)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Organisational Unit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM ORG_UNITS d WHERE d.ID = :P360_ORG_UNIT_ID;',
':P360_ORG_UNIT_ID := NULL;',
''))
,p_process_error_message=>'The Organisational Unit cannot be deleted.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44285135633514086)
,p_process_success_message=>'Organisational Unit has been deleted.'
,p_security_scheme=>wwv_flow_api.id(53073817285351812)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44290117869514095)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Users'
,p_process_sql_clob=>'pkg_man_users.Save_Org_Unit_Users(i_org_unit_id => :P360_ORG_UNIT_ID, i_users_list => :P360_USER_MEMBERS);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44277146841514076)
,p_process_success_message=>'User members has been saved.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44288135326514094)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Computers'
,p_process_sql_clob=>'PKG_MAN_USERS.Save_Org_Unit_Computers(i_org_unit_id => :P360_ORG_UNIT_ID, i_computer_list => :P360_COMPUTER_MEMBERS);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44283679409514086)
,p_process_success_message=>'Computer members has been saved.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44288953674514094)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Organisational_Units'
,p_process_sql_clob=>'pkg_man_users.Save_Org_Unit_Org_Units(i_org_unit_id => :P360_ORG_UNIT_ID, i_org_unit_list => :P360_ORG_UNIT_MEMBERS);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44282150796514085)
,p_process_success_message=>'Organisational Unit members has been saved.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44288578190514094)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Member_Of_Organisational_Units'
,p_process_sql_clob=>'pkg_man_users.Save_Org_Unit_Member_Of_OUnits(i_org_unit_id => :P360_ORG_UNIT_ID, i_org_unit_list => :P360_MEMBER_OF_ORG_UNITS);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44275678978514073)
,p_process_success_message=>'Member of Organisational Units has been saved.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
end;
/
