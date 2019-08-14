prompt --application/pages/page_00910
begin
wwv_flow_api.create_page(
 p_id=>910
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Apex Objects'
,p_page_mode=>'NORMAL'
,p_step_title=>'Apex Objects'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(58964392495783603)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180801125737'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(58942632937506619)
,p_name=>'Apex Objects'
,p_template=>wwv_flow_api.id(63096565992202984)
,p_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.ID',
'      ,t.ID        as ID_DISPLAY',
'      ,t.OBJECT_ID',
'      ,t.APP_NAME',
'      ,t.PAGE_ID',
'      ,t.INS_AT    as INSERT_DATE',
'      ,t.INS_BY    as INSERT_SOURCE',
'      ,cast(t.DML_AT as date)    as UPDATE_DATE',
'      ,t.DML_BY    as UPDATE_SOURCE',
'  from OBJECT_PAGE_REL t',
''))
,p_source_type=>'NATIVE_TABFORM'
,p_read_only_when_type=>'FUNCTION_BODY'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' IF :AUTHORIZATION_ACTIVE = ''Y'' AND APEX_AUTHORIZATION.IS_AUTHORIZED (',
'    p_authorization_name => ''EDIT_APEX_OBJECTS'') THEN',
'   return FALSE;',
' ELSE',
'   return TRUE;',
' END IF;',
'end;'))
,p_ajax_enabled=>'N'
,p_query_row_template=>wwv_flow_api.id(63105422961203007)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58943340791506631)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_pk_col_source_type=>'T'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58943736638506632)
,p_query_column_id=>2
,p_column_alias=>'ID_DISPLAY'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'ID_DISPLAY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58944203461506633)
,p_query_column_id=>3
,p_column_alias=>'OBJECT_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Object '
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(63181764527769610)
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'OBJECT_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58944603698506634)
,p_query_column_id=>4
,p_column_alias=>'APP_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Apex App'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(59002282495172992)
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'APP_NAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58944922439506635)
,p_query_column_id=>5
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>6
,p_column_heading=>'Page '
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(54864591257392233)
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'PAGE_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58945385486506637)
,p_query_column_id=>6
,p_column_alias=>'INSERT_DATE'
,p_column_display_sequence=>7
,p_column_heading=>'Insert Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'INSERT_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58945725289506638)
,p_query_column_id=>7
,p_column_alias=>'INSERT_SOURCE'
,p_column_display_sequence=>8
,p_column_heading=>'Insert Source'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'INSERT_SOURCE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58946156740506639)
,p_query_column_id=>8
,p_column_alias=>'UPDATE_DATE'
,p_column_display_sequence=>9
,p_column_heading=>'Update Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'UPDATE_DATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58946576223506640)
,p_query_column_id=>9
,p_column_alias=>'UPDATE_SOURCE'
,p_column_display_sequence=>10
,p_column_heading=>'Update Source'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'APEX_USER_MANAGEMENT'
,p_ref_table_name=>'OBJECT_PAGE_REL'
,p_ref_column_name=>'UPDATE_SOURCE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(58956145325506701)
,p_query_column_id=>10
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'Select Row'
,p_report_column_required_role=>wwv_flow_api.id(59023141227969587)
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58950013381506670)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(58942632937506619)
,p_button_name=>'ADD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Add Row'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:apex.widget.tabular.addRow();'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023141227969587)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58949737808506670)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(58942632937506619)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023141227969587)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58949652550506670)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(58942632937506619)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:910:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58949819765506670)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(58942632937506619)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
,p_security_scheme=>wwv_flow_api.id(59023141227969587)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(58956558896506702)
,p_branch_action=>'f?p=&APP_ID.:910:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(58949737808506670)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(58951560688506686)
,p_tabular_form_region_id=>wwv_flow_api.id(58942632937506619)
,p_validation_name=>'OBJECT_ID not null'
,p_validation_sequence=>30
,p_validation=>'OBJECT_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(58949737808506670)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'OBJECT_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(58952002353506687)
,p_tabular_form_region_id=>wwv_flow_api.id(58942632937506619)
,p_validation_name=>'PAGE_ID not null'
,p_validation_sequence=>50
,p_validation=>'PAGE_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(58949737808506670)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'PAGE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(58952370460506688)
,p_tabular_form_region_id=>wwv_flow_api.id(58942632937506619)
,p_validation_name=>'PAGE_ID must be numeric'
,p_validation_sequence=>50
,p_validation=>'PAGE_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(58949737808506670)
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'PAGE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58952687839506689)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(58942632937506619)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'OBJECT_PAGE_REL'
,p_attribute_03=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(58949737808506670)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
,p_security_scheme=>wwv_flow_api.id(59023141227969587)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(58953081734506690)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(58942632937506619)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'OBJECT_PAGE_REL'
,p_attribute_03=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'MULTI_ROW_DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
,p_security_scheme=>wwv_flow_api.id(59023141227969587)
);
end;
/
