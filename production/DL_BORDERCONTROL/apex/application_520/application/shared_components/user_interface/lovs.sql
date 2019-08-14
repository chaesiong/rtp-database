prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(60676739107903430)
,p_lov_name=>'CHECKBOX_WITHOUT_LABEL'
,p_lov_query=>'.'||wwv_flow_api.id(60676739107903430)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(60677096804903447)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'&nbsp;'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58283734947025846)
,p_lov_name=>'LOV_BORDERPOSTS_PK'
,p_reference_id=>15590383072643217
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58348792737862871)
,p_lov_name=>'LOV_FAF_GENERATIONS_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(58348792737862871)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(58349135294862872)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'AUTO'
,p_lov_return_value=>'AUTO'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(58349476758862873)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'MANUAL'
,p_lov_return_value=>'MANUAL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58347795149860780)
,p_lov_name=>'LOV_FAF_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(58347795149860780)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(58348043091860782)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'ACTIVE'
,p_lov_return_value=>'ACTIVE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(58348505613860793)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'CANCEL'
,p_lov_return_value=>'CANCEL'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(60857686844055484)
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
 p_id=>wwv_flow_api.id(60836699546867750)
,p_lov_name=>'LOV_ISOCOUNTRIES'
,p_reference_id=>284848114046019411
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CTRYNAME || '' ('' || CTRYCD || '')'' d, CTRYCD r',
'from ICAOCOUNTRIES',
'order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63513335884349632)
,p_lov_name=>'LOV_NATIONALITY_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT key_value || '' '' || NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' ORDER BY display_order ASC;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(57724123487949309)
,p_lov_name=>'LOV_PAYMENT_RATES_FEE'
,p_lov_query=>'select display_value, return_value FROM lov_payment_rate WHERE payment_type != ''F'''
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(71074422475450206)
,p_lov_name=>'LOV_PAYMENT_RATES_FEE_AND_FINE'
,p_lov_query=>'select display_value, return_value FROM lov_payment_rate'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58640980481421498)
,p_lov_name=>'LOV_PAYMENT_RATES_FINE'
,p_lov_query=>'select display_value, return_value FROM lov_payment_rate WHERE payment_type = ''F'''
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58524776637161264)
,p_lov_name=>'LOV_PERMIT_TYPE'
,p_lov_query=>'select display_value, return_value FROM lov_permit_type'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(61945942268858569)
,p_lov_name=>'LOV_PROVINCE'
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_province'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(61945733101855709)
,p_lov_name=>'LOV_REGION'
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_region'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63520932314398002)
,p_lov_name=>'LOV_RELATIONS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM lov_relations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58197670917213135)
,p_lov_name=>'LOV_SALUTATIONS_PK'
,p_reference_id=>15329114415847315
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_salutations'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(60837816044867760)
,p_lov_name=>'LOV_SEX_NUM'
,p_reference_id=>5487835792664836
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63503439999278622)
,p_lov_name=>'LOV_SEX_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.human_sexes$lc',
' WHERE num_value IS NOT NULL',
' ORDER BY display_order;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(70013591496384098)
,p_lov_name=>'LOV_STATUSES_LOV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM lov_statuses ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''APEX_FEE_AND_FINE_STATUS_LOV'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58285525699049090)
,p_lov_name=>'LOV_TERMINALS_PK'
,p_lov_query=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_terminals'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58161611208125407)
,p_lov_name=>'LOV_TRANS_VEHICLES_PK'
,p_lov_query=>'SELECT display_value, return_value FROM lov_trans_vehicles'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58194358562179562)
,p_lov_name=>'LOV_VISA_TYPES'
,p_reference_id=>81547365604690461
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.VISA_TYPES$LC',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(56502463846145754)
,p_lov_name=>'LOV_WORKING_SYSTEMS_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value',
'  FROM lov_owners ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag   = ''LOV_WORKING_SYSTEM'''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(61953024942911526)
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
