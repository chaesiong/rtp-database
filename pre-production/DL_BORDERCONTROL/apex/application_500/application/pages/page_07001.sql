prompt --application/pages/page_07001
begin
wwv_flow_api.create_page(
 p_id=>7001
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'User Details'
,p_page_mode=>'MODAL'
,p_step_title=>'User Details'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(575896413213708794)
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#ApexConfirm.js',
'#APP_IMAGES#UserManagement.js'))
,p_javascript_code_onload=>'initButtonHandling();'
,p_css_file_urls=>'#WORKSPACE_IMAGES#ApexConfirm.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Report-colHead {',
'  background-color: #d7e4f6;',
'}',
'',
'.t-Dialog .col-12 {',
'  min-height: 0;',
'}',
'',
'.apex-rds, .t-Tabs {',
'  margin-bottom: 1em;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'700'
,p_dialog_width=>'700'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20171110161209'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(896659199538699836)
,p_plug_name=>'User Details'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(950504451606947972)
,p_name=>'User Permissions Overview'
,p_parent_plug_id=>wwv_flow_api.id(896659199538699836)
,p_template=>wwv_flow_api.id(563812786985049615)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_region_attributes=>'style="padding: 0.5em; margin-top: 1em;"'
,p_grid_column_span=>9
,p_display_column=>4
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Primary'' permissiongroup, 0 permissioncount from dual',
'union all',
'select ''Secondary'', 0 from dual',
'union all',
'select ''Support'', 0 from dual',
'union all',
'select ''Admin'', 0 from dual'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(950505031785947996)
,p_query_column_id=>1
,p_column_alias=>'PERMISSIONGROUP'
,p_column_display_sequence=>1
,p_column_heading=>'Profile'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(950505436895948000)
,p_query_column_id=>2
,p_column_alias=>'PERMISSIONCOUNT'
,p_column_display_sequence=>2
,p_column_heading=>'Ratio'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span id="totalpermissions_#PERMISSIONGROUP#"></span>'
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940635473316016922)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(942302554057600210)
,p_name=>'Primary'
,p_template=>wwv_flow_api.id(563812786985049615)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_region_attributes=>'style="display: none"'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT perm.name_en, perm.permissionid, perm.isuser wasuser, perm.isuser FROM (',
'SELECT p.*, DECODE(u.permissionid, NULL, 0, 1) isuser FROM (',
'	SELECT perms.name_en, perms.permissionid, DECODE(groupperm.permissionid, NULL, 0, 1) isgroup FROM',
'		(SELECT name_en, permissionid FROM PERMISSIONS) perms',
'		/*LEFT OUTER*/ JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''primary''))) groupperm',
'		ON perms.permissionid = groupperm.permissionid',
') p LEFT OUTER JOIN (',
'	SELECT permissionid FROM TABLE(dl_ldap.ldap_get_user_permissions(''admin'', ''dermalog!'', :P7001_USER_NAME))',
') u ON p.permissionid = u.permissionid',
') perm',
'--order by permissionid'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'AI_P_1039_see_user_create'
,p_display_when_cond2=>'1'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942304633856610238)
,p_query_column_id=>1
,p_column_alias=>'NAME_EN'
,p_column_display_sequence=>2
,p_column_heading=>'Primary Rights (All)'
,p_use_as_row_header=>'N'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942303400198600264)
,p_query_column_id=>2
,p_column_alias=>'PERMISSIONID'
,p_column_display_sequence=>1
,p_column_heading=>'Permissionid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942437321815552833)
,p_query_column_id=>3
,p_column_alias=>'WASUSER'
,p_column_display_sequence=>4
,p_column_heading=>'<button onclick="" class="t-Button t-Button--hot" type="button" id="btn_prev_primary"><span class="t-Button-label">Previous</span></button>'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<i class="fa fa-check" id="perm_prev_#PERMISSIONID#"></i><script>',
'if (#WASUSER# == 0) perm_prev_#PERMISSIONID#.setAttribute("class", "fa fa-times");',
'</script>'))
,p_column_alignment=>'CENTER'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942417527245503057)
,p_query_column_id=>4
,p_column_alias=>'ISUSER'
,p_column_display_sequence=>3
,p_column_heading=>'<button class="t-Button" type="button" id="btn_toggle_primary"><span class="t-Button-label"><i class="fa fa-times"></i></span></button>'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button class="t-Button t-Button--hot permission-primary" type="button" id="btn_perm_#PERMISSIONID#"><span class="t-Button-label"><i class="fa fa-check" id="perm_#PERMISSIONID#" data-value="#ISUSER#" data-prevvalue="#ISUSER#"></i></span></button>',
'<script>',
'if (#ISUSER# == 0) {',
'  perm_#PERMISSIONID#.setAttribute("class", "fa fa-times");',
'  btn_perm_#PERMISSIONID#.setAttribute("class", "t-Button permission-primary");',
'}',
'</script>'))
,p_column_alignment=>'CENTER'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(942436201762528138)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_row_template=>1
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(942441791619564175)
,p_name=>'Secondary'
,p_template=>wwv_flow_api.id(563812786985049615)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_region_attributes=>'style="display: none"'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT perm.name_en, perm.permissionid, perm.isuser wasuser, perm.isuser FROM (',
'SELECT p.*, DECODE(u.permissionid, NULL, 0, 1) isuser FROM (',
'	SELECT perms.name_en, perms.permissionid, DECODE(groupperm.permissionid, NULL, 0, 1) isgroup FROM',
'		(SELECT name_en, permissionid FROM PERMISSIONS) perms',
'		JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''secondary''))) groupperm',
'		ON perms.permissionid = groupperm.permissionid',
'		LEFT JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''primary''))) primperm',
'		ON groupperm.permissionid = primperm.permissionid',
'		WHERE primperm.permissionid IS NULL',
') p LEFT OUTER JOIN (',
'	SELECT permissionid FROM TABLE(dl_ldap.ldap_get_user_permissions(''admin'', ''dermalog!'', :P7001_USER_NAME))',
') u ON p.permissionid = u.permissionid',
') perm',
'--order by permissionid'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'AI_P_1044_see_setgrp_sec'
,p_display_when_cond2=>'1'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942442374398564181)
,p_query_column_id=>1
,p_column_alias=>'NAME_EN'
,p_column_display_sequence=>2
,p_column_heading=>'Secondary Rights (All)'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942442866618564183)
,p_query_column_id=>2
,p_column_alias=>'PERMISSIONID'
,p_column_display_sequence=>1
,p_column_heading=>'Permissionid'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942443262419564184)
,p_query_column_id=>3
,p_column_alias=>'WASUSER'
,p_column_display_sequence=>4
,p_column_heading=>'<button onclick="" class="t-Button t-Button--hot" type="button" id="btn_prev_secondary"><span class="t-Button-label">Previous</span></button>'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<i class="fa fa-check" id="perm_prev_#PERMISSIONID#"></i><script>',
'if (#WASUSER# == 0) perm_prev_#PERMISSIONID#.setAttribute("class", "fa fa-times");',
'</script>'))
,p_column_alignment=>'CENTER'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942443575503564185)
,p_query_column_id=>4
,p_column_alias=>'ISUSER'
,p_column_display_sequence=>3
,p_column_heading=>'<button class="t-Button" type="button" id="btn_toggle_secondary"><span class="t-Button-label"><i class="fa fa-times"></i></span></button>'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button class="t-Button t-Button--hot permission-secondary" type="button" id="btn_perm_#PERMISSIONID#"><span class="t-Button-label"><i class="fa fa-check" id="perm_#PERMISSIONID#" data-value="#ISUSER#" data-prevvalue="#ISUSER#"></i></span></button>',
'<script>',
'if (#ISUSER# == 0) {',
'  perm_#PERMISSIONID#.setAttribute("class", "fa fa-times");',
'  btn_perm_#PERMISSIONID#.setAttribute("class", "t-Button permission-secondary");',
'}',
'</script>'))
,p_column_alignment=>'CENTER'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(942449623325641399)
,p_name=>'Support'
,p_template=>wwv_flow_api.id(563812786985049615)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_region_attributes=>'style="display: none"'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT perm.name_en, perm.permissionid, perm.isuser wasuser, perm.isuser FROM (',
'SELECT p.*, DECODE(u.permissionid, NULL, 0, 1) isuser FROM (',
'	SELECT perms.name_en, perms.permissionid, DECODE(groupperm.permissionid, NULL, 0, 1) isgroup FROM',
'		(SELECT name_en, permissionid FROM PERMISSIONS) perms',
'		JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''support''))) groupperm',
'		ON perms.permissionid = groupperm.permissionid',
'		LEFT JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''secondary''))) secperm',
'		ON groupperm.permissionid = secperm.permissionid',
'		LEFT JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''primary''))) primperm',
'		ON groupperm.permissionid = primperm.permissionid',
'		WHERE primperm.permissionid IS NULL AND secperm.permissionid IS NULL',
') p LEFT OUTER JOIN (',
'	SELECT permissionid FROM TABLE(dl_ldap.ldap_get_user_permissions(''admin'', ''dermalog!'', :P7001_USER_NAME))',
') u ON p.permissionid = u.permissionid',
') perm',
'--order by permissionid'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'AI_P_1043_see_setgrp_sup'
,p_display_when_cond2=>'1'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942450230620641404)
,p_query_column_id=>1
,p_column_alias=>'NAME_EN'
,p_column_display_sequence=>2
,p_column_heading=>'Support Rights (All)'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942450664228641405)
,p_query_column_id=>2
,p_column_alias=>'PERMISSIONID'
,p_column_display_sequence=>1
,p_column_heading=>'Permissionid'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942450997265641406)
,p_query_column_id=>3
,p_column_alias=>'WASUSER'
,p_column_display_sequence=>4
,p_column_heading=>'<button class="t-Button t-Button--hot" type="button" id="btn_prev_support"><span class="t-Button-label">Previous</span></button>'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<i class="fa fa-check" id="perm_prev_#PERMISSIONID#"></i><script>',
'if (#WASUSER# == 0) perm_prev_#PERMISSIONID#.setAttribute("class", "fa fa-times");',
'</script>'))
,p_column_alignment=>'CENTER'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942451389797641407)
,p_query_column_id=>4
,p_column_alias=>'ISUSER'
,p_column_display_sequence=>3
,p_column_heading=>'<button class="t-Button" type="button" id="btn_toggle_support"><span class="t-Button-label"><i class="fa fa-times"></i></span></button>'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button class="t-Button t-Button--hot permission-support" type="button" id="btn_perm_#PERMISSIONID#"><span class="t-Button-label"><i class="fa fa-check" id="perm_#PERMISSIONID#" data-value="#ISUSER#" data-prevvalue="#ISUSER#"></i></span></button>',
'<script>',
'if (#ISUSER# == 0) {',
'  perm_#PERMISSIONID#.setAttribute("class", "fa fa-times");',
'  btn_perm_#PERMISSIONID#.setAttribute("class", "t-Button permission-support");',
'}',
'</script>'))
,p_column_alignment=>'CENTER'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(942468384846670453)
,p_name=>'Admin'
,p_template=>wwv_flow_api.id(563812786985049615)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_region_attributes=>'style="display: none"'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT perm.name_en, perm.permissionid, perm.isuser wasuser, perm.isuser FROM (',
'SELECT p.*, DECODE(u.permissionid, NULL, 0, 1) isuser FROM (',
'	SELECT perms.name_en, perms.permissionid, DECODE(groupperm.permissionid, NULL, 0, 1) isgroup FROM',
'		(SELECT name_en, permissionid FROM PERMISSIONS) perms',
'		JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''admin''))) groupperm',
'		ON perms.permissionid = groupperm.permissionid',
'		LEFT JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''support''))) supperm',
'		ON groupperm.permissionid = supperm.permissionid',
'		LEFT JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''secondary''))) secperm',
'		ON groupperm.permissionid = secperm.permissionid',
'		LEFT JOIN',
'		(SELECT permissionid FROM TABLE(dl_ldap.ldap_get_group_permissions(''admin'', ''dermalog!'', ''primary''))) primperm',
'		ON groupperm.permissionid = primperm.permissionid',
'		WHERE primperm.permissionid IS NULL AND secperm.permissionid IS NULL AND supperm.permissionid IS NULL',
') p LEFT OUTER JOIN (',
'	SELECT permissionid FROM TABLE(dl_ldap.ldap_get_user_permissions(''admin'', ''dermalog!'', :P7001_USER_NAME))',
') u ON p.permissionid = u.permissionid',
') perm',
'--order by permissionid'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_display_when_condition=>'AI_P_1042_see_setgrp_adm'
,p_display_when_cond2=>'1'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942468921331670458)
,p_query_column_id=>1
,p_column_alias=>'NAME_EN'
,p_column_display_sequence=>2
,p_column_heading=>'Admin Rights (All)'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942469270532670460)
,p_query_column_id=>2
,p_column_alias=>'PERMISSIONID'
,p_column_display_sequence=>1
,p_column_heading=>'Permissionid'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942469725208670461)
,p_query_column_id=>3
,p_column_alias=>'WASUSER'
,p_column_display_sequence=>4
,p_column_heading=>'<button class="t-Button t-Button--hot" type="button" id="btn_prev_admin"><span class="t-Button-label">Previous</span></button>'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<i class="fa fa-check" id="perm_prev_#PERMISSIONID#"></i><script>',
'if (#WASUSER# == 0) perm_prev_#PERMISSIONID#.setAttribute("class", "fa fa-times");',
'</script>'))
,p_column_alignment=>'CENTER'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(942470128128670462)
,p_query_column_id=>4
,p_column_alias=>'ISUSER'
,p_column_display_sequence=>3
,p_column_heading=>'<button class="t-Button" type="button" id="btn_toggle_admin"><span class="t-Button-label"><i class="fa fa-times"></i></span></button>'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button class="t-Button t-Button--hot permission-admin" type="button" id="btn_perm_#PERMISSIONID#"><span class="t-Button-label"><i class="fa fa-check" id="perm_#PERMISSIONID#" data-value="#ISUSER#" data-prevvalue="#ISUSER#"></i></span></button>',
'<script>',
'if (#ISUSER# == 0) {',
'  perm_#PERMISSIONID#.setAttribute("class", "fa fa-times");',
'  btn_perm_#PERMISSIONID#.setAttribute("class", "t-Button permission-admin");',
'}',
'</script>'))
,p_column_alignment=>'CENTER'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(896698448902001394)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(940635473316016922)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm (''Do you really want to delete this user?'',''DELETE'');'
,p_button_condition=>'select 1 from dual where :P7001_USER_CN is not null and :AI_P_1040_see_user_delete = 1'
,p_button_condition_type=>'EXISTS'
,p_button_css_classes=>'deletebutton'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(940478491373715366)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(896690666339861390)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(940635473316016922)
,p_button_name=>'APPLY_CHANGES'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P7001_USER_CN'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_api.id(940478491373715366)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(896695095300922568)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(940635473316016922)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'select 1 from dual where :P7001_USER_CN is null and :AI_P_1039_see_user_create = 1'
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(896695583149930168)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(940635473316016922)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(896735220317545581)
,p_branch_name=>'JMP_BACK'
,p_branch_action=>'7000'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(896659589530706160)
,p_name=>'P7001_USER_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'User Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_cHeight=>1
,p_tag_attributes=>'autofocus'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'P7001_USER_CN'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(896659911055711765)
,p_name=>'P7001_PASSWORD_NEW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'New Password:'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>50
,p_cMaxlength=>50
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'P7001_USER_CN'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this field to set a new password for the user.</p>',
'<p>If you do not want to change the password, leave this field empty.</p>'))
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(896660226140745823)
,p_name=>'P7001_GROUP'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_prompt=>'Group:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''gdiuser'' d, ''gdiuser'' r from dual',
'union all',
'select ''gdioper'', ''gdioper'' from dual',
'union all',
'select ''gdiadmin'', ''gdiadmin'' from dual'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(896691335232880388)
,p_name=>'P7001_USER_CN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'User Cn'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(896697604527984514)
,p_name=>'P7001_PASSWORD'
,p_is_required=>true
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'Password:'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>50
,p_cMaxlength=>50
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'P7001_USER_CN'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(896732479593397013)
,p_name=>'P7001_USER_NAME_DISPLAY'
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User Name:'
,p_source=>'P7001_USER_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'P7001_USER_CN'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(896779778516721528)
,p_name=>'P7001_ERROR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(926730187259001151)
,p_name=>'P7001_IS_LOCKED'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'Is Locked:'
,p_display_as=>'NATIVE_YES_NO'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(926875365314922936)
,p_name=>'P7001_LAST_LOGIN'
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'Last Login:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942613363611649102)
,p_name=>'P7001_PERMISSIONS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(952516650819213802)
,p_name=>'P7001_SURNAME'
,p_is_required=>true
,p_item_sequence=>32
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'Surname:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(952516949897217023)
,p_name=>'P7001_GIVENNAME'
,p_item_sequence=>34
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'Given Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(952517187795220137)
,p_name=>'P7001_EMPLOYEENUMBER'
,p_item_sequence=>36
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'ID:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(962696688490158575)
,p_name=>'P7001_POSITION'
,p_item_sequence=>38
,p_item_plug_id=>wwv_flow_api.id(896659199538699836)
,p_prompt=>'Position:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(896730491765276085)
,p_validation_name=>'P7001_USER_NAME'
,p_validation_sequence=>10
,p_validation=>'select 1 from table(dl_ldap.ldap_enumerate_users(''admin'', ''dermalog!'')) where (:P7001_USER_CN is null and user_name = :P7001_USER_NAME) or (:P7001_USER_CN is not null and :P7001_USER_CN <> :P7001_USER_NAME and user_name = :P7001_USER_NAME)'
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'User Name must be unique!'
,p_always_execute=>'N'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(896659589530706160)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(942611774586618831)
,p_name=>'DA_ApplyChanges'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(896690666339861390)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(942612246955618836)
,p_event_id=>wwv_flow_api.id(942611774586618831)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s("P7001_PERMISSIONS", "");',
'$s("P7001_PERMISSIONS", getPermissionMask());',
'',
'if ($(''#P7001_PASSWORD_NEW'').val() != '''') {',
'  apex.confirm (''Do you really want to set a new password for this user?'',''APPLY_CHANGES'');',
'} else {',
'  apex.submit({  request:"APPLY_CHANGES"});',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(943542748450149243)
,p_name=>'DA_Create'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(896695095300922568)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(943543141532149248)
,p_event_id=>wwv_flow_api.id(943542748450149243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s("P7001_PERMISSIONS", "");',
'$s("P7001_PERMISSIONS", getPermissionMask());',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(951525538512402007)
,p_event_id=>wwv_flow_api.id(943542748450149243)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CREATE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(896733563328499237)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_LDAP_APPLY'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P7001_PASSWORD_NEW is not null then',
'	if dl_ldap.ldap_set_user_password(''admin'', ''dermalog!'', :P7001_USER_CN, :P7001_PASSWORD_NEW) <> ''OK'' then',
'        raise_application_error (-20001,''Could not set the new password'');',
'		return;',
'	end if;',
'end if;',
'if dl_ldap.ldap_set_user_group(''admin'', ''dermalog!'', :P7001_USER_CN, :P7001_GROUP) <> ''OK'' then',
'    raise_application_error (-20001,''Could not set the group '' || :P7001_GROUP);',
'	return;',
'end if;',
'--raise_application_error(-20002, ''DEBUG - P7001_IS_LOCKED = '' || :P7001_IS_LOCKED);',
'--raise_application_error(-20002, ''DEBUG - P7001_USER_CN = '' || :P7001_USER_CN);',
'if dl_ldap.ldap_lock_date(''admin'', ''dermalog!'', :P7001_USER_CN) is not null then',
'	if :P7001_IS_LOCKED = ''N'' then',
'		if dl_ldap.ldap_unlock_account(''admin'', ''dermalog!'', :P7001_USER_CN) <> ''OK'' then',
'			raise_application_error (-20001,''Could not unlock the user account '' || :P7001_USER_CN);',
'		end if;',
'	end if;',
'else',
'	if :P7001_IS_LOCKED = ''Y'' then',
'		--raise_application_error (-20002, ''DEBUG - Would lock user now'');',
'		if dl_ldap.ldap_lock_account(''admin'', ''dermalog!'', :P7001_USER_CN) <> ''OK'' then',
'			raise_application_error (-20001,''Could not lock the user account '' || :P7001_USER_CN);',
'		end if;',
'	end if;',
'end if;',
'if dl_ldap.ldap_modify_user_permissions(''admin'', ''dermalog!'', :P7001_USER_CN, :P7001_PERMISSIONS) <> ''OK'' then',
'	raise_application_error (-20001,''Could not apply permissions for user '' || :P7001_USER_CN);',
'end if;',
'if dl_ldap.ldap_set_user_metadata(''admin'', ''dermalog!'', :P7001_USER_CN, :P7001_SURNAME, :P7001_GIVENNAME, :P7001_EMPLOYEENUMBER, :P7001_POSITION) <> ''OK'' then',
'	raise_application_error (-20001,''Could not set personal information for user '' || :P7001_USER_CN);',
'end if;',
'return;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(896690666339861390)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(896733999024507319)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_LDAP_CREATE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if dl_ldap.ldap_add_user(''admin'', ''dermalog!'', :P7001_USER_NAME, :P7001_PASSWORD, :P7001_GROUP) <> ''OK'' then',
'    raise_application_error (-20001,''Could not create the user'');',
'end if;',
'if :P7001_IS_LOCKED = ''Y'' then',
'	if dl_ldap.ldap_lock_account(''admin'', ''dermalog!'', :P7001_USER_NAME) <> ''OK'' then',
'		raise_application_error (-20001,''Could not lock the user account '' || :P7001_USER_NAME);',
'	end if;',
'end if;',
'if dl_ldap.ldap_modify_user_permissions(''admin'', ''dermalog!'', :P7001_USER_NAME, :P7001_PERMISSIONS) <> ''OK'' then',
'	raise_application_error (-20001,''Could not apply permissions for user '' || :P7001_USER_NAME);',
'end if;',
'if dl_ldap.ldap_set_user_metadata(''admin'', ''dermalog!'', :P7001_USER_NAME, :P7001_SURNAME, :P7001_GIVENNAME, :P7001_EMPLOYEENUMBER, :P7001_POSITION) <> ''OK'' then',
'	raise_application_error (-20001,''Could not set personal information for user '' || :P7001_USER_NAME);',
'end if;',
'return;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(896695095300922568)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(896734349258512029)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_LDAP_DELETE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if dl_ldap.ldap_remove_user(''admin'', ''dermalog!'', :P7001_USER_CN) <> ''OK'' then',
'    raise_application_error (-20001,''Could delete the user'');',
'end if;',
'return;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(896698448902001394)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(896699410070019230)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'PROC_CANCEL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(896695583149930168)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(896694612813899845)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SET_USER_NAME'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P7001_USER_NAME := :P7001_USER_CN;',
'',
'select case when dl_ldap.ldap_lock_date(''admin'', ''dermalog!'', :P7001_USER_NAME) is null then ''N'' else ''Y'' end into :P7001_IS_LOCKED from dual;',
'',
'select case when dl_ldap.ldap_get_last_login(''admin'', ''dermalog!'', :P7001_USER_NAME) is null then ''-'' else to_char(dl_ldap.ldap_get_last_login(''admin'', ''dermalog!'', :P7001_USER_NAME), ''DD/MM/YYYY HH24:MI'') end into :P7001_LAST_LOGIN from dual;',
'',
'for rec in (select sn, givenname, employeenumber, position from table(dl_ldap.get_users(''admin'', ''dermalog!'')) where cn = :P7001_USER_NAME) loop',
'	:P7001_SURNAME := rec.sn;',
'	:P7001_GIVENNAME := rec.givenname;',
'	:P7001_EMPLOYEENUMBER := rec.employeenumber;',
'	:P7001_POSITION := rec.position;',
'end loop;'))
);
end;
/
