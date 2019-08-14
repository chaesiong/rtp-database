prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(132972909267872364)
,p_name=>'AI_APP_VERSION'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(133012910312999371)
,p_name=>'AI_BLACKLIST_SERVICE_URL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(109938948749349752)
,p_name=>'AI_BORDERPOST_ID'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(109939141034350335)
,p_name=>'AI_BORDERPOST_NAME'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(171902487125789540)
,p_name=>'AI_CLIENT_IP'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(104701618314724505)
,p_name=>'AI_DATE_RANGE_FUTURE_LG'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(104701500510724505)
,p_name=>'AI_DATE_RANGE_FUTURE_SM'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(104701446544724505)
,p_name=>'AI_DATE_RANGE_PAST_LG'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(104701363038724504)
,p_name=>'AI_DATE_RANGE_PAST_SM'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(109939543087350751)
,p_name=>'AI_TERMINAL_ID'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(181070287347929793)
,p_name=>'CAMUNDA_URL'
,p_protection_level=>'I'
);
end;
/