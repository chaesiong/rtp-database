prompt --application/pages/page_00850
begin
wwv_flow_api.create_page(
 p_id=>850
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Audits'
,p_page_mode=>'NORMAL'
,p_step_title=>'Audits'
,p_step_sub_title=>'Audits'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#changes{',
'    overflow: scroll;',
'}',
'',
'#report_changes > div > .t-Report-tableWrap > table > thead{',
'    display: none',
'}',
'',
'#report_changes > div > .t-Report-tableWrap > table > tbody > tr:first-child{',
'    color: rgb(93, 182, 251);',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190801192347'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9424812844862766052)
,p_plug_name=>'Audit'
,p_region_name=>'audit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096075490202982)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (',
'    --! computer_org_unit_rel',
'    --! computer_role_rel',
'    --! computers',
'    -- grants',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''grants'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.grants',
'    -- grants history',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''grants$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.grants$his',
'    --! lookups',
'    -- objects',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''objects'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.objects',
'    -- objects history',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''objects$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.objects$his',
'    -- object grant rel',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''object_grant_rel'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.object_grant_rel',
'    -- object grant rel',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''object_grant_rel'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.object_grant_rel$his',
'    -- object page rel',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''object_page_rel'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.object_page_rel',
'    -- object page rel',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''object_page_rel$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.object_page_rel$his',
'    --! org_unit_org_unit_rel',
'    --! org_units',
'    -- parameter_settings',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''parameter_settings'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.parameter_settings',
'    -- parameter_settings history',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''parameter_settings$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.parameter_settings$his',
'    -- roles',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''roles'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.roles',
'    -- roles history',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''roles$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.roles$his',
'    -- role object grant rel',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''role_object_grant_rel'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.role_object_grant_rel',
'    -- role object grant rel histroy',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''role_object_grant_rel$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.role_object_grant_rel$his',
'    -- role role rel',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''role_role_rel'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.role_role_rel',
'    -- role role rel history',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''role_role_rel$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.role_role_rel$his',
'    --! user_org_unit_rel',
'    -- users',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''users'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.users',
'    -- users history',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''users$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.users$his',
'    -- user role rel',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''user_role_rel'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.user_role_rel',
'    -- user role rel history',
'    union all',
'    select dml_at',
'          ,to_char(dml_at, ''YYYYMMDDHH24MISSFF'') as dml_at_hid',
'          ,substr(dml_by, 1, instr(dml_by, chr(32) || ''@'') -1 ) as dml_by',
'          ,''user_role_rel$his'' as category',
'          ,dml_type',
'          ,case dml_type',
'            when ''I'' then ''<span class="fa fa-plus-square-o"></span>''',
'            when ''D'' then ''<span class="fa fa-trash-o"></span>''',
'            when ''U'' then ''<span class="fa fa-edit"></span>''',
'           end as action',
'          ,id as record_id',
'    from dl_user_management.user_role_rel$his',
')',
'order by dml_at desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(9424815957993766083)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:850:&SESSION.:OPEN_MODAL:&DEBUG.::P850_DETAILS_ACTION,P850_DETAILS_TABLE,P850_DETAILS_RECORD_ID,P850_DETAILS_DML_AT:#DML_TYPE#,#CATEGORY#,#RECORD_ID#,#DML_AT_HID#'
,p_detail_link_text=>'<span class="fa fa-search"></span>'
,p_owner=>'E1MSTAHL'
,p_internal_uid=>9424815957993766083
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4689350764654325120)
,p_db_column_name=>'DML_AT'
,p_display_order=>20
,p_column_identifier=>'G'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4689349250324325114)
,p_db_column_name=>'DML_AT_HID'
,p_display_order=>30
,p_column_identifier=>'J'
,p_column_label=>'Dml at hid'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4689349667217325115)
,p_db_column_name=>'DML_BY'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'User'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4689351126012325120)
,p_db_column_name=>'DML_TYPE'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Dml type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4689350068662325117)
,p_db_column_name=>'CATEGORY'
,p_display_order=>70
,p_column_identifier=>'C'
,p_column_label=>'Category'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4689351555912325121)
,p_db_column_name=>'ACTION'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Action'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4689350469076325119)
,p_db_column_name=>'RECORD_ID'
,p_display_order=>90
,p_column_identifier=>'E'
,p_column_label=>'Record ID'
,p_column_html_expression=>'<span data-header="recordId" data-dml-at="#DML_AT#" data-action="#SUMMARY#" data-id="#RECORD_ID#" data-table="#CATEGORY#">#RECORD_ID#</span>'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9433148639517623526)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46893519'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'DML_AT:DML_BY:ACTION:CATEGORY:RECORD_ID:'
,p_sort_column_1=>'0'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(4689352331564325129)
,p_report_id=>wwv_flow_api.id(9433148639517623526)
,p_name=>'Created'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ACTION'
,p_operator=>'='
,p_expr=>'<span class="fa fa-plus-square-o"></span>'
,p_condition_sql=>' (case when ("ACTION" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''<span class="fa fa-plus-square-o"></span>''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#E6FFDB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(4689352729531325129)
,p_report_id=>wwv_flow_api.id(9433148639517623526)
,p_name=>'Deleted'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ACTION'
,p_operator=>'='
,p_expr=>'<span class="fa fa-trash-o"></span>'
,p_condition_sql=>' (case when ("ACTION" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''<span class="fa fa-trash-o"></span>''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFA8A8'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9433132369270617539)
,p_plug_name=>'Record Details'
,p_region_name=>'details'
,p_region_css_classes=>'js-dialog-size1600x580'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(63095213451202981)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9433133178777617547)
,p_name=>'Record Changes'
,p_parent_plug_id=>wwv_flow_api.id(9433132369270617539)
,p_template=>wwv_flow_api.id(63096565992202984)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_query clob := null;',
'    l_dml_at varchar2(32) := :P850_DETAILS_DML_AT;',
'    l_id varchar2(32) := :P850_DETAILS_RECORD_ID;',
'    l_table varchar2(400) := :P850_DETAILS_TABLE;',
'begin',
'    l_query := q''[select ''New'' as Record, t.*',
'    from dl_user_management.]'' || l_table || q''[ t',
'    where dml_at = to_timestamp('']'' || l_dml_at || q''['',''YYYYMMDDHH24MISSFF'')',
'    and id = '']'' || l_id || q''[''',
'    union all',
'    select * from (',
'    select ''Old'' as Record, t.*',
'    from dl_user_management.]'' || substr(l_table || ''$'', 1, instr(l_table  || ''$'', ''$'') -1) || q''[$his t',
'    where dml_at < to_timestamp('']'' || l_dml_at || q''['',''YYYYMMDDHH24MISSFF'')',
'    and id = '']'' || l_id || q''[''',
'    order by dml_at desc',
'    fetch first 1 row only);',
'    ]'';',
'    return l_query;',
'end;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(63105422961203007)
,p_plug_query_max_columns=>50
,p_query_num_rows=>2
,p_query_options=>'GENERIC_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689354120313325143)
,p_query_column_id=>1
,p_column_alias=>'COL01'
,p_column_display_sequence=>1
,p_column_heading=>'Col01'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689354525046325145)
,p_query_column_id=>2
,p_column_alias=>'COL02'
,p_column_display_sequence=>2
,p_column_heading=>'Col02'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689354906889325146)
,p_query_column_id=>3
,p_column_alias=>'COL03'
,p_column_display_sequence=>3
,p_column_heading=>'Col03'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689355393072325146)
,p_query_column_id=>4
,p_column_alias=>'COL04'
,p_column_display_sequence=>4
,p_column_heading=>'Col04'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689355711098325146)
,p_query_column_id=>5
,p_column_alias=>'COL05'
,p_column_display_sequence=>5
,p_column_heading=>'Col05'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689356152878325146)
,p_query_column_id=>6
,p_column_alias=>'COL06'
,p_column_display_sequence=>6
,p_column_heading=>'Col06'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689356551725325147)
,p_query_column_id=>7
,p_column_alias=>'COL07'
,p_column_display_sequence=>7
,p_column_heading=>'Col07'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689356979292325147)
,p_query_column_id=>8
,p_column_alias=>'COL08'
,p_column_display_sequence=>8
,p_column_heading=>'Col08'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689357397323325147)
,p_query_column_id=>9
,p_column_alias=>'COL09'
,p_column_display_sequence=>9
,p_column_heading=>'Col09'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689357709642325147)
,p_query_column_id=>10
,p_column_alias=>'COL10'
,p_column_display_sequence=>10
,p_column_heading=>'Col10'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689358161993325148)
,p_query_column_id=>11
,p_column_alias=>'COL11'
,p_column_display_sequence=>11
,p_column_heading=>'Col11'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689358587138325148)
,p_query_column_id=>12
,p_column_alias=>'COL12'
,p_column_display_sequence=>12
,p_column_heading=>'Col12'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689358927359325148)
,p_query_column_id=>13
,p_column_alias=>'COL13'
,p_column_display_sequence=>13
,p_column_heading=>'Col13'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689359384494325149)
,p_query_column_id=>14
,p_column_alias=>'COL14'
,p_column_display_sequence=>14
,p_column_heading=>'Col14'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689359789622325149)
,p_query_column_id=>15
,p_column_alias=>'COL15'
,p_column_display_sequence=>15
,p_column_heading=>'Col15'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689360196290325149)
,p_query_column_id=>16
,p_column_alias=>'COL16'
,p_column_display_sequence=>16
,p_column_heading=>'Col16'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689360578196325149)
,p_query_column_id=>17
,p_column_alias=>'COL17'
,p_column_display_sequence=>17
,p_column_heading=>'Col17'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689360979937325150)
,p_query_column_id=>18
,p_column_alias=>'COL18'
,p_column_display_sequence=>18
,p_column_heading=>'Col18'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689361302245325150)
,p_query_column_id=>19
,p_column_alias=>'COL19'
,p_column_display_sequence=>19
,p_column_heading=>'Col19'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689361798759325150)
,p_query_column_id=>20
,p_column_alias=>'COL20'
,p_column_display_sequence=>20
,p_column_heading=>'Col20'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689362112708325150)
,p_query_column_id=>21
,p_column_alias=>'COL21'
,p_column_display_sequence=>21
,p_column_heading=>'Col21'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689362556353325151)
,p_query_column_id=>22
,p_column_alias=>'COL22'
,p_column_display_sequence=>22
,p_column_heading=>'Col22'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689362994740325151)
,p_query_column_id=>23
,p_column_alias=>'COL23'
,p_column_display_sequence=>23
,p_column_heading=>'Col23'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689363323385325157)
,p_query_column_id=>24
,p_column_alias=>'COL24'
,p_column_display_sequence=>24
,p_column_heading=>'Col24'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689363702849325158)
,p_query_column_id=>25
,p_column_alias=>'COL25'
,p_column_display_sequence=>25
,p_column_heading=>'Col25'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689364117223325158)
,p_query_column_id=>26
,p_column_alias=>'COL26'
,p_column_display_sequence=>26
,p_column_heading=>'Col26'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689364593423325158)
,p_query_column_id=>26
,p_column_alias=>'COL26'
,p_column_display_sequence=>26
,p_column_heading=>'Col26'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689364973837325165)
,p_query_column_id=>27
,p_column_alias=>'COL27'
,p_column_display_sequence=>27
,p_column_heading=>'Col27'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689365398687325165)
,p_query_column_id=>27
,p_column_alias=>'COL27'
,p_column_display_sequence=>27
,p_column_heading=>'Col27'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689365723875325165)
,p_query_column_id=>28
,p_column_alias=>'COL28'
,p_column_display_sequence=>28
,p_column_heading=>'Col28'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689366158026325167)
,p_query_column_id=>28
,p_column_alias=>'COL28'
,p_column_display_sequence=>28
,p_column_heading=>'Col28'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689366500499325167)
,p_query_column_id=>29
,p_column_alias=>'COL29'
,p_column_display_sequence=>29
,p_column_heading=>'Col29'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689366930340325167)
,p_query_column_id=>29
,p_column_alias=>'COL29'
,p_column_display_sequence=>29
,p_column_heading=>'Col29'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689367363480325168)
,p_query_column_id=>30
,p_column_alias=>'COL30'
,p_column_display_sequence=>30
,p_column_heading=>'Col30'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689367755385325168)
,p_query_column_id=>30
,p_column_alias=>'COL30'
,p_column_display_sequence=>30
,p_column_heading=>'Col30'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689368188874325168)
,p_query_column_id=>31
,p_column_alias=>'COL31'
,p_column_display_sequence=>31
,p_column_heading=>'Col31'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689368521596325168)
,p_query_column_id=>32
,p_column_alias=>'COL32'
,p_column_display_sequence=>32
,p_column_heading=>'Col32'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
end;
/
begin
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689368983360325169)
,p_query_column_id=>33
,p_column_alias=>'COL33'
,p_column_display_sequence=>33
,p_column_heading=>'Col33'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689369315399325169)
,p_query_column_id=>34
,p_column_alias=>'COL34'
,p_column_display_sequence=>34
,p_column_heading=>'Col34'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689369750190325169)
,p_query_column_id=>35
,p_column_alias=>'COL35'
,p_column_display_sequence=>35
,p_column_heading=>'Col35'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689370136307325170)
,p_query_column_id=>36
,p_column_alias=>'COL36'
,p_column_display_sequence=>36
,p_column_heading=>'Col36'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689370554882325170)
,p_query_column_id=>37
,p_column_alias=>'COL37'
,p_column_display_sequence=>37
,p_column_heading=>'Col37'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689370972844325170)
,p_query_column_id=>38
,p_column_alias=>'COL38'
,p_column_display_sequence=>38
,p_column_heading=>'Col38'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689371367366325170)
,p_query_column_id=>39
,p_column_alias=>'COL39'
,p_column_display_sequence=>39
,p_column_heading=>'Col39'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689371745036325171)
,p_query_column_id=>40
,p_column_alias=>'COL40'
,p_column_display_sequence=>40
,p_column_heading=>'Col40'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689372101196325171)
,p_query_column_id=>41
,p_column_alias=>'COL41'
,p_column_display_sequence=>41
,p_column_heading=>'Col41'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689372531389325171)
,p_query_column_id=>42
,p_column_alias=>'COL42'
,p_column_display_sequence=>42
,p_column_heading=>'Col42'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689372920219325171)
,p_query_column_id=>43
,p_column_alias=>'COL43'
,p_column_display_sequence=>43
,p_column_heading=>'Col43'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689373375278325172)
,p_query_column_id=>44
,p_column_alias=>'COL44'
,p_column_display_sequence=>44
,p_column_heading=>'Col44'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689373756235325172)
,p_query_column_id=>45
,p_column_alias=>'COL45'
,p_column_display_sequence=>45
,p_column_heading=>'Col45'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689374129197325172)
,p_query_column_id=>46
,p_column_alias=>'COL46'
,p_column_display_sequence=>46
,p_column_heading=>'Col46'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689374568137325179)
,p_query_column_id=>47
,p_column_alias=>'COL47'
,p_column_display_sequence=>47
,p_column_heading=>'Col47'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689374985061325179)
,p_query_column_id=>48
,p_column_alias=>'COL48'
,p_column_display_sequence=>48
,p_column_heading=>'Col48'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689375336316325180)
,p_query_column_id=>49
,p_column_alias=>'COL49'
,p_column_display_sequence=>49
,p_column_heading=>'Col49'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689375783001325180)
,p_query_column_id=>50
,p_column_alias=>'COL50'
,p_column_display_sequence=>50
,p_column_heading=>'Col50'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(9433346585754303538)
,p_name=>'Col Names'
,p_parent_plug_id=>wwv_flow_api.id(9433132369270617539)
,p_template=>wwv_flow_api.id(63096565992202984)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_region_attributes=>'style="display:none"'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_query clob := q''[select ''STATUS'',]'';',
'begin',
'    for rec in (select column_name',
'                from all_tab_cols',
'                where table_name = upper(:P850_DETAILS_TABLE)',
'                and owner = ''DL_USER_MANAGEMENT'')',
'    loop',
'        l_query := l_query || q''['']'' || rec.column_name ||  q''['']'' || '', '';',
'    end loop;',
'    l_query := substr(l_query, 0, length(l_query) -2);',
'    l_query := l_query || '' from dual;'';',
'    return l_query;',
'end;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(63105422961203007)
,p_plug_query_max_columns=>50
,p_query_num_rows=>15
,p_query_options=>'GENERIC_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689376401043325182)
,p_query_column_id=>1
,p_column_alias=>'COL01'
,p_column_display_sequence=>1
,p_column_heading=>'Col01'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689376839731325185)
,p_query_column_id=>2
,p_column_alias=>'COL02'
,p_column_display_sequence=>2
,p_column_heading=>'Col02'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689377290839325186)
,p_query_column_id=>3
,p_column_alias=>'COL03'
,p_column_display_sequence=>3
,p_column_heading=>'Col03'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689377662171325186)
,p_query_column_id=>4
,p_column_alias=>'COL04'
,p_column_display_sequence=>4
,p_column_heading=>'Col04'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689378086371325186)
,p_query_column_id=>5
,p_column_alias=>'COL05'
,p_column_display_sequence=>5
,p_column_heading=>'Col05'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689378446881325187)
,p_query_column_id=>6
,p_column_alias=>'COL06'
,p_column_display_sequence=>6
,p_column_heading=>'Col06'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689378854266325187)
,p_query_column_id=>7
,p_column_alias=>'COL07'
,p_column_display_sequence=>7
,p_column_heading=>'Col07'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689379245877325187)
,p_query_column_id=>8
,p_column_alias=>'COL08'
,p_column_display_sequence=>8
,p_column_heading=>'Col08'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689379685986325187)
,p_query_column_id=>9
,p_column_alias=>'COL09'
,p_column_display_sequence=>9
,p_column_heading=>'Col09'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689380051044325188)
,p_query_column_id=>10
,p_column_alias=>'COL10'
,p_column_display_sequence=>10
,p_column_heading=>'Col10'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689383259640325192)
,p_query_column_id=>11
,p_column_alias=>'COL11'
,p_column_display_sequence=>11
,p_column_heading=>'Col11'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689383668487325195)
,p_query_column_id=>12
,p_column_alias=>'COL12'
,p_column_display_sequence=>12
,p_column_heading=>'Col12'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689384046648325196)
,p_query_column_id=>13
,p_column_alias=>'COL13'
,p_column_display_sequence=>13
,p_column_heading=>'Col13'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689380430852325188)
,p_query_column_id=>14
,p_column_alias=>'COL14'
,p_column_display_sequence=>14
,p_column_heading=>'Col14'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689380860987325188)
,p_query_column_id=>15
,p_column_alias=>'COL15'
,p_column_display_sequence=>15
,p_column_heading=>'Col15'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689381211548325188)
,p_query_column_id=>16
,p_column_alias=>'COL16'
,p_column_display_sequence=>16
,p_column_heading=>'Col16'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689381661758325189)
,p_query_column_id=>17
,p_column_alias=>'COL17'
,p_column_display_sequence=>17
,p_column_heading=>'Col17'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689382028421325190)
,p_query_column_id=>18
,p_column_alias=>'COL18'
,p_column_display_sequence=>18
,p_column_heading=>'Col18'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689382463771325191)
,p_query_column_id=>19
,p_column_alias=>'COL19'
,p_column_display_sequence=>19
,p_column_heading=>'Col19'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689382831721325192)
,p_query_column_id=>20
,p_column_alias=>'COL20'
,p_column_display_sequence=>20
,p_column_heading=>'Col20'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689384480050325197)
,p_query_column_id=>21
,p_column_alias=>'COL21'
,p_column_display_sequence=>21
,p_column_heading=>'Col21'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689384821867325197)
,p_query_column_id=>22
,p_column_alias=>'COL22'
,p_column_display_sequence=>22
,p_column_heading=>'Col22'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689385205347325197)
,p_query_column_id=>23
,p_column_alias=>'COL23'
,p_column_display_sequence=>23
,p_column_heading=>'Col23'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689385697257325197)
,p_query_column_id=>24
,p_column_alias=>'COL24'
,p_column_display_sequence=>24
,p_column_heading=>'Col24'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689386017876325201)
,p_query_column_id=>25
,p_column_alias=>'COL25'
,p_column_display_sequence=>25
,p_column_heading=>'Col25'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689386476753325201)
,p_query_column_id=>26
,p_column_alias=>'COL26'
,p_column_display_sequence=>26
,p_column_heading=>'Col26'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689386802329325202)
,p_query_column_id=>27
,p_column_alias=>'COL27'
,p_column_display_sequence=>27
,p_column_heading=>'Col27'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689390018552325208)
,p_query_column_id=>28
,p_column_alias=>'COL28'
,p_column_display_sequence=>28
,p_column_heading=>'Col28'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689387264865325203)
,p_query_column_id=>29
,p_column_alias=>'COL29'
,p_column_display_sequence=>29
,p_column_heading=>'Col29'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689387662963325203)
,p_query_column_id=>30
,p_column_alias=>'COL30'
,p_column_display_sequence=>30
,p_column_heading=>'Col30'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689388075925325205)
,p_query_column_id=>31
,p_column_alias=>'COL31'
,p_column_display_sequence=>31
,p_column_heading=>'Col31'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689388418219325205)
,p_query_column_id=>32
,p_column_alias=>'COL32'
,p_column_display_sequence=>32
,p_column_heading=>'Col32'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689388875719325206)
,p_query_column_id=>33
,p_column_alias=>'COL33'
,p_column_display_sequence=>33
,p_column_heading=>'Col33'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689389281266325207)
,p_query_column_id=>34
,p_column_alias=>'COL34'
,p_column_display_sequence=>34
,p_column_heading=>'Col34'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689389625216325207)
,p_query_column_id=>35
,p_column_alias=>'COL35'
,p_column_display_sequence=>35
,p_column_heading=>'Col35'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689390440391325208)
,p_query_column_id=>36
,p_column_alias=>'COL36'
,p_column_display_sequence=>36
,p_column_heading=>'Col36'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689390800171325208)
,p_query_column_id=>37
,p_column_alias=>'COL37'
,p_column_display_sequence=>37
,p_column_heading=>'Col37'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689391200920325209)
,p_query_column_id=>38
,p_column_alias=>'COL38'
,p_column_display_sequence=>38
,p_column_heading=>'Col38'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689391631454325209)
,p_query_column_id=>39
,p_column_alias=>'COL39'
,p_column_display_sequence=>39
,p_column_heading=>'Col39'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689392077574325209)
,p_query_column_id=>40
,p_column_alias=>'COL40'
,p_column_display_sequence=>40
,p_column_heading=>'Col40'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689392426083325210)
,p_query_column_id=>41
,p_column_alias=>'COL41'
,p_column_display_sequence=>41
,p_column_heading=>'Col41'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689392825210325210)
,p_query_column_id=>42
,p_column_alias=>'COL42'
,p_column_display_sequence=>42
,p_column_heading=>'Col42'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689393287416325213)
,p_query_column_id=>43
,p_column_alias=>'COL43'
,p_column_display_sequence=>43
,p_column_heading=>'Col43'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689393632715325214)
,p_query_column_id=>44
,p_column_alias=>'COL44'
,p_column_display_sequence=>44
,p_column_heading=>'Col44'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689394048010325214)
,p_query_column_id=>45
,p_column_alias=>'COL45'
,p_column_display_sequence=>45
,p_column_heading=>'Col45'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689394406799325214)
,p_query_column_id=>46
,p_column_alias=>'COL46'
,p_column_display_sequence=>46
,p_column_heading=>'Col46'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689394802781325214)
,p_query_column_id=>47
,p_column_alias=>'COL47'
,p_column_display_sequence=>47
,p_column_heading=>'Col47'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689395233324325215)
,p_query_column_id=>48
,p_column_alias=>'COL48'
,p_column_display_sequence=>48
,p_column_heading=>'Col48'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689395657006325215)
,p_query_column_id=>49
,p_column_alias=>'COL49'
,p_column_display_sequence=>49
,p_column_heading=>'Col49'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4689396045432325215)
,p_query_column_id=>50
,p_column_alias=>'COL50'
,p_column_display_sequence=>50
,p_column_heading=>'Col50'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9433455448591815066)
,p_plug_name=>'Record Information'
,p_parent_plug_id=>wwv_flow_api.id(9433132369270617539)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(63096565992202984)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4689353410208325140)
,p_name=>'P850_DETAILS_DML_AT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9433132369270617539)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4689396765052325216)
,p_name=>'P850_DETAILS_ACTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9433455448591815066)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Action'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Entry has been created;I,Entry has been deleted;D,Entry has been modified;U'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'disabled'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4689397159171325216)
,p_name=>'P850_DETAILS_TABLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9433455448591815066)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Table'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_tag_attributes=>'disabled'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4689397508632325217)
,p_name=>'P850_DETAILS_RECORD_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9433455448591815066)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Record ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_tag_attributes=>'disabled'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4689397932450325220)
,p_name=>'On click Record ID'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#audit_content .t-fht-tbody > table > tbody > tr > td > span[data-header="recordId"]'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4689398370137325221)
,p_event_id=>wwv_flow_api.id(4689397932450325220)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P850_DETAILS_ACTION,P850_DETAILS_DML_AT,P850_DETAILS_TABLE,P850_DETAILS_RECORD_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4689398894786325221)
,p_event_id=>wwv_flow_api.id(4689397932450325220)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(9433133178777617547)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4689399235466325222)
,p_name=>'OpenModal'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'REQUEST_EQUALS_CONDITION'
,p_display_when_cond=>'OPEN_MODAL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4689399736389325224)
,p_event_id=>wwv_flow_api.id(4689399235466325222)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#report_changes > div > .t-Report-tableWrap > table > tbody'').prepend($(''#report_colNames > div > .t-Report-tableWrap > table > tbody > tr''));',
'openModal(''details'');'))
,p_stop_execution_on_error=>'Y'
);
end;
/
