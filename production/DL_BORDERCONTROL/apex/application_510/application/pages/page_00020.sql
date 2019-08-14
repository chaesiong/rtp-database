prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(45965479290928181)
,p_name=>'Search'
,p_page_mode=>'MODAL'
,p_step_title=>'Search'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'900'
,p_dialog_width=>'1300'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'E1CHAGEMANN'
,p_last_upd_yyyymmddhh24miss=>'20180802132259'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50825722724474247)
,p_plug_name=>'Searcharea'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(45921816286927968)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52508927333831866)
,p_plug_name=>'Buttonregion'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(45922244475927968)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(52509057426831867)
,p_name=>'Report'
,p_region_name=>'imageReport'
,p_template=>wwv_flow_api.id(45928798426927985)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN voa_apex_pkg.get_search_query (p_passport_no      => :P20_PASSPORT_NO',
'                                     ,p_issuing_date     => :P20_VISA_ISSUING_DATE',
'                                     ,p_visa_number      => :P20_VISA_NUMBER',
'                                     ,p_first_name       => :P20_NAME',
'                                     ,p_middle_name      => :P20_MIDDLE_NAME',
'                                     ,p_last_name        => :P20_LAST_NAME',
'                                     ,p_nationality      => :P20_NATIONALITY',
'                                     ,p_date_of_birth    => :P20_DATE_OF_BIRTH',
'                                     ,p_sex              => :P20_SEX',
'                                     ,p_approved_status  => :P20_APPROVED_STATUS',
'                                     ,p_arrival_border   => :P20_ARRIVAL_BORDER',
'                                     ,p_visa_type        => 10);'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P20_PASSPORT_NO        IS NOT NULL OR',
':P20_VISA_ISSUING_DATE  IS NOT NULL OR',
':P20_VISA_NUMBER        IS NOT NULL OR',
':P20_NAME               IS NOT NULL OR',
':P20_LAST_NAME          IS NOT NULL OR',
':P20_MIDDLE_NAME        IS NOT NULL OR',
':P20_NATIONALITY        IS NOT NULL OR',
':P20_DATE_OF_BIRTH      IS NOT NULL OR',
':P20_SEX                IS NOT NULL OR',
':P20_APPROVED_STATUS    IS NOT NULL OR',
':P20_ARRIVAL_BORDER     IS NOT NULL'))
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(68445349970181098)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align: center; margin-top: 50px;">',
'  <span style="color: lightgrey;" aria-hidden="true" class="fa fa-search fa-5x"></span><br>',
'<h3>No data found...</h3>',
'</div>'))
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55119617537152863)
,p_query_column_id=>1
,p_column_alias=>'VISA_KEY_VALUE'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117102068152837)
,p_query_column_id=>2
,p_column_alias=>'PASSPORT_NO'
,p_column_display_sequence=>3
,p_column_heading=>'Passport number'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117147562152838)
,p_query_column_id=>3
,p_column_alias=>'VISA_NUMBER'
,p_column_display_sequence=>4
,p_column_heading=>'VISA number'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117255747152839)
,p_query_column_id=>4
,p_column_alias=>'PERSON_NAME'
,p_column_display_sequence=>5
,p_column_heading=>'First name - Last name - Middle name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117406584152840)
,p_query_column_id=>5
,p_column_alias=>'SEX'
,p_column_display_sequence=>6
,p_column_heading=>'Sex'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(50645029860665709)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117484273152841)
,p_query_column_id=>6
,p_column_alias=>'DATE_OF_BIRTH'
,p_column_display_sequence=>7
,p_column_heading=>'Date of birth'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117589019152842)
,p_query_column_id=>7
,p_column_alias=>'NATIONALITY'
,p_column_display_sequence=>8
,p_column_heading=>'Nationality'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(47999276705442571)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55117647774152843)
,p_query_column_id=>8
,p_column_alias=>'BORDERPOST'
,p_column_display_sequence=>9
,p_column_heading=>'Borderpost'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(55138297768512750)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55118600242152852)
,p_query_column_id=>9
,p_column_alias=>'STATUS'
,p_column_display_sequence=>10
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT_FROM_LOV'
,p_named_lov=>wwv_flow_api.id(68483956976301170)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55120492832152871)
,p_query_column_id=>10
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68215171455005457)
,p_query_column_id=>11
,p_column_alias=>'PRINT_URL'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55116964612152836)
,p_query_column_id=>12
,p_column_alias=>'RWNUM'
,p_column_display_sequence=>2
,p_column_heading=>'No.'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55118444785152851)
,p_query_column_id=>13
,p_column_alias=>'DERIVED$01'
,p_column_display_sequence=>14
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:P30_VISA_NUMBER,P30_VISA_KEY_VALUE:#VISA_NUMBER#,#VISA_KEY_VALUE#'
,p_column_linktext=>'Cancel <i class="fa fa-ban"></i>'
,p_column_link_attr=>'class="t-Button t-Button--warning #LINK_CLASS#"'
,p_column_alignment=>'CENTER'
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(55120796001152874)
,p_query_column_id=>14
,p_column_alias=>'DERIVED$02'
,p_column_display_sequence=>1
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1:P1_VISA,P1_SEARCH_MODE:#VISA_KEY_VALUE#,1'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-page.png" class="apex-edit-page" alt="">'
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(68215075986005456)
,p_query_column_id=>15
,p_column_alias=>'DERIVED$03'
,p_column_display_sequence=>15
,p_column_heading=>'&nbsp;'
,p_column_link=>'javascript: apex.navigation.popup({url: "#PRINT_URL#"})'
,p_column_linktext=>'<i class="fa fa-print"></i>'
,p_column_link_attr=>'class="t-Button #LINK_CLASS#"'
,p_column_alignment=>'CENTER'
,p_derived_column=>'Y'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50825999068474249)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(52508927333831866)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55116888392152835)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(52508927333831866)
,p_button_name=>'RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(45954778691928084)
,p_button_image_alt=>'Reset'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P20_PASSPORT_NO         IS NOT NULL OR',
':P20_VISA_ISSUING_DATE   IS NOT NULL OR',
':P20_VISA_NUMBER         IS NOT NULL OR',
':P20_NAME                IS NOT NULL OR',
':P20_LAST_NAME           IS NOT NULL OR',
':P20_MIDDLE_NAME         IS NOT NULL OR',
':P20_NATIONALITY         IS NOT NULL OR',
':P20_DATE_OF_BIRTH       IS NOT NULL OR',
':P20_SEX                 IS NOT NULL OR',
':P20_APPROVED_STATUS     IS NOT NULL OR',
':P20_ARRIVAL_BORDER      IS NOT NULL'))
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-times-circle-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52508322807831860)
,p_name=>'P20_PASSPORT_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Passport No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52508442818831861)
,p_name=>'P20_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52508583311831862)
,p_name=>'P20_LAST_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Family Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52508687349831863)
,p_name=>'P20_MIDDLE_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>150
,p_colspan=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53198822026831778)
,p_name=>'P20_VISA_ISSUING_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Issuing Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53199014618831779)
,p_name=>'P20_VISA_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Visa Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53199028706831780)
,p_name=>'P20_NATIONALITY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ICAO_DOC_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by UPPER(d) ASC',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53199167884831781)
,p_name=>'P20_DATE_OF_BIRTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53199257148831782)
,p_name=>'P20_SEX'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Sex:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'  FROM dl_common.human_sexes$lc',
' WHERE num_value IS NOT NULL',
' ORDER BY display_order;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(53199381777831783)
,p_name=>'P20_APPROVED_STATUS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Approved Status:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_STATUSES_STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value',
'      ,return_value ',
'  FROM lov_statuses ',
' WHERE owner$tag = :AI_OWNER',
'   AND tag$tag = ''VOA_STATUS'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55116730590152834)
,p_name=>'P20_ARRIVAL_BORDER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(50825722724474247)
,p_prompt=>'Arrival Border:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(45954165534928073)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55120035664152867)
,p_name=>'CLOSED DIALOG: CANCEL VISA'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(52509057426831867)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55120166289152868)
,p_event_id=>wwv_flow_api.id(55120035664152867)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(52509057426831867)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55120359864152870)
,p_event_id=>wwv_flow_api.id(55120035664152867)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess("The Visa was successfully cancelled!");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55117746799152844)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'RESET'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(55116888392152835)
);
end;
/
