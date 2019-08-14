prompt --application/pages/page_00075
begin
wwv_flow_api.create_page(
 p_id=>75
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Elastic Blacklist Search'
,p_page_mode=>'MODAL'
,p_step_title=>'Elastic Blacklist Search'
,p_step_sub_title=>'Elastic Blacklist Search'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function showImage(guid){',
'    if(guid && guid !== ''''){',
'        $(''<div class="overlay" onClick="hideImage(this)"><img class="overlay-image" src="/image/''+guid+''?width=450" /></div>'').appendTo(''.result-container>*>.t-Region-body'').first();',
'    }',
'}',
'',
'function hideImage(overlay){',
'    $(overlay).remove();',
'}',
'',
'function resetDetails(){',
'    apex.item( "P75_C_RECORD_NO" ).setValue('''');',
'    apex.item( "P75_C_LAST_NAME" ).setValue('''');',
'    apex.item( "P75_C_FIRST_NAME" ).setValue('''');',
'    apex.item( "P75_C_GENDER" ).setValue('''');',
'    apex.item( "P75_C_NATIONALITY" ).setValue('''');',
'    apex.item( "P75_C_BEHAVIOUR" ).setValue('''');',
'    apex.item( "P75_C_LEVEL_OF_CONFIDENTIALLY" ).setValue('''');',
'    apex.item( "P75_C_NEXT_STEPS" ).setValue('''');',
'    apex.item( "P75_C_PHONE" ).setValue('''');',
'    apex.item( "P75_C_LAST_NAME_THAI" ).setValue('''');',
'    apex.item( "P75_C_FIRST_NAME_THAI" ).setValue('''');',
'    apex.item( "P75_C_MIDDLE_NAME_THAI" ).setValue('''');',
'    apex.item( "P75_C_BIRTHDAY" ).setValue('''');',
'    apex.item( "P75_C_PLACE_OF_BIRTH" ).setValue('''');',
'    apex.item( "P75_C_AUTHORITY" ).setValue('''');',
'    apex.item( "P75_C_CONTACT_REQUIRED" ).setValue('''');',
'    apex.item( "P75_C_REASON" ).setValue('''');',
'    apex.item( "P75_C_ENTRY_DATE" ).setValue('''');',
'    apex.item( "P75_C_PASSPORT_NUMBER" ).setValue('''');',
'    apex.item( "P75_C_ARRIVAL_DATE" ).setValue('''')',
'    apex.item( "P75_C_REMARK" ).setValue('''');',
'    $(''.candidate-photo .FaceItem'').FaceItem(''update'', {',
'            "Position": {',
'                "ordinal": 1,',
'                "name": "Portrait"',
'            }',
'        });',
'    $(''#ViewCaseDetails, #Testbutton, #EditCaseDetails'').hide();',
'}',
'',
'function formatDate(pDate) {',
'    if (pDate) {',
'        var dateIn = new Date( pDate );',
'        var mm = dateIn.getMonth() + 1; // getMonth() is zero-based',
'        var dd = dateIn.getDate();',
'    ',
'        return [(dd>9 ? '''' : ''0'') + dd,',
'            (mm>9 ? '''' : ''0'') + mm,',
'            dateIn.getFullYear()',
'         ].join(''/'');',
'    }        ',
'}',
'',
'function setCaseDetails(pData, pSelectedIdentityId )  {',
'    resetDetails();',
'    $(''#ViewCaseDetails, #Testbutton, #EditCaseDetails'').show();',
'    var suspect = pData.case',
'    //var identity = suspect.identities[0];',
'    //get selected Identity',
'    // ROBERT, BESSER MACHEN!',
'    for(var i = 0; i < suspect.identities.length; i++) {',
'      if( suspect.identities[i].id == pSelectedIdentityId) {',
'         var identity = suspect.identities[i];',
'      }',
'    }',
'    ',
'    var biometric = pData.biometric;',
'    var traveldoc = null;',
'    apex.item( "P75_C_RECORD_NO" ).setValue(suspect.id);',
'    apex.item( "P75_C_CASE_ID" ).setValue(suspect.id);',
'    if(identity){',
'        apex.item( "P75_C_LAST_NAME" ).setValue(identity.surName);',
'        var firstname = '''';',
'        firstname += identity.givenName ? identity.givenName : '''';',
'        firstname += identity.middlename ? '' '' + identity.middlename : '''';',
'        apex.item( "P75_C_FIRST_NAME" ).setValue(firstname);',
'        apex.item( "P75_C_BIRTHDAY" ).setValue(formatDate(identity.dateOfBirth));',
'        apex.item( "P75_C_PLACE_OF_BIRTH" ).setValue(identity.placeOfBirth);',
'        traveldoc = identity.traveldocs[0];',
'        if(traveldoc){',
'            apex.item( "P75_C_GENDER" ).setValue(traveldoc.sex);',
'            apex.item( "P75_C_NATIONALITY" ).setValue(traveldoc.nationality);',
'            apex.item( "P75_C_PASSPORT_NUMBER" ).setValue(traveldoc.docNumber );',
'        }',
'    }',
'    ',
'    apex.item( "P75_C_BEHAVIOUR" ).setValue(suspect.behaviour);',
'    apex.item( "P75_C_LEVEL_OF_CONFIDENTIALLY" ).setValue(suspect.levelOfConfidentially);',
'    apex.item( "P75_C_NEXT_STEPS" ).setValue(suspect.nextStep);',
'    apex.item( "P75_C_PHONE" ).setValue(suspect.phone);',
'    apex.item( "P75_C_LAST_NAME_THAI" ).setValue(suspect.lastnameThai);',
'    apex.item( "P75_C_FIRST_NAME_THAI" ).setValue(suspect.firstnameThai);',
'    apex.item( "P75_C_MIDDLE_NAME_THAI" ).setValue(suspect.middlenameThai);',
'    ',
'    apex.item( "P75_C_AUTHORITY" ).setValue(suspect.authority);',
'    apex.item( "P75_C_CONTACT_REQUIRED" ).setValue(suspect.contactRequired);',
'    apex.item( "P75_C_REASON" ).setValue(suspect.reason);',
'    apex.item( "P75_C_REMARK" ).setValue(suspect.notice);',
'    apex.item( "P75_C_CASE_NO" ).setValue(suspect.caseNumber);',
'',
'    if(biometric.faces[0] && biometric.faces[0].image.guid){',
'        $(''.candidate-photo .FaceItem'').FaceItem(''urlToModel'', ''/image/''+biometric.faces[0].image.guid);',
'    }',
'    else{',
'        $(''.candidate-photo .FaceItem'').FaceItem(''update'', {',
'            "Position": {',
'                "ordinal": 1,',
'                "name": "Portrait"',
'            }',
'        });                                      ',
'   }',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#PreviousCase, #NextCase, #ViewCaseDetails, #Testbutton, #EditCaseDetails'').hide();',
'',
'apex.region("SearchResult").widget().on("gridpagechange", function(e, ui) {',
'    console.log($("#SearchResult").find(''tbody tr td'').first().click());',
'});',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.region-100,',
'.region-100>.t-Region-bodyWrap,',
'.region-100>.t-Region-bodyWrap>.t-Region-body,',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container,',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row,',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row>.col,',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row>.col>.t-Form-fieldContainer, ',
'.region-100.t-Region>.t-Region-bodyWrap>.t-Region-body>.container>.row>.col>.t-Form-fieldContainer>, {',
'    height:100%;',
'    padding:0;',
'}',
'.t-Dialog-body {',
'    max-height:850px;',
'}',
'.FaceItem {',
'    box-shadow: none;',
'    width: 100%;',
'    height: 320px;',
'}',
'#BogusButton {',
'    display: none;',
'}',
'/*   -------------- Colors -------------- */',
'.u-ColorBG--6 {',
'',
'}',
'.u-Color-6-BG--bg,',
'.t-Region-header,',
'.t-Region--noBorder>.t-Region-header {',
' background-color: #2074d3;',
' color: #f5f9fd;',
'}',
'.u-ColorBG--6 {',
' background-color: #2074d3;',
' color: #f5f9fd;',
'}',
'.u-Color-6-FG--txt {',
'color: #f5f9fd;',
'}',
'',
'.u-Color-6-FG--fill {',
'fill: #f5f9fd;',
'}',
'.u-Color-6-BG--fill {',
'fill: #2074d3;',
'}',
'.u-Color-2-FG--bg {',
'background-color: #f5f9fd;',
'}',
'/*   -------------- Colors -------------- */',
'',
'.t-Form-inputContainer, .t-Form-labelContainer {',
'    padding:0;',
'}',
'.FaceItemLayout .fc-item-content.hasImage {',
'    background-color: #fff;',
'}',
'#SearchResult>.t-Region-bodyWrap>.t-Region-body {',
'    min-height: 340px;',
'    max-height: 340px;',
'}',
'.apex-icons-fontawesome .fa:before {',
'    font-family: FontAwesome;',
'    vertical-align: middle;',
'}',
'.overlay {',
'    position: absolute;',
'    width: 100%;',
'    height: 100%;',
'    left: 0;',
'    top: 0;',
'    display: flex;',
'    z-index: 5000;',
'    background-color: rgba(200,200,200, 0.5);',
'    background-size: 9%; ',
'    background-image: url(''data:image/gif;base64,R0lGODlhEAALAPQAAP///wAAANra2tDQ0Orq6gYGBgAAAC4uLoKCgmBgYLq6uiIiIkpKSoqKimRkZL6+viYmJgQEBE5OTubm5tjY2PT09Dg4ONzc3PLy8ra2tqCgoMrKyu7u7gAAAAAAAAAAACH+GkNyZWF0ZWQgd2l0aCBhamF4bG9hZC5pbmZvACH5BAALAAAAIf8LT'
||'kVUU0NBUEUyLjADAQAAACwAAAAAEAALAAAFLSAgjmRpnqSgCuLKAq5AEIM4zDVw03ve27ifDgfkEYe04kDIDC5zrtYKRa2WQgAh+QQACwABACwAAAAAEAALAAAFJGBhGAVgnqhpHIeRvsDawqns0qeN5+y967tYLyicBYE7EYkYAgAh+QQACwACACwAAAAAEAALAAAFNiAgjothLOOIJAkiGgxjpGKiKMkbz7SN6zIawJcDwIK9W/HISxG'
||'BzdHTuBNOmcJVCyoUlk7CEAAh+QQACwADACwAAAAAEAALAAAFNSAgjqQIRRFUAo3jNGIkSdHqPI8Tz3V55zuaDacDyIQ+YrBH+hWPzJFzOQQaeavWi7oqnVIhACH5BAALAAQALAAAAAAQAAsAAAUyICCOZGme1rJY5kRRk7hI0mJSVUXJtF3iOl7tltsBZsNfUegjAY3I5sgFY55KqdX1GgIAIfkEAAsABQAsAAAAABAACwAABTcgII5ka'
||'Z4kcV2EqLJipmnZhWGXaOOitm2aXQ4g7P2Ct2ER4AMul00kj5g0Al8tADY2y6C+4FIIACH5BAALAAYALAAAAAAQAAsAAAUvICCOZGme5ERRk6iy7qpyHCVStA3gNa/7txxwlwv2isSacYUc+l4tADQGQ1mvpBAAIfkEAAsABwAsAAAAABAACwAABS8gII5kaZ7kRFGTqLLuqnIcJVK0DeA1r/u3HHCXC/aKxJpxhRz6Xi0ANAZDWa+kEAA'
||'7AAAAAAAAAAAA'');',
'    background-position: center center;',
'    background-repeat: no-repeat;',
'}',
'.overlay img {',
'    height: 100%;',
'    margin: auto;',
'    display: flex;',
'}',
'',
'#ViewCaseDetails {',
'    background-color: #0572CE !important;',
'    color: #fff !important;',
'}',
'.region-100.too-small-for-overlay .row{',
'    margin:0;',
'}',
'.face-selector, .face-selector-mm-dropdown {',
'    display:none;',
'}',
'.reason-select select{',
'    background-color: white;',
'    border: none !important;',
'    margin: 0 5px',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1600'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20190618165556'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(391345977469918724)
,p_plug_name=>'BlacklistContainer'
,p_region_css_classes=>'result-container'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
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
 p_id=>wwv_flow_api.id(363797442009578526)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(391345977469918724)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(363797310764578525)
,p_plug_name=>'Request'
,p_parent_plug_id=>wwv_flow_api.id(363797442009578526)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(368800007821658624)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(363797310764578525)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(391346128699918725)
,p_plug_name=>'FacePhoto'
,p_parent_plug_id=>wwv_flow_api.id(363797310764578525)
,p_region_css_classes=>'region-100 too-small-for-overlay request-photo'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(363797535256578527)
,p_plug_name=>'Candidate'
,p_parent_plug_id=>wwv_flow_api.id(363797442009578526)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none:margin-left-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
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
 p_id=>wwv_flow_api.id(368800121197658625)
,p_plug_name=>'Candidate-Face'
,p_parent_plug_id=>wwv_flow_api.id(363797535256578527)
,p_region_css_classes=>'region-100 too-small-for-overlay candidate-photo'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(368800217365658626)
,p_plug_name=>'Candidate-Data'
,p_parent_plug_id=>wwv_flow_api.id(363797535256578527)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(391346219318918726)
,p_plug_name=>'Result'
,p_region_name=>'SearchResult'
,p_parent_plug_id=>wwv_flow_api.id(391345977469918724)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15253206288705246)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT	jt.id,',
'        jt.imageGuid,',
'        bc.id as case_id,',
'        bc.case_type,',
'        jt.firstname,',
'        jt.sortingScore,',
'       -- jt.demographicScore,',
'        jt.lastname,  ',
'        jt.biometricScore,',
'        jt.demographicMatch,',
'        jt.biometricMatch,',
'        jt.nationality,',
'        jt.sex,',
'		--------------------------------------------------------------------------------------',
'		(	SELECT	COALESCE( ''/image/''||image_id||''?width=450'',''#WORKSPACE_IMAGES#template_photo.png'' ) as image ',
'			FROM	faces f',
'			INNER JOIN biometrics b ON f.biometric_id = b.id',
'			INNER JOIN blacklist_cases c ON b.blacklist_case_id = c.id',
'			INNER JOIN blacklist_case_identities ci ON c.id = ci.blacklist_case where ci.identity = jt.ID ',
'			ORDER BY f.dml_at DESC ',
'			FETCH FIRST 1 ROWS ONLY',
'		) as image,',
'		--------------------------------------------------------------------------------------			',
'		CASE WHEN demographicMatch = ''true'' AND biometricMatch = ''true'' THEN ',
'			''biometric and demographic'' ',
'		WHEN biometricMatch = ''true''  THEN',
'			''biometric''',
'        ELSE',
'			''demographic''',
'		END AS type,',
'		--------------------------------------------------------------------------------------			',
'		TO_DATE( SUBSTR( dateOfBirth, 1, 10 ), ''YYYY-MM-DD'') as date_of_birth',
'FROM	apex_collections,',
'		JSON_TABLE( apex_collections.clob001, ''$.hits.hits[*]''',
'				COLUMNS(  "ID"             VARCHAR2(512 CHAR) PATH ''$._source.id'',',
'						  imageGuid        VARCHAR2(512 CHAR) PATH ''$._source.faceId'',',
'						  firstname        VARCHAR2(512 CHAR) PATH ''$._source.given_name'',',
'						  sortingScore     NUMBER             PATH ''$._score'',',
'						 -- demographicScore NUMBER             PATH ''$._score'',',
'						  lastname         VARCHAR2(512 CHAR) PATH ''$._source.surname'',  ',
'						  biometricScore   VARCHAR2(512 CHAR) PATH ''$._source.biometricScore'',',
'						  demographicMatch VARCHAR2(512 CHAR) PATH ''$._source.demographicMatch'',',
'						  biometricMatch   VARCHAR2(512 CHAR) PATH ''$._source.biometricMatch'',',
'						  nationality      VARCHAR2(512 CHAR) PATH ''$._source.nationality'',',
'						  sex              VARCHAR2(512 CHAR) PATH ''$._source.sex'',',
'						  dateOfBirth      VARCHAR2(512 CHAR) PATH ''$._source.date_of_birth''',
'                  )) jt',
'JOIN blacklist_case_identities ci ON ci.identity = jt.ID ',
'JOIN blacklist_cases bc ON bc.id = ci.blacklist_case AND bc.is_active = ''Y''',
'WHERE collection_name = ''COLL_WS_RESULT'' AND jt.sortingScore > 30',
'',
' '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(371570216321918849)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<span class="fa fa-search" data-blacklist-identity-id="&ID." data-blacklist-case-id="&CASE_ID."></span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(371570253260918850)
,p_name=>'IMAGEGUID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGEGUID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Imageguid'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2048
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
 p_id=>wwv_flow_api.id(371570391315918851)
,p_name=>'FIRSTNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIRSTNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Firstname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2048
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
 p_id=>wwv_flow_api.id(373752670391579303)
,p_name=>'LASTNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LASTNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Lastname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2048
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
 p_id=>wwv_flow_api.id(373752885770579305)
,p_name=>'NATIONALITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NATIONALITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nationality'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2048
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
 p_id=>wwv_flow_api.id(373753009852579306)
,p_name=>'SEX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEX'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sex'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2048
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
 p_id=>wwv_flow_api.id(373753241832579308)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Image'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<img src="&IMAGE." style="max-width: 50px"  data-blacklist-case-id="&ID." />'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(373753299647579309)
,p_name=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
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
 p_id=>wwv_flow_api.id(373753690505579313)
,p_name=>'BIOMETRICSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BIOMETRICSCORE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Biometricscore'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2048
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
 p_id=>wwv_flow_api.id(373753814604579314)
,p_name=>'DEMOGRAPHICMATCH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEMOGRAPHICMATCH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Demographicmatch'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2048
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
 p_id=>wwv_flow_api.id(373753893541579315)
,p_name=>'BIOMETRICMATCH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BIOMETRICMATCH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Biometricmatch'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2048
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
 p_id=>wwv_flow_api.id(373754028322579316)
,p_name=>'DATE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_BIRTH'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Date of birth'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(373755794031579334)
,p_name=>'SORTINGSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SORTINGSCORE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sortingscore'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(588475087861505505)
,p_name=>'CASE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CASE_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Case id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(588475153730505506)
,p_name=>'CASE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CASE_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Case type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(371570075580918848)
,p_internal_uid=>371570075580918848
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>330
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(373758646152580291)
,p_interactive_grid_id=>wwv_flow_api.id(371570075580918848)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(373758683327580293)
,p_report_id=>wwv_flow_api.id(373758646152580291)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(339813710042086927)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(373755794031579334)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(373759227043580304)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(371570216321918849)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(373759687090580325)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(371570253260918850)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(373760224548580334)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(371570391315918851)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(373761059304580354)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(373752670391579303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(373762058706580370)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(373752885770579305)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(373762567056580378)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(373753009852579306)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(373763587727580393)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(373753241832579308)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(373764055466580400)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(373753299647579309)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(374132018811242890)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(373753690505579313)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(374170231261443128)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(373753814604579314)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(374170692449443145)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(373753893541579315)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(374206893863530244)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(373754028322579316)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(588946751848923381)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(588475087861505505)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(588947236550923400)
,p_view_id=>wwv_flow_api.id(373758683327580293)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(588475153730505506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338466843319709938)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(363797535256578527)
,p_button_name=>'ViewCaseDetails'
,p_button_static_id=>'ViewCaseDetails'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_image_alt=>'Case Details'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa- fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338462416874709903)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(363797310764578525)
,p_button_name=>'BogusButton'
,p_button_static_id=>'BogusButton'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Bogusbutton'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338467249123709938)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(363797535256578527)
,p_button_name=>'NextCase'
,p_button_static_id=>'NextCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next Case'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(338467600438709939)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(363797535256578527)
,p_button_name=>'PreviousCase'
,p_button_static_id=>'PreviousCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(15276693260705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Previous Case'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338463100114709911)
,p_name=>'P75_R_SURNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(368800007821658624)
,p_prompt=>'Surname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338463542635709926)
,p_name=>'P75_R_FIRSTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(368800007821658624)
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338463890840709927)
,p_name=>'P75_R_SEX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(368800007821658624)
,p_prompt=>'Gender'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338464291814709927)
,p_name=>'P75_R_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(368800007821658624)
,p_prompt=>'Nationality'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338464692431709934)
,p_name=>'P75_R_PASSPORT_NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(368800007821658624)
,p_prompt=>'Passport No'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338465020573709935)
,p_name=>'P75_R_DATE_OF_BIRTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(368800007821658624)
,p_prompt=>'Birthday'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338465436897709935)
,p_name=>'P75_R_PLACE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(368800007821658624)
,p_prompt=>'Place of Birth'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338466169732709937)
,p_name=>'P75_PHOTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(391346128699918725)
,p_prompt=>'Photo'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_attribute_10=>'/image'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338468302363709940)
,p_name=>'P75_PHOTO_CANDIDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(368800121197658625)
,p_prompt=>'Photo candidate'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_attribute_10=>'/image'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338469037699709942)
,p_name=>'P75_C_RECORD_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338469406920709942)
,p_name=>'P75_C_LAST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Surname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338469875915709945)
,p_name=>'P75_C_FIRST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338470255799709945)
,p_name=>'P75_C_GENDER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Gender'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338470669909709946)
,p_name=>'P75_C_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Nationality'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338471079311709946)
,p_name=>'P75_C_PASSPORT_NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Passport Number'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338471459649709947)
,p_name=>'P75_C_BIRTHDAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Birthday'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338471844497709947)
,p_name=>'P75_C_PLACE_OF_BIRTH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Place of Birth'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338472212820709948)
,p_name=>'P75_C_REASON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Reason'
,p_source=>'P75_C_REASON'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_REASON_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) ,',
'       KEY_VALUE',
'  from dl_common.reason_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'disabled'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_css_classes=>'reason-select'
,p_item_template_options=>'#DEFAULT#:margin-top-lg'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338472659148709950)
,p_name=>'P75_C_REMARK'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Remark'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338473069236709951)
,p_name=>'P75_C_BEHAVIOUR'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Behaviour'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338473482933709951)
,p_name=>'P75_C_LEVEL_OF_CONFIDENTIALITY'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338473820215709954)
,p_name=>'P75_C_NEXT_STEPS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_prompt=>'Next Steps'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338474207273709955)
,p_name=>'P75_REDIRECT_URL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_source=>'apex_util.prepare_url(''f?p=&APP_ID.:35:&SESSION.::NO:RP:P35_CASE_ID:CASE_PLACEHOLDER'', p_checksum_type => ''SESSION'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(338474682306709957)
,p_name=>'P75_C_CASE_ID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(368800217365658626)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(338482418217710106)
,p_computation_sequence=>10
,p_computation_item=>'P75_C_CASE_ID'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'.P35_CASE_ID := :P75_C_CASE_ID'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338485658980710141)
,p_name=>'SetFacePhoto'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338486152189710142)
,p_event_id=>wwv_flow_api.id(338485658980710141)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.$(''.FaceItem'').each(function(i, el){ ',
'    var model = top.$(this).FaceItem(''broadcast'');',
'',
'    if($(''.request-photo .FaceItem'').length && (model.has(''ImageGuid'') || model.has(''ImageUrl''))){',
'        $(''.request-photo .FaceItem'').FaceItem(''urlToModel'', model.getImageURL());',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338486526925710143)
,p_name=>'SearchCamunda'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338487029490710143)
,p_event_id=>wwv_flow_api.id(338486526925710143)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(!top.regionToJson){',
'    $(''#SearchResult'').show();',
'    apex.region("SearchResult").refresh();    ',
'    return false;',
'}',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338487541980710145)
,p_event_id=>wwv_flow_api.id(338486526925710143)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var Demographic = top.regionToJson(''.demographic-data'');',
'var tempFinger = [];',
'var tempFaces = [];',
'function getGuidFromUrl( url ){',
'    var matches = url.match(/\/([^\/\?]{32})($|\?)/);',
'    if (matches) return matches[1];',
'    return null;',
'}',
'$(''#SearchResult'').hide();',
'',
'top.$(''.FingerItem'').each(function(i, el){ ',
'    var model = top.$(this).FingerItem(''broadcast'');',
'    if(!model.has(''MissingReason'') && model.has(''ImageUrl'')){',
'         tempFinger.push({',
'            "image": {',
'              "guid": getGuidFromUrl(model.getImageURL()),',
'            },',
'            "nistImpressionType": model.get(''ImpressionType'').ordinal,',
'            "nistPosition": model.get(''Position'').ordinal',
'         });',
'    }',
'});',
'',
'top.$(''.FaceItem'').each(function(i, el){ ',
'    var model = top.$(this).FaceItem(''broadcast'');',
'    if(model.has(''ImageGuid'') || model.has(''ImageUrl'')){',
'        tempFaces.push({',
'            "image": {',
'              "guid": model.get(''ImageGuid'')',
'            }',
'        });',
'    }',
'});',
'',
'var BlacklistRequest = {',
'  demographic: Demographic,',
'  biometric: {',
'    fingerprints: tempFinger,',
'    faces: tempFaces',
'  }',
'};',
'',
'var lspinner$ = apex.util.showSpinner();',
'',
'var request = { x01: JSON.stringify(BlacklistRequest)};',
'',
'apex.server.process( "get_ws_result", ',
'                     request,',
'                     { dataType : "text",',
'                       success  : function( pData ) {',
'                                      console.log( pData );',
'                                      var result = $.parseJSON(pData );',
'                                      var result_sqlcode = result["sqlcode"]; ',
'                                      var result_sqlerrm = result["sqlerrm"];  ',
'                                      lspinner$.remove();',
'                                      $(''#SearchResult'').show();',
'                                      if ( result_sqlcode != "0" ) {',
'                                          apex.message.showErrors({',
'                                                type: ''error'',',
'                                                location: ''page'',',
'                                                message: result_sqlerrm',
'                                            } );',
'                                      }',
'                                      else {',
'                                          apex.region("SearchResult").refresh();    ',
'                                      }',
'                                  }',
'                     }',
'                   );',
'',
'',
'',
'console.log(''Demo '' , JSON.stringify( BlacklistRequest));',
'return true;',
'',
'',
'',
'var endpoint = ''/bpm/blacklist/search'';',
'var lspinner$ = apex.util.showSpinner();',
'var promise = $.ajax({',
'  type: ''POST'',',
'  contentType: "application/json; charset=utf-8",',
'  url: endpoint,',
'  data: JSON.stringify(BlacklistRequest)',
'});',
'',
'promise.done(function (data) {',
'  console.log(''success'', data);',
'  setApexCollectionClob(JSON.stringify(data), function(){',
'      lspinner$.remove();',
'      apex.region("SearchResult").refresh(); ',
'  });',
'});',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'promise.fail(function (data) {',
'  console.log(''error'', data.responseText);',
'  lspinner$.remove();',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338487967029710146)
,p_name=>'ShowCandidateDetails'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-blacklist-identity-id] , .a-GV-row'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#SearchResult'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338488452718710147)
,p_event_id=>wwv_flow_api.id(338487967029710146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).find(''span[data-blacklist-case-id]'');',
'var blacklistID = $(this.triggeringElement).attr(''data-blacklist-case-id'') || rowSpan.attr(''data-blacklist-case-id'');',
'var identityID = $(this.triggeringElement).attr(''data-blacklist-identity-id'') || rowSpan.attr(''data-blacklist-identity-id'');',
'console.log(blacklistID);',
'resetDetails();',
'if(!blacklistID) return;',
'var endpoint = ''/ords/dl_bordercontrol/blacklist/case/''+blacklistID;',
'var lspinner$ = apex.util.showSpinner();',
'var promise = $.ajax({',
'  type: ''GET'',',
'  url: endpoint',
'});',
'resetDetails();',
'promise.done(function (data) {',
'    console.log(''success'', data);',
'    lspinner$.remove();',
'    window.currentCasesById = data;',
'    if(data){',
'        //ROBERT, BESSER MACHEN!',
'        setCaseDetails(data, identityID );',
'        apex.item(''P75_C_CASE_ID'').setValue(data.case.id);',
'    } ',
'    else{',
'        apex.item( "P75_C_CASE_ID" ).setValue('''');',
'    }',
'    if (data.length>1){',
'            $(''#PreviousCase, #NextCase'').hide();',
'     }',
'     else{',
'            $(''#PreviousCase, #NextCase'').hide();',
'    }',
'    return;',
'});',
'',
'promise.fail(function (data) {',
'  console.log(''error'', data.responseText);',
'  lspinner$.remove();',
'  ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338488802952710148)
,p_name=>'SetFieldsFromScanPage'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338489331176710149)
,p_event_id=>wwv_flow_api.id(338488802952710148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (top.getDataForSearchResultDisplay) {',
'    var displayItems = top.getDataForSearchResultDisplay();',
'    ',
'     if($(''.request-photo .FaceItem'').length && displayItems.imageDataUrl){',
'        $(''.request-photo .FaceItem'').FaceItem(''base64ToModel'', displayItems.imageDataUrl);',
'    }',
'    ',
'} else {',
'   ',
'    // Clone DatePicker Dateformat to modal datepicker',
'    ',
'    var $topDatepicker = top.$( ".datepicker").first();',
'    $( ".datepicker" ).datepicker( "option", "dateFormat", $topDatepicker.datepicker( "option", "dateFormat") );',
'    ',
'    // Clone Button Classes to modal ButtonClasses',
'    ',
'    var classes = $topDatepicker.siblings(''button'').attr(''class'');',
'    $( ".datepicker" ).siblings(''button'').addClass(classes);',
'',
'    // read top fields',
'    ',
'    var fields = top.regionToJson(''.demographic-data'', true);',
'    ',
'    top._.mapObject(fields, (val, key)=>{',
'        if(key=='''') return;',
'        let $item = $(''[name*="_R_''+key+''"]'');',
'        ',
'        if($item.is(''.datepicker'')){',
'            $item.datepicker( "setDate", (new Date(val)) );',
'        }',
'        else{   ',
'            //ROBERT, BESSER MACHEN!! GRUSS, JENS            ',
'            if ($item.attr(''name'') == "P75_R_DATE_OF_BIRTH") {',
'                apex.item($item.attr(''name'')).setValue(formatDate(val));    ',
'            } else {',
'                apex.item($item.attr(''name'')).setValue(val);            ',
'            }',
'        }',
'    });',
'    top.$(''.FaceItem'').each(function(i, el){ ',
'    var model = top.$(this).FaceItem(''broadcast'');',
'    if($(''.request-photo .FaceItem'').length && (model.has(''ImageGuid'') || model.has(''ImageUrl''))){',
'        $(''.request-photo .FaceItem'').FaceItem(''urlToModel'', model.getImageURL());',
'    }',
'});',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338489755061710149)
,p_name=>'TestCase'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338490236543710150)
,p_event_id=>wwv_flow_api.id(338489755061710149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var testCase = {',
'"case": {',
'"id": "6CCC98F68E054820E053BE26780AED3B",',
'"reason": "Testreason",',
'"authority": "Testauthority",',
'"behaviour": "Testbehaviour",',
'"caseNumber": null,',
'"traveldoc": {',
'"passportNumber": "C0308854",',
'"passportExpiryDate": "2020-07-15T00:00:00",',
'"passportIssuingCountry": "BRN",',
'"nationality": "BRN",',
'"sex": "FEMALE"',
'},',
'"identity": {',
'"id": "6CCC98F68E044820E053BE26780AED3B",',
'"firstname": null,',
'"surname": "ROHAINI BINTI OWEK",',
'"firstnameThai": null,',
'"surnameThai": null,',
'"givennameThai": null,',
'"dateOfBirth": "1977-04-13T00:00:00",',
'"placeOfBirth": "Hamburg",',
'"faceShape": null,',
'"size": null,',
'"weight": null,',
'"figure": null,',
'"hairColor": null,',
'"hairType": null',
'}',
'},',
'"details": {',
'"arrivalDate": null,',
'"entryDate": null,',
'"contactRequired": null',
'},',
'"biometric": {',
'"abisId": 753,',
'"faces": [',
'{',
'"image": {',
'"guid": "9B51A136CDF94F39A231DD58C885A84E"',
'},',
'"nistPosition": 1',
'},',
'{',
'"image": {',
'"guid": "F7A8E68A9FFC48929DB6BF7A4F851801"',
'},',
'"nistPosition": 1',
'}',
'],',
'"fingerprints": [',
'{',
'"image": {',
'"guid": "300B67DFC38B42EB8A54712035505E97"',
'},',
'"nistPosition": 1,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "87CE6EF3467C4F518D0C2A62698461BB"',
'},',
'"nistPosition": 2,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "0009C9E00EE843ED8A004B25A7EB235A"',
'},',
'"nistPosition": 3,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "8CAC280035C54C0FB300FCF853366FFF"',
'},',
'"nistPosition": 4,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "0C472A46723D4ACBA3E2829E0C3700D2"',
'},',
'"nistPosition": 5,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "9AECC43377944A5491F520A9AFEDE9FF"',
'},',
'"nistPosition": 6,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "961FED2BA38D46CCB9572D689B33BBBE"',
'},',
'"nistPosition": 7,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "546C291E9B95426F85ED94C061553E47"',
'},',
'"nistPosition": 8,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "BC5E441CC9A74AFC888D721E9B543AF9"',
'},',
'"nistPosition": 9,',
'"nistImpressionType": 0',
'},',
'{',
'"image": {',
'"guid": "DACD20B3A157400D8232F1776CF73EC1"',
'},',
'"nistPosition": 10,',
'"nistImpressionType": 0',
'}',
']',
'}',
'};',
'setCaseDetails(testCase);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338490656130710150)
,p_name=>'PrepareRedirectUrl'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(338466843319709938)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338491115187710154)
,p_event_id=>wwv_flow_api.id(338490656130710150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := v(''APP_ID'');',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':32:''||l_session||''::NO::P32_CASE_ID:'' || :P75_C_CASE_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P75_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P75_C_CASE_ID'
,p_attribute_03=>'P75_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338491609276710155)
,p_event_id=>wwv_flow_api.id(338490656130710150)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.redirect(apex.item("P75_REDIRECT_URL").getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338492022782710156)
,p_name=>'SelectFirstResultset'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(391346219318918726)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338492552095710158)
,p_event_id=>wwv_flow_api.id(338492022782710156)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(this.affectedElements).find(''tbody tr'').first().click();',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(338484281888710127)
,p_name=>'GetReasonCode'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P75_C_REASON'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338485253454710141)
,p_event_id=>wwv_flow_api.id(338484281888710127)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if(apex.item(''P75_C_REASON'').getValue()==''''){',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(338484741886710134)
,p_event_id=>wwv_flow_api.id(338484281888710127)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(display_value,DISPLAY_VALUE$DLC) ',
'  into :P75_C_REASON     ',
'  from dl_common.reason_codes$LC',
'  where is_active = ''Y'' AND KEY_VALUE = :P75_C_REASON ;',
'  ',
'  EXCEPTION WHEN no_data_found THEN',
'  null;'))
,p_attribute_02=>'P75_C_REASON'
,p_attribute_03=>'P75_C_REASON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(338482641277710114)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitCollection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'if apex_collection.collection_exists(p_collection_name=>''COLL_WS_RESULT'') then',
'apex_collection.delete_collection(p_collection_name=>''COLL_WS_RESULT'');',
'end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(338483016990710122)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get_ws_result'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_params           VARCHAR2(32767) := apex_application.g_x01;',
'    l_collection_name  VARCHAR2(200)   := ''COLL_WS_RESULT'';',
'    l_clob             CLOB;',
'    l_demographic_json JSON_OBJECT_T;',
'    l_search_json      JSON_OBJECT_T;',
'    l_json             JSON_OBJECT_T;',
'    l_hits             JSON_OBJECT_T;',
'    l_candidates_json  JSON_ARRAY_T;',
'    l_cookie_a         OWA_COOKIE.COOKIE;',
'    err_no_data        exception;',
'    PRAGMA EXCEPTION_INIT(err_no_data,-20001);',
'BEGIN',
'    apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'    apex_collection.create_or_truncate_collection( l_collection_name );',
'    ',
'    l_search_json := JSON_OBJECT_T(''{"id": "blacklist_search_v3"}'');',
'    l_demographic_json := JSON_OBJECT_T.parse(l_params);',
'    l_demographic_json := l_demographic_json.get_object(''demographic'');',
'    l_search_json.put(''params'', l_demographic_json);',
'    ',
'    ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';   ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';  ',
'    l_cookie_a := owa_cookie.get(''OA_B'');',
'     apex_debug.message(''cookie: '' || :l_cookie_a);',
'    ',
'    apex_debug.message(''CAMUNDA_URL: '' || :CAMUNDA_URL);',
'    ',
'    l_clob           := apex_web_service.make_rest_request(',
'                                                         p_url         => ''http://tha20675-app01-dev.dev.dc.dermalog.hh/blacklist/demographic/search'',',
'                                                         p_http_method => ''POST'',',
'		                                                 p_body        => l_search_json.to_string',
'		                                            );',
'    l_json := JSON_OBJECT_T.parse(l_clob);',
'    apex_debug.message(''Response: '' || l_json.to_string);',
'    l_hits := l_json.get_object(''hits'');',
'    l_candidates_json := l_hits.get_array(''hits'');',
'    if l_candidates_json is null then',
'      raise err_no_data;',
'    end if;',
'    apex_collection.add_member(p_collection_name => l_collection_name,',
'                               p_clob001         =>l_clob',
'                             );',
'',
'    apex_json.open_object;',
'    apex_json.write( ''sqlcode'', 0 );',
'    apex_json.write( ''sqlerrm'', ''Request OK'');',
'    apex_json.close_object;',
'    htp.p( apex_json.get_clob_output );',
'    ',
'EXCEPTION ',
'   when err_no_data then',
'   apex_json.open_object;',
'       apex_json.write( ''sqlcode'', SQLCODE );',
'       apex_json.write( ''sqlerrm'', ''Search request failed'' );',
'       apex_json.close_object;',
'       htp.p( apex_json.get_clob_output );',
'',
'   WHEN OTHERS THEN',
'       apex_json.open_object;',
'       apex_json.write( ''sqlcode'', SQLCODE );',
'       apex_json.write( ''sqlerrm'', SQLERRM );',
'       apex_json.close_object;',
'       htp.p( apex_json.get_clob_output );',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
