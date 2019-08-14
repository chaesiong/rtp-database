prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(45966744858928290)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(45967185194928306)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(90656224781495452)
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:210:&SESSION.'
,p_page_id=>210
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(90664061897506064)
,p_parent_id=>wwv_flow_api.id(90656224781495452)
,p_short_name=>'&P200_PAGE_TITLE.'
,p_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:200,RIR::'
,p_page_id=>200
);
end;
/
