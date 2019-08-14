prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(71510839681283228)
,p_name=>'MasterDataList'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'--level As lvl, ',
'       1 as lvl,',
'       DISPLAY_VALUE, ',
'       target, ',
'       null as is_current_list_entry, ',
'       image as imagevalue',
'from dl_common.apex_menu$lc',
'where level=2',
'--where USER_MANAGEMENT.PKG_AUTHORIZATION.APEX_MENU_AUTORIZATION(APP_ALIAS, PAGE_ID) = 1',
'start with parent_key_value is null and display_value = ''Master Data'' ',
'connect by prior key_value = parent_key_value',
'order siblings by key_value;'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(77446677413899055)
,p_name=>'BMBS Navigation Menu'
,p_list_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_list_query=>'return dl_user_management.pkg_authorization.apex_menu_sql(:APP_USER);'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(118551447601061334)
,p_name=>'BmBS Navigation Menu Static'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118551653774061335)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Passport Check'
,p_list_item_link_target=>'f?p=BMBS:17:&APP_SESSION.'
,p_list_item_icon=>'fa-user-check'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118551998796061336)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Blacklist Management'
,p_list_item_link_target=>'f?p=BMBS:5000:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118554456626061343)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Blacklist History'
,p_list_item_link_target=>'f?p=BMBS:5005:&APP_SESSION.'
,p_list_item_icon=>'fa-history'
,p_parent_list_item_id=>wwv_flow_api.id(118551998796061336)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Reporting'
,p_list_item_link_target=>'f?p=BMBS:5999:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118554855486061345)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Travel History'
,p_list_item_link_target=>'f?p=BMBS:8001:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118555220300061346)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Travel History (Children)'
,p_list_item_link_target=>'f?p=BMBS:8011:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118552396448061337)
,p_list_item_display_sequence=>95
,p_list_item_link_text=>'List of Name matching Blacklist'
,p_list_item_link_target=>'f?p=BMBS:5010:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118575977375061376)
,p_list_item_display_sequence=>96
,p_list_item_link_text=>'Traveler In/Out Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1000:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118576412028061376)
,p_list_item_display_sequence=>97
,p_list_item_link_text=>'Blacklist Matched Detection Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1100:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118576855363061377)
,p_list_item_display_sequence=>98
,p_list_item_link_text=>'Nationality Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1200:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118577195868061377)
,p_list_item_display_sequence=>99
,p_list_item_link_text=>'Nationality Blacklist Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1300:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118555638108061347)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Nationality/Visa'
,p_list_item_link_target=>'f?p=BMBS:5512:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118555983089061347)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Arrival/Departure'
,p_list_item_link_target=>'f?p=BMBS:5513:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118556418449061348)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Travel History (PDF)'
,p_list_item_link_target=>'f?p=BMBS:5514:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118556861333061348)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Person Report (PDF)'
,p_list_item_link_target=>'f?p=BMBS:5515:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86750296738924084)
,p_list_item_display_sequence=>770
,p_list_item_link_text=>'ICRS Logs'
,p_list_item_link_target=>'f?p=&APP_ID.:5000:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database-search'
,p_parent_list_item_id=>wwv_flow_api.id(118552837377061337)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118553269681061338)
,p_list_item_display_sequence=>45
,p_list_item_link_text=>'Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1:&APP_SESSION.'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118577593381061378)
,p_list_item_display_sequence=>620
,p_list_item_link_text=>'Pivot Analysis'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1400:&APP_SESSION.'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(118553269681061338)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Master Data'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(141004673118073669)
,p_list_item_display_sequence=>135
,p_list_item_link_text=>'System'
,p_list_item_link_target=>'f?p=&APP_ID.:900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118557185631061349)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Yes No'
,p_list_item_link_target=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(141004673118073669)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1000,1010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118557590574061349)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Boolean'
,p_list_item_link_target=>'f?p=&APP_ID.:1100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(141004673118073669)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1100,1110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118563220269061358)
,p_list_item_display_sequence=>290
,p_list_item_link_text=>'Messages'
,p_list_item_link_target=>'f?p=&APP_ID.:2300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(141004673118073669)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2300,2310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118573577163061373)
,p_list_item_display_sequence=>520
,p_list_item_link_text=>'Action Codes'
,p_list_item_link_target=>'f?p=&APP_ID.:3300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(141004673118073669)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3300,3310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118558004770061350)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Gender / Sex'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1200,1210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118558378529061351)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'Fingers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1300,1310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118558819261061351)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Status Fingers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1350:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1350,1360'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118559208618061352)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'Visa Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1400,1410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118559606756061352)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Document Classes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1500,1510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118559992417061353)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'Port Movements'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1600,1610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118560414921061353)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Transport Modes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1700,1710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118560846167061354)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'Transport GRP States'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1800,1810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118561217396061354)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'Border Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1900,1910'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118561613539061355)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'Border Types'
,p_list_item_link_target=>'f?p=&APP_ID.:1900:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118562016619061355)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>'Countries'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2000,2010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118562419131061356)
,p_list_item_display_sequence=>270
,p_list_item_link_text=>'Carriers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2100,2110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118562858874061356)
,p_list_item_display_sequence=>280
,p_list_item_link_text=>'Ports'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2200,2210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118563601766061359)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'Incident Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2400,2410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118564020495061359)
,p_list_item_display_sequence=>310
,p_list_item_link_text=>'On Board Types'
,p_list_item_link_target=>'f?p=&APP_ID.:2500:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118564420858061360)
,p_list_item_display_sequence=>320
,p_list_item_link_text=>'Transport Vehicles'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2600,2610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118564854551061360)
,p_list_item_display_sequence=>330
,p_list_item_link_text=>'ICAO Document Codes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2700,2710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118571641399061370)
,p_list_item_display_sequence=>470
,p_list_item_link_text=>'Doc Lists'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2800,2810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118571998062061370)
,p_list_item_display_sequence=>480
,p_list_item_link_text=>'Secret Levels'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2900,2910'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118572400076061372)
,p_list_item_display_sequence=>490
,p_list_item_link_text=>'Arrested Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3000,3010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118572834927061372)
,p_list_item_display_sequence=>500
,p_list_item_link_text=>'Arrested Statuses'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3100,3110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118573184119061373)
,p_list_item_display_sequence=>510
,p_list_item_link_text=>'Reason Codes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3200,3210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118574055214061374)
,p_list_item_display_sequence=>530
,p_list_item_link_text=>'Card Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3400,3410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118574382777061374)
,p_list_item_display_sequence=>540
,p_list_item_link_text=>'(Blacklist) Relationships'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3500,3510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118574860642061375)
,p_list_item_display_sequence=>550
,p_list_item_link_text=>'Case Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3600,3610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118575270585061375)
,p_list_item_display_sequence=>560
,p_list_item_link_text=>'ICAO Document Codes (free VISA)'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3700,3710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118575643337061375)
,p_list_item_display_sequence=>570
,p_list_item_link_text=>'Sub Nationalities'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3800,3810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(140987880404025810)
,p_list_item_display_sequence=>630
,p_list_item_link_text=>'UAT'
,p_list_item_link_target=>'f?p=BMBS:3005:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(140988503111048123)
,p_list_item_display_sequence=>640
,p_list_item_link_text=>'Extendstay'
,p_list_item_link_target=>'f?p=BMBS:3001:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(140987880404025810)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(140996141943052951)
,p_list_item_display_sequence=>650
,p_list_item_link_text=>'Residentinfo'
,p_list_item_link_target=>'f?p=BMBS:3101:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(140987880404025810)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(140996443964058011)
,p_list_item_display_sequence=>660
,p_list_item_link_text=>'Visarun Rules'
,p_list_item_link_target=>'f?p=BMBS:3201:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(140987880404025810)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(140996716587061717)
,p_list_item_display_sequence=>670
,p_list_item_link_text=>'Void Passport'
,p_list_item_link_target=>'f?p=BMBS:3301:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(140987880404025810)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(140997234414064579)
,p_list_item_display_sequence=>680
,p_list_item_link_text=>'Duplicate Passport'
,p_list_item_link_target=>'f?p=BMBS:3401:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(140987880404025810)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(147746368203492337)
,p_list_item_display_sequence=>690
,p_list_item_link_text=>'ICAO Document List Items'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4100:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4100,4110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(147950836353848690)
,p_list_item_display_sequence=>700
,p_list_item_link_text=>'Permit Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4200:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4200,4210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(148618415510411498)
,p_list_item_display_sequence=>710
,p_list_item_link_text=>'Professions'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4300:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4300,4310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(148882765869550753)
,p_list_item_display_sequence=>720
,p_list_item_link_text=>'Relations'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4400:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4400,4410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(148975124464753531)
,p_list_item_display_sequence=>730
,p_list_item_link_text=>'Salutations'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4500:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4500,4510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(149129402855451380)
,p_list_item_display_sequence=>740
,p_list_item_link_text=>'Status'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4600:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4600,4610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(152466641892544950)
,p_list_item_display_sequence=>750
,p_list_item_link_text=>'Region > Province > District > Subdistrict'
,p_list_item_link_target=>'f?p=BMBS:3561:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3561, 3541, 3531, 3521, 3511'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(79973643009624826)
,p_list_item_display_sequence=>760
,p_list_item_link_text=>'Continents'
,p_list_item_link_target=>'f?p=&APP_ID.:4700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(118553584132061341)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4700, 4710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118554011892061342)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'User Management'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:1:&APP_SESSION.'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118565187020061361)
,p_list_item_display_sequence=>340
,p_list_item_link_text=>'User Administration'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:310:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-institution'
,p_parent_list_item_id=>wwv_flow_api.id(118554011892061342)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118565647722061361)
,p_list_item_display_sequence=>350
,p_list_item_link_text=>'User Activities'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:810:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-thumbs-o-up'
,p_parent_list_item_id=>wwv_flow_api.id(118554011892061342)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118566036220061362)
,p_list_item_display_sequence=>360
,p_list_item_link_text=>'Parameters'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:510:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_parent_list_item_id=>wwv_flow_api.id(118554011892061342)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118566471758061362)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>'Apex Objects'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:910:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cubes'
,p_parent_list_item_id=>wwv_flow_api.id(118554011892061342)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_display_sequence=>380
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=BMBS:8999:&APP_SESSION.'
,p_list_item_icon=>'fa-gears'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118567233512061364)
,p_list_item_display_sequence=>390
,p_list_item_link_text=>'Flights'
,p_list_item_link_target=>'f?p=BMBS:20:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118567622482061364)
,p_list_item_display_sequence=>391
,p_list_item_link_text=>'Flight Health Check'
,p_list_item_link_target=>'f?p=BMBS:210:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118567987669061364)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'Aircraft Types'
,p_list_item_link_target=>'f?p=BMBS:60:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118568439952061365)
,p_list_item_display_sequence=>405
,p_list_item_link_text=>'Crew'
,p_list_item_link_target=>'f?p=BMBS:250:&APP_SESSION.'
,p_list_item_icon=>'fa-user-circle-o'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118568859151061366)
,p_list_item_display_sequence=>410
,p_list_item_link_text=>'Country Regulations'
,p_list_item_link_target=>'f?p=BMBS:8010:&APP_SESSION.'
,p_list_item_icon=>'fa-sitemap'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118569219882061367)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'System Parameters'
,p_list_item_link_target=>'f?p=BMBS:8003:&APP_SESSION.'
,p_list_item_icon=>'fa-cog'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118569631766061367)
,p_list_item_display_sequence=>430
,p_list_item_link_text=>'Borderposts'
,p_list_item_link_target=>'f?p=BMBS:2000:&APP_SESSION.'
,p_list_item_icon=>'fa-arrows'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118570000553061368)
,p_list_item_display_sequence=>440
,p_list_item_link_text=>'Thai Passports'
,p_list_item_link_target=>'f?p=BMBS:8020:&APP_SESSION.'
,p_list_item_icon=>'fa-user-check'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8020'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118570453942061368)
,p_list_item_display_sequence=>441
,p_list_item_link_text=>'Residence'
,p_list_item_link_target=>'f?p=BMBS:8060:&APP_SESSION.'
,p_list_item_icon=>'fa-user-secret'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118570869796061369)
,p_list_item_display_sequence=>450
,p_list_item_link_text=>'Border Documents'
,p_list_item_link_target=>'f?p=BMBS:8030:&APP_SESSION.'
,p_list_item_icon=>'fa-address-card-o'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8030'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118571270254061369)
,p_list_item_display_sequence=>460
,p_list_item_link_text=>'Movements'
,p_list_item_link_target=>'f?p=BMBS:8040:&APP_SESSION.'
,p_list_item_icon=>'fa-exchange'
,p_parent_list_item_id=>wwv_flow_api.id(118566787500061363)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8040'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(165542589849054976)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Administer Common Data'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-book'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,1000,1100,1200,1300,1400,1350,1500,1600,1700'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(165642808243373358)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Yes No'
,p_list_item_link_target=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1000,1010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(166041842297271709)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Boolean'
,p_list_item_link_target=>'f?p=&APP_ID.:1100:&SESSION.::&DEBUG.'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1100,1110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(166134421775438599)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Gender / Sex'
,p_list_item_link_target=>'f?p=&APP_ID.:1200:&SESSION.::&DEBUG.'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1200,1210'
);
end;
/
begin
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(166419324122747481)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Fingers'
,p_list_item_link_target=>'f?p=&APP_ID.:1300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1300, 1310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(177372934840285261)
,p_list_item_display_sequence=>55
,p_list_item_link_text=>'Status Fingers'
,p_list_item_link_target=>'f?p=&APP_ID.:1350:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1350,1360'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(177209862863096301)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Visa Types'
,p_list_item_link_target=>'f?p=&APP_ID.:1400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1400,1410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(177571810309465056)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Document Types'
,p_list_item_link_target=>'f?p=&APP_ID.:1500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1500, 1510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(177779994289595426)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Port Movements'
,p_list_item_link_target=>'f?p=&APP_ID.:1600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1600, 1610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(177850382121205604)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Transport Modes'
,p_list_item_link_target=>'f?p=&APP_ID.:1700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1700, 1710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(127166094678087802)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Transport GRP States'
,p_list_item_link_target=>'f?p=&APP_ID.:1800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1800, 1810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(127538005628010573)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Border Types'
,p_list_item_link_target=>'f?p=&APP_ID.:1900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1900, 1910'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(127898755624061820)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Countries'
,p_list_item_link_target=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2000, 2010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(128001904002145852)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Carriers'
,p_list_item_link_target=>'f?p=&APP_ID.:2100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2100, 2110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(128168098107406069)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Ports'
,p_list_item_link_target=>'f?p=&APP_ID.:2200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2200, 2210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(128265229727573237)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Messages'
,p_list_item_link_target=>'f?p=&APP_ID.:2300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2300, 2310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(76760733579269502)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Incident'
,p_list_item_link_target=>'f?p=&APP_ID.:2400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2400, 2410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(77220736651025181)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Transport Vehicles'
,p_list_item_link_target=>'f?p=&APP_ID.:2600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2600, 2610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(77354694855599176)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'ICAO Document Codes'
,p_list_item_link_target=>'f?p=&APP_ID.:2700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(165585368974055232)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2700, 2710'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(165584860799055184)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(165585068087055212)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_current_for_pages=>'&LOGOUT_URL.'
);
end;
/
