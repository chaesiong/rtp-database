prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(102053859644998443)
,p_lov_name=>'BORDERPOSTS'
,p_reference_id=>2436741361461240
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(94733890845776210)
,p_lov_name=>'CHECKBOX_WITHOUT_LABEL'
,p_lov_query=>'.'||wwv_flow_api.id(94733890845776210)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(94734248542776227)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'&nbsp;'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(105802060614402669)
,p_lov_name=>'LOV_COUNTRIES_PK'
,p_lov_query=>'select display_value, return_value FROM lov_countries'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(94914838581928264)
,p_lov_name=>'LOV_ICAO_DOC_CODES'
,p_reference_id=>54692810758529045
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(94893851284740530)
,p_lov_name=>'LOV_ISOCOUNTRIES'
,p_reference_id=>284848114046019411
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CTRYNAME || '' ('' || CTRYCD || '')'' d, CTRYCD r',
'from ICAOCOUNTRIES',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(97570487622222412)
,p_lov_name=>'LOV_NATIONALITY_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT key_value || '' '' || NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' ORDER BY display_order ASC;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(101538355731717731)
,p_lov_name=>'LOV_PROFESSIONS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_professions'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(96003094006731349)
,p_lov_name=>'LOV_PROVINCE'
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_province'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(96002884839728489)
,p_lov_name=>'LOV_REGION'
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_region'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(97578084052270782)
,p_lov_name=>'LOV_RELATIONS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM lov_relations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(101792590988202541)
,p_lov_name=>'LOV_SALUTATIONS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_salutations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(94894967782740540)
,p_lov_name=>'LOV_SEX_NUM'
,p_reference_id=>5487835792664836
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(97560591737151402)
,p_lov_name=>'LOV_SEX_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.human_sexes$lc',
' WHERE num_value IS NOT NULL',
' ORDER BY display_order;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(105803987459405159)
,p_lov_name=>'LOV_TRANS_VEHICLES_PK'
,p_reference_id=>18607871784254557
,p_lov_query=>'SELECT display_value, return_value FROM lov_trans_vehicles'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(96010176680784306)
,p_lov_name=>'TRAVEL_TYPES'
,p_reference_id=>47576995254482497
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.BC_PERSON_TYPES$LC ',
'WHERE IS_ACTIVE = ''Y''',
'AND (TRANS_MODE is null OR TRANS_MODE = (SELECT KEY_VALUE from DL_COMMON.TRANS_MODES where NUM_VALUE = :AI_TRANSPORT_MODE))',
'ORDER BY DISPLAY_ORDER;'))
);
end;
/
