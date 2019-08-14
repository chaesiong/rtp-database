prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(58825154997541203)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(58648799324435381)
,p_parent_id=>wwv_flow_api.id(58825595333541219)
,p_short_name=>'Search'
,p_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20::'
,p_page_id=>20
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(58825595333541219)
,p_parent_id=>0
,p_short_name=>'Landing Page'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
end;
/
