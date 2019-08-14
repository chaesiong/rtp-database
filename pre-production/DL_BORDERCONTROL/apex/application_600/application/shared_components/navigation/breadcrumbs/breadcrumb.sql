prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(68527439369628097)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(68527865141628112)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(93959199530565707)
,p_parent_id=>wwv_flow_api.id(68527865141628112)
,p_short_name=>'Traveler In/Out Statistics'
,p_link=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.:::'
,p_page_id=>1000
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(94245966177149288)
,p_parent_id=>wwv_flow_api.id(68527865141628112)
,p_short_name=>'Blacklist Matched Detection Statistics'
,p_link=>'f?p=&APP_ID.:1100:&SESSION.'
,p_page_id=>1100
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(94801353972516206)
,p_parent_id=>wwv_flow_api.id(68527865141628112)
,p_short_name=>'Nationality Statistics'
,p_link=>'f?p=&APP_ID.:1200:&SESSION.::&DEBUG.:::'
,p_page_id=>1200
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(95866268441701497)
,p_parent_id=>wwv_flow_api.id(68527865141628112)
,p_short_name=>'Nationality Blacklist Statistics'
,p_link=>'f?p=&APP_ID.:1300:&SESSION.'
,p_page_id=>1300
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(95979958396969772)
,p_parent_id=>wwv_flow_api.id(68527865141628112)
,p_short_name=>'Pivot Analysis'
,p_link=>'f?p=&APP_ID.:1400:&SESSION.::&DEBUG.:::'
,p_page_id=>1400
);
end;
/
