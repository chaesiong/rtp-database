prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(70561874015603333)
,p_lov_name=>'Copy of LOV_YESNO'
,p_reference_id=>377797844705870808
,p_lov_query=>'.'||wwv_flow_api.id(70561874015603333)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(70563754478603391)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(70564153606603392)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(122216898843122814)
,p_lov_name=>'DOCTYPE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select description1 as d,',
'       ID as r',
'  from LOOKUPDOCTYPE',
' order by ID'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(108911760151088581)
,p_lov_name=>'LOV_APPLICATION_STATUS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM lov_statuses ',
' WHERE owner$tag = ''APEX_REENTRY''',
'   AND tag$tag = ''REENTRY_TM8STATUS'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(66170953491759904)
,p_lov_name=>'LOV_COUNTRIES'
,p_reference_id=>6310540608441170
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
 p_id=>wwv_flow_api.id(122220006649122821)
,p_lov_name=>'LOV_DOCUEMENT_CLASS_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(73786182414624005)
,p_lov_name=>'LOV_GENDERS'
,p_reference_id=>5487835792664836
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(70201244485049420)
,p_lov_name=>'LOV_GENDERS_VC'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, KEY_VALUE r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(74318324838016222)
,p_lov_name=>'LOV_NATIONALITY_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' ORDER BY display_order, NVL(display_value, display_value$dlc) ASC;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(70936589460792446)
,p_lov_name=>'LOV_PROFESSIONS'
,p_reference_id=>15074879159362505
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_professions'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(68814955739674139)
,p_lov_name=>'LOV_PROVINCE'
,p_reference_id=>9539617434376123
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_province'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(68815316453674141)
,p_lov_name=>'LOV_REGION'
,p_reference_id=>9539408267373263
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_region'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(74311067513008639)
,p_lov_name=>'LOV_RELATIONS'
,p_lov_query=>'SELECT display_value, return_value FROM lov_relations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(70974319265918662)
,p_lov_name=>'LOV_SALUTATIONS'
,p_reference_id=>15329114415847315
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_salutations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(68794487530533054)
,p_lov_name=>'LOV_TRANSPORT_TYPES'
,p_reference_id=>386163074230476314
,p_lov_query=>'SELECT display_value, return_value FROM lov_trans_vehicles;'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(74901391312667771)
,p_lov_name=>'LOV_TRAVEL_MODES'
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
