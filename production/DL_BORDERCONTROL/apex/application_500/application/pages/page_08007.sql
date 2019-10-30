prompt --application/pages/page_08007
begin
wwv_flow_api.create_page(
 p_id=>8007
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Movements Modal'
,p_page_mode=>'MODAL'
,p_step_title=>'Movements Modal'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Movements Modal'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'var lSpinner$ = apex.util.showSpinner($("div#id-ir-travel-history"));',
'var lastPibicsConnRequest;',
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
'    // 1: go for today',
'    if ($v("P8007_SCOPE") == "0") ',
'        return true;',
'',
'    // 2: go for docno, TM6 and citizenid',
'    if (!!$v("P8007_DOC_NUMBER") || !!$v("P8007_TRAVELCARD_NO") || !!$v("P8007_CITIZEN_ID_TH")) ',
'        return true;',
'',
'    // 3: atleast 2 search values are available',
'    let v_min_vals = 2, v_max_days = 30,',
'    v_el_cnt = $("#id-reg-filter").find(''input:not([type=radio]),select,textarea'').not(".cl-exclude-validation").length,',
'    v_empty_el_cnt = $("#id-reg-filter").find(''input:not([type=radio]),select,textarea'').not(".cl-exclude-validation").filter('':visible:not([disabled])'').filter(function(idx) { return $(this).val().trim().length < 1 }).length;',
'    v_vals_el_cnt = ((v_el_cnt - v_empty_el_cnt) || 0);',
'    if (v_vals_el_cnt >= v_min_vals) {',
'        // 3.1: atleast v_max_days difference',
'        if ((v_vals_el_cnt === 2) && !!$v("P8007_TRAVEL_DATE_FROM") && !!$v("P8007_TRAVEL_DATE_TO")) {',
'            let f_dmy = $v("P8007_TRAVEL_DATE_FROM").substr(0,10).split(''/''), t_dmy = $v("P8007_TRAVEL_DATE_TO").substr(0,10).split(''/'');',
'            let f_date = new Date(f_dmy[2], f_dmy[1]-1, f_dmy[0]), t_date = new Date(t_dmy[2], t_dmy[1]-1, t_dmy[0]);',
'            let diff = Math.round((t_date-f_date)/(1000*60*60*24));',
'            console.log("diff days: " + diff);',
'            if (diff <= v_max_days)',
'                return true;',
'            else',
'                return false;',
'        }',
'        else',
'            return true;',
'    }',
'',
'    return false;',
'}',
'',
'// DA',
'var p8007 = {',
'',
'    department: {',
'',
'        departmentIdItem: "",',
'        departmentSelectItem: "",',
'',
'        set: function(departmentIdItem, departmentSelectItem) {',
'            this.departmentIdItem = departmentIdItem;',
'            this.departmentSelectItem = departmentSelectItem;',
'        },',
'',
'        reset: function() {',
'            $("#" + this.departmentSelectItem).val("");',
'            $("#" + this.departmentIdItem).val("");',
'        },',
'',
'        getCheckIfRun: function() {',
'            return (!!$v(this.departmentSelectItem) || !!$v(this.departmentIdItem)) && GET_DEPT_CODES[$v(this.departmentSelectItem)] != $v(this.departmentIdItem);',
'        },',
'',
'        setIdItem: function() {',
'            if(this.getCheckIfRun()) {',
'                if (GET_DEPT_CODES[$v(this.departmentSelectItem)]) {',
'                    $("#" + this.departmentIdItem).val(GET_DEPT_CODES[$v(this.departmentSelectItem)]);',
'                }',
'                else {',
'                    this.reset();',
'                }',
'                $("#" + this.departmentIdItem).trigger("change");',
'            }',
'        },',
'',
'        setSelectItem: function() {',
'            if(this.getCheckIfRun()) {',
'                if (GET_DEPT_SEQUENCES[$v(this.departmentIdItem)]) {',
'                    $("#" + this.departmentSelectItem).val(GET_DEPT_SEQUENCES[$v(this.departmentIdItem)]);',
'                }',
'                else {',
'                    this.reset();',
'                }',
'                $("#" + this.departmentSelectItem).trigger("change");',
'            }',
'        }',
'    }',
'',
'}',
'',
'//disable buttons',
'function enableButtons() {',
'    $(".cl-button-submit").prop("disabled", false);',
'}',
'',
'function disableButtons() {',
'    $(".cl-button-submit").prop("disabled", true);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#wwvFlowForm").submit(function () {',
'    disableButtons();',
'    return true;',
'});',
'',
'$(".auto-upper-case").keyup((elem) => {',
'    upperCaseF(elem.target);',
'});',
'',
'apex.server.process("GET_RELATIONS", ',
'{}, ',
'{',
'    success: function(pData) ',
'    {',
'        GET_DEPT_CODES = pData[0];',
'        GET_DEPT_SEQUENCES = pData[1];',
'        ',
'        console.log(pData);',
'    }',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.t-Body-content {',
'    padding-bottom: 2rem !important;',
'}',
'',
'.t-Body-topButton {',
'    display: none !important;',
'}',
'',
'td {',
'	    background: linear-gradient(transparent, transparent, rgba(0, 0, 0, 0.12));',
'}',
'*/',
'',
'.cl-margin-left-n40 {',
'    margin-left: -70px !important;',
'}',
'',
'.t-Footer-apex {',
'    display: none;',
'}',
'',
'input.cl-display-only[type="text"] {',
'    border: none;',
'    background: none;',
'    font-weight: bold;',
'}',
'',
'.cl-button-submit:disabled {',
'    cursor: not-allowed;',
'    pointer-events: auto;',
'}',
'',
'.t-Form-fieldContainer--radioButtonGroup .apex-item-radio input:checked + label, ',
'.apex-button-group input:checked + label {',
'    background-color: #0572ce;',
'    color: #fff;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_css_classes=>'cl-page-th-modal-8007'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190916111803'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4794824221233632663)
,p_plug_name=>'Filter'
,p_region_name=>'id-reg-filter'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
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
 p_id=>wwv_flow_api.id(4826686430370013475)
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
 p_id=>wwv_flow_api.id(4827266875501101162)
,p_plug_name=>'Movements'
,p_region_name=>'id-ir-travel-history'
,p_region_css_classes=>'cl-ir-dynamic-display'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>600
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    --ac.c001 AS DATA_SOURCE',
'      ac.c023 AS DATA_SOURCE',
'    , ac.c002 AS DATA_SOURCE_SEC',
'    , ac.c003 AS DATA_SOURCE_SEC_PK_VAL',
'    , ac.c004 AS MVMNTID',
'    , ac.c005 AS DIRECTION',
'    , ac.c006 AS IMAGE_EXISTS',
'    , ac.c007 AS PERSON_TYPE',
'    , ac.c008 AS DOCUMENT_NUMBER',
'    , ac.c009 AS TM6_NUMBER',
'    , ac.c010 AS GIVENNAME_EN',
'    , ac.c011 AS MIDDLENAME_EN',
'    , ac.c012 AS SURNAME_EN',
'    , ac.c013 AS GIVENNAME_TH',
'    , ac.c014 AS MIDDLENAME_TH',
'    , ac.c015 AS SURNAME_TH',
'    , ac.c016 AS NATIONALITY',
'    , ac.c017 AS DOB',
'    , ac.c018 AS SEX',
'    , ac.c019 AS VISA_TYPE',
'    , ac.c020 AS VEHICLE_NO',
'    , TO_DATE(ac.c021, ''DD/MM/YYYY HH24:MI:SS'') AS TRAVEL_DATE',
'    , ac.c022 AS BORDERPOST',
'    -----',
'    , CASE ',
'        WHEN NVL(TO_NUMBER(ac.c025), 0) > 0 THEN ''Y''',
'        ELSE NULL',
'      END AS IS_COLLECTIVE',
'    , CASE ',
'        WHEN NVL(TO_NUMBER(ac.c025), 0) > 0 THEN ''<span class="fa fa-users" title="Collective"></span>''',
'        ELSE NULL',
'      END AS IS_COLLECTIVE_ICON',
'    -----',
'    , CASE ',
'        WHEN ',
'            ac.c023 IN (''BIO'', ''OFF'')',
'            AND ac.c022 = :AI_BORDERPOST_ID',
'            AND :P8007_IS_EDIT_PAGE_ALLOWED = ''Y''',
'            AND ',
'            (',
'                :P8007_IS_SUPERVISOR = ''Y''',
'                OR',
'                (',
'                    ac.c024 = UPPER(:APP_USER)',
'                    AND',
'                    TO_DATE(ac.c021, ''DD/MM/YYYY HH24:MI:SS'') BETWEEN SYSDATE - 1 AND SYSDATE',
'                )',
'            )',
'            THEN ',
'            ''<button type="button" class="t-Button" title="Edit Movement" onclick="''|| APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:4020:&APP_SESSION.::&DEBUG.:RP,4020:P4020_FP,P4020_MVMNTID:&APP_PAGE_ID.,'' || ac.c004, p_checksum_type => ''SESSION'') |'
||'| ''" value="EDIT_MOVEMENT"><span class="fa fa-user-edit"></span></button>''',
'        ELSE NULL',
'      END AS EDIT_MOVEMENT',
'    -----',
'FROM apex_collections ac',
'WHERE ac.collection_name = ''P8007_COLL_TRAVEL_HISTORY''',
'AND CASE WHEN REGEXP_LIKE(:REQUEST, ''(CSV|HTMLD|PDF)$'') THEN ''Y'' ELSE :P8007_DR END = ''Y''',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P8007_DR'
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
 p_id=>wwv_flow_api.id(4827267041391101163)
,p_max_row_count=>'100000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:PDF'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP,171:P171_MVMNTID,P171_DATA_SOURCE_SEC,P171_DATA_SOURCE_SEC_PK_VAL,P171_CHECK_PIBICS_CONN:#MVMNTID#,#DATA_SOURCE_SEC#,#DATA_SOURCE_SEC_PK_VAL#,&P8007_CHECK_PIBICS_CONN.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_owner=>'ADMIN'
,p_internal_uid=>4827267041391101163
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693780841487246771)
,p_db_column_name=>'DATA_SOURCE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693781122783246779)
,p_db_column_name=>'DATA_SOURCE_SEC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Data source sec'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693781592897246780)
,p_db_column_name=>'DATA_SOURCE_SEC_PK_VAL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Data source sec pk val'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693781923618246780)
,p_db_column_name=>'MVMNTID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693782378950246781)
,p_db_column_name=>'DIRECTION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Direction'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(262034404724586336)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693782702545246781)
,p_db_column_name=>'IMAGE_EXISTS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Image Exists'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693783170354246782)
,p_db_column_name=>'PERSON_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Person Type'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(227888123469882486)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693783549246246785)
,p_db_column_name=>'DOCUMENT_NUMBER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Document No'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693783978599246785)
,p_db_column_name=>'TM6_NUMBER'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'TM6 No'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693784340800246785)
,p_db_column_name=>'GIVENNAME_EN'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Givenname'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693784725041246786)
,p_db_column_name=>'MIDDLENAME_EN'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Middlename'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693785168114246786)
,p_db_column_name=>'SURNAME_EN'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Surname'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693785523276246786)
,p_db_column_name=>'GIVENNAME_TH'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Givenname Thai'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693785903533246787)
,p_db_column_name=>'MIDDLENAME_TH'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Middlename Thai'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693786329943246787)
,p_db_column_name=>'SURNAME_TH'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Surname Thai'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693786736985246787)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(193497710818067469)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693787107006246790)
,p_db_column_name=>'DOB'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'DOB'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693787563334246790)
,p_db_column_name=>'SEX'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693787967725246790)
,p_db_column_name=>'VISA_TYPE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Visa Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693788331812246792)
,p_db_column_name=>'VEHICLE_NO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Vehicle No'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693788768325246792)
,p_db_column_name=>'BORDERPOST'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Borderpost'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(35878484570979863151)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693789136430246793)
,p_db_column_name=>'TRAVEL_DATE'
,p_display_order=>230
,p_column_identifier=>'AB'
,p_column_label=>'Travel Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693789508919246794)
,p_db_column_name=>'EDIT_MOVEMENT'
,p_display_order=>240
,p_column_identifier=>'AC'
,p_column_label=>'Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693789957198246794)
,p_db_column_name=>'IS_COLLECTIVE'
,p_display_order=>250
,p_column_identifier=>'AD'
,p_column_label=>'Collective?'
,p_column_html_expression=>'#IS_COLLECTIVE_ICON#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693790310548246794)
,p_db_column_name=>'IS_COLLECTIVE_ICON'
,p_display_order=>260
,p_column_identifier=>'AE'
,p_column_label=>'Is collective icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4827299198451122012)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46937907'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'DIRECTION:IMAGE_EXISTS:IS_COLLECTIVE:DOCUMENT_NUMBER:TM6_NUMBER:BORDERPOST:GIVENNAME_EN:MIDDLENAME_EN:SURNAME_EN:GIVENNAME_TH:MIDDLENAME_TH:SURNAME_TH:NATIONALITY:DOB:SEX:VISA_TYPE:TRAVEL_DATE:PERSON_TYPE:VEHICLE_NO:DATA_SOURCE:EDIT_MOVEMENT:'
,p_sort_column_1=>'TRAVEL_DATE'
,p_sort_direction_1=>'DESC'
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
 p_id=>wwv_flow_api.id(4827269793373101191)
