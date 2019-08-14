prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(117827265200804405)
,p_build_option_name=>'DEBUG'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'With this flag you can set if something is only used for debugging in the development environment.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(119079796599241258)
,p_build_option_name=>'NO_INCLUDE'
,p_build_option_status=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
);
end;
/
