prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Startscreen'
,p_page_mode=>'NORMAL'
,p_step_title=>'Startscreen'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Startscreen'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_IMAGES#Dermalog.DeviceProviderWebPlugin.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function adjustReportHeight(){',
'    setTimeout(function(){',
'        var h = $(''.resizeable .a-IG'').closest(''.row'').height();',
'        $(''.resizeable .a-IG'').height(',
'           h - 185+''px''',
'        );',
'        $(''#LatestHitsGrid_ig'').height(',
'           h +''px''',
'        );',
'    },500);',
'}',
'',
'$(window).on(''resize'', adjustReportHeight);'))
,p_javascript_code_onload=>'$(window).resize();'
,p_css_file_urls=>'#APP_IMAGES#css/application-overwrite.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Body .t-Body-main .t-Body-content>.t-Body-contentInner {',
'    height: calc(100vh - 80px);',
'    padding:0;',
'}',
'html, body, .t-Body .t-Body-main .t-Body-content>.t-Body-contentInner>.container {',
'    height: 100%',
'}',
'',
'.t-Body .t-Body-main .t-Body-content>.t-Body-contentInner>.container>.row,',
'.t-Body .t-Body-main .t-Body-content>.t-Body-contentInner>.container>.row>.col{',
'    height: 100%',
'}',
'.t-Body .t-Body-main .t-Body-content {',
'    height: calc(100% - 50px);',
'    display: block;',
'}',
'.t-Footer {',
'    padding: 5px;',
'    position: absolute;',
'    bottom: 0;',
'    width: 100%;',
'}',
'.t-Footer-srMode {',
'    display:none;',
'}',
'.region-100-with-header>.t-Region-bodyWrap {',
'    max-height: calc(100% - 50px) !important;',
'}',
'.region-100.container-region {',
'    padding: 10px;',
'}',
'#CreateCase {',
'    position: absolute;',
'    right: 20px;',
'    top: 58px;',
'}',
'',
'div.my-icon div.t-Region-headerItems {',
'    background-repeat: no-repeat;',
'    background-position: right center;',
'    background-size: contain !important;',
'}',
'',
'div.my-icon-reporting div.t-Region-headerItems {',
'    background-image: url(#APP_IMAGES#images/my_icon_reporting.png);',
'}',
'.search-button, .trash-button {',
'  margin: 12px -10px 0px;',
'}',
'.trash-button {',
'  margin-left: -5px;',
'}',
'.a-IG-header:empty {',
'    padding: 0;',
'}',
'.second-row .t-Form-labelContainer, .first-row .t-Form-labelContainer {',
'    padding-top: 0;',
'}',
'.first-row .t-Form-inputContainer {',
'    padding-bottom: 0.2rem;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190718135756'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88976442013448096)
,p_plug_name=>'New'
,p_region_css_classes=>'region-100 container-region'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43043156461882743)
,p_plug_name=>'Last Entries'
,p_parent_plug_id=>wwv_flow_api.id(88976442013448096)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43043696044882748)
,p_plug_name=>'Hits'
,p_region_name=>'LatestHitsGrid'
,p_parent_plug_id=>wwv_flow_api.id(43043156461882743)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT ',
'      bc.id ',
'      , bc.dml_at as updated',
'      , identities.identity_names',
'      , nvl(ct.DISPLAY_VALUE, ct.DISPLAY_VALUE$dlc) as type',
'      , NVL(rc.display_value,rc.DISPLAY_VALUE$DLC)  as reason ',
'      , coalesce((SELECT  ''/image/''||image_id||''?width=450'' FROM dl_blacklist.faces f WHERE f.biometric_id = b.id AND ROWNUM = 1), ''#WORKSPACE_IMAGES#template_photo.png'') as image',
'  FROM dl_blacklist.blacklist_cases bc',
'  JOIN dl_common.case_types$LC ct                ON ct.key_value = bc.case_type',
'  JOIN dl_common.reason_codes$LC rc              ON rc.key_value = bc.reason',
'  LEFT JOIN dl_blacklist.biometrics b            ON b.blacklist_case_id = bc.id',
'  LEFT JOIN dl_blacklist.blacklist_case_identities ci ON bc.id = ci.blacklist_case',
'  LEFT JOIN (',
'              SELECT ',
'                    case_names.blacklist_case',
'                    ,LISTAGG (',
'                        CASE WHEN case_names.surname IS NOT NULL AND case_names.given_name IS NOT NULL ',
'                              THEN case_names.surname || '', '' || case_names.given_name',
'                              ELSE coalesce(case_names.surname, case_names.given_name)',
'                         END , ''; '' ON OVERFLOW TRUNCATE ''...'') WITHIN GROUP (ORDER BY case_names.surname, case_names.given_name) AS identity_names',
'              FROM',
'                    (',
'                    SELECT',
'                        ci.blacklist_case',
'                        ,i.surname',
'                        ,i.given_name',
'                    FROM',
'                        dl_blacklist.blacklist_case_identities ci',
'                        JOIN dl_blacklist.identities i ON (ci.identity = i.key_value)  ',
'                    UNION',
'                    SELECT',
'                        ci.blacklist_case',
'                        ,i.surname_thai surname',
'                        ,i.givenname_thai given_name',
'                    FROM',
'                        dl_blacklist.blacklist_case_identities ci',
'                        JOIN dl_blacklist.identities i ON (ci.identity = i.key_value)  ',
'                    UNION                    ',
'                    SELECT',
'                        ci.blacklist_case',
'                        ,td.surname',
'                        ,td.given_name',
'                    FROM',
'                        dl_blacklist.blacklist_case_identities ci',
'                        JOIN dl_blacklist.travel_docs td ON (ci.identity = td.identity)    ',
'                    ) case_names',
'              GROUP BY',
'                    case_names.blacklist_case ',
'            )identities ON (bc.id = identities.blacklist_case)',
'  WHERE ((select',
'        count(*)',
'    from dl_user_management.user_role_rel urr',
'    left join dl_user_management.users u',
'        on u.id = urr.user_id',
'    right join dl_user_management.role_object_grant_rel rogr',
'        on rogr.role_id = urr.role_id',
'    right join dl_user_management.object_grant_rel ogr',
'        on ogr.id = rogr.object_grant_rel_id ',
'    where u.username = :APP_USER and ogr.object_id = ''BL_MSC'') >= 1 or bc.is_active = ''Y'')',
'    AND bc.DML_AT >= cast(trunc(sysdate) - 30 as date)',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(1600606663907925)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Updated'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yyyy HH24:MI'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5195072659864018)
,p_name=>'IDENTITY_NAMES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDENTITY_NAMES'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Identity names'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30340711596948841)
,p_name=>'REASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REASON'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Reason'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<span data-blacklist-case-id="&ID.">&REASON.</span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30341486204948848)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>128
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30341585140948849)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Image'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<img src="&IMAGE." data-blacklist-case-id="&ID." style="max-width:50px">'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(56763633097779629)
,p_name=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>512
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(43043767635882749)
,p_internal_uid=>43043767635882749
,p_is_editable=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>550
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(47185285802572597)
,p_interactive_grid_id=>wwv_flow_api.id(43043767635882749)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(47185399807572598)
,p_report_id=>wwv_flow_api.id(47185285802572597)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(42258954875363)
,p_view_id=>wwv_flow_api.id(47185399807572598)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(5195072659864018)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>251
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1448189604030605)
,p_view_id=>wwv_flow_api.id(47185399807572598)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(56763633097779629)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3590764146679564)
,p_view_id=>wwv_flow_api.id(47185399807572598)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(1600606663907925)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47582270092137230)
,p_view_id=>wwv_flow_api.id(47185399807572598)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(30340711596948841)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47629131441626834)
,p_view_id=>wwv_flow_api.id(47185399807572598)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(30341486204948848)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(47631401886645370)
,p_view_id=>wwv_flow_api.id(47185399807572598)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(30341585140948849)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56762599582779618)
,p_plug_name=>'Import Biometric Data'
,p_region_name=>'CreateNistCase'
,p_parent_plug_id=>wwv_flow_api.id(88976442013448096)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p>Create a Blacklist Case based on the biometric data of a NIST File</p>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88976607040448097)
,p_plug_name=>'Search&Insert'
,p_region_name=>'SearchAndInsert'
,p_parent_plug_id=>wwv_flow_api.id(88976442013448096)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Search and insert blacklist cases by biometric and demographic data.</p>',
'<img src="#APP_IMAGES#images/Insert-Preview.PNG" style=" max-width:100%">',
'',
'<br>',
'',
''))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88976703483448098)
,p_plug_name=>'Manage Cases'
,p_parent_plug_id=>wwv_flow_api.id(88976442013448096)
,p_region_css_classes=>'region-100 region-100-with-header'
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>5
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56764031589779633)
,p_plug_name=>'Search Cases'
,p_parent_plug_id=>wwv_flow_api.id(88976703483448098)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88977033045448102)
,p_plug_name=>'Cases'
,p_region_name=>'CasesGrid'
,p_parent_plug_id=>wwv_flow_api.id(88976703483448098)
,p_region_css_classes=>'resizeable'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH country_continent AS (',
'    SELECT',
'        cty.key_value AS country_key_value,',
'        cnt.key_value AS coontinent_key_value,',
'        cnt.display_value,',
'        cnt.display_code as continent_display_code',
'    FROM',
'        dl_common.countries cty',
'        INNER JOIN dl_common.continents cnt ON cty.continent = cnt.key_value',
') SELECT',
'    bc.id,',
'    bc.is_active,',
'    bc.authority,',
'    COALESCE(i.given_name, td.given_name, i.givenname_thai) AS firstname,',
'    COALESCE(i.surname, td.surname, i.surname_thai) AS lastname,',
'    (',
'        SELECT',
'            display_value',
'        FROM',
'            dl_common.reason_codes',
'        WHERE',
'            key_value = bc.reason',
'    ) AS reason,',
'    bc.case_number,',
'    td.doc_number,',
'    COALESCE(i.nationality, td.nationality) AS nationality',
'  FROM',
'    dl_blacklist.blacklist_cases bc',
'    INNER JOIN dl_blacklist.blacklist_case_identities ci ON bc.id = ci.blacklist_case',
'    INNER JOIN dl_blacklist.identities i ON ci.identity = i.key_value',
'    LEFT JOIN dl_blacklist.travel_docs td ON td.identity = i.key_value',
'    LEFT JOIN country_continent cc ON ( cc.country_key_value = td.issuing_country',
'                                        OR cc.country_key_value = i.nationality )',
'  WHERE',
'    ((select',
'        count(*)',
'    from dl_user_management.user_role_rel urr',
'    left join dl_user_management.users u',
'        on u.id = urr.user_id',
'    right join dl_user_management.role_object_grant_rel rogr',
'        on rogr.role_id = urr.role_id',
'    right join dl_user_management.object_grant_rel ogr',
'        on ogr.id = rogr.object_grant_rel_id ',
'    where u.username = :APP_USER and ogr.object_id = ''BL_MSC'') >= 1 or bc.is_active = ''Y'')',
'    AND (',
'        :p1_case_no IS NULL',
'        OR upper(bc.case_number) LIKE upper(''%''',
'                                                 ||:p1_case_no',
'                                                 || ''%'')',
'    )',
'    AND (',
'        :p1_firstname IS NULL',
'        OR upper(i.given_name) LIKE upper(''%''',
'                                               ||:p1_firstname',
'                                               || ''%'')',
'        OR upper(i.surname) LIKE upper(''%''',
'                                            ||:p1_firstname',
'                                            || ''%'')',
'        OR upper(td.given_name) LIKE upper(''%''',
'                                                ||:p1_firstname',
'                                                || ''%'')',
'        OR upper(td.surname) LIKE upper(''%''',
'                                             ||:p1_firstname',
'                                             || ''%'')',
'        OR upper(i.surname_thai) LIKE upper(''%''',
'                                                ||:p1_firstname',
'                                                || ''%'')',
'        OR upper(i.givenname_thai) LIKE upper(''%''',
'                                             ||:p1_firstname',
'                                             || ''%'')',
'        ',
'    )',
'    AND (',
'        :p1_lastname IS NULL',
'        OR upper(i.surname) LIKE upper(''%''',
'                                            ||:p1_lastname',
'                                            || ''%'')',
'        OR upper(i.given_name) LIKE upper(''%''',
'                                               ||:p1_lastname',
'                                               || ''%'')',
'        OR upper(td.surname) LIKE upper(''%''',
'                                             ||:p1_lastname',
'                                             || ''%'')',
'        OR upper(td.given_name) LIKE upper(''%''',
'                                                ||:p1_lastname',
'                                                || ''%'')',
'        OR upper(i.surname_thai) LIKE upper(''%''',
'                                             ||:p1_lastname',
'                                             || ''%'')',
'        OR upper(i.givenname_thai) LIKE upper(''%''',
'                                                ||:p1_lastname',
'                                                || ''%'')',
'        ',
'    )',
'    AND (',
'        :p1_related_document IS NULL',
'        OR upper(bc.reference_document) LIKE upper(''%''',
'                                                        ||:p1_related_document',
'                                                        || ''%'')',
'        OR upper(bc.criminal_case_number) LIKE upper(''%''',
'                                                          ||:p1_related_document',
'                                                          || ''%'')',
'        OR upper(bc.decided_case_number) LIKE upper(''%''',
'                                                         ||:p1_related_document',
'                                                         || ''%'')',
'        OR upper(bc.related_document) LIKE upper(''%''',
'                                                      ||:p1_related_document',
'                                                      || ''%'')',
'        OR upper(bc.ostay_tm6) LIKE upper(''%''',
'                                               ||:p1_related_document',
'                                               || ''%'')',
'        OR upper(bc.lost_pp_new_pp_number) LIKE upper(''%''',
'                                                           ||:p1_related_document',
'                                                           || ''%'')',
'    )',
'    AND (',
'        :p1_passport_no IS NULL',
'        OR upper(td.doc_number) LIKE upper(''%''',
'                                                ||:p1_passport_no',
'                                                || ''%'')',
'    )',
'    AND (',
'        :p1_continent IS NULL',
'        OR upper(cc.coontinent_key_value) LIKE ''%''',
'                                                   ||:p1_continent',
'                                                   || ''%''',
'    ) ',
'    AND (',
'        :P1_COUNTRY_CODE IS NULL',
'        OR upper(coalesce(i.nationality,td.nationality,td.issuing_country)) = :P1_COUNTRY_CODE',
'    ) ',
'    AND ROWNUM < 30000',
'    '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28685625726891942)
,p_name=>'NATIONALITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NATIONALITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nationality'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>128
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43041953151882731)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>128
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(51374178557666638)
,p_name=>'CASE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CASE_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Case number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(56764625675779639)
,p_name=>'DOC_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>80
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(56764901114779642)
,p_name=>'IS_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_ACTIVE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Is active'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>4
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88977660733448108)
,p_name=>'AUTHORITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUTHORITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Authority'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<span data-blacklist-case-id="&ID.">&AUTHORITY.</span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88977730204448109)
,p_name=>'REASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REASON'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Reason'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>512
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111873433040557510)
,p_name=>'FIRSTNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIRSTNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Firstname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(111873594528557511)
,p_name=>'LASTNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LASTNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Lastname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(88977576636448107)
,p_internal_uid=>88977576636448107
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>false
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>710
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(91818340204070412)
,p_interactive_grid_id=>wwv_flow_api.id(88977576636448107)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(91818453022070413)
,p_report_id=>wwv_flow_api.id(91818340204070412)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(187740992892234)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(56764625675779639)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39694680042509173)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(28685625726891942)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46657496819376335)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(43041953151882731)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51912410014361203)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(51374178557666638)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91818885437070443)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(88977660733448108)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(91819480747070478)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(88977730204448109)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109572698831776841)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(56764901114779642)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113844100563184043)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(111873433040557510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113844511669184094)
,p_view_id=>wwv_flow_api.id(91818453022070413)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(111873594528557511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88976740403448099)
,p_plug_name=>'Reporting'
,p_parent_plug_id=>wwv_flow_api.id(88976442013448096)
,p_region_css_classes=>'my-icon-reporting my-icon'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(56764784916779640)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(56764031589779633)
,p_button_name=>'New'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276401767705294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'trash-button'
,p_icon_css_classes=>'fa-trash'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(56764898621779641)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(56764031589779633)
,p_button_name=>'New_1'
,p_button_static_id=>'SearchButton'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276401767705294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New 1'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'search-button'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43043552205882747)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(88976703483448098)
,p_button_name=>'CreateCase'
,p_button_static_id=>'CreateCase'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Text Case'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43041657576882728)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(88976703483448098)
,p_button_name=>'OpenCase'
,p_button_static_id=>'OpenCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Open'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'tabindex="-1" '
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45937508133565392)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(88976607040448097)
,p_button_name=>'OpenMultiBiometricSearch'
,p_button_static_id=>'OpenMultiBiometricSearch'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Open'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(56762683039779619)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(56762599582779618)
,p_button_name=>'CreateNISTCase'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create NIST Case'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3135133136378738)
,p_name=>'P1_CONTINENT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(56764031589779633)
,p_prompt=>'Continent'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_CONTINENTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.CONTINENTS$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276179772705291)
,p_item_css_classes=>'second-row'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28684037023891926)
,p_name=>'P1_NATIONALITY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(56764031589779633)
,p_prompt=>'Nationality'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'coalesce(ct.display_value, c.display_value) || '' | '' ||c.key_value as d',
'from dl_common.countries c',
'left join DL_COMMON.countries$i18n ct ON c.key_value=ct.key_value;'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276179772705291)
,p_item_css_classes=>'second-row'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28684300422891929)
,p_name=>'P1_COUNTRY_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(56764031589779633)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43042289462882734)
,p_name=>'P1_SELECTED_CASE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(88976703483448098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43042688721882738)
,p_name=>'P1_REDIRECT_CASE_URL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(88976703483448098)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56763633097779629)
,p_name=>'P1_CASE_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(56764031589779633)
,p_prompt=>'Case Number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276179772705291)
,p_item_css_classes=>'first-row'
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56763719232779630)
,p_name=>'P1_PASSPORT_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(56764031589779633)
,p_prompt=>'Passport Number'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276179772705291)
,p_item_css_classes=>'first-row'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56763827533779631)
,p_name=>'P1_FIRSTNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(56764031589779633)
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276179772705291)
,p_item_css_classes=>'first-row'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56763946108779632)
,p_name=>'P1_LASTNAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(56764031589779633)
,p_prompt=>'Lastname'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276179772705291)
,p_item_css_classes=>'first-row'
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56765532918779648)
,p_name=>'P1_RELATED_DOCUMENT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(56764031589779633)
,p_prompt=>'Related Doc No'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(15276179772705291)
,p_item_css_classes=>'second-row'
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43042020387882732)
,p_name=>'SelectCase'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.a-GV-row td'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#LatestHitsGrid, #CasesGrid'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43042159310882733)
,p_event_id=>wwv_flow_api.id(43042020387882732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).parent().find(''span[data-blacklist-case-id]'');',
'var blacklistID = $(this.triggeringElement).attr(''data-blacklist-case-id'') || rowSpan.attr(''data-blacklist-case-id'');',
'apex.item(''P1_SELECTED_CASE_ID'').setValue(blacklistID);',
'window.waitSpinnerRef = apex.widget.waitPopup();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43042816699882740)
,p_event_id=>wwv_flow_api.id(43042020387882732)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#OpenCase'').click();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43042303193882735)
,p_name=>'OpenCase'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(43041657576882728)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43042433114882736)
,p_event_id=>wwv_flow_api.id(43042303193882735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P1_SELECTED_CASE_ID'').getValue() != ''''){',
'    return true;',
'}',
'else{',
' return false;   ',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43042541005882737)
,p_event_id=>wwv_flow_api.id(43042303193882735)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':30:''||l_session||''::NO:30:P30_CASE_ID:'' || :P1_SELECTED_CASE_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P1_REDIRECT_CASE_URL := l_url;',
'END;'))
,p_attribute_02=>'P1_SELECTED_CASE_ID'
,p_attribute_03=>'P1_REDIRECT_CASE_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43042732379882739)
,p_event_id=>wwv_flow_api.id(43042303193882735)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.redirect(apex.item("P1_REDIRECT_CASE_URL").getValue() );',
'window.waitSpinnerRef.remove()'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28684160983891927)
,p_name=>'SelectCountryCode'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_NATIONALITY'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28685564988891941)
,p_event_id=>wwv_flow_api.id(28684160983891927)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P1_COUNTRY_CODE'').setValue('''');',
'var parts = $(this.browserEvent.target).val().split('' | '');',
'if(parts[1]){',
'    parts[1] = parts[1] === ''DEU'' ? ''D'' : parts[1];',
'    apex.item(''P1_COUNTRY_CODE'').setValue(parts[1]);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(67567155302613619)
,p_name=>'Show Success Message after Closing Modal Dialog'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(67567204963613620)
,p_event_id=>wwv_flow_api.id(67567155302613619)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("HUHU!");',
'apex.message.showPageSuccess( this.data.successMessage.text );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56763827533779631)
,p_name=>'ReleaseDevices'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56763946108779632)
,p_event_id=>wwv_flow_api.id(56763827533779631)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*var deviceProvidersLF10 = new DeviceProviderPlugin(null, null, null, function() {});',
'var deviceProvidersWebCam = new DeviceProviderPlugin(null, null, null, function() {});',
'var deviceProvidersRegula = new DeviceProviderPlugin(null, null, null, function() {});',
'deviceProvidersLF10.connect().then(() => deviceProvidersLF10.destroyProvider("LF10"));',
'deviceProvidersWebCam.connect().then(() => deviceProvidersWebCam.destroyProvider("Webcam")); ',
'deviceProvidersRegula.connect().then(() => deviceProvidersRegula.destroyProvider("Regular")); */',
'',
'var deviceProviders = new DeviceProviderPlugin(null, null, null, function() {}',
');',
'deviceProviders.connect().done(function(){',
'    deviceProviders.restartFactory();',
'});',
'',
' '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56764183456779634)
,p_name=>'EnterPressed'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_CASE_NO,P1_PASSPORT_NO,P1_FIRSTNAME,P1_LASTNAME,P1_RELATED_DOCUMENT,P1_NATIONALITY'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(316479587582649801)
,p_event_id=>wwv_flow_api.id(56764183456779634)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_CASE_NO,P1_PASSPORT_NO,P1_FIRSTNAME,P1_LASTNAME,P1_RELATED_DOCUMENT,P1_NATIONALITY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(this.browserEvent.which == 13){',
'    $(''#SearchButton'').click();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56765062495779643)
,p_name=>'ClearSearchForm'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(56764784916779640)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56765149235779644)
,p_event_id=>wwv_flow_api.id(56765062495779643)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_CASE_NO,P1_PASSPORT_NO,P1_FIRSTNAME,P1_LASTNAME,P1_RELATED_DOCUMENT,P1_CONTINENT,P1_COUNTRY_CODE,P1_NATIONALITY'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3131443648378701)
,p_event_id=>wwv_flow_api.id(56765062495779643)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
':P1_CASE_NO := null;',
':P1_PASSPORT_NO := null;',
':P1_FIRSTNAME := null;',
':P1_LASTNAME := null;',
':P1_RELATED_DOCUMENT := null;',
':P1_CONTINENT :=  null;',
':P1_COUNTRY_CODE := null;',
':P1_NATIONALITY := null;',
'',
'end;'))
,p_attribute_02=>'P1_CASE_NO,P1_PASSPORT_NO,P1_FIRSTNAME,P1_LASTNAME,P1_RELATED_DOCUMENT,P1_CONTINENT'
,p_attribute_03=>'P1_CASE_NO,P1_PASSPORT_NO,P1_FIRSTNAME,P1_LASTNAME,P1_RELATED_DOCUMENT,P1_CONTINENT,P1_COUNTRY_CODE,P1_NATIONALITY'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3131577106378702)
,p_event_id=>wwv_flow_api.id(56765062495779643)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(88977033045448102)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56765227542779645)
,p_name=>'Search'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(56764898621779641)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56765405258779647)
,p_event_id=>wwv_flow_api.id(56765227542779645)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P1_CASE_NO,P1_PASSPORT_NO,P1_FIRSTNAME,P1_LASTNAME,P1_RELATED_DOCUMENT,P1_CONTINENT,P1_NATIONALITY,P1_COUNTRY_CODE'
,p_attribute_03=>'P1_CASE_NO,P1_PASSPORT_NO,P1_FIRSTNAME,P1_LASTNAME,P1_RELATED_DOCUMENT,P1_CONTINENT,P1_NATIONALITY,P1_COUNTRY_CODE'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56765329792779646)
,p_event_id=>wwv_flow_api.id(56765227542779645)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(88977033045448102)
,p_stop_execution_on_error=>'Y'
);
end;
/
