prompt --application/pages/page_00341
begin
wwv_flow_api.create_page(
 p_id=>341
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Edit Computer'
,p_page_mode=>'NORMAL'
,p_step_title=>'Edit Computer'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Edit Computer'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(58964392495783603)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180911191644'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(61651828492566180)
,p_name=>'Permissions of this Computer'
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
'                                           from COMPUTER_ROLE_REL_POOL s0',
'                                          where s0.COMPUTER_ID_OR_DN = :P341_ID',
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
,p_display_when_condition=>'P341_ID'
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
 p_id=>wwv_flow_api.id(44201255081061007)
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
 p_id=>wwv_flow_api.id(44201676310061008)
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
 p_id=>wwv_flow_api.id(44202037423061008)
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
 p_id=>wwv_flow_api.id(44202423140061008)
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
 p_id=>wwv_flow_api.id(65730278934707678)
,p_plug_name=>'&P341_REGION_NAME.'
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
 p_id=>wwv_flow_api.id(65793219398273311)
,p_plug_name=>'Audit Information'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P341_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44203124552061009)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(65730278934707678)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P341_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44203549247061009)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(65730278934707678)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:340:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44203925015061009)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(65730278934707678)
,p_button_name=>'CREATE_COMPUTER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P341_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44204380387061009)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(65730278934707678)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P341_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(53073817285351812)
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(44215118316061018)
,p_branch_action=>'f?p=&APP_ID.:340:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44204788484061009)
,p_name=>'P341_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
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
 p_id=>wwv_flow_api.id(44205170888061009)
,p_name=>'P341_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>200
,p_read_only_when=>'P341_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44205534998061009)
,p_name=>'P341_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>1000
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44205931738061010)
,p_name=>'P341_DNS_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_use_cache_before_default=>'NO'
,p_prompt=>'DNS Name'
,p_source=>'DNS_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>1000
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44206305688061010)
,p_name=>'P341_SORT_ORDER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sort Order'
,p_source=>'SORT_ORDER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44206710949061010)
,p_name=>'P341_IS_ACTIVE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BOOLEAN - YES/NO'
,p_lov=>'.'||wwv_flow_api.id(63181780146773720)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(63117268138203046)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44207994303061011)
,p_name=>'P341_ROLES'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_prompt=>'Roles (Available <-> Assigned)'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select role_id_or_dn',
'from computer_role_rel_pool',
'where computer_id_or_dn = :P341_ID'))
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
'  IF (:AUTHORIZATION_ACTIVE = ''Y'' AND APEX_AUTHORIZATION.IS_AUTHORIZED(p_authorization_name => ''UM_EDIT_ADMINISTRATION'')) THEN',
'    return FALSE;',
'  ELSE',
'    return TRUE;',
'  END IF;',
'end;',
''))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44208350848061011)
,p_name=>'P341_RETURN'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44208708006061011)
,p_name=>'P341_REGION_NAME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_use_cache_before_default=>'NO'
,p_source=>'select case when :P341_ID is null then ''Add Computer'' else ''Edit Computer'' end from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44216961469090838)
,p_name=>'P341_ORG_UNITS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(65730278934707678)
,p_prompt=>'Organisational Units (Available <-> Assigned)'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select org_unit_id_or_dn',
'  from computer_org_unit_rel_pool',
' where computer_id_or_dn = :P341_ID'))
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
'  IF (:AUTHORIZATION_ACTIVE = ''Y'' AND APEX_AUTHORIZATION.IS_AUTHORIZED(p_authorization_name => ''UM_EDIT_ADMINISTRATION'')) THEN',
'    return FALSE;',
'  ELSE',
'    return TRUE;',
'  END IF;',
'end;',
''))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'MOVE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44246771364599923)
,p_name=>'P341_INSERT_SOURCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(65793219398273311)
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
 p_id=>wwv_flow_api.id(44247194369599924)
,p_name=>'P341_INSERT_DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(65793219398273311)
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
 p_id=>wwv_flow_api.id(44247576195599924)
,p_name=>'P341_UPDATE_SOURCE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(65793219398273311)
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
 p_id=>wwv_flow_api.id(44247939655599924)
,p_name=>'P341_UPDATE_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(65793219398273311)
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44213058642061017)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from COMPUTERS'
,p_attribute_01=>'DL_USER_MANAGEMENT'
,p_attribute_02=>'COMPUTERS'
,p_attribute_03=>'P341_ID'
,p_attribute_04=>'ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44213420366061017)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of COMPUTERS'
,p_attribute_01=>'DL_USER_MANAGEMENT'
,p_attribute_02=>'COMPUTERS'
,p_attribute_03=>'P341_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44214603213061018)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE_COMPUTER'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P341_ID := PKG_MAN_USERS.Add_Computer(i_Name        => :P341_NAME',
'                                      ,i_Description => :P341_DESCRIPTION',
'                                      ,i_DNS_Name    => :P341_DNS_NAME',
'                                      ,i_Sort_Order  => :P341_SORT_ORDER',
'                                      ,i_Is_Active   => :P341_IS_ACTIVE',
'                                      --',
'                                      );',
''))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44203925015061009)
,p_process_success_message=>'Computer created'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44214266728061018)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Roles_and_Org_Units'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_man_users.Save_Computer_Roles(i_computer_id => :P341_ID',
'                                 ,i_roles_list  => :P341_ROLES',
'                                  --',
'                                  );',
'begin',
'  pkg_man_users.Save_Computer_Org_Units(i_computer_id   => :P341_ID',
'                                       ,i_org_unit_list => :P341_ORG_UNITS',
'                                        --',
'                                        );',
'exception',
'  when DUP_VAL_ON_INDEX then',
'    Raise_application_error(-20000',
'                           ,''The computer could only be member of ONE organisational unit!'');',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44203124552061009)
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44216650746090835)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create_Roles_and_Org_Units'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_man_users.Save_Computer_Roles(i_computer_id => :P341_ID',
'                                 ,i_roles_list  => :P341_ROLES',
'                                  --',
'                                  );',
'begin',
'  pkg_man_users.Save_Computer_Org_Units(i_computer_id   => :P341_ID',
'                                       ,i_org_unit_list => :P341_ORG_UNITS',
'                                        --',
'                                        );',
'exception',
'  when DUP_VAL_ON_INDEX then',
'    Raise_application_error(-20000',
'                           ,''The computer could only be member of ONE organisational unit!'');',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44203925015061009)
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44213842715061017)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
