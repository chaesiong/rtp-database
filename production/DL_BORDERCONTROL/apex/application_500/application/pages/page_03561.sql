prompt --application/pages/page_03561
begin
wwv_flow_api.create_page(
 p_id=>3561
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Test Tree'
,p_page_mode=>'NORMAL'
,p_step_title=>'Test Tree'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'CHRISTINA'
,p_last_upd_yyyymmddhh24miss=>'20181023172826'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(183111014532742603)
,p_plug_name=>'Region > Province > District > Subdistrict'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case WHEN connect_by_isleaf = 1 THEN 0 WHEN level = 1 THEN 1 ELSE -1 END as status,',
'       level,',
'       display_value as title,',
'       icon as icon,',
'       key_value as value,',
'       display_value as tooltip,',
'       link as link',
'from (select display_value, key_value, null pnr, APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:3511:&APP_SESSION.::&DEBUG.::P3511_KEY_VALUE:''||key_value, p_checksum_type => ''SESSION'') link, ''fa fa-industry'' icon  ',
'from dl_bordercontrol.adm_class_region r',
'union all',
'select display_value, key_value, ADM_CLASS_REGION pnr, APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:3521:&APP_SESSION.::&DEBUG.::P3521_KEY_VALUE:''||key_value ,p_checksum_type => ''SESSION'') link, ''fa fa-hospital-o'' icon  ',
'from dl_bordercontrol.adm_class_province p',
'union all',
'select display_value, key_value, ADM_CLASS_PROVINCE pnr, APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:3531:&APP_SESSION.::&DEBUG.::P3531_KEY_VALUE:''||key_value ,p_checksum_type => ''SESSION'') link, ''fa fa-building-o'' icon  ',
'from dl_bordercontrol.adm_class_district d',
'union all',
'select display_value, key_value, ADM_CLASS_DISTRICT pnr, APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:3541:&APP_SESSION.::&DEBUG.::P3541_KEY_VALUE:''||key_value, p_checksum_type => ''SESSION'') link, ''fa fa-home'' icon  ',
'from dl_bordercontrol.adm_class_subdistrict s)',
'start with key_value in (select key_value from dl_bordercontrol.adm_class_region r )--''690659B76B8BF68FE053BE26780A006E''',
'connect by prior key_value = pnr; '))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_04=>'N'
,p_attribute_07=>'APEX_TREE'
,p_attribute_08=>'a-Icon'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184246418617011527)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(183111014532742603)
,p_button_name=>'Create_Region'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Region'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_button_redirect_url=>'f?p=&APP_ID.:3511:&SESSION.::&DEBUG.:RP,3511::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184246886611013644)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(183111014532742603)
,p_button_name=>'Create_Province'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Province'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_button_redirect_url=>'f?p=&APP_ID.:3521:&SESSION.::&DEBUG.:RP,3521::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184247141858015739)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(183111014532742603)
,p_button_name=>'Create_District'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create District'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_button_redirect_url=>'f?p=&APP_ID.:3531:&SESSION.::&DEBUG.:RP,3531::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(184247593220017361)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(183111014532742603)
,p_button_name=>'Create_Subdistrict'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Subdistrict'
,p_button_position=>'TEMPLATE_DEFAULT'
,p_button_redirect_url=>'f?p=&APP_ID.:3541:&SESSION.::&DEBUG.:RP,3541::'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
end;
/
