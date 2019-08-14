prompt --application/pages/page_02010
begin
wwv_flow_api.create_page(
 p_id=>2010
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Borderposts and Terminals'
,p_page_mode=>'NORMAL'
,p_step_title=>'Borderposts and Terminals'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var htmldb_ch_message=''"OK_TO_GET_NEXT_PREV_PK_VALUE"'';'))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190805052454'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187242908866694368)
,p_plug_name=>'Borderposts'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(187257658147694449)
,p_name=>'Borderpost Terminals'
,p_template=>wwv_flow_api.id(563820889302049617)
,p_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'"ID",',
'"BORDER_POST",',
'"IPADDRESS",',
'"DEFAULTEXITFLG",',
'"ACTIVE",',
'"TRNSPRTMODEID",',
'"ISGATE",',
'"POS_X",',
'"POS_Y",',
'"WIDTH",',
'"HEIGHT",',
'"FLOOR_ID",',
'"BIO_CAPTURING",',
'"NAME",',
'"DEFAULT_CAMERA_DIRECTION"',
'from "#OWNER#"."TERMINALS"',
'where "BORDER_POST" = :P2010_KEY_VALUE',
''))
,p_source_type=>'NATIVE_TABFORM'
,p_display_when_condition=>'P2010_KEY_VALUE'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2010_BORDER_POST'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
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
 p_id=>wwv_flow_api.id(187258423049694453)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_pk_col_source_type=>'T'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187258769103694454)