,p_plug_name=>'Info'
,p_region_name=>'id-reg-info'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading:margin-bottom-sm'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'For a "Historical" search - ',
'<ul>',
'<li>Please search with atleast two conditions except when searching with "Document No", "TM6 No" or "Thai Citizen ID".</li>',
'<li>If searching only by travel dates, please keep the maximum number of days less than 30 between the From date and the To date.</li>',
'</ul>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5121971776676254931)
,p_plug_name=>'Movements OLD'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>300
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'',
'--(select a.name from agents a where a.active = 1 and a.ID = (select agentid from flights f where f.flightnum = m.scanned_flight and not f.directionflg = m.exitflg and f.active = 1)) ',
'null as airline,',
'--(select a.name from airports a where a.ID = (select originairportid from flights f where f.flightnum = m.scanned_flight and not f.directionflg = m.exitflg and f.active = 1)) ',
'null as originairport,',
'--(select a.name from airports a where a.ID = (select destinairportid from flights f where f.flightnum = m.scanned_flight and not f.directionflg = m.exitflg and f.active = 1)) ',
'null as destinationairport,',
'm.*,',
'dbms_lob.getlength("PASS_VISUAL_FACE") "PASS_VISUAL_FACE",',
'dbms_lob.getlength("PASS_ICAO_FACE") "PASS_ICAO_FACE",',
'dbms_lob.getlength("PASS_VISUALPAGE") "PASS_VISUALPAGE",',
'dbms_lob.getlength("PASS_UVPAGE") "PASS_UVPAGE",',
'dbms_lob.getlength("PASS_IRPAGE") "PASS_IRPAGE",',
'dbms_lob.getlength("PASS_DG3_0") "PASS_DG3_0",',
'dbms_lob.getlength("PASS_DG3_1") "PASS_DG3_1",',
'q.DOCNO DocNo,',
'(select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d',
'from DL_COMMON.HUMAN_SEXES$LC',
'where NUM_VALUE = q.sex) as sex,',
'',
'q.NAt NationalityDocument,',
'q.givenname "Given Name",',
'q.surname "Surname",',
'q.middlename "Middle Name",',
'q.givenname_thai "Given Name Thai",',
'q.middlename_thai "Middle Name Thai",',
'q.surname_thai "Surname Thai",',
'PKG_COMMON.Parse_Date(dob, 1, 0, 0, 1) dob, -- to_date(q.dob, ''RRMMDD'') dob,',
'q.expirydate,',
'q.docclass doctype,',
'(select NVL(display_value,display_value$dlc) from DL_COMMON.ICAO_DOC_CODES$LC where key_value = q.nat) nationality_text,',
'(select NVL(display_value,display_value$dlc) from DL_COMMON.ICAO_DOC_CODES$LC where key_value = issuectry) issue_country_text,',
'',
'/*''<img style="border: 0px solid #CCC; -moz-border-radius: 0px; -webkit-border-radius: 0px;object-fit:contain;" ''||''src="''||decode(nvl(dbms_lob.getlength(PASS_ICAO_FACE),0),0,''#WORKSPACE_IMAGES#no_photo_01.png'',apex_util.get_blob_file_src(''P6_PASS_IC'
||'AO_FACE'',q.BRDDOCID))||''" height="120" width="80"  />'' img_icao_face,',
'''<img style="border: 0px solid #CCC; -moz-border-radius: 0px; -webkit-border-radius: 0px;object-fit:contain;" ''||''src="''||case when nvl(dbms_lob.getlength(PSBLOB_1),0) = 0 and nvl(dbms_lob.getlength(PASS_VISUAL_FACE), 0) = 0 then ''#WORKSPACE_IMAGES#n'
||'o_photo_01.png'' when nvl(dbms_lob.getlength(PSBLOB_1),0) = 0 then apex_util.get_blob_file_src(''P6_PASS_VISUAL_FACE'',q.BRDDOCID) else apex_util.get_blob_file_src(''P171_MVMNT_SCANPHOTO'',m.MVMNTID) end||''" height="120" width="80" />'' img_visual,',
'''<img style="border: 0px solid #CCC; -moz-border-radius: 0px; -webkit-border-radius: 0px;object-fit:contain;" ''||''src="''||decode(nvl(dbms_lob.getlength(LIVE_PHOTO),0),0,''#WORKSPACE_IMAGES#no_photo_01.png'',apex_util.get_blob_file_src(''P171_MVMNT_PHOTO'
||''',m.MVMNTID))||''" height="120" width="80" />'' img_movement_face,',
'''<img style="border: 0px solid #CCC; -moz-border-radius: 0px; -webkit-border-radius: 0px;object-fit:contain;" ''||''src="''||decode(nvl(dbms_lob.getlength(LANDINGCARD_PAGE),0),0,''#WORKSPACE_IMAGES#03_Landing-Card.png'',apex_util.get_blob_file_src(''P171_L'
||'ANDINGCARD'',m.MVMNTID))||''" height="120" width="160" />'' img_landingcard,',
'''<img style="border: 0px solid #CCC; -moz-border-radius: 0px; -webkit-border-radius: 0px;object-fit:contain;" ''||''src="''||decode(nvl(dbms_lob.getlength(VISA_PAGE),0),0,''#WORKSPACE_IMAGES#01_visum.png'',apex_util.get_blob_file_src(''P171_VISA'',m.MVMNTID'
||'))||''" height="120" width="160" />'' img_visapage,*/',
'',
'PKG_COMMON.Resolve_Host(m.ins_TERMINAL) workstation_host',
', TRIM(regexp_replace(decode(m.dml_by, ''n.a.'', ''EGATE'', m.dml_by), ''([^@]*).*'', ''\1'')) officer',
'',
'from',
'V_BORDEROCUMENTS q inner join v_movements m on m.BRDDOCID = q.BRDDOCID',
'where m.ins_borderpost = :P8007_SELECT_SERVER or nvl(:P8007_SELECT_SERVER, ''N/A'') = ''N/A''',
'and ',
'(',
'    :P8007_SURNAME IS NULL ',
'    OR',
'    q.surname like ''%'' || UPPER(:P8007_SURNAME) || ''%''',
')',
'and ',
'(',
'    :P8007_FIRSTNAME IS NULL ',
'    OR',
'    q.givenname like ''%'' || UPPER(:P8007_FIRSTNAME) || ''%''',
')',
'and ',
'(',
'    :P8007_MIDDLENAME IS NULL ',
'    OR',
'    q.middlename like ''%'' || UPPER(:P8007_MIDDLENAME) || ''%''',
')',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5121972084178254936)
,p_name=>'Border Control System'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:PDF'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.::P171_MVMNTID:#MVMNTID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>5121972084178254936
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693816080675246882)
,p_db_column_name=>'PASS_VISUAL_FACE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Pass Visual Face'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_format_mask=>'DOWNLOAD:V_BORDEROCUMENTS:PASS_VISUAL_FACE:BRDDOCID::::::Attachment:Download:'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693816477424246882)
,p_db_column_name=>'PASS_ICAO_FACE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Pass Icao Face'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_format_mask=>'DOWNLOAD:V_BORDEROCUMENTS:PASS_ICAO_FACE:BRDDOCID::::::Attachment:Download:'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693816894553246882)
,p_db_column_name=>'PASS_VISUALPAGE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Pass Visualpage'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_format_mask=>'DOWNLOAD:V_BORDEROCUMENTS:PASS_VISUALPAGE:BRDDOCID::::::Attachment:Download:'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693817265876246883)
,p_db_column_name=>'PASS_UVPAGE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Pass Uvpage'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_format_mask=>'DOWNLOAD:V_BORDEROCUMENTS:PASS_UVPAGE:BRDDOCID::::::Attachment:Download:'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693817695917246883)
,p_db_column_name=>'PASS_IRPAGE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Pass Irpage'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_format_mask=>'DOWNLOAD:V_BORDEROCUMENTS:PASS_IRPAGE:BRDDOCID::::::Attachment:Download:'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693818070877246887)
,p_db_column_name=>'PASS_DG3_0'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Pass Dg3 0'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_format_mask=>'DOWNLOAD:V_BORDEROCUMENTS:PASS_DG3_0:BRDDOCID::::::Attachment:Download:'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693818478459246887)
,p_db_column_name=>'PASS_DG3_1'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Pass Dg3 1'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_format_mask=>'DOWNLOAD:V_BORDEROCUMENTS:PASS_DG3_1:BRDDOCID::::::Attachment:Download:'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693804593683246843)
,p_db_column_name=>'BRDDOCID'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Document ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693804933173246844)
,p_db_column_name=>'EXITFLG'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Movement Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(262034404724586336)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693805393387246845)
,p_db_column_name=>'FINGERMATCH'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Finger MATCH?'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(558108972921270797)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693805741985246846)
,p_db_column_name=>'FACEMATCH'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Face MATCH?'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(558108972921270797)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693806133486246846)
,p_db_column_name=>'MVMNTID'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693806530103246848)
,p_db_column_name=>'SCANNED_FLIGHT'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Transport'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693806939781246848)
,p_db_column_name=>'LANDBARCD'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Landbarcd'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693807390700246849)
,p_db_column_name=>'MVMNTADDR'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Mvmntaddr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693807721126246849)
,p_db_column_name=>'ORIDEST'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Oridest'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693808166334246849)
,p_db_column_name=>'REFUSEDFLG'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Refusedflg'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693808520660246850)
,p_db_column_name=>'OBSERVATION'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Note'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693808911737246850)
,p_db_column_name=>'MVMNT_ID'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Movement ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693809370714246851)
,p_db_column_name=>'WSQ_LL'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Wsq Ll'
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
 p_id=>wwv_flow_api.id(4693809747660246856)
