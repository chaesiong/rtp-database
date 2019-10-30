prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(86523227135386611)
,p_name=>'APPLICATIONS_MAIN'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86523382367386611)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'ระบบงานสำหรับจัดเก็บและตรวจสอบข้อมูล Biometrics ของบุคคลเดินทางเข้า-ออกประเทศไทย'
,p_list_item_link_target=>'f?p=BMBS:17:&APP_SESSION.:::RP,17::'
,p_list_item_icon=>'fa-credit-card-alt'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86523780868386612)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'ระบบจัดเก็บข้อมูล Biometrics ของบุคคลต้องห้าม บุคคลเฝ้าระวัง ข้อมูลหมายจับคนร้ายข้ามชาติ'
,p_list_item_link_target=>'f?p=BBS:1:&APP_SESSION.'
,p_list_item_icon=>' fa-list-alt'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(86524132135390536)
,p_name=>'APPLICATIONS_APPLICATION'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86524347980390536)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Visa on Arrival (VOA)'
,p_list_item_link_target=>'javascript:window.open(''http://servapp-uat.bio-immigration.com:6099/auto-signin?user=&AI_CURRENT_USER_ENC.&password=&AI_CURRENT_PUSER_ENC.&dept_seqno=&AI_BORDERPOST_DEPT_SEQNO.&module_id=00001'', ''wDashBoard_VOA'');'
,p_list_item_icon=>' fa-ticket'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86524796501390537)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'ReEntry'
,p_list_item_link_target=>'javascript:window.open(''http://servapp-uat.bio-immigration.com:6099/auto-signin?user=&AI_CURRENT_USER_ENC.&password=&AI_CURRENT_PUSER_ENC.&dept_seqno=&AI_BORDERPOST_DEPT_SEQNO.&module_id=00005'', ''wDashBoard_REPS'');'
,p_list_item_icon=>'fa-universal-access'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86543577753443995)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Fee and Fine'
,p_list_item_link_target=>'javascript:window.open(''http://servapp-uat.bio-immigration.com:6099/auto-signin?user=&AI_CURRENT_USER_ENC.&password=&AI_CURRENT_PUSER_ENC.&dept_seqno=&AI_BORDERPOST_DEPT_SEQNO.&module_id=00003'', ''wDashBoard_F2F'');'
,p_list_item_icon=>'fa-money'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86525187792390540)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Extend Stay'
,p_list_item_link_target=>'javascript:window.open(''http://servapp-uat.bio-immigration.com:6099/auto-signin?user=&AI_CURRENT_USER_ENC.&password=&AI_CURRENT_PUSER_ENC.&dept_seqno=&AI_BORDERPOST_DEPT_SEQNO.&module_id=00007'', ''wDashBoard_EXT'');'
,p_list_item_icon=>' fa-calendar-times-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86525556358390541)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Prohibit'
,p_list_item_link_target=>'javascript:window.open(''http://servapp-uat.bio-immigration.com:6099/auto-signin?user=&AI_CURRENT_USER_ENC.&password=&AI_CURRENT_PUSER_ENC.&dept_seqno=&AI_BORDERPOST_DEPT_SEQNO.&module_id=00002'', ''wDashBoard_PHB'');'
,p_list_item_icon=>'fa-user-times'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(526098892624025378)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Deport'
,p_list_item_link_target=>'javascript:window.open(''http://servapp-uat.bio-immigration.com:6099/auto-signin?user=&AI_CURRENT_USER_ENC.&password=&AI_CURRENT_PUSER_ENC.&dept_seqno=&AI_BORDERPOST_DEPT_SEQNO.&module_id=00006'', ''wDashBoard_DPT'');'
,p_list_item_icon=>'fa-user-arrow-up'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(526099379627028839)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Crew'
,p_list_item_link_target=>'javascript:window.open(''http://servapp-uat.bio-immigration.com:6099/auto-signin?user=&AI_CURRENT_USER_ENC.&password=&AI_CURRENT_PUSER_ENC.&dept_seqno=&AI_BORDERPOST_DEPT_SEQNO.&module_id=00004'', ''wDashBoard_CRW'');'
,p_list_item_icon=>'fa-crew white'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(86526169994393383)
,p_name=>'APPLICATIONS_SUPPORT'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86526390214393384)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'User Management'
,p_list_item_link_target=>'f?p=1000:1:&APP_SESSION.'
,p_list_item_icon=>' fa-user-circle'
,p_list_item_disp_cond_type=>'FUNCTION_BODY'
,p_list_item_disp_condition=>'return DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''UM_HOME'') > 0;'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86526765263393384)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Master Data'
,p_list_item_link_target=>'f?p=700:1:&APP_SESSION.'
,p_list_item_icon=>' fa-database-edit'
,p_list_item_disp_cond_type=>'FUNCTION_BODY'
,p_list_item_disp_condition=>'return DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''MD_HOME'') > 0;'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35885468152320624268)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Reporting'
,p_list_item_link_target=>'f?p=500:5999:&APP_SESSION.'
,p_list_item_icon=>'fa-file-text-o'
,p_list_item_disp_cond_type=>'FUNCTION_BODY'
,p_list_item_disp_condition=>'return DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''RPT_HOME'') > 0;'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(86534238329397890)
,p_name=>'APPLICATIONS_EXTERNAL'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86534483036397891)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Jira'
,p_list_item_link_target=>'https://dermalog-dev.atlassian.net'
,p_list_item_icon=>' fa-list-alt'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(92828868562413534)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(92882419959413995)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(86717869682664738)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Movements'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(92880957869413871)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(36462422966155960310)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(36462423270365963523)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Change User Password'
,p_list_item_link_target=>'f?p=BMBS:7000:&APP_SESSION.::NO:::'
,p_list_item_icon=>'fa-lock-user'
,p_parent_list_item_id=>wwv_flow_api.id(36462422966155960310)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(92881160382413919)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(36462422966155960310)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(1765782211142189867)
,p_name=>'APPLICATIONS_APPLICATION_2'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    level,',
'    display_value AS LABEL, ',
'    target, ',
'    is_current_list_entry, ',
'    image,',
'    image_attribute,',
'    image_alt_attribute,',
'    attribute1,',
'    attribute2,',
'    attribute3,',
'    attribute4,',
'    attribute5,',
'    attribute6,',
'    attribute7',
'    attribute8,',
'    attribute9,',
'    attribute10',
'FROM dl_common.apex_lists',
'WHERE list_name = ''APPLICATIONS_APPLICATION''',
'START WITH parent_key_value IS NULL ',
'CONNECT BY PRIOR key_value = parent_key_value',
'ORDER siblings BY key_value;'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(35878634176450505603)
,p_name=>'APPLICATIONS_MAIN_2'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    level,',
'    display_value AS LABEL, ',
'    target, ',
'    is_current_list_entry, ',
'    image,',
'    image_attribute,',
'    image_alt_attribute,',
'    attribute1,',
'    attribute2,',
'    attribute3,',
'    attribute4,',
'    attribute5,',
'    attribute6,',
'    attribute7',
'    attribute8,',
'    attribute9,',
'    attribute10',
'FROM dl_common.apex_lists',
'WHERE list_name = ''APPLICATIONS_MAIN''',
'AND DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER), auth_object_id) > 0',
'START WITH parent_key_value IS NULL ',
'CONNECT BY PRIOR key_value = parent_key_value',
'ORDER siblings BY key_value;'))
,p_list_status=>'PUBLIC'
);
end;
/
