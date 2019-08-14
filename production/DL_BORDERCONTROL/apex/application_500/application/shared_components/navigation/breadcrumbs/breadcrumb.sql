prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(563848260072049643)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(80598368230939656)
,p_short_name=>'ISDS Logs'
,p_link=>'f?p=&APP_ID.:5516:&SESSION.'
,p_page_id=>5516
);
end;
/
