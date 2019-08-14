prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(56078887981976724)
,p_lov_name=>'LOV_ACTION_CODES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.action_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(56073614609955056)
,p_lov_name=>'LOV_ARRESTED_STATUSES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.arrested_statuses$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(56072750011947750)
,p_lov_name=>'LOV_ARRESTED_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.arrested_types$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(56759636720773508)
,p_lov_name=>'LOV_CASES_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.case_types$LC',
'  where NVL( is_active, ''Y'' ) = ''Y''',
' order by DISPLAY_ORDER ASC',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(42825884000509329)
,p_lov_name=>'LOV_CONTINENTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.CONTINENTS$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(22756939205418470)
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
 p_id=>wwv_flow_api.id(41134706449373886)
,p_lov_name=>'LOV_DOCUMENT_CLASSES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.BC_DOC_CLASS$LC',
'    where IS_ACTIVE=''Y''',
'    order by display_value, DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(51506408157158832)
,p_lov_name=>'LOV_HUMAN_SEXES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.HUMAN_SEXES$LC',
'WHERE ICAO is not null',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(31709518182934807)
,p_lov_name=>'LOV_ICAO_COUNTRIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(51530077992189508)
,p_lov_name=>'LOV_ICAO_SEXES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE) display_value,',
'   icao return_value',
'FROM',
'    DL_COMMON.HUMAN_SEXES$LC',
'WHERE icao IS NOT NULL',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;',
'',
'    '))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(53793563572874776)
,p_lov_name=>'LOV_PROFESSIONS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISPLAY_VALUE,',
'       KEY_VALUE',
'  from dl_common.professions$LC',
' order by DISPLAY_ORDER ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(94699125546854631)
,p_lov_name=>'LOV_PROVINCES'
,p_lov_query=>'SELECT display_value, return_value FROM lov_adm_class_province'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(56078007994971966)
,p_lov_name=>'LOV_REASON_CODES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) ,',
'       KEY_VALUE',
'  from dl_common.reason_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(259046606945724309)
,p_lov_name=>'LOV_REASON_VALUES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   KEY_VALUE ',
'   , NVL(display_value,DISPLAY_VALUE$DLC) ',
'  from dl_common.reason_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(53795306658925418)
,p_lov_name=>'LOV_SALUTATIONS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_value,',
'       KEY_VALUE',
'  from dl_common.salutations$LC',
' order by DISPLAY_ORDER ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(56072435226919162)
,p_lov_name=>'LOV_SECRET_LEVELS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'       KEY_VALUE',
'  from dl_common.secret_levels$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
);
end;
/
