prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Blacklist Search '
,p_page_mode=>'MODAL'
,p_step_title=>'Blacklist Search '
,p_step_sub_title=>'Blacklist Search 2'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function setApexCollectionClob (pBigValue, callback) {',
'  var apexAjaxObj = new apex.ajax.clob(',
'    function(p) {',
'        var rs = p.readyState;',
'        if (rs == 4) {',
'            callback();',
'        } else {',
'            return false;',
'        };',
'    }',
'  );',
'  apexAjaxObj._set(pBigValue);',
'}',
'function setBiometricClobJSON(a){',
'	function b(a){',
'		e.ajax.addParam("x05","GET"),',
'		e.ajax.GetAsync(e._return)',
'	};',
'    function c(a){',
'		e.ajax.addParam("x05","SET"),',
'		e.ajax.AddArrayClob(a,1),',
'		e.ajax.GetAsync(e._return)',
'	};',
'    function d (){',
'		//if(1==p.readyState);elseif(2==p.readyState);elseif(3!=p.readyState)return4==p.readyState&&p',
'	};',
'    var e=this;',
'    this.ajax=new htmldb_Get(null,$x("pFlowId").value,"APXWGT",0),',
'	this.ajax.addParam("p_widget_name","apex_utility"),',
'	this.ajax.addParam("x04","CLOB2_CONTENT"),',
'	this._get= b,',
'	this._set= c,',
'	this._return=a?a: d',
'}',
'',
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
'    apex.item( "P20_C_RECORD_NO" ).setValue('''');',
'    apex.item( "P20_C_LAST_NAME" ).setValue('''');',
'    apex.item( "P20_C_FIRST_NAME" ).setValue('''');',
'    apex.item( "P20_C_GENDER" ).setValue('''');',
'    apex.item( "P20_C_NATIONALITY" ).setValue('''');',
'    apex.item( "P20_C_BEHAVIOUR" ).setValue('''');',
'    apex.item( "P20_C_LEVEL_OF_CONFIDENTIALLY" ).setValue('''');',
'    apex.item( "P20_C_NEXT_STEPS" ).setValue('''');',
'    apex.item( "P20_C_PHONE" ).setValue('''');',
'    apex.item( "P20_C_LAST_NAME_THAI" ).setValue('''');',
'    apex.item( "P20_C_FIRST_NAME_THAI" ).setValue('''');',
'    apex.item( "P20_C_MIDDLE_NAME_THAI" ).setValue('''');',
'    apex.item( "P20_C_BIRTHDAY" ).setValue('''');',
'    apex.item( "P20_C_PLACE_OF_BIRTH" ).setValue('''');',
'    apex.item( "P20_C_AUTHORITY" ).setValue('''');',
'    apex.item( "P20_C_CONTACT_REQUIRED" ).setValue('''');',
'    apex.item( "P20_C_REASON" ).setValue('''');',
'    apex.item( "P20_C_ENTRY_DATE" ).setValue('''');',
'    apex.item( "P20_C_PASSPORT_NUMBER" ).setValue('''');',
'    apex.item( "P20_C_ARRIVAL_DATE" ).setValue('''')',
'    apex.item( "P20_C_REMARK" ).setValue('''');',
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
'    apex.item( "P20_C_RECORD_NO" ).setValue(suspect.id);',
'    apex.item( "P20_C_CASE_ID" ).setValue(suspect.id);',
'    if(identity){',
'        apex.item( "P20_C_LAST_NAME" ).setValue(identity.surName);',
'        var firstname = '''';',
'        firstname += identity.givenName ? identity.givenName : '''';',
'        firstname += identity.middlename ? '' '' + identity.middlename : '''';',
'        apex.item( "P20_C_FIRST_NAME" ).setValue(firstname);',
'        apex.item( "P20_C_BIRTHDAY" ).setValue(identity.dateOfBirth);',
'        apex.item( "P20_C_PLACE_OF_BIRTH" ).setValue(identity.placeOfBirth);',
'        traveldoc = identity.traveldocs[0];',
'        if(traveldoc){',
'             let gender = '''';',
'            if(traveldoc.sex){',
'               gender = traveldoc.sex;',
'               gender = (gender.toLowerCase() == "m") ? "MALE" : (gender.toLowerCase() == "f") ? "FEMALE" : gender;',
'            }',
'            apex.item( "P20_C_GENDER" ).setValue(gender);',
'            apex.item( "P20_C_NATIONALITY" ).setValue(traveldoc.nationality);',
'            apex.item( "P20_C_PASSPORT_NUMBER" ).setValue(traveldoc.docNumber );',
'        }',
'        if(identity.sex){',
'            let gender2 = identity.sex;',
'            gender2 = (gender2.toLowerCase() == "m") ? "MALE" : (gender2.toLowerCase() == "f") ? "FEMALE" : gender2;',
'            apex.item( "P20_C_GENDER" ).setValue(gender2);',
'        }',
'    }',
'    ',
'    apex.item( "P20_C_BEHAVIOUR" ).setValue(suspect.behavior);',
'    apex.item( "P20_C_LEVEL_OF_CONFIDENTIALLY" ).setValue(suspect.levelOfConfidentially);',
'    apex.item( "P20_C_NEXT_STEPS" ).setValue(suspect.nextStep);',
'    apex.item( "P20_C_PHONE" ).setValue(suspect.phone);',
'    apex.item( "P20_C_LAST_NAME_THAI" ).setValue(suspect.lastnameThai);',
'    apex.item( "P20_C_FIRST_NAME_THAI" ).setValue(suspect.firstnameThai);',
'    apex.item( "P20_C_MIDDLE_NAME_THAI" ).setValue(suspect.middlenameThai);',
'    ',
'    apex.item( "P20_C_AUTHORITY" ).setValue(suspect.authority);',
'    apex.item( "P20_C_CONTACT_REQUIRED" ).setValue(suspect.contactRequired);',
'    apex.item( "P20_C_REASON_TMP" ).setValue(suspect.reason);',
'    apex.item( "P20_C_REMARK" ).setValue(suspect.notice);',
'    apex.item( "P20_C_CASE_NO" ).setValue(suspect.caseNumber);',
'    ',
'        //new',
'    apex.item( "P20_C_MIDDLE_NAME" ).setValue(identity.middleName);',
'    apex.item( "P20_C_LAST_NAME_THAI" ).setValue(identity.surNameThai);',
'    apex.item( "P20_C_FIRST_NAME_THAI" ).setValue(identity.givenNameThai);',
'    apex.item( "P20_C_MIDDLE_NAME_THAI" ).setValue(identity.middleNameThai);',
'    apex.item( "P20_C_CONTACT_OWNER_DATA" ).setValue(suspect.contactOwnerData);',
'    apex.item( "P20_C_WARRANT_NUMBER" ).setValue(suspect.arrestedWarrantNumber);',
'    apex.item( "P20_C_URGENT_CONTACT" ).setValue(suspect.urgentContact);',
'    apex.item( "P20_C_ACTION_CODE" ).setValue(suspect.actionCode);',
'    apex.item( "P20_C_CONTACT_TELEPHONE_NO" ).setValue(suspect.contactTelephoneNumber);',
'    apex.item( "P20_C_TRAVEL_PERMIT_FROM" ).setValue(suspect.travelPermitFrom);',
'    apex.item( "P20_C_OSTAY_TM6" ).setValue(suspect.ostayTM6);',
'    apex.item( "P20_C_OSTAY_TM6" ).setValue(suspect.ostayTM6);',
'    apex.item( "P20_C_REASON_TMP" ).setValue(suspect.reason);',
'    apex.item( "P20_C_CASE_NO" ).setValue(suspect.caseNumber);',
'    apex.item( "P20_C_CASE_TYPE_TMP" ).setValue(suspect.caseType);',
'    apex.item( "P20_C_AUTHORITY" ).setValue(suspect.authority);',
'    apex.item( "P20_C_LEVEL_OF_CONFIDENTIALITY" ).setValue(suspect.secretLevel);',
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
'.cl-hidden {',
'    display: none;',
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
 p_id=>wwv_flow_api.id(52884825053208922)
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
 p_id=>wwv_flow_api.id(25336289592868724)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(52884825053208922)
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
 p_id=>wwv_flow_api.id(25336158347868723)
,p_plug_name=>'Request'
,p_parent_plug_id=>wwv_flow_api.id(25336289592868724)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30338855404948822)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(25336158347868723)
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
 p_id=>wwv_flow_api.id(52884976283208923)
,p_plug_name=>'FacePhoto'
,p_parent_plug_id=>wwv_flow_api.id(25336158347868723)
,p_region_css_classes=>'region-100 too-small-for-overlay request-photo'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>5
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25336382839868725)
,p_plug_name=>'Candidate'
,p_parent_plug_id=>wwv_flow_api.id(25336289592868724)
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
 p_id=>wwv_flow_api.id(30338968780948823)
,p_plug_name=>'Candidate-Face'
,p_parent_plug_id=>wwv_flow_api.id(25336382839868725)
,p_region_css_classes=>'region-100 too-small-for-overlay candidate-photo'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30339064948948824)
,p_plug_name=>'Candidate-Data'
,p_parent_plug_id=>wwv_flow_api.id(25336382839868725)
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
 p_id=>wwv_flow_api.id(52885066902208924)
,p_plug_name=>'Result'
,p_region_name=>'SearchResult'
,p_parent_plug_id=>wwv_flow_api.id(52884825053208922)
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
'        jt.demographicScore,',
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
'		 SUBSTR( dateOfBirth, 1, 10 ) as date_of_birth',
'FROM	apex_collections,',
'		JSON_TABLE( apex_collections.clob001, ''$.candidates[*]''',
'				COLUMNS(  "ID"             VARCHAR2(512 CHAR) PATH ''$.key_value'',',
'						  imageGuid        VARCHAR2(512 CHAR) PATH ''$.faceId'',',
'						  firstname        VARCHAR2(512 CHAR) PATH ''$.givenname'',',
'						  sortingScore     NUMBER             PATH ''$.sortingScore'',',
'						  demographicScore VARCHAR2(512 CHAR) PATH ''$.demographicScore'',',
'						  lastname         VARCHAR2(512 CHAR) PATH ''$.surname'',  ',
'						  biometricScore   VARCHAR2(512 CHAR) PATH ''$.biometricScore'',',
'						  demographicMatch VARCHAR2(512 CHAR) PATH ''$.demographicMatch'',',
'						  biometricMatch   VARCHAR2(512 CHAR) PATH ''$.biometricMatch'',',
'						  nationality      VARCHAR2(512 CHAR) PATH ''$.nationality'',',
'						  sex              VARCHAR2(512 CHAR) PATH ''$.sex'',',
'						  dateOfBirth      VARCHAR2(512 CHAR) PATH ''$.date_of_birth''',
'                  )) jt',
'JOIN blacklist_case_identities ci ON ci.identity = jt.ID ',
'JOIN blacklist_cases bc ON bc.id = ci.blacklist_case AND bc.is_active = ''Y''',
'WHERE collection_name = ''COLL_WS_RESULT''',
'',
' '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(33109063905209047)
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
 p_id=>wwv_flow_api.id(33109100844209048)
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
 p_id=>wwv_flow_api.id(33109238899209049)
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
 p_id=>wwv_flow_api.id(35291517974869501)
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
 p_id=>wwv_flow_api.id(35291733353869503)
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
 p_id=>wwv_flow_api.id(35291857435869504)
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
 p_id=>wwv_flow_api.id(35292089415869506)
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
 p_id=>wwv_flow_api.id(35292147230869507)
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
 p_id=>wwv_flow_api.id(35292478680869510)
,p_name=>'DEMOGRAPHICSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEMOGRAPHICSCORE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Demographicscore'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(35292538088869511)
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
 p_id=>wwv_flow_api.id(35292662187869512)
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
 p_id=>wwv_flow_api.id(35292741124869513)
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
 p_id=>wwv_flow_api.id(35292875905869514)
,p_name=>'DATE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_BIRTH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Date of birth'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>40
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
 p_id=>wwv_flow_api.id(35294641614869532)
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
 p_id=>wwv_flow_api.id(250013935444795703)
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
 p_id=>wwv_flow_api.id(250014001313795704)
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
end;
/
begin
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(33108923164209046)
,p_internal_uid=>33108923164209046
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>330
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(35297493735870489)
,p_interactive_grid_id=>wwv_flow_api.id(33108923164209046)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(35297530910870491)
,p_report_id=>wwv_flow_api.id(35297493735870489)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1352557625377125)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(35294641614869532)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35298074626870502)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(33109063905209047)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35298534673870523)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(33109100844209048)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35299072131870532)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(33109238899209049)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35299906887870552)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(35291517974869501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35300906289870568)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(35291733353869503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35301414639870576)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35291857435869504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35302435310870591)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(35292089415869506)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35302903049870598)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(35292147230869507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35670218177533070)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(35292478680869510)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35670866394533088)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(35292538088869511)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35709078844733326)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(35292662187869512)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35709540032733343)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(35292741124869513)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35745741446820442)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(35292875905869514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(250485599432213579)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(250013935444795703)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(250486084134213598)
,p_view_id=>wwv_flow_api.id(35297530910870491)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(250014001313795704)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35292962512869515)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(25336382839868725)
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
 p_id=>wwv_flow_api.id(35293013533869516)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(25336158347868723)
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
 p_id=>wwv_flow_api.id(33107342981209030)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(25336382839868725)
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
 p_id=>wwv_flow_api.id(33107416642209031)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(25336382839868725)
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
 p_id=>wwv_flow_api.id(25338606368868748)
