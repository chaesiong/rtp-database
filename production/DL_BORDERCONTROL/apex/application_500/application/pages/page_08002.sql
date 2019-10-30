prompt --application/pages/page_08002
begin
wwv_flow_api.create_page(
 p_id=>8002
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Offload'
,p_page_mode=>'NORMAL'
,p_step_title=>'Offload'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Offload'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'#WORKSPACE_IMAGES#ApexConfirm.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var lSpinner$ = apex.util.showSpinner($("div#id-ir-travel-history"));',
'',
'function upperCaseF(a, ev) {',
'    setTimeout(function() {',
'        var selStart = a.selectionStart;',
'        var selEnd = a.selectionEnd;',
'        a.value = a.value.toUpperCase();',
'        a.setSelectionRange(selStart, selEnd);',
'    }, 1);',
'}',
'',
'function validateInputs() {',
'    // 1: go for travel date',
'    if (!!$v("P8002_TRAVEL_DATE")) {',
'        let time = Array.from($(''.cl-travel-date-time-field'').get(), e => e.value).join(",");',
'        if (!!time && time != "00,00,00,00")',
'            return true;',
'    }',
'',
'    // 2: go for vehicle no if today',
'    if ($v("P8002_SCOPE") == "0" && !!$v("P8002_VEHICLE_NO"))',
'        return true;',
'',
'    return false;',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".auto-upper-case").keyup((elem) => {',
'    upperCaseF(elem.target);',
'});'))
,p_css_file_urls=>'#WORKSPACE_IMAGES#ApexConfirm.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Footer-apex {',
'    display: none;',
'}',
'',
'.fa-1-7-5x {',
'    font-size: 175%;',
'}',
'',
'.cl-pointer {',
'    cursor: pointer;',
'}',
'',
'.cl-span-select-offload-all {',
'    margin-top: -5px;',
'    margin-bottom: 5px;',
'}',
'',
'#id-offload-confirm-msg{',
'    font-size: 1.8rem;',
'    padding: 1.5rem;',
'}'))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190820022019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181270181694901619)
,p_plug_name=>'Container'
,p_region_name=>'id-reg-container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>600
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181270237603901620)
,p_plug_name=>'Controls'
,p_parent_plug_id=>wwv_flow_api.id(181270181694901619)
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>610
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(283902317610359459)
,p_plug_name=>'Movements'
,p_region_name=>'id-ir-travel-history'
,p_parent_plug_id=>wwv_flow_api.id(181270181694901619)
,p_region_css_classes=>'cl-ir-dynamic-display'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>620
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    --------',
'    DECODE(',
'        ac.n001',
'        , 1, ''SELECTED''',
'        , NULL',
'    ) SELECT_OFFLOAD',
'    --------',
'    , DECODE(',
'        ac.n001',
'        , 1, ''<span id="id-span-select-offload-'' || ac.c001 || ''" class="t-Icon fa fa-check-square-o fa-1-7-5x cl-span-select-offload cl-pointer" aria-hidden="true" title="Click to Un-select" data-mvmntid="'' || ac.c001 || ''" data-coll-seq="'' || ac.se'
||'q_id || ''" data-select-status="Y"></span>''',
'        , ''<span id="id-span-select-offload-'' || ac.c001 || ''" class="t-Icon fa fa-square-o fa-1-7-5x cl-span-select-offload cl-pointer" aria-hidden="true" title="Click to Select" data-mvmntid="'' || ac.c001 || ''" data-coll-seq="'' || ac.seq_id || ''" d'
||'ata-select-status="N"></span>''',
'    ) SELECT_OFFLOAD_ICON',
'    --------',
'    , v.mvmntid',
'    , v.scanned_flight',
'    , v.exitflg',
'    , v.ins_borderpost',
'    , v.docno',
'    , v.form_no',
'    , v.givenname || NVL2(v.middlename, '' '' || v.middlename, NULL) || NVL2(v.surname, '' '' || v.surname, NULL) AS NAME',
'    , v.sex',
'    , v.dob',
'    , v.nat',
'    , v.date_of_entry',
'    , ROW_NUMBER () OVER (ORDER BY v.date_of_entry DESC NULLS LAST) AS RN',
'FROM dl_bordercontrol.v_edit_movements v, apex_collections ac',
'WHERE ac.collection_name = ''P8002_COLL_OFFLOAD''',
'AND v.mvmntid = ac.c001',
'AND CASE WHEN REGEXP_LIKE(:REQUEST, ''(CSV|HTMLD|PDF)$'') THEN ''Y'' ELSE :P8002_DR END = ''Y''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P8002_DR'
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
 p_id=>wwv_flow_api.id(283902483500359460)
