prompt --application/pages/page_00320
begin
wwv_flow_api.create_page(
 p_id=>320
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Edit Roles'
,p_page_mode=>'NORMAL'
,p_step_title=>'Edit Roles'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Edit Roles'
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
,p_cache_timeout_seconds=>21600
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Here you can edit appliaction roles. ',
'Privileges and Users can be assigned to roles.'))
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180911202913'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46371148419208971)
,p_plug_name=>'Role properties'
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
 p_id=>wwv_flow_api.id(44029609259852863)
,p_plug_name=>'Computer Members'
,p_parent_plug_id=>wwv_flow_api.id(46371148419208971)
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
 p_id=>wwv_flow_api.id(44216032161090829)
,p_plug_name=>'Member Of Roles'
,p_parent_plug_id=>wwv_flow_api.id(46371148419208971)
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
 p_id=>wwv_flow_api.id(63223985788631143)
,p_plug_name=>'User Members'
,p_parent_plug_id=>wwv_flow_api.id(46371148419208971)
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
 p_id=>wwv_flow_api.id(63634334757518235)
,p_plug_name=>'Permissions'
,p_region_name=>'ID_IR_PERMISSIONS'
,p_parent_plug_id=>wwv_flow_api.id(46371148419208971)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096075490202982)
,p_plug_display_sequence=>4
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r0.INHERIT_LEVEL',
'      ,case',
'         when (r0.INHERIT_LEVEL = 0) then',
'          ''<a href="'' || APEX_UTIL.PREPARE_URL(''f?p='' || :APP_ID || '':321:'' || :APP_SESSION || ''::NO::P321_ROLE_ID,P321_OBJECT_ID:'' || r0.ROLE_ID_OR_DN || '','' || obj.ID',
'                                              ,''SESSION'') || ''">''',
'         --',
'          || ''<img src="/i/app_ui/img/icons/apex-edit-pencil-alt.png" class="apex-edit-pencil-alt" alt="">''',
'         --',
'          || ''</a>''',
'         else',
'          ''''',
'       end as EDIT_LINK',
'      ,decode(r0.INHERIT_LEVEL',
'             ,0',
'             ,null',
'             ,r0.ROLE_ID_OR_DN) as INHERITED_FROM_ROLE',
'      ,obj.NAME as OBJECT_ID',
'      ,LISTAGG(g.NAME',
'              ,'', '') WITHIN group(order by g.SORT_ORDER) as GRANTS',
'  from (',
'        --',
'        select t0.ROLE_ID_OR_DN',
'               ,level - 1 as INHERIT_LEVEL',
'          from ROLE_ROLE_ROLES_POOL t0',
'          left join ROLE_ROLE_REL t1',
'            on t0.ROLE_ID_OR_DN = coalesce(t1.ROLE_ID',
'                                          ,t1.ROLE_DN)',
'        -- "Start with" and "connect by" UPWARDS not DOWNWARDS!',
'         start with t0.ROLE_ID_OR_DN = :P320_ROLE_ID',
'        connect by nocycle prior t0.ROLE_ID_OR_DN = coalesce(t1.MEMBER_ROLE_ID',
'                                                    ,t1.MEMBER_ROLE_DN)',
'        --',
'        ) r0',
'  left join(',
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
' group by r0.INHERIT_LEVEL',
'         ,r0.ROLE_ID_OR_DN',
'         ,obj.ID',
'         ,obj.NAME',
'         ,obj.SORT_ORDER',
' order by r0.INHERIT_LEVEL desc',
'         ,obj.SORT_ORDER',
''))
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
 p_id=>wwv_flow_api.id(46403101401805384)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>2413101808919125
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46403362261805386)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Edit'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46403225952805385)
,p_db_column_name=>'INHERIT_LEVEL'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Inherit level'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46404154266805394)
,p_db_column_name=>'INHERITED_FROM_ROLE'
,p_display_order=>30
,p_column_identifier=>'J'
,p_column_label=>'Inherited from Role'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(60720725395184309)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46403877452805391)
,p_db_column_name=>'OBJECT_ID'
,p_display_order=>40
,p_column_identifier=>'G'
,p_column_label=>'Object'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(63181764527769610)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46404035149805393)
,p_db_column_name=>'GRANTS'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'Grants'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(46429241482869594)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'24393'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'EDIT_LINK:INHERITED_FROM_ROLE:OBJECT_ID:GRANTS:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(67973540731773583)
,p_plug_name=>'Role Members'
,p_parent_plug_id=>wwv_flow_api.id(46371148419208971)
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
 p_id=>wwv_flow_api.id(63226613121631167)
,p_plug_name=>'Roles'
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
 p_id=>wwv_flow_api.id(44029911298852866)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(44029609259852863)
,p_button_name=>'SAVE_COMPUTER_MEMBERS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P320_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44216395697090832)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(44216032161090829)
,p_button_name=>'SAVE_MEMBER_OF_ROLES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P320_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46336119291364812)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(67973540731773583)
,p_button_name=>'SAVE_ROLE_MEMBERS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P320_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63227440295631170)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(63223985788631143)
,p_button_name=>'SAVE_USER_MEMBERS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63117617286203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P320_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44477392584497341)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(63226613121631167)
,p_button_name=>'EDIT_ROLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_image_alt=>'Edit'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:322:&SESSION.::&DEBUG.:322:P322_ID:&P320_ROLE_ID.'
,p_button_condition=>'P320_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-pencil-square-o'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44478229320517988)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(63226613121631167)
,p_button_name=>'NEW_ROLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:322:&SESSION.::&DEBUG.:361,322::'
,p_icon_css_classes=>'fa-plus-circle'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44477959214515819)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(63226613121631167)
,p_button_name=>'DELETE_ROLE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE_ROLE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P320_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(53073817285351812)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(63731146272812992)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(63634334757518235)
,p_button_name=>'GRANTS_ON_OTHER_OBJECT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(63117683867203050)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Permission'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:321:&SESSION.::&DEBUG.:321:P321_ROLE_ID:\&P320_ROLE_ID.\'
,p_button_condition=>'P320_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-plus-circle'
,p_grid_new_grid=>false
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(63255785167239740)
,p_branch_name=>'Go To Page 320'
,p_branch_action=>'f?p=&APP_ID.:320:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44029765264852864)
,p_name=>'P320_COMPUTER_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44029609259852863)
,p_source=>'Assigned Computers inherits permissions from above Role'
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
 p_id=>wwv_flow_api.id(44029887002852865)
,p_name=>'P320_COMPUTER_MEMBERS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(44029609259852863)
,p_use_cache_before_default=>'NO'
,p_prompt=>' Available <-> Assigned'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id_or_dn ',
'from computer_pool u',
'join computer_role_rel r on u.id_or_dn = coalesce(r.computer_id,r.computer_dn)',
'WHERE coalesce(r.ROLE_ID, r.role_DN) = :P320_ROLE_ID',
'order by u.source desc, u.name'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_named_lov=>'COMPUTERS_ALL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case t.SOURCE',
'         when 1 then',
'          ''AD''',
'         else',
'          ''UM''',
'       end || '': '' || t.NAME as d',
'      ,t.ID_OR_DN as r',
'  from COMPUTER_POOL t',
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
 p_id=>wwv_flow_api.id(44216174707090830)
