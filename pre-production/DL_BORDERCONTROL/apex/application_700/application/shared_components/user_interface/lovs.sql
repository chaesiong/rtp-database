prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(133842678540507443)
,p_lov_name=>'BORDER_TYPES'
,p_lov_query=>'SELECT NVL(display_value, display_value$dlc) AS display_value, key_value FROM dl_common.border_types$lc WHERE is_active = ''Y'' ORDER BY display_order, display_value'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(133592883512699760)
,p_lov_name=>'ICAO_DC_LIST'
,p_lov_query=>'SELECT NVL(display_value, display_value$dlc) AS display_value, key_value FROM dl_common.icao_dc_lists$lc WHERE is_active = ''Y'' ORDER BY display_order, display_value'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(111560550977146091)
,p_lov_name=>'ICAO_DOC_CODES'
,p_lov_query=>'SELECT NVL(display_value, display_value$dlc) AS display_value, key_value FROM dl_common.icao_doc_codes$lc ORDER BY display_order, display_value'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(177257589835159431)
,p_lov_name=>'LOCALE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    display_value,',
'    key_value',
'FROM',
'    dl_common.locales',
'    where is_active = ''Y''',
'    and display_value != ''en/US''',
'    order by display_order'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(86978157518966304)
,p_lov_name=>'LOV_ICRS_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(86978157518966304)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(86989047571966329)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Send'
,p_lov_return_value=>'S'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(86993229531966337)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Aborted'
,p_lov_return_value=>'A'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(86994044624966338)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Timeout'
,p_lov_return_value=>'T'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(86994887445966339)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Finished'
,p_lov_return_value=>'F'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(111806233397601885)
,p_lov_name=>'LOV_NATIONALITY_PK'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.icao_doc_codes$lc',
' WHERE is_active = ''Y''',
' and rownum = 1',
' ORDER BY lower(NVL(display_value, display_value$dlc)) ASC',
';'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(99019997384065542)
,p_lov_name=>'OWNERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) AS display_value',
'      ,key_value AS return_value',
'  FROM dl_common.owners$lc',
' ORDER BY display_order ASC, display_value ASC'))
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(133592727500693838)
,p_lov_name=>'TRANS_MODE'
,p_lov_query=>'SELECT NVL(display_value, display_value$dlc) AS display_value, key_value FROM dl_common.trans_modes$lc WHERE is_active = ''Y'' ORDER BY display_order, display_value'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(111637345161936455)
,p_lov_name=>'VISA_TYPES'
,p_lov_query=>'SELECT NVL(display_value, display_value$dlc) AS display_value, key_value FROM dl_common.visa_types$lc WHERE is_active = ''Y'' ORDER BY display_order, display_value'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(165699145145791088)
,p_lov_name=>'YES_NO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, key_value r',
'FROM dl_common.yes_nos$lc',
'WHERE is_active = ''Y''',
'ORDER BY display_order;'))
);
end;
/
