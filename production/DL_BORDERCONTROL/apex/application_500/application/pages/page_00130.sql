prompt --application/pages/page_00130
begin
wwv_flow_api.create_page(
 p_id=>130
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'EVOA Search'
,p_page_mode=>'MODAL'
,p_step_title=>'EVOA Search'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'EVOA Search'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#EVOA.js',
'#WORKSPACE_IMAGES#fotorama.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// to be used in ext js files',
'var BMBS_APP_USER_JS = "&APP_USER.";',
'',
'var selectedPassengerID;',
'var genericErrMsg = "Unexpected error !\nPlease refresh the page to try again or contact the administrator.";',
'var $fotoramaDiv = $(''#fotorama'').fotorama();',
'var fotorama = $fotoramaDiv.data(''fotorama'');',
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
'var displayApexError = function(errMsg) {',
'    if (typeof errMsg === "undefined" || errMsg.length === 0) errMsg = genericErrMsg;',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'        {',
'            type: apex.message.TYPE.ERROR,',
'            location: ["page"],',
'            message: errMsg,',
'            unsafe: false',
'        }',
'    ]);',
'}',
'',
'function setSelectList(pid, pOption) {',
'    if (pOption != null) {',
'        pOption = $.trim(pOption);',
'    }',
'    let optionExists = ($(''#'' + pid + '' option[value="'' + pOption + ''"]'').length > 0);',
'    if(!optionExists) {',
'        $(''#'' + pid + '''').append(''<option value="'' + pOption + ''">'' + pOption + ''</option>'');',
'    }',
'    apex.item(pid).setValue(pOption);',
'}',
'',
'//toggle buttons',
'function enableButtons() {',
'    $(".cl-button-submit").prop("disabled", false);',
'}',
'',
'function disableButtons() {',
'    $(".cl-button-submit").prop("disabled", true);',
'}',
'',
'function resetDetails() {',
'    //Personal Info ',
'    apex.item("P130_SELECTED_PASSENGER_ID").setValue('''');',
'    apex.item("P130_RESP_AIRPORT_NAME").setValue('''');',
'    apex.item("P130_RESP_SALUTATION").setValue('''');',
'    apex.item("P130_RESP_LAST_NAME").setValue('''');',
'    apex.item("P130_RESP_MIDDLE_NAME").setValue('''');',
'    apex.item("P130_RESP_FIRST_NAME").setValue('''');',
'    apex.item("P130_RESP_NATIONALITY_TMP").setValue('''');',
'    apex.item("P130_RESP_PASSPORT_NO").setValue('''');',
'    apex.item("P130_RESP_DOB").setValue('''');',
'    apex.item("P130_RESP_SEX_TMP").setValue('''');',
'    apex.item("P130_RESP_PASSPORT_ISSUE_DATE").setValue('''');',
'    apex.item("P130_RESP_PASSPORT_EXPIRY_DATE").setValue('''');',
'    apex.item("P130_RESP_CONTACT_NUMBER").setValue('''');',
'    apex.item("P130_RESP_DAYS_OF_PASSPORT").setValue('''');',
'    apex.item("P130_RESP_THAI_ADDRESS").setValue('''');',
'    apex.item("P130_RESP_ACCOMODATION").setValue('''');',
'',
'    //Travel Info',
'    apex.item("P130_RESP_FLIGHT_NO").setValue('''');',
'    apex.item("P130_RESP_ARRIVAL_DATE").setValue('''');',
'    apex.item("P130_RESP_PERMANENT_ADDR").setValue('''');',
'    apex.item("P130_RESP_THAI_ADDRESS_TRVL").setValue('''');',
'    apex.item("P130_RESP_REF_ADDRESS").setValue('''');',
'',
'    //VOA Info',
'    apex.item("P130_RESP_EVOA_NO").setValue('''');',
'    apex.item("P130_RESP_EVOA_DATE").setValue('''');',
'',
'    //Approval Info',
'    apex.item("P130_EVOA_APPROVE_STATUS").setValue('''');',
'    apex.item("P130_EVOA_APPROVE_DATE").setValue('''');',
'    apex.item("P130_EVOA_APPROVED_BY").setValue('''');',
'};',
'',
'function setDetails(pid)  {',
'    if (!pid) return;',
'',
'    if (!!$v("P130_SELECTED_PASSENGER_ID")) resetDetails();',
'',
'    let passenger =  getEVOASearchResults().candidates.filter(function(p){ return p.passenger_id == pid; })[0];',
'    console.log(passenger);',
'',
'    //Personal Info ',
'    apex.item("P130_SELECTED_PASSENGER_ID").setValue(passenger.passenger_id);',
'    apex.item("P130_RESP_AIRPORT_NAME").setValue(passenger.airport_destination);',
'    apex.item("P130_RESP_SALUTATION").setValue(passenger.salutation);',
'    apex.item("P130_RESP_LAST_NAME").setValue(passenger.last_name);',
'    apex.item("P130_RESP_MIDDLE_NAME").setValue(passenger.middle_name);',
'    apex.item("P130_RESP_FIRST_NAME").setValue(passenger.first_name);',
'    setSelectList("P130_RESP_NATIONALITY_TMP", passenger.nationality);',
'    apex.item("P130_RESP_PASSPORT_NO").setValue(passenger.passport_number);',
'    apex.item("P130_RESP_DOB").setValue(passenger.birth_date);',
'    setSelectList("P130_RESP_SEX_TMP", passenger.gender);',
'    apex.item("P130_RESP_PASSPORT_ISSUE_DATE").setValue(passenger.passport_issue);',
'    apex.item("P130_RESP_PASSPORT_EXPIRY_DATE").setValue(passenger.passport_expiry);',
'    apex.item("P130_RESP_CONTACT_NUMBER").setValue(passenger.phone_number);',
'    apex.item("P130_RESP_DAYS_OF_PASSPORT").setValue(passenger.age_of_document);',
'    apex.item("P130_RESP_THAI_ADDRESS").setValue(passenger.thailand_address);',
'    apex.item("P130_RESP_ACCOMODATION").setValue(passenger.accommodation_name);',
'',
'    //Travel Info',
'    apex.item("P130_RESP_FLIGHT_NO").setValue(passenger.fligh_number);',
'    apex.item("P130_RESP_ARRIVAL_DATE").setValue(passenger.arrival_date + '' '' + passenger.arrival_time);',
'    apex.item("P130_RESP_PERMANENT_ADDR").setValue(passenger.residential_address);',
'    apex.item("P130_RESP_THAI_ADDRESS_TRVL").setValue(passenger.accommodation_type);',
'    apex.item("P130_RESP_REF_ADDRESS").setValue(passenger.reference_address);',
'',
'    //VOA Info',
'    apex.item("P130_RESP_EVOA_NO").setValue(passenger.voa_no);',
'    apex.item("P130_RESP_EVOA_DATE").setValue(passenger.voa_date);',
'',
'    //Approval Info',
'    apex.item("P130_EVOA_APPROVE_STATUS").setValue(passenger.approve_status);',
'    apex.item("P130_EVOA_APPROVE_DATE").setValue(passenger.approve_date);',
'    apex.item("P130_EVOA_APPROVED_BY").setValue(passenger.approve_by);',
'}',
'',
'function refreshCaraousel() {',
'    let docImages = [];',
'    let docImage = {};',
'',
'    $(''#id-classic-doc-report .cl-img-json-obj'').each(function (index, value){',
'        docImage = JSON.parse($(this).html());',
'        if (!!docImage.url && docImage.url != null) {',
'            let ext = docImage.url.split(''.'').pop();',
'            if ($.inArray(ext, ["jpg", "jpeg", "png"]) != -1) {',
'                docImages.push(docImage);',
'            }',
'        }',
'    });',
'',
'    if (fotorama.size > 0) fotorama.splice(0);',
'    if (docImages.length > 0) {',
'        let idx;',
'        for (idx in docImages) {',
'            docImage = docImages[idx];',
'            fotorama.push({img: docImage.url, thumb: docImage.url, caption: docImage.rowNo + '': '' + docImage.type + '' / '' + docImage.name});',
'        }',
'    }',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".auto-upper-case").keyup((elem) => {',
'    upperCaseF(elem.target);',
'});',
''))
,p_css_file_urls=>'#WORKSPACE_IMAGES#fotorama.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.cl-hidden {',
'    display: none;',
'}',
'',
'.cl-bg-green {',
'    background-color: green;',
'}',
'',
'.cl-bg-red {',
'    background-color: red;',
'}',
'',
'.cl-bg-orange {',
'    background-color: orange;',
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
'.cl-not-allowed {',
'    cursor: not-allowed;',
'    pointer-events: auto;',
'}',
'',
'.cl-h100 {',
'    height: 100% !important;',
'}',
'',
'.t-Form--large .t-Form-label, .t-Form-fieldContainer--large .t-Form-label {',
'    font-size: 1.4rem;',
'}',
'',
'.t-Form--large span.display_only, .t-Form-fieldContainer--large span.display_only,',
'.t-Form--large .t-Form-inputContainer input[type=text], .t-Form-fieldContainer--large .t-Form-inputContainer input[type=text] {',
'    font-size: 1.5rem;',
'}',
'',
'#EVOA_STATUS_HEADER.cl-bg-green .t-Form-inputContainer span.display_only,',
'#EVOA_STATUS_HEADER.cl-bg-orange .t-Form-inputContainer span.display_only,',
'#EVOA_STATUS_HEADER.cl-bg-red .t-Form-inputContainer span.display_only {',
'    color: #fff;',
'    font-size: 2.5rem;',
'}',
'',
'#EVOA_STATUS_HEADER .t-Form-inputContainer span.display_only:hover {',
'    background-color: inherit;',
'}',
'',
'.cl-evoa-status-item > .t-Form-labelContainer {',
'    display: none;',
'}',
'',
'.cl-evoa-status-item > .t-Form-inputContainer {',
'    width: 100%;',
'    cursor: default;',
'}',
'',
'#P130_EVOA_STATUS {',
'    width: 100%;',
'    text-align: center;',
'}',
'',
'.cl-button-submit:disabled {',
'    cursor: not-allowed;',
'    pointer-events: auto;',
'}',
'',
'#SearchResult tr {',
'    font-size: 1.5rem;',
'}',
'',
'#SearchResult tr:not(:first-child) {',
'    cursor: pointer;',
'    height: 40px;',
'}',
'',
'#SearchResult .a-IRR-table tr.cl-row-selected td {',
'    background-color: #e6f0ff;',
'}',
'',
'#id-classic-doc-report .t-Report-cell, ',
'#id-classic-doc-report .t-Report-colHead {',
'    font-size: 1.5rem;',
'}',
'',
'#id-reg-caraousel {',
'    text-align: center;',
'}',
'',
'.cl-span-select-passenger-all {',
'    margin-top: -5px;',
'    margin-bottom: 5px;',
'}',
'',
'.cl-span-remarks-passenger {',
'    resize: none;',
'    width: 150px;',
'    height: 50px;',
'}',
'',
'.cl-warning {',
'    color: red;',
'    cursor: pointer;',
'    font-size: 1.5rem !important;',
'}',
'',
'.cl-warning:before {',
'    content: ''\f071'';',
'    font-family: font-apex;',
'    margin-right: 2px;',
'}',
'',
'@keyframes blinker {',
'    0% {',
'        box-shadow: inherit;',
'    }',
'    100% {',
'        box-shadow: inset 0 0 200px 0 rgb(255, 192, 0);',
'    }',
'}',
'',
'.cl-blink {',
'    font-size: 1.7rem !important;',
'    cursor: pointer;',
'    animation: blinker 1.5s infinite;',
'}',
'',
'.item-mismatch {',
'    color: aqua !important;',
'    font-weight: bolder !important;',
'    background-color: yellow !important;',
'}',
'',
''))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'no-close cl-page-evoa-search-130'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20191118101408'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190155142667797103)
,p_plug_name=>'REG_HIDDEN'
,p_region_name=>'REG_HIDDEN'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<input type="hidden" id="BMBS_APP_USER_HIDDEN" value="&APP_USER." />'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190155200045797104)
,p_plug_name=>'Status Header'
,p_region_name=>'EVOA_STATUS_HEADER'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190156098649797112)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--large:margin-top-none:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190157688244797128)
,p_plug_name=>'Search Result'
,p_region_name=>'SearchResult'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT    ',
'    ----------',
'    CASE ',
'        WHEN selectable = 1 THEN',
'            DECODE(',
'                selected',
'                , 1, ''<span id="id-span-select-passenger-'' || passenger_id || ''" class="t-Icon fa fa-check-square-o fa-1-7-5x cl-span-select-passenger cl-pointer" aria-hidden="true" title="Click to Un-select" data-passengerid="'' || passenger_id || ''"'
||' data-coll-seq="'' || seq_id || ''" data-select-status="Y"></span>''',
'                , ''<span id="id-span-select-passenger-'' || passenger_id || ''" class="t-Icon fa fa-square-o fa-1-7-5x cl-span-select-passenger cl-pointer" aria-hidden="true" title="Click to Select" data-passengerid="'' || passenger_id || ''" data-coll-s'
||'eq="'' || seq_id || ''" data-select-status="N"></span>''',
'            )',
'        ELSE',
'            ''<span id="id-span-select-passenger-'' || passenger_id || ''" class="t-Icon fa fa-square fa-1-7-5x cl-span-non-select-passenger cl-not-allowed" aria-hidden="true" title="Selection not allowed" data-passengerid="'' || passenger_id || ''" data-'
||'coll-seq="'' || seq_id || ''" data-select-status="N"></span>''',
'    END SELECT_PASSENGER',
'    ----------',
'    , passenger_id',
'    ----------',
'    , TRIM(',
'        salutation ',
'        || NVL2(last_name, '' '' || last_name, NULL) ',
'        || NVL2(middle_name, '' '' || middle_name, NULL) ',
'        || NVL2(first_name, '' '' || first_name, NULL)',
'    ) NAME',
'    ----------',
'    , sex',
'    , nationality',
'    , dob',
'    ----------',
'    , flight_number',
'    , departure_date',
'    ----------',
'    , evoa_no',
'    , evoa_approve_date',
'    , accept_date',
'    , evoa_approved_by',
'    , evoa_approve_status',
'    ----------',
'    , CASE ',
'        WHEN selectable = 0 THEN submitted_visa_no',
'        ELSE ',
'            apex_item.hidden(',
'                p_idx => 3',
'                , p_value => seq_id',
'            )',
'            || apex_item.text(',
'                p_idx => 4',
'                , p_value => DECODE(is_manual_visano, 1, manual_visano, NULL)',
'                , p_attributes => ''class="cl-span-visano-passenger '' || DECODE(is_manual_visano, 1, ''cl-is_manual-visano'', NULL) || ''" maxlength=20 placeholder="Visa No" readonly''',
'                , p_item_id => ''id-span-visano-passenger-'' || passenger_id',
'                , p_maxlength => 20',
'            )',
'    END VISA_NO',
'    ----------',
'    , apex_item.hidden(',
'        p_idx => 1',
'        , p_value => seq_id',
'    )',
'    || apex_item.textarea(',
'        p_idx => 2',
'        , p_value => CASE WHEN TO_NUMBER(NVL(:P130_EVOA_STATUS_CODE, 0)) = 104 THEN APPROVAL_REMARKS ELSE remarks END',
'        , p_rows => 2',
'        , p_cols => 4',
'        , p_attributes => ''class="cl-span-remarks-passenger" maxlength=2000 placeholder="Remarks" readonly''',
'        , p_item_id => ''id-span-remarks-passenger-'' || passenger_id',
'    ) REMARKS',
'    ----------',
'FROM ',
'(',
'    SELECT ',
'          seq_id',
'        , n001 AS SELECTED',
'        , c001 AS PASSENGER_ID',
'        , c002 AS SALUTATION',
'        , c003 AS LAST_NAME',
'        , c004 AS MIDDLE_NAME',
'        , c005 AS FIRST_NAME',
'        , c006 AS SEX',
'        , c007 AS NATIONALITY',
'        , c008 AS DOB',
'        , c009 AS DOCNO',
'        , c010 AS FLIGHT_NUMBER',
'        , c011 AS DEPARTURE_DATE',
'        , c012 AS EVOA_NO',
'        , c013 AS EVOA_APPROVE_DATE',
'        , c014 AS EVOA_APPROVED_BY',
'        , c015 AS EVOA_APPROVE_STATUS',
'        , c016 AS ACCEPT_DATE',
'        , c017 AS REMARKS',
'        , c018 AS ARRIVAL_DATE',
'        , c019 AS VISA_TEXT',
'        , c020 AS VISA_NUM',
'        , c021 AS MANUAL_VISANO',
'        , c022 AS APPROVAL_REMARKS',
'        , c023 AS SUBMITTED_VISA_NO',
'        ----------',
'        , CASE ',
'            WHEN c015 = ''APPROVED'' AND c016 IS NULL AND TO_NUMBER(NVL(:P130_EVOA_STATUS_CODE, 0)) != 102 THEN 1 ',
'            ELSE 0',
'        END SELECTABLE',
'        ----------',
'        , CASE ',
'            WHEN :P130_VOA_VISA_TEXT IS NOT NULL AND :P130_VOA_VISA_NUM IS NOT NULL THEN 0 ',
'            ELSE 1',
'        END IS_MANUAL_VISANO',
'        ----------',
'    FROM apex_collections',
'    WHERE collection_name = ''COLL_WS_RESULT''',
') ac',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P130_EVOA_STATUS_CODE'
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
 p_id=>wwv_flow_api.id(190748615635270408)
,p_max_row_count=>'500'
,p_no_data_found_message=>'No data found'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLS:PDF'
,p_owner=>'ADMIN'
,p_internal_uid=>190748615635270408
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190748766489270409)
,p_db_column_name=>'SELECT_PASSENGER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'<!--Select-->'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'SELECT_PASSENGER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190748861800270410)
,p_db_column_name=>'PASSENGER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'<!-- Passenger ID -->'
,p_column_html_expression=>'<span class="fa fa-search fa-1-7-5x cl-span-passenger-details" data-evoa-passenger-id="#PASSENGER_ID#" title="Show passenger details"></span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190748922147270411)
,p_db_column_name=>'NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749045928270412)
,p_db_column_name=>'SEX'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sex'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749162234270413)
,p_db_column_name=>'NATIONALITY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nationality'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749202197270414)
,p_db_column_name=>'DOB'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Date of Birth'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749376261270415)
,p_db_column_name=>'FLIGHT_NUMBER'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Departure Flight No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749475573270416)
,p_db_column_name=>'DEPARTURE_DATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Departure Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749506973270417)
,p_db_column_name=>'EVOA_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'EVOA No'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749657020270418)
,p_db_column_name=>'EVOA_APPROVE_DATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Approved Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749792646270419)
,p_db_column_name=>'ACCEPT_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Visa Used Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749811317270420)
,p_db_column_name=>'EVOA_APPROVED_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Visa Accepted by Officer'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190749979642270421)
,p_db_column_name=>'EVOA_APPROVE_STATUS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'EVOA Status'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190751794278270439)
,p_db_column_name=>'REMARKS'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Remarks'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(191114666007281105)
,p_db_column_name=>'VISA_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Visa No'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'id-ir-col-header-visano'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(190768933309398840)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1907690'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'SELECT_PASSENGER:PASSENGER_ID:NAME:SEX:NATIONALITY:DOB:FLIGHT_NUMBER:DEPARTURE_DATE:EVOA_NO:EVOA_APPROVE_DATE:VISA_NO:ACCEPT_DATE:EVOA_APPROVED_BY:EVOA_APPROVE_STATUS:REMARKS:'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(378549884420073515)
,p_plug_name=>'Footer'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(379685767503252695)
,p_plug_name=>'Personal Information'
,p_region_name=>'PERSONAL_INFO'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:t-Form--large:margin-top-none:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(379811330529006730)
,p_plug_name=>'Additional Information'
,p_region_name=>'ADDITIONAL_INFO'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:t-Form--slimPadding:t-Form--large:margin-top-none:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(563817264244049616)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(379811457159006731)
,p_plug_name=>'Travel Info'
,p_parent_plug_id=>wwv_flow_api.id(379811330529006730)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-sm:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(379812092631006737)
,p_plug_name=>'VOA Online Info'
,p_parent_plug_id=>wwv_flow_api.id(379811330529006730)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-none:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(379812334224006740)
,p_plug_name=>'Approval Info'
,p_parent_plug_id=>wwv_flow_api.id(379811330529006730)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-none:margin-bottom-sm'
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
 p_id=>wwv_flow_api.id(379812798606006744)