,p_name=>'P20_C_RECORD_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25338787386868749)
,p_name=>'P20_C_LAST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Surname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25338894591868750)
,p_name=>'P20_C_FIRST_NAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28681564831891901)
,p_name=>'P20_C_LAST_NAME_THAI'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'SurnameTH:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28681677600891902)
,p_name=>'P20_C_FIRST_NAME_THAI'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'FirstnameTH:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28681775304891903)
,p_name=>'P20_C_MIDDLE_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Middlename:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28681880610891904)
,p_name=>'P20_C_MIDDLE_NAME_THAI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MiddlenameTH:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28681963789891905)
,p_name=>'P20_C_CASE_NO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Case Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28682003926891906)
,p_name=>'P20_C_CASE_TYPE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Case Type:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28682198857891907)
,p_name=>'P20_C_CASE_TYPE_TMP'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'C case type tmp'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_CASES_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.case_types$LC',
'  where NVL( is_active, ''Y'' ) = ''Y''',
' order by DISPLAY_ORDER ASC',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'cl-hidden'
,p_grid_column_css_classes=>'cl-hidden'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28682202625891908)
,p_name=>'P20_C_AUTHORITY'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Authority:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28682320921891909)
,p_name=>'P20_C_CONTACT_OWNER_DATA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner Contact:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28682460498891910)
,p_name=>'P20_C_WARRANT_NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Warrant Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28682517866891911)
,p_name=>'P20_C_LEVEL_OF_CONFIDENTIALITY'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Confidentiality Level:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28682638520891912)
,p_name=>'P20_C_URGENT_CONTACT'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Urgent Contact:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28682944801891915)
,p_name=>'P20_C_ACTION_CODE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_prompt=>'Action Code:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28683005278891916)
,p_name=>'P20_C_REASON'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_prompt=>'Reason:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28683198118891917)
,p_name=>'P20_C_CONTACT_TELEPHONE_NO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_prompt=>'Phone Contact:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28683208209891918)
,p_name=>'P20_C_ENTRY_DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_prompt=>'Date Saved:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28683351526891919)
,p_name=>'P20_C_TRAVEL_PERMIT_FROM'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_prompt=>'Travel Permit From:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(28683471118891920)
,p_name=>'P120_C_OSTAY_TM6'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_prompt=>'TM6:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30167529790032277)
,p_name=>'P20_PHOTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(52884976283208923)
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
 p_id=>wwv_flow_api.id(30336845511948802)
