prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(55138297768512750)
,p_lov_name=>'BORDERPOSTS'
,p_reference_id=>2436741361461240
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(47818328969290517)
,p_lov_name=>'CHECKBOX_WITHOUT_LABEL'
,p_lov_query=>'.'||wwv_flow_api.id(47818328969290517)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(47818686666290534)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'&nbsp;'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58886498737916976)
,p_lov_name=>'LOV_COUNTRIES_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_value, return_value ',
'  FROM lov_countries',
' ORDER BY UPPER(display_value) ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(47999276705442571)
,p_lov_name=>'LOV_ICAO_DOC_CODES'
,p_reference_id=>54692810758529045
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by UPPER(d) ASC',
'    ;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(47978289408254837)
,p_lov_name=>'LOV_ISOCOUNTRIES'
,p_reference_id=>284848114046019411
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CTRYNAME || '' ('' || CTRYCD || '')'' d, CTRYCD r',
'from ICAOCOUNTRIES',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(50654925745736719)
,p_lov_name=>'LOV_NATIONALITY_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT key_value || '' '' || NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' ORDER BY display_order ASC;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(54622793855232038)
,p_lov_name=>'LOV_PROFESSIONS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_professions'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(49087532130245656)
,p_lov_name=>'LOV_PROVINCE'
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_province'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(64215881910523056)
,p_lov_name=>'LOV_RECEIPT_NUMBERS'
,p_lov_query=>'select display_value, return_value FROM lov_receipt_numbers'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(49087322963242796)
,p_lov_name=>'LOV_REGION'
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_region'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(50662522175785089)
,p_lov_name=>'LOV_RELATIONS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM lov_relations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(54877029111716848)
,p_lov_name=>'LOV_SALUTATIONS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_salutations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(47979405906254847)
,p_lov_name=>'LOV_SEX_NUM'
,p_reference_id=>5487835792664836
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(50645029860665709)
,p_lov_name=>'LOV_SEX_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.human_sexes$lc',
' WHERE num_value IS NOT NULL',
' ORDER BY display_order;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(97395756380698108)
,p_lov_name=>'LOV_STATUSES_PAYMENT_STATUS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM lov_statuses ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''VOA_PAYMENT_STATUS'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(68483956976301170)
,p_lov_name=>'LOV_STATUSES_STATUS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM lov_statuses ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''VOA_STATUS'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91631074225703167)
,p_lov_name=>'LOV_TERMINALS_PK'
,p_lov_query=>'select display_value, return_value FROM lov_terminals'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91635859798849878)
,p_lov_name=>'LOV_TERMINALS_PK_IPADDRESS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT t.display_value_ip, return_value',
'  FROM dl_bordercontrol.lov_terminals t'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58888425582919466)
,p_lov_name=>'LOV_TRANS_VEHICLES_PK'
,p_reference_id=>18607871784254557
,p_lov_query=>'SELECT display_value, return_value FROM lov_trans_vehicles'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(62229176104936549)
,p_lov_name=>'P1_LOV_STATUSES_STATUS_LOV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM dl_bordercontrol.lov_statuses ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''VOA_STATUS_LOV''',
' UNION',
'SELECT display_value',
'      ,return_value',
'  FROM dl_bordercontrol.lov_statuses',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''VOA_STATUS''',
'   AND return_value = :P20_APPROVED_STATUS'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(49094614804298613)
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
