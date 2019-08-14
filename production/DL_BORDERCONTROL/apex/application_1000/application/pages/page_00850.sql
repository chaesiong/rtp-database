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
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190704021953'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69634862933802650837)
,p_plug_name=>'Audits'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
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
'    select ''Y''                  as current_',
'          ,''Grants''             as table_',
'          ,''Grants (name, description, sort order, tag)'' as table_rows',
'          ,id                   as id',
'          ,name                 as value01',
'          ,description          as value02',
'          ,to_char(sort_order)  as value03',
'          ,tag                  as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.grants',
'    where rownum < 100',
'    union all',
'    -- grants history',
'    select ''''                   as current_',
'          ,''Grants''             as table_',
'          ,''Grants (name, description, sort order, tag)'' as table_rows',
'          ,id                   as id',
'          ,name                 as value01',
'          ,description          as value02',
'          ,to_char(sort_order)  as value03',
'          ,tag                  as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.grants$his',
'    where rownum < 100',
'    union all',
'    --! lookups',
'    -- objects',
'    select ''Y''                  as current_',
'          ,''Objects''            as table_',
'          ,''Objects (name, description, sort order, tag)'' as table_rows',
'          ,id                   as id',
'          ,name                 as value01',
'          ,description          as value02',
'          ,to_char(sort_order)  as value03',
'          ,tag                  as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.objects',
'    where rownum < 100',
'    union all',
'    -- objects history',
'    select ''''                   as current_',
'          ,''Objects''            as table_',
'          ,''Objects (name, description, sort order, tag)'' as table_rows',
'          ,id                   as id',
'          ,name                 as value01',
'          ,description          as value02',
'          ,to_char(sort_order)  as value03',
'          ,tag                  as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.objects$his',
'    where rownum < 100',
'    union all',
'    -- object grant rel',
'    select ''Y''                  as current_',
'          ,''Object grant rel''   as table_',
'          ,''Object grant rel (object id, grant id)'' as table_rows',
'          ,id                   as id',
'          ,object_id            as value01',
'          ,grant_id             as value02',
'          ,null                 as value03',
'          ,null                 as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.object_grant_rel',
'    where rownum < 100',
'    union all',
'    -- object grant rel',
'    select ''''                   as current_',
'          ,''Object grant rel''   as table_',
'          ,''Object grant rel (object id, grant id)'' as table_rows',
'          ,id                   as id',
'          ,object_id            as value01',
'          ,grant_id             as value02',
'          ,null                 as value03',
'          ,null                 as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.object_grant_rel$his',
'    where rownum < 100',
'    union all',
'    -- object page rel',
'    select ''Y''                  as current_',
'          ,''Object page rel''    as table_',
'          ,''Object page rel (object id, app name,page id)'' as table_rows',
'          ,id                   as id',
'          ,object_id            as value01',
'          ,app_name             as value02',
'          ,to_char(page_id)     as value03',
'          ,null                 as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.object_page_rel',
'    where rownum < 100',
'    union all',
'    -- object page rel',
'    select ''''                   as current_',
'          ,''Object page rel''    as table_',
'          ,''Object page rel (object id, app name,page id)'' as table_rows',
'          ,id                   as id',
'          ,object_id            as value01',
'          ,app_name             as value02',
'          ,to_char(page_id)     as value03',
'          ,null                 as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.object_page_rel$his',
'    where rownum < 100',
'    union all',
'    --! org_unit_org_unit_rel',
'    --! org_units',
'    -- parameter_settings',
'    select ''Y''                              as current_',
'          ,''Parameter Settings''             as table_',
'          ,''Parameter Settings (name, display name, description, modifiable in apex, sort order, value type, default str, default num, default is on, value str, value num, value is on, active str, active num, active_is on, active value)'' as table_row'
||'s',
'          ,id                               as id',
'          ,name                             as value01',
'          ,display_name                     as value02',
'          ,description                      as value03',
'          ,to_char(is_modifiable_in_apex)   as value04',
'          ,to_char(sort_order)              as value05',
'          ,to_char(value_type)              as value06',
'          ,default_str                      as value07',
'          ,to_char(default_num)             as value08',
'          ,to_char(default_is_on)           as value09',
'          ,value_str                        as value10',
'          ,to_char(value_num)               as value11',
'          ,to_char(value_is_on)             as value12',
'          ,active_str                       as value13',
'          ,to_char(active_num)              as value14',
'          ,to_char(active_is_on)            as value15',
'          ,active_value                     as value16',
'          ,dml_at                           as changed_date',
'          ,dml_by                           as changed_user',
'    from dl_user_management.parameter_settings',
'    where rownum < 100',
'    union all',
'    -- parameter_settings history',
'    select ''''                               as current_',
'          ,''Parameter Settings''             as table_',
'          ,''Parameter Settings (name, display name, description, modifiable in apex, sort order, value type, default str, default num, default is on, value str, value num, value is on, active str, active num, active_is on, active value)'' as table_row'
||'s',
'          ,id                               as id',
'          ,name                             as value01',
'          ,display_name                     as value02',
'          ,description                      as value03',
'          ,to_char(is_modifiable_in_apex)   as value04',
'          ,to_char(sort_order)              as value05',
'          ,to_char(value_type)              as value06',
'          ,default_str                      as value07',
'          ,to_char(default_num)             as value08',
'          ,to_char(default_is_on)           as value09',
'          ,value_str                        as value10',
'          ,to_char(value_num)               as value11',
'          ,to_char(value_is_on)             as value12',
'          ,active_str                       as value13',
'          ,to_char(active_num)              as value14',
'          ,to_char(active_is_on)            as value15',
'          ,active_value                     as value16',
'          ,dml_at                           as changed_date',
'          ,dml_by                           as changed_user',
'    from dl_user_management.parameter_settings$his',
'    where rownum < 100',
'    union all',
'    -- roles',
'    select ''Y''                  as current_',
'          ,''Roles''              as table_',
'          ,''Roles (name, description, sort order, is active, tag)'' as table_rows',
'          ,id                   as id',
'          ,name                 as value01',
'          ,description          as value02',
'          ,to_char(sort_order)  as value03',
'          ,to_char(is_active)   as value04',
'          ,tag                  as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.roles',
'    where rownum < 100',
'    union all',
'    -- roles history',
'    select ''''                   as current_',
'          ,''Roles''              as table_',
'          ,''Roles (name, description, sort order, is active, tag)'' as table_rows',
'          ,id                   as id',
'          ,name                 as value01',
'          ,description          as value02',
'          ,to_char(sort_order)  as value03',
'          ,to_char(is_active)   as value04',
'          ,tag                  as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.roles$his',
'    where rownum < 100',
'    union all',
'    -- role object grant rel',
'    select ''Y''                  as current_',
'          ,''Role Object page rel''    as table_',
'          ,''Role Object page rel (role id, role dn, object grant rel id)'' as table_rows',
'          ,id                   as id',
'          ,role_id              as value01',
'          ,role_dn              as value02',
'          ,object_grant_rel_id  as value03',
'          ,null                 as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.role_object_grant_rel',
'    where rownum < 100',
'    union all',
'    -- role object grant rel histroy',
'    select ''''                   as current_',
'          ,''Role Object page rel''    as table_',
'          ,''Role Object page rel (role id, role dn, object grant rel id)'' as table_rows',
'          ,id                   as id',
'          ,role_id              as value01',
'          ,role_dn              as value02',
'          ,object_grant_rel_id  as value03',
'          ,null                 as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.role_object_grant_rel$his',
'    where rownum < 100',
'    union all',
'    -- role role rel',
'    select ''Y''                  as current_',
'          ,''Role role rel''      as table_',
'          ,''Role role rel (role id, role dn, member role id, member role dn)'' as table_rows',
'          ,id                   as id',
'          ,role_id              as value01',
'          ,role_dn              as value02',
'          ,member_role_id       as value03',
'          ,member_role_dn       as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.role_role_rel',
'    where rownum < 100',
'    union all',
'    -- role role rel history',
'    select ''''                   as current_',
'          ,''Role role rel''      as table_',
'          ,''Role role rel (role id, role dn, member role id, member role dn)'' as table_rows',
'          ,id                   as id',
'          ,role_id              as value01',
'          ,role_dn              as value02',
'          ,member_role_id       as value03',
'          ,member_role_dn       as value04',
'          ,null                 as value05',
'          ,null                 as value06',
'          ,null                 as value07',
'          ,null                 as value08',
'          ,null                 as value09',
'          ,null                 as value10',
'          ,null                 as value11',
'          ,null                 as value12',
'          ,null                 as value13',
'          ,null                 as value14',
'          ,null                 as value15',
'          ,null                 as value16',
'          ,dml_at               as changed_date',
'          ,dml_by               as changed_user',
'    from dl_user_management.role_role_rel$his',
'    where rownum < 100',
'    union all',
'    --! user_org_unit_rel',
'    -- users',
'    select ''Y''                                          as current_',
'          ,''Users''                                      as table_',
'          ,''Users (username, first name, last name, mail address, phone number, state, pw hash, pw salt, pw iteration pw must be changed)'' as table_rows',
'          ,id                                           as id',
'          ,username                                     as value01',
'          ,first_name                                   as value02',
'          ,last_name                                    as value03',
'          ,mail_address                                 as value04',
'          ,phone_number                                 as value05',
'          ,to_char(state)                               as value06',
'          ,pw_hash                                      as value07',
'          ,pw_salt                                      as value08',
'          ,to_char(pw_iteration_count)                  as value09',
'          ,null                                         as value10',
'          ,to_char(pw_expiration_date, ''DD.MM.YYYY'')    as value11',
'          ,pw_must_be_changed                           as value12',
'          ,null                                         as value13',
'          ,null                                         as value14',
'          ,null                                         as value15',
'          ,null                                         as value16',
'          ,dml_at                                       as changed_date',
'          ,dml_by                                       as changed_user',
'    from dl_user_management.users',
'    where rownum < 100',
'    union all',
'    -- users history',
'    select ''''                                           as current_',
'          ,''Users''                                      as table_',
'          ,''Users (username, first name, last name, mail address, phone number, state, pw hash, pw salt, pw iteration pw must be changed)'' as table_rows',
'          ,id                                           as id',
'          ,username                                     as value01',
'          ,first_name                                   as value02',
'          ,last_name                                    as value03',
'          ,mail_address                                 as value04',
'          ,phone_number                                 as value05',
'          ,to_char(state)                               as value06',
'          ,pw_hash                                      as value07',
'          ,pw_salt                                      as value08',
'          ,to_char(pw_iteration_count)                  as value09',
'          ,null                                         as value10',
'          ,to_char(pw_expiration_date, ''DD.MM.YYYY'')    as value11',
'          ,pw_must_be_changed                           as value12',
'          ,null                                         as value13',
'          ,null                                         as value14',
'          ,null                                         as value15',
'          ,null                                         as value16',
'          ,dml_at                                       as changed_date',
'          ,dml_by                                       as changed_user',
'    from dl_user_management.users$his',
'    where rownum < 100',
'    union all',
'    -- user role rel',
'    select ''Y''              as current_',
'          ,''User role rel''  as table_',
'          ,''User role rel (user id, user dn, role id, role dn)'' as table_rows',
'          ,id               as id',
'          ,user_id          as value01',
'          ,user_dn          as value02',
'          ,role_id          as value03',
'          ,role_dn          as value04',
'          ,null             as value05',
'          ,null             as value06',
'          ,null             as value07',
'          ,null             as value08',
'          ,null             as value09',
'          ,null             as value10',
'          ,null             as value11',
'          ,null             as value12',
'          ,null             as value13',
'          ,null             as value14',
'          ,null             as value15',
'          ,null             as value16',
'          ,dml_at           as changed_date',
'          ,dml_by           as changed_user',
'    from dl_user_management.user_role_rel',
'    where rownum < 100',
'    union all',
'    -- user role rel history',
'    select ''''               as current_',
'          ,''User role rel''  as table_',
'          ,''User role rel (user id, user dn, role id, role dn)'' as table_rows',
'          ,id               as id',
'          ,user_id          as value01',
'          ,user_dn          as value02',
'          ,role_id          as value03',
'          ,role_dn          as value04',
'          ,null             as value05',
'          ,null             as value06',
'          ,null             as value07',
'          ,null             as value08',
'          ,null             as value09',
'          ,null             as value10',
'          ,null             as value11',
'          ,null             as value12',
'          ,null             as value13',
'          ,null             as value14',
'          ,null             as value15',
'          ,null             as value16',
'          ,dml_at           as changed_date',
'          ,dml_by           as changed_user',
'    from dl_user_management.user_role_rel$his',
'    where rownum < 100',
'    )',
'order by changed_date desc;'))
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
 p_id=>wwv_flow_api.id(69634863054412650838)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'E1MSTAHL'