,p_name=>'P20_C_GENDER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Gender'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'LOV_HUMAN_SEXES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE) display_value,',
'   key_value return_value',
'FROM',
'    DL_COMMON.HUMAN_SEXES$LC',
'WHERE ICAO is not null',
'    order by DISPLAY_VALUE, DISPLAY_ORDER;'))
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30336944499948803)
,p_name=>'P20_C_NATIONALITY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nationality'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30337024922948804)
,p_name=>'P20_C_BEHAVIOUR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Behaviour'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30337217417948806)
,p_name=>'P20_C_NEXT_STEPS'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Next Steps'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30338007828948814)
,p_name=>'P20_R_SURNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(30338855404948822)
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
 p_id=>wwv_flow_api.id(30338171388948815)
,p_name=>'P20_R_FIRSTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(30338855404948822)
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
 p_id=>wwv_flow_api.id(30338380570948817)
,p_name=>'P20_R_SEX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(30338855404948822)
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
 p_id=>wwv_flow_api.id(30338413721948818)
,p_name=>'P20_R_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(30338855404948822)
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
 p_id=>wwv_flow_api.id(30338546764948819)
,p_name=>'P20_R_PLACE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(30338855404948822)
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
 p_id=>wwv_flow_api.id(30339153702948825)
,p_name=>'P20_PHOTO_CANDIDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(30338968780948823)
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
 p_id=>wwv_flow_api.id(30339272270948826)
