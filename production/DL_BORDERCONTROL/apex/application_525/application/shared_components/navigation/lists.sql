prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(102672287019105992)
,p_name=>'ACCEPT_DENY_BLACKLIST'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(102672466008105993)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Ignore Blacklist and Accept Action'
,p_list_item_icon=>'fa-check'
,p_list_text_04=>'t-card--success'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(102675039940146204)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Deny Access'
,p_list_item_icon=>'fa-times'
,p_list_text_04=>'t-card--danger'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(106378351723307360)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(106430441030307697)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(153467121903957969)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Version &AI_APP_VERSION.'
,p_list_item_link_target=>'#'
,p_list_text_02=>'navbarVersionInfo'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(153673218955130631)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>'&nbsp;'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_EQUALS_CONDITION'
,p_list_item_disp_condition=>'1'
,p_list_text_02=>'navbarHardwareIcons'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(156033237809594745)
,p_list_item_display_sequence=>1019
,p_list_item_link_text=>'Restart Hardware'
,p_list_item_link_target=>'javascript:DermalogPluginMgr.restartHardware();'
,p_parent_list_item_id=>wwv_flow_api.id(153673218955130631)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(109411173138669758)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Search'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database-search'
,p_list_text_01=>'F5'
,p_list_text_02=>'searchButton'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(102717545502903371)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Reset'
,p_list_item_link_target=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:RESTART:&DEBUG.:&APP_PAGE_ID.:::'
,p_list_item_icon=>'fa-trash'
,p_list_text_01=>'F7'
,p_list_text_02=>'resetButton'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(100565954351878623)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Save Data'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-save-as'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'1,5'
,p_list_text_01=>'F12'
,p_list_text_02=>'saveButton'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(133010321866976219)
,p_list_item_display_sequence=>1009
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_icon=>'fa-cogs'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(221423236697501265)
,p_list_item_display_sequence=>8
,p_list_item_link_text=>'Address Report'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:30:::'
,p_list_item_icon=>'fa-address-card'
,p_parent_list_item_id=>wwv_flow_api.id(133010321866976219)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(100365975666757412)
,p_list_item_display_sequence=>9
,p_list_item_link_text=>'Transfer Visum'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-exchange'
,p_parent_list_item_id=>wwv_flow_api.id(133010321866976219)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(143731925938498642)
,p_list_item_display_sequence=>800
,p_list_item_link_text=>'History'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-history'
,p_parent_list_item_id=>wwv_flow_api.id(133010321866976219)
,p_required_patch=>wwv_flow_api.id(152485533729814766)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(142591083576856780)
,p_list_item_display_sequence=>900
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(133010321866976219)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(106430643543307745)
,p_list_item_display_sequence=>999
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(133010321866976219)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(107515321240585224)
,p_name=>'PASS_READER_MANUAL_INPUT'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(107515533107585231)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Fingerprint'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(107515885748585244)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Manuelle Eingabe'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
