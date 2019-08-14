prompt --application/pages/page_00120
begin
wwv_flow_api.create_page(
 p_id=>120
,p_user_interface_id=>wwv_flow_api.id(92393441321433977)
,p_name=>'Blacklist Search Result'
,p_page_mode=>'MODAL'
,p_step_title=>'Blacklist Search Result'
,p_step_sub_title=>'Blacklist Search Result'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function warnOnClose(event, ui)',
'{',
'    event.preventDefault();',
'    return false;',
'}',
'/*function setApexCollectionClob (pBigValue, callback) {',
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
'*/',
'',
'function resetDetails(){',
'    apex.item( "P120_C_RECORD_NO" ).setValue('''');',
'    apex.item( "P120_C_LAST_NAME" ).setValue('''');',
'    apex.item( "P120_C_FIRST_NAME" ).setValue('''');',
'    apex.item( "P120_C_GENDER" ).setValue('''');',
'    apex.item( "P120_C_NATIONALITY" ).setValue('''');',
'    apex.item( "P120_C_BEHAVIOUR" ).setValue('''');',
'    apex.item( "P120_C_LEVEL_OF_CONFIDENTIALLY" ).setValue('''');',
'    apex.item( "P120_C_NEXT_STEPS" ).setValue('''');',
'    apex.item( "P120_C_PHONE" ).setValue('''');',
'    apex.item( "P120_C_LAST_NAME_THAI" ).setValue('''');',
'    apex.item( "P120_C_FIRST_NAME_THAI" ).setValue('''');',
'    apex.item( "P120_C_MIDDLE_NAME_THAI" ).setValue('''');',
'    apex.item( "P120_C_BIRTHDAY" ).setValue('''');',
'    apex.item( "P120_C_PLACE_OF_BIRTH" ).setValue('''');',
'    apex.item( "P120_C_AUTHORITY" ).setValue('''');',
'    apex.item( "P120_C_CONTACT_REQUIRED" ).setValue('''');',
'    apex.item( "P120_C_REASON" ).setValue('''');',
'    apex.item( "P120_C_CASE_NO" ).setValue('''');',
'    apex.item( "P120_C_ENTRY_DATE" ).setValue('''');',
'    apex.item( "P120_C_PASSPORT_NUMBER" ).setValue('''');',
'    apex.item( "P120_C_ARRIVAL_DATE" ).setValue('''');',
'    $(''.candidate-photo .FaceItem'').FaceItem(''update'', {',
'            "Position": {',
'                "ordinal": 1,',
'                "name": "Portrait"',
'            }',
'        });',
'}',
'',
'function setCaseDetails(pData)  {',
'    resetDetails();',
'    var suspect = pData.case || {};',
'    var details = pData.details || {};',
'    var biometric = pData.biometric || {};',
'    var identity = suspect.identities[0] || {};',
'    ',
'    identity.surname = identity.surName;',
'    identity.firstname = identity.givenName;',
'    identity.middlename = identity.middleName;',
'    ',
'    suspect.identity = identity || {};',
'    ',
'    var travelDoc = identity.traveldocs[0] || {};',
'    travelDoc.passportNumber = travelDoc.docNumber;',
'    identity.travelDoc = travelDoc;',
'    ',
'    apex.item( "P120_C_RECORD_NO" ).setValue(suspect.id);',
'    apex.item( "P120_C_LAST_NAME" ).setValue(suspect.identity.surname);',
'    var firstname = '''';suspect.identity.firstname',
'    firstname += suspect.identity.firstname ? suspect.identity.firstname : '''';',
'    firstname += suspect.identity.middlename ? '' '' + suspect.identity.middlename : '''';',
'    apex.item( "P120_C_FIRST_NAME" ).setValue(firstname);',
'    apex.item( "P120_C_GENDER" ).setValue(identity.travelDoc.sex);',
'    apex.item( "P120_C_NATIONALITY" ).setValue(identity.nationality);',
'    apex.item( "P120_C_BEHAVIOUR" ).setValue(suspect.behaviour);',
'    apex.item( "P120_C_LEVEL_OF_CONFIDENTIALLY" ).setValue(suspect.levelOfConfidentially);',
'    apex.item( "P120_C_NEXT_STEPS" ).setValue(suspect.nextStep);',
'    apex.item( "P120_C_PHONE" ).setValue(suspect.phone);',
'    apex.item( "P120_C_LAST_NAME_THAI" ).setValue(suspect.lastnameThai);',
'    apex.item( "P120_C_FIRST_NAME_THAI" ).setValue(suspect.firstnameThai);',
'    apex.item( "P120_C_MIDDLE_NAME_THAI" ).setValue(suspect.middlenameThai);',
'    apex.item( "P120_C_BIRTHDAY" ).setValue(suspect.identity.dateOfBirth);',
'    apex.item( "P120_C_PLACE_OF_BIRTH" ).setValue(suspect.identity.placeOfBirth);',
'    ',
'    apex.item( "P120_C_AUTHORITY" ).setValue(suspect.authority);',
'    apex.item( "P120_C_CONTACT_REQUIRED" ).setValue(suspect.contactRequired);',
'    apex.item( "P120_C_REASON" ).setValue(suspect.reason);',
'    apex.item( "P120_C_CASE_NO" ).setValue(suspect.caseNumber);',
'',
'    apex.item( "P120_C_ENTRY_DATE" ).setValue(details.entryDate);',
'    apex.item( "P120_C_PASSPORT_NUMBER" ).setValue(identity.travelDoc.passportNumber);',
'    apex.item( "P120_C_ARRIVAL_DATE" ).setValue(details.arrivalDate);',
'    if(biometric.faces && biometric.faces.length > 0 && biometric.faces[0].image.guid){',
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
'$(''#PreviousCase, #NextCase'').hide();',
'',
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
'',
'/*   -------------- Colors -------------- */',
'.u-ColorBG--6 {',
'',
'}',
'.u-Color-6-BG--bg,',
'.t-Region-header {',
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
'',
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
'#BogusButton {',
'    display:none;',
'}',
'',
'.a-GV-table .a-GV-cell {',
'    padding-top: 0;',
'    padding-bottom: 0;',
'}',
'',
'',
'.approveButton ',
'{',
'    margin-top:6px;',
'    padding: 5px;',
'}',
'',
'.t-Form-labelContainer.col-3, .t-Form-inputContainer.col-9,#P120_PHOTO_CONTAINER .t-Form-inputContainer, #P120_PHOTO_CANDIDATE_CONTAINER .t-Form-inputContainer',
'{',
'  padding: 0px; ',
'}',
'',
'.t-Dialog-bodyWrapperIn',
'{',
'    overflow: hidden !important;',
'}',
''))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_width=>'1200'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_page_comment=>'beforeClose: preventDialogCancel'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181114131732'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44646140441055086)
,p_plug_name=>'Supvervisor Footer'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(151535529381180161)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44648378141055109)
,p_plug_name=>'Reason for this Action'
,p_region_name=>'reasonDialog'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(92355234527433746)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44649187302055117)
,p_plug_name=>'Information'
,p_parent_plug_id=>wwv_flow_api.id(44648378141055109)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(92347983306433699)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Please provide a valid reason for this action. '
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44649352535055118)
,p_plug_name=>'Reason Input'
,p_parent_plug_id=>wwv_flow_api.id(44648378141055109)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(200545312477953508)
,p_plug_name=>'Officer Footer'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_source=>'Officer Footer'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>'!'||wwv_flow_api.id(151535529381180161)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(312092545884327730)
,p_plug_name=>'BlacklistContainer'
,p_region_css_classes=>'result-container'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(284544010423987532)
,p_plug_name=>'LowerRegionDetails'
,p_parent_plug_id=>wwv_flow_api.id(312092545884327730)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
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
 p_id=>wwv_flow_api.id(284543879178987531)
