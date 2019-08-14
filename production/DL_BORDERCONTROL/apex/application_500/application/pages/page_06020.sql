prompt --application/pages/page_06020
begin
wwv_flow_api.create_page(
 p_id=>6020
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Report W/Items'
,p_page_mode=>'NORMAL'
,p_step_title=>'Report W/Items'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Report W/Items'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'$("#REG_HIDDEN3").hide()'
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180730113443'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(853846695499358073)
,p_plug_name=>'REG_HIDDEN3'
,p_region_name=>'REG_HIDDEN3'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(853847564832358076)
,p_plug_name=>'Report W/Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select IPADDRESS,',
'       DEFAULTEXITFLG,',
'       TRNSPRTMODEID,',
'       ACTIVE,',
'       ID,',
'       ISGATE,',
'       POS_X,',
'       POS_Y,',
'       WIDTH,',
'       HEIGHT,',
'       FLOOR_ID',
'  from VW_ITEMS',
'',
'where ID=:P6020_SEARCH;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(853847936299358079)
,p_name=>'Report 1'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'id'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:6030:&SESSION.::&DEBUG.::P6030_ID:#ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>576492767139398536
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853848008283358088)
,p_db_column_name=>'IPADDRESS'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Ipaddress'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853848396182358094)
,p_db_column_name=>'DEFAULTEXITFLG'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Defaultexitflg'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(851444998602996918)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853848798884358095)
,p_db_column_name=>'TRNSPRTMODEID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Trnsprtmodeid'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853849173094358097)
,p_db_column_name=>'ACTIVE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Active'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(851458371107013713)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853849659589358098)
,p_db_column_name=>'ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Id'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853850066141358099)
,p_db_column_name=>'ISGATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Isgate'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(851547429290422964)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853850463985358100)
,p_db_column_name=>'POS_X'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Pos X'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853850795139358104)
,p_db_column_name=>'POS_Y'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Pos Y'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853851242376358105)
,p_db_column_name=>'WIDTH'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Width'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853851607712358106)
,p_db_column_name=>'HEIGHT'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Height'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(853852046785358107)
,p_db_column_name=>'FLOOR_ID'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Floor Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(851385453482855693)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(853852444921358110)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5764973'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'IPADDRESS:DEFAULTEXITFLG:TRNSPRTMODEID:ACTIVE:ID:ISGATE:POS_X:POS_Y:WIDTH:HEIGHT:FLOOR_ID'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(853853298627358123)
,p_plug_name=>'Item Photo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'',
'DECLARE',
'',
'itemid integer;',
'images varchar2(500);',
'',
'',
'',
'',
'',
'BEGIN',
'',
'',
'SELECT isgate into itemid FROM  VW_ITEMS where id=:P6020_SEARCH;',
'',
'          ',
'if itemid=0 then',
'images:=''#APP_IMAGES#checkpoint.jpg'';',
' ',
'',
'elsif itemid=1 then',
'images:=''#APP_IMAGES#egategreen.jpg'';',
'   ',
'elsif itemid=2 then',
'images:=''#APP_IMAGES#2arrowdown.jpg'';',
'',
'elsif itemid=3 then',
'images:=''#APP_IMAGES#3arrowup.jpg'';',
'',
'',
'elsif itemid=4 then',
'images:=''#APP_IMAGES#4arrowleft.jpg'';',
'',
'elsif itemid=5 then',
'images:=''#APP_IMAGES#5arrowright.jpg'';',
'',
'else ',
'images:=''#APP_IMAGES#6walls.jpg '';',
'',
'end if;',
'',
'htp.p(''<div><img src='' ||  images  || '' alt="" style="width:150px" /></div>'');',
'            ',
'            ',
'            ',
'           ',
'   ',
'',
'',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(853002912179421176)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(853847564832358076)
,p_button_name=>'Cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(853852954680358122)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(853847564832358076)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Delete'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>'P6020_SEARCH'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(853854198754358131)
,p_branch_action=>'f?p=&APP_ID.:6010:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(853847125629358074)
,p_name=>'P6020_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(853846695499358073)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(853853672341358126)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE from  VW_ITEMS ',
'WHERE ID = :P6020_SEARCH;'))
,p_process_error_message=>'Error Deleting Items'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(853852954680358122)
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Item Succesfully deleted'
);
end;
/