,p_db_column_name=>'WSQ_LI'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Wsq Li'
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
 p_id=>wwv_flow_api.id(4693810177259246859)
,p_db_column_name=>'WSQ_LM'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Wsq Lm'
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
 p_id=>wwv_flow_api.id(4693810582495246859)
,p_db_column_name=>'WSQ_LR'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Wsq Lr'
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
 p_id=>wwv_flow_api.id(4693810980416246859)
,p_db_column_name=>'WSQ_LT'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Wsq Lt'
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
 p_id=>wwv_flow_api.id(4693811376345246860)
,p_db_column_name=>'WSQ_RL'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Wsq Rl'
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
 p_id=>wwv_flow_api.id(4693811730791246860)
,p_db_column_name=>'WSQ_RI'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Wsq Ri'
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
 p_id=>wwv_flow_api.id(4693812160420246877)
,p_db_column_name=>'WSQ_RM'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Wsq Rm'
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
 p_id=>wwv_flow_api.id(4693812468733246878)
,p_db_column_name=>'WSQ_RR'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Wsq Rr'
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
 p_id=>wwv_flow_api.id(4693812891409246879)
,p_db_column_name=>'WSQ_RT'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Wsq Rt'
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
 p_id=>wwv_flow_api.id(4693813256588246879)
