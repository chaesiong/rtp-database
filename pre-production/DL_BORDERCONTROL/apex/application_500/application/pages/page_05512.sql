prompt --application/pages/page_05512
begin
wwv_flow_api.create_page(
 p_id=>5512
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Nationality/Visa Distribution (PDF)'
,p_page_mode=>'NORMAL'
,p_step_title=>'Nationality/Visa Distribution (PDF)'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Nationality/Visa Distribution'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".t-Body-content").css("padding-bottom", "2rem");',
'$(".t-Body-topButton").css("display", "none");'))
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
,p_last_upd_yyyymmddhh24miss=>'20190807150101'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(931471670806387724)
,p_plug_name=>'Date Selection'
,p_region_template_options=>'t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
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
 p_id=>wwv_flow_api.id(931672648619023827)
,p_plug_name=>'Nationality / Visa Distribution Report'
,p_icon_css_classes=>'fa-info'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'This page allows you to generate the report showing the distribution of visa per Nationality. You may select a specific date range below.'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(942203816858672246)
,p_plug_name=>'Server Selector'
,p_parent_plug_id=>wwv_flow_api.id(931672648619023827)
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
 p_id=>wwv_flow_api.id(968083355292973694)
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
 p_id=>wwv_flow_api.id(188556881922966121)
,p_plug_name=>'Result Table'
,p_parent_plug_id=>wwv_flow_api.id(968083355292973694)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nat_value country, ',
'sum(decode(visa_type, 0, 1, 0))  no_visa,',
'sum(decode(visa_type, 1, 1, 0))  tourist_visa_30,',
'sum(decode(visa_type, 2, 1, 0))  special_visa,',
'sum(decode(visa_type, 3, 1, 0))  ordinary_visa,',
'sum(decode(visa_type, 4, 1, 0))  diplomatic_visa,',
'sum(decode(visa_type, 5, 1, 0))  official_visa,',
'sum(decode(visa_type, 6, 1, 0))  courtesy_visa,',
'sum(decode(visa_type, 7, 1, 0))  transit_visa,',
'sum(decode(visa_type, 8, 1, 0))  visa_exemption,',
'sum(decode(visa_type, 9, 1, 0))  tourist_visa_60,',
'sum(decode(visa_type, 10, 1, 0)) visa_on_arrival,',
'sum(decode(visa_type, 99, 1, 0)) other_visa,',
'count(*) total  -- total',
'from rep_visas ',
'WHERE    ((TRUNC(created_at) >= TRUNC(TO_DATE(:P5512_DATE_FROM, ''DD/MM/YYYY'')))   OR :P5512_DATE_FROM IS NULL)',
'   AND   ((TRUNC(created_at) <= TRUNC(TO_DATE(:P5512_DATE_TO, ''DD/MM/YYYY'')))     OR :P5512_DATE_TO IS NULL)',
'   AND   (port_movement       = :P5512_PORT_MOVEMENT                         OR NVL(:P5512_PORT_MOVEMENT, ''-1'') = ''-1'')',
'   AND   (sex                 = :P5512_SEX                                   OR NVL(:P5512_SEX,''-1'') = ''-1'')   ',
'   AND   (borderpost          = :P5512_BORDERPOST                            OR NVL(:P5512_BORDERPOST,''-1'') = ''-1'')  ',
'group by nat_value;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P5512_BORDERPOST,P5512_DATE_FROM,P5512_DATE_TO,P5512_PORT_MOVEMENT,P5512_SEX'
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
 p_id=>wwv_flow_api.id(188557016506966122)
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
,p_internal_uid=>8245888291566133
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188557037025966123)
,p_db_column_name=>'COUNTRY'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Country'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188558514884966137)
,p_db_column_name=>'NO_VISA'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'No Visa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188558703042966139)
,p_db_column_name=>'SPECIAL_VISA'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Special Visa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188816531467836990)
,p_db_column_name=>'ORDINARY_VISA'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Ordinary Visa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188816653072836991)
,p_db_column_name=>'DIPLOMATIC_VISA'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Diplomatic Visa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188816773178836992)
,p_db_column_name=>'OFFICIAL_VISA'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Official Visa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188816917867836993)
,p_db_column_name=>'COURTESY_VISA'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Courtesy Visa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188817023543836994)
,p_db_column_name=>'TRANSIT_VISA'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Transit Visa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188817079947836995)
,p_db_column_name=>'VISA_EXEMPTION'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Visa Exemption'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188817176310836996)
,p_db_column_name=>'TOURIST_VISA_30'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Tourist Visa (30 days)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188817269269836997)
,p_db_column_name=>'VISA_ON_ARRIVAL'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Visa on Arrival'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188817396334836998)
,p_db_column_name=>'OTHER_VISA'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Other Visa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188817520993836999)
,p_db_column_name=>'TOURIST_VISA_60'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Tourist Visa (60 days)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(188558350019966136)
,p_db_column_name=>'TOTAL'
,p_display_order=>280
,p_column_identifier=>'N'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(188808600926793291)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'84975'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'COUNTRY:NO_VISA:TOURIST_VISA_30:SPECIAL_VISA:ORDINARY_VISA:DIPLOMATIC_VISA:OFFICIAL_VISA:COURTESY_VISA:TRANSIT_VISA:VISA_EXEMPTION:TOURIST_VISA_60:VISA_ON_ARRIVAL:OTHER_VISA:TOTAL:'
,p_sum_columns_on_break=>'TOTAL:NO_VISA:TOURIST_VISA_30:SPECIAL_VISA:ORDINARY_VISA:DIPLOMATIC_VISA:OFFICIAL_VISA:COURTESY_VISA:TRANSIT_VISA:VISA_EXEMPTION:TOURIST_VISA_60:VISA_ON_ARRIVAL:OTHER_VISA'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(931689702641616940)
,p_plug_name=>'Print Report'
,p_parent_plug_id=>wwv_flow_api.id(968083355292973694)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(931472588214394955)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(931471670806387724)
,p_button_name=>'BTN_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show Report'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188802643986779523)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(931471670806387724)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(931472146573389661)
,p_name=>'P5512_DATE_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(931471670806387724)
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
 p_id=>wwv_flow_api.id(931472384580391241)
