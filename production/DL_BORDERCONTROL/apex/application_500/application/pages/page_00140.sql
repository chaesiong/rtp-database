prompt --application/pages/page_00140
begin
wwv_flow_api.create_page(
 p_id=>140
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Biometric Matches'
,p_page_mode=>'MODAL'
,p_step_title=>'Biometric Matches'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var initializeHilightOfSameValues = function() {',
'    var classNameFindSameValue = "hilight_same_value";',
'    var classNameHasSameValue = "has_same_value";',
'    ',
'    var removeHilight = function() {',
'        $("." + classNameFindSameValue).removeClass(classNameHasSameValue);',
'    };',
'',
'    var func_mouseenter = function(ev) {',
'        let elem = $(this);',
'        let value = (elem.val() || elem.text());',
'        $("." + classNameFindSameValue).filter(function(idx, elem) {',
'            elem = $(elem);',
'            return ((elem.val() || elem.text()) == value);',
'        }).addClass(classNameHasSameValue);',
'    };',
'',
'    var func_mouseleave = function(ev) {',
'        removeHilight();',
'    };',
'',
'    $("." + classNameFindSameValue).on("click", func_mouseenter).on("mouseenter", func_mouseenter).on("mouseleave", func_mouseleave);',
'    ',
'    $(".abis_is_fraud").closest(".t-Card").addClass("card_fraud");',
'};',
'',
'function updateResultCount() {',
'    let documentCount = $("#PERSON_DOCUMENTS").find(".t-Cards-item").length;',
'    let hitCount = $("#ABIS_HITS_UNEXPECTED").find(".t-Cards-item").length;',
'    let fraudCount = $(".card_fraud").length;',
'    ',
'    let divider = " : ";',
'    ',
'    $("#document_count_same_person").html(divider + documentCount);',
'    $("#hit_count_abis_unexpected").html(divider + hitCount);',
'    $("#possible_fraud_count").html(divider + fraudCount);',
'}',
'',
'function getCheckedHits() {',
'    let res = [];',
'    $(''[name=f01]'').filter(function(idx, elem) { return elem.checked; }).each(function(idx, elem) {',
'        res.push($(elem).val());',
'    });',
'    return res;',
'}',
'',
'function updateMergeAbisIds() {',
'    let resultList = getCheckedHits().join('','');',
'    //$("#P140_MERGE_ABIS_IDS").val(resultList);',
'    apex.item(''P140_MERGE_ABIS_IDS'').setValue(resultList);',
'}',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.img_live_photo {',
'    /*max-*/width: 150px;',
'    /*max-*/height: 200px;',
'    object-fit: cover; /*contain;*/',
'    /*border: 1px solid rgba(0, 0, 0, 0.1);*/',
'    border-radius: 10%;',
'}',
'',
'span.t-Icon.fa {',
'    width: auto;',
'    height: auto;',
'    /*max-width: 150px;',
'    max-height: 200px;*/',
'}',
'',
'.t-Cards--basic .t-Card-titleWrap {',
'    min-height: 160px;',
'}',
'',
'.t-Cards--basic .t-Card-title {',
'    max-width: calc(100% - 100px);',
'    overflow: visible;',
'}',
'',
'.t-Cards--basic .t-Card-icon {',
'    background: transparent;',
'}',
'',
'.hidden {',
'    display: none;',
'}',
'',
'.abis_is_fraud {',
'    background: red;',
'    color: white;',
'    /*padding: 1em;',
'    margin: 1em;*/',
'}',
'',
'.split {',
'    display: flex;',
'}',
'',
'.split_left, .split_right {',
'    flex: 0;',
'}',
'',
'.split_expand {',
'    flex: 1;',
'}',
'',
'.split>*:last-child {',
'    text-align: right;',
'}',
'',
'.has_same_value {',
'    background: yellow;',
'    display: inline-block;',
'    padding: 0 0.5em;',
'}',
'',
'.t-Cards--animColorFill .t-Card .t-Card-icon:before {',
'    pointer-events: all;',
'}',
'',
'.t-Card-colorFill:after, .t-Card-colorFill:before {',
'    position: inherit;',
'}',
'',
'.hilight_same_value {',
'    /*cursor: pointer;*/',
'    cursor: default;',
'}',
'',
'.t-Card-wrap, .t-Card-titleWrap, .t-Cards--basic .t-Card .t-Card-wrap {',
'    background: inherit !important;',
'}',
'',
'.card_fraud {',
'    background: rgba(255, 0, 0, 0.3);',
'}',
'',
'.u-colors .u-color:before {',
'    background: transparent;',
'    display: none;',
'}',
'',
'.t-Card-info {',
'    font-size: 1.4rem;',
'    line-height: 2rem;',
'}',
'',
'.t-Card-colorFill, .t-Card-icon {',
'    background-color: transparent !important;',
'}',
'',
'.checkbox_group.apex-item-checkbox>label.cards-checkbox-label {',
'    padding-left: 2.5em;',
'    padding-top: 0.3em;',
'}',
'',
'.t-Cards-item {',
'    width: 100%;',
'}',
'',
'.limit-report-height .t-Region-body > div:last-child {',
'    max-height: 500px;',
'}',
'',
'/*.t-Cards-item:last-child {',
'    margin-bottom: 1em;',
'}*/',
'',
'#PERSON_DOCUMENT .t-Region-body {',
'    /*padding-bottom: 0;*/',
'}',
'',
'.i-h480, .i-h480>.t-Region-bodyWrap>.t-Region-body {',
'    height: 540px;',
'}',
'',
'.flex-horizontal {',
'    display: flex;',
'    flex-direction: row;',
'}',
'',
'.flex-expand {',
'    flex: 1;',
'}',
'',
'.text-right {',
'    text-align: right;',
'}',
'',
'#PERSON_DOCUMENT_cards .t-Card {',
'    margin-top: 8px !important;',
'}',
'',
'.t-Card {',
'    margin-top: 0 !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'920'
,p_dialog_width=>'1250'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20191115033153'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54506158012889726)
,p_plug_name=>'Matches'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(54508256719889747)
,p_name=>'Person Documents'
,p_region_name=>'PERSON_DOCUMENTS'
,p_parent_plug_id=>wwv_flow_api.id(54506158012889726)
,p_template=>wwv_flow_api.id(563820889302049617)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_css_classes=>'limit-report-height'
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--removeHeader:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayInitials:t-Cards--float:t-Cards--animColorFill'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    '''' CARD_TITLE',
'  , '''' CARD_TEXT',
'  , '''' CARD_SUBTEXT',
'  , '''' CARD_INITIALS',
'  , '''' CARD_CHECKBOX_VALUE',
'  , matches.*',
'  , ''hidden'' CLS_FRAUD -- case when matches.dateofbirth <> :P140_DATEOFBIRTH then ''abis_is_fraud hidden'' else ''hidden'' end CLS_FRAUD',
'from (',
'    select * from (',
'        select APEX_UTIL.GET_BLOB_FILE_SRC(''P140_PHOTO_URL'', bd.brddocid, 0) photo_img',
'             , bd.givenname firstname',
'             , bd.surname lastname',
'             , bd.docno',
'             , bd.issuectry',
'             --, pkg_common.parse_date(bd.dob, 1, 0, 0, 1) dateofbirth',
'             , bd.dob_partial.getFormatData(''DD/MM/YYYY'') dateofbirth',
'             , '''' row_html',
'             , bd.surname || case when length(trim(bd.givenname)) > 0 then '', '' || bd.givenname else '''' end fullname',
'             , bd.expirydate dateofexpiry',
'          from borderdocuments bd',
'             , identities i',
'         where i.identity = :P140_IDENTITY',
'           and bd.brddocid = i.brddocid',
'    )',
') matches',
'order by dateofexpiry desc',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>'<h2>Documents of the same Person<span id="document_count_same_person"></span></h2>'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P140_DATEOFBIRTH'
,p_query_row_template=>wwv_flow_api.id(563827142119049619)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(54509195158889756)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'Card title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<p><span class="hilight_same_value">#FULLNAME#</span></p><p class="#CLS_FRAUD#">FRAUD!</p><p>Document No.: <span class="hilight_same_value">#DOCNO# (#ISSUECTRY#)</span></p><p>Date of Birth: <span class="hilight_same_value">#DATEOFBIRTH#</span></p>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159274706307564107)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'Card text'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'&nbsp;'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159274895846564108)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>10
,p_column_heading=>'Card subtext'
,p_use_as_row_header=>'N'
,p_column_html_expression=>' '
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159274984861564109)
,p_query_column_id=>4
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>11
,p_column_heading=>'Card initials'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img src="#PHOTO_IMG#" class="img_live_photo">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159276844279564128)
,p_query_column_id=>5
,p_column_alias=>'CARD_CHECKBOX_VALUE'
,p_column_display_sequence=>14
,p_column_heading=>'Card checkbox value'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(54508492593889749)
,p_query_column_id=>6
,p_column_alias=>'PHOTO_IMG'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(54508503830889750)
,p_query_column_id=>7
,p_column_alias=>'FIRSTNAME'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(54508666630889751)
,p_query_column_id=>8
,p_column_alias=>'LASTNAME'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(54508742239889752)
,p_query_column_id=>9
,p_column_alias=>'DOCNO'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(54508799549889753)
,p_query_column_id=>10
,p_column_alias=>'ISSUECTRY'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(54508942176889754)
,p_query_column_id=>11
,p_column_alias=>'DATEOFBIRTH'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(54508999846889755)
,p_query_column_id=>12
,p_column_alias=>'ROW_HTML'
,p_column_display_sequence=>7
,p_column_heading=>'Row html'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table>',
'    <tr>',
'        <td><img src="#PHOTO_IMG#" class="img_live_photo"></td>',
'        <td>',
'            <table>',
'                <tr>',
'                    <td>Name:</td>',
'                    <td>#LASTNAME#, #FIRSTNAME#</td>',
'                </tr>',
'                <tr>',
'                    <td>Document No.:</td>',
'                    <td>#DOCNO# (#ISSUECTRY#)</td>',
'                </tr>',
'                <tr>',
'                    <td>Date of Birth:</td>',
'                    <td>#DATEOFBIRTH#</td>',
'                </tr>',
'            </table>',
'        </td>',
'    </tr>',
'</table>'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159275196525564111)
,p_query_column_id=>13
,p_column_alias=>'FULLNAME'
,p_column_display_sequence=>13
,p_column_heading=>'Fullname'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159277091510564130)
,p_query_column_id=>14
,p_column_alias=>'DATEOFEXPIRY'
,p_column_display_sequence=>15
,p_column_heading=>'Dateofexpiry'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159275017267564110)
,p_query_column_id=>15
,p_column_alias=>'CLS_FRAUD'
,p_column_display_sequence=>12
,p_column_heading=>'Cls fraud'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(159278842673564148)
,p_name=>'Unexpected Matching Results'
,p_region_name=>'ABIS_HITS_UNEXPECTED'
,p_parent_plug_id=>wwv_flow_api.id(54506158012889726)
,p_template=>wwv_flow_api.id(563820889302049617)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_css_classes=>'x-limit-report-height'
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--removeHeader:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayInitials:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    '''' CARD_TITLE',
'  , '''' CARD_TEXT',
'  , '''' CARD_SUBTEXT',
'  , '''' CARD_INITIALS',
'  , '''' CARD_CHECKBOX_VALUE',
'  , ''Add Document to Person'' CARD_CHECKBOX_LABEL',
'  , matches.*',
'  -- , case when matches.abis_score < 60 then ''abis_is_fraud'' else ''hidden'' end CLS_FRAUD',
'  , case when matches.dateofbirth <> :P140_DATEOFBIRTH then ''abis_is_fraud hidden'' else ''hidden'' end CLS_FRAUD',
'from (',
'    select * from (',
'        with abis_results as (',
'            select score_type, abis_id, abis_score, round(score_percent, 2) score_percent, is_expected from v_session_travel_abis_results',
'        )',
'        select ar.abis_id RWNUM',
'             , APEX_UTIL.GET_BLOB_FILE_SRC(''P140_PHOTO_URL'', bd.brddocid, 0) photo_img',
'             , bd.givenname firstname',
'             , bd.surname lastname',
'             , bd.docno',
'             , bd.issuectry',
'             --, pkg_common.parse_date(bd.dob, 1, 0, 0, 1) dateofbirth',
'             , bd.dob_partial.getFormatData(''DD/MM/YYYY'') dateofbirth',
'             , '''' row_html',
'             , bd.surname || case when length(trim(bd.givenname)) > 0 then '', '' || bd.givenname else '''' end fullname',
'             , ar.score_percent abis_score',
'         from borderdocuments bd',
'            , abis_results ar',
'        where bd.afisid = ar.abis_id',
'          and ar.is_expected = 0',
'        order by ar.abis_score desc',
'    )',
'    where rownum <= 30',
') matches',
'order by',
'/*    m.ins_at desc',
'  ,*/ abis_score desc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="flex-horizontal">',
'    <span>',
'        Additional Hits<span id="hit_count_abis_unexpected"></span>',
'    </span>',
'    <span class="flex-expand text-right">',
'        Possible Frauds<span id="possible_fraud_count"></span>',
'    </span>',
'</h2>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P140_DATEOFBIRTH'
,p_query_row_template=>wwv_flow_api.id(167971456501403900)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159279482991564154)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>4
,p_column_heading=>'Card title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<p><span class="hilight_same_value">#FULLNAME#</span></p><p class="#CLS_FRAUD#">FRAUD!</p><p>Document No.: <span class="hilight_same_value">#DOCNO# (#ISSUECTRY#)</span></p><p>Date of Birth: <span class="hilight_same_value dob-value">#DATEOFBIRTH#</sp'
||'an></p>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159279556932564155)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>5
,p_column_heading=>'Card text'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'ABIS Score: #ABIS_SCORE#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159279603307564156)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>6
,p_column_heading=>'Card subtext'
,p_use_as_row_header=>'N'
,p_column_html_expression=>' '
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179714636122037807)
,p_query_column_id=>4
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>7
,p_column_heading=>'Card initials'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img src="#PHOTO_IMG#" class="img_live_photo">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179715680348037817)
,p_query_column_id=>5
,p_column_alias=>'CARD_CHECKBOX_VALUE'
,p_column_display_sequence=>17
,p_column_heading=>'Card checkbox value'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'#RWNUM#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159279111173564151)
,p_query_column_id=>6
,p_column_alias=>'CARD_CHECKBOX_LABEL'
,p_column_display_sequence=>1
,p_column_heading=>'Card checkbox label'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159279264961564152)
,p_query_column_id=>7
,p_column_alias=>'RWNUM'
,p_column_display_sequence=>2
,p_column_heading=>'Rwnum'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179714821526037809)
,p_query_column_id=>8
,p_column_alias=>'PHOTO_IMG'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179714924754037810)
,p_query_column_id=>9
,p_column_alias=>'FIRSTNAME'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179715093519037811)
,p_query_column_id=>10
,p_column_alias=>'LASTNAME'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(159279397812564153)
,p_query_column_id=>11
,p_column_alias=>'DOCNO'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179715098731037812)
,p_query_column_id=>12
,p_column_alias=>'ISSUECTRY'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179715249279037813)
,p_query_column_id=>13
,p_column_alias=>'DATEOFBIRTH'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179715323011037814)
,p_query_column_id=>14
,p_column_alias=>'ROW_HTML'
,p_column_display_sequence=>14
,p_column_heading=>'Row html'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table>',
'    <tr>',
'        <td><img src="#PHOTO_IMG#" class="img_live_photo"></td>',
'        <td>',
'            <table>',
'                <tr>',
'                    <td>Name:</td>',
'                    <td>#LASTNAME#, #FIRSTNAME#</td>',
'                </tr>',
'                <tr>',
'                    <td>Document No.:</td>',
'                    <td>#DOCNO# (#ISSUECTRY#)</td>',
'                </tr>',
'                <tr>',
'                    <td>Date of Birth:</td>',
'                    <td>#DATEOFBIRTH#</td>',
'                </tr>',
'            </table>',
'        </td>',
'    </tr>',
'</table>'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179714715726037808)
,p_query_column_id=>15
,p_column_alias=>'FULLNAME'
,p_column_display_sequence=>8
,p_column_heading=>'Fullname'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179715588948037816)
,p_query_column_id=>16
,p_column_alias=>'ABIS_SCORE'
,p_column_display_sequence=>16
,p_column_heading=>'Abis score'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179715413634037815)
,p_query_column_id=>17
,p_column_alias=>'CLS_FRAUD'
,p_column_display_sequence=>15
,p_column_heading=>'Cls fraud'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(179715835360037819)
,p_name=>'Scanned Document'
,p_region_name=>'PERSON_DOCUMENT'
,p_parent_plug_id=>wwv_flow_api.id(54506158012889726)
,p_template=>wwv_flow_api.id(563820889302049617)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayInitials:t-Cards--float:t-Cards--animColorFill'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with scanned_document as (',
'    select :P17_DISPLAY_LASTNAME lastname',
'         , trim(trim(:P17_DISPLAY_FIRSTNAME) /*|| '' '' || trim(:P17_DISPLAY_MIDDLENAME)*/) firstname',
'         , :P17_DISPLAY_DOB_TEXT dateofbirth',
'         , :P17_DISPLAY_DOCNUMBER docno',
'         , :P17_NATIONALITY_ID issuectry',
'         , :P17_BRDDOCID documentid',
'      from dual',
'), current_document as (',
'    select lastname || case when length(firstname) > 0 then '', '' || firstname else '''' end fullname',
'         , firstname',
'         , docno',
'         , dateofbirth',
'         , issuectry',
'         , APEX_UTIL.GET_BLOB_FILE_SRC(''P140_PHOTO_URL'', documentid, 0) photo_img',
'      from scanned_document',
')',
'select',
'    '''' CARD_TITLE',
'  , '''' CARD_TEXT',
'  , '''' CARD_SUBTEXT',
'  , '''' CARD_INITIALS',
'  , '''' CARD_CHECKBOX_VALUE',
'  , doc.*',
'  -- , case when matches.abis_score < 60 then ''abis_is_fraud'' else ''hidden'' end CLS_FRAUD',
'  , ''hidden'' CLS_FRAUD -- case when matches.dateofbirth <> :P140_DATEOFBIRTH then ''abis_is_fraud hidden'' else ''hidden'' end CLS_FRAUD',
'from current_document doc'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P140_DATEOFBIRTH'
,p_query_row_template=>wwv_flow_api.id(563827142119049619)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179716112588037822)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<p><span class="hilight_same_value">#FULLNAME#</span></p><p class="#CLS_FRAUD#">FRAUD!</p><p>Document No.: <span class="hilight_same_value">#DOCNO# (#ISSUECTRY#)</span></p><p>Date of Birth: <span class="hilight_same_value">#DATEOFBIRTH#</span></p>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179716278225037823)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card text'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'&nbsp;'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179716347774037824)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card subtext'
,p_use_as_row_header=>'N'
,p_column_html_expression=>' '
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179716418400037825)
,p_query_column_id=>4
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>5
,p_column_heading=>'Card initials'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<img src="#PHOTO_IMG#" class="img_live_photo">'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179715924832037820)
,p_query_column_id=>5
,p_column_alias=>'CARD_CHECKBOX_VALUE'
,p_column_display_sequence=>1
,p_column_heading=>'Card checkbox value'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179716513336037826)
,p_query_column_id=>6
,p_column_alias=>'FULLNAME'
,p_column_display_sequence=>6
,p_column_heading=>'Fullname'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179716717475037828)
,p_query_column_id=>7
,p_column_alias=>'FIRSTNAME'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179716936708037830)
,p_query_column_id=>8
,p_column_alias=>'DOCNO'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179717155736037832)
,p_query_column_id=>9
,p_column_alias=>'DATEOFBIRTH'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179717020329037831)
,p_query_column_id=>10
,p_column_alias=>'ISSUECTRY'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179716658400037827)
,p_query_column_id=>11
,p_column_alias=>'PHOTO_IMG'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(179717364878037834)
,p_query_column_id=>12
,p_column_alias=>'CLS_FRAUD'
,p_column_display_sequence=>12
,p_column_heading=>'Cls fraud'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179717590190037836)
,p_plug_name=>'Dialog Buttons'
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
 p_id=>wwv_flow_api.id(159279068002564150)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(159278842673564148)