,p_name=>'P320_MEMBER_OF_ROLES_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44216032161090829)
,p_prompt=>'Member of roles title'
,p_source=>'Above Role inherits permissions from assigned Roles'
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
 p_id=>wwv_flow_api.id(44216241009090831)
,p_name=>'P320_MEMBER_OF_ROLES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(44216032161090829)
,p_use_cache_before_default=>'NO'
,p_prompt=>'  Available <-> Assigned'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.ROLE_ID_OR_DN',
'  from ROLE_ROLE_REL_POOL t0',
' inner join ROLE_ROLE_ROLES_POOL t1',
'    on (t0.MEMBER_ROLE_ID_OR_DN = t1.ROLE_ID_OR_DN)',
' where t0.MEMBER_ROLE_ID_OR_DN = :P320_ROLE_ID',
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
'  from ROLE_POOL t',
'-- Showable ROLE not equal to selected ROLE',
' where t.ID_OR_DN != nvl(:P320_ROLE_ID',
'                        ,''$NV$'')',
'      -- Not selected ROLE already a parent of showable ROLE, in order to avoid circular reference',
'   and not exists (select null',
'          from ROLE_ROLE_REL_POOL e0',
'         where e0.ROLE_ID_OR_DN = nvl(:P320_ROLE_ID',
'                                     ,''$NV$'')',
'           and e0.MEMBER_ROLE_ID_OR_DN = t.ID_OR_DN',
'        --',
'        )',
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
 p_id=>wwv_flow_api.id(46336518827364814)
