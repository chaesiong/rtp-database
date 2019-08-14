prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(59002282495172992)
,p_lov_name=>'APEX_APP_ALIASES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select application_name || '' ('' || application_id ||'')'' d, alias r ',
'from apex_applications where workspace_id=v(''WORKSPACE_ID'');'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(54864591257392233)
,p_lov_name=>'APEX_APP_PAGES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select page_name ||'' (''||page_id||'', ''||application_name||'') '' as d, page_id from apex_050000.apex_application_pages ',
'where workspace = (select workspace from apex_workspaces where workspace_id =v(''WORKSPACE_ID''))',
'order by application_id, page_id;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(58973739818204612)
,p_lov_name=>'BOOLEAN - ON/OFF'
,p_lov_query=>'.'||wwv_flow_api.id(58973739818204612)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(58974111899204614)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'On'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(58974421400204614)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Off'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63181780146773720)
,p_lov_name=>'BOOLEAN - YES/NO'
,p_lov_query=>'.'||wwv_flow_api.id(63181780146773720)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(58972538846197795)
,p_lov_disp_sequence=>12
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(58972867122198355)
,p_lov_disp_sequence=>22
,p_lov_disp_value=>'No '
,p_lov_return_value=>'0'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(44142526963286619)
,p_lov_name=>'COMPUTERS_ALL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(44142856976286619)
,p_lov_name=>'COMPUTERS_UM'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(t.NAME',
'          ,t.NAME$DLC) as d',
'      ,t.ID as r',
'  from COMPUTERS$LC t',
' order by t.SORT_ORDER',
'         ,1',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63181511342767875)
,p_lov_name=>'GRANTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.NAME',
'          ,t.NAME$DLC) as d',
'      ,t.ID as r',
'  from GRANTS$LC t',
' order by t.SORT_ORDER',
'         ,t.NAME',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63181764527769610)
,p_lov_name=>'OBJECTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.NAME',
'          ,t.NAME$DLC) as d',
'      ,t.ID as r',
'  from OBJECTS$LC t',
' order by t.SORT_ORDER',
'         ,t.NAME',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(64204969124702397)
,p_lov_name=>'OPERATIONS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.DISPLAY_VALUE',
'          ,t.DISPLAY_VALUE$DLC) as d',
'      ,t.KEY_VALUE as r',
'  from LOOKUPS$LC t',
' where t.KEY_CATEGORY = ''user_operation''',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(44141962925286607)
,p_lov_name=>'ORG_UNITS_ALL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case t.SOURCE',
'         when 1 then',
'          ''AD''',
'         else',
'          ''UM''',
'       end || '': '' || t.NAME as d',
'      ,t.ID_OR_DN as r',
'  from ORG_UNIT_POOL t',
' order by t.SOURCE desc',
'         ,t.SORT_ORDER',
'         ,t.NAME',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(44142181361286619)
,p_lov_name=>'ORG_UNITS_UM'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.NAME',
'          ,t.NAME$DLC) as d',
'      ,t.ID as r',
'  from ORG_UNITS$LC t',
' order by t.SORT_ORDER',
'         ,t.NAME',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63182938323781891)
,p_lov_name=>'PARAMETERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.DISPLAY_NAME',
'          ,t.DISPLAY_NAME$DLC) as d',
'      ,t.ID as r',
'  from PARAMETER_SETTINGS$LC t',
' order by t.SORT_ORDER',
'         ,t.DISPLAY_NAME',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(60720725395184309)
,p_lov_name=>'ROLES_ALL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63181266771765527)
,p_lov_name=>'ROLES_UM'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.NAME',
'          ,t.NAME$DLC) as d',
'      ,t.ID as r',
'  from ROLES$LC t',
' order by t.SORT_ORDER',
'         ,t.NAME',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(64204814375699790)
,p_lov_name=>'USER STATES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.DISPLAY_VALUE',
'          ,t.DISPLAY_VALUE$DLC) as d',
'      ,t.KEY_VALUE as r',
'  from LOOKUPS$LC t',
' where t.KEY_CATEGORY = ''user_state''',
' order by 1'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(60718145520641597)
,p_lov_name=>'USERS_ALL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(63236419129108075)
,p_lov_name=>'USERS_UM'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.USERNAME',
'       --',
'        || case',
'          when (t.LAST_NAME is not null and t.FIRST_NAME is not null) then',
'           '' ('' || t.LAST_NAME || '', '' || t.FIRST_NAME || '')''',
'          when (t.LAST_NAME is not null) then',
'           '' ('' || t.LAST_NAME || '')''',
'          when (t.FIRST_NAME is not null) then',
'           '' ('' || t.FIRST_NAME || '')''',
'          else',
'           ''''',
'        end as d',
'      ,t.ID as r',
'  from USERS t',
' order by 1',
''))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(60653055274747837)
,p_lov_name=>'USER_SOURCE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(t.DISPLAY_VALUE',
'          ,t.DISPLAY_VALUE$DLC) as d',
'      ,t.KEY_VALUE as r',
'  from LOOKUPS$LC t',
' where t.KEY_CATEGORY = ''user_source''',
' order by 1'))
);
end;
/
