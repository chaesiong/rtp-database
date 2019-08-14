prompt --application/shared_components/logic/webservices/dashboard_getdatatest
begin
wwv_flow_api.create_web_service(
 p_id=>wwv_flow_api.id(882480146353914687)
,p_name=>'DashBoard_GetDataTest'
,p_url=>'http://10.120.30.41:8080/ords/ws_cambodia_prod/dash/GetDataTest'
,p_action=>'REST'
,p_static_parm_04=>'GET'
,p_static_parm_05=>'json'
,p_static_parm_07=>'\n'
,p_static_parm_08=>','
,p_static_parm_10=>'nvp'
);
wwv_flow_api.create_ws_operations(
 p_id=>wwv_flow_api.id(882480331288914691)
,p_ws_id=>wwv_flow_api.id(882480146353914687)
,p_name=>'doREST'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(882480578308914692)
,p_ws_opers_id=>wwv_flow_api.id(882480331288914691)
,p_name=>'json'
,p_input_or_output=>'O'
,p_parm_type=>'json'
,p_type_is_xsd=>'N'
);
end;
/