,p_button_name=>'TEST_1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Test'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(159275647807564116)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(54506158012889726)
,p_button_name=>'P140_BTN_REFRESH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Show Results'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'hidden'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(179717496761037835)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(179717590190037836)
,p_button_name=>'P140_BTN_MERGE'
,p_button_static_id=>'BTN_MERGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Add selected Documents to this Person'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-check-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(179717635245037837)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(179717590190037836)
,p_button_name=>'P140_BTN_IGNORE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Ignore'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54507134792889736)
,p_name=>'P140_PHOTO_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(54506158012889726)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New'
,p_source=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_06=>'Y'
,p_attribute_07=>'xxx'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54507563377889740)
,p_name=>'P140_BRDDOC_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(54506158012889726)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Brddoc id'
,p_source=>'BRDDOCID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159275592776564115)
,p_name=>'P140_DATEOFBIRTH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(54506158012889726)
,p_prompt=>'DateOfBirth'
,p_source=>'P17_DISPLAY_DOB_TEXT'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159276369502564123)
,p_name=>'P140_SEQNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(54506158012889726)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Seqno'
,p_source=>'SEQNO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159276940086564129)
,p_name=>'P140_IDENTITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(54506158012889726)
,p_prompt=>'DateOfBirth'
,p_source=>'select identity from identities where brddocid = :P140_REQUEST_DOC_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159278106242564141)
,p_name=>'P140_REQUEST_DOC_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(54506158012889726)
,p_prompt=>'DateOfBirth'
,p_source=>'P17_BRDDOCID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159278950327564149)
,p_name=>'P140_CHECKBOX_CONTENT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(159278842673564148)
,p_use_cache_before_default=>'NO'
,p_source=>'CHECKBOX_CONTENT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(167981120577408422)
,p_name=>'P140_NEW'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(54506158012889726)
,p_prompt=>'New'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Display1;Return1,Display2;Return2'
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(179718712602037848)
,p_name=>'P140_MERGE_ABIS_IDS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(54506158012889726)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(159275742338564117)
,p_name=>'Refresh Results'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(159275647807564116)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(159275854448564118)
,p_event_id=>wwv_flow_api.id(159275742338564117)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(54508256719889747)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(159275927964564119)
,p_name=>'Initialize Highlight of Same Content'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(54508256719889747)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(159276004027564120)
,p_event_id=>wwv_flow_api.id(159275927964564119)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'initializeHilightOfSameValues();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(159276100367564121)
,p_name=>'OnLoad: Initialize Hilighting'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(159276296100564122)
,p_event_id=>wwv_flow_api.id(159276100367564121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'initializeHilightOfSameValues();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(179718108285037842)
,p_name=>'OnLoad: Preselect Non-Fraud Hits'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179718260890037843)
,p_event_id=>wwv_flow_api.id(179718108285037842)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let scannedDateOfBirth = $("#P140_DATEOFBIRTH").val() || "";',
'',
'$("[name=f01]").each(function(idx, elem) {',
'    let $elem = $(elem);',
'    let hitDateOfBirth = $elem.closest(''.t-Card-titleWrap'').find(''.dob-value'').text() || "";',
'    ',
'    if (!!scannedDateOfBirth && (scannedDateOfBirth == hitDateOfBirth)) {',
'        elem.checked = true;',
'    }',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(159278632482564146)
,p_name=>'OnLoad: Update Result Count'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(159278771905564147)
,p_event_id=>wwv_flow_api.id(159278632482564146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'updateResultCount();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(179718372737037844)
,p_name=>'Disable Merge Button if no selected Hits'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'getCheckedHits().length < 1'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179718467612037845)
,p_event_id=>wwv_flow_api.id(179718372737037844)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(179717496761037835)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179718557520037846)
,p_event_id=>wwv_flow_api.id(179718372737037844)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(179717496761037835)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179718810410037849)
,p_event_id=>wwv_flow_api.id(179718372737037844)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'updateMergeAbisIds();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179718939946037850)
,p_event_id=>wwv_flow_api.id(179718372737037844)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'updateMergeAbisIds();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54507469680889739)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Images'
,p_attribute_02=>'BORDERDOCIMAGES'
,p_attribute_03=>'P140_BRDDOC_ID'
,p_attribute_04=>'BRDDOCID'
,p_attribute_05=>'P140_SEQNO'
,p_attribute_06=>'SEQNO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(167981641260408427)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'COLLECT: CHECKBOXES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    null;',
'    /*',
'    :P140_CHECKBOX_CONTENT := NULL;',
'',
'    FOR i IN 1 .. APEX_APPLICATION.G_F01.COUNT',
'    LOOP',
'    ',
'        :P140_CHECKBOX_CONTENT := :P140_CHECKBOX_CONTENT || '':'' || APEX_APPLICATION.G_F01(i);',
'    END LOOP;',
'    ',
'    :P140_MERGE_ABIS_IDS := :P140_CHECKBOX_CONTENT;',
'    */',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(179717496761037835)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(179719072357037851)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Store merge ABIS IDs in Session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_abis_ids WWV_FLOW_GLOBAL.vc_arr2;',
'    l_params logger.tab_param;',
'    l_merge_abis_ids varchar2(4000) := :P140_MERGE_ABIS_IDS;',
'begin ',
'    logger.append_param(l_params, ''P140_MERGE_ABIS_IDS'', l_merge_abis_ids);',
'    logger.log(''P140 - Store merge ABIS IDs in Session'', ''Page Process'', null, l_params);',
'    null;',
'    dl_common.pkg_apex_util.create_empty_collection(p_collection_name => ''P17_MERGE_ABIS_IDS'');',
'    select column_value abis_id',
'      bulk collect into l_abis_ids',
'      from table(apex_string.split(l_merge_abis_ids, '',''));',
'',
'    if l_abis_ids.count > 0 then',
'        APEX_COLLECTION.ADD_MEMBERS(p_collection_name => ''P17_MERGE_ABIS_IDS''',
'                                  , p_c001            => l_abis_ids);',
'    end if;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(179717496761037835)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(179719190102037852)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(159278086272564140)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Session Items for this Page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