,p_name=>'P20_C_PASSPORT_NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Passport Number'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30339370985948827)
,p_name=>'P20_C_BIRTHDAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Birthday'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30339744917948831)
,p_name=>'P20_R_PASSPORT_NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(30338855404948822)
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
 p_id=>wwv_flow_api.id(33105705778209014)
,p_name=>'P20_R_DATE_OF_BIRTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(30338855404948822)
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
 p_id=>wwv_flow_api.id(33105837297209015)
,p_name=>'P20_C_PLACE_OF_BIRTH'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Place of Birth'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#:margin-bottom-md'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33107649247209033)
,p_name=>'P20_C_CASE_ID'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35293856248869524)
,p_name=>'P20_REDIRECT_URL'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_source=>'apex_util.prepare_url(''f?p=&APP_ID.:35:&SESSION.::NO:RP:P35_CASE_ID:CASE_PLACEHOLDER'', p_checksum_type => ''SESSION'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35295469497869540)
,p_name=>'P20_C_REASON_TMP'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reason'
,p_source=>'P20_C_REASON_TMP'
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
,p_grid_column_css_classes=>'cl-hidden'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_css_classes=>'reason-select'
,p_item_template_options=>'#DEFAULT#:margin-top-lg'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(67105031075079820)
,p_name=>'P20_C_REMARK'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(30339064948948824)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Remark'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(35294266703869528)
,p_computation_sequence=>10
,p_computation_item=>'P20_C_CASE_ID'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'.P35_CASE_ID := :P20_C_CASE_ID'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30173593180032429)
,p_name=>'SetFacePhoto'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30174006729032433)
,p_event_id=>wwv_flow_api.id(30173593180032429)
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
 p_id=>wwv_flow_api.id(30174416562032434)
