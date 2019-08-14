prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(47991441276955837)
,p_name=>'BMBS Navigation Menu'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select level As lvl, ',
'       display_value, ',
'       target, ',
'       null as is_current_list_entry, ',
'       image as imagevalue',
'from dl_common.apex_menu',
'start with parent_key_value is null',
'connect by prior key_value = parent_key_value',
'order siblings by key_value;'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(68483778258627408)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(47815113314740805)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'BmBS - Biometric Bordercontrol System'
,p_list_item_link_target=>'f?p=BMBS:8999:&APP_SESSION.'
,p_list_item_icon=>'fa-minus-circle'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(68527540845628105)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,3,1000,1100,1100,1200,1300,1400,1001'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91465074437170558)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Traveler In/Out Statistics'
,p_list_item_link_target=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.:1000:::'
,p_parent_list_item_id=>wwv_flow_api.id(68527540845628105)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(94209818891149030)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Blacklist Matched Detection Statistics'
,p_list_item_link_target=>'f?p=&APP_ID.:1100:&SESSION.::&DEBUG.:1100:::'
,p_parent_list_item_id=>wwv_flow_api.id(68527540845628105)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1100'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(94765071588516062)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Nationality Statistics'
,p_list_item_link_target=>'f?p=&APP_ID.:1200:&SESSION.::&DEBUG.:1200:::'
,p_parent_list_item_id=>wwv_flow_api.id(68527540845628105)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1200'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(95830864363701366)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Nationality Blacklist Statistics'
,p_list_item_link_target=>'f?p=&APP_ID.:1300:&SESSION.::&DEBUG.:1300:::'
,p_parent_list_item_id=>wwv_flow_api.id(68527540845628105)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1300'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(95978765710969739)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Pivot Analysis'
,p_list_item_link_target=>'f?p=&APP_ID.:1400:&SESSION.::&DEBUG.:1400:::'
,p_parent_list_item_id=>wwv_flow_api.id(68527540845628105)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1400'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(68526098842627862)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(68526273368627930)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_current_for_pages=>'&LOGOUT_URL.'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(121350352140378961)
,p_name=>'BmBS Navigation Menu Static'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121350626381378962)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Passport Check'
,p_list_item_link_target=>'f?p=BMBS:17:&APP_SESSION.'
,p_list_item_icon=>'fa-user-check'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121350937320378963)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Blacklist Management'
,p_list_item_link_target=>'f?p=BMBS:5000:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121352918456378966)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Blacklist History'
,p_list_item_link_target=>'f?p=BMBS:5005:&APP_SESSION.'
,p_list_item_icon=>'fa-history'
,p_parent_list_item_id=>wwv_flow_api.id(121350937320378963)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Reporting'
,p_list_item_link_target=>'f?p=BMBS:5999:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121353254208378967)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Travel History'
,p_list_item_link_target=>'f?p=BMBS:8001:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121353699923378967)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Travel History (Children)'
,p_list_item_link_target=>'f?p=BMBS:8011:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121354116860378968)
,p_list_item_display_sequence=>93
,p_list_item_link_text=>'Traveler In/Out Report'
,p_list_item_link_target=>'f?p=BMBS:8200:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121354436831378968)
,p_list_item_display_sequence=>94
,p_list_item_link_text=>'Traveler matching Blacklist'
,p_list_item_link_target=>'f?p=BMBS:5010:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121354893080378969)
,p_list_item_display_sequence=>96
,p_list_item_link_text=>'Traveler In/Out Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1000:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121355324235378969)
,p_list_item_display_sequence=>97
,p_list_item_link_text=>'Blacklist Matched Detection Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1100:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121355687896378970)
,p_list_item_display_sequence=>98
,p_list_item_link_text=>'Nationality Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1200:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121356069885378970)
,p_list_item_display_sequence=>99
,p_list_item_link_text=>'Nationality Blacklist Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1300:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121356456479378971)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Nationality/Visa'
,p_list_item_link_target=>'f?p=BMBS:5512:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121356928180378971)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Arrival/Departure'
,p_list_item_link_target=>'f?p=BMBS:5513:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121357265819378971)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Travel History (PDF)'
,p_list_item_link_target=>'f?p=BMBS:5514:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121357684321378972)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Person Report (PDF)'
,p_list_item_link_target=>'f?p=BMBS:5515:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(121351287878378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121351694813378964)
,p_list_item_display_sequence=>45
,p_list_item_link_text=>'Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1:&APP_SESSION.'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121376849089379001)
,p_list_item_display_sequence=>620
,p_list_item_link_text=>'Pivot Analysis'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1400:&APP_SESSION.'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(121351694813378964)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Master Data'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121358089923378972)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Yes No'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1000,1010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121358487365378973)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Boolean'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1100,1110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121358886979378973)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Gender / Sex'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1200,1210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121359305548378973)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'Fingers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1300,1310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121359650476378974)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Status Fingers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1350:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1350,1360'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121360108474378974)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'Visa Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1400,1410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121360469994378977)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Document Classes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1500,1510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121360887439378977)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'Port Movements'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1600,1610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121361278946378978)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Transport Modes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1700,1710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121361721577378978)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'Transport GRP States'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1800,1810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121362034292378979)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'Border Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1900,1910'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121362476310378979)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'Border Types'
,p_list_item_link_target=>'f?p=&APP_ID.:1900:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121362902299378980)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>'Countries'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2000,2010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121363282218378980)
,p_list_item_display_sequence=>270
,p_list_item_link_text=>'Carriers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2100,2110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121363712301378980)
,p_list_item_display_sequence=>280
,p_list_item_link_text=>'Ports'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2200,2210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121364113331378981)
,p_list_item_display_sequence=>290
,p_list_item_link_text=>'Messages'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2300,2310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121364469249378981)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'Incident Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2400,2410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121364846895378981)
,p_list_item_display_sequence=>310
,p_list_item_link_text=>'On Board Types'
,p_list_item_link_target=>'f?p=&APP_ID.:2500:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121365292825378982)
,p_list_item_display_sequence=>320
,p_list_item_link_text=>'Transport Vehicles'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2600,2610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121365665463378983)
,p_list_item_display_sequence=>330
,p_list_item_link_text=>'ICAO Document Codes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2700,2710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121372458241378995)
,p_list_item_display_sequence=>470
,p_list_item_link_text=>'Doc Lists'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2800,2810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121372888422378996)
,p_list_item_display_sequence=>480
,p_list_item_link_text=>'Secret Levels'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2900,2910'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121373325165378996)
,p_list_item_display_sequence=>490
,p_list_item_link_text=>'Arrested Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3000,3010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121373694229378997)
,p_list_item_display_sequence=>500
,p_list_item_link_text=>'Arrested Statuses'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3100,3110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121374062086378997)
,p_list_item_display_sequence=>510
,p_list_item_link_text=>'Reason Codes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3200,3210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121374432811378998)
,p_list_item_display_sequence=>520
,p_list_item_link_text=>'Action Codes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3300,3310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121374902390378998)
,p_list_item_display_sequence=>530
,p_list_item_link_text=>'Card Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3400,3410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121375299872378999)
,p_list_item_display_sequence=>540
,p_list_item_link_text=>'(Blacklist) Relationships'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3500,3510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121375726618378999)
,p_list_item_display_sequence=>550
,p_list_item_link_text=>'Case Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3600,3610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121376094801379000)
,p_list_item_display_sequence=>560
,p_list_item_link_text=>'ICAO Document Codes (free VISA)'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3700,3710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121376472636379000)
,p_list_item_display_sequence=>570
,p_list_item_link_text=>'Sub Nationalities'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(121352042628378965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3800,3810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121352469122378966)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'User Management'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:1:&APP_SESSION.'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121366039604378983)
,p_list_item_display_sequence=>340
,p_list_item_link_text=>'User Administration'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:310:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-institution'
,p_parent_list_item_id=>wwv_flow_api.id(121352469122378966)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121366496126378984)
,p_list_item_display_sequence=>350
,p_list_item_link_text=>'User Activities'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:810:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-thumbs-o-up'
,p_parent_list_item_id=>wwv_flow_api.id(121352469122378966)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121366929118378984)
,p_list_item_display_sequence=>360
,p_list_item_link_text=>'Parameters'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:510:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_parent_list_item_id=>wwv_flow_api.id(121352469122378966)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121367327477378985)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>'Apex Objects'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:910:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cubes'
,p_parent_list_item_id=>wwv_flow_api.id(121352469122378966)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_display_sequence=>380
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=BMBS:8999:&APP_SESSION.'
,p_list_item_icon=>'fa-gears'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121368096149378986)
,p_list_item_display_sequence=>390
,p_list_item_link_text=>'Flights'
,p_list_item_link_target=>'f?p=BMBS:20:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121368469979378986)
,p_list_item_display_sequence=>391
,p_list_item_link_text=>'Flight Health Check'
,p_list_item_link_target=>'f?p=BMBS:210:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121368873143378987)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'Aircraft Types'
,p_list_item_link_target=>'f?p=BMBS:60:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121369268485378987)
,p_list_item_display_sequence=>405
,p_list_item_link_text=>'Crew'
,p_list_item_link_target=>'f?p=BMBS:250:&APP_SESSION.'
,p_list_item_icon=>'fa-user-circle-o'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121369715542378988)
,p_list_item_display_sequence=>410
,p_list_item_link_text=>'Country Regulations'
,p_list_item_link_target=>'f?p=BMBS:8010:&APP_SESSION.'
,p_list_item_icon=>'fa-sitemap'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121370122447378989)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'System Parameters'
,p_list_item_link_target=>'f?p=BMBS:8003:&APP_SESSION.'
,p_list_item_icon=>'fa-cog'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121370459538378989)
,p_list_item_display_sequence=>430
,p_list_item_link_text=>'Borderposts'
,p_list_item_link_target=>'f?p=BMBS:2000:&APP_SESSION.'
,p_list_item_icon=>'fa-arrows'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121370866128378990)
,p_list_item_display_sequence=>440
,p_list_item_link_text=>'Thai Passports'
,p_list_item_link_target=>'f?p=BMBS:8020:&APP_SESSION.'
,p_list_item_icon=>'fa-user-check'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8020'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121371238284378990)
,p_list_item_display_sequence=>441
,p_list_item_link_text=>'Residence'
,p_list_item_link_target=>'f?p=BMBS:8060:&APP_SESSION.'
,p_list_item_icon=>'fa-user-secret'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121371688607378991)
,p_list_item_display_sequence=>450
,p_list_item_link_text=>'Border Documents'
,p_list_item_link_target=>'f?p=BMBS:8030:&APP_SESSION.'
,p_list_item_icon=>'fa-address-card-o'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8030'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(121372126275378991)
,p_list_item_display_sequence=>460
,p_list_item_link_text=>'Movements'
,p_list_item_link_target=>'f?p=BMBS:8040:&APP_SESSION.'
,p_list_item_icon=>'fa-exchange'
,p_parent_list_item_id=>wwv_flow_api.id(121367729811378985)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8040'
);
end;
/