,p_db_column_name=>'VISA_PAGE'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Visa Page'
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
 p_id=>wwv_flow_api.id(4693813625467246880)
,p_db_column_name=>'LANDINGCARD_PAGE'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Travelcard Page'
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
 p_id=>wwv_flow_api.id(4693814046186246880)
,p_db_column_name=>'LIVE_PHOTO'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Live Photo'
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
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693814497491246880)
,p_db_column_name=>'DOCNO'
,p_display_order=>84
,p_column_identifier=>'BN'
,p_column_label=>'Document No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693814816783246881)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>85
,p_column_identifier=>'BO'
,p_column_label=>'Nationality Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693815219944246881)
,p_db_column_name=>'Given Name'
,p_display_order=>86
,p_column_identifier=>'BP'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693815654665246881)
,p_db_column_name=>'Surname'
,p_display_order=>87
,p_column_identifier=>'BQ'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693818855262246888)
,p_db_column_name=>'PS_1'
,p_display_order=>90
,p_column_identifier=>'BT'
,p_column_label=>'Visa Info'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693819233127246888)
,p_db_column_name=>'PS_2'
,p_display_order=>91
,p_column_identifier=>'BU'
,p_column_label=>'Travel Card Info'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693819606179246888)
,p_db_column_name=>'PS_3'
,p_display_order=>92
,p_column_identifier=>'BV'
,p_column_label=>'Supervisor Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693820033517246889)
,p_db_column_name=>'PS_4'
,p_display_order=>93
,p_column_identifier=>'BW'
,p_column_label=>'Supervisor Reason'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693820421985246891)
,p_db_column_name=>'PS_5'
,p_display_order=>94
,p_column_identifier=>'BX'
,p_column_label=>'Ps 5'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693820853850246892)
,p_db_column_name=>'PS_6'
,p_display_order=>95
,p_column_identifier=>'BY'
,p_column_label=>'Ps 6'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693821240420246893)
,p_db_column_name=>'PS_7'
,p_display_order=>96
,p_column_identifier=>'BZ'
,p_column_label=>'Ps 7'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693821682791246893)
,p_db_column_name=>'PS_8'
,p_display_order=>97
,p_column_identifier=>'CA'
,p_column_label=>'Ps 8'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693822069196246893)
,p_db_column_name=>'PS_9'
,p_display_order=>98
,p_column_identifier=>'CB'
,p_column_label=>'Ps 9'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693822472285246894)
,p_db_column_name=>'PS_10'
,p_display_order=>99
,p_column_identifier=>'CC'
,p_column_label=>'Ps 10'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693822835040246894)
,p_db_column_name=>'PSBLOB_1'
,p_display_order=>100
,p_column_identifier=>'CD'
,p_column_label=>'Psblob 1'
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
 p_id=>wwv_flow_api.id(4693823293854246894)
,p_db_column_name=>'PSBLOB_2'
,p_display_order=>101
,p_column_identifier=>'CE'
,p_column_label=>'Psblob 2'
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
 p_id=>wwv_flow_api.id(4693823670910246895)
,p_db_column_name=>'PSBLOB_3'
,p_display_order=>102
,p_column_identifier=>'CF'
,p_column_label=>'Psblob 3'
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
 p_id=>wwv_flow_api.id(4693824027627246902)
,p_db_column_name=>'PSBLOB_4'
,p_display_order=>103
,p_column_identifier=>'CG'
,p_column_label=>'Psblob 4'
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
 p_id=>wwv_flow_api.id(4693824486304246902)
,p_db_column_name=>'PSBLOB_5'
,p_display_order=>104
,p_column_identifier=>'CH'
,p_column_label=>'Psblob 5'
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
 p_id=>wwv_flow_api.id(4693824838235246903)
,p_db_column_name=>'PSBLOB_6'
,p_display_order=>105
,p_column_identifier=>'CI'
,p_column_label=>'Psblob 6'
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
 p_id=>wwv_flow_api.id(4693825270206246903)
,p_db_column_name=>'PSBLOB_7'
,p_display_order=>106
,p_column_identifier=>'CJ'
,p_column_label=>'Psblob 7'
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
 p_id=>wwv_flow_api.id(4693825604631246905)
,p_db_column_name=>'PSBLOB_8'
,p_display_order=>107
,p_column_identifier=>'CK'
,p_column_label=>'Psblob 8'
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
 p_id=>wwv_flow_api.id(4693826026867246905)