,p_plug_name=>'Request'
,p_parent_plug_id=>wwv_flow_api.id(284544010423987532)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HR'') = 1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(289546576236067630)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(284543879178987531)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(312092697114327731)
,p_plug_name=>'FacePhoto'
,p_parent_plug_id=>wwv_flow_api.id(284543879178987531)
,p_region_css_classes=>'region-100 too-small-for-overlay request-photo'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
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
 p_id=>wwv_flow_api.id(284544103670987533)
,p_plug_name=>'Candidate'
,p_parent_plug_id=>wwv_flow_api.id(284544010423987532)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:margin-bottom-none:margin-left-none'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
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
 p_id=>wwv_flow_api.id(289546689612067631)
,p_plug_name=>'Candidate-Face'
,p_parent_plug_id=>wwv_flow_api.id(284544103670987533)
,p_region_css_classes=>'region-100 too-small-for-overlay candidate-photo'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
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
 p_id=>wwv_flow_api.id(289546785780067632)
,p_plug_name=>'Candidate-Data'
,p_parent_plug_id=>wwv_flow_api.id(284544103670987533)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HC'') = 1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(312092787733327732)
,p_plug_name=>'Result'
,p_region_name=>'SearchResult'
,p_parent_plug_id=>wwv_flow_api.id(312092545884327730)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92356180518433747)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'   jt.*',
'   --jt.id, jt.imageguid, jt.firstname, jt.sortingscore, jt.lastname, jt.biometricscore, decode(jt.demographicmatch, 1, ''&#x2714;'', ''&#x2A2F;'') demographicmatch, decode(jt.biometricmatch, 1, ''&#x2714;'', ''&#x2A2F;'') biometricmatch, jt.nationality, jt.'
||'sex, jt.dateofbirth',
'   , (SELECT',
'  coalesce(max( ''/image/''||image_id||''?width=450'' ) ,''#WORKSPACE_IMAGES#template_photo.png'') as image FROM',
'    faces f',
'    INNER JOIN biometrics b ON f.biometric_id = b.id',
'    INNER JOIN blacklist_cases c ON b.blacklist_case_id = c.id',
'    INNER JOIN blacklist_case_identities ci ON c.id = ci.blacklist_case where ci.identity = jt.ID ) as image',
'   ,case   when ( demographicMatch  = ''true'' and   biometricMatch = ''true''  ) then ''biometric and demographic'' when biometricMatch = ''true''  then ''biometric''',
'          else ''demographic''',
'       end type',
'    , case when length(dateofbirth) > 0 then to_date(SUBSTR(dateOfBirth, 1, 10), ''YYYY-MM-DD'') else null end as date_of_birth',
'    --   ,  to_char(date_of_birth ,''YYYY-MM-DD'') as "Date of Birth"',
'    ',
'from TMP_BLACKLIST_SEARCH,',
'     JSON_TABLE(TMP_BLACKLIST_SEARCH.JSON_DATA, ''$.json_response.candidates[*]''',
'         COLUMNS ("ID"             VARCHAR2(512 CHAR) PATH ''$.key_value'',',
'                  imageGuid        VARCHAR2(512 CHAR) PATH ''$.faceId'',',
'                  firstname        VARCHAR2(512 CHAR) PATH ''$.givenname'',',
'                  sortingScore     NUMBER             PATH ''$.sortingScore'',',
'                  demographicScore VARCHAR2(512 CHAR) PATH ''$.demographicScore'',',
'                  lastname         VARCHAR2(512 CHAR) PATH ''$.surname'',  ',
'                  biometricScore   VARCHAR2(512 CHAR) PATH ''$.biometricScore'',',
'                  demographicMatch VARCHAR2(512 CHAR) PATH ''$.demographicMatch'',',
'                  biometricMatch   VARCHAR2(512 CHAR) PATH ''$.biometricMatch'',',
'                  nationality      VARCHAR2(512 CHAR) PATH ''$.nationality'',',
'                  sex              VARCHAR2(512 CHAR) PATH ''$.sex'',',
'                  dateOfBirth  VARCHAR2(512 CHAR) PATH ''$.date_of_birth''',
'                  )) jt',
' JOIN blacklist_case_identities ci ON ci.identity = jt.ID ',
' JOIN blacklist_cases bc ON bc.id = ci.blacklist_case AND bc.is_active = ''Y''',
'WHERE APP_SESSION = v(''APP_SESSION'')'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(200543554860953490)
,p_name=>'SORTINGSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SORTINGSCORE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sortingscore'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(200543638339953491)
,p_name=>'DATEOFBIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATEOFBIRTH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_format_mask=>'DD/MM/YYYY'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HB'') = 1'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(200545506619953510)
,p_name=>'DEMOGRAPHICSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEMOGRAPHICSCORE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Demographicscore'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(292316784736327855)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-search" data-blacklist-case-id="&ID."></span>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(292316821675327856)
,p_name=>'IMAGEGUID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGEGUID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(292316959730327857)
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
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HF'') = 1'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(294499238805988309)
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
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HS'') = 1'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(294499454184988311)
,p_name=>'NATIONALITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NATIONALITY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nationality'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HN'') = 1'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(294499578266988312)
,p_name=>'SEX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEX'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sex'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
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
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HG'') = 1'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(294499810246988314)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Image'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<img src="&IMAGE." style="max-width: 50px" />'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(294499868061988315)
,p_name=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(294500258919988319)
,p_name=>'BIOMETRICSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BIOMETRICSCORE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Biometricscore'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(294500383018988320)
,p_name=>'DEMOGRAPHICMATCH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEMOGRAPHICMATCH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Demographicmatch'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(294500461955988321)
,p_name=>'BIOMETRICMATCH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BIOMETRICMATCH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Biometricmatch'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(294500596736988322)
,p_name=>'DATE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_BIRTH'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Date of birth'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_format_mask=>'DD/MM/YYYY'
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
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HB'') = 1'
);
end;
/
begin
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(292316643995327854)
,p_internal_uid=>252755387158455469
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
,p_fixed_header_max_height=>400
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(294505214566989297)
,p_interactive_grid_id=>wwv_flow_api.id(292316643995327854)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(294505251741989299)
,p_report_id=>wwv_flow_api.id(294505214566989297)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(201037368180078187)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(200543554860953490)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(201037761819078252)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(200543638339953491)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(204593168209334341)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(200545506619953510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294505795457989310)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(292316784736327855)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294506255504989331)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(292316821675327856)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294506792962989340)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(292316959730327857)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294507627718989360)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(294499238805988309)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294508627120989376)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(294499454184988311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294509135470989384)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(294499578266988312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294510156141989399)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(294499810246988314)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294510623880989406)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(294499868061988315)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294878587225651896)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(294500258919988319)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294916799675852134)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(294500383018988320)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294917260863852151)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(294500461955988321)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(294953462277939250)
,p_view_id=>wwv_flow_api.id(294505251741989299)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(294500596736988322)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44646446187055089)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(44646140441055086)
,p_button_name=>'Approve_SUPERVISOR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_image_alt=>'Approve this Request'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:openModal("reasonDialog");'
,p_button_css_classes=>'approveButton'
,p_icon_css_classes=>'fa-lock-password'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44647920329055104)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(44646140441055086)
,p_button_name=>'DENY_SUPERVISOR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_image_alt=>'Deny this Request'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:openModal("reasonDialog");'
,p_button_css_classes=>'approveButton'
,p_icon_css_classes=>'fa-lock-password'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44647799739055103)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(200545312477953508)
,p_button_name=>'DENY_OFFICER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft:t-Button--pillEnd'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_image_alt=>'Deny this Request'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'approveButton'
,p_icon_css_classes=>'fa-lock-password'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(140497480029336602)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(200545312477953508)
,p_button_name=>'Approve_OFFICER'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--pillStart'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_image_alt=>'Approve this Request'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:'
,p_button_css_classes=>'approveButton'
,p_icon_css_classes=>'fa-lock-password'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44648616179055111)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(44648378141055109)
,p_button_name=>'Save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(143543256466269735)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(284543879178987531)
,p_button_name=>'BogusButton'
,p_button_static_id=>'BogusButton'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_image_alt=>'Bogusbutton'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(143547631658269772)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(284544103670987533)
,p_button_name=>'NextCase'
,p_button_static_id=>'NextCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next Case'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(143548007404269773)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(284544103670987533)
,p_button_name=>'PreviousCase'
,p_button_static_id=>'PreviousCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Previous Case'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44648461240055110)
,p_name=>'P120_REASON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44649352535055118)
,p_prompt=>'Reason:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140497340351336600)
,p_name=>'P120_USERNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(200545312477953508)
,p_prompt=>'Supervisor-Username:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(140497419438336601)
,p_name=>'P120_PASSWORD'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(200545312477953508)
,p_prompt=>'Password: '
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143543931107269744)
,p_name=>'P120_R_SURNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(289546576236067630)
,p_prompt=>'Surame'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143544323948269761)
,p_name=>'P120_R_FIRSTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(289546576236067630)
,p_prompt=>'Firstname'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143544732847269762)
,p_name=>'P120_R_SEX'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(289546576236067630)
,p_prompt=>'Gender'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143545089444269763)
,p_name=>'P120_R_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(289546576236067630)
,p_prompt=>'Nationality'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143545474412269764)
,p_name=>'P120_R_PASSPORT_NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(289546576236067630)
,p_prompt=>'Passport No'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143545953648269766)
,p_name=>'P120_DATE_OF_BIRTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(289546576236067630)
,p_prompt=>'Birthday'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143546312404269767)
,p_name=>'P120_R_PLACE_OF_BIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(289546576236067630)
,p_prompt=>'Place of Birth'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143546996996269769)
,p_name=>'P120_PHOTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(312092697114327731)
,p_prompt=>'Photo'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(92382062454433857)
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
 p_id=>wwv_flow_api.id(143548689913269776)
