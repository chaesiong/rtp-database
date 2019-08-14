prompt --application/pages/page_05513
begin
wwv_flow_api.create_page(
 p_id=>5513
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Arrival/Departure (PDF)'
,p_page_mode=>'NORMAL'
,p_step_title=>'Arrival/Departure (PDF)'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Daily Movement Report'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//alert($("#P5512_DATEFROM").val());',
'',
'',
'',
'',
'',
''))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190330020828'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934015442747259481)
,p_plug_name=>'Filter Options'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(187312451388266337)
,p_plug_name=>'Selection_Col_3'
,p_parent_plug_id=>wwv_flow_api.id(934015442747259481)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934015211109259479)
,p_plug_name=>'Selection_Col_2'
,p_parent_plug_id=>wwv_flow_api.id(934015442747259481)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--stretchInputs'
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
 p_id=>wwv_flow_api.id(935149149792127978)
,p_plug_name=>'Selection_Col_1'
,p_parent_plug_id=>wwv_flow_api.id(934015442747259481)
,p_region_template_options=>'t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934363766642228952)
,p_plug_name=>'Arrival/Departure Report'
,p_icon_css_classes=>'fa-info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(942204580992684532)
,p_plug_name=>'Server Selector'
,p_parent_plug_id=>wwv_flow_api.id(934363766642228952)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 30rem"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(959592227643598367)
,p_plug_name=>'REG_TABS'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563823021746049617)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934364153589228963)
,p_plug_name=>'Print Report'
,p_parent_plug_id=>wwv_flow_api.id(959592227643598367)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--<div>',
'    --><object id="pdfrendererobject" type="application/pdf" width="100%" height="760">',
'        alt : <a id="pdfrenderer" >nationality report</a>',
'    </object><!--',
'</div>-->'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(959523662701406563)
,p_plug_name=>'Result Table'
,p_parent_plug_id=>wwv_flow_api.id(959592227643598367)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT   row_num',
'        ,is_finished',
'        ,full_name name',
'        ,sex_value sex',
'        ,date_of_birth',
'        ,nationality_value nationality',
'        ,document_no',
'        ,document_class',
'        ,document_type_value document_type',
'        ,transport',
'        ,visa_type_value visa_type',
'        ,created_at',
'        ,port_movement_value port_movement',
'        ,airline_value ariline',
'        ,origin_airport_value origin_airport',
'        ,destination_airport_value destination_airport',
'  FROM   dl_bordercontrol.rep_travel_history  ',
'WHERE   ((TRUNC(created_at) >= TRUNC(TO_DATE(:P5513_DATE_FROM, ''DD/MM/YYYY'')))   OR :P5513_DATE_FROM IS NULL)',
'   AND   ((TRUNC(created_at) <= TRUNC(TO_DATE(:P5513_DATE_TO, ''DD/MM/YYYY''))) OR :P5513_DATE_TO IS NULL)',
'   AND   (is_finished       = :P5513_ISFINISH                                 OR NVL(:P5513_ISFINISH, ''-1'') = ''-1'')',
'   AND   (port_movement       = :P5513_PORT_MOVEMENT                         OR NVL(:P5513_PORT_MOVEMENT, ''-1'') = ''-1'')',
'   AND   (nationality         = :P5513_NATIONALITY                           OR NVL(:P5513_NATIONALITY, ''-1'') = ''-1'')',
'   AND   (sex                 = :P5513_SEX                                   OR NVL(:P5513_SEX,''-1'') = ''-1'')',
'   AND   (document_class      = :P5513_DOCCLASS                              OR NVL(:P5513_DOCCLASS,''-1'') = ''-1'')',
'   AND   (document_type_value = :P5513_DOCTYPE                              OR :P5513_DOCTYPE IS NULL)',
'   AND   (visa_type           = :P5513_VISA_TYPE                             OR NVL(:P5513_VISA_TYPE ,''-1'') = ''-1'')',
'   AND   (airline             = :P5513_AIRLINE                               OR NVL(:P5513_AIRLINE,''-1'') = ''-1'')',
'   AND   (origin_airport      = :P5513_ORIGIN_AIRPORT                        OR NVL(:P5513_ORIGIN_AIRPORT,''-1'') = ''-1'')',
'   AND   (destination_airport = :P5513_DESTINATION_AIRPORT                   OR NVL(:P5513_DESTINATION_AIRPORT,''-1'') = ''-1'')',
'   AND   (created_by_username = :P5513_CREATED_BY                            OR NVL(:P5513_CREATED_BY,''-1'') = ''-1'')',
'   AND   (borderpost          = :P5513_BORDERPOST                            OR NVL(:P5513_BORDERPOST,''-1'') = ''-1'')  ',
'   AND   (document_no         = :P5513_DOCUMENT_NO                           OR :P5513_DOCUMENT_NO IS NULL)',
'   ',
' ',
'       ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P5513_DOCUMENT_NO,P5513_DATE_FROM,P5513_SEX,P5513_DOB_FROM,P5513_DATE_TO,P5513_DOCCLASS,P5513_PORT_MOVEMENT,P5513_VISA_TYPE,P5513_NATIONALITY,P5513_CREATED_BY,P5513_BORDERPOST,P5513_AIRLINE,P5513_ISFINISH'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_api.id(188413692906901933)
,p_max_row_count=>'500'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'SRUSEVA'
,p_internal_uid=>8102564691501944
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188413813221901934)
,p_db_column_name=>'ROW_NUM'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188413857759901935)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188413999561901936)
,p_db_column_name=>'SEX'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188414116266901937)
,p_db_column_name=>'DATE_OF_BIRTH'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Date of Birth'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188414156009901938)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188414327041901939)
,p_db_column_name=>'DOCUMENT_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Document No.'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(155806822557738820)
,p_db_column_name=>'DOCUMENT_CLASS'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>'Document Class'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(236810439642363107)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188553794773966090)
,p_db_column_name=>'DOCUMENT_TYPE'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188553859531966091)
,p_db_column_name=>'TRANSPORT'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Transport'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188553974722966092)
,p_db_column_name=>'VISA_TYPE'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Visa Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188554079166966093)
,p_db_column_name=>'CREATED_AT'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Created At'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188554162291966094)
,p_db_column_name=>'PORT_MOVEMENT'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Port Movement'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188554302530966095)
,p_db_column_name=>'ARILINE'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Ariline'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188554332790966096)
,p_db_column_name=>'ORIGIN_AIRPORT'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Origin'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188554483171966097)
,p_db_column_name=>'DESTINATION_AIRPORT'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Destination'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(187084639771646608)
,p_db_column_name=>'IS_FINISHED'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Is finished'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(853856288901358157)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(188569724709971787)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'82586'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ROW_NUM:NAME:SEX:DATE_OF_BIRTH:NATIONALITY:DOCUMENT_NO:DOCUMENT_TYPE:TRANSPORT:VISA_TYPE:CREATED_AT:PORT_MOVEMENT:ARILINE:ORIGIN_AIRPORT:DESTINATION_AIRPORT:IS_FINISHED:DOCUMENT_CLASS'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(935149372041127984)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(935149149792127978)
,p_button_name=>'BTN_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Filter'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188078593222247389)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(935149149792127978)
,p_button_name=>'BTN_RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset Filter'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-recycle'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(193999686879623002)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(935149149792127978)
,p_button_name=>'Delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'BODY'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155806921677738821)
,p_name=>'P5513_DOCTYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(187312451388266337)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187084682023646609)
,p_name=>'P5513_ISFINISH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(187312451388266337)
,p_prompt=>'Is finished:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES/NO'
,p_lov=>'.'||wwv_flow_api.id(853856288901358157)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193999470529623000)
,p_name=>'P5513_DOCUMENT_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(935149149792127978)
,p_prompt=>'Document No.'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934014429251259471)
,p_name=>'P5513_SEX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(935149149792127978)
,p_prompt=>'Sex:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934014514053259472)
,p_name=>'P5513_VISA_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(187312451388266337)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'VISA_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.VISA_TYPES$LC',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934014629332259473)
,p_name=>'P5513_DOCCLASS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(934015211109259479)
,p_prompt=>'Document Class:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDER_DOCUMENT_CLASS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934014763600259474)
,p_name=>'P5513_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(935149149792127978)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934014831554259475)
,p_name=>'P5513_ORIGIN_AIRPORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(934015211109259479)
,p_prompt=>'Origin:'
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
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934014918500259476)
,p_name=>'P5513_DESTINATION_AIRPORT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(934015211109259479)
,p_prompt=>'Destination:'
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
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934015032020259477)
,p_name=>'P5513_CREATED_BY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(187312451388266337)
,p_prompt=>'Officer:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select distinct trim(substr(ins_by, 1, instr(ins_by,''@'') - 2)) a, trim(substr(ins_by, 1, instr(ins_by,''@'') - 2)) b from movements'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934015157720259478)
,p_name=>'P5513_AIRLINE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(934015211109259479)
,p_prompt=>'Airline:'
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
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(934015306184259480)
,p_name=>'P5513_DATE_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(935149149792127978)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Date To:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_tag_css_classes=>'autovalidatedatepicker datetypepast'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(935149859725127988)
,p_name=>'P5513_DATE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(935149149792127978)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Date From:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_tag_css_classes=>'autovalidatedatepicker datetypepast'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942204883098684533)
,p_name=>'P5513_BORDERPOST'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(187312451388266337)
,p_item_default=>':AI_BORDERPOST_ID'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Border Post:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'--ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(943166185052167566)
,p_name=>'P5513_PORT_MOVEMENT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(934015211109259479)
,p_prompt=>'Port Movement:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PORT_MOVEMENTS_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   num_value r',
'FROM',
'    DL_COMMON.PORT_MOVEMENTS$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(934366043232229044)
,p_name=>'DA_ShowReport'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(935149372041127984)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(934366529872229050)
,p_event_id=>wwv_flow_api.id(934366043232229044)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var datefrom = $("#P5513_DATE_FROM").val();',
'var dateto = $("#P5513_DATE_TO").val();',
'var port_movement = $("#P5513_PORT_MOVEMENT").val();',
'var nationality = $("#P5513_NATIONALITY").val();',
'var sex = $("#P5513_SEX").val();',
'var doctype = $("#P5513_DOCTYPE").val();',
'var visa_type = $("#P5513_VISA_TYPE").val();',
'var origin = $("#P5513_ORIGIN_AIRPORT").val();',
'var destination = $("#P5513_DESTINATION_AIRPORT").val();',
'var airline = $("#P5513_AIRLINE").val();',
'var createdby = $("#P5513_CREATED_BY").val();',
'var borderpost = $("#P5513_BORDERPOST").val();',
'var isfinish = $("#P5513_ISFINISH").val();',
'',
'//datefrom = datefrom.substring(6, 10) + datefrom.substring(3, 5) + datefrom.substring(0, 2);',
'//dateto = dateto.substring(6, 10) + dateto.substring(3, 5) + dateto.substring(0, 2);',
'',
'//window.open();',
'',
'var url = "../JasperReportsIntegration/report?_repName=daily_movements&_repFormat=pdf&_dataSource=default&_outFilename=&_repLocale=&_repEncoding=&_printIsEnabled=&_printPrinterName=&_printPrinterTray=&_printCopies=&_printDuplex=&_printCollate=&_saveI'
||'sEnabled=&_saveFileName=" ',
'+ "&P_DATE_FROM=" + datefrom',
'+ "&P_DATE_TO=" + dateto',
'+ "&P_PORT_MOVEMENT="+port_movement ',
'+ "&P_NATIONALITY="+nationality',
'+ "&P_SEX="+sex ',
'+ "&P_DOCT_YPE="+doctype',
'+ "&P_VISA_TYPE="+visa_type ',
'+ "&P_ORIGIN="+origin',
'+ "&P_DESTINATION="+destination',
'+ "&P_AIRLINE="+airline',
'+ "&P_CREATED_BY="+createdby',
'+ "&P_BORDERPOST="+borderpost ',
'+ "&P_ISFINISHED=" + isfinish',
'',
';',
'',
'	',
'',
'//window.setTimeout(function() {',
'  $("#pdfrenderer").attr("href", url + "#zoom=85");',
'  $("#pdfrendererobject").attr("data", url + "#zoom=85");',
'//}, 3000);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(187312659688266339)
,p_event_id=>wwv_flow_api.id(934366043232229044)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(959523662701406563)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(188078891169254229)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'PROC_RESETPAGE'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(188078593222247389)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(193999770621623003)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete from dl_bordercontrol.movements ',
'where ((case',
'       when :P5513_DOCUMENT_NO is not null and BRDDOCID = (select BRDDOCID from dl_bordercontrol.borderdocuments where docno = :P5513_DOCUMENT_NO)',
'       then 1',
'       end) = 1',
'   or (case',
'       when :P5513_DATE_FROM is not null and :P5513_DATE_TO is not null ',
'            and to_date(to_char(INS_AT, ''DD/MM/YYYY''), ''DD/MM/YYYY'') between to_date(:P5513_DATE_FROM, ''DD/MM/YYYY'') and to_date(:P5513_DATE_TO, ''DD/MM/YYYY'')',
'       then 1',
'       end) = 1);',
'commit;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