,p_db_column_name=>'PSBLOB_9'
,p_display_order=>108
,p_column_identifier=>'CL'
,p_column_label=>'Psblob 9'
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
 p_id=>wwv_flow_api.id(4693826470652246906)
,p_db_column_name=>'PSBLOB_10'
,p_display_order=>109
,p_column_identifier=>'CM'
,p_column_label=>'Psblob 10'
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
 p_id=>wwv_flow_api.id(4693826861375246906)
,p_db_column_name=>'DOB'
,p_display_order=>110
,p_column_identifier=>'CN'
,p_column_label=>'Date of Birth'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693827212774246906)
,p_db_column_name=>'MANUALEXPIRYDATE'
,p_display_order=>111
,p_column_identifier=>'CO'
,p_column_label=>'Manual Expiry Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693827647188246907)
,p_db_column_name=>'PLACEOFBIRTH'
,p_display_order=>113
,p_column_identifier=>'CQ'
,p_column_label=>'Place of Birth'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693828006213246918)
,p_db_column_name=>'EXPIRYDATE'
,p_display_order=>114
,p_column_identifier=>'CR'
,p_column_label=>'Expiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'dd/mm/yyyy'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693828456052246918)
,p_db_column_name=>'DATEOFISSUE'
,p_display_order=>115
,p_column_identifier=>'CS'
,p_column_label=>'Date of Issue'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693828833104246918)
,p_db_column_name=>'SEX'
,p_display_order=>117
,p_column_identifier=>'CU'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(577782878906762560)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693829270501246919)
,p_db_column_name=>'AIRLINE'
,p_display_order=>118
,p_column_identifier=>'CV'
,p_column_label=>'Airline'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693829661925246919)
,p_db_column_name=>'ORIGINAIRPORT'
,p_display_order=>119
,p_column_identifier=>'CW'
,p_column_label=>'Origin'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693830006201246919)
,p_db_column_name=>'DESTINATIONAIRPORT'
,p_display_order=>120
,p_column_identifier=>'CX'
,p_column_label=>'Destination'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693830493830246920)
,p_db_column_name=>'REASON_OFFLOAD'
,p_display_order=>121
,p_column_identifier=>'CY'
,p_column_label=>'Reason Offload'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693830815842246920)
,p_db_column_name=>'REASON_DEPORTEE'
,p_display_order=>122
,p_column_identifier=>'CZ'
,p_column_label=>'Reason Deportee'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693831251868246920)
,p_db_column_name=>'NATIONALITY_TEXT'
,p_display_order=>123
,p_column_identifier=>'DA'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693831633649246921)
,p_db_column_name=>'ISSUE_COUNTRY_TEXT'
,p_display_order=>124
,p_column_identifier=>'DB'
,p_column_label=>'Issue Country Text'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693832033343246921)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>125
,p_column_identifier=>'DC'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(196355819822032911)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693832452969246921)
,p_db_column_name=>'WORKSTATION_HOST'
,p_display_order=>126
,p_column_identifier=>'DD'
,p_column_label=>'Workstation Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693832880554246922)
,p_db_column_name=>'OFFICER'
,p_display_order=>129
,p_column_identifier=>'DG'
,p_column_label=>'Officer'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(101033230114218928)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693793320660246829)
,p_db_column_name=>'TRNSPRTUNITID'
,p_display_order=>132
,p_column_identifier=>'DJ'
,p_column_label=>'Trnsprtunitid'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693793783088246830)
,p_db_column_name=>'PERSON_TYPE'
,p_display_order=>133
,p_column_identifier=>'DK'
,p_column_label=>'Person Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(227888123469882486)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693794187590246830)
,p_db_column_name=>'MAX_STAY_DT'
,p_display_order=>143
,p_column_identifier=>'DL'
,p_column_label=>'Max stay dt'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693794523875246831)
,p_db_column_name=>'INS_AT'
,p_display_order=>153
,p_column_identifier=>'DM'
,p_column_label=>'Ins at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693794952753246832)
,p_db_column_name=>'VISA_TYPE'
,p_display_order=>163
,p_column_identifier=>'DN'
,p_column_label=>'Visa type'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(261858493820090450)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693795336254246833)
,p_db_column_name=>'VISA'
,p_display_order=>173
,p_column_identifier=>'DO'
,p_column_label=>'Visa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693795743564246833)
,p_db_column_name=>'DML_BY'
,p_display_order=>183
,p_column_identifier=>'DP'
,p_column_label=>'Dml by'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693798576532246836)
,p_db_column_name=>'INS_BY'
,p_display_order=>193
,p_column_identifier=>'DQ'
,p_column_label=>'Ins by'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693798926940246836)
,p_db_column_name=>'DML_AT'
,p_display_order=>203
,p_column_identifier=>'DR'
,p_column_label=>'Dml at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693799390029246837)
,p_db_column_name=>'DML_TYPE'
,p_display_order=>213
,p_column_identifier=>'DS'
,p_column_label=>'Dml type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693799724343246838)
,p_db_column_name=>'INS_TERMINAL'
,p_display_order=>223
,p_column_identifier=>'DT'
,p_column_label=>'Ins terminal'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(144221173136607154)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693800180648246838)
,p_db_column_name=>'INS_BORDERPOST'
,p_display_order=>233
,p_column_identifier=>'DU'
,p_column_label=>'Ins borderpost'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(182747869576861229)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693800546155246839)
,p_db_column_name=>'TEMPLATE_LL'
,p_display_order=>243
,p_column_identifier=>'DV'
,p_column_label=>'Template ll'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693800989964246839)
,p_db_column_name=>'TEMPLATE_LI'
,p_display_order=>253
,p_column_identifier=>'DW'
,p_column_label=>'Template li'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693801308420246840)
,p_db_column_name=>'TEMPLATE_LM'
,p_display_order=>263
,p_column_identifier=>'DX'
,p_column_label=>'Template lm'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693801779778246840)
,p_db_column_name=>'TEMPLATE_LR'
,p_display_order=>273
,p_column_identifier=>'DY'
,p_column_label=>'Template lr'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693802172075246841)
,p_db_column_name=>'TEMPLATE_LT'
,p_display_order=>283
,p_column_identifier=>'DZ'
,p_column_label=>'Template lt'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693802526721246841)
,p_db_column_name=>'TEMPLATE_RL'
,p_display_order=>293
,p_column_identifier=>'EA'
,p_column_label=>'Template rl'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693802900457246841)
,p_db_column_name=>'TEMPLATE_RI'
,p_display_order=>303
,p_column_identifier=>'EB'
,p_column_label=>'Template ri'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693803386926246842)
,p_db_column_name=>'TEMPLATE_RM'
,p_display_order=>313
,p_column_identifier=>'EC'
,p_column_label=>'Template rm'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693803743250246842)
,p_db_column_name=>'TEMPLATE_RR'
,p_display_order=>323
,p_column_identifier=>'ED'
,p_column_label=>'Template rr'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693804104811246843)
,p_db_column_name=>'TEMPLATE_RT'
,p_display_order=>333
,p_column_identifier=>'EE'
,p_column_label=>'Template rt'
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
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693796139495246834)
,p_db_column_name=>'PRIOR_MOVEMENT'
,p_display_order=>353
,p_column_identifier=>'EG'
,p_column_label=>'Prior movement'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693796565451246834)
,p_db_column_name=>'ENTRY_FORM'
,p_display_order=>363
,p_column_identifier=>'EH'
,p_column_label=>'Entry form'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693796940990246834)
,p_db_column_name=>'MOVEMENT_DT'
,p_display_order=>373
,p_column_identifier=>'EI'
,p_column_label=>'Movement dt'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693797341090246835)
,p_db_column_name=>'DATE_OF_ENTRY'
,p_display_order=>383
,p_column_identifier=>'EJ'
,p_column_label=>'Date of entry'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693797760876246835)
,p_db_column_name=>'NATIONALITYDOCUMENT'
,p_display_order=>393
,p_column_identifier=>'EK'
,p_column_label=>'Nationalitydocument'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693798136740246836)
,p_db_column_name=>'IS_FINISHED'
,p_display_order=>413
,p_column_identifier=>'EL'
,p_column_label=>'Is finished'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693791748316246806)
,p_db_column_name=>'Middle Name'
,p_display_order=>423
,p_column_identifier=>'EM'
,p_column_label=>'Middle name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693792127095246821)
,p_db_column_name=>'Given Name Thai'
,p_display_order=>433
,p_column_identifier=>'EN'
,p_column_label=>'Given name thai'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693792531995246821)
,p_db_column_name=>'Middle Name Thai'
,p_display_order=>443
,p_column_identifier=>'EO'
,p_column_label=>'Middle name thai'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4693792945769246822)
,p_db_column_name=>'Surname Thai'
,p_display_order=>453
,p_column_identifier=>'EP'
,p_column_label=>'Surname thai'
,p_column_type=>'STRING'
);
end;
/
begin
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5121992725977254957)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46938332'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'EXITFLG:PERSON_TYPE:Given Name:Surname:SEX:DOB:NATIONALITY_TEXT:DOCTYPE:DOCNO:EXPIRYDATE:SCANNED_FLIGHT:MOVEMENT_DT:VISA_TYPE:MAX_STAY_DT:OFFICER:INS_BORDERPOST::Middle Name:Given Name Thai:Middle Name Thai:Surname Thai'
,p_sort_column_1=>'MOVEMENT_DT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'CREATED'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'MOVEMENTCREATED'
,p_sort_direction_3=>'DESC'
,p_break_on=>'0:0:0:0:0'
,p_break_enabled_on=>'0:0:0:0:0'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(4693834054164246923)
,p_report_id=>wwv_flow_api.id(5121992725977254957)
,p_name=>'Arrival'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'EXITFLG'
,p_operator=>'='
,p_expr=>'Arrival'
,p_condition_sql=>' (case when ("EXITFLG" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Arrival''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FFDCD1'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(4693834439836246924)
,p_report_id=>wwv_flow_api.id(5121992725977254957)
,p_name=>'Departure'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'EXITFLG'
,p_operator=>'='
,p_expr=>'Departure'
,p_condition_sql=>' (case when ("EXITFLG" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Departure''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#DAE9F5'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(4693833667362246923)
,p_report_id=>wwv_flow_api.id(5121992725977254957)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'IS_FINISHED'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>'"IS_FINISHED" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5122294034519431694)
,p_plug_name=>'Travel History'
,p_icon_css_classes=>'fa-database'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this page to browse all movements in the system.',
'Use the various filter options to generate reports on demand.'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5613339424043033654)
,p_plug_name=>'Server Selector'
,p_parent_plug_id=>wwv_flow_api.id(5122294034519431694)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 30rem"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4693765498613246719)
,p_button_sequence=>310
,p_button_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BODY'
,p_button_css_classes=>'cl-button-submit'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4693765818831246720)
,p_button_sequence=>320
,p_button_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:8007:&SESSION.::&DEBUG.:RP,8001:P8007_INIT_LOAD:Y'
,p_button_css_classes=>'cl-button-submit'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4693846737064246943)
,p_branch_name=>'Go To Page 8007'
,p_branch_action=>'f?p=&APP_ID.:8007:&SESSION.::&DEBUG.:RP:P8007_INIT_LOAD:&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4693765498613246719)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4693847198273246943)
,p_branch_name=>'Go To Page 8007'
,p_branch_action=>'f?p=&APP_ID.:8007:&SESSION.::&DEBUG.:RP:P8007_INIT_LOAD:&P8007_INIT_LOAD.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693766267911246722)
,p_name=>'P8007_SCOPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
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
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693766630039246729)
,p_name=>'P8007_DIRECTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
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
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693767093137246729)
,p_name=>'P8007_SOURCE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Source :'
,p_source=>'BIO'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:BIO;BIO,PIBICS;PIBICS,ATC;ATC,OFF;OFF'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- ALL --'
,p_lov_null_value=>'ALL'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693767409976246730)
,p_name=>'P8007_ROWS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Max Rows Limit :'
,p_source=>'1000'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT num_value d, num_value r',
'FROM',
'(',
'    SELECT LEVEL*1000 num_value',
'    FROM DUAL',
'    CONNECT BY LEVEL <= 10',
');'))
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation'
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693767874565246730)
,p_name=>'P8007_NATIONALITY_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Nationality :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>5
,p_cMaxlength=>3
,p_tag_css_classes=>'cl-exclude-validation auto-upper-case'
,p_colspan=>2
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693768258643246730)
,p_name=>'P8007_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Nationality :'
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
,p_lov_null_text=>'-- ALL --'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_column=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-margin-left-n40'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693768660834246730)
,p_name=>'P8007_SURNAME_EN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'English Surname :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693769055206246730)
,p_name=>'P8007_SURNAME_TH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Thai Surname :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693769468481246731)
,p_name=>'P8007_CITIZEN_ID_TH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Thai Citizen ID :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693769837288246731)
,p_name=>'P8007_BIRTHDATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Date of Birth :'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693770276220246731)
,p_name=>'P8007_GIVENNAME_EN'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'English Givenname :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693770664737246737)
,p_name=>'P8007_GIVENNAME_TH'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Thai Givenname :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693771091339246737)
,p_name=>'P8007_SEARCH_COLLECTIVE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Search in Collective :'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d, r',
'FROM',
'(',
'    SELECT ''No'' AS d, 0 AS r, ''en_US'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''Yes'', 1, ''en_US'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''ไม่ใช่'', 0, ''th_TH'' AS lang FROM DUAL',
'    UNION ALL',
'    SELECT ''ใช่'', 1, ''th_TH'' AS lang FROM DUAL',
')',
'WHERE ',
'CASE ',
'    WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' AND lang = ''th_TH'' THEN 1',
'    WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() != ''th_TH'' AND lang = ''en_US'' THEN 1',
'END = 1',
'ORDER BY r',
';'))
,p_tag_css_classes=>'cl-exclude-validation'
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693771412042246737)
,p_name=>'P8007_GENDER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Sex :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- ALL --'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation'
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693771898224246738)
,p_name=>'P8007_MIDDLENAME_EN'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'English Middlename :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693772211435246738)
,p_name=>'P8007_MIDDLENAME_TH'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Thai Middlename :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693772622327246738)
,p_name=>'P8007_USER_DISP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created By :'
,p_source=>'AI_CURRENT_USER_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'cl-exclude-validation cl-display-only'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_display_when=>'P8007_INIT_LOAD'
,p_display_when2=>'Y'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693773029828246738)
,p_name=>'P8007_DOC_NUMBER'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Document No :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693773407595246749)
,p_name=>'P8007_TRAVEL_DATE_FROM'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Travel Date (from) :'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-10:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693773849059246749)
,p_name=>'P8007_TRAVEL_DATE_TO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Travel Date (until) :'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-10:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693774246167246750)
,p_name=>'P8007_TRAVELCARD_NO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'TM6 No. :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693774688574246750)
,p_name=>'P8007_VEHICLE_NO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Flight / Vehicle No. :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693775024241246750)
,p_name=>'P8007_SELECT_SERVER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Border Post (Bio) :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOSTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(NAME, NAME$DLC) d, KEY_VALUE r',
'FROM DL_BORDERCONTROL.BORDERPOSTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- ALL POSTS --'
,p_lov_null_value=>'ALL'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693775410496246750)
,p_name=>'P8007_DEPT_CODE_1'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Department (1) :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_tag_css_classes=>'cl-exclude-validation cl-department'
,p_colspan=>2
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:margin-right-none'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693775819319246750)
,p_name=>'P8007_DEPT_1'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Department (1) :'
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
,p_lov_null_text=>'-- ALL --'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation cl-department'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693776286514246751)
,p_name=>'P8007_DEPT_CODE_2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Department (2) :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_tag_css_classes=>'cl-exclude-validation cl-department'
,p_colspan=>2
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:margin-right-none'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693776605691246753)
,p_name=>'P8007_DEPT_2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Department (2) :'
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
'AND rel_code = :P8007_DEPT_1',
'ORDER BY 1',
';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- ALL --'
,p_lov_cascade_parent_items=>'P8007_DEPT_1'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation cl-department'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693777043854246753)
,p_name=>'P8007_DEPT_CODE_3'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Department (3) :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>5
,p_tag_css_classes=>'cl-exclude-validation cl-department'
,p_colspan=>2
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:margin-right-none'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693777446133246753)
,p_name=>'P8007_DEPT_3'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(4794824221233632663)
,p_prompt=>'Department (3) :'
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
'AND rel_code = :P8007_DEPT_2',
'ORDER BY 1',
';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- ALL --'
,p_lov_cascade_parent_items=>'P8007_DEPT_2'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_tag_css_classes=>'cl-exclude-validation cl-department'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693778177774246755)
,p_name=>'P8007_DR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4826686430370013475)
,p_use_cache_before_default=>'NO'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693778546393246755)
,p_name=>'P8007_RETURN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4826686430370013475)
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693778962289246755)
,p_name=>'P8007_IS_SUPERVISOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4826686430370013475)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693779380316246755)
,p_name=>'P8007_IS_EDIT_PAGE_ALLOWED'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4826686430370013475)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693779738123246756)
,p_name=>'P8007_CHECK_PIBICS_CONN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4826686430370013475)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4693780148008246756)
,p_name=>'P8007_INIT_LOAD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4826686430370013475)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4693835554140246932)
,p_computation_sequence=>10
,p_computation_item=>'P8007_IS_SUPERVISOR'
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4693835967853246932)
,p_computation_sequence=>20
,p_computation_item=>'P8007_IS_EDIT_PAGE_ALLOWED'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF USER_MANAGEMENT.pkg_authorization.APEX_IS_PAGE_ALLOWED(i_app_name => v(''APP_ALIAS''), i_page_id => 4020) THEN',
'        RETURN ''Y'';',
'    ELSE',
'        RETURN ''N'';',
'    END IF;',
'END;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693837081954246933)
,p_name=>'Page Load Actions'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693837506056246934)
,p_event_id=>wwv_flow_api.id(4693837081954246933)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' :P8007_DR := ''Y'';',
'END;'))
,p_attribute_02=>'P8007_DR'
,p_attribute_03=>'P8007_DR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693838073175246937)
,p_event_id=>wwv_flow_api.id(4693837081954246933)
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
'    $("#id-ir-travel-history").hide();',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693838563079246937)
,p_event_id=>wwv_flow_api.id(4693837081954246933)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''div.cl-ir-dynamic-display span.a-IRR-noDataMsg-text, div.cl-r-dynamic-display span.nodatafound'').text(''Please wait..'');',
'disableButtons();',
'',
'setTimeout(function() {',
'    apex.event.trigger(document, "getTravelHistory");',
'}, 1000);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693838999265246937)
,p_name=>'DA_PRESELECT_SERVER'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693839442006246938)
,p_event_id=>wwv_flow_api.id(4693838999265246937)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P8007_SELECT_SERVER := nvl(:P8007_SELECT_SERVER, :AI_BORDERPOST_NAME);'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693839808564246938)
,p_name=>'P8007_RETURN: Change'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8007_RETURN'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693840319412246938)
,p_event_id=>wwv_flow_api.id(4693839808564246938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'lSpinner$.remove();',
'enableButtons();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693840858232246938)
,p_event_id=>wwv_flow_api.id(4693839808564246938)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4827266875501101162)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693841203046246939)
,p_name=>'DA_CLOSE_EDIT_MVMNT'
,p_event_sequence=>180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "4020"'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693841735639246939)
,p_event_id=>wwv_flow_api.id(4693841203046246939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693842144579246939)
,p_name=>'Check PIBICS Connection'
,p_event_sequence=>190
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkPibicsConn'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693842682363246939)
,p_event_id=>wwv_flow_api.id(4693842144579246939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// check if PIBICS PRD Connection is active',
'',
'if (lastPibicsConnRequest) {',
'  lastPibicsConnRequest.abort();',
'  lastPibicsConnRequest = null;',
'}',
'',
'lastPibicsConnRequest = ',
'  apex.server.process("CHECK_PIBICS_CONN", ',
'  {',
'    x01: $v("pInstance")',
'  }, ',
'  {',
'    beforeSend: function() ',
'    {',
'        $("#P8007_CHECK_PIBICS_CONN").val("0");',
'    },',
'    success: function(pData) ',
'    {',
'        console.log(''CHECK_PIBICS_CONN Result: '', pData);',
'        $("#P8007_CHECK_PIBICS_CONN").val(pData.is_conn_active);',
'    },',
'    error: function(pData) ',
'    {',
'        console.log(''CHECK_PIBICS_CONN Error Result: '', pData.responseJSON.error);',
'    }',
'  }).done(function(pData) {lastPibicsConnRequest = null;});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693843071156246940)
,p_name=>'Get Travel History'
,p_event_sequence=>200
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getTravelHistory'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693843547287246940)
,p_event_id=>wwv_flow_api.id(4693843071156246940)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	l_coll_name VARCHAR2(100) := ''P8007_COLL_TRAVEL_HISTORY'';',
'    l_return    NUMBER := 0;',
'BEGIN',
'    l_return := DL_BORDERCONTROL.pkg_bmbs_apex_util.p8001_get_coll_travel_history',
'                (',
'                    p_coll_name             => l_coll_name',
'                    , p_borderpost          => :P8007_SELECT_SERVER',
'                    , p_scope               => :P8007_SCOPE',
'                    , p_direction           => :P8007_DIRECTION',
'                    , p_source              => :P8007_SOURCE',
'                    , p_nationality         => :P8007_NATIONALITY',
'                    , p_dob                 => :P8007_BIRTHDATE',
'                    , p_sex                 => :P8007_GENDER',
'                    , p_docno               => :P8007_DOC_NUMBER',
'                    , p_tm6                 => :P8007_TRAVELCARD_NO',
'                    , p_vehicle_no          => :P8007_VEHICLE_NO',
'                    , p_travel_date_from    => :P8007_TRAVEL_DATE_FROM',
'                    , p_travel_date_to      => :P8007_TRAVEL_DATE_TO',
'                    , p_givenname           => :P8007_GIVENNAME_EN',
'                    , p_middlename          => :P8007_MIDDLENAME_EN',
'                    , p_surname             => :P8007_SURNAME_EN',
'                    , p_givenname_th        => :P8007_GIVENNAME_TH',
'                    , p_middlename_th       => :P8007_MIDDLENAME_TH',
'                    , p_surname_th          => :P8007_SURNAME_TH',
'                    , p_dept_1              => :P8007_DEPT_1',
'                    , p_dept_2              => :P8007_DEPT_2',
'                    , p_dept_3              => :P8007_DEPT_3',
'                    , p_citizenid           => :P8007_CITIZEN_ID_TH',
'                    , p_search_collective   => :P8007_SEARCH_COLLECTIVE',
'                    , p_created_by          => CASE WHEN :P8007_INIT_LOAD = ''Y'' THEN UPPER(:APP_USER) ELSE NULL END',
'                    , p_rows                => 1000 --:P8007_ROWS',
'                    , p_pibics_prd_conn     => 1 --:P8007_CHECK_PIBICS_CONN',
'                    --, p_dr                  => :P8007_DR',
'                );',
'				',
'	:P8007_RETURN := l_return;',
'END;'))
,p_attribute_02=>'P8007_SELECT_SERVER,P8007_SCOPE,P8007_DIRECTION,P8007_SOURCE,P8007_NATIONALITY_ID,P8007_BIRTHDATE,P8007_GENDER,P8007_DOC_NUMBER,P8007_TRAVELCARD_NO,P8007_VEHICLE_NO,P8007_TRAVEL_DATE_FROM,P8007_TRAVEL_DATE_TO,P8007_GIVENNAME_EN,P8007_MIDDLENAME_EN,P8'
||'007_SURNAME_EN,P8007_GIVENNAME_TH,P8007_MIDDLENAME_TH,P8007_SURNAME_TH,P8007_DEPT_1,P8007_DEPT_2,P8007_DEPT_3,P8007_ROWS,P8007_CHECK_PIBICS_CONN,P8007_INIT_LOAD,P8007_SEARCH_COLLECTIVE'
,p_attribute_03=>'P8007_RETURN'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693843908663246940)
,p_name=>'P8007_NATIONALITY_ID: Change'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8007_NATIONALITY_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693844408604246940)
,p_event_id=>wwv_flow_api.id(4693843908663246940)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let currentCode = $v(''P8007_NATIONALITY'');',
'let newCode = $v(''P8007_NATIONALITY_ID'').toUpperCase();',
'',
'if (newCode != currentCode) {',
'    if (!($("#P8007_NATIONALITY option[value=''"+newCode+"'']").length > 0)) {',
'        $("#P8007_NATIONALITY_ID,#P8007_NATIONALITY").val("");',
'        $("#P8007_NATIONALITY").trigger("change");',
'    } else {',
'        $(''#P8007_NATIONALITY'').val(newCode).trigger("change");',
'    }',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693845717265246941)
,p_name=>'P8007_NATIONALITY: Change'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8007_NATIONALITY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693846254607246941)
,p_event_id=>wwv_flow_api.id(4693845717265246941)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let currentCode = $v(''P8007_NATIONALITY_ID'').toUpperCase();',
'let newCode = $v(''P8007_NATIONALITY'');',
'',
'if (newCode != currentCode) {',
'    $(''#P8007_NATIONALITY_ID'').val(newCode).trigger("change");',
'}',
'',
'if (!newCode) {',
'    $("#P8007_NATIONALITY_ID,#P8007_NATIONALITY").val("");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4693844817496246941)
,p_name=>'DEPARTMENT: Change'
,p_event_sequence=>230
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.cl-department'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4693845305208246941)
,p_event_id=>wwv_flow_api.id(4693844817496246941)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var item = this.triggeringElement.getAttribute("id")',
'',
'if(item === "P8007_DEPT_1") {',
'    p8007.department.set("P8007_DEPT_CODE_1", "P8007_DEPT_1");',
'    p8007.department.setIdItem();',
'}',
'else if(item === "P8007_DEPT_CODE_1") {',
'    p8007.department.set("P8007_DEPT_CODE_1", "P8007_DEPT_1");',
'    p8007.department.setSelectItem();',
'}',
'else if(item === "P8007_DEPT_2") {',
'    p8007.department.set("P8007_DEPT_CODE_2", "P8007_DEPT_2");',
'    p8007.department.setIdItem();',
'}',
'else if(item === "P8007_DEPT_CODE_2") {',
'    p8007.department.set("P8007_DEPT_CODE_2", "P8007_DEPT_2");',
'    p8007.department.setSelectItem();',
'}',
'else if(item === "P8007_DEPT_3") {',
'    p8007.department.set("P8007_DEPT_CODE_3", "P8007_DEPT_3");',
'    p8007.department.setIdItem();',
'}',
'else if(item === "P8007_DEPT_CODE_3") {',
'    p8007.department.set("P8007_DEPT_CODE_3", "P8007_DEPT_3");',
'    p8007.department.setSelectItem();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4693836250313246932)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'__CHECK_PIBICS_CONN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_count NUMBER;',
'    l_pibics_prod_enabled NUMBER := 0;',
'BEGIN       ',
'    l_pibics_prod_enabled := TO_NUMBER(NVL(dl_bordercontrol.pkg_common.Get_Parameter(''PIBICS_PROD_ENABLED''), 0));',
'    ',
'    IF l_pibics_prod_enabled = 1 THEN',
'        EXECUTE IMMEDIATE ''SELECT COUNT(1) FROM dl_bordercontrol.v_pibics_conn_prod'' INTO l_count;',
'    END IF;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''is_pibics_prod_enabled'', l_pibics_prod_enabled);',
'    apex_json.write(''is_conn_active'', CASE WHEN l_pibics_prod_enabled = 1 THEN 1 ELSE 0 END);',
'    apex_json.close_object();',
'EXCEPTION',
'    -- for all TNS errors',
'    WHEN OTHERS THEN',
'        apex_json.open_object();',
'        apex_json.write(''is_pibics_prod_enabled'', l_pibics_prod_enabled);',
'        apex_json.write(''is_conn_active'', 0);',
'        apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4693836629374246933)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_RELATIONS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    apex_json.open_array();',
'',
'    -- dept_seqno -> deptcd',
'    apex_json.open_object();',
'    FOR i_type in (SELECT dept_seqno NUM_VALUE, deptcd KEY_VALUE FROM dl_bordercontrol.v_department WHERE actflag = ''Y'') LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'    ',
'    -- deptcd -> dept_seqno',
'    apex_json.open_object();',
'    FOR i_type in (SELECT dept_seqno NUM_VALUE, deptcd KEY_VALUE FROM dl_bordercontrol.v_department WHERE actflag = ''Y'') LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value) );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.close_array();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
