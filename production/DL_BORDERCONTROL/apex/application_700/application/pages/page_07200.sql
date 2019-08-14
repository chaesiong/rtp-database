prompt --application/pages/page_07200
begin
wwv_flow_api.create_page(
 p_id=>7200
,p_user_interface_id=>wwv_flow_api.id(165585018976055186)
,p_name=>'Offline Mode'
,p_page_mode=>'NORMAL'
,p_step_title=>'Offline Mode'
,p_step_sub_title=>'Offline Mode'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#available_versions_control_panel{',
'    display: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(75628207662254518)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'SUPERADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190705150055'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69622618138277860556)
,p_plug_name=>'Available offline versions'
,p_region_name=>'available_versions'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(165558797155055065)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select key_value',
'      ,dbms_lob.getlength(file_blob) as offline_file',
'      ,file_name',
'      ,file_mimetype',
'      ,case when is_active = ''Y'' then ''fa-check-circle-o'' else ''fa-minus-circle'' end as active',
'      ,file_version                  as version_',
'      ,case when is_active = ''Y'' then ''fa-box-arrow-in-north apex_disabled'' else ''fa-box-arrow-in-north'' end as set_as_active',
'      ,case when is_active = ''Y'' then ''fa-trash-o apex_disabled'' else ''fa-trash-o'' end as delete_',
'      ,download_last                 as last_download',
'      ,download_total                as total_downloads',
'      ,ins_at                        as inserted_at',
'      ,ins_by                        as inserted_by',
'      ,dml_at                        as changed_at',
'      ,dml_by                        as changed_by',
'from dl_bordercontrol.offline_mode',
'order by file_version desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(69622618275473860557)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>1000
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'E1MSTAHL'
,p_internal_uid=>69622618275473860557
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809396284805016974)
,p_db_column_name=>'KEY_VALUE'
,p_display_order=>10
,p_column_identifier=>'Y'
,p_column_label=>'Key value'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809396665694016974)
,p_db_column_name=>'OFFLINE_FILE'
,p_display_order=>20
,p_column_identifier=>'Z'
,p_column_label=>'Offline file'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:OFFLINE_MODE:FILE_BLOB:KEY_VALUE::FILE_MIMETYPE:FILE_NAME:DML_AT::attachment::DL_BORDERCONTROL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809395483759016974)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'V'
,p_column_label=>'File name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809395860737016974)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>40
,p_column_identifier=>'W'
,p_column_label=>'File mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809391472484016960)
,p_db_column_name=>'ACTIVE'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Active'
,p_column_html_expression=>'<span class="fa #ACTIVE#"></span>'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809393875159016963)
,p_db_column_name=>'VERSION_'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>'Version '
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809392618210016962)
,p_db_column_name=>'SET_AS_ACTIVE'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Set as active'
,p_column_html_expression=>'<span data="#KEY_VALUE#" class="fa #SET_AS_ACTIVE#" style="cursor: pointer"></span>'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809393049893016963)
,p_db_column_name=>'DELETE_'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>'Delete'
,p_column_html_expression=>'<span class="fa #DELETE_#" style="cursor: pointer;" data="#KEY_VALUE#"></span>'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809394298157016964)
,p_db_column_name=>'LAST_DOWNLOAD'
,p_display_order=>90
,p_column_identifier=>'R'
,p_column_label=>'Last download'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809393441809016963)
,p_db_column_name=>'TOTAL_DOWNLOADS'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Total downloads'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809394673348016964)
,p_db_column_name=>'INSERTED_AT'
,p_display_order=>110
,p_column_identifier=>'S'
,p_column_label=>'Inserted at'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809391826259016962)
,p_db_column_name=>'INSERTED_BY'
,p_display_order=>120
,p_column_identifier=>'E'
,p_column_label=>'Inserted by'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809395097703016973)
,p_db_column_name=>'CHANGED_AT'
,p_display_order=>130
,p_column_identifier=>'T'
,p_column_label=>'Changed at'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(34809392282735016962)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>140
,p_column_identifier=>'G'
,p_column_label=>'Changed by'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69634191218782524429)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'348093970'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'OFFLINE_FILE:ACTIVE:VERSION_:SET_AS_ACTIVE:DELETE_:FILE_NAME:LAST_DOWNLOAD:TOTAL_DOWNLOADS:INSERTED_AT:INSERTED_BY:CHANGED_AT:CHANGED_BY:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34849608476960892319)
,p_report_id=>wwv_flow_api.id(69634191218782524429)
,p_name=>'active_y'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ACTIVE'
,p_operator=>'contains'
,p_expr=>'fa-check'
,p_condition_sql=>' (case when (upper("ACTIVE") like ''%''||upper(#APXWS_EXPR#)||''%'') then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''fa-check''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'GREEN'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34849608785539892319)
,p_report_id=>wwv_flow_api.id(69634191218782524429)
,p_name=>'active_n'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ACTIVE'
,p_operator=>'contains'
,p_expr=>'fa-minus'
,p_condition_sql=>' (case when (upper("ACTIVE") like ''%''||upper(#APXWS_EXPR#)||''%'') then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''fa-minus''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_font_color=>'RED'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34849609187553892320)
,p_report_id=>wwv_flow_api.id(69634191218782524429)
,p_name=>'dml_at'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CHANGED_AT'
,p_operator=>'is not null'
,p_condition_sql=>' (case when ("CHANGED_AT" is not null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#E6E6E6'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34849609561024892320)
,p_report_id=>wwv_flow_api.id(69634191218782524429)
,p_name=>'dml_by'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CHANGED_BY'
,p_operator=>'is not null'
,p_condition_sql=>' (case when ("CHANGED_BY" is not null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#E6E6E6'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34849609922164892320)
,p_report_id=>wwv_flow_api.id(69634191218782524429)
,p_name=>'ins_at'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'INSERTED_AT'
,p_operator=>'is not null'
,p_condition_sql=>' (case when ("INSERTED_AT" is not null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#E6E6E6'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34849610303537892321)
,p_report_id=>wwv_flow_api.id(69634191218782524429)
,p_name=>'ins_by'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'INSERTED_BY'
,p_operator=>'is not null'
,p_condition_sql=>' (case when ("INSERTED_BY" is not null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#E6E6E6'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34849610735712892321)
,p_report_id=>wwv_flow_api.id(69634191218782524429)
,p_name=>'last_download'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'LAST_DOWNLOAD'
,p_operator=>'is not null'
,p_condition_sql=>' (case when ("LAST_DOWNLOAD" is not null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#F2F2F2'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(34849611149051892321)
,p_report_id=>wwv_flow_api.id(69634191218782524429)
,p_name=>'total_download'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'TOTAL_DOWNLOADS'
,p_operator=>'is not null'
,p_condition_sql=>' (case when ("TOTAL_DOWNLOADS" is not null) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# #APXWS_OP_NAME#'
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#F2F2F2'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69622619195804860566)
,p_plug_name=>'Upload new version'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(165558797155055065)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(34809400919764016990)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(69622619195804860566)
,p_button_name=>'UPLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(165579930586055115)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-cloud-upload'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>3
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34809401360128016991)
,p_name=>'P7200_FILE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(69622619195804860566)
,p_prompt=>'Zip file'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_tag_attributes=>'accept=".zip"'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(165579472946055112)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'N'
,p_attribute_11=>'application/zip'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34809401785704016993)
,p_name=>'P7200_ACTIVE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(69622619195804860566)
,p_item_default=>'Y'
,p_prompt=>'Set active'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(165579472946055112)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(34809402193154016995)
,p_name=>'P7200_VERSION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(69622619195804860566)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Version no.'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(file_version) + 1',
'from dl_bordercontrol.offline_mode'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(165579472946055112)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(34809402613433016999)
,p_validation_name=>'Check for zip file'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- check if the file is a zip file',
'declare',
'    l_mimetype apex_application_temp_files.mime_type%type;',
'begin',
'    select mime_type',
'    into l_mimetype',
'    from apex_application_temp_files',
'    where name = :P7200_FILE;',
'',
'    if l_mimetype in (''application/zip'', ''application/octet-stream'', ''application/x-zip-compressed'', ''multipart/x-zip'')',
'    then return true;',
'    else return false;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'The provided file is not a zip file'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(34809401360128016991)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34809404194494017002)
,p_name=>'On click delete'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#available_versions span.fa-trash-o'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809404685852017003)
,p_event_id=>wwv_flow_api.id(34809404194494017002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'You are about to delete this entry.'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809405146153017003)
,p_event_id=>wwv_flow_api.id(34809404194494017002)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#available_versions'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809405615923017004)
,p_event_id=>wwv_flow_api.id(34809404194494017002)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// get data element, since it contains the id of the entry',
'var delData = this.triggeringElement.getAttribute(''data'');',
'',
'// trigger server process to delete the entry',
'apex.server.process(''DELETE_OFFLINE_BMBS''',
'                   ,{x01: delData}',
'                   ,{dataType: "text",',
'                     async: false}',
'                );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809406175143017004)
,p_event_id=>wwv_flow_api.id(34809404194494017002)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#available_versions'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809406631067017004)
,p_event_id=>wwv_flow_api.id(34809404194494017002)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(69622618138277860556)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(34809407055448017004)
,p_name=>'On click set active'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#available_versions span.fa-box-arrow-in-north'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809407552499017004)
,p_event_id=>wwv_flow_api.id(34809407055448017004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#available_versions'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809408000056017005)
,p_event_id=>wwv_flow_api.id(34809407055448017004)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// get data element, since it contains the id of the entry',
'var activateData = this.triggeringElement.getAttribute(''data'');',
'',
'// trigger server process to deactivate the old and activate the new entry',
'apex.server.process(''SET_ACTIVE_OFFLINE_BMBS''',
'                   ,{x01: activateData}',
'                   ,{dataType: "text",',
'                     async: false}',
'                );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809408503605017005)
,p_event_id=>wwv_flow_api.id(34809407055448017004)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#available_versions'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(34809409005876017005)
,p_event_id=>wwv_flow_api.id(34809407055448017004)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(69622618138277860556)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34809402993655017001)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPLOAD_FILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    -- if new file is going to be active then deactivate all others',
'    if :P7200_ACTIVE = ''Y'' then',
'        update dl_bordercontrol.offline_mode',
'        set is_active = ''N''',
'        where is_active = ''Y'';',
'    end if;',
'',
'    -- insert new offline version',
'    insert into dl_bordercontrol.offline_mode(file_blob',
'                                             ,file_name',
'                                             ,file_mimetype',
'                                             ,is_active',
'                                             ,file_version)',
'    values((select blob_content from apex_application_temp_files where name = :P7200_FILE)',
'          ,(select filename from apex_application_temp_files where name = :P7200_FILE)',
'          ,(select mime_type from apex_application_temp_files where name = :P7200_FILE)',
'          ,:P7200_ACTIVE',
'          ,:P7200_VERSION);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'The file has been uploaded'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34809403393068017001)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_OFFLINE_BMBS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- delete offline version when icon is clicked',
'begin',
'    delete from dl_bordercontrol.offline_mode',
'    where key_value = apex_application.g_x01;',
'end;'))
,p_process_error_message=>'An error occurred while deleting the offline version.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'The offline version has been deleted.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(34809403717580017001)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_ACTIVE_OFFLINE_BMBS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- when set as active is clicked, deactivate the active entry',
'update dl_bordercontrol.offline_mode',
'set is_active = ''N''',
'where is_active = ''Y'';',
'',
'-- set the to be active version active',
'update dl_bordercontrol.offline_mode',
'set is_active = ''Y''',
'where key_value = apex_application.g_x01;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