,p_internal_uid=>69634863054412650838
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809494039284534074)
,p_db_column_name=>'CURRENT_'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Current '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809494408120534075)
,p_db_column_name=>'TABLE_'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Table '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809494869499534076)
,p_db_column_name=>'TABLE_ROWS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Table rows'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809495216210534078)
,p_db_column_name=>'ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809495624490534079)
,p_db_column_name=>'VALUE01'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Value01'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809496053502534079)
,p_db_column_name=>'VALUE02'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Value02'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809496490809534084)
,p_db_column_name=>'VALUE03'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Value03'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809496892254534084)
,p_db_column_name=>'VALUE04'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Value04'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809497285740534084)
,p_db_column_name=>'VALUE05'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Value05'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809497690119534085)
,p_db_column_name=>'VALUE06'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Value06'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809498008207534085)
,p_db_column_name=>'VALUE07'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Value07'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809498491212534085)
,p_db_column_name=>'VALUE08'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Value08'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809498825516534086)
,p_db_column_name=>'VALUE09'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Value09'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809499273626534087)
,p_db_column_name=>'VALUE10'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Value10'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809499640337534087)
,p_db_column_name=>'VALUE11'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Value11'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809500045237534088)
,p_db_column_name=>'VALUE12'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Value12'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809500415842534089)
,p_db_column_name=>'VALUE13'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Value13'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809500809761534089)
,p_db_column_name=>'VALUE14'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Value14'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809501272149534090)
,p_db_column_name=>'VALUE15'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Value15'
,p_column_type=>'STRING'
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809501650503534090)
,p_db_column_name=>'VALUE16'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Value16'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809502027337534092)
,p_db_column_name=>'CHANGED_DATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Changed date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809502458297534092)
,p_db_column_name=>'CHANGED_USER'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Changed user'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645585781396137859)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'348095076'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:VALUE04:VALUE05:VALUE06:VALUE07:VALUE08:VALUE09:VALUE10:VALUE11:VALUE12:VALUE13:VALUE14:VALUE15:VALUE16:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645818295480589602)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Grants'
,p_report_seq=>10
,p_report_alias=>'348095080'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:VALUE04:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809508819946534106)
,p_report_id=>wwv_flow_api.id(69645818295480589602)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809508490391534106)
,p_report_id=>wwv_flow_api.id(69645818295480589602)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Grants'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Grants''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645819801962591356)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Object Grant Relation'
,p_report_seq=>10
,p_report_alias=>'348095092'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809510028662534108)
,p_report_id=>wwv_flow_api.id(69645819801962591356)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809509648910534108)
,p_report_id=>wwv_flow_api.id(69645819801962591356)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Object grant rel'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Object grant rel''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645830057919597172)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Object Page Relation'
,p_report_seq=>10
,p_report_alias=>'348095104'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809511238676534110)
,p_report_id=>wwv_flow_api.id(69645830057919597172)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809510813685534110)
,p_report_id=>wwv_flow_api.id(69645830057919597172)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Object page rel'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Object page rel''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645831530964599137)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Objects'
,p_report_seq=>10
,p_report_alias=>'348095116'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:VALUE04:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809512428294534111)
,p_report_id=>wwv_flow_api.id(69645831530964599137)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809512023551534111)
,p_report_id=>wwv_flow_api.id(69645831530964599137)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Objects'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Objects''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645833067992601133)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Parameter Settings'
,p_report_seq=>10
,p_report_alias=>'348095128'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:VALUE04:VALUE05:VALUE06:VALUE07:VALUE08:VALUE09:VALUE10:VALUE11:VALUE12:VALUE13:VALUE14:VALUE15:VALUE16:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809513611788534113)
,p_report_id=>wwv_flow_api.id(69645833067992601133)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809513249328534112)
,p_report_id=>wwv_flow_api.id(69645833067992601133)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Parameter Settings'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Parameter Settings''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645853771342604233)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Role Object Grant Relation'
,p_report_seq=>10
,p_report_alias=>'348095240'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809524891869534116)
,p_report_id=>wwv_flow_api.id(69645853771342604233)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809524428978534115)
,p_report_id=>wwv_flow_api.id(69645853771342604233)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Role Object page rel'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Role Object page rel''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645932013060606655)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Role Role Relation'
,p_report_seq=>10
,p_report_alias=>'348095028'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:VALUE04:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809503692697534097)
,p_report_id=>wwv_flow_api.id(69645932013060606655)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809503279710534097)
,p_report_id=>wwv_flow_api.id(69645932013060606655)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Role role rel'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Role role rel''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645933490027608749)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Roles'
,p_report_seq=>10
,p_report_alias=>'348095040'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:VALUE04:VALUE05:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809504863151534103)
,p_report_id=>wwv_flow_api.id(69645933490027608749)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809504460433534102)
,p_report_id=>wwv_flow_api.id(69645933490027608749)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Roles'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Roles''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645935023999612722)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'User Role Relation'
,p_report_seq=>10
,p_report_alias=>'348095052'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:VALUE04:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809506021440534104)
,p_report_id=>wwv_flow_api.id(69645935023999612722)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809505630582534103)
,p_report_id=>wwv_flow_api.id(69645935023999612722)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'User role rel'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''User role rel''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69645944995488615108)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Users'
,p_report_seq=>10
,p_report_alias=>'348095064'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'TABLE_:TABLE_ROWS:ID:VALUE01:VALUE02:VALUE03:VALUE04:VALUE05:VALUE06:VALUE07:VALUE08:VALUE09:VALUE10:VALUE11:VALUE12:CHANGED_DATE:CHANGED_USER:'
,p_break_on=>'TABLE_ROWS:0:0:0:0:0'
,p_break_enabled_on=>'TABLE_ROWS:0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809507216876534105)
,p_report_id=>wwv_flow_api.id(69645944995488615108)
,p_name=>'show active'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CURRENT_'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>' (case when ("CURRENT_" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#EBEBEB'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34809506870293534104)
,p_report_id=>wwv_flow_api.id(69645944995488615108)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TABLE_'
,p_operator=>'='
,p_expr=>'Users'
,p_condition_sql=>'"TABLE_" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Users''  '
,p_enabled=>'Y'
);
end;
/
