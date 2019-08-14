prompt --application/shared_components/logic/webservices/helloworldmanual
begin
wwv_flow_api.create_web_service(
 p_id=>wwv_flow_api.id(572095953662853624)
,p_name=>'HelloWorldManual'
,p_url=>'http://chh0513.dermalog.hh:8080/HelloWorldService'
,p_action=>'dermalog.hh/IHelloWorldService/DoWorkSimple'
,p_soap_envelope=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:der="dermalog.hh">',
'   <soapenv:Header/>',
'   <soapenv:Body>',
'      <der:DoWorkSimple/>',
'   </soapenv:Body>',
'</soapenv:Envelope>',
''))
);
end;
/