,p_name=>'P5512_DATE_TO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(931471670806387724)
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
 p_id=>wwv_flow_api.id(942204101955672255)
,p_name=>'P5512_BORDERPOST'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(931471670806387724)
,p_item_default=>'&AI_BORDERPOST_NAME.'
,p_prompt=>'Border Post:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(all)'
,p_lov_null_value=>'-1'
,p_cHeight=>1
,p_tag_attributes=>'style="width:22rem; text-align: left"'
,p_read_only_when=>'AI_P_1021_SEE_REP_ALLPOSTS'
,p_read_only_when2=>'0:1'
,p_read_only_when_type=>'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942413864591333353)
,p_name=>'P5512_PORT_MOVEMENT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(931471670806387724)
,p_prompt=>'Port Movement'
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(954920186465030479)
,p_name=>'P5512_SEX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(931471670806387724)
,p_prompt=>'Sex:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'all'
,p_lov_null_value=>'all'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(931523112323606742)
,p_name=>'DA_ShowReport'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(931472588214394955)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(931523537347606750)
,p_event_id=>wwv_flow_api.id(931523112323606742)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//alert($("#P5512_DATEFROM").val());',
'',
'var datefrom = $("#P5512_DATE_FROM").val();',
'var dateto = $("#P5512_DATE_TO").val();',
'var boderpost = $("#P5512_BORDERPOST").val();',
'var exitflg = $("#P5512_PORT_MOVEMENT").val();',
'var sex = ''-1''; //$("#P5512_SEX").val();',
'',
'',
'25/06/1981',
'//datefrom = datefrom.substring(6, 10) + datefrom.substring(3, 5) + datefrom.substring(0, 2);',
'//dateto = dateto.substring(6, 10) + dateto.substring(3, 5) + dateto.substring(0, 2);',
'',
'//window.open();',
'',
'var url = "../JasperReportsIntegration/report?_repName=nat_visa_distribution&_repFormat=pdf&_dataSource=default&_outFilename=&_repLocale=&_repEncoding=&_printIsEnabled=&_printPrinterName=&_printPrinterTray=&_printCopies=&_printDuplex=&_printCollate=&'
||'_saveIsEnabled=&_saveFileName=" ',
'+ "&P_DATE_FROM=" + datefrom ',
'+ "&P_DATE_TO=" + dateto ',
'+ "&P_BORDERPOST=" + boderpost ',
'+ "&P_PORT_MOVEMENT=" + exitflg ',
'+ "&P_SEX=" + sex;',
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
 p_id=>wwv_flow_api.id(188817530254837000)
,p_event_id=>wwv_flow_api.id(931523112323606742)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(188556881922966121)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(188802910624781557)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'PROC_RESETPAGE'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(188802643986779523)
);
end;
/