,p_name=>'P320_ROLE_MEMBERS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(67973540731773583)
,p_use_cache_before_default=>'NO'
,p_prompt=>'  Available <-> Assigned'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.MEMBER_ROLE_ID_OR_DN',
'  from ROLE_ROLE_REL_POOL t0',
' inner join ROLE_ROLE_ROLES_POOL t1',
'    on (t0.MEMBER_ROLE_ID_OR_DN = t1.ROLE_ID_OR_DN)',
' where t0.ROLE_ID_OR_DN = :P320_ROLE_ID',
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
'  from ROLE_POOL t',
'-- Showable ROLE not equal to selected ROLE',
' where t.ID_OR_DN != nvl(:P320_ROLE_ID',
'                        ,''$NV$'')',
'      -- Not selected ROLE already a member of showable ROLE, in order to avoid circular reference',
'   and not exists (select null',
'          from ROLE_ROLE_REL_POOL e0',
'         where e0.MEMBER_ROLE_ID_OR_DN = nvl(:P320_ROLE_ID',
'                                            ,''$NV$'')',
'           and e0.ROLE_ID_OR_DN = t.ID_OR_DN',
'        --',
'        )',
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
 p_id=>wwv_flow_api.id(46371354029208973)
,p_name=>'P320_PERMISSION_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(63634334757518235)
,p_prompt=>'Permission title'
,p_source=>'Permissions (Object/Grants assignments) of above Role'
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
 p_id=>wwv_flow_api.id(46372219411208982)
,p_name=>'P320_USER_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(63223985788631143)
,p_source=>'Assigned Users inherits permissions from above Role'
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
 p_id=>wwv_flow_api.id(46372368631208983)
,p_name=>'P320_ROLE_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(67973540731773583)
,p_source=>'Assigned Roles inherits permissions from above Role'
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
 p_id=>wwv_flow_api.id(63224452492631151)
,p_name=>'P320_USER_MEMBERS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(63223985788631143)
,p_use_cache_before_default=>'NO'
,p_prompt=>' Available <-> Assigned'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id_or_dn ',
'from user_pool u',
'join user_role_rel r on u.id_or_dn = coalesce(r.user_id,r.user_dn)',
'WHERE coalesce(r.ROLE_ID, r.role_DN) = :P320_ROLE_ID',
'order by u.source desc, u.username'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_SHUTTLE'
,p_named_lov=>'USERS_ALL'
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
 p_id=>wwv_flow_api.id(63228187982631172)
,p_name=>'P320_ROLE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(63226613121631167)
,p_prompt=>'Role for edit'
,p_display_as=>'NATIVE_SELECT_LIST'
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
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select Role --'
,p_cHeight=>1
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(63117153261203045)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Select the Role that you want to edit.'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63230780177631184)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Role'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM roles WHERE ID = :P320_ROLE_ID;',
':P320_ROLE_ID := NULL;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44477959214515819)
,p_process_success_message=>'Role has been deleted.'
,p_security_scheme=>wwv_flow_api.id(53073817285351812)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(63263081777757030)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Users'
,p_process_sql_clob=>'pkg_man_users.save_role_users( i_role_id => :P320_ROLE_ID, i_users_list => :P320_USER_MEMBERS );'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(63227440295631170)
,p_process_success_message=>'User members has been saved.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44030007164852867)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Computers'
,p_process_sql_clob=>'PKG_MAN_USERS.Save_Role_Computers(i_role_id => :P320_ROLE_ID, i_computer_list => :P320_COMPUTER_MEMBERS);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44029911298852866)
,p_process_success_message=>'Computer members has been saved.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46337547298375998)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Roles'
,p_process_sql_clob=>'pkg_man_users.Save_Role_Roles( i_role_id => :P320_ROLE_ID, i_roles_list => :P320_ROLE_MEMBERS );'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46336119291364812)
,p_process_success_message=>'Role members has been saved.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44216414906090833)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save_Member_Of_Roles'
,p_process_sql_clob=>'pkg_man_users.Save_Role_Member_Of_Roles(i_role_id => :P320_ROLE_ID, i_roles_list => :P320_MEMBER_OF_ROLES );'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(44216395697090832)
,p_process_success_message=>'Member of Roles has been saved.'
,p_security_scheme=>wwv_flow_api.id(59023663688969588)
);
end;
/
