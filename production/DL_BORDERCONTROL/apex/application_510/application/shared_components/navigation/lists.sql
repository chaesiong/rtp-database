prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(45913306685927841)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(45966858082928302)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91638825820883228)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Visa on Arrival'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.:IR_VISA_ON_ARRIVAL:&DEBUG.:200,RIR:P200_REPORT:VISA_ON_ARRIVAL:'
,p_parent_list_item_id=>wwv_flow_api.id(45966858082928302)
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P200_REPORT = ''VISA_ON_ARRIVAL'''
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91639324135889282)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Departure Information'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.:IR_DEPARTURE_INFORMATION:&DEBUG.:200,RIR:P200_REPORT:DEPARTURE_INFORMATION:'
,p_parent_list_item_id=>wwv_flow_api.id(45966858082928302)
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P200_REPORT = ''DEPARTURE_INFORMATION'''
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91639620359893105)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Daily statistics'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.:IR_DAILY_STATISTICS:&DEBUG.:200,RIR:P200_REPORT:DAILY_STATISTICS:'
,p_parent_list_item_id=>wwv_flow_api.id(45966858082928302)
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P200_REPORT = ''DAILY_STATISTICS'''
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91639982267896529)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Cancel payment'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.:IR_CANCEL_PAYMENT:&DEBUG.:200,RIR:P200_REPORT:CANCEL_PAYMENT:'
,p_parent_list_item_id=>wwv_flow_api.id(45966858082928302)
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P200_REPORT = ''CANCEL_PAYMENT'''
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91640698986902224)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Daily payment'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.:IR_DAILY_PAYMENT:&DEBUG.:200,RIR:P200_REPORT:DAILY_PAYMENT:'
,p_parent_list_item_id=>wwv_flow_api.id(45966858082928302)
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P200_REPORT = ''DAILY_PAYMENT'''
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(45965395992928178)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(67798553470319305)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Save'
,p_list_item_link_target=>'javascript: void(0);'
,p_list_item_icon=>'fa-check'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>':APP_PAGE_ID = 1 AND NVL(:P1_APPROVAL_STATUS, ''N'') != ''CANCELED'''
,p_list_text_01=>'F12'
,p_list_text_03=>'p1_buttonSave'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(67811408169411509)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Search'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database-search'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_EQUALS_CONDITION'
,p_list_item_disp_condition=>'1'
,p_list_text_01=>'F3'
,p_list_text_03=>'p1_buttonSearch'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(67800213166322298)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Print Preview'
,p_list_item_link_target=>'javascript: void(0);'
,p_list_item_icon=>'fa-print'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>':APP_PAGE_ID = 1'
,p_list_text_01=>'F7'
,p_list_text_03=>'p1_buttonPrintPreview'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(67799504851321360)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Take photo'
,p_list_item_link_target=>'javascript: void(0);'
,p_list_item_icon=>'fa-photo'
,p_list_item_disp_cond_type=>'PLSQL_EXPRESSION'
,p_list_item_disp_condition=>':APP_PAGE_ID = 1 AND NVL(:P1_APPROVAL_STATUS, ''N'') != ''CANCELED'''
,p_list_text_01=>'F11'
,p_list_text_03=>'p1_buttonTakePhoto'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(67811651590412767)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Cancel'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.:RESTART:&DEBUG.:1:::'
,p_list_item_icon=>'fa-trash'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_EQUALS_CONDITION'
,p_list_item_disp_condition=>'1'
,p_list_text_01=>'F8'
,p_list_text_03=>'p1_buttonCancel'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91701088875467807)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:210:::'
,p_list_item_icon=>'fa-wrench'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_EQUALS_CONDITION'
,p_list_item_disp_condition=>'1'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91701390724471028)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Add Visa on Arrival'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1:::'
,p_list_item_icon=>'fa-plus'
,p_list_item_disp_cond_type=>'CURRENT_PAGE_IN_CONDITION'
,p_list_item_disp_condition=>'200,210'
,p_list_item_current_type=>'NEVER'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(45965598505928226)
,p_list_item_display_sequence=>9999
,p_list_item_link_text=>'Log Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(47050276203205705)
,p_name=>'PASS_READER_MANUAL_INPUT'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(47050488070205712)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Scan Passport'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(47050840711205725)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Manual Input'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