,p_name=>'P120_PHOTO_CANDIDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(289546689612067631)
,p_prompt=>'Photo candidate'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(92382062454433857)
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
 p_id=>wwv_flow_api.id(143549447547269779)
,p_name=>'P120_C_RECORD_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143549762856269780)
,p_name=>'P120_C_LAST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Surname:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HS'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143550218081269781)
,p_name=>'P120_C_FIRST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Firstname:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HF'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143550622351269782)
,p_name=>'P120_C_GENDER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HG'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143550995627269784)
,p_name=>'P120_C_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HN'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143551417059269785)
,p_name=>'P120_C_PASSPORT_NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Passport Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HP'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143551771952269786)
,p_name=>'P120_C_BIRTHDAY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Birthday:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HB'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143552181398269787)
,p_name=>'P120_C_PLACE_OF_BIRTH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Place of Birth:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HPB'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143552597681269788)
,p_name=>'P120_C_BEHAVIOUR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Behaviour:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HBV'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#:margin-top-lg'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143552991612269789)
,p_name=>'P120_C_LEVEL_OF_CONFIDENTIALITY'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Level of Confidentiality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HLC'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143553381063269791)
,p_name=>'P120_C_NEXT_STEPS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_prompt=>'Next Steps:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_display_when=>'DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HNS'') = 1'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(92382062454433857)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143553787787269793)
,p_name=>'P120_CASE_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(289546785780067632)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(140499640652336623)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>'P120_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Password can not be empty.'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(140497419438336601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(143562743882269855)
,p_name=>'SetFacePhoto'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143563246093269861)
,p_event_id=>wwv_flow_api.id(143562743882269855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("GET_REQUEST_PHOTO", ',
'{',
'    ',
'}, ',
'{',
'	success: function(pData) ',
'	{',
'        $(''.request-photo .FaceItem .fc-item-content'').removeClass("Portrait").css("background-image", "url(data:image/jpeg;base64," + pData + ")");',
'	},',
'    dataType: "text"',
'     ',
'    /*,error: function(pData)',
'    {',
'        console.log(''GET_REQUEST_PHOTO ERROR'');',
'        console.log(pData);',
'    }*/',
'});',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(143565047330269870)
,p_name=>'ShowCandidateDetails'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-blacklist-case-id] , .a-GV-row'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#SearchResult'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143565475866269873)
,p_event_id=>wwv_flow_api.id(143565047330269870)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).find(''span[data-blacklist-case-id]'');',
'var blacklistID = $(this.triggeringElement).attr(''data-blacklist-case-id'') || rowSpan.attr(''data-blacklist-case-id'');',
'//console.log(blacklistID);',
'resetDetails();',
'if(!blacklistID) return;',
'var endpoint = ''/ords/dl_bordercontrol/blacklist/cases/GetByIdentityId/''+blacklistID;',
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
'',
'    if(data[0]) setCaseDetails(data[0]);',
'    if (data.length>2){',
'            $(''#PreviousCase, #NextCase'').show();',
'     }',
'     else{',
'             $(''#PreviousCase, #NextCase'').hide();',
'    }',
'',
'    ',
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
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143565865927269875)
,p_event_id=>wwv_flow_api.id(143565047330269870)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var cols = $(this.triggeringElement).children();',
'var blacklistID = $(this.triggeringElement).attr(''data-record-id'');',
'//console.log(blacklistID);',
'',
'return true;',
'',
'apex.server.process("GET_DETAILS_FOR_BLACKLISTID", ',
'{',
'    x01: blacklistID',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        //console.log(pData);',
'        var details = JSON.parse(pData.details);',
'        var suspect = details[0];',
'        ',
'        apex.item( "P120_C_RECORD_NO" ).setValue(blacklistID);',
'        apex.item( "P120_C_LAST_NAME" ).setValue(suspect.lastname);',
'        apex.item( "P120_C_FIRST_NAME" ).setValue(suspect.firstname + '' '' + suspect.middlename);',
'        apex.item( "P120_C_GENDER" ).setValue(suspect.gender);',
'        apex.item( "P120_C_NATIONALITY" ).setValue(suspect.nationality);',
'        apex.item( "P120_C_BEHAVIOUR" ).setValue(suspect.behaviour);',
'        apex.item( "P120_C_LEVEL_OF_CONFIDENTIALLY" ).setValue(suspect.levelOfConfidentially);',
'        apex.item( "P120_C_NEXT_STEPS" ).setValue(suspect.nextStep);',
'        apex.item( "P120_C_PHONE" ).setValue(suspect.phone);',
'        apex.item( "P120_C_LAST_NAME_THAI" ).setValue(suspect.lastnameThai);',
'        apex.item( "P120_C_FIRST_NAME_THAI" ).setValue(suspect.firstnameThai);',
'        apex.item( "P120_C_MIDDLE_NAME_THAI" ).setValue(suspect.middlenameThai);',
'        apex.item( "P120_C_BIRTHDAY" ).setValue(suspect.dateOfBirth);',
'        apex.item( "P120_C_AUTHORITY" ).setValue(suspect.authority);',
'        apex.item( "P120_C_CONTACT_REQUIRED" ).setValue(suspect.contactRequired);',
'        apex.item( "P120_C_REASON" ).setValue(suspect.reason);',
'        apex.item( "P120_C_CASE_NO" ).setValue(suspect.caseNumber);',
'',
'        apex.item( "P120_C_ENTRY_DATE" ).setValue(suspect.entryDate);',
'        apex.item( "P120_C_PASSPORT_NUMBER" ).setValue(suspect.passportNo);',
'        apex.item( "P120_C_ARRIVAL_DATE" ).setValue(suspect.arrivalDate);',
'        apex.item( "P120_C_TM6_NUMBER" ).setValue(suspect.tM6Number);',
'        $(''.candidate-photo .FaceItem'').FaceItem(''urlToModel'', ''/image/'');',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(140496988524336597)
,p_name=>'Populate Searched Blacklist Params'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140497153105336598)
,p_event_id=>wwv_flow_api.id(140496988524336597)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    JSON_VALUE(a.JSON_DATA, ''$.json_request.demographic.surname''),',
'    JSON_VALUE(a.JSON_DATA, ''$.json_request.demographic.firstname''),',
'    JSON_VALUE(a.JSON_DATA, ''$.json_request.demographic.sex''),',
'    JSON_VALUE(a.JSON_DATA, ''$.json_request.demographic.nationality''),',
'    JSON_VALUE(a.JSON_DATA, ''$.json_request.demographic.passportNumber''),',
'    JSON_VALUE(a.JSON_DATA, ''$.json_request.demographic.dateOfBirth''),',
'    JSON_VALUE(a.JSON_DATA, ''$.json_request.demographic.placeOfBirth'')',
'INTO',
'    :P120_R_SURNAME,',
'    :P120_R_FIRSTNAME,',
'    :P120_R_SEX,',
'    :P120_R_NATIONALITY,',
'    :P120_R_PASSPORT_NUMBER,',
'    :P120_DATE_OF_BIRTH,',
'    :P120_R_PLACE_OF_BIRTH',
'FROM ',
'    TMP_BLACKLIST_SEARCH a',
'WHERE',
'    APP_SESSION = v(''APP_SESSION'');'))
,p_attribute_03=>'P120_R_SURNAME,P120_R_FIRSTNAME,P120_R_SEX,P120_R_NATIONALITY,P120_R_PASSPORT_NUMBER,P120_R_PLACE_OF_BIRTH'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(140497990686336607)
,p_name=>'Check Credentials Officer Approve'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(140497480029336602)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140498082418336608)
,p_event_id=>wwv_flow_api.id(140497990686336607)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_username VARCHAR2(4000) := UPPER(:P120_USERNAME);',
'    l_password VARCHAR2(4000) := :P120_PASSWORD;',
'    ',
'    l_supervisor NUMBER;',
'    ',
'    l_ex_no_supervisor EXCEPTION;',
'    PRAGMA EXCEPTION_INIT( l_ex_no_supervisor, -20111 );',
'BEGIN',
'',
'    --First Check the Credentials',
'    USER_MANAGEMENT.PKG_MAN_USERS.AUTHENTICATE(i_username => l_username, i_password => l_password);',
'    ',
'    --When No Exception occured we check if the Authenticated User has got the Supervisor role',
'    BEGIN',
'        l_supervisor := NVL(DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(l_username),''BL_HA''),0);',
'        ',
'        IF l_supervisor <= 0 then',
'            raise no_data_found;',
'        END IF;',
'        ',
'    EXCEPTION when no_data_found then',
'        raise_application_error( -20111, ''This User does not have Supervisor permissions'' );',
'    END;',
'    ',
'END;'))
,p_attribute_02=>'P120_USERNAME,P120_PASSWORD'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44648031301055105)
,p_event_id=>wwv_flow_api.id(140497990686336607)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'openModal("reasonDialog");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(44648756181055112)
,p_name=>'Close Dialog '
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(44648616179055111)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44648791327055113)
,p_event_id=>wwv_flow_api.id(44648756181055112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_attribute_01=>'P120_REASON'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(44648938236055114)
,p_name=>'Check Credentials Officer Deny'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(44647799739055103)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44649007730055115)
,p_event_id=>wwv_flow_api.id(44648938236055114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_username VARCHAR2(4000) := UPPER(:P120_USERNAME);',
'    l_password VARCHAR2(4000) := :P120_PASSWORD;',
'    ',
'    l_supervisor NUMBER;',
'    ',
'    l_ex_no_supervisor EXCEPTION;',
'    PRAGMA EXCEPTION_INIT( l_ex_no_supervisor, -20111 );',
'BEGIN',
'',
'    --First Check the Credentials',
'    USER_MANAGEMENT.PKG_MAN_USERS.AUTHENTICATE(i_username => l_username, i_password => l_password);',
'    ',
'    --When No Exception occured we check if the Authenticated User has got the Supervisor role',
'    BEGIN',
'',
'        IF DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(UPPER(:APP_USER),''BL_HA'') <= 0 then',
'            raise no_data_found;',
'        END IF;',
'        ',
'    EXCEPTION when no_data_found then',
'        raise_application_error( -20111, ''This User does not have Supervisor permissions'' );',
'    END;',
'    ',
'END;'))
,p_attribute_02=>'P120_USERNAME,P120_PASSWORD'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44649061765055116)
,p_event_id=>wwv_flow_api.id(44648938236055114)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'openModal("reasonDialog");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(143561508404269851)
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
 p_id=>wwv_flow_api.id(143562355420269854)
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
 p_id=>wwv_flow_api.id(143561059987269850)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_ws_result'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_clob clob := apex_application.g_clob_01;',
