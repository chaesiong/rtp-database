prompt --application/shared_components/logic/webservices/rest2
begin
wwv_flow_api.create_web_service(
 p_id=>wwv_flow_api.id(572102997438127146)
,p_name=>'Rest2'
,p_url=>'http://10.120.14.13:8080/HelloWorldService/rest/DoWorkSimple/&WS_INPUT1.'
,p_action=>'REST'
,p_static_parm_04=>'GET'
,p_static_parm_05=>'json'
,p_static_parm_10=>'body'
);
wwv_flow_api.create_ws_operations(
 p_id=>wwv_flow_api.id(572103249867127148)
,p_ws_id=>wwv_flow_api.id(572102997438127146)
,p_name=>'doREST'
);
wwv_flow_api.create_ws_parameters(
 p_id=>wwv_flow_api.id(572103811979127149)
,p_ws_opers_id=>wwv_flow_api.id(572103249867127148)
,p_name=>'json'
,p_input_or_output=>'O'
,p_parm_type=>'json'
,p_type_is_xsd=>'N'
);
end;
/