,p_query_column_id=>2
,p_column_alias=>'BORDER_POST'
,p_column_display_sequence=>3
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'P2010_KEY_VALUE'
,p_column_default_type=>'ITEM'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'BORDER_POST'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187259205299694455)
,p_query_column_id=>3
,p_column_alias=>'IPADDRESS'
,p_column_display_sequence=>4
,p_column_heading=>'Ipaddress'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>15
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'IPADDRESS'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187259486193694456)
,p_query_column_id=>4
,p_column_alias=>'DEFAULTEXITFLG'
,p_column_display_sequence=>6
,p_column_heading=>'Entry / Exit'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(145064320709335682)
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'DEFAULTEXITFLG'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187259913899694457)
,p_query_column_id=>5
,p_column_alias=>'ACTIVE'
,p_column_display_sequence=>7
,p_column_heading=>'Active?'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(235001392283894561)
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'ACTIVE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187260249542694458)
,p_query_column_id=>6
,p_column_alias=>'TRNSPRTMODEID'
,p_column_display_sequence=>8
,p_column_heading=>'Transport Mode'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_QUERY'
,p_inline_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.TRANS_MODES$LC',
'    where IS_ACTIVE=''Y''',
'    and BORDER_TYPE =:P2010_BORDER_TYPE',
'    order by DISPLAY_ORDER'))
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'NO'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'TRNSPRTMODEID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187260629024694459)
,p_query_column_id=>7
,p_column_alias=>'ISGATE'
,p_column_display_sequence=>9
,p_column_heading=>'Isgate?'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(235001392283894561)
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'ISGATE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187261084549694460)
,p_query_column_id=>8
,p_column_alias=>'POS_X'
,p_column_display_sequence=>11
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'1'
,p_column_default_type=>'FUNCTION'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'POS_X'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187261453266694461)
,p_query_column_id=>9
,p_column_alias=>'POS_Y'
,p_column_display_sequence=>12
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'1'
,p_column_default_type=>'FUNCTION'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'POS_Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187261895207694462)
,p_query_column_id=>10
,p_column_alias=>'WIDTH'
,p_column_display_sequence=>13
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'1'
,p_column_default_type=>'FUNCTION'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'WIDTH'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187262244655694463)
,p_query_column_id=>11
,p_column_alias=>'HEIGHT'
,p_column_display_sequence=>14
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_column_default=>'1'
,p_column_default_type=>'FUNCTION'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'HEIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187262672777694464)
,p_query_column_id=>12
,p_column_alias=>'FLOOR_ID'
,p_column_display_sequence=>15
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'FLOOR_ID'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187263109898694465)
,p_query_column_id=>13
,p_column_alias=>'BIO_CAPTURING'
,p_column_display_sequence=>10
,p_column_heading=>'Capture Bio?'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NEVER'
,p_display_as=>'SELECT_LIST_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(235001392283894561)
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'BIO_CAPTURING'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187263502462694465)
,p_query_column_id=>14
,p_column_alias=>'NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_ref_schema=>'DL_BORDERCONTROL'
,p_ref_table_name=>'TERMINALS'
,p_ref_column_name=>'NAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(65868950615818407)
,p_query_column_id=>15
,p_column_alias=>'DEFAULT_CAMERA_DIRECTION'
,p_column_display_sequence=>16
,p_column_heading=>'Default Camera Direction'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'SELECT_LIST'
,p_inline_lov=>'STATIC:Left;L,Right;R'
,p_lov_show_nulls=>'YES'
,p_lov_null_text=>'Center'
,p_derived_column=>'N'
,p_lov_display_extra=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(187283588951694512)
,p_query_column_id=>16
,p_column_alias=>'CHECK$01'
,p_column_display_sequence=>1
,p_column_heading=>'Select Row'
,p_display_as=>'CHECKBOX'
,p_derived_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187243413033694369)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(187242908866694368)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P2010_KEY_VALUE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187269089255694482)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(187257658147694449)
,p_button_name=>'APPLY_CHANGES_ADD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Add Row'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'javascript:apex.widget.tabular.addRow();'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187250208107694430)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(187242908866694368)
,p_button_name=>'GET_PREVIOUS_KEY_VALUE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'javascript:htmldb_goSubmit(''GET_PREVIOUS_KEY_VALUE'')'
,p_button_condition=>'P2010_KEY_VALUE_PREV'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187250049094694430)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(187242908866694368)
,p_button_name=>'GET_NEXT_KEY_VALUE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_image_alt=>'Next'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'javascript:htmldb_goSubmit(''GET_NEXT_KEY_VALUE'')'
,p_button_condition=>'P2010_KEY_VALUE_NEXT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
,p_button_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187243544784694369)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(187242908866694368)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187243297021694369)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(187242908866694368)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P2010_KEY_VALUE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187243519399694369)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(187242908866694368)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187268962264694482)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(187257658147694449)
,p_button_name=>'APPLY_CHANGES_MRD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Delete Checked'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''APPLY_CHANGES_MRD'');'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from "#OWNER#"."TERMINALS"',
'where "BORDER_POST" = :P2010_KEY_VALUE'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(187283972012694513)
,p_branch_action=>'f?p=&APP_ID.:2010:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(187268840749694482)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(187254609892694441)
,p_branch_action=>'f?p=&APP_ID.:2010:&SESSION.::&DEBUG.::P2010_KEY_VALUE:&P2010_KEY_VALUE_NEXT.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(187250049094694430)
,p_branch_sequence=>10
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(187255025156694442)
,p_branch_action=>'f?p=&APP_ID.:2010:&SESSION.::&DEBUG.::P2010_KEY_VALUE:&P2010_KEY_VALUE_PREV.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(187250208107694430)
,p_branch_sequence=>20
,p_branch_comment=>'This button is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(187249679520694429)
,p_branch_action=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'SAVE,DELETE,CREATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187245181708694374)
,p_name=>'P2010_KEY_VALUE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Key Value'
,p_source=>'KEY_VALUE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187245592605694419)
,p_name=>'P2010_BORDER_TYPE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Border Type'
,p_source=>'BORDER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDER_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BORDER_TYPES$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187245991440694420)
,p_name=>'P2010_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>512
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187246413566694421)
,p_name=>'P2010_IS_ACTIVE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Is Active'
,p_source=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES_NO_ALFA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    dl_common.yes_nos$lc',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187246746128694423)
,p_name=>'P2010_BORDER_TO_COUNTRY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Border To Country'
,p_source=>'BORDER_TO_COUNTRY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.COUNTRIES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187247160766694424)
,p_name=>'P2010_LOCALE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_use_cache_before_default=>'NO'
,p_source=>'LOCALE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187252391859694435)
,p_name=>'P2010_KEY_VALUE_NEXT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_prompt=>'P2010_KEY_VALUE_NEXT'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187252826928694436)
,p_name=>'P2010_KEY_VALUE_PREV'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_prompt=>'P2010_KEY_VALUE_PREV'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187253214530694437)
,p_name=>'P2010_KEY_VALUE_COUNT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(187242908866694368)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_tag_attributes=>'class="fielddata"'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_item_comment=>'This item is needed for Get Next or Previous Primary Key Value process.'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187270418227694485)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'DEFAULTEXITFLG not null'
,p_validation_sequence=>40
,p_validation=>'DEFAULTEXITFLG'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'DEFAULTEXITFLG'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187270808119694486)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'DEFAULTEXITFLG must be numeric'
,p_validation_sequence=>40
,p_validation=>'DEFAULTEXITFLG'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'DEFAULTEXITFLG'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187271164629694486)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'ACTIVE not null'
,p_validation_sequence=>50
,p_validation=>'ACTIVE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'ACTIVE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187271617200694487)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'ACTIVE must be numeric'
,p_validation_sequence=>50
,p_validation=>'ACTIVE'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'ACTIVE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187271989947694487)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'TRNSPRTMODEID not null'
,p_validation_sequence=>60
,p_validation=>'TRNSPRTMODEID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'TRNSPRTMODEID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187272348661694488)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'TRNSPRTMODEID must be numeric'
,p_validation_sequence=>60
,p_validation=>'TRNSPRTMODEID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'TRNSPRTMODEID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187272818353694489)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'ISGATE not null'
,p_validation_sequence=>70
,p_validation=>'ISGATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'ISGATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187273185676694489)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'ISGATE must be numeric'
,p_validation_sequence=>70
,p_validation=>'ISGATE'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'ISGATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187273565255694490)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'POS_X not null'
,p_validation_sequence=>80
,p_validation=>'POS_X'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'POS_X'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187273964924694490)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'POS_X must be numeric'
,p_validation_sequence=>80
,p_validation=>'POS_X'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'POS_X'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187274428097694491)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'POS_Y not null'
,p_validation_sequence=>90
,p_validation=>'POS_Y'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'POS_Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187274789689694491)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'POS_Y must be numeric'
,p_validation_sequence=>90
,p_validation=>'POS_Y'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'POS_Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187275178054694492)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'WIDTH not null'
,p_validation_sequence=>100
,p_validation=>'WIDTH'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'WIDTH'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187275624616694493)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'WIDTH must be numeric'
,p_validation_sequence=>100
,p_validation=>'WIDTH'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'WIDTH'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187275954494694493)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'HEIGHT not null'
,p_validation_sequence=>110
,p_validation=>'HEIGHT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'HEIGHT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187276391349694494)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'HEIGHT must be numeric'
,p_validation_sequence=>110
,p_validation=>'HEIGHT'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'HEIGHT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187276788017694494)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'FLOOR_ID must be numeric'
,p_validation_sequence=>120
,p_validation=>'FLOOR_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'FLOOR_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187277197010694495)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'BIO_CAPTURING must be numeric'
,p_validation_sequence=>130
,p_validation=>'BIO_CAPTURING'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'BIO_CAPTURING'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(187277583014694496)
,p_tabular_form_region_id=>wwv_flow_api.id(187257658147694449)
,p_validation_name=>'NAME not null'
,p_validation_sequence=>140
,p_validation=>'NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must have a value.'
,p_always_execute=>'N'
,p_validation_condition=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_exec_cond_for_each_row=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(187811213574163790)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2010_BORDER_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187861633826412103)
,p_event_id=>wwv_flow_api.id(187811213574163790)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P2010_BORDER_TYPE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187835155352325097)
,p_event_id=>wwv_flow_api.id(187811213574163790)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(187257658147694449)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187248586540694427)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from BORDERPOSTS'
,p_attribute_02=>'BORDERPOSTS'
,p_attribute_03=>'P2010_KEY_VALUE'
,p_attribute_04=>'KEY_VALUE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187254161936694440)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_PAGINATION'
,p_process_name=>'Get Next or Previous Primary Key Value'
,p_attribute_02=>'BORDERPOSTS'
,p_attribute_03=>'P2010_KEY_VALUE'
,p_attribute_04=>'KEY_VALUE'
,p_attribute_07=>'NAME'
,p_attribute_09=>'P2010_KEY_VALUE_NEXT'
,p_attribute_10=>'P2010_KEY_VALUE_PREV'
,p_attribute_13=>'P2010_KEY_VALUE_COUNT'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187248961852694428)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of BORDERPOSTS'
,p_attribute_02=>'BORDERPOSTS'
,p_attribute_03=>'P2010_KEY_VALUE'
,p_attribute_04=>'KEY_VALUE'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187278256885694497)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(187257658147694449)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'TERMINALS'
,p_attribute_03=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':request like (''SAVE'') or :request like ''GET_NEXT%'' or :request like ''GET_PREV%'''
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187278663478694497)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(187257658147694449)
,p_process_type=>'NATIVE_TABFORM_DELETE'
,p_process_name=>'ApplyMRD'
,p_attribute_02=>'TERMINALS'
,p_attribute_03=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APPLY_CHANGES_MRD'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'#MRD_COUNT# row(s) deleted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187249410703694429)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(187243519399694369)
);
end;
/