'begin',
'    apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''COLL_WS_RESULT'');',
'    APEX_COLLECTION.ADD_MEMBER (',
'        p_collection_name => ''COLL_WS_RESULT'',',
'        p_clob001 => l_clob);',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';   ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';  ',
'    ',
'    apex_json.open_object;',
'    apex_json.write( ''sqlcode'', 0 );',
'    apex_json.write( ''sqlerrm'', ''Request OK'');',
'    apex_json.close_object;',
'    htp.p( apex_json.get_clob_output );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(140497195729336599)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_REQUEST_PHOTO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_metadata_json pljson;',
'    l_clob_data CLOB;',
'    ',
'-- ----------------------------------------------------------------------------',
'PROCEDURE print_clob (p_clob IN CLOB) IS',
'-- ----------------------------------------------------------------------------',
'  l_offset NUMBER := 1;',
'  l_chunk  NUMBER := 255;',
'BEGIN',
'  LOOP',
'    EXIT WHEN l_offset > LENGTH(p_clob);',
'    htp.prn(SUBSTR(p_clob, l_offset, l_chunk));',
'    l_offset := l_offset + l_chunk;',
'  END LOOP;',
'END print_clob;',
'BEGIN',
'',
'    SELECT JSON_DATA INTO l_clob_data FROM TMP_BLACKLIST_SEARCH WHERE APP_SESSION = v(''APP_SESSION'');',
'    l_metadata_json := pljson(l_clob_data);',
'    ',
'    DBMS_LOB.CREATETEMPORARY(l_clob_data,TRUE, DBMS_LOB.SESSION);',
'    l_metadata_json.PATH(''json_request.biometric.faces[1].image.data'').GET_STRING(l_clob_data);',
'',
'    --apex_json.open_object;',
'    --apex_json.write( l_clob_data );',
'    --apex_json.close_object;',
'    print_clob(  l_clob_data );',
'    ',
'    DBMS_LOB.FREETEMPORARY(l_clob_data);',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(140498910747336616)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_CREDENTIALS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_username VARCHAR2(3200) := apex_application.g_x01; ',
'    l_password VARCHAR2(3200) := apex_application.g_x02;',
'BEGIN',
'    htp.p(l_username);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