,p_name=>'SearchCamunda'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35293248700869518)
,p_event_id=>wwv_flow_api.id(30174416562032434)
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
 p_id=>wwv_flow_api.id(30174967046032437)
,p_event_id=>wwv_flow_api.id(30174416562032434)
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
 p_id=>wwv_flow_api.id(30337308322948807)
,p_name=>'ShowCandidateDetails'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-blacklist-identity-id] , .a-GV-row'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#SearchResult'
,p_bind_event_type=>'click'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33107522757209032)
,p_event_id=>wwv_flow_api.id(30337308322948807)
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
'        apex.item(''P20_C_CASE_ID'').setValue(data.case.id);',
'    } ',
'    else{',
'        apex.item( "P20_C_CASE_ID" ).setValue('''');',
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
 p_id=>wwv_flow_api.id(30339515369948829)
,p_name=>'SetFieldsFromScanPage'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30339662094948830)
,p_event_id=>wwv_flow_api.id(30339515369948829)
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
'           // $item.datepicker( "setDate", (new Date(val)) );',
'        }',
'        else{   ',
'            //ROBERT, BESSER MACHEN!! GRUSS, JENS            ',
'            if ($item.attr(''name'') == "P20_R_DATE_OF_BIRTH" && val) {',
'                apex.item($item.attr(''name'')).setValue(val.substr(0,10));    ',
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
 p_id=>wwv_flow_api.id(35294310473869529)
,p_name=>'PrepareRedirectUrl'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(35292962512869515)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30337487165948808)
,p_event_id=>wwv_flow_api.id(35294310473869529)
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
'        p_url => ''f?p='' || l_app || '':32:''||l_session||''::NO::P32_CASE_ID:'' || :P20_C_CASE_ID,',
'        p_checksum_type => ''SESSION'');',
'    :P20_REDIRECT_URL := l_url;',
'END;'))
,p_attribute_02=>'P20_C_CASE_ID'
,p_attribute_03=>'P20_REDIRECT_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35294448287869530)
,p_event_id=>wwv_flow_api.id(35294310473869529)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.redirect(apex.item("P20_REDIRECT_URL").getValue() );'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43039736235882709)
,p_name=>'SelectFirstResultset'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(52885066902208924)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43039842273882710)
,p_event_id=>wwv_flow_api.id(43039736235882709)
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
 p_id=>wwv_flow_api.id(250014161026795705)
,p_name=>'GetReasonCode'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_C_REASON_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(250014337423795707)
,p_event_id=>wwv_flow_api.id(250014161026795705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_C_REASON'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28682715363891913)
,p_name=>'SetCaseType'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_C_CASE_TYPE_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28682819245891914)
,p_event_id=>wwv_flow_api.id(28682715363891913)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_C_CASE_TYPE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30172837360032425)
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
 p_id=>wwv_flow_api.id(30173195929032427)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get_ws_result'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_params          VARCHAR2(32767) := apex_application.g_x01;',
'    l_collection_name VARCHAR2(200)   := ''COLL_WS_RESULT'';',
'    l_clob            CLOB;',
'    l_json            JSON_OBJECT_T;',
'    l_candidates_json JSON_ARRAY_T;',
'    l_cookie_b        OWA_COOKIE.COOKIE;',
'    err_no_data exception;',
'    PRAGMA EXCEPTION_INIT(err_no_data,-20001);',
'BEGIN',
'    apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'    apex_collection.create_or_truncate_collection( l_collection_name );',
'',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';   ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';  ',
'    ',
'    l_cookie_b := owa_cookie.get(''OA_B'');',
'    ',
'    if l_cookie_b.num_vals > 0 then    ',
'        apex_web_service.g_request_headers(2).name := ''Cookie'';   ',
'        apex_web_service.g_request_headers(2).value := ''OA_B='' || l_cookie_b.vals(1);  ',
'        apex_debug.message(''OA_B= '' || l_cookie_b.vals(1));',
'    end if;',
'',
'    apex_debug.message(''CAMUNDA_URL: '' || :CAMUNDA_URL);',
'    apex_web_service.g_status_code := null;',
'    l_clob           := apex_web_service.make_rest_request(',
'                             p_url         => :CAMUNDA_URL||''/blacklist/search'',',
'                             p_http_method => ''POST'',',
'                             p_body        => l_params',
'                             ,p_wallet_path => ''file:/u01/app/oracle/admin/AFIS/https_wallet/'' -- The path to directory that holding wallets',
'                             ,p_wallet_pwd  => ''dermalog!''',
'                             ,p_https_host  => ''Dermalog''',
'		                                            );',
'    if apex_web_service.g_status_code = 200 then',
'    ',
'        l_json := JSON_OBJECT_T.parse(l_clob);',
'        l_candidates_json := l_json.get_array(''candidates'');',
'        if l_candidates_json is null then',
'          raise err_no_data;',
'        end if;',
'        apex_collection.add_member(p_collection_name => l_collection_name,',
'                                   p_clob001         =>l_clob',
'                                 );',
'        apex_json.open_object;',
'        apex_json.write( ''sqlcode'', 0 );',
'        apex_json.write( ''sqlerrm'', ''Request OK'');',
'        apex_json.close_object;',
'        htp.p( apex_json.get_clob_output );',
'    elsif apex_web_service.g_status_code = 503 then',
'        apex_json.open_object;',
'        apex_json.write( ''sqlcode'', ''503'' );',
'        apex_json.write( ''sqlerrm'', ''Search request failed, the Search Service is unreachable'' );',
'        apex_json.close_object;',
'        htp.p( apex_json.get_clob_output );',
'    elsif apex_web_service.g_status_code = 401 then',
'        apex_json.open_object;',
'        apex_json.write( ''sqlcode'', ''401'' );',
'        apex_json.write( ''sqlerrm'', ''Search request failed, unauthorized'' );',
'        apex_json.close_object;',
'        htp.p( apex_json.get_clob_output );',
'    else ',
'        raise err_no_data;',
'    end if;',
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
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30337519007948809)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_DETAILS_FOR_BLACKLISTID'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_details VARCHAR2(4000);',
'    l_biometrics VARCHAR2(4000);',
'BEGIN',
'    SELECT ',
'        jt."Details",jt."ImageGuid" INTO l_details,l_biometrics',
'    from APEX_collections,',
'         JSON_TABLE(APEX_collections.clob001, ''$.demographics.candidates[*]''',
'             COLUMNS (',
'             "Record ID"    VARCHAR2(512 CHAR) PATH ''$.blacklistId'',',
'             "Details"    VARCHAR2(4000 CHAR) FORMAT JSON WITH WRAPPER PATH ''$.demographics.details'',',
'             "ImageGuid" VARCHAR2(4000 CHAR) FORMAT JSON WITH  WRAPPER PATH ''$.biometrics.faces[0].image.guid''',
'             )) jt',
'    WHERE collection_name = ''COLL_WS_RESULT'' AND "Record ID" = apex_application.g_x01;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''details'', l_details);',
'    apex_json.write(''biometrics'', l_biometrics);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35293323302869519)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'dummy'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_case_id VARCHAR2(32) := apex_application.g_x01;',
'BEGIN',
'    :APP_CURRENT_CASE_ID := l_case_id;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''case_id'', l_case_id);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