,p_plug_name=>'Attached Document Info'
,p_parent_plug_id=>wwv_flow_api.id(379811330529006730)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:margin-top-none:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190398143082168222)
,p_plug_name=>'Carousel Region'
,p_region_name=>'id-reg-caraousel'
,p_parent_plug_id=>wwv_flow_api.id(379812798606006744)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190398210903168223)
,p_plug_name=>'fotorama'
,p_parent_plug_id=>wwv_flow_api.id(190398143082168222)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="fotorama"',
'     data-nav="thumbs"',
'     data-arrows="true"',
'     data-click="true"',
'     data-swipe="false"',
'     ',
'     id="fotorama"',
'     style="display:inline-block; /*min-height:600px;*/ min-width:300px;"',
'     data-allowfullscreen="native" data-height="500px" data-width="840px">   ',
'    ',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(380055640151692261)
,p_name=>'Additional Document Report'
,p_region_name=>'id-classic-doc-report'
,p_parent_plug_id=>wwv_flow_api.id(379812798606006744)
,p_template=>wwv_flow_api.id(563820435896049617)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-sm'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ROW_RN',
'    , rowNo || ''<span class="cl-img-json-obj cl-hidden">'' || img_json_obj || ''</span>'' AS ROWNO',
'    , doc_id',
'    , passenger_id',
'    , name',
'    , type',
'    , url',
'FROM JSON_TABLE',
'(',
'    (SELECT clob001 FROM apex_collections WHERE collection_name = ''COLL_WS_RESULT'' AND c001 = :P130_SELECTED_PASSENGER_ID)',
'    , ''$[*]''',
'    COLUMNS ',
'    (',
'          ROW_RN FOR ORDINALITY',
'        , rowNo        NUMBER          PATH ''$.rowNo''',
'        , doc_id       NUMBER          PATH ''$.doc_id''',
'        , passenger_id NUMBER          PATH ''$.passenger_id''',
'        , name         VARCHAR2 (255)  PATH ''$.name''',
'        , type         VARCHAR2 (255)  PATH ''$.type''',
'        , url          VARCHAR2 (2000) PATH ''$.url''',
'        , img_json_obj VARCHAR2 (4000) FORMAT JSON PATH ''$''',
'    )',
') jt',
'ORDER BY 2',
';'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P130_SELECTED_PASSENGER_ID'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No data found'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(190399578785168236)
,p_query_column_id=>1
,p_column_alias=>'ROW_RN'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(190399654835168237)
,p_query_column_id=>2
,p_column_alias=>'ROWNO'
,p_column_display_sequence=>2
,p_column_heading=>'No'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(190399753439168238)
,p_query_column_id=>3
,p_column_alias=>'DOC_ID'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(190399800928168239)
,p_query_column_id=>4
,p_column_alias=>'PASSENGER_ID'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(190399901080168240)
,p_query_column_id=>5
,p_column_alias=>'NAME'
,p_column_display_sequence=>5
,p_column_heading=>'Document Name'
,p_column_link=>'#URL#'
,p_column_linktext=>'#NAME#'
,p_column_link_attr=>'target="_blank"'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
end;
/
begin
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(190400098127168241)
,p_query_column_id=>6
,p_column_alias=>'TYPE'
,p_column_display_sequence=>6
,p_column_heading=>'Document Type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(190400184920168242)
,p_query_column_id=>7
,p_column_alias=>'URL'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(190241463701344910)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(378549884420073515)
,p_button_name=>'P130_BTN_SAVE'
,p_button_static_id=>'P130_BTN_SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(190241827962344911)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(378549884420073515)
,p_button_name=>'P130_BTN_CANCEL'
,p_button_static_id=>'P130_BTN_CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-arrow-circle-o-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(190156436547797116)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(190156098649797112)
,p_button_name=>'P130_SEARCH'
,p_button_static_id=>'P130_SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'cl-button-submit'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(190156545509797117)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(190156098649797112)
,p_button_name=>'P130_CLEAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Clear'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'cl-button-submit'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190155319483797105)
,p_name=>'P130_EVOA_STATUS_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190155200045797104)
,p_prompt=>'Evoa status code'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_EVOA_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'FROM dl_common.evoa_codes$lc',
'WHERE is_active = ''Y''',
'ORDER BY display_order',
';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190155435692797106)
,p_name=>'P130_EVOA_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(190155200045797104)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-evoa-status-item'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190156168165797113)
,p_name=>'P130_APPROVAL_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190156098649797112)
,p_prompt=>'Approval Code :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190156232681797114)
,p_name=>'P130_NATIONALITY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(190156098649797112)
,p_prompt=>'Nationality :'
,p_source=>'P130_MVMNT_NATIONALITY'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>3
,p_tag_css_classes=>'auto-upper-case'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190156364866797115)
,p_name=>'P130_DOCUMENT_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(190156098649797112)
,p_prompt=>'Document No. :'
,p_source=>'P130_MVMNT_DOCNO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_css_classes=>'auto-upper-case'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190397039697168211)
,p_name=>'P130_SELECTED_PASSENGER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190397521160168216)
,p_name=>'P130_RESP_SEX_TMP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Sex Temp :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_ICAO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc)d, icao r ',
'FROM dl_common.human_sexes$lc',
'WHERE num_value IS NOT NULL',
'ORDER BY display_order;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190397827255168219)
,p_name=>'P130_RESP_NATIONALITY_TMP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Nationality Temp :'
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
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190479895525147360)
,p_name=>'P130_RESP_AIRPORT_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Airport Name :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190480248588147362)
,p_name=>'P130_RESP_SALUTATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Salutation :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190480675507147363)
,p_name=>'P130_RESP_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Last Name :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190481046397147366)
,p_name=>'P130_RESP_MIDDLE_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Middle Name :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190481430381147369)
,p_name=>'P130_RESP_FIRST_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'First Name :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190481864823147369)
,p_name=>'P130_RESP_NATIONALITY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Nationality :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-h100'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190482215721147369)
,p_name=>'P130_RESP_PASSPORT_NO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Passport No :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190482630613147370)
,p_name=>'P130_RESP_DOB'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Date of Birth :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190483079821147370)
,p_name=>'P130_RESP_SEX'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Sex :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190483490796147370)
,p_name=>'P130_RESP_PASSPORT_ISSUE_DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Passport Issue Date :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190483893172147370)
,p_name=>'P130_RESP_PASSPORT_EXPIRY_DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Passport Expiry Date:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190484277437147373)
,p_name=>'P130_RESP_CONTACT_NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Contact Number :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190484619826147373)
,p_name=>'P130_RESP_DAYS_OF_PASSPORT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Passport Days Left :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190485047995147374)
,p_name=>'P130_RESP_THAI_ADDRESS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Address in Thailand :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190485441970147374)
,p_name=>'P130_RESP_ACCOMODATION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(379685767503252695)
,p_prompt=>'Accommodation Name :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190488605391169914)
,p_name=>'P130_RESP_FLIGHT_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(379811457159006731)
,p_prompt=>'Flight No :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190489055759169915)
,p_name=>'P130_RESP_ARRIVAL_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(379811457159006731)
,p_prompt=>'Arrival Date :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190489449926169915)
,p_name=>'P130_RESP_PERMANENT_ADDR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(379811457159006731)
,p_prompt=>'Permanent Address :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190489896957169915)
,p_name=>'P130_RESP_THAI_ADDRESS_TRVL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(379811457159006731)
,p_prompt=>'Address in Thailand :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190490288747169915)
,p_name=>'P130_RESP_REF_ADDRESS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(379811457159006731)
,p_prompt=>'Name & Contact in Thailand : '
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190490925914169916)
,p_name=>'P130_RESP_EVOA_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(379812092631006737)
,p_prompt=>'E-VOA No :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190491395956169917)
,p_name=>'P130_RESP_EVOA_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(379812092631006737)
,p_prompt=>'Registered Date :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190492003099169917)
,p_name=>'P130_EVOA_APPROVE_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(379812334224006740)
,p_prompt=>'Approved Status :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190492410354169917)
,p_name=>'P130_EVOA_APPROVE_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(379812334224006740)
,p_prompt=>'Approved Date :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190492815094169917)
,p_name=>'P130_EVOA_APPROVED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(379812334224006740)
,p_prompt=>'Approved By :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190748172388270403)
,p_name=>'P130_SELECTABLE_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190157688244797128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190748223329270404)
,p_name=>'P130_SELECTED_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(190157688244797128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190750630126270428)
,p_name=>'P130_MVMNTID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(190155142667797103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190751091998270432)
,p_name=>'P130_MVMNT_NATIONALITY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(190155142667797103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190751121825270433)
,p_name=>'P130_MVMNT_DOCNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(190155142667797103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190930575327584109)
,p_name=>'P130_MVMNT_BORDERCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(190155142667797103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190931421467584118)
,p_name=>'P130_MVMNT_TERMINAL_IP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(190155142667797103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190931506702584119)
,p_name=>'P130_VOA_VISA_TEXT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(190155142667797103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190931605654584120)
,p_name=>'P130_VOA_VISA_NUM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(190155142667797103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190155550822797107)
,p_name=>'P130_EVOA_STATUS_CODE: Change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_EVOA_STATUS_CODE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190155947347797111)
,p_event_id=>wwv_flow_api.id(190155550822797107)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let code = this.triggeringElement.value;',
'let text = $("#" + this.triggeringElement.id + " option:selected").text();',
'let msg, msgs;',
'',
'$("#EVOA_STATUS_HEADER")',
'.removeClass("cl-bg-green cl-bg-red cl-bg-orange")',
'.addClass(code == "100" ? "cl-bg-green" : code == "102" ? "cl-bg-orange" : !!code ? "cl-bg-red" : "");',
'',
'if (code == "103") {',
'    msgs = getEVOASearchHeader().message.split('':'');',
'    msg = msgs[msgs.length-1];',
'    text += (!!msg ? " : " + msg : "");',
'}',
'apex.item("P130_EVOA_STATUS").setValue(text);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190156620465797118)
,p_name=>'P130_CLEAR: Click'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(190156545509797117)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190156736043797119)
,p_event_id=>wwv_flow_api.id(190156620465797118)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P130_APPROVAL_CODE,P130_NATIONALITY,P130_DOCUMENT_NO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190156877048797120)
,p_name=>'Search EVOA'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'searchEVOA'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190156925559797121)
,p_event_id=>wwv_flow_api.id(190156877048797120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let nat = this.data.nat;',
'let docno = this.data.docno;',
'let code = this.data.code;',
'let oid = $v("P130_MVMNTID");',
'',
'if (!(code || (nat && docno))) {',
'    apex.message.alert("Please provide the required fields!");',
'    return false;',
'}',
'',
'EVOAFunctions.doEVOASearch(nat, docno, code, oid);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190157488982797126)
,p_name=>'Process EVOA Search Result'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'processEVOA'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190157589778797127)
,p_event_id=>wwv_flow_api.id(190157488982797126)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//set header',
'if (getEVOASearchHeader) {',
'    let header = getEVOASearchHeader();',
'    if (!!header.code) $("#P130_EVOA_STATUS_CODE").val(header.code).trigger("change");',
'}',
'',
'//set resultset',
'if (getEVOASearchResults) {',
'',
'    function doCallback() {',
'        resetDetails();',
'        $(''#SearchResult'').show();',
'        apex.region("SearchResult").refresh();',
'    }',
'',
'    let results = getEVOASearchResults();',
'    console.log("EVOA Search: results:", results);',
'    $(''#SearchResult'').hide();',
'',
'    apex.server.process(',
'        "SET_WS_RESULT"',
'        , {',
'             x01: $v("P130_MVMNTID")',
'            ,x02: $v("P130_VOA_VISA_TEXT")',
'            ,x03: $v("P130_VOA_VISA_NUM")',
'            ,p_clob_01: JSON.stringify(results)',
'        }, {',
'            success: function(data) {',
'                console.log(data);',
'                doCallback();',
'            }, error: function(err) {',
'                console.error(err);',
'                doCallback();',
'                displayApexError();',
'            }',
'        }',
'    );',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190157088918797122)
,p_name=>'P130_SEARCH: Click'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(190156436547797116)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190157107064797123)
,p_event_id=>wwv_flow_api.id(190157088918797122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let pData = [{nat: $v("P130_NATIONALITY"), docno: $v("P130_DOCUMENT_NO"), code: $v("P130_APPROVAL_CODE")}];',
'apex.event.trigger(document, ''searchEVOA'', pData);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190397115968168212)
,p_name=>'Show Passenger Details'
,p_event_sequence=>60
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.a-IRR-table td[class*=''u-t'']:not(:first-child, :last-child):not([headers=''id-ir-col-header-visano''])'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#SearchResult'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190397208268168213)
,p_event_id=>wwv_flow_api.id(190397115968168212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let data_attr = ''data-evoa-passenger-id'';',
'let passengerID = $(this.triggeringElement).closest(''tr'').find(''span[''+data_attr+'']'').attr(data_attr);',
'',
'console.log("passengerID", passengerID);',
'if(!passengerID) return;',
'',
'selectedPassengerID = passengerID;',
'setDetails(passengerID);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190397345397168214)
,p_name=>'P130_SELECTED_PASSENGER_ID: Change'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_SELECTED_PASSENGER_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190400539430168246)
,p_event_id=>wwv_flow_api.id(190397345397168214)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let sel = ''#SearchResult .a-IRR-table tr:not(:first-child)'';',
'let cl = ''cl-row-selected'';',
'',
'$(sel).removeClass(cl);',
'$(sel).find(''span[data-evoa-passenger-id="''+$(this.triggeringElement).val()+''"]'').closest(''tr'').addClass(cl);',
'',
'setTimeout(() => {',
'    apex.region("id-classic-doc-report").refresh();',
'}, 500);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190397614293168217)
,p_name=>'P130_RESP_SEX_TMP: Change'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_RESP_SEX_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190397700290168218)
,p_event_id=>wwv_flow_api.id(190397614293168217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P130_RESP_SEX'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190397942423168220)
,p_name=>'P130_RESP_NATIONALITY_TMP: Change'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_RESP_NATIONALITY_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190398034721168221)
,p_event_id=>wwv_flow_api.id(190397942423168220)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P130_RESP_NATIONALITY'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190398472713168225)
,p_name=>'Additional Document Report: After Refresh'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(380055640151692261)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190398520675168226)
,p_event_id=>wwv_flow_api.id(190398472713168225)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("REFRESH");',
'setTimeout(refreshCaraousel, 300);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190400608541168247)
,p_name=>'Toggle Passenger Selection'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'span.cl-span-select-passenger'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190400773075168248)
,p_event_id=>wwv_flow_api.id(190400608541168247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var $el=$(this.triggeringElement);',
'console.log("passengerid", $el.data("passengerid"));',
'',
'apex.server.process(',
'    "TOGGLE_PASSENGER_SELECTION", {',
'        x01: $el.data("passengerid"),',
'        x02: $el.data("coll-seq"),',
'        x03: $el.data("select-status")',
'    }, ',
'    {',
'        beforeSend: function(){',
'            $el.removeClass("fa-square-o fa-check-square-o").addClass("fa-refresh fa-spin");',
'        },',
'        success: function(pData){ ',
'            console.log(pData);',
'            var $e;',
'            if(pData.passengerid){$e=$(''span#id-span-select-passenger-''+pData.passengerid);}',
'            $e.removeClass("fa-refresh fa-spin")',
'              .addClass(((pData.select_status == "Y") ? "fa-check-square-o" : "fa-square-o"))',
'              .prop("title", ((pData.select_status == "Y") ? "Click to Un-select" : "Click to Select"));',
'            if(pData.success == true){',
'                $e.data("select-status", pData.select_status);',
'                apex.event.trigger(document, "getCollCounts");',
'            }',
'            else {',
'                displayApexError();',
'            }',
'        },',
'        error: function(){',
'            displayApexError();',
'        }',
'    }',
');',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190750356919270425)
,p_name=>'Toggle Passenger Selection All'
,p_event_sequence=>120
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'span.cl-span-select-passenger-all'
,p_bind_type=>'live'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190750440555270426)
,p_event_id=>wwv_flow_api.id(190750356919270425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var $el=$(this.triggeringElement);',
'',
'apex.server.process(',
'    "TOGGLE_PASSENGER_SELECTION_ALL", {',
'        x01: $el.data("select-status")',
'    }, ',
'    {',
'        beforeSend: function(){',
'            $el.removeClass("fa-square-o fa-check-square-o").addClass("fa-refresh fa-spin");',
'        },',
'        success: function(pData){ ',
'            console.log(pData);',
'            var $e = $(''span#id-span-select-passenger-all'');',
'            $e.removeClass("fa-refresh fa-spin")',
'              .addClass(((pData.select_status == "Y") ? "fa-check-square-o" : "fa-square-o"))',
'              .prop("title", ((pData.select_status == "Y") ? "Click to Un-select All" : "Click to Select All"));',
'            if(pData.success == true){',
'                $e.data("select-status", pData.select_status);',
'                apex.event.trigger(document, "getCollCounts");',
'                $(''#SearchResult span.cl-span-select-passenger'')',
'                    .removeClass("fa-square-o fa-check-square-o")',
'                    .addClass(((pData.select_status == "Y") ? "fa-check-square-o" : "fa-square-o"))',
'                    .prop("title", ((pData.select_status == "Y") ? "Click to Un-select" : "Click to Select"))',
'                    .data("select-status", pData.select_status);',
'            }',
'            else {',
'                displayApexError();',
'            }',
'        },',
'        error: function(){',
'            displayApexError();',
'        }',
'    }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190400930013168250)
,p_name=>'Get Coll Counts'
,p_event_sequence=>130
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getCollCounts'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190747909328270401)
,p_event_id=>wwv_flow_api.id(190400930013168250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let htm, cls, sel;',
'',
'apex.server.process("GET_COLL_COUNT", ',
'{}, ',
'{',
'    success: function(pData) ',
'    {',
'        console.log(''GET_COLL_COUNT Result: '', pData);',
'        let total_count = (parseInt(pData.total_count, 10) || 0);',
'        let selected_count = (parseInt(pData.selected_count, 10) || 0);',
'        let selectable_count = (parseInt(pData.selectable_count, 10) || 0);',
'        if (selected_count < selectable_count) {',
'            cls = "fa-square-o";',
'            sel = "N";',
'        }',
'        else if (selected_count === selectable_count) {',
'            cls = "fa-check-square-o";',
'            sel = "Y";',
'        }',
'',
'        if (selectable_count > 0) {',
'            $("#id-span-select-passenger-all").remove();',
'            htm = ''<span id="id-span-select-passenger-all" class="t-Icon fa '' + cls + '' fa-1-7-5x cl-span-select-passenger-all cl-pointer" aria-hidden="true" title="Click to '' + (sel == "Y" ? ''Un-select'' : ''Select'') + '' All" data-select-status="'' + s'
||'el + ''"></span>'';',
'            $("#SELECT_PASSENGER").append(htm);',
'        }',
'',
'        $("#P130_SELECTABLE_COUNT").val(selectable_count).trigger("change");',
'        $("#P130_SELECTED_COUNT").val(selected_count).trigger("change");',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190748317231270405)
,p_name=>'Allow Save Action'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_MVMNTID,P130_APPROVAL_CODE,P130_NATIONALITY,P130_DOCUMENT_NO,P130_SELECTABLE_COUNT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v("P130_MVMNTID").length > 0 ',
'&& (($v("P130_MVMNT_NATIONALITY").trim().length > 0 && $v("P130_MVMNT_DOCNO").trim().length > 0) || $v("P130_APPROVAL_CODE").trim().length > 0)',
'//&& $v("P130_VOA_VISA_TEXT").length > 0',
'//&& $v("P130_VOA_VISA_NUM").length > 0',
'&& parseInt($v("P130_SELECTABLE_COUNT")) > 0'))
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190748440406270406)
,p_event_id=>wwv_flow_api.id(190748317231270405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(190241463701344910)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190748594606270407)
,p_event_id=>wwv_flow_api.id(190748317231270405)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(190241463701344910)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190750000292270422)
,p_name=>'Search Result: After Refresh'
,p_event_sequence=>150
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(190157688244797128)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190750147976270423)
,p_event_id=>wwv_flow_api.id(190750000292270422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(() => {',
'    console.log("REFRESH_IR");',
'    $("#SearchResult .a-IRR-table td[class*=''u-t'']:not(:first-child)").first().trigger("click");',
'    apex.event.trigger(document, "getCollCounts");',
'}, 0);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190751512915270437)
,p_name=>'Page Load'
,p_event_sequence=>160
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190751631163270438)
,p_event_id=>wwv_flow_api.id(190751512915270437)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!!$v("P130_NATIONALITY") && !!$v("P130_DOCUMENT_NO")) {',
'    $("#P130_SEARCH").trigger("click");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190752782680270449)
,p_name=>'P130_SELECTED_COUNT: Change'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_SELECTED_COUNT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190934571916584149)
,p_event_id=>wwv_flow_api.id(190752782680270449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const visa_text = $v("P130_VOA_VISA_TEXT");',
'const visa_num = parseInt($v("P130_VOA_VISA_NUM"), 10) || 0;',
'const has_visa = (!!visa_text && !!visa_num);',
'',
'const passengers = ',
'$("#SearchResult .cl-span-select-passenger").get().map(elem => (',
'    {',
'      pid: $(elem).data("passengerid"),',
'      selected: $(elem).data("select-status")',
'    } ',
'));',
'',
'const sel_passengers = passengers.filter(passenger => passenger.selected === "Y");',
'',
'console.log(passengers);',
'console.log(sel_passengers);',
'',
'$("#SearchResult .cl-span-remarks-passenger, #SearchResult .cl-span-visano-passenger").prop("readonly", true);',
'$(sel_passengers.map(passenger => "#id-span-remarks-passenger-" + passenger.pid).join('','')).prop("readonly", false);',
'',
'if (has_visa) {',
'    $("#SearchResult .cl-span-visano-passenger").val("");',
'    sel_passengers.forEach(function(passenger, idx){',
'        $("#id-span-visano-passenger-" + passenger.pid).val("" + visa_text + (visa_num + idx));',
'    });',
'}',
'else {',
'    $(sel_passengers.map(passenger => "#id-span-visano-passenger-" + passenger.pid).join('','')).prop("readonly", false);',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191114460074281103)
,p_name=>'Check Data Mismatch'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_NATIONALITY,P130_DOCUMENT_NO,P130_RESP_NATIONALITY_TMP,P130_RESP_PASSPORT_NO,P130_RESP_AIRPORT_NAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191114569864281104)
,p_event_id=>wwv_flow_api.id(191114460074281103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let item = this.triggeringElement.id;',
'let value = $.trim($v(item));',
'let $label = $("#" + item.replace("_TMP", "") + "_LABEL");',
'let $item = $("#" + item.replace("_TMP", ""));',
'let cl = "cl-warning", ci = "cl-blink", title = "Data mismatch !";',
'let main;',
'',
'console.log("id:", item);',
'console.log("value:", value);',
'',
'if (item === "P130_NATIONALITY") {',
'    main = $v("P130_MVMNT_NATIONALITY");',
'}',
'else if (item === "P130_DOCUMENT_NO") {',
'    main = $v("P130_MVMNT_DOCNO");',
'}',
'else if (item === "P130_RESP_NATIONALITY_TMP") {',
'    main = $v("P130_MVMNT_NATIONALITY");',
'}',
'else if (item === "P130_RESP_PASSPORT_NO") {',
'    main = $v("P130_MVMNT_DOCNO");',
'}',
'else if (item === "P130_RESP_AIRPORT_NAME") {',
'    main = $v("P130_MVMNT_BORDERCODE");',
'}',
'',
'$label.removeClass(cl).attr("title", "");',
'$item.removeClass(ci).attr("title", "");',
'',
'if (!!value && !!main && value != main) {',
'    $label.addClass(cl).attr("title", title);',
'    $item.addClass(ci).attr("title", title);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(190931962534584123)
,p_name=>'P130_RESP_DAYS_OF_PASSPORT: Change'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_RESP_DAYS_OF_PASSPORT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190932075327584124)
,p_event_id=>wwv_flow_api.id(190931962534584123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let item = this.triggeringElement.id;',
'let value = $.trim($v(item));',
'let $label = $("#" + item + "_LABEL");',
'let $item = $("#" + item);',
'let cl = "cl-warning", ci = "cl-blink", title = "Document expiry !";',
'',
'$label.removeClass(cl).attr("title", "");',
'$item.removeClass(ci).attr("title", "");',
'',
'if (!!value && value <= 30) {',
'    $label.addClass(cl).attr("title", title);',
'    $item.addClass(ci).attr("title", title);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190157288398797124)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitCollection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF apex_collection.collection_exists(p_collection_name => ''COLL_WS_RESULT'') THEN',
'        apex_collection.delete_collection(p_collection_name => ''COLL_WS_RESULT'');',
'    END IF;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190751833497270440)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Coll Attributes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_coll_name      VARCHAR2(100 CHAR) := ''COLL_WS_RESULT'';',
'    l_visa_text      VARCHAR2(5 CHAR) := :P130_VOA_VISA_TEXT;',
'    l_visa_num       NUMBER := TO_NUMBER(:P130_VOA_VISA_NUM);',
'    l_is_manual_visa BOOLEAN := FALSE;',
'    l_attr_num       NUMBER := 20;',
'    l_attr_val       VARCHAR2(20 CHAR) := NULL;',
'BEGIN',
'',
'    FOR x IN 1..apex_application.g_f01.COUNT LOOP',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE',
'        (',
'            p_collection_name => l_coll_name',
'            , p_seq  => apex_application.g_f01(x)',
'            , p_attr_number => 17',
'            , p_attr_value => apex_application.g_f02(x)',
'        );',
'    END LOOP;',
'',
'    l_is_manual_visa := l_is_manual_visa OR (l_visa_text IS NULL);',
'    l_is_manual_visa := l_is_manual_visa OR (l_visa_num IS NULL);',
'',
'    IF l_is_manual_visa THEN',
'        l_attr_num := 21;',
'    END IF;',
'',
'    FOR x IN 1..apex_application.g_f03.COUNT LOOP',
'        l_attr_val := UPPER(apex_application.g_f04(x));',
'',
'        IF NOT l_is_manual_visa THEN',
'            l_attr_val := REPLACE(UPPER(apex_application.g_f04(x)), l_visa_text, '''');',
'        END IF;',
'',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE',
'        (',
'            p_collection_name => l_coll_name',
'            , p_seq  => apex_application.g_f03(x)',
'            , p_attr_number => l_attr_num',
'            , p_attr_value => l_attr_val',
'        );',
'    END LOOP;',
'',
'END;'))
,p_process_error_message=>'Error: Update Coll Attributes - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(190241463701344910)
,p_process_when=>'NVL(:P130_SELECTED_COUNT, 0) > 0'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190750544094270427)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Movements EVOA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_coll_name   VARCHAR2(100 CHAR) := ''COLL_WS_RESULT'';',
'    l_terminal    VARCHAR2(32 CHAR) := v(''AI_TERMINAL_ID'');',
'    l_borderpost  VARCHAR2(32 CHAR) := v(''AI_BORDERPOST_ID'');',
'    l_app_user    VARCHAR2(255 CHAR) := v(''APP_USER'');',
'    l_mvmntid     VARCHAR2(32 CHAR) := :P130_MVMNTID;',
'    l_status_code VARCHAR2(50 CHAR) := :P130_EVOA_STATUS_CODE;',
'BEGIN',
'',
'    IF l_mvmntid IS NULL THEN',
'        RAISE_APPLICATION_ERROR(-20010, ''Movement not found!'');',
'    -- mismatch allowed for now',
'    /*ELSIF NVL(:P130_NATIONALITY, ''~'') != NVL(:P130_MVMNT_NATIONALITY, ''!'') THEN',
'        RAISE_APPLICATION_ERROR(-20020, ''Nationality mismatch!'');',
'    ELSIF NVL(:P130_DOCUMENT_NO, ''~'') != NVL(:P130_MVMNT_DOCNO, ''!'') THEN',
'        RAISE_APPLICATION_ERROR(-20030, ''Document number mismatch!'');*/',
'    END IF;',
'',
'    DELETE FROM movements_evoa ',
'    WHERE mvmntid = l_mvmntid',
'    AND passenger_id NOT IN ',
'    (',
'        SELECT c001 ',
'        FROM apex_collections ',
'        WHERE collection_name = l_coll_name',
'        AND n001 = 1',
'    );',
'',
'    MERGE INTO movements_evoa dest',
'    USING ',
'    (',
'        SELECT * ',
'        FROM apex_collections ',
'        WHERE collection_name = l_coll_name',
'        AND n001 = 1 ',
'    ) src',
'    ON (l_mvmntid = dest.mvmntid AND src.c001 = dest.passenger_id)',
'    WHEN MATCHED THEN UPDATE SET',
'        dest.nationality         = src.c007',
'        ,dest.docno              = src.c009',
'        ,dest.dob                = src.c008',
'        ,dest.arrival_date       = src.c018',
'        ,dest.process_datetime   = SYSDATE',
'        ,dest.process_user       = l_app_user',
'        ,dest.voa_no             = src.c012',
'        ,dest.voa_approve_status = src.c015',
'        ,dest.remarks            = src.c017',
'        ,dest.voa_visa_text      = src.c019',
'        ,dest.voa_visa_num       = src.c020',
'        ,dest.ins_terminal       = l_terminal',
'        ,dest.ins_borderpost     = l_borderpost',
'        ,dest.status_code        = l_status_code',
'        ,dest.manual_visano      = src.c021',
'        ,dest.province           = src.c024',
'        ,dest.district           = src.c025',
'        ,dest.subdistrict        = src.c026',
'        ,dest.address            = src.c027',
'    WHEN NOT MATCHED THEN',
'    INSERT ',
'    (',
'        mvmntid',
'        ,passenger_id',
'        ,nationality',
'        ,docno',
'        ,dob',
'        ,arrival_date',
'        ,process_datetime',
'        ,process_user',
'        ,voa_no',
'        ,voa_approve_status',
'        ,remarks',
'        ,voa_visa_text',
'        ,voa_visa_num',
'        ,ins_terminal',
'        ,ins_borderpost',
'        ,status_code',
'        ,manual_visano',
'        ,province',
'        ,district',
'        ,subdistrict',
'        ,address',
'    )',
'    VALUES ',
'    (',
'        l_mvmntid      --mvmntid',
'        ,src.c001      --passenger_id',
'        ,src.c007      --nationality',
'        ,src.c009      --docno',
'        ,src.c008      --dob',
'        ,src.c018      --arrival_date',
'        ,SYSDATE       --process_datetime',
'        ,l_app_user    --process_user',
'        ,src.c012      --voa_no',
'        ,src.c015      --voa_approve_status',
'        ,src.c017      --remarks',
'        ,src.c019      --voa_visa_text',
'        ,src.c020      --voa_visa_num',
'        ,l_terminal    --ins_terminal',
'        ,l_borderpost  --ins_borderpost',
'        ,l_status_code --status_code',
'        ,src.c021      --manual_visano',
'        ,src.c024      --province',
'        ,src.c025      --district',
'        ,src.c026      --subdistrict',
'        ,src.c027      --address',
'    );',
'',
'END;'))
,p_process_error_message=>'Error: Save - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(190241463701344910)
,p_process_success_message=>'Saved successfully.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190750896636270430)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Collections'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT'');',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190750714547270429)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190930928330584113)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_borderpost_id  borderposts.key_value%TYPE := :AI_BORDERPOST_ID;',
'    l_terminal_ip    terminals.ipaddress%TYPE := :AI_TERMINAL_IP;',
'BEGIN',
'    IF l_borderpost_id IS NOT NULL THEN',
'        BEGIN',
'            SELECT code',
'            INTO :P130_MVMNT_BORDERCODE',
'            FROM dl_bordercontrol.borderposts',
'            WHERE key_value = l_borderpost_id;',
'        EXCEPTION',
'            WHEN NO_DATA_FOUND THEN',
'                :P130_MVMNT_BORDERCODE := NULL;',
'        END;',
'    END IF;',
'',
'    IF l_terminal_ip IS NOT NULL THEN',
'        BEGIN',
'            SELECT ',
'                servapp.pkg_evoa.get_visa_text(l_terminal_ip)',
'                , servapp.pkg_evoa.get_visa_number(l_terminal_ip)',
'            INTO ',
'                :P130_VOA_VISA_TEXT',
'                , :P130_VOA_VISA_NUM',
'            FROM DUAL;',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                :P130_VOA_VISA_TEXT := NULL;',
'                :P130_VOA_VISA_NUM := NULL;',
'        END;',
'    END IF;',
'END;',
''))
,p_process_error_message=>'Error in Fetching EVOA Text.Please Contact Administrator'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190157352629797125)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_WS_RESULT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_coll_name     VARCHAR2(100 CHAR) := ''COLL_WS_RESULT'';',
'    l_mvmntid       VARCHAR2(32 CHAR) := apex_application.g_x01;',
'    l_visa_text     VARCHAR2(5 CHAR) := apex_application.g_x02;',
'    l_visa_num      NUMBER := TO_NUMBER(apex_application.g_x03);',
'    l_clob          CLOB := apex_application.g_clob_01;',
'    l_json_obj      json_object_t;',
'    l_json_arr      json_array_t;',
'    l_arr_size      NUMBER;',
'    l_docs_clob     CLOB;',
'    l_count         NUMBER := 0;',
'    l_selected      NUMBER := 0;',
'    l_remarks       movements_evoa.remarks%TYPE;',
'    l_manual_visano movements_evoa.manual_visano%TYPE;',
'    --',
'    function get_key_value(p_code in varchar2, p_type in varchar2) return varchar2 is',
'        l_key_value varchar2(32 char);',
'    begin',
'        if p_code is null then',
'            return null;',
'        end if;',
'        if p_type = ''PROVINCE'' then',
'            -- p_code: 77',
'            select p.key_value into l_key_value',
'            from adm_class_province p',
'            where p.display_code = p_code;',
'        elsif p_type = ''DISTRICT'' then',
'            -- p_code: 7707',
'            select d.key_value into l_key_value',
'            from adm_class_province p, adm_class_district d',
'            where p.display_code = substr(p_code, 1, 2)',
'            and d.adm_class_province = p.key_value',
'            and d.display_code = substr(p_code, 3, 2);',
'        elsif p_type = ''SUBDISTRICT'' then',
'            -- p_code: 770701',
'            select sd.key_value into l_key_value',
'            from adm_class_province p, adm_class_district d, adm_class_subdistrict sd',
'            where p.display_code = substr(p_code, 1, 2)',
'            and d.adm_class_province = p.key_value',
'            and d.display_code = substr(p_code, 3, 2)',
'            and sd.adm_class_district = d.key_value',
'            and sd.display_code = substr(p_code, 5, 2);',
'        end if;',
'        return l_key_value;',
'    exception',
'        when no_data_found then',
'            return null;',
'    end;',
'    --',
'BEGIN',
'',
'    dl_common.pkg_apex_util.create_empty_collection(l_coll_name);',
'    l_json_obj := json_object_t.parse(l_clob);',
'    l_json_arr := l_json_obj.get_array(''candidates'');',
'    l_arr_size := l_json_arr.get_size;',
'',
'    IF l_arr_size > 0 THEN',
'        IF l_mvmntid IS NOT NULL THEN',
'            SELECT COUNT(1)',
'            INTO l_count',
'            FROM movements_evoa ',
'            WHERE mvmntid = l_mvmntid;',
'        END IF;',
'',
'        FOR x IN',
'        (',
'            SELECT jt.*',
'            FROM JSON_TABLE',
'            (',
'                l_clob',
'                , ''$.candidates[*]''',
'                COLUMNS ',
'                (',
'                    ROW_RN FOR ORDINALITY',
'                    , passenger_id        NUMBER              PATH ''$.passenger_id''',
'                    , salutation          VARCHAR2 (255 CHAR) PATH ''$.salutation''',
'                    , last_name           VARCHAR2 (255 CHAR) PATH ''$.last_name''',
'                    , middle_name         VARCHAR2 (255 CHAR) PATH ''$.middle_name''',
'                    , first_name          VARCHAR2 (255 CHAR) PATH ''$.first_name''',
'                    , sex                 VARCHAR2 (1 CHAR)   PATH ''$.gender''',
'                    , nationality         VARCHAR2 (3 CHAR)   PATH ''$.nationality''',
'                    , dob                 VARCHAR2 (10 CHAR)  PATH ''$.birth_date''',
'                    , docno               VARCHAR2 (20 CHAR)  PATH ''$.passport_number''',
'                    --',
'                    , flight_number       VARCHAR2 (20 CHAR)  PATH ''$.departure_flight_no''  --''$.fligh_number''',
'                    , departure_date      VARCHAR2 (10 CHAR)  PATH ''$.departure_date''',
'                    --    ',
'                    , evoa_no             VARCHAR2 (100 CHAR) PATH ''$.voa_no''',
'                    , evoa_approve_date   VARCHAR2 (30 CHAR)  PATH ''$.approve_date''',
'                    , evoa_approved_by    VARCHAR2 (500 CHAR) PATH ''$.accept_user''',
'                    , evoa_approve_status VARCHAR2 (500 CHAR) PATH ''$.approve_status''',
'                    --',
'                    , accept_date         VARCHAR2 (30 CHAR)  PATH ''$.accept_date''',
'                    , arrival_date        VARCHAR2 (10 CHAR)  PATH ''$.arrival_date''',
'                    --',
'                    , approval_remarks    VARCHAR2 (255 CHAR) PATH ''$.remarkApproval''',
'                    , submitted_visa_no   VARCHAR2 (20 CHAR)  PATH ''$.VisaNo''',
'                    --',
'                    , province            VARCHAR2 (2 CHAR)   PATH ''$.thailand_province_code''',
'                    , district            VARCHAR2 (4 CHAR)   PATH ''$.thailand_ampur_code''',
'                    , subdistrict         VARCHAR2 (6 CHAR)   PATH ''$.thailand_tambon_code''',
'                    , address             VARCHAR2 (255 CHAR) PATH ''$.thailand_address''',
'                )',
'            ) jt',
'        )',
'        LOOP',
'            IF x.passenger_id IS NOT NULL THEN',
'                l_docs_clob := json_object_t(l_json_arr.get(x.row_rn - 1)).get_array(''documentData'').to_clob();',
'',
'                /*IF l_visa_num IS NOT NULL AND x.row_rn > 1 THEN',
'                    l_visa_num := l_visa_num + 1;',
'                END IF;*/',
'',
'                -- replace with bulk select once the max no is confirmed',
'                IF l_count > 0 THEN',
'                    BEGIN',
'                        SELECT 1, remarks, manual_visano ',
'                        INTO l_selected, l_remarks, l_manual_visano',
'                        FROM movements_evoa ',
'                        WHERE mvmntid = l_mvmntid ',
'                        AND passenger_id = x.passenger_id;',
'                    EXCEPTION',
'                        WHEN NO_DATA_FOUND THEN',
'                            l_selected := 0;',
'                            l_remarks := NULL;',
'                            l_manual_visano := NULL;',
'                    END;',
'                END IF;',
'',
'                APEX_COLLECTION.ADD_MEMBER (',
'                      p_collection_name => l_coll_name',
'                    , p_n001            => l_selected',
'                    , p_c001            => x.passenger_id',
'                    , p_c002            => x.salutation',
'                    , p_c003            => UPPER(x.last_name)',
'                    , p_c004            => UPPER(x.middle_name)',
'                    , p_c005            => UPPER(x.first_name)',
'                    , p_c006            => x.sex',
'                    , p_c007            => x.nationality',
'                    , p_c008            => x.dob',
'                    , p_c009            => x.docno',
'                    , p_c010            => x.flight_number',
'                    , p_c011            => x.departure_date',
'                    , p_c012            => x.evoa_no',
'                    , p_c013            => x.evoa_approve_date',
'                    , p_c014            => x.evoa_approved_by',
'                    , p_c015            => UPPER(x.evoa_approve_status)',
'                    , p_c016            => x.accept_date',
'                    , p_c017            => l_remarks',
'                    , p_c018            => x.arrival_date',
'                    , p_c019            => l_visa_text',
'                    , p_c020            => NULL --l_visa_num',
'                    , p_c021            => l_manual_visano',
'                    , p_c022            => x.approval_remarks',
'                    , p_c023            => x.submitted_visa_no',
'                    , p_c024            => get_key_value(x.province, ''PROVINCE'')',
'                    , p_c025            => get_key_value(x.district, ''DISTRICT'')',
'                    , p_c026            => get_key_value(x.subdistrict, ''SUBDISTRICT'')',
'                    , p_c027            => UPPER(x.address)',
'                    , p_clob001         => l_docs_clob',
'                );',
'            END IF;',
'        END LOOP;',
'    END IF;',
'',
'    apex_json.open_object;',
'    apex_json.write(''sqlcode'', 0);',
'    apex_json.write(''sqlerrm'', ''OK'');',
'    apex_json.close_object;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190400836817168249)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TOGGLE_PASSENGER_SELECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_coll_name        VARCHAR2(100) := ''COLL_WS_RESULT'';',
'    l_passenger_id     VARCHAR2(100):= apex_application.g_x01;',
'    l_coll_seq         NUMBER := NVL(TO_NUMBER(apex_application.g_x02), 0);',
'    l_select_status    VARCHAR2(100):= apex_application.g_x03;',
'BEGIN',
'',
'    IF l_passenger_id IS NOT NULL AND l_coll_seq != 0 THEN',
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE',
'        (',
'            p_collection_name => l_coll_name',
'            , p_seq  => l_coll_seq',
'            , p_attr_number => 1',
'            , p_number_value => CASE WHEN l_select_status = ''N'' THEN 1 ELSE 0 END',
'        );',
'    END IF;',
'',
'    -- return',
'    apex_json.open_object;',
'    apex_json.write(''success'', TRUE);',
'    apex_json.write(''passengerid'', l_passenger_id);',
'    apex_json.write(''select_status'', CASE WHEN l_select_status = ''N'' THEN ''Y'' WHEN l_select_status = ''Y'' THEN ''N'' END);',
'    apex_json.close_object;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        -- return',
'        apex_json.open_object;',
'        apex_json.write(''success'', FALSE);',
'        apex_json.write(''passengerid'', l_passenger_id);',
'        apex_json.write(''select_status'', l_select_status);',
'        apex_json.write(''err_msg'', SQLERRM);',
'        apex_json.close_object;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190750230826270424)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TOGGLE_PASSENGER_SELECTION_ALL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_coll_name     VARCHAR2(100) := ''COLL_WS_RESULT'';',
'    l_select_status VARCHAR2(100):= apex_application.g_x01;',
'    l_selected      NUMBER := 0;',
'BEGIN',
'',
'    IF l_select_status IS NOT NULL THEN',
'        SELECT DECODE(l_select_status, ''N'', 1, 0)',
'        INTO l_selected ',
'        FROM DUAL;',
'        ',
'        FOR x IN',
'        (',
'            SELECT seq_id',
'            FROM apex_collections',
'            WHERE collection_name = l_coll_name',
'        )',
'        LOOP',
'            APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE',
'            (',
'                p_collection_name => l_coll_name',
'                , p_seq  => x.seq_id',
'                , p_attr_number => 1',
'                , p_number_value => l_selected',
'            );',
'        END LOOP;',
'    END IF;',
'    ',
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
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190748014575270402)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_COLL_COUNT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_coll_name      VARCHAR2(100 CHAR) := ''COLL_WS_RESULT'';',
'    l_evoa_status    NUMBER := TO_NUMBER(NVL(v(''P130_EVOA_STATUS_CODE''), 0));',
'    l_total_count    NUMBER := 0;',
'    l_selected_count NUMBER := 0;',
'    l_selectable_count NUMBER := 0;',
'BEGIN',
'',
'    IF l_coll_name IS NOT NULL AND APEX_COLLECTION.COLLECTION_EXISTS(l_coll_name) THEN',
'        l_total_count := APEX_COLLECTION.COLLECTION_MEMBER_COUNT(l_coll_name);',
'',
'        SELECT ',
'            COUNT(CASE WHEN n001 = 1 THEN 1 ELSE NULL END)',
'            , COUNT(CASE WHEN c015 = ''APPROVED'' AND c016 IS NULL AND l_evoa_status != 102 THEN 1 ELSE NULL END)',
'        INTO ',
'            l_selected_count',
'            , l_selectable_count',
'        FROM apex_collections',
'        WHERE collection_name = l_coll_name;',
'    END IF;',
'',
'    apex_json.open_object();',
'    apex_json.write(''coll_name'', l_coll_name);',
'    apex_json.write(''total_count'', l_total_count);',
'    apex_json.write(''selectable_count'', l_selectable_count);',
'    apex_json.write(''selected_count'', l_selected_count);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
