prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Enter Flight Data'
,p_page_mode=>'MODAL'
,p_step_title=>'Enter Flight Data'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#ApexConfirm.js',
'#WORKSPACE_IMAGES#GenericFunctions.js'))
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_css_file_urls=>'#WORKSPACE_IMAGES#ApexConfirm.css'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_height=>'550'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190722182636'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(551273276180462704)
,p_plug_name=>'Edit Flight Data'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(940696112753088646)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(551273920994462705)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(940696112753088646)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P21_FLGHTID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_button_css_classes=>'deletebutton'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(551273679377462705)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(940696112753088646)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P21_FLGHTID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(584698635612810208)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(940696112753088646)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finish'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>':P21_FLGHT is null and :P21_FLGHTTOPAIR is not null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(551273812887462705)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(940696112753088646)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P21_FLGHTID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(874443506656362787)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(940696112753088646)
,p_button_name=>'Save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(551273956300462705)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(940696112753088646)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(551275620151462706)
,p_branch_action=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137871721950874845)
,p_name=>'P21_TIMEDEPARTURE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flight Start Date'
,p_format_mask=>'DD/MM/YYYY HH12:MI AM'
,p_source=>'TIMEDEPARTURE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-50:+20'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137871811130874846)
,p_name=>'P21_TIMEARRIVAL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flight End Date'
,p_format_mask=>'DD/MM/YYYY HH12:MI AM'
,p_source=>'TIMEARRIVAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-0:+20'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137871991204874847)
,p_name=>'P21_ACTIVE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Active'
,p_source=>'ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_YESNO'
,p_lov=>'.'||wwv_flow_api.id(558108972921270797)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148146391845128801)
,p_name=>'P21_INS_TERMINAL'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_item_default=>':AI_TERMINAL_ID'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Terminal'
,p_source=>'INS_TERMINAL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(name, name$dlc) d,',
'   ID r',
'FROM DL_BORDERCONTROL.TERMINALS$LC',
'WHERE active = 1 ',
'AND border_post = NVL(:P21_INS_BORDERPOST, border_post)',
'ORDER BY name',
';'))
,p_lov_cascade_parent_items=>'P21_INS_BORDERPOST'
,p_ajax_items_to_submit=>'P21_INS_BORDERPOST'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148146459173128802)
,p_name=>'P21_INS_BORDERPOST'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_item_default=>':AI_BORDERPOST_ID'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Borderpost'
,p_source=>'INS_BORDERPOST'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(NAME,NAME$DLC) d,',
'   key_value r',
'FROM',
'    DL_BORDERCONTROL.BORDERPOSTS$LC',
'    where IS_ACTIVE = ''Y''',
'    order by NAME',
'    ;'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(551275993169462706)
,p_name=>'P21_FLGHTID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_source=>'FLGHTID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(551276359952462718)
,p_name=>'P21_FLIGHTNUM'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flight Number'
,p_source=>'FLIGHTNUM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>20
,p_tag_attributes=>'onkeydown="upperCaseF(this)" autofocus'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(551276828158462718)
,p_name=>'P21_ORIGINAIRPORTID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Origin Airport'
,p_source=>'ORIGINAIRPORTID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'AIRPORTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   un_locode|| '' - '' ||NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.PORTS$LC',
'    where IS_ACTIVE=''Y'' AND IS_AIRPORT=1',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(551277178242462718)
,p_name=>'P21_DESTINAIRPORTID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Destination Airport'
,p_source=>'DESTINAIRPORTID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'AIRPORTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   un_locode|| '' - '' ||NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.PORTS$LC',
'    where IS_ACTIVE=''Y'' AND IS_AIRPORT=1',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(584693299791585908)
,p_name=>'P21_AGENTID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Airline'
,p_source=>'AGENTID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CARRIERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    iata',
'     || '' - ''',
'     || nvl(display_value,display_value$dlc) d,',
'    num_value r',
'FROM',
'    dl_common.carriers$lc',
'WHERE',
'        is_active = ''Y''',
'    AND',
'        is_air_carrier = 1',
'    AND',
'        is_sea_carrier = 0',
'    AND',
'        is_rail_carrier = 0',
'    AND',
'        is_road_carrier = 0',
'ORDER BY display_order;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(584693639644592973)
,p_name=>'P21_DIRECTIONFLG'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_prompt=>'Direction'
,p_source=>'DIRECTIONFLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(584695792809679923)
,p_name=>'P21_FLGHTTOPAIR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(551273276180462704)
,p_item_default=>'null'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(883172685522766370)
,p_validation_name=>'VAL_UNQ_FLIGHTNO'
,p_validation_sequence=>15
,p_validation=>'select 1 from flights where flightnum = :P21_FLIGHTNUM and (:P21_FLGHTID is null or :P21_FLGHTID <> flghtid)'
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Flight Number must be unique!'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(584703787232132931)
,p_process_sequence=>50
,p_process_point=>'AFTER_BOX_BODY'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'ClearFlghtToPair'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P21_FLGHTTOPAIR'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106445556134214202)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Flights'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :REQUEST = ''CREATE'' then',
'     insert into DL_BORDERCONTROL.FLIGHTS (',
'        FLIGHTNUM',
'        ,AGENTID',
'        ,DIRECTIONFLG',
'        ,ORIGINAIRPORTID',
'        ,DESTINAIRPORTID',
'        ,TIMEDEPARTURE',
'        ,TIMEARRIVAL',
'        ,ACTIVE',
'        ,INS_TERMINAL',
'        ,INS_BORDERPOST',
'     ) values (',
'        :P21_FLIGHTNUM',
'        ,:P21_AGENTID',
'        ,:P21_DIRECTIONFLG',
'        ,:P21_ORIGINAIRPORTID',
'        ,:P21_DESTINAIRPORTID',
'        ,TO_DATE(:P21_TIMEDEPARTURE, ''DD/MM/YYYY HH12:MI AM'')',
'        ,TO_DATE(:P21_TIMEARRIVAL, ''DD/MM/YYYY HH12:MI AM'')',
'        ,:P21_ACTIVE',
'        ,NVL(:P21_INS_TERMINAL, :AI_TERMINAL_ID)',
'        ,NVL(:P21_INS_BORDERPOST, :AI_BORDERPOST_ID)',
'     );',
'     ',
'  elsif :REQUEST = ''SAVE'' then',
'    update DL_BORDERCONTROL.FLIGHTS set',
'      FLIGHTNUM = :P21_FLIGHTNUM',
'      ,AGENTID = :P21_AGENTID',
'      ,DIRECTIONFLG = :P21_DIRECTIONFLG',
'      ,ORIGINAIRPORTID = :P21_ORIGINAIRPORTID',
'      ,DESTINAIRPORTID = :P21_DESTINAIRPORTID',
'      ,TIMEDEPARTURE = TO_DATE(:P21_TIMEDEPARTURE, ''DD/MM/YYYY HH12:MI AM'')',
'      ,TIMEARRIVAL = TO_DATE(:P21_TIMEARRIVAL, ''DD/MM/YYYY HH12:MI AM'')',
'      ,ACTIVE = :P21_ACTIVE',
'      ,INS_TERMINAL = NVL(:P21_INS_TERMINAL, :AI_TERMINAL_ID)',
'      ,INS_BORDERPOST = NVL(:P21_INS_BORDERPOST, :AI_BORDERPOST_ID)',
'    where FLGHTID = :P21_FLGHTID;',
'    ',
'  elsif :REQUEST = ''DELETE'' then',
'    delete DL_BORDERCONTROL.FLIGHTS',
'    where FLGHTID = :P21_FLGHTID;',
'',
'  end if;',
'  commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(551279250911462719)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of FLIGHTS'
,p_attribute_02=>'FLIGHTS'
,p_attribute_03=>'P21_FLGHTID'
,p_attribute_04=>'FLGHTID'
,p_attribute_09=>'P21_FLGHTID'
,p_attribute_11=>'I:U:D'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(551279632001462719)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(551273920994462705)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(551278800799462719)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from FLIGHTS'
,p_attribute_02=>'FLIGHTS'
,p_attribute_03=>'P21_FLGHTID'
,p_attribute_04=>'FLGHTID'
,p_process_when=>'P21_FLGHTTOPAIR'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
