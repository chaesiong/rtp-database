prompt --application/pages/page_00091
begin
wwv_flow_api.create_page(
 p_id=>91
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Edit Sea Route'
,p_page_mode=>'NORMAL'
,p_step_title=>'Edit Sea Route'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180730111238'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(465119834244264688)
,p_plug_name=>'Edit Sea Route'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
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
 p_id=>wwv_flow_api.id(455845024166552741)
,p_plug_name=>'Stops'
,p_parent_plug_id=>wwv_flow_api.id(465119834244264688)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(455845125742552742)
,p_plug_name=>'Add Stop'
,p_parent_plug_id=>wwv_flow_api.id(455845024166552741)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(465150894769385337)
,p_plug_name=>'Stops Report'
,p_parent_plug_id=>wwv_flow_api.id(455845024166552741)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select s.*, case when s.STOPTYPE = 2 then ''block'' else ''none'' end as DISPLAY_LINK',
'from SEAROUTESTOPS s',
'where s.routeid is null and UPDATEBY = v(''APP_USER'')',
'order by s.stoptype, s.stopnum'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(465150903185385338)
,p_name=>'Stops'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>44229304612811521
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(465152081388385343)
,p_db_column_name=>'STOPTYPE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Stop Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(465610319298999594)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(465152479016385345)
,p_db_column_name=>'STOPTARGETID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Stop Target '
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(465452318329460673)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(455846097517552751)
,p_db_column_name=>'STOPNUM'
,p_display_order=>34
,p_column_identifier=>'G'
,p_column_label=>'Stop Num'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(465598260010660183)
,p_db_column_name=>'DISPLAY_LINK'
,p_display_order=>37
,p_column_identifier=>'J'
,p_column_label=>'Display Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(455846852236552759)
,p_db_column_name=>'ID'
,p_display_order=>47
,p_column_identifier=>'K'
,p_column_label=>'Delete'
,p_column_link=>'javascript:$.event.trigger(''DA_DeleteStop'',[''#ID#'']);'
,p_column_linktext=>'Delete'
,p_column_link_attr=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch" style="display:#DISPLAY_LINK#"'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(455846936484552760)
,p_db_column_name=>'ROUTEID'
,p_display_order=>57
,p_column_identifier=>'L'
,p_column_label=>'Routeid'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(455847024648552761)
,p_db_column_name=>'UPDATED'
,p_display_order=>67
,p_column_identifier=>'M'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(455847136212552762)
,p_db_column_name=>'UPDATEBY'
,p_display_order=>77
,p_column_identifier=>'N'
,p_column_label=>'Updateby'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(465152805422385771)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'442313'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'STOPTYPE:STOPNUM:STOPTARGETID:ID:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(465120391561264689)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(465119834244264688)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P91_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(465120529055264689)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(465119834244264688)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(455845575806552746)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(455845125742552742)
,p_button_name=>'ADD_STOP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Stop'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(465120276141264689)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(465119834244264688)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P91_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(465607527495880960)
,p_branch_name=>'Goto Page 90'
,p_branch_action=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(455845330897552744)
,p_name=>'P91_STOP_PORT'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(455845125742552742)
,p_item_default=>'&AI_DEFAULT_LOCATION.'
,p_prompt=>'Stop Port'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select UNLOCODE1 || '' ''|| UNLOCODE2 ||  '' - '' ||  NAME_LAT || '' ('' || COUNTRY_NAME || '')''  d',
'  , ID r',
'from V_SEAPORTS;'))
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_14=>'Y'
,p_attribute_15=>'20'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(455845404854552745)
,p_name=>'P91_STOP_NUM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(455845125742552742)
,p_prompt=>'Stop Number'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(455846261249552753)
,p_name=>'P91_DELETE_STOP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(465150894769385337)
,p_source=>'DELETE_STOP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(465122548737264715)
,p_name=>'P91_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(465119834244264688)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(465122948836264792)
,p_name=>'P91_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(465119834244264688)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>64
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(465123231539264798)
,p_name=>'P91_AGENT_ID'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(465119834244264688)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Agent Id'
,p_source=>'AGENT_ID'
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
,p_cSize=>32
,p_cMaxlength=>20
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(465153442118395350)
,p_name=>'P91_ORIGIN'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(465119834244264688)
,p_item_default=>'&AI_DEFAULT_LOCATION.'
,p_prompt=>'Origin'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select UNLOCODE1 || '' ''|| UNLOCODE2 ||  '' - '' ||  NAME_LAT || '' ('' || COUNTRY_NAME || '')''  d',
'  , ID r',
'from V_SEAPORTS;'))
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_14=>'Y'
,p_attribute_15=>'20'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(465153700245399697)
,p_name=>'P91_DESTINATION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(465119834244264688)
,p_item_default=>'&AI_DEFAULT_LOCATION.'
,p_prompt=>'Destination'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select UNLOCODE1 || '' ''|| UNLOCODE2 ||  '' - '' ||  NAME_LAT || '' ('' || COUNTRY_NAME || '')''  d',
'  , ID r',
'from V_SEAPORTS',
'/*where UNLOCODE1 = NVL(:P91_DESTINATION_COUNTRY, UNLOCODE1)*/',
';'))
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_14=>'Y'
,p_attribute_15=>'20'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(465634745676440213)
,p_name=>'P91_DIRECTIONFLG'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(465119834244264688)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Direction'
,p_source=>'DIRECTIONFLG'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DIRECTION'
,p_lov=>'.'||wwv_flow_api.id(566472220048858865)||'.'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(465606705861846653)
,p_computation_sequence=>10
,p_computation_item=>'P91_ORIGIN'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STOPTARGETID',
'from SEAROUTESTOPS',
'where ROUTEID = :P91_ID and stoptype = 1;'))
,p_compute_when=>'P91_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(465607002314851379)
,p_computation_sequence=>10
,p_computation_item=>'P91_DESTINATION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STOPTARGETID',
'from SEAROUTESTOPS',
'where ROUTEID = :P91_ID and stoptype = 3;'))
,p_compute_when=>'P91_ID'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(455846789087552758)
,p_computation_sequence=>20
,p_computation_item=>'P91_STOP_NUM'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) + 1',
'from SEAROUTESTOPS',
'where ROUTEID is null and UPDATEBY = v(''APP_USER'') and STOPTYPE = 2;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(455845674689552747)
,p_name=>'ADD_STOP Click'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(455845575806552746)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455845709586552748)
,p_event_id=>wwv_flow_api.id(455845674689552747)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'INSERT into SEAROUTESTOPS (ID, ROUTEID, STOPTYPE, STOPNUM,',
'STOPTARGETID) ',
'VALUES(sys_guid(),null, 2, :P91_STOP_NUM, :P91_STOP_PORT);',
'',
'select count(*) + 1',
'into :P91_STOP_NUM',
'from SEAROUTESTOPS ',
'where (ROUTEID is null) and STOPTYPE = 2;',
'END;'))
,p_attribute_02=>'P91_STOP_PORT,P91_STOP_NUM'
,p_attribute_03=>'P91_STOP_NUM'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455846184087552752)
,p_event_id=>wwv_flow_api.id(455845674689552747)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(465150894769385337)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(465554989889256945)
,p_name=>'DELETE Click'
,p_event_sequence=>20
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DA_DeleteStop'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(465582761715440088)
,p_event_id=>wwv_flow_api.id(465554989889256945)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P91_DELETE_STOP_ID'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s(''P91_DELETE_STOP_ID'', this.data);',
'',
'apex.server.process ( "SAVE_HIDDEN_VALUE_IN_SESSION_STATE", {',
'  x01: "set_session_state",',
'  pageItems: "#P91_DELETE_STOP_ID"',
'  }, {dataType: ''text''} );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(465561378287260290)
,p_event_id=>wwv_flow_api.id(465554989889256945)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM SEAROUTESTOPS ',
'where :P91_DELETE_STOP_ID is not null and ID = :P91_DELETE_STOP_ID;'))
,p_attribute_02=>'P91_DELETE_STOP_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(465565977132295573)
,p_event_id=>wwv_flow_api.id(465554989889256945)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(465150894769385337)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(465124039994264810)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SEAROUTES'
,p_attribute_02=>'SEAROUTES'
,p_attribute_03=>'P91_ID'
,p_attribute_04=>'ID'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(465585099645577602)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CREATE_ROUTE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT into SEAROUTES (ID, NAME, AGENT_ID, DIRECTIONFLG)',
'values (sys_guid(), :P91_NAME, :P91_AGENT_ID, :P91_DIRECTIONFLG) returning ID into :P91_ID;',
'',
'insert into SEAROUTESTOPS (ID, STOPTARGETID, STOPTYPE, ROUTEID)',
'values(sys_guid(), :P91_ORIGIN, 1, null);',
'',
'insert into SEAROUTESTOPS (ID, STOPTARGETID, STOPTYPE, ROUTEID)',
'values(sys_guid(), :P91_DESTINATION, 3, null);',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(465585483057611927)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SAVE_ROUTE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE SEAROUTES',
'SET NAME = :P91_NAME',
'  , AGENT_ID = :P91_AGENT_ID',
'  , DIRECTIONFLG = :P91_DIRECTIONFLG',
'where ID = :P91_ID;',
'',
'UPDATE SEAROUTESTOPS',
'SET STOPTARGETID = :P91_ORIGIN',
'where STOPTYPE = 1',
'  and ROUTEID is null and UPDATEBY = v(''APP_USER'');',
'',
'UPDATE SEAROUTESTOPS',
'SET STOPTARGETID = :P91_DESTINATION',
'where STOPTYPE = 3',
'  and ROUTEID is null and UPDATEBY = v(''APP_USER'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(465605472695764299)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SAVE_STOPS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM SEAROUTESTOPS',
'WHERE ROUTEID = :P91_ID;',
'',
'UPDATE SEAROUTESTOPS',
'SET ROUTEID = :P91_ID',
'where ROUTEID is null and UPDATEBY = v(''APP_USER'');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST in (''CREATE'',''SAVE'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(465125244167264816)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(465605965174787374)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_PREPARE_SEAROUTESTOPS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE from SEAROUTESTOPS',
'where routeid is null and updateby = v(''APP_USER'');',
'',
'insert into SEAROUTESTOPS (ID, ROUTEID, STOPTYPE, STOPTARGETID, STOPNUM)',
'select sys_guid(), null, STOPTYPE, STOPTARGETID, STOPNUM',
'FROM SEAROUTESTOPS ',
'where :P91_ID is not null and ROUTEID = :P91_ID;'))
);
end;
/
