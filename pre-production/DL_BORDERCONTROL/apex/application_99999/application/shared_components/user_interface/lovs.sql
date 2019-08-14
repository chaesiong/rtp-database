prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(93733958879032524)
,p_lov_name=>'LOV_COUNTRIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.COUNTRIES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(93734160491032530)
,p_lov_name=>'LOV_GENDERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(93734484064032531)
,p_lov_name=>'LOV_GENDERS_VC'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, KEY_VALUE r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(93734759489032531)
,p_lov_name=>'LOV_NATIONALITY_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' ORDER BY display_order ASC;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(93735405173032532)
,p_lov_name=>'LOV_RELATIONS'
,p_lov_query=>'SELECT display_value, return_value FROM lov_relations'
);
end;
/
