prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(134938498335124453)
,p_lov_name=>'BLACKLIST'
,p_lov_query=>'.'||wwv_flow_api.id(134938498335124453)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(134938770567124454)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Blacklist'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(134917249229071216)
,p_lov_name=>'LOV_BORDERCONTROL_BLACKLISTACTION'
,p_reference_id=>863983225366522932
,p_lov_query=>'.'||wwv_flow_api.id(134917249229071216)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(134919869035071230)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Inserted'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(134920278778071231)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Updated'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(134920692130071231)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Deleted'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(134808524408874064)
,p_lov_name=>'LOV_BORDERCONTROL_ENTRYEXITDEPORTEEOFFLOAD'
,p_reference_id=>829446696852123373
,p_lov_query=>'.'||wwv_flow_api.id(134808524408874064)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(134811759350874102)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arrival'
,p_lov_return_value=>'0'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(134812185911874103)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Departure'
,p_lov_return_value=>'1'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(134812576853874103)
,p_lov_disp_sequence=>12
,p_lov_disp_value=>'Deport'
,p_lov_return_value=>'2'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(134812936757874104)
,p_lov_disp_sequence=>22
,p_lov_disp_value=>'Offload'
,p_lov_return_value=>'3'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(134922711467071232)
,p_lov_name=>'LOV_BORDERCONTROL_NATIONALITY_PK'
,p_reference_id=>116973090697480777
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' --ORDER BY display_order ASC',
' ORDER BY lower(NVL(display_value, display_value$dlc)) ASC',
';'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91568631669476111)
,p_lov_name=>'LOV_DIM_AGENTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_agent(id) as d, id as r',
'from dl_bordercontrol_datamart.dim_agents',
'where ID not in (''-100'', ''-200'')',
'order by name'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91578725160543827)
,p_lov_name=>'LOV_DIM_AGES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id as d, id as r',
' from dl_bordercontrol_datamart.dim_ages',
' where ID not in (''-100'', ''-200'')',
' order by id'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91578892053565463)
,p_lov_name=>'LOV_DIM_BORDERPOSTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_borderpost(id) as d, id as r',
' from dl_bordercontrol_datamart.dim_borderposts',
' where ID not in (''-100'', ''-200'')',
' order by name;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91587688500614122)
,p_lov_name=>'LOV_DIM_DOCUMENT_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d, id as r',
' from dl_bordercontrol_datamart.dim_document_types',
' where ID not in (''-100'', ''-200'')',
' order by id;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91588097194629216)
,p_lov_name=>'LOV_DIM_GENDERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_gender(id) as d, id as r',
'from dl_bordercontrol_datamart.dim_genders',
'where ID not in (''-100'', ''-200'')',
'order by id;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91603107238659619)
,p_lov_name=>'LOV_DIM_MOVEMENT_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_movement_type(id) as d, id as r',
'from dl_bordercontrol_datamart.dim_movement_types',
'where ID not in (''-100'', ''-200'')',
'order by id;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91610538233673962)
,p_lov_name=>'LOV_DIM_NATIONALITIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_nationality(id) as d, id as r',
'from dl_bordercontrol_datamart.dim_nationalities',
'where ID not in (''-100'', ''-200'')',
'order by id;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91610762367682977)
,p_lov_name=>'LOV_DIM_OFFICERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select username as d, id as r',
'from dl_bordercontrol_datamart.dim_officers',
'where ID not in (''-100'', ''-200'')',
'order by username;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91627935610868609)
,p_lov_name=>'LOV_DIM_TIME_MONTHS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct month_name as d, month_numeric as r ',
'from dl_bordercontrol_datamart.dim_times',
'where ID not in (''-100'', ''-200'')',
'order by 2;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91611599817750801)
,p_lov_name=>'LOV_DIM_TIME_YEARS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct year_numeric as d, year_numeric as r from dl_bordercontrol_datamart.dim_times',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91643566491895119)
,p_lov_name=>'LOV_DIM_TRANSPORT_MODES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_transport_mode(id) as d, id as r ',
'from dl_bordercontrol_datamart.dim_transport_modes',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(91643735951910237)
,p_lov_name=>'LOV_DIM_VISA_TYPES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dl_bordercontrol_datamart.pkg_reporting.translate_visa_type(id) as d, id as r ',
'from dl_bordercontrol_datamart.dim_visa_types',
'where ID not in (''-100'', ''-200'')',
'order by 1;'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(93512398037321997)
,p_lov_name=>'LOV_INTERVALS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    name as d,',
'    id as r',
'FROM',
'    dl_bordercontrol_datamart.intervals',
'order by sort'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(94865859889815888)
,p_lov_name=>'LOV_INTERVALS_ANNUAL_MONTHLY_WEEKLY'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    name as d,',
'    id as r',
'FROM',
'    dl_bordercontrol_datamart.intervals',
'WHERE id IN',
'(''annually'',',
'''monthly'',',
'''weekly'')',
'  ',
'order by sort'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(95980392690997513)
,p_lov_name=>'P1400_Report Row Per Page'
,p_lov_query=>'.'||wwv_flow_api.id(95980392690997513)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95980692306997520)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'10'
,p_lov_return_value=>'10'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95981096959997524)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'15'
,p_lov_return_value=>'15'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95981507357997527)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'20'
,p_lov_return_value=>'20'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95981864890997527)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'30'
,p_lov_return_value=>'30'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95982265149997528)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'50'
,p_lov_return_value=>'50'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95982655617997532)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'100'
,p_lov_return_value=>'100'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95983036103997533)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'200'
,p_lov_return_value=>'200'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95983468084997534)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'500'
,p_lov_return_value=>'500'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95983877741997535)
,p_lov_disp_sequence=>90
,p_lov_disp_value=>'1000'
,p_lov_return_value=>'1000'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(95984281859997536)
,p_lov_disp_sequence=>100
,p_lov_disp_value=>'5000'
,p_lov_return_value=>'5000'
);
end;
/
