prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(154744581299398483)
,p_name=>'BmBS Navigation Menu Static'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154744786317398484)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Passport Check'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user-check'
,p_list_text_01=>'A01'
,p_list_text_02=>'A02'
,p_list_text_03=>'A03'
,p_list_text_04=>'A04'
,p_list_text_05=>'A05'
,p_list_text_06=>'A06'
,p_list_text_07=>'A07'
,p_list_text_08=>'A08'
,p_list_text_09=>'A09'
,p_list_text_10=>'A10'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154745168908398484)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Blacklist Management'
,p_list_item_link_target=>'f?p=BMBS:5000:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154747135396398487)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Blacklist History'
,p_list_item_link_target=>'f?p=BMBS:5005:&APP_SESSION.'
,p_list_item_icon=>'fa-history'
,p_parent_list_item_id=>wwv_flow_api.id(154745168908398484)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Reporting'
,p_list_item_link_target=>'f?p=BMBS:5999:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154747561447398488)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Travel History'
,p_list_item_link_target=>'f?p=&APP_ID.:8001:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_text_01=>'A01'
,p_list_text_02=>'A02'
,p_list_text_03=>'A03'
,p_list_text_04=>'A04'
,p_list_text_05=>'A05'
,p_list_text_06=>'A06'
,p_list_text_07=>'A07'
,p_list_text_08=>'A08'
,p_list_text_09=>'A09'
,p_list_text_10=>'A10'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154747934715398488)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Travel History (Children)'
,p_list_item_link_target=>'f?p=BMBS:8011:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(156099292833273052)
,p_list_item_display_sequence=>93
,p_list_item_link_text=>'Traveler In/Out Report'
,p_list_item_link_target=>'f?p=&APP_ID.:8200:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154748343023398489)
,p_list_item_display_sequence=>94
,p_list_item_link_text=>'Traveler matching Blacklist'
,p_list_item_link_target=>'f?p=&APP_ID.:5010:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154748775682398489)
,p_list_item_display_sequence=>96
,p_list_item_link_text=>'Traveler In/Out Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1000:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154749131438398490)
,p_list_item_display_sequence=>97
,p_list_item_link_text=>'Blacklist Matched Detection Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1100:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154749598179398490)
,p_list_item_display_sequence=>98
,p_list_item_link_text=>'Nationality Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1200:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154749923623398491)
,p_list_item_display_sequence=>99
,p_list_item_link_text=>'Nationality Blacklist Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1300:&APP_SESSION.'
,p_list_item_icon=>'fa-bell'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154750348148398491)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Nationality/Visa'
,p_list_item_link_target=>'f?p=BMBS:5512:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154750748299398492)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Arrival/Departure'
,p_list_item_link_target=>'f?p=BMBS:5513:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154751165618398492)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Travel History (PDF)'
,p_list_item_link_target=>'f?p=BMBS:5514:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154751606704398493)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Person Report (PDF)'
,p_list_item_link_target=>'f?p=BMBS:5515:&APP_SESSION.'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(170751914801648383)
,p_list_item_display_sequence=>650
,p_list_item_link_text=>'ISDS Logs'
,p_list_item_link_target=>'f?p=&APP_ID.:5516:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-server-search'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5516,5517'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(79295438385468907)
,p_list_item_display_sequence=>651
,p_list_item_link_text=>'Blacklist Hit Logs'
,p_list_item_link_target=>'f?p=&APP_ID.:5520:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database-search'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(84472115849738439)
,p_list_item_display_sequence=>770
,p_list_item_link_text=>'ICRS Logs'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:5000:&APP_SESSION.'
,p_list_item_icon=>'fa-database-search'
,p_parent_list_item_id=>wwv_flow_api.id(154745588513398485)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154745935780398486)
,p_list_item_display_sequence=>45
,p_list_item_link_text=>'Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1:&APP_SESSION.'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154770760413398520)
,p_list_item_display_sequence=>620
,p_list_item_link_text=>'Pivot Analysis'
,p_list_item_link_target=>'f?p=DL_DATA_MART:1400:&APP_SESSION.'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(154745935780398486)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Master Data'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1:&APP_SESSION.'
,p_list_item_icon=>'fa-database'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173006520902782139)
,p_list_item_display_sequence=>135
,p_list_item_link_text=>'System'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154751945458398493)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Yes No'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(173006520902782139)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1000,1010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154752372333398493)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Boolean'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(173006520902782139)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1100,1110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154757955449398500)
,p_list_item_display_sequence=>290
,p_list_item_link_text=>'Messages'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(173006520902782139)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2300,2310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154768350612398514)
,p_list_item_display_sequence=>520
,p_list_item_link_text=>'Action Codes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(173006520902782139)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3300,3310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154752744956398494)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Gender / Sex'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1200,1210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154753139431398494)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'Fingers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1300,1310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154753523869398495)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Status Fingers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1350:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1350,1360'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154754000920398496)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'Visa Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1400,1410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154754417940398496)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Document Classes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1500,1510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154754806861398497)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'Port Movements'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1600,1610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154755137584398497)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Transport Modes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1700,1710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154755553904398498)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'Transport GRP States'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1800,1810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154755998072398498)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'Border Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:1900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1900,1910'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154756406616398499)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'Border Types'
,p_list_item_link_target=>'f?p=&APP_ID.:1900:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154756817732398499)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>'Countries'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2000,2010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154757217736398500)
,p_list_item_display_sequence=>270
,p_list_item_link_text=>'Carriers'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2100,2110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154757589967398500)
,p_list_item_display_sequence=>280
,p_list_item_link_text=>'Ports'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2200,2210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154758389064398501)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>'Incident Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2400,2410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154758796829398501)
,p_list_item_display_sequence=>310
,p_list_item_link_text=>'On Board Types'
,p_list_item_link_target=>'f?p=&APP_ID.:2500:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154759135195398502)
,p_list_item_display_sequence=>320
,p_list_item_link_text=>'Transport Vehicles'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2600,2610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154759520144398503)
,p_list_item_display_sequence=>330
,p_list_item_link_text=>'ICAO Document Codes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2700,2710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154766385894398512)
,p_list_item_display_sequence=>470
,p_list_item_link_text=>'Doc Lists'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2800,2810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154766757238398512)
,p_list_item_display_sequence=>480
,p_list_item_link_text=>'Secret Levels'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:2900:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2900,2910'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154767146401398513)
,p_list_item_display_sequence=>490
,p_list_item_link_text=>'Arrested Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3000,3010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154767533859398513)
,p_list_item_display_sequence=>500
,p_list_item_link_text=>'Arrested Statuses'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3100,3110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154767993594398514)
,p_list_item_display_sequence=>510
,p_list_item_link_text=>'Reason Codes'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3200,3210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154768759464398515)
,p_list_item_display_sequence=>530
,p_list_item_link_text=>'Card Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3400,3410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154769212365398516)
,p_list_item_display_sequence=>540
,p_list_item_link_text=>'(Blacklist) Relationships'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3500,3510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154769557135398519)
,p_list_item_display_sequence=>550
,p_list_item_link_text=>'Case Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3600,3610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154770016066398519)
,p_list_item_display_sequence=>560
,p_list_item_link_text=>'ICAO Document Codes (free VISA)'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3700:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3700,3710'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154770390929398520)
,p_list_item_display_sequence=>570
,p_list_item_link_text=>'Sub Nationalities'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:3800:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3800,3810'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172508901894387368)
,p_list_item_display_sequence=>660
,p_list_item_link_text=>'UAT'
,p_list_item_link_target=>'f?p=BMBS:3005:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172509389101395627)
,p_list_item_display_sequence=>670
,p_list_item_link_text=>'Extendstay'
,p_list_item_link_target=>'f?p=&APP_ID.:3001:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(172508901894387368)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3001, 3011'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172644913035892162)
,p_list_item_display_sequence=>680
,p_list_item_link_text=>'Residentinfo'
,p_list_item_link_target=>'f?p=&APP_ID.:3101:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(172508901894387368)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3101, 3111'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172752094242491108)
,p_list_item_display_sequence=>690
,p_list_item_link_text=>'Visarun Rules'
,p_list_item_link_target=>'f?p=&APP_ID.:3201:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(172508901894387368)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3201, 3211'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172826502199693029)
,p_list_item_display_sequence=>700
,p_list_item_link_text=>'Void Passport'
,p_list_item_link_target=>'f?p=&APP_ID.:3301:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(172508901894387368)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3301, 3311'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172986463432685815)
,p_list_item_display_sequence=>710
,p_list_item_link_text=>'Duplicate Passport'
,p_list_item_link_target=>'f?p=&APP_ID.:3401:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(172508901894387368)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3401, 3411'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(184471052035243281)
,p_list_item_display_sequence=>741
,p_list_item_link_text=>'ICAO Document List Item'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4100:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4100, 4110'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(184471921185249823)
,p_list_item_display_sequence=>742
,p_list_item_link_text=>'Permit Types'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4200:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4200, 4210'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(184472550643254680)
,p_list_item_display_sequence=>743
,p_list_item_link_text=>'Professions'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4300:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4300, 4310'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(184473070006258121)
,p_list_item_display_sequence=>744
,p_list_item_link_text=>'Relations'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4400:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4400, 4410'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(184473525024262033)
,p_list_item_display_sequence=>745
,p_list_item_link_text=>'Salutations'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4500:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4500, 4510'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(184481317224265535)
,p_list_item_display_sequence=>746
,p_list_item_link_text=>'Status'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4600:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4600, 4610'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(184466767805230365)
,p_list_item_display_sequence=>750
,p_list_item_link_text=>'Region > Province > District > Subdistrict'
,p_list_item_link_target=>'f?p=BMBS:3561:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3561, 3541, 3531, 3521, 3511'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(77708857181458817)
,p_list_item_display_sequence=>760
,p_list_item_link_text=>'Continents'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA:4700:&APP_SESSION.'
,p_parent_list_item_id=>wwv_flow_api.id(154746376047398486)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154746812474398487)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'User Management'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:1:&APP_SESSION.'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154759940737398504)
,p_list_item_display_sequence=>340
,p_list_item_link_text=>'User Administration'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:310:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-institution'
,p_parent_list_item_id=>wwv_flow_api.id(154746812474398487)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154760373091398504)
,p_list_item_display_sequence=>350
,p_list_item_link_text=>'User Activities'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:810:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-thumbs-o-up'
,p_parent_list_item_id=>wwv_flow_api.id(154746812474398487)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154760740952398505)
,p_list_item_display_sequence=>360
,p_list_item_link_text=>'Parameters'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:510:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_parent_list_item_id=>wwv_flow_api.id(154746812474398487)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154761145779398505)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>'Apex Objects'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT:910:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cubes'
,p_parent_list_item_id=>wwv_flow_api.id(154746812474398487)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_display_sequence=>380
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=BMBS:8999:&APP_SESSION.'
,p_list_item_icon=>'fa-gears'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154762015164398506)
,p_list_item_display_sequence=>390
,p_list_item_link_text=>'Flights'
,p_list_item_link_target=>'f?p=BMBS:20:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154762388883398507)
,p_list_item_display_sequence=>391
,p_list_item_link_text=>'Flight Health Check'
,p_list_item_link_target=>'f?p=BMBS:210:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154762770322398507)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'Aircraft Types'
,p_list_item_link_target=>'f?p=BMBS:60:&APP_SESSION.'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154763181445398508)
,p_list_item_display_sequence=>405
,p_list_item_link_text=>'Crew'
,p_list_item_link_target=>'f?p=BMBS:250:&APP_SESSION.'
,p_list_item_icon=>'fa-user-circle-o'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154763593797398508)
,p_list_item_display_sequence=>410
,p_list_item_link_text=>'Country Regulations'
,p_list_item_link_target=>'f?p=BMBS:8010:&APP_SESSION.'
,p_list_item_icon=>'fa-sitemap'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154764014248398509)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'System Parameters'
,p_list_item_link_target=>'f?p=BMBS:8003:&APP_SESSION.'
,p_list_item_icon=>'fa-cog'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154764386241398509)
,p_list_item_display_sequence=>430
,p_list_item_link_text=>'Borderposts'
,p_list_item_link_target=>'f?p=BMBS:2000:&APP_SESSION.'
,p_list_item_icon=>'fa-arrows'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154764750657398510)
,p_list_item_display_sequence=>440
,p_list_item_link_text=>'Thai Passports'
,p_list_item_link_target=>'f?p=BMBS:8020:&APP_SESSION.'
,p_list_item_icon=>'fa-user-check'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8020'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154765186309398510)
,p_list_item_display_sequence=>441
,p_list_item_link_text=>'Residence'
,p_list_item_link_target=>'f?p=BMBS:8060:&APP_SESSION.'
,p_list_item_icon=>'fa-user-secret'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154765618039398511)
,p_list_item_display_sequence=>450
,p_list_item_link_text=>'Border Documents'
,p_list_item_link_target=>'f?p=BMBS:8030:&APP_SESSION.'
,p_list_item_icon=>'fa-address-card-o'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8030'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(154765951381398511)
,p_list_item_display_sequence=>460
,p_list_item_link_text=>'Movements'
,p_list_item_link_target=>'f?p=&APP_ID.:8040:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-exchange'
,p_list_item_disp_cond_type=>'NEVER'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8040'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(164763914934302184)
,p_list_item_display_sequence=>630
,p_list_item_link_text=>'Passenger Display'
,p_list_item_link_target=>'f?p=&APP_ID.:8005:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-television'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8005'
);
end;
/
begin
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(169051960371936725)
,p_list_item_display_sequence=>640
,p_list_item_link_text=>'License Information'
,p_list_item_link_target=>'f?p=BMBS:8006:&APP_SESSION.'
,p_list_item_icon=>'fa-info'
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(178039390354503794)
,p_list_item_display_sequence=>720
,p_list_item_link_text=>'BMIS: Borderdocuments'
,p_list_item_link_target=>'f?p=&APP_ID.:11000:&SESSION.::&DEBUG.:11000:::'
,p_list_item_icon=>'fa-exchange'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM apex_application_pages',
' WHERE application_id = :APP_ID',
'   AND page_id = 11000'))
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(178039714725506526)
,p_list_item_display_sequence=>730
,p_list_item_link_text=>'BMIS: Movements'
,p_list_item_link_target=>'f?p=&APP_ID.:11100:&SESSION.::&DEBUG.:11100:::'
,p_list_item_icon=>'fa-exchange'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM apex_application_pages',
' WHERE application_id = :APP_ID',
'   AND page_id = 11100'))
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(180391940635704950)
,p_list_item_display_sequence=>740
,p_list_item_link_text=>'BMIS: Blacklist'
,p_list_item_link_target=>'f?p=&APP_ID.:11200:&SESSION.::&DEBUG.:11200:::'
,p_list_item_icon=>'fa-exchange'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM apex_application_pages',
' WHERE application_id = :APP_ID',
'   AND page_id = 11200'))
,p_parent_list_item_id=>wwv_flow_api.id(154761535245398506)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(182729644107182564)
,p_name=>'ReportingList'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'--level As lvl, ',
'       1 as lvl,',
'       DISPLAY_VALUE, ',
'       target, ',
'       null as is_current_list_entry, ',
'       image as imagevalue',
'from dl_common.apex_menu',
'where level=2',
'--where USER_MANAGEMENT.PKG_AUTHORIZATION.APEX_MENU_AUTORIZATION(APP_ALIAS, PAGE_ID) = 1',
'start with parent_key_value is null and display_value = ''Reporting'' ',
'connect by prior key_value = parent_key_value',
'order siblings by key_value;'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(182731012523222950)
,p_name=>'FlightManagementList'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'--level As lvl, ',
'       1 as lvl,',
'       DISPLAY_VALUE, ',
'       target, ',
'       null as is_current_list_entry, ',
'       image as imagevalue',
'from dl_common.apex_menu',
'where level=2',
'--where USER_MANAGEMENT.PKG_AUTHORIZATION.APEX_MENU_AUTORIZATION(APP_ALIAS, PAGE_ID) = 1',
'start with parent_key_value is null and display_value = ''Flight Management'' ',
'connect by prior key_value = parent_key_value',
'order siblings by key_value;'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(182735465779304428)
,p_name=>'ConfigurationList'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'--level As lvl, ',
'       1 as lvl,',
'       DISPLAY_VALUE, ',
'       target, ',
'       null as is_current_list_entry, ',
'       image as imagevalue',
'from dl_common.apex_menu',
'where level=2',
'--where USER_MANAGEMENT.PKG_AUTHORIZATION.APEX_MENU_AUTORIZATION(APP_ALIAS, PAGE_ID) = 1',
'start with parent_key_value is null and display_value = ''Configuration'' ',
'connect by prior key_value = parent_key_value',
'order siblings by key_value;'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(188689744143649712)
,p_name=>'BMBS Navigation Menu'
,p_list_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_list_query=>'return dl_user_management.pkg_authorization.apex_menu_sql(:APP_USER);'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(563804675338049608)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(563848364067049643)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Passport Check'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.:REQ_STARTSCAN:&DEBUG.::::'
,p_list_item_icon=>'flaticon-passport4'
,p_security_scheme=>wwv_flow_api.id(187612823300390002)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(428317004347251965)
,p_list_item_display_sequence=>16
,p_list_item_link_text=>'Blacklist Management'
,p_list_item_link_target=>'f?p=&APP_ID.:5000:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bell'
,p_security_scheme=>wwv_flow_api.id(187545421665112046)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5000,5001'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(940519300692182121)
,p_list_item_display_sequence=>390
,p_list_item_link_text=>'Blacklist History'
,p_list_item_link_target=>'f?p=&APP_ID.:5005:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-history'
,p_parent_list_item_id=>wwv_flow_api.id(428317004347251965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5005'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(941193813638145732)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'Passport -> Blacklist'
,p_list_item_link_target=>'f?p=&APP_ID.:5004:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-plus-circle'
,p_parent_list_item_id=>wwv_flow_api.id(428317004347251965)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5004'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(428530925208218462)
,p_list_item_display_sequence=>17
,p_list_item_link_text=>'Incident Management'
,p_list_item_link_target=>'f?p=&APP_ID.:5010:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bell'
,p_security_scheme=>wwv_flow_api.id(187553157428471938)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5010'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(927523257825004878)
,p_list_item_display_sequence=>18
,p_list_item_link_text=>'Reporting'
,p_list_item_link_target=>'f?p=&APP_ID.:5999:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_security_scheme=>wwv_flow_api.id(187552975563427368)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(428201481040004676)
,p_list_item_display_sequence=>14
,p_list_item_link_text=>'Travel History'
,p_list_item_link_target=>'f?p=&APP_ID.:8001:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(927523257825004878)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8001'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(933834928620626352)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Travel History (Children)'
,p_list_item_link_target=>'f?p=&APP_ID.:8011:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_parent_list_item_id=>wwv_flow_api.id(927523257825004878)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8011'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(931464401699380988)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>'Nationality/Visa'
,p_list_item_link_target=>'f?p=&APP_ID.:5512:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(927523257825004878)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5512'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(934363284357228942)
,p_list_item_display_sequence=>380
,p_list_item_link_text=>'Arrival/Departure'
,p_list_item_link_target=>'f?p=&APP_ID.:5513:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(927523257825004878)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5513'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(943891896084100605)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'Travel History (PDF)'
,p_list_item_link_target=>'f?p=&APP_ID.:5514:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(927523257825004878)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5514'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(950378281633406924)
,p_list_item_display_sequence=>430
,p_list_item_link_text=>'Person Report (PDF)'
,p_list_item_link_target=>'f?p=&APP_ID.:5515:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-pdf-o'
,p_parent_list_item_id=>wwv_flow_api.id(927523257825004878)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5515'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(936505683435154387)
,p_list_item_display_sequence=>19
,p_list_item_link_text=>'Statistics'
,p_list_item_link_target=>'f?p=DL_DATA_MART::&APP_SESSION.'
,p_list_item_icon=>'fa-bar-chart'
,p_security_scheme=>wwv_flow_api.id(187358305584845564)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(551493646093560788)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:8999:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-wrench'
,p_security_scheme=>wwv_flow_api.id(187190241436598134)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(551244223161277255)
,p_list_item_display_sequence=>125
,p_list_item_link_text=>'Flights'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(551493646093560788)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'20,21'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(566485856893946531)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Aircraft Types'
,p_list_item_link_target=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-plane'
,p_parent_list_item_id=>wwv_flow_api.id(551493646093560788)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'60,61'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(852350606806189434)
,p_list_item_display_sequence=>195
,p_list_item_link_text=>'Country Regulations'
,p_list_item_link_target=>'f?p=&APP_ID.:8010:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-sitemap'
,p_parent_list_item_id=>wwv_flow_api.id(551493646093560788)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8010,7'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(918381780838517638)
,p_list_item_display_sequence=>201
,p_list_item_link_text=>'System Parameters'
,p_list_item_link_target=>'f?p=&APP_ID.:8003:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cog'
,p_parent_list_item_id=>wwv_flow_api.id(551493646093560788)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8003'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(237384619981894709)
,p_list_item_display_sequence=>440
,p_list_item_link_text=>'Master Data'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA::&APP_SESSION.'
,p_list_item_icon=>'fa-book '
,p_parent_list_item_id=>wwv_flow_api.id(551493646093560788)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(239916294290629199)
,p_list_item_display_sequence=>450
,p_list_item_link_text=>'User Management'
,p_list_item_link_target=>'f?p=APEX_USER_MANAGEMENT::&APP_SESSION.'
,p_list_item_icon=>'fa-user'
,p_parent_list_item_id=>wwv_flow_api.id(551493646093560788)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(186872583797462024)
,p_list_item_display_sequence=>460
,p_list_item_link_text=>'Borderposts'
,p_list_item_link_target=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-arrows'
,p_parent_list_item_id=>wwv_flow_api.id(551493646093560788)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2000,2010'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(563846802393049635)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(943400548821278861)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'&AI_RELEASE_VERSION. / &AI_APP_VERSION_BMBS.'
,p_list_item_icon=>'VERSIONINFO'
,p_list_text_03=>'navbarVersionInfo'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(148292134006960193)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>' '
,p_list_item_icon=>'nav_bar_hardware_status'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(148348365786453012)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Restart Hardware'
,p_list_item_link_target=>'javascript:restartHardware();'
,p_parent_list_item_id=>wwv_flow_api.id(148292134006960193)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(562646192070865308)
,p_list_item_display_sequence=>4
,p_list_item_link_text=>'&AI_CURRENT_USER_NAME. (&APP_USER.)'
,p_list_item_icon=>'fa-user'
,p_list_text_03=>'navbarUserInformation'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(110014949760629717)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Report'
,p_list_item_link_target=>'javascript:window.open(''http://bmbs-report.bio-immigration.com:8080/appbmbs/inout/main_report.jsp?un=&APP_USER.&xx=&AI_TERMINAL_IP.'', ''_blank'');'
,p_parent_list_item_id=>wwv_flow_api.id(562646192070865308)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(298915644354432687)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'วันครบกำหนดอนุญาต Visa'
,p_list_item_link_target=>'javascript:window.open(''http://172.155.254.21:8080/appbmbs/stampdate2.html'', ''_blank'', ''height=800,width=1100'');'
,p_parent_list_item_id=>wwv_flow_api.id(562646192070865308)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(954837088909677454)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Change User Password'
,p_list_item_link_target=>'f?p=&APP_ID.:7000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(562646192070865308)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(36462296896555817706)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'&AI_TERMINAL_NAME_AND_IP. (&AI_BORDERPOST_NAME_SHORT. - &AI_ENTRY_MODE_DESCRIPTION.)'
,p_list_item_icon=>'fa-window-terminal'
,p_list_text_03=>'navbarBorderpostInfo'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(31504883812780249473)
,p_list_item_display_sequence=>9
,p_list_item_link_text=>'Travel History'
,p_list_item_link_target=>'f?p=&APP_ID.:8007:&SESSION.::&DEBUG.:RP,8007:P8007_INIT_LOAD:Y:'
,p_list_item_icon=>'fa-database-search makecssbutton'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'APP_PAGE_ID'
,p_list_item_disp_condition2=>'17'
,p_list_text_01=>'F2'
,p_list_text_03=>'navbarTravelHistory'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(950865997976571759)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Restart'
,p_list_item_link_target=>'javascript:resetWorkstation(this);'
,p_list_item_icon=>'fa-close RESET_BUTTON makecssbutton'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'APP_PAGE_ID'
,p_list_item_disp_condition2=>'17'
,p_list_text_01=>'F7'
,p_list_text_03=>'navbarRestart'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(463081469726756713)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Tools'
,p_list_item_link_target=>'f?p=&APP_ID.:5900:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-wrench makecssbutton'
,p_list_text_01=>'F9'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(951577311192456981)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Help'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-question-circle makecssbutton'
,p_list_text_03=>'navbarHelp'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(197191078749913412)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Save'
,p_list_item_link_target=>'javascript:saveMovement(this);'
,p_list_item_icon=>'fa-floppy-o RESET_BUTTON makecssbutton'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'APP_PAGE_ID'
,p_list_item_disp_condition2=>'17'
,p_list_text_01=>'F12'
,p_list_text_03=>'navbarSave'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(562640230486859868)
,p_list_item_display_sequence=>39
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'javascript:BmBSLogout();'
,p_list_item_icon=>'fa-sign-out makecssbutton'
,p_list_text_03=>'navbarLogout'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(930857331972175730)
,p_name=>'Administration Pages'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(930857931323175737)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Flights'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-plane'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'AI_TRANSPORT_MODE'
,p_list_item_disp_condition2=>'0'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(930858677743175739)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Country Regulations'
,p_list_item_link_target=>'f?p=&APP_ID.:8010:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-sitemap'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(930862665842261624)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'System Parameters'
,p_list_item_link_target=>'f?p=&APP_ID.:8003:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cog'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(237417792131278196)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Master Data'
,p_list_item_link_target=>'f?p=DL_COMMON_DATA'
,p_list_item_icon=>'fa-book'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(936501093518137549)
,p_name=>'Statistics'
,p_list_status=>'PUBLIC'
);
end;
/