,p_max_row_count=>'100000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP,171:P171_MVMNTID,P171_DATA_SOURCE_SEC,P171_DATA_SOURCE_SEC_PK_VAL,P171_CHECK_PIBICS_CONN:#MVMNTID#,BIO,#MVMNTID#,0'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_owner=>'ADMIN'
,p_internal_uid=>283902483500359460
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(150422554783505029)
,p_db_column_name=>'DOB'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'DOB'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179344557008484138)
,p_db_column_name=>'SCANNED_FLIGHT'
,p_display_order=>180
,p_column_identifier=>'AD'
,p_column_label=>'Vehicle No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179344656667484139)
,p_db_column_name=>'EXITFLG'
,p_display_order=>190
,p_column_identifier=>'AE'
,p_column_label=>'Direction'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(262034404724586336)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179344712246484140)
,p_db_column_name=>'INS_BORDERPOST'
,p_display_order=>200
,p_column_identifier=>'AF'
,p_column_label=>'Borderpost'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(144221782939607174)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179344804476484141)
,p_db_column_name=>'DOCNO'
,p_display_order=>210
,p_column_identifier=>'AG'
,p_column_label=>'Document No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179344956237484142)
,p_db_column_name=>'FORM_NO'
,p_display_order=>220
,p_column_identifier=>'AH'
,p_column_label=>'TM6'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179345072311484143)
,p_db_column_name=>'NAME'
,p_display_order=>230
,p_column_identifier=>'AI'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179345124556484144)
,p_db_column_name=>'SEX'
,p_display_order=>240
,p_column_identifier=>'AJ'
,p_column_label=>'Sex'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(185798964008064825)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179345238456484145)
,p_db_column_name=>'NAT'
,p_display_order=>250
,p_column_identifier=>'AK'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(193497710818067469)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179345382205484146)
,p_db_column_name=>'DATE_OF_ENTRY'
,p_display_order=>260
,p_column_identifier=>'AL'
,p_column_label=>'Travel Date/Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(179345537682484148)
,p_db_column_name=>'MVMNTID'
,p_display_order=>270
,p_column_identifier=>'AM'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(181268412950901602)
,p_db_column_name=>'SELECT_OFFLOAD'
,p_display_order=>280
,p_column_identifier=>'AN'
,p_column_label=>'Select'
,p_column_html_expression=>'#SELECT_OFFLOAD_ICON#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'SELECT_OFFLOAD'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(181268550158901603)
,p_db_column_name=>'SELECT_OFFLOAD_ICON'
,p_display_order=>290
,p_column_identifier=>'AO'
,p_column_label=>'Select offload icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(181268925598901607)
,p_db_column_name=>'RN'
,p_display_order=>300
,p_column_identifier=>'AP'
,p_column_label=>'SNo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(283934640560380309)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1504253'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'SELECT_OFFLOAD:RN:SCANNED_FLIGHT:EXITFLG:INS_BORDERPOST:DOCNO:FORM_NO:NAME:SEX:DOB:NAT:DATE_OF_ENTRY:'
,p_sort_column_1=>'RN'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(181271004093901628)
,p_plug_name=>'Confirmation'
,p_region_name=>'dialogOffloadConfirm'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>610
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="id-offload-confirm-msg">',
'    ',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(251459663342890960)
,p_plug_name=>'Filter'
,p_region_name=>'id-reg-filter'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>200
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(283321872479271772)
,p_plug_name=>'HIDDEN'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(283905235482359488)
,p_plug_name=>'Info'
,p_region_name=>'id-reg-info'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading:margin-bottom-sm'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'For an "Offload" search - ',
'<ul>',
'<li>Please search with "Vehicle No" and/or "Travel Date".</li>',
'<li>When searching by "Vehicle No" only, scope of data should be limited to "Today".</li>',
'<li>When searching by "Travel Date", please provide the time duration to search for.</li>',
'</ul>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(578929476628689991)
,p_plug_name=>'Offload'
,p_icon_css_classes=>'fa-undo-arrow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'Search flight for offload'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(150401374889504982)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(251459663342890960)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(150400902645504981)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(251459663342890960)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:8002:&SESSION.::&DEBUG.:RP,8002::'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181271220217901630)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(181271004093901628)
,p_button_name=>'CONFIRM_OFFLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Confirm Offload'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181270355445901621)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(181270237603901620)
,p_button_name=>'OFFLOAD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Offload'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-arrow'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181271386619901631)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(181271004093901628)
,p_button_name=>'CANCEL_OFFLOAD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(150485265265505107)
,p_branch_name=>'Go To Page 8002'
,p_branch_action=>'f?p=&APP_ID.:8002:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(150401374889504982)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148147227885128810)
,p_name=>'P8002_TRAVEL_TIME_MIN_FROM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_item_default=>'00'
,p_prompt=>'Travel Time From MIN :'
,p_pre_element_text=>'<span style="margin-right: 30px;">:</span>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT num_value d, num_value r',
'FROM',
'(',
'    SELECT TO_CHAR(LEVEL - 1, ''FM09'') num_value',
'    FROM DUAL',
'    CONNECT BY LEVEL <= 60',
');'))
,p_cHeight=>1
,p_tag_css_classes=>'cl-travel-date-time-field'
,p_tag_attributes=>'style="width: 70px;"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148147351872128811)
,p_name=>'P8002_TRAVEL_TIME_HR_TO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_item_default=>'00'
,p_prompt=>'To :'
,p_post_element_text=>'<span style="margin-left: 35px;">:</span>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT num_value d, num_value r',
'FROM',
'(',
'    SELECT TO_CHAR(LEVEL - 1, ''FM09'') num_value',
'    FROM DUAL',
'    CONNECT BY LEVEL <= 24',
');'))
,p_cHeight=>1
,p_tag_css_classes=>'cl-travel-date-time-field'
,p_tag_attributes=>'style="width: 70px;"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148147470766128812)
,p_name=>'P8002_TRAVEL_TIME_MIN_TO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_item_default=>'00'
,p_prompt=>'Travel Time To MIN :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT num_value d, num_value r',
'FROM',
'(',
'    SELECT TO_CHAR(LEVEL - 1, ''FM09'') num_value',
'    FROM DUAL',
'    CONNECT BY LEVEL <= 60',
');'))
,p_cHeight=>1
,p_tag_css_classes=>'cl-travel-date-time-field'
,p_tag_attributes=>'style="width: 70px;"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150401715800504986)
,p_name=>'P8002_SCOPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_prompt=>'Scope of data :'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d, r',
'FROM',
'(',
'    SELECT ''Today'' AS d, 0 AS r, ''en_US'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''Historical'', 1, ''en_US'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''วันนี้'', 0, ''th_TH'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''ทั้งหมด'', 1, ''th_TH'' AS lang FROM DUAL',
')',
'WHERE ',
'CASE ',
'    WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' AND lang = ''th_TH'' THEN 1',
'    WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() != ''th_TH'' AND lang = ''en_US'' THEN 1',
'END = 1',
'ORDER BY r',
';'))
,p_tag_css_classes=>'cl-exclude-validation'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150402174241504992)
,p_name=>'P8002_DIRECTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_prompt=>'Direction :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- ALL --'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150408532895505009)
,p_name=>'P8002_TRAVEL_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_prompt=>'Travel Date :'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-10:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150408907196505009)
,p_name=>'P8002_TRAVEL_TIME_HR_FROM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_item_default=>'00'
,p_prompt=>'Travel Time :'
,p_pre_element_text=>'<span style="margin-right: 10px;">From :</span>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT num_value d, num_value r',
'FROM',
'(',
'    SELECT TO_CHAR(LEVEL - 1, ''FM09'') num_value',
'    FROM DUAL',
'    CONNECT BY LEVEL <= 24',
');'))
,p_cHeight=>1
,p_tag_css_classes=>'cl-travel-date-time-field'
,p_tag_attributes=>'style="width: 70px;"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150409754558505009)
,p_name=>'P8002_VEHICLE_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_prompt=>'Flight / Vehicle No. :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150410197829505010)
,p_name=>'P8002_BORDERPOST'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Border Post :'
,p_source=>'AI_BORDERPOST_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_tag_css_classes=>'cl-exclude-validation'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150413219816505017)
,p_name=>'P8002_DR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(283321872479271772)
,p_use_cache_before_default=>'NO'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150413680859505017)
,p_name=>'P8002_RETURN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(283321872479271772)
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(150414089993505018)
,p_name=>'P8002_IS_SUPERVISOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(283321872479271772)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181269993377901617)
,p_name=>'P8002_TOTAL_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(181270237603901620)
,p_prompt=>'Total Count :'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_tag_attributes=>'disabled="disabled"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181270047103901618)
,p_name=>'P8002_SELECTED_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(181270237603901620)
,p_prompt=>'Selected Count :'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_tag_attributes=>'disabled="disabled"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181271140095901629)
,p_name=>'P8002_REMARKS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(181271004093901628)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Remarks'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cMaxlength=>2000
,p_cHeight=>3
,p_tag_css_classes=>'mask-lang-th'
,p_tag_attributes=>'style="font-size: 1.4em;"'
,p_field_template=>wwv_flow_api.id(563841469540049626)
,p_item_template_options=>'#DEFAULT#:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683855606688328649)
,p_name=>'P8002_DEPT_SEQNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(283321872479271772)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dl_staging4pibics_intf.pkg_transcode_reverse.get_borderpost_seqno(:AI_BORDERPOST_ID)',
'FROM DUAL;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4690285400805124602)
,p_name=>'P8002_DEPT_2_SEQNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(283321872479271772)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_dept_seqno  dl_bordercontrol.v_department.dept_seqno%TYPE;',
'BEGIN',
'    IF :P8002_DEPT_LEVEL = 3 THEN',
'        SELECT rel_code ',
'        INTO l_dept_seqno',
'        FROM dl_bordercontrol.v_department',
'        WHERE actflag = ''Y''',
'        AND deptlevel = 3',
'        AND dept_seqno = :P8002_DEPT_3_SEQNO;',
'    ELSIF :P8002_DEPT_LEVEL = 2 THEN',
'        l_dept_seqno := :P8002_DEPT_SEQNO;',
'    END IF;',
'    ',
'    RETURN l_dept_seqno;',
'END;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4690285551754124603)
,p_name=>'P8002_DEPT_1_SEQNO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(283321872479271772)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rel_code ',
'FROM dl_bordercontrol.v_department',
'WHERE actflag = ''Y''',
'AND deptlevel = 2',
'AND dept_seqno = :P8002_DEPT_2_SEQNO',
';'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4690285666927124604)
,p_name=>'P8002_DEPT_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_prompt=>'Department (1) :'
,p_source=>'P8002_DEPT_1_SEQNO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END AS d,',
'    dept_seqno AS r',
'FROM dl_bordercontrol.v_department',
'WHERE deptlevel = 1',
'AND actflag = ''Y''',
'ORDER BY 1',
';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4690285788401124605)
,p_name=>'P8002_DEPT_2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_prompt=>'Department (2) :'
,p_source=>'P8002_DEPT_2_SEQNO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END AS d,',
'    dept_seqno AS r',
'FROM dl_bordercontrol.v_department',
'WHERE actflag = ''Y''',
'AND deptlevel = 2',
'--AND rel_code = :P8002_DEPT_1',
'ORDER BY 1',
';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4690285825881124606)
,p_name=>'P8002_DEPT_3'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(251459663342890960)
,p_prompt=>'Department (3) :'
,p_source=>'P8002_DEPT_SEQNO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END AS d,',
'    dept_seqno AS r',
'FROM dl_bordercontrol.v_department',
'WHERE actflag = ''Y''',
'AND deptlevel = 3',
'AND rel_code = :P8002_DEPT_2',
'ORDER BY 1',
';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4690286572918124613)
,p_name=>'P8002_DEPT_3_SEQNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(283321872479271772)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT :P8002_DEPT_SEQNO',
'FROM DUAL',
'WHERE :P8002_DEPT_LEVEL = 3'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4690286640462124614)
,p_name=>'P8002_DEPT_LEVEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(283321872479271772)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT deptlevel ',
'FROM dl_bordercontrol.v_department',
'WHERE actflag = ''Y''',
'AND dept_seqno = :P8002_DEPT_SEQNO',
';'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(150469997093505095)
,p_computation_sequence=>10
,p_computation_item=>'P8002_IS_SUPERVISOR'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_is_supervisor  VARCHAR2(1) := ''N'';',
'BEGIN',
'  ',
'    BEGIN',
'        SELECT ''Y''',
'        INTO l_is_supervisor',
'        FROM dual',
'        WHERE EXISTS ',
'        (',
'            SELECT 1',
'            FROM user_management.role_object_grant_rel rogr',
'            JOIN USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'            JOIN user_management.users u on u.id = user_id',
'            JOIN user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'            WHERE u.username = UPPER(:APP_USER)',
'            AND urr.role_id = ''BMBS_SUP''',
'        );',
'    EXCEPTION',
'        WHEN OTHERS THEN',
'            NULL;',
'    END;',
'    ',
'    RETURN l_is_supervisor;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        RETURN l_is_supervisor;',
'END;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(150471933015505099)
,p_name=>'Page Load Actions'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(150472938920505099)
,p_event_id=>wwv_flow_api.id(150471933015505099)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' :P8002_DR := ''Y'';',
'END;'))
,p_attribute_02=>'P8002_DR'
,p_attribute_03=>'P8002_DR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(150472422276505099)
,p_event_id=>wwv_flow_api.id(150471933015505099)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'div.cl-ir-dynamic-display span.a-IRR-noDataMsg-text, div.cl-r-dynamic-display span.nodatafound'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//conditions here',
'let isValidated = validateInputs();',
'if (!isValidated) {',
'    lSpinner$.remove();',
'    $("#id-reg-info").show();',
'    $("#id-reg-container").hide();',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(150473405988505100)
,p_event_id=>wwv_flow_api.id(150471933015505099)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''div.cl-ir-dynamic-display span.a-IRR-noDataMsg-text, div.cl-r-dynamic-display span.nodatafound'').text(''Please wait..'');',
'',
'setTimeout(function() {',
'    apex.event.trigger(document, "getCollOffload");',
'}, 1000);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(150481919082505105)
,p_name=>'P8002_RETURN: Change'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8002_RETURN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(150482431438505105)
,p_event_id=>wwv_flow_api.id(150481919082505105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'lSpinner$.remove();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(150482958379505105)
,p_event_id=>wwv_flow_api.id(150481919082505105)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(283902317610359459)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(179345638567484149)
,p_name=>'Get Offload Collection'
,p_event_sequence=>180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getCollOffload'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179345754820484150)
,p_event_id=>wwv_flow_api.id(179345638567484149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	l_coll_name VARCHAR2(100) := ''P8002_COLL_OFFLOAD'';',
'	l_arr_mvmntid   wwv_flow_global.vc_arr2;',
'    l_arr_selected  wwv_flow_global.n_arr;',
'	l_max_allowed   NUMBER := 1000;',
'	--',
'	-- internal procs',
'	function is_valid_date(p_date in varchar2, p_format in varchar2 default ''DD/MM/YYYY'') return boolean as',
'		l_date date;',
'	begin',
'		l_date := TO_DATE(p_date, p_format);',
'		return true;',
'	exception',
'		when others then',
'			return false;',
'	end is_valid_date;',
'	--',
'BEGIN',
'',
'	-- param check',
'    IF ',
'	(TRIM(:P8002_VEHICLE_NO) IS NULL AND TRIM(:P8002_TRAVEL_DATE) IS NULL) ',
'	OR NOT(is_valid_date(TRIM(:P8002_TRAVEL_DATE))) THEN',
'        dl_common.pkg_apex_util.create_empty_collection(p_collection_name => l_coll_name);',
'		RAISE_APPLICATION_ERROR(-20020, ''Invalid Parameters'');',
'    END IF;',
'',
'	SELECT ',
'		mvmntid',
'		, 0',
'	BULK COLLECT INTO ',
'		l_arr_mvmntid',
'		, l_arr_selected',
'	FROM dl_bordercontrol.v_edit_movements ',
'	WHERE ',
'	(',
'		:P8002_SCOPE = 1',
'		OR',
'		( :P8002_SCOPE = 0 AND TO_CHAR(date_of_entry, ''dd/mm/yyyy'') = TO_CHAR(SYSDATE, ''dd/mm/yyyy'') )',
'	)',
'	AND (:P8002_DIRECTION IS NULL OR exitflg = :P8002_DIRECTION)',
'	AND (:P8002_VEHICLE_NO IS NULL OR scanned_flight = UPPER(TRIM(:P8002_VEHICLE_NO)))',
'	--AND (:P8002_BORDERPOST IS NULL OR ins_borderpost = :P8002_BORDERPOST)',
'	--AND ins_borderpost = :P8002_BORDERPOST',
'	AND ins_borderpost = (SELECT key_value FROM dl_staging4pibics_intf.trcd_borderpost WHERE seqno = NVL(:P8002_DEPT_3, :P8002_DEPT_2))',
'	AND',
'	(',
'		:P8002_TRAVEL_DATE IS NULL ',
'		OR',
'		date_of_entry BETWEEN TO_DATE(:P8002_TRAVEL_DATE || '' '' || :P8002_TRAVEL_TIME_HR_FROM || '':'' || :P8002_TRAVEL_TIME_MIN_FROM, ''DD/MM/YYYY HH24:MI'')',
'		AND TO_DATE(:P8002_TRAVEL_DATE || '' '' || :P8002_TRAVEL_TIME_HR_TO || '':'' || :P8002_TRAVEL_TIME_MIN_TO, ''DD/MM/YYYY HH24:MI'')',
'	)',
'    AND exitflg IN (0, 1)',
'    ;',
'	',
'	dl_common.pkg_apex_util.create_empty_collection(p_collection_name => l_coll_name);',
'	',
'	IF l_arr_mvmntid.COUNT > 0 AND l_arr_mvmntid.COUNT <= l_max_allowed THEN',
'		APEX_COLLECTION.ADD_MEMBERS(',
'			p_collection_name => l_coll_name',
'			, p_c001          => l_arr_mvmntid',
'			, p_n001          => l_arr_selected',
'		);',
'		COMMIT;',
'	END IF;',
'',
'	:P8002_RETURN := 1;',
'',
'EXCEPTION',
'	WHEN OTHERS THEN',
'		:P8002_RETURN := -1;',
'END;'))
,p_attribute_02=>'P8002_SCOPE,P8002_DIRECTION,P8002_VEHICLE_NO,P8002_BORDERPOST,P8002_TRAVEL_DATE,P8002_TRAVEL_TIME_HR_FROM,P8002_TRAVEL_TIME_MIN_FROM,P8002_TRAVEL_TIME_HR_TO,P8002_TRAVEL_TIME_MIN_TO,P8002_DEPT_3,P8002_DEPT_2'
,p_attribute_03=>'P8002_RETURN'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181268663250901604)
,p_name=>'Toggle Offload Selecttion'
,p_event_sequence=>190
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'span.cl-span-select-offload'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'body'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181268744246901605)
,p_event_id=>wwv_flow_api.id(181268663250901604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var $el=$(this.triggeringElement);',
'',
'apex.server.process(',
'    "TOGGLE_OFFLOAD_SELECTION", {',
'        x01: $el.data("mvmntid"),',
'        x02: $el.data("coll-seq"),',
'        x03: $el.data("select-status")',
'    }, ',
'    {',
'        beforeSend: function(){',
'            $el.removeClass("fa-square-o fa-check-square-o").addClass("fa-refresh fa-spin");',
'        },',
'        success: function(pData){ console.log(pData);',
'            var $e;',
'            if(pData.mvmntid){$e=$(''span#id-span-select-offload-''+pData.mvmntid);}',
'            $e.removeClass("fa-refresh fa-spin")',
'              .addClass(((pData.select_status == "Y") ? "fa-check-square-o" : "fa-square-o"))',
'              .prop("title", ((pData.select_status == "Y") ? "Click to Un-select" : "Click to Select"));',
'            if(pData.success == true){',
'                $e.data("select-status", pData.select_status);',
'                apex.event.trigger(document, "getCollOffloadCounts");',
'            }',
'        },',
'        error: function(){',
'            alert(''Unexpected error !\nPlease refresh the page to try again or contact the administrator.'');',
'        }',
'    }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181269087891901608)
,p_name=>'Movements: After Refresh'
,p_event_sequence=>200
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(283902317610359459)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181269113994901609)
,p_event_id=>wwv_flow_api.id(181269087891901608)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger(document, "getCollOffloadCounts");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181269271365901610)
,p_name=>'Toggle Offload Selection All'
,p_event_sequence=>210
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#id-span-select-offload-all'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'body'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181269355656901611)
,p_event_id=>wwv_flow_api.id(181269271365901610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var $el=$(this.triggeringElement);',
'',
'apex.server.process(',
'    "TOGGLE_OFFLOAD_SELECTION_ALL", {',
'        x01: $el.data("select-status")',
'    }, ',
'    {',
'        beforeSend: function(){',
'            $el.removeClass("fa-square-o fa-check-square-o").addClass("fa-refresh fa-spin");',
'        },',
'        success: function(pData){ console.log(pData);',
'            var $e = $(''span#id-span-select-offload-all'');',
'            $e.removeClass("fa-refresh fa-spin")',
'              .addClass(((pData.select_status == "Y") ? "fa-check-square-o" : "fa-square-o"))',
'              .prop("title", ((pData.select_status == "Y") ? "Click to Un-select All" : "Click to Select All"));',
'            if(pData.success == true){',
'                apex.event.trigger("#id-ir-travel-history", "apexrefresh");',
'                $e.data("select-status", pData.select_status);',
'            }',
'        },',
'        error: function(){',
'            alert(''Unexpected error !\nPlease refresh the page to try again or contact the administrator.'');',
'        }',
'    }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181269760497901615)
,p_name=>'Get Offload Coll Counts'
,p_event_sequence=>220
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getCollOffloadCounts'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181269896521901616)
,p_event_id=>wwv_flow_api.id(181269760497901615)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let htm, cls, sel;',
'',
'apex.server.process("GET_COLL_COUNT", ',
'{',
'    x01: "P8002_COLL_OFFLOAD"',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        console.log(''GET_COLL_COUNT Result: '', pData);',
'        let total_count = (parseInt(pData.total_count, 10) || 0);',
'        let selected_count = (parseInt(pData.selected_count, 10) || 0);',
'        if (selected_count < total_count) {',
'            cls = "fa-square-o";',
'            sel = "N";',
'        }',
'        else if (selected_count === total_count) {',
'            cls = "fa-check-square-o";',
'            sel = "Y";',
'        }',
'',
'        if (total_count > 0) {',
'            $("#id-span-select-offload-all").remove();',
'            htm = ''<span id="id-span-select-offload-all" class="t-Icon fa '' + cls + '' fa-1-7-5x cl-span-select-offload-all cl-pointer" aria-hidden="true" title="Click to '' + (sel == "Y" ? ''Un-select'' : ''Select'') + '' All" data-select-status="'' + sel +'
||' ''"></span>'';',
'            $("#SELECT_OFFLOAD").append(htm);',
'            console.log(''htm: '', htm);',
'        }',
'',
'        $("#P8002_TOTAL_COUNT").val(total_count);',
'        $("#P8002_SELECTED_COUNT").val(selected_count).trigger("change");',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181270461140901622)
,p_name=>'P8002_SELECTED_COUNT: Change'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8002_SELECTED_COUNT'
,p_condition_element=>'P8002_SELECTED_COUNT'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181270533836901623)
,p_event_id=>wwv_flow_api.id(181270461140901622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(181270355445901621)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181270607923901624)
,p_event_id=>wwv_flow_api.id(181270461140901622)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(181270355445901621)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181270745868901625)
,p_name=>'OFFLOAD: Click'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(181270355445901621)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181270867739901626)
,p_event_id=>wwv_flow_api.id(181270745868901625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let total_count = (parseInt($v("P8002_TOTAL_COUNT"), 10) || 0);',
'let selected_count = (parseInt($v("P8002_SELECTED_COUNT"), 10) || 0);',
'',
'if (total_count > 0 && selected_count > 0) {',
'    $("#id-offload-confirm-msg").html("This will mark " + selected_count + " selected movement(s) as Offloaded. Please provide a suitable remark to confirm.");',
'    openModal(''dialogOffloadConfirm'');',
'    /*',
'    let confirmYesNoTexts = ("Confirmation##Confirmed##Cancel##cl-diag-big-font").split("##");',
'    let confirmYesNoOptions = ',
'    {',
'        "yes" : function() {apex.submit({request: ''OFFLOAD'', showWait: true});},',
'        "yestext" : (!!confirmYesNoTexts[1] ? confirmYesNoTexts[1] : ""),',
'        "notext" : (!!confirmYesNoTexts[2] ? confirmYesNoTexts[2] : ""),',
'        "titletext" : (!!confirmYesNoTexts[0] ? confirmYesNoTexts[0] : ""),',
'        "textclass" : (!!confirmYesNoTexts[3] ? confirmYesNoTexts[3] : "")',
'    };',
'    confirmYesNo("This will mark " + selected_count + " selected movement(s) as Offloaded. Please confirm.", confirmYesNoOptions);',
'    */',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181271403320901632)
,p_name=>'CANCEL_OFFLOAD: Close Dialog'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(181271386619901631)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181271534678901633)
,p_event_id=>wwv_flow_api.id(181271403320901632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181271615142901634)
,p_name=>'P8002_REMARKS: Activate Submit'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8002_REMARKS'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v("P8002_REMARKS").trim().length > 0'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181271705049901635)
,p_event_id=>wwv_flow_api.id(181271615142901634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(181271220217901630)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181271899716901636)
,p_event_id=>wwv_flow_api.id(181271615142901634)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(181271220217901630)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181270916840901627)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Offload'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    DL_BORDERCONTROL.PKG_EDITE_MOVEMENTS.offload_movements (',
'        p_COLL_NAME                  =>  ''P8002_COLL_OFFLOAD''',
'        , p_MVMNT_MANUAL_UPDATE_NOTE => :P8002_REMARKS',
'    );',
'',
'END;'))
,p_process_error_message=>'Error: Offload - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(181271220217901630)
,p_process_success_message=>'Offloaded successfully.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181268844498901606)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TOGGLE_OFFLOAD_SELECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_coll_name        VARCHAR2(100) := ''P8002_COLL_OFFLOAD'';',
'    l_mvmntid          VARCHAR2(100):= apex_application.g_x01;',
'    l_coll_seq         NUMBER := NVL(TO_NUMBER(apex_application.g_x02), 0);',
'    l_select_status    VARCHAR2(100):= apex_application.g_x03;',
'BEGIN',
'',
'    IF l_mvmntid IS NOT NULL AND l_coll_seq != 0 THEN',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE',
'        (',
'            p_collection_name => l_coll_name',
'            , p_seq  => l_coll_seq',
'            , p_attr_number => 1',
'            , p_number_value => CASE WHEN l_select_status = ''N'' THEN 1 ELSE 0 END',
'        );',
'        COMMIT;',
'    END IF;',
'',
'    -- return',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.write(''mvmntid'', l_mvmntid);',
'    apex_json.write(''select_status'', CASE WHEN l_select_status = ''N'' THEN ''Y'' WHEN l_select_status = ''Y'' THEN ''N'' END);',
'    apex_json.close_object;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        -- return',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''mvmntid'', l_mvmntid);',
'        apex_json.write(''select_status'', l_select_status);',
'        apex_json.write(''err_msg'', SQLERRM);',
'        apex_json.close_object;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181269452190901612)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TOGGLE_OFFLOAD_SELECTION_ALL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_coll_name     VARCHAR2(100) := ''P8002_COLL_OFFLOAD'';',
'    l_select_status VARCHAR2(100):= apex_application.g_x01;',
'    l_selected      NUMBER := 0;',
'    l_arr_seq       apex_application_global.vc_arr2;',
'    l_arr_mvmntid   apex_application_global.vc_arr2;',
'    l_arr_selected  apex_application_global.n_arr;',
'    ',
'BEGIN',
'',
'    IF l_select_status IS NOT NULL THEN',
'        SELECT DECODE(l_select_status, ''N'', 1, 0)',
'        INTO l_selected ',
'        FROM DUAL;',
'',
'        SELECT seq_id, c001, l_selected ',
'        BULK COLLECT INTO l_arr_seq, l_arr_mvmntid, l_arr_selected',
'        FROM apex_collections ',
'        WHERE collection_name = l_coll_name;',
'',
'        IF l_arr_mvmntid.COUNT > 0 THEN',
'            APEX_COLLECTION.UPDATE_MEMBERS(',
'                p_collection_name => l_coll_name',
'                , p_seq           => l_arr_seq',
'                , p_c001          => l_arr_mvmntid',
'                , p_n001          => l_arr_selected',
'            );',
'            COMMIT;',
'        END IF;',
'    END IF;',
'',
'    -- return',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.write(''select_status'', CASE WHEN l_select_status = ''N'' THEN ''Y'' WHEN l_select_status = ''Y'' THEN ''N'' END);',
'    apex_json.close_object;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        -- return',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''select_status'', l_select_status);',
'        apex_json.write(''err_msg'', SQLERRM);',
'        apex_json.close_object;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181269685632901614)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_COLL_COUNT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_coll_name      VARCHAR2(100) := UPPER(apex_application.g_x01);',
'    l_total_count    NUMBER := 0;',
'    l_selected_count NUMBER := 0;',
'BEGIN',
'',
'    IF l_coll_name IS NOT NULL AND APEX_COLLECTION.COLLECTION_EXISTS(l_coll_name) THEN',
'        l_total_count := APEX_COLLECTION.COLLECTION_MEMBER_COUNT(l_coll_name);',
'',
'        SELECT COUNT(1)',
'        INTO l_selected_count',
'        FROM apex_collections',
'        WHERE collection_name = l_coll_name',
'        AND n001 = 1;',
'    END IF;',
'',
'    apex_json.open_object();',
'    apex_json.write(''coll_name'', l_coll_name);',
'    apex_json.write(''total_count'', l_total_count);',
'    apex_json.write(''selected_count'', l_selected_count);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
