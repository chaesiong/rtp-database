prompt --application/pages/page_00120
begin
wwv_flow_api.create_page(
 p_id=>120
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Blacklist Search Result'
,p_page_mode=>'MODAL'
,p_step_title=>'Blacklist Search Result'
,p_step_sub_title=>'Blacklist Search Result'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#bmbs.lang.mask.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function checkCreds() {',
'    if ($("#P120_USERNAME").val().length > 0 && $("#P120_PASSWORD").val().length > 0) {',
'        apex.event.trigger(document, ''closeThisDialog'');',
'    }',
'}',
'',
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
'function setDefaultDetails(){',
'    let default_value = "-";',
'',
'    $(''.cl-set-default-val'').each(function(i, e) {',
'        let pid = $(e).attr("id");',
'        let pval = apex.item(pid).getValue();',
'        if (pval.length === 0) {',
'            apex.item(pid).setValue(default_value);',
'        }',
'    });',
'}',
'',
'function resetDetails(){',
'    apex.item( "P120_C_RECORD_NO" ).setValue('''');',
'    apex.item( "P120_C_LAST_NAME" ).setValue('''');',
'    apex.item( "P120_C_LAST_NAME_THAI" ).setValue('''');',
'    apex.item( "P120_C_FIRST_NAME" ).setValue('''');',
'    apex.item( "P120_C_FIRST_NAME_THAI" ).setValue('''');',
'    apex.item( "P120_C_MIDDLE_NAME" ).setValue('''');',
'    apex.item( "P120_C_MIDDLE_NAME_THAI" ).setValue('''');',
'    apex.item( "P120_C_GENDER_TMP" ).setValue('''');',
'    apex.item( "P120_C_BIRTHDAY" ).setValue('''');',
'    apex.item( "P120_C_NATIONALITY_TMP" ).setValue('''');',
'    apex.item( "P120_C_PASSPORT_NUMBER" ).setValue('''');',
'    apex.item( "P120_C_PLACE_OF_BIRTH" ).setValue('''');',
'    apex.item( "P120_C_CASE_NO" ).setValue('''');',
'    apex.item( "P120_C_CASE_TYPE_TMP" ).setValue('''');',
'    apex.item( "P120_C_AUTHORITY_TMP" ).setValue('''');',
'    apex.item( "P120_C_CONTACT_OWNER_DATA_TMP" ).setValue('''');',
'    apex.item( "P120_C_BEHAVIOUR_TMP" ).setValue('''');',
'    apex.item( "P120_C_WARRANT_NUMBER" ).setValue('''');',
'    apex.item( "P120_C_LEVEL_OF_CONF_TMP" ).setValue('''');',
'    apex.item( "P120_C_URGENT_CONTACT" ).setValue('''');',
'    apex.item( "P120_C_ACTION_CODE_TMP" ).setValue('''');',
'    apex.item( "P120_C_REASON_TMP" ).setValue('''');',
'    apex.item( "P120_C_CONTACT_TELEPHONE_NO" ).setValue('''');',
'    apex.item( "P120_C_ENTRY_DATE" ).setValue('''');',
'    apex.item( "P120_C_TRAVEL_PERMIT_FROM" ).setValue('''');',
'    apex.item( "P120_C_OSTAY_TM6" ).setValue('''');',
'    apex.item( "P120_C_REFERENCE_DOCUMENT" ).setValue('''');',
'    apex.item( "P120_C_BODY_HEIGHT_WEIGHT" ).setValue('''');',
'    apex.item( "P120_C_NOTICE" ).setValue('''');',
'    apex.item( "P120_C_NEXT_STEPS" ).setValue('''');',
'    $(''.candidate-photo .FaceItem'').FaceItem(''update'', {',
'            "Position": {',
'                "ordinal": 1,',
'                "name": "Portrait"',
'            }',
'        });',
'}',
'',
'var selectedBlacklistID, selectedCaseIdx, selectedFaceIdx;',
'function setCaseDetails(pData)  {',
'    resetDetails();',
'    var suspect = pData.case || {};',
'    var details = pData.details || {};',
'    var biometric = pData.biometric || {};',
'    var identity = suspect.identities[0] || {};',
'    ',
'    if (suspect.identities.length > 1 && !!selectedBlacklistID) { ',
'        let idx = suspect.identities.map(function(e) { return e.id; }).indexOf(selectedBlacklistID);',
'        if (!!idx) identity = suspect.identities[idx] || {};',
'    }',
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
'    var firstname = '''';',
'    firstname += suspect.identity.firstname ? suspect.identity.firstname : '''';',
'    //firstname += suspect.identity.middlename ? '' '' + suspect.identity.middlename : '''';',
'    apex.item( "P120_C_FIRST_NAME" ).setValue(firstname);',
'    apex.item( "P120_C_MIDDLE_NAME" ).setValue(suspect.identity.middlename);',
'',
'    let gender = suspect.identity.sex;',
'    if(travelDoc.sex && travelDoc.sex != null) {',
'        gender = travelDoc.sex;',
'    }',
'    ',
'    if (gender != null) {',
'        //gender = (gender.toLowerCase() == "m") ? "MALE" : (gender.toLowerCase() == "f") ? "FEMALE" : gender;',
'        gender = (gender.toLowerCase() == "m") ? "1" : (gender.toLowerCase() == "f") ? "2" : gender;',
'    }',
'    else {',
'        gender = "";',
'    }',
'',
'    //apex.item( "P120_C_GENDER_TMP" ).setValue(gender); //identity.travelDoc.sex);',
'    setSelectList("P120_C_GENDER_TMP", gender);',
'    ',
'    //apex.item( "P120_C_NATIONALITY_TMP" ).setValue(identity.nationality);',
'    setSelectList("P120_C_NATIONALITY_TMP", identity.nationality);',
'    ',
'    //apex.item( "P120_C_BEHAVIOUR_TMP" ).setValue(suspect.behavior);',
'    setSelectList("P120_C_BEHAVIOUR_TMP", suspect.associatedBehavior);',
'    ',
'    //apex.item( "P120_C_LEVEL_OF_CONF_TMP" ).setValue(suspect.secretLevel);',
'    setSelectList("P120_C_LEVEL_OF_CONF_TMP", suspect.secretLevel);',
'    ',
'    apex.item( "P120_C_NEXT_STEPS" ).setValue(suspect.nextStep);',
'    //apex.item( "P120_C_PHONE" ).setValue(suspect.phone);',
'    apex.item( "P120_C_LAST_NAME_THAI" ).setValue(suspect.identity.surNameThai);',
'    apex.item( "P120_C_FIRST_NAME_THAI" ).setValue(suspect.identity.givenNameThai);',
'    apex.item( "P120_C_MIDDLE_NAME_THAI" ).setValue(suspect.identity.middleNameThai);',
'    if(suspect.identity.dateOfBirth){',
'        let dob = suspect.identity.dateOfBirth.split(''T'')[0].split(''-'');',
'        let y = dob[0];',
'        let m = dob[1];',
'        let d = dob[2];',
'        dob = d + "/" + m + "/" + y;',
'        if (!d && !m) dob = "";',
'        apex.item( "P120_C_BIRTHDAY" ).setValue(dob); //suspect.identity.dateOfBirth);',
'    }',
'    apex.item( "P120_C_PLACE_OF_BIRTH" ).setValue(suspect.identity.placeOfBirth);',
'    ',
'    apex.item( "P120_C_NOTICE" ).setValue(suspect.notice);',
'    ',
'    //apex.item( "P120_C_AUTHORITY_TMP" ).setValue(suspect.authority);',
'    setSelectList("P120_C_AUTHORITY_TMP", suspect.authority);',
'    ',
'    //apex.item( "P120_C_CONTACT_REQUIRED" ).setValue(suspect.contactRequired);',
'    ',
'    //apex.item( "P120_C_REASON_TMP" ).setValue(suspect.reason);',
'    setSelectList("P120_C_REASON_TMP", suspect.reason);',
'    ',
'    apex.item( "P120_C_CASE_NO" ).setValue(suspect.caseNumber);',
'    ',
'    //apex.item( "P120_C_CASE_TYPE_TMP" ).setValue(suspect.caseType);',
'    setSelectList("P120_C_CASE_TYPE_TMP", suspect.caseType);',
'',
'    //apex.item( "P120_C_ENTRY_DATE" ).setValue(details.entryDate);',
'    apex.item( "P120_C_PASSPORT_NUMBER" ).setValue(identity.travelDoc.passportNumber);',
'    //apex.item( "P120_C_ARRIVAL_DATE" ).setValue(details.arrivalDate);',
'    ',
'    //new',
'    //apex.item( "P120_C_CONTACT_OWNER_DATA_TMP" ).setValue(suspect.contactOwnerData);',
'    setSelectList("P120_C_CONTACT_OWNER_DATA_TMP", suspect.contactOwnerData);',
'    ',
'    apex.item( "P120_C_WARRANT_NUMBER" ).setValue(suspect.arrestedWarrantNumber);',
'    apex.item( "P120_C_URGENT_CONTACT" ).setValue(suspect.urgentContact);',
'    ',
'    //apex.item( "P120_C_ACTION_CODE_TMP" ).setValue(suspect.actionCode);',
'    setSelectList("P120_C_ACTION_CODE_TMP", suspect.actionCode);',
'    ',
'    apex.item( "P120_C_CONTACT_TELEPHONE_NO" ).setValue(suspect.contactTelephoneNumber);',
'    //apex.item( "P120_C_ENTRY_DATE" ).setValue(suspect.P120_C_ENTRY_DATE);',
'    apex.item( "P120_C_TRAVEL_PERMIT_FROM" ).setValue(suspect.travelPermitFrom);',
'    apex.item( "P120_C_OSTAY_TM6" ).setValue(suspect.ostayTM6);',
'    apex.item( "P120_C_REFERENCE_DOCUMENT" ).setValue(suspect.referenceDocument);',
'    ',
'    let body_hw = "";',
'    console.log("suspect.identity.bodyHeight" + suspect.identity.bodyHeight); console.log("suspect.identity.bodyWeight" + suspect.identity.bodyWeight);',
'    if (suspect.identity.bodyHeight != null) {body_hw = "สูง " + suspect.identity.bodyHeight;}',
'    if (suspect.identity.bodyWeight != null) {body_hw = body_hw + " หนัก " + suspect.identity.bodyWeight;}',
'    if (!!body_hw) {apex.item( "P120_C_BODY_HEIGHT_WEIGHT" ).setValue(body_hw);}',
'    ',
'    if(biometric.faces && biometric.faces.length > 0 && biometric.faces[0].image.guid) {',
'        //$(''.candidate-photo .FaceItem'').FaceItem(''urlToModel'', ''/image/''+biometric.faces[0].image.guid);',
'        setFaceItem(biometric.faces[0]);',
'        selectedFaceIdx = 0;',
'    }',
'    else {',
'        $(''.candidate-photo .FaceItem'').FaceItem(''update'', {',
'            "Position": {',
'                "ordinal": 1,',
'                "name": "Portrait"',
'            }',
'        });                                      ',
'   }',
'    ',
'    if (biometric.faces.length > 1) {',
'        $("#PreviousImage, #NextImage").prop("disabled", false).show();',
'        if (selectedFaceIdx === 0) $(''#PreviousImage'').prop("disabled", true);',
'        if (selectedFaceIdx === biometric.faces.length - 1) $(''#NextImage'').prop("disabled", true);',
'    }',
'    else {',
'        $(''#PreviousImage, #NextImage'').hide();',
'    }',
'    ',
'    setDefaultDetails();',
'}',
'',
'function setFaceItem(pData) {',
'	$(''.candidate-photo .FaceItem'').FaceItem(''urlToModel'', ''/image/'' + pData.image.guid);',
'}',
'',
'function showTimeoutMessage(regionId, timeoutSeconds) {',
'	var reg = $("#" + regionId);',
'	var cnt = reg.find(".countdown");',
'	if (cnt.length == 0) {',
'		reg.append(''<span class="countdown"></span>'');',
'		cnt = reg.find(".countdown");',
'	}',
'	reg.show();',
'	var showCountdown = function() {',
'		cnt.text(timeoutSeconds);',
'	}',
'	var counter = function() {',
'		timeoutSeconds -= 1;',
'		showCountdown();',
'		if (timeoutSeconds < 1) {',
'			window.clearInterval(timer);',
'			reg.hide();',
'		}',
'	}',
'	showCountdown();',
'	var timer = window.setInterval(counter, 1000);',
'}',
'',
'function loadImage(p_img, p_img_name, p_item_id) {',
'    var formData = new FormData(), binary = window.atob(p_img), array = new Uint8Array(binary.length), v_guid;',
'    ',
'    for (var i = 0; i < binary.length; i++) {',
'        array[i] = binary.charCodeAt(i)',
'    }',
'    ',
'    var blob = new Blob([array]);',
'    if (!p_img_name) p_img_name = "img_" + (new Date()).toIsoDateStringShort() + "-" + (new Date()).getTime();',
'    formData.append(''name'', p_img_name);',
'    formData.append("webmasterfile", blob);',
'    ',
'    $.ajax({',
'        url : "/image",',
'        async: false,',
'        data: formData,',
'        type: "POST",',
'        contentType : false,',
'        processData : false,',
'        cache : false,',
'        dataType : "json",',
'        error : function(err) {',
'            console.error(err);',
'        },',
'        success : function(data) {',
'            console.log(data);',
'            console.log("data.id: " + data.id);',
'            v_guid = data.id;',
'            console.log("v_guid: " + v_guid);',
'            console.log("setting value for " + p_item_id);',
'            $("#"+p_item_id).val(v_guid);',
'        },',
'        complete : function() {',
'            console.log("Request finished.");',
'        }',
'    });',
'}',
'',
'function getEmptyJSON() {',
'    let jEmptyObj = {};',
'    jEmptyObj.faces = [];',
'    jEmptyObj.fingerprints = [];',
'    return jEmptyObj;',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#PreviousCase, #NextCase'').hide();',
'',
'$("#SearchResult").on("gridpagechange", function(event, ui) {',
'    var view = apex.region("SearchResult").widget().interactiveGrid("getCurrentView");',
'	if ( view.supports.selection ) {',
'		if (( !view.getSelectedRecords() || view.getSelectedRecords().length === 0 ) && ($("#P120_C_RECORD_NO").val() == "")) {',
'			console.log("IG gridpagechange" + $("#P120_C_RECORD_NO").val());',
'            setTimeout(function() {',
'				$("#SearchResult").find("td.a-GV-cell.u-tC").first().trigger("click");',
'			}, 0);',
'		}',
'	}',
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
'#BogusButton {',
'    display:none;',
'}',
'',
'',
'',
'',
'',
'',
'.a-GV-table .a-GV-cell {',
'    padding-top: 0;',
'    padding-bottom: 0;',
'}',
'',
'tr.a-GV-row.is-readonly {',
'    cursor: pointer;',
'}',
'',
'.countdown {',
'    position: absolute;',
'	    right: 1em;',
'	    top: 50%;',
'	    transform: translateY(-50%);',
'	    font-size: 1.2em;',
'}',
'',
'.cl-hidden {',
'    display: none;',
'}',
'',
'.PreviousImage,',
'.NextImage {',
'    position: absolute; ',
'    top: 50%; ',
'    opacity: .3;',
'    display: none;',
'    z-index: 100;',
'}',
'',
'.PreviousImage {',
'    left: 1%;',
'}',
'',
'.NextImage {',
'    right: 1%;',
'}',
'',
'.PreviousImage:hover,',
'.NextImage:hover {',
'    opacity: 1;',
'}',
'',
'.cl-mask-lang-disp.cl-mask-lang-en:before {',
'    content: "en";',
'}',
'',
'.cl-mask-lang-disp.cl-mask-lang-th:before {',
'    content: "th";',
'}',
'',
'.t-HeroRegion.alert span.t-HeroRegion-icon {',
'    background: #cc0000;',
'    width: 52px;',
'    height: 52px;',
'    line-height: 5.2rem;',
'    margin-right: 10px;',
'    animation: alert-color-fade 1s linear infinite;',
'}',
'',
'.t-HeroRegion.alert .t-HeroRegion-title {',
'    font-size: 3rem;',
'    color: #cc0000;',
'    text-align: center;',
'    margin-left: -5rem;',
'}',
'',
'.cl-icpo-case-type-info {',
'    color: #cc0000;',
'    text-align: center;',
'}',
'',
'.icpo_logo_bg {',
'    background: url("#APP_IMAGES#ICPO_logo_small.png") no-repeat bottom;',
'    background-size: 150px 150px;',
'    min-height: 220px;',
'}',
'',
'@keyframes alert-color-fade {',
'    0% {',
'        background-color: #cc0000;',
'    }',
'    50% {',
'        background-color: transparent;',
'    }',
'    100% {',
'        background-color: #cc0000;',
'    }',
'}',
'',
'input.cl-display-only[type="text"],',
'textarea.cl-display-only {',
'    border: none !important;',
'    background: none !important;',
'    font-weight: bold !important;',
'}',
'',
'.cl-red {',
'    color: red !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'96%'
,p_dialog_css_classes=>'no-close cl-page-bl-result-120'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190721032802'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25022140095681822)
,p_plug_name=>'REG_HIDDEN'
,p_region_name=>'REG_HIDDEN'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(133528353357270523)
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
 p_id=>wwv_flow_api.id(143375860011028939)
,p_plug_name=>'Reason'
,p_region_name=>'dialogBLReason'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25022844554681829)
,p_plug_name=>'Login Failed'
,p_region_name=>'REG_ALERT_LOGIN_FAILED'
,p_parent_plug_id=>wwv_flow_api.id(143375860011028939)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning:margin-left-sm:margin-right-sm'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25022997021681830)
,p_plug_name=>'Login'
,p_parent_plug_id=>wwv_flow_api.id(143375860011028939)
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(133507034317854550)
,p_plug_name=>'Remark Buttons'
,p_parent_plug_id=>wwv_flow_api.id(25022997021681830)
,p_region_css_classes=>'region-show-dialog-button'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'no-padding'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(136082800632881302)
,p_plug_name=>'Remark Field'
,p_parent_plug_id=>wwv_flow_api.id(25022997021681830)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(164535653695117949)
,p_plug_name=>'ICPOContainer'
,p_region_name=>'ICPOContainer'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P120_ICPO_INCIDENT_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(164535763084117950)
,p_plug_name=>'Warning!'
,p_region_name=>'ICPOWarning'
,p_parent_plug_id=>wwv_flow_api.id(164535653695117949)
,p_region_css_classes=>'alert'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168298482926934101)
,p_plug_name=>'Display Items'
,p_parent_plug_id=>wwv_flow_api.id(164535653695117949)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:t-Form--xlarge:t-Form--stretchInputs'
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
 p_id=>wwv_flow_api.id(168298793485934104)
,p_plug_name=>'Type Info : SLTD (Lost Passport)'
,p_parent_plug_id=>wwv_flow_api.id(164535653695117949)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="cl-icpo-case-type-info">',
'<h2>Found Lost Passport</h2>',
'<h3>Reported as robbery from Interpol (I-24/7)</h3>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168298824222934105)
,p_plug_name=>'logo'
,p_parent_plug_id=>wwv_flow_api.id(164535653695117949)
,p_region_css_classes=>'icpo_logo_bg'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(245075586763644745)
,p_plug_name=>'BlacklistContainer'
,p_region_name=>'BlacklistContainer'
,p_region_css_classes=>'result-container'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217527051303304547)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(245075586763644745)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
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
 p_id=>wwv_flow_api.id(217526920058304546)
,p_plug_name=>'Request'
,p_parent_plug_id=>wwv_flow_api.id(217527051303304547)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
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
 p_id=>wwv_flow_api.id(222529617115384645)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(217526920058304546)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
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
 p_id=>wwv_flow_api.id(245075737993644746)
,p_plug_name=>'FacePhoto'
,p_parent_plug_id=>wwv_flow_api.id(217526920058304546)
,p_region_css_classes=>'region-100 too-small-for-overlay request-photo'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217527144550304548)
,p_plug_name=>'Candidate'
,p_parent_plug_id=>wwv_flow_api.id(217527051303304547)
,p_region_css_classes=>'too-small-for-overlay'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:margin-bottom-none:margin-left-none'
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
 p_id=>wwv_flow_api.id(222529730491384646)
,p_plug_name=>'Candidate-Face'
,p_parent_plug_id=>wwv_flow_api.id(217527144550304548)
,p_region_css_classes=>'region-100 too-small-for-overlay candidate-photo'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--removeHeader:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
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
 p_id=>wwv_flow_api.id(222529826659384647)
,p_plug_name=>'Candidate-Data'
,p_parent_plug_id=>wwv_flow_api.id(217527144550304548)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
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
 p_id=>wwv_flow_api.id(4686926468286369010)
,p_plug_name=>'BBS Case Details Link'
,p_parent_plug_id=>wwv_flow_api.id(217527144550304548)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
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
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(245075828612644747)
,p_plug_name=>'Result'
,p_region_name=>'SearchResult'
,p_parent_plug_id=>wwv_flow_api.id(245075586763644745)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'   -----------------',
'   jt.id',
'   , jt.imageguid',
'   , jt.firstname',
'   , jt.lastname',
'   , jt.middlename',
'   , jt.firstnameThai',
'   , jt.surnameThai',
'   , jt.middlenameThai',
'   , jt.nationality',
'   , DECODE(SUBSTR(jt.sex, 1, 1), ''F'', ''FEMALE'', ''M'', ''MALE'', jt.sex) SEX',
'   , jt.dateOfBirth',
'   , jt.demographicMatch',
'   , jt.biometricMatch',
'   , TO_NUMBER(jt.sortingScore) AS sortingScore',
'   , jt.demographicScore',
'   , jt.biometricScore',
'   -----------------',
'   , (SELECT',
'    coalesce(max( ''/image/''||image_id||''?width=450'' ) ,''#WORKSPACE_IMAGES#template_photo.png'') as image FROM',
'    faces f',
'    INNER JOIN biometrics b ON f.biometric_id = b.id',
'    INNER JOIN blacklist_cases c ON b.blacklist_case_id = c.id',
'    INNER JOIN blacklist_case_identities ci ON c.id = ci.blacklist_case where ci.identity = jt.ID ) as image',
'    -----------------',
'   ,case   when ( demographicMatch  = ''true'' and   biometricMatch = ''true''  ) then ''biometric and demographic'' when biometricMatch = ''true''  then ''biometric''',
'          else ''demographic''',
'       end type',
'    -----------------',
'    , case when length(dateofbirth) > 0 then SUBSTR(dateOfBirth, 9, 2) || ''/'' || SUBSTR(dateOfBirth, 6, 2) || ''/'' || SUBSTR(dateOfBirth, 1, 4) /*to_date(SUBSTR(dateOfBirth, 1, 10), ''YYYY-MM-DD'')*/ else null end as date_of_birth',
'    --   ,  to_char(date_of_birth ,''YYYY-MM-DD'') as "Date of Birth"',
'    -----------------',
'    , DECODE(',
'        jt.id',
'        , :P120_LAST_BL_APPROVED_IDENTITY, ''<span id="id-span-mark-bl-approve-'' || jt.id || ''" class="t-Icon fa fa-dot-circle-o cl-span-mark-bl-approve" aria-hidden="true" title="Click to Un-mark" data-identity="'' || jt.id || ''" data-marked-status="Y'
||'"></span>''',
'        , ''<span id="id-span-mark-bl-approve-'' || jt.id || ''" class="t-Icon fa fa-circle-o cl-span-mark-bl-approve" aria-hidden="true" title="Click to Mark" data-identity="'' || jt.id || ''" data-marked-status="N"></span>''',
'    ) SELECT_TO_APPROVE_ICON',
'    -----------------',
'FROM ',
'    (',
'        SELECT ',
'            c001 AS ID,',
'            c002 AS imageGuid,',
'            c003 AS firstname,',
'            c004 AS lastname,',
'            c005 AS nationality,',
'            c006 AS sex,',
'            c007 AS dateOfBirth,',
'            c008 AS demographicMatch,',
'            c009 AS biometricMatch,',
'            c010 AS sortingScore,',
'            c011 AS demographicScore,',
'            c012 AS biometricScore,',
'            c013 AS middlename,',
'            c014 AS firstnameThai,',
'            c015 AS surnameThai,',
'            c016 AS middlenameThai',
'        FROM APEX_collections',
'        WHERE collection_name = ''COLL_WS_RESULT_IG''',
'    ) jt ',
'    JOIN blacklist_case_identities ci ON ci.identity = jt.ID ',
'    JOIN blacklist_cases bc ON bc.id = ci.blacklist_case AND bc.is_active = ''Y''',
'    JOIN dl_blacklist.identities i ON i.key_value = ci.identity and i.is_active = ''Y''',
'    LEFT JOIN dl_blacklist.travel_docs d on d.identity = ci.identity',
'WHERE ',
'    NVL(bc.reason, ''~'') != ''76'' -- 76: LOST PASSPORT',
'    OR ',
'    (',
'        bc.reason = ''76'' ',
'        AND ',
'        (d.doc_number = :P17_DISPLAY_DOCNUMBER or INSTR(i.notice, :P17_DISPLAY_DOCNUMBER) > 0)',
'    )'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6937984158734840)
,p_name=>'MIDDLENAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MIDDLENAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Middlename'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(25023876191681839)
,p_name=>'SELECT_TO_APPROVE_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELECT_TO_APPROVE_ICON'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Select'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(133526595740270505)
,p_name=>'SORTINGSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SORTINGSCORE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sortingscore'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>2048
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(133526679219270506)
,p_name=>'DATEOFBIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATEOFBIRTH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_format_mask=>'DD/MM/YYYY'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(133528547499270525)
,p_name=>'DEMOGRAPHICSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEMOGRAPHICSCORE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Demographicscore'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(175131990110966705)
,p_name=>'FIRSTNAMETHAI'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIRSTNAMETHAI'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Firstname Thai'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(175132029934966706)
,p_name=>'SURNAMETHAI'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SURNAMETHAI'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Surname Thai'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(175132107337966707)
,p_name=>'MIDDLENAMETHAI'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MIDDLENAMETHAI'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Middlename Thai'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(225299825615644870)
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
 p_id=>wwv_flow_api.id(225299862554644871)
,p_name=>'IMAGEGUID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGEGUID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(225300000609644872)
,p_name=>'FIRSTNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIRSTNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Firstname'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(227482279685305324)
,p_name=>'LASTNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LASTNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Lastname'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(227482495064305326)
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
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(227482619146305327)
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
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(227482851126305329)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Image'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(227482908941305330)
,p_name=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
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
 p_id=>wwv_flow_api.id(227483299799305334)
,p_name=>'BIOMETRICSCORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BIOMETRICSCORE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Biometricscore'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(227483423898305335)
,p_name=>'DEMOGRAPHICMATCH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEMOGRAPHICMATCH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Demographicmatch'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(227483502835305336)
,p_name=>'BIOMETRICMATCH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BIOMETRICMATCH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Biometricmatch'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(227483637616305337)
,p_name=>'DATE_OF_BIRTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_OF_BIRTH'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Date of birth'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>34
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
 p_id=>wwv_flow_api.id(225299684874644869)
,p_internal_uid=>69530143081639374
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_max_row_count=>100000
,p_show_nulls_as=>'-'
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(227488255446306312)
,p_interactive_grid_id=>wwv_flow_api.id(225299684874644869)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(227488292621306314)
,p_report_id=>wwv_flow_api.id(227488255446306312)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23994519653011333)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(6937984158734840)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(39539633456350821)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(25023876191681839)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134020409059395202)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(133526595740270505)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(134020802698395267)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(133526679219270506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(137576209088651356)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(133528547499270525)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(178875929972220303)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(175131990110966705)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(178876471075220314)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(175132029934966706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(178876994750220315)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(175132107337966707)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227488836337306325)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(225299825615644870)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227489296384306346)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(225299862554644871)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227489833842306355)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(225300000609644872)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227490668598306375)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(227482279685305324)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227491668000306391)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(227482495064305326)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227492176350306399)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(227482619146305327)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227493197021306414)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(227482851126305329)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227493664760306421)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(227482908941305330)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227861628104968911)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(227483299799305334)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227899840555169149)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(227483423898305335)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227900301743169166)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(227483502835305336)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(227936503157256265)
,p_view_id=>wwv_flow_api.id(227488292621306314)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(227483637616305337)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40191173004171102)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(133528353357270523)
,p_button_name=>'P120_BTN_BL_CLOSE'
,p_button_static_id=>'P120_BTN_BL_CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P120_BL_INCIDENT_ID IS NOT NULL',
'AND :P120_LAST_BL_ACTION IN (''A'', ''C'')'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-arrow-circle-o-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(168301335332934130)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(168298824222934105)
,p_button_name=>'P120_BTN_ICPO_EXT_LINK'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Search for more information'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:window.open(''http://i247.i'', ''wBmBSICPO_EXT'');'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25021761319681818)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(133528353357270523)
,p_button_name=>'P120_BTN_BL_CANCEL'
,p_button_static_id=>'P120_BTN_BL_CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel this Action'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95830189223545118)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(222529730491384646)
,p_button_name=>'PreviousImage'
,p_button_static_id=>'PreviousImage'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_image_alt=>'PreviousImage'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'PreviousImage'
,p_icon_css_classes=>'fa-chevron-circle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25021844895681819)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(133528353357270523)
,p_button_name=>'P120_BTN_BL_APPROVE'
,p_button_static_id=>'P120_BTN_BL_APPROVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Approve this Action'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-key'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95830069753545117)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(222529730491384646)
,p_button_name=>'NextImage'
,p_button_static_id=>'NextImage'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_image_alt=>'NextImage'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'NextImage'
,p_icon_css_classes=>'fa-chevron-circle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(133506959675854549)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(133507034317854550)
,p_button_name=>'P120_TOGGLE_REMARK_LANG'
,p_button_static_id=>'P120_TOGGLE_REMARK_LANG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Toggle Remark Language'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-layout-blank cl-mask-lang-disp cl-mask-lang-en'
,p_button_cattributes=>'tabindex="-1" style="margin-top: 3rem;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4686926576098369011)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4686926468286369010)
,p_button_name=>'P120_BTN_VIEW_CASE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'View Case Details'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100347629229312136)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(143375860011028939)
,p_button_name=>'P120_SUBMIT_REASON'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(152673472352483376)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(217526920058304546)
,p_button_name=>'BogusButton'
,p_button_static_id=>'BogusButton'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Bogusbutton'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(192202196092436013)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(217527144550304548)
,p_button_name=>'NextCase'
,p_button_static_id=>'NextCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next Case'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(192202573050436017)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(217527144550304548)
,p_button_name=>'PreviousCase'
,p_button_static_id=>'PreviousCase'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Previous Case'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6937860813734839)
,p_name=>'P120_C_MIDDLE_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Middlename :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6938071809734841)
,p_name=>'P120_R_MIDDLENAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Middlename :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25022231206681823)
,p_name=>'P120_BL_INCIDENT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25022432607681825)
,p_name=>'P120_SUPERVISOR_LOGIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25022997021681830)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Supervisor Login:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' l_count number;',
'begin',
'  ',
'  select Count(*)',
'  into l_count',
'  from user_management.role_object_grant_rel rogr',
'  join USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'  join user_management.users u on u.id = user_id',
'  join user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'  where u.username = upper(:APP_USER)',
'  and urr.role_id = ''BMBS_SUP''',
'  ;',
'  ',
'  if l_count > 0 then',
'    return false;',
'  else',
'    return true;',
'  end if;',
'  ',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(563841469540049626)
,p_item_template_options=>'#DEFAULT#:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25022550282681826)
,p_name=>'P120_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(25022997021681830)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Supervisor Password:'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>60
,p_cMaxlength=>4000
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' l_count number;',
'begin',
'  ',
'  select Count(*)',
'  into l_count',
'  from user_management.role_object_grant_rel rogr',
'  join USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'  join user_management.users u on u.id = user_id',
'  join user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'  where u.username = upper(:APP_USER)',
'  and urr.role_id = ''BMBS_SUP''',
'  ;',
'  ',
'  if l_count > 0 then',
'    return false;',
'  else',
'    return true;',
'  end if;',
'  ',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(563841469540049626)
,p_item_template_options=>'#DEFAULT#:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25022621075681827)
,p_name=>'P120_IS_AUTHENTICATED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25023094504681831)
,p_name=>'P120_BL_ACTION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25023137021681832)
,p_name=>'P120_BL_ACTION_DISPLAY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25022997021681830)
,p_prompt=>'Action: '
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Approve;A,Cancel;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25023621463681837)
,p_name=>'P120_BL_APPROVED_IDENTITY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25024873841681849)
,p_name=>'P120_LAST_BL_ACTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25024908247681850)
,p_name=>'P120_LAST_BL_APPROVED_IDENTITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61494302576943839)
,p_name=>'P120_BL_APP_ID_FACE_SAVED'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61494646767943842)
,p_name=>'P120_BL_APP_ID_FINGER_SAVED'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61494989368943845)
,p_name=>'P120_UPLOADED_FACE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61495096589943846)
,p_name=>'P120_UPLOADED_FINGER_1'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61495121082943847)
,p_name=>'P120_UPLOADED_FINGER_2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61495241730943848)
,p_name=>'P120_UPLOADED_FINGER_3'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61495337517943849)
,p_name=>'P120_UPLOADED_FINGER_4'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61495482524943850)
,p_name=>'P120_UPLOADED_FINGER_5'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65870048534818418)
,p_name=>'P120_C_NOTICE'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Notice :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77498327146035001)
,p_name=>'P120_UPLOADED_FINGER_6'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77498419873035002)
,p_name=>'P120_UPLOADED_FINGER_7'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77498595751035003)
,p_name=>'P120_UPLOADED_FINGER_8'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77498603428035004)
,p_name=>'P120_UPLOADED_FINGER_9'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77498790989035005)
,p_name=>'P120_UPLOADED_FINGER_10'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77498825257035006)
,p_name=>'P120_BIOMETRIC_JSON'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77499339905035011)
,p_name=>'P120_BIOMETRIC_JSON_ORIG'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77499411233035012)
,p_name=>'P120_BL_APPROVED_CASE_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77499527682035013)
,p_name=>'P120_LAST_BL_APPROVED_CASE_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77499675860035014)
,p_name=>'P120_LAST_BIOMETRIC_JSON'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77499863724035016)
,p_name=>'P120_LAST_BL_APP_FACE_SAVED'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77499904571035017)
,p_name=>'P120_LAST_BL_APP_FINGER_SAVED'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88123335717688524)
,p_name=>'P120_C_LAST_NAME_THAI'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'SurnameTH :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88123452941688525)
,p_name=>'P120_C_FIRST_NAME_THAI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'FirstnameTH :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88123583938688526)
,p_name=>'P120_C_MIDDLE_NAME_THAI'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'MiddlenameTH :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88123693932688527)
,p_name=>'P120_C_AUTHORITY'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Authority :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88123718297688528)
,p_name=>'P120_C_CONTACT_OWNER_DATA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Owner Contact :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88123819605688529)
,p_name=>'P120_C_WARRANT_NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Warrant Number :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88123956195688530)
,p_name=>'P120_C_URGENT_CONTACT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Urgent Contact :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88124012286688531)
,p_name=>'P120_C_ACTION_CODE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Action Code :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88124143978688532)
,p_name=>'P120_C_REASON_TMP'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Reason Temp:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_REASON_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'FROM dl_common.reason_codes$lc',
'WHERE is_active = ''Y'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88124206679688533)
,p_name=>'P120_C_CONTACT_TELEPHONE_NO'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Phone Contact :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88124302530688534)
,p_name=>'P120_C_ENTRY_DATE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Date Saved :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88124454982688535)
,p_name=>'P120_C_TRAVEL_PERMIT_FROM'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Travel Permit From :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88124555091688536)
,p_name=>'P120_C_OSTAY_TM6'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'TM6 :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88124608373688537)
,p_name=>'P120_C_CASE_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Case Number :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88124781917688538)
,p_name=>'P120_R_STATELESS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Nationality :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88125004233688541)
,p_name=>'P120_C_REASON'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Reason :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95829500865545112)
,p_name=>'P120_C_CASE_TYPE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Case Type :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100348480339312141)
,p_name=>'P120_REASON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(136082800632881302)
,p_prompt=>'Reason for Action: '
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cMaxlength=>1000
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
 p_id=>wwv_flow_api.id(111342153852156015)
,p_name=>'P120_C_CASE_TYPE_TMP'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Case Type Temp :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_CASES_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(display_value, display_value$dlc) d, key_value r',
'FROM dl_common.case_types$lc',
'WHERE is_active = ''Y''',
'ORDER BY display_order ASC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111342426764156018)
,p_name=>'P120_ALLOW_PASS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(25022997021681830)
,p_prompt=>'Allow Pass:'
,p_source=>'P120_LAST_ALLOW_PASS'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'YES_NO_ALFA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    dl_common.yes_nos$lc',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(563841353128049626)
,p_item_template_options=>'#DEFAULT#:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111342508038156019)
,p_name=>'P120_LAST_ALLOW_PASS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(168298532871934102)
,p_name=>'P120_ICPO_PASSPORT_NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(168298482926934101)
,p_prompt=>'Passport No. :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'cl-display-only'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(168298639113934103)
,p_name=>'P120_ICPO_NATIONALITY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(168298482926934101)
,p_prompt=>'Nationality :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'cl-display-only'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>5
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(168299084838934107)
,p_name=>'P120_ICPO_INCIDENT_ID'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(25022140095681822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(168301097510934127)
,p_name=>'P120_C_ACTION_CODE_TMP'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Action Code :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_ACTION_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(DISPLAY_VALUE, DISPLAY_VALUE$dlc),',
'       KEY_VALUE',
'  from dl_common.action_codes$LC',
'  where is_active = ''Y''',
' order by DISPLAY_ORDER ASC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192198419454435982)
,p_name=>'P120_R_SURNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Surname :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192198779657435996)
,p_name=>'P120_R_FIRSTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Firstname :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192199216472435997)
,p_name=>'P120_R_SEX'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Gender :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192199589107435998)
,p_name=>'P120_R_NATIONALITY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Issuing Country :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192199981694435999)
,p_name=>'P120_R_PASSPORT_NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Passport No :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192200369177436000)
,p_name=>'P120_DATE_OF_BIRTH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Birthday :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192200835803436001)
,p_name=>'P120_R_PLACE_OF_BIRTH'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Place of Birth :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'cl-display-only'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192201522137436007)
,p_name=>'P120_PHOTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(245075737993644746)
,p_prompt=>'Photo'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_attribute_10=>'/image'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192203280295436019)
,p_name=>'P120_PHOTO_CANDIDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(222529730491384646)
,p_prompt=>'Photo candidate'
,p_display_as=>'PLUGIN_COM.DERMALOG.FACEITEM'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_attribute_10=>'/image'
,p_attribute_12=>'Y'
,p_attribute_13=>'Y'
,p_attribute_14=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192203983769436022)
,p_name=>'P120_C_RECORD_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192204343823436023)
,p_name=>'P120_C_LAST_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Surname :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192204784941436024)
,p_name=>'P120_C_FIRST_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Firstname :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192205188533436025)
,p_name=>'P120_C_GENDER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Gender :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192205559108436026)
,p_name=>'P120_C_NATIONALITY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Nationality :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192206015638436026)
,p_name=>'P120_C_PASSPORT_NUMBER'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Passport Number :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192206342800436027)
,p_name=>'P120_C_BIRTHDAY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Birthday :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192206725550436028)
,p_name=>'P120_C_PLACE_OF_BIRTH'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Place of Birth :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192207043116436029)
,p_name=>'P120_C_BEHAVIOUR'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Behaviour :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val cl-red'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192207490164436030)
,p_name=>'P120_C_LEVEL_OF_CONFIDENTIALITY'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Confidentiality Level :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192207914436436030)
,p_name=>'P120_C_NEXT_STEPS'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Next Steps :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192208306637436031)
,p_name=>'P120_CASE_ID'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686925623669369002)
,p_name=>'P120_R_SURNAME_THAI'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Thai Surname :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_grid_column_css_classes=>'cl-r-thai-fields cl-hidden'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686925775164369003)
,p_name=>'P120_R_FIRSTNAME_THAI'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Thai Firstname :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_grid_column_css_classes=>'cl-r-thai-fields cl-hidden'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686925804581369004)
,p_name=>'P120_R_CITIZEN_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Thai Citizen ID :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>6
,p_grid_column_css_classes=>'cl-r-thai-fields cl-hidden'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686925972796369005)
,p_name=>'P120_C_LEVEL_OF_CONF_TMP'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Confidentiality Level Temp :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SECRET_LEVELS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT key_value || ''-'' || NVL(display_value, display_value$dlc) DISPLAY_VALUE,',
'       key_value',
'FROM dl_common.secret_levels$lc',
'WHERE is_active = ''Y''',
'ORDER BY display_order ASC'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686926272773369008)
,p_name=>'P120_C_REFERENCE_DOCUMENT'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Reference Document :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686926341624369009)
,p_name=>'P120_C_BODY_HEIGHT_WEIGHT'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Body height/weight :'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'cl-set-default-val'
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686926610499369012)
,p_name=>'P120_REDIRECT_CASE_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4686926468286369010)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686927155736369017)
,p_name=>'P120_C_AUTHORITY_TMP'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Authority Temp :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_BLACKLIST_AUTHORITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT orgnm d, orgcd r',
'FROM dl_bordercontrol.v_policorganize',
'UNION ALL',
'SELECT deptabbfmt1 d, TO_CHAR(dept_seqno) r ',
'FROM dl_bordercontrol.v_department',
'ORDER BY 2;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686927432628369020)
,p_name=>'P120_C_CONTACT_OWNER_DATA_TMP'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Owner Contact Temp :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_AGCCONTACT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT agccontnm d, agccontcd r',
'FROM dl_bordercontrol.v_agccontact',
'ORDER BY 2;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686927733273369023)
,p_name=>'P120_C_BEHAVIOUR_TMP'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Behaviour Temp :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_OPERATIONREF'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT opercd || ''-'' || operref d, opercd r',
'FROM dl_bordercontrol.v_operationref',
'ORDER BY 2;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686928877610369034)
,p_name=>'P120_C_NATIONALITY_TMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
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
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686929152229369037)
,p_name=>'P120_C_GENDER_TMP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(222529826659384647)
,p_prompt=>'Gender Temp :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686929455140369040)
,p_name=>'P120_R_SEX_TMP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(222529617115384645)
,p_prompt=>'Gender Temp:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192209900391436080)
,p_name=>'SetFacePhoto'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192210438654436084)
,p_event_id=>wwv_flow_api.id(192209900391436080)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!parent.buildBiometricIdentity) {',
'    parent.$(''.FaceItem'').each(function(i, el){ ',
'        var model = parent.$(this).FaceItem(''broadcast'');',
'        if($(''.request-photo .FaceItem'').length && (model.has(''ImageGuid'') || model.has(''ImageUrl''))){',
'            $(''.request-photo .FaceItem'').FaceItem(''urlToModel'', model.getImageURL());',
'        }',
'    });',
'} else {',
'    var bio = parent.buildBiometricIdentity(''Y'', ''Y'') || {};',
'    resetDetails();',
'    //debugger;',
'    var face = (bio.faces && bio.faces.length > 0) ? "data:image/jpeg;base64," + bio.faces[0].image.data : "";',
'    /*$(''.request-photo .FaceItem'').FaceItem(''base64ToModel'', "data:image/jpeg;base64,abcdabcdabcd", 4);*/',
'    setTimeout(() => $(''.request-photo .FaceItem .fc-item-content'').removeClass("Portrait").css("background-image", "url(" + face + ")"), 1000);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192210784679436085)
,p_name=>'SearchCamunda'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(186862444423161707)
,p_event_id=>wwv_flow_api.id(192210784679436085)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (parent.getBlacklistSearchResults || parent.getBLDemographicSearchResults) {',
'    ',
'    let results_bio, results_demo;',
'    if (parent.getBlacklistSearchResults) results_bio = parent.getBlacklistSearchResults();',
'    if (parent.getBLDemographicSearchResults) results_demo = parent.getBLDemographicSearchResults();',
'    ',
'    console.log("BLACKLIST: results_bio:", results_bio);',
'    console.log("BLACKLIST DEMOGRAPHIC: results_demo:", results_demo);',
'    ',
'    $(''#SearchResult'').hide();',
'    ',
'    apex.server.process(',
'        "set_ws_result"',
'        , {',
'            p_clob_01: JSON.stringify(results_bio)',
'        }, {',
'            success: function(data) {',
'                apex.server.process(',
'                    "set_ws_result_demo"',
'                    , {',
'                        p_clob_01: JSON.stringify(results_demo)',
'                    }, {',
'                        success: function(data) {',
'                            $(''#SearchResult'').show();',
'                            apex.region("SearchResult").refresh();',
'                            $("tr.a-GV-row.is-readonly").first().find("td").first().trigger("click");',
'                        }, error: function(err) {',
'                            console.error(err);',
'                            $(''#SearchResult'').show();',
'                            apex.region("SearchResult").refresh();',
'                        }',
'                    }',
'                );',
'            }, error: function(err) {',
'                console.error(err);',
'                $(''#SearchResult'').show();',
'                apex.region("SearchResult").refresh();',
'            }',
'        }',
'    );',
'    ',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192211716247436088)
,p_name=>'ShowCandidateDetails'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'[data-blacklist-case-id] , .a-GV-row'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#SearchResult'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192212216631436091)
,p_event_id=>wwv_flow_api.id(192211716247436088)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var rowSpan = $(this.triggeringElement).find(''span[data-blacklist-case-id]'');',
'var blacklistID = $(this.triggeringElement).attr(''data-blacklist-case-id'') || rowSpan.attr(''data-blacklist-case-id'');',
'selectedBlacklistID = blacklistID;',
'console.log(blacklistID);',
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
'    if(data[0]) {',
'        setCaseDetails(data[0]); ',
'        selectedCaseIdx = 0;',
'    }',
'    if (data.length>1) {',
'        $(''#PreviousCase, #NextCase'').prop("disabled", false).show();',
'        if (selectedCaseIdx === 0) $(''#PreviousCase'').prop("disabled", true);',
'        if (selectedCaseIdx === data.length - 1) $(''#NextCase'').prop("disabled", true);',
'    }',
'    else {',
'        $(''#PreviousCase, #NextCase'').hide();',
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192213074177436093)
,p_name=>'SetFieldsFromScanPage'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192213564968436097)
,p_event_id=>wwv_flow_api.id(192213074177436093)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!parent.getBlacklistDemographicSearchValues) {',
'    var $topDatepicker = parent.$( ".datepicker").first();',
'    $( ".datepicker" ).datepicker( "option", "dateFormat", $topDatepicker.datepicker( "option", "dateFormat") );',
'    var classes = $topDatepicker.siblings(''button'').attr(''class'');',
'    $( ".datepicker" ).siblings(''button'').addClass(classes);',
'    var fields = parent.regionToJson(''.demographic-data'', true);',
'    parent._.mapObject(fields, (val, key)=>{',
'        if(key=='''') return;',
'        let $item = $(''[name*="_R_''+key+''"]'');',
'        if($item.is(''.datepicker'')){',
'            $item.datepicker( "setDate", (new Date(val)) );',
'        }',
'        else{',
'            apex.item($item.attr(''name'')).setValue(val);',
'        }',
'    })',
'} else {',
'    let values = parent.getBlacklistDemographicSearchValues();',
'    let sex = parseInt(values.sex), nat = values.nationality;',
'    //sex = (sex == 1) ? "MALE" : (sex == 2) ? "FEMALE" : "N/A";',
'    apex.item("P120_R_SURNAME").setValue(values.surname);',
'    apex.item("P120_R_FIRSTNAME").setValue(values.firstname || ''-'');',
'    apex.item("P120_R_MIDDLENAME").setValue(values.middlename || ''-'');',
'    if (parent.P17_DISPLAY_MIDDLENAME && parent.P17_DISPLAY_MIDDLENAME.value.length > 0) {',
'        apex.item("P120_R_MIDDLENAME").setValue(parent.P17_DISPLAY_MIDDLENAME.value);',
'        if (parent.P17_DISPLAY_FIRSTNAME) {',
'            apex.item("P120_R_FIRSTNAME").setValue(parent.P17_DISPLAY_FIRSTNAME.value);',
'        }',
'    }',
'    ',
'    //apex.item("P120_R_SEX").setValue(sex);',
'    setSelectList("P120_R_SEX_TMP", sex);',
'    ',
'    apex.item("P120_R_NATIONALITY").setValue(nat);',
'    apex.item("P120_R_STATELESS").setValue(nat);',
'    ',
'    // added for stateless',
'    let values2;',
'    if (parent.getBlacklistDemographicSearchValues2) {',
'        values2 = parent.getBlacklistDemographicSearchValues2();',
'        let nat2 = values2.nationality;',
'        if (nat2 != nat) {',
'            apex.item("P120_R_STATELESS").setValue(nat2);',
'        }',
'    }',
'    ',
'    apex.item("P120_R_PASSPORT_NUMBER").setValue(values.passportNumber);',
'    let dob = values.dateOfBirth.split(''T'')[0].split(''-'');',
'    let y = dob[0];',
'    let m = dob[1];',
'    let d = dob[2];',
'    dob = d + "/" + m + "/" + y;',
'    if (!d && !m) dob = "";',
'    apex.item("P120_DATE_OF_BIRTH").setValue(dob); //values.dateOfBirth);',
'    apex.item("P120_R_PLACE_OF_BIRTH").setValue("");//values.surname);',
'    let bio = parent.buildBiometricIdentity(''Y'', ''Y'');',
'    let face = bio.faces.length > 0 ? bio.faces[0].image.data : null;',
'    if (face) {',
'        //$(''.request-photo .FaceItem'').FaceItem(''base64ToModel'', ''data:image/jpg;base64,'' + face);',
'    }',
'    ',
'    //Thai fields',
'    if (nat == "THA") {',
'        $(".cl-r-thai-fields").removeClass("cl-hidden");',
'        apex.item("P120_R_SURNAME_THAI").setValue(values2.surnameThai);',
'        apex.item("P120_R_FIRSTNAME_THAI").setValue(values2.firstnameThai);',
'        apex.item("P120_R_CITIZEN_ID").setValue(values2.idCard);',
'    }',
'    ',
'    //icpo display fields',
'    apex.item("P120_ICPO_PASSPORT_NUMBER").setValue(values.passportNumber);',
'    apex.item("P120_ICPO_NATIONALITY").setValue(nat);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192214025480436098)
,p_name=>'TestCase - DELETE THIS'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192214476266436100)
,p_event_id=>wwv_flow_api.id(192214025480436098)
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
 p_id=>wwv_flow_api.id(65870123080818419)
,p_name=>'After Refresh Result List'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(245075828612644747)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65870236529818420)
,p_event_id=>wwv_flow_api.id(65870123080818419)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//debugger;',
'//$("td.a-GV-cell.u-tC").first().trigger("click");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65870582971818423)
,p_name=>'Close This Dialog'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'closeThisDialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95457075807695421)
,p_event_id=>wwv_flow_api.id(65870582971818423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT'');',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT_IG'');',
'END;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65870673873818424)
,p_event_id=>wwv_flow_api.id(65870582971818423)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95455497348695405)
,p_name=>'Blacklist Case ID change actions'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_RECORD_NO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95455586505695406)
,p_event_id=>wwv_flow_api.id(95455497348695405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    IF :P120_C_RECORD_NO IS NOT NULL THEN',
'        BEGIN',
'            SELECT ins_at',
'            INTO :P120_C_ENTRY_DATE',
'            FROM dl_blacklist.blacklist_cases',
'            WHERE id = :P120_C_RECORD_NO;',
'        EXCEPTION',
'            WHEN no_data_found THEN',
'                :P120_C_ENTRY_DATE := NULL;',
'        END;',
'    END IF;',
'',
'END;'))
,p_attribute_02=>'P120_C_RECORD_NO'
,p_attribute_03=>'P120_C_ENTRY_DATE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100362023010488266)
,p_name=>'P120_REASON: Activate Submit Button'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_REASON'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v("P120_REASON").trim().length > 0',
'&& ($v("P120_BL_ACTION") == "C" || ($v("P120_BL_ACTION") == "A" && $v("P120_ALLOW_PASS").length > 0))'))
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100362462972488268)
,p_event_id=>wwv_flow_api.id(100362023010488266)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(100347629229312136)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100362943617488268)
,p_event_id=>wwv_flow_api.id(100362023010488266)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(100347629229312136)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124428275730906103)
,p_name=>'P120_ALLOW_PASS: Activate Submit Button'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_ALLOW_PASS'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v("P120_REASON").trim().length > 0',
'&& ($v("P120_BL_ACTION") == "C" || ($v("P120_BL_ACTION") == "A" && $v("P120_ALLOW_PASS").length > 0))'))
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124428396469906104)
,p_event_id=>wwv_flow_api.id(124428275730906103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(100347629229312136)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124428499174906105)
,p_event_id=>wwv_flow_api.id(124428275730906103)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(100347629229312136)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95455870515695409)
,p_name=>'DA_SUBMIT_REASON'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(100347629229312136)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25022788442681828)
,p_event_id=>wwv_flow_api.id(95455870515695409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_authenticated    NUMBER := 0;',
'BEGIN',
'    ',
'    BEGIN',
'        -- supervisor does not need to login',
'        SELECT 1',
'        INTO l_authenticated',
'        FROM dual',
'        WHERE EXISTS ',
'        (',
'            SELECT 1',
'            FROM user_management.role_object_grant_rel rogr',
'            JOIN USER_MANAGEMENT.USER_ROLE_REL urr ON rogr.role_id = urr.role_id',
'            JOIN user_management.users u ON u.id = user_id',
'            JOIN user_management.OBJECT_GRANT_REL ogr ON ogr.id = rogr.OBJECT_GRANT_REL_ID',
'            WHERE u.username = UPPER(:APP_USER)',
'            AND urr.role_id = ''BMBS_SUP''',
'        );',
'    EXCEPTION ',
'        WHEN OTHERS THEN',
'            NULL;',
'    END;',
'    ',
'    BEGIN',
'        IF l_authenticated < 1 THEN',
'            -- Check password',
'            user_management.pkg_man_users.authenticate(:P120_SUPERVISOR_LOGIN, :P120_PASSWORD);',
'            -- Check permissions',
'            SELECT 1',
'            INTO l_authenticated',
'            FROM dual',
'            WHERE EXISTS ',
'            (',
'                SELECT 1',
'                FROM user_management.role_object_grant_rel rogr',
'                JOIN USER_MANAGEMENT.USER_ROLE_REL urr ON rogr.role_id = urr.role_id',
'                JOIN user_management.users u ON u.id = user_id',
'                JOIN user_management.OBJECT_GRANT_REL ogr ON ogr.id = rogr.OBJECT_GRANT_REL_ID',
'                WHERE u.username = UPPER(NVL(:P120_SUPERVISOR_LOGIN, :APP_USER))',
'                AND urr.role_id = ''BMBS_SUP''',
'            );',
'        END IF;',
'    EXCEPTION ',
'        WHEN OTHERS THEN',
'            NULL;',
'    END;',
'    ',
'    :P120_IS_AUTHENTICATED := l_authenticated;',
'    ',
'END;'))
,p_attribute_02=>'P120_SUPERVISOR_LOGIN,P120_PASSWORD'
,p_attribute_03=>'P120_IS_AUTHENTICATED'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95456127038695412)
,p_event_id=>wwv_flow_api.id(95455870515695409)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($("#P120_IS_AUTHENTICATED").val() == 1) {',
'    return !($("#P120_REASON").val().trim().length == 0);',
'}',
'else {',
'    showTimeoutMessage("REG_ALERT_LOGIN_FAILED", 5);',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95456087568695411)
,p_event_id=>wwv_flow_api.id(95455870515695409)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//disabled on 10/07/2019',
'return true;',
'//',
'',
'let lspinner$ = apex.util.showSpinner();',
'',
'if ($v("P120_BL_ACTION") == "A" && !!$v("P120_BL_APPROVED_CASE_ID")) {',
'    ',
'    // if orig is null, set it to empty',
'    if (!$v("P120_BIOMETRIC_JSON_ORIG")) $("#P120_BIOMETRIC_JSON_ORIG").val(JSON.stringify(getEmptyJSON()));',
'    ',
'    let biometricJSON = JSON.parse(apex.item(''P120_BIOMETRIC_JSON_ORIG'').getValue());',
'    let hasFace = !!parseInt(biometricJSON.faces.length), hasFinger = !!parseInt(biometricJSON.fingerprints.length);',
'    ',
'    if (!hasFace && !!parent.options.faceImage) {',
'        //load face',
'        loadImage(parent.options.faceImage, "faceImage", "P120_UPLOADED_FACE");',
'        console.log("P120_UPLOADED_FACE: " + $v("P120_UPLOADED_FACE"));',
'    }',
'',
'    if (!hasFinger && !!parent.options.fingerImages) {',
'        //load fingers',
'        let fingerImages = parent.options.fingerImages;',
'        for (let i = 1; i <= 10; i++) {',
'            if (fingerImages[i]) loadImage(fingerImages[i], "fingerImage_" + i, "P120_UPLOADED_FINGER_" + i);',
'            console.log("P120_UPLOADED_FINGER_" + i + ": " + $v("P120_UPLOADED_FINGER_" + i));',
'        }',
'    }',
'    ',
'    if (!hasFace || !hasFinger) {',
'        //create bio json',
'        let jObj = {};',
'        ',
'        jObj.faces = [];',
'        if (!hasFace) {',
'            if ($v("P120_UPLOADED_FACE")) {',
'                jObj.faces.push({image: {data: null, guid: $v("P120_UPLOADED_FACE"), href:null}, "nistPosition": 1});',
'                if ($v("P120_BL_APP_ID_FACE_SAVED") != ''Y'') $("#P120_BL_APP_ID_FACE_SAVED").val("Y");',
'            }',
'        }',
'        else {',
'            _.each(biometricJSON.faces, function(obj,i) {',
'                jObj.faces.push({image: {data: obj.image.data, guid: obj.image.guid, href: obj.image.href}, "nistPosition": obj.nistPosition});',
'            })',
'        }',
'        ',
'        jObj.fingerprints = [];',
'        if (!hasFinger) {',
'            for (var i = 1; i <= 10; i++) {',
'                if ($v("P120_UPLOADED_FINGER_" + i)) {',
'                    jObj.fingerprints.push({image: {data: null, guid: $v("P120_UPLOADED_FINGER_" + i), href: null}, nistImpressionType: 0, nistPosition: i});',
'                    if ($v("P120_BL_APP_ID_FINGER_SAVED") != ''Y'') $("#P120_BL_APP_ID_FINGER_SAVED").val("Y");',
'                }',
'            }',
'        }',
'        else {',
'            _.each(biometricJSON.fingerprints, function(obj,i) {',
'                jObj.fingerprints.push({image: {data: obj.image.data, guid: obj.image.guid, href: obj.image.href}, nistImpressionType: obj.nistImpressionType, nistPosition: obj.nistPosition});',
'            })',
'        }',
'        ',
'        // set new biometric json',
'        $("#P120_BIOMETRIC_JSON").val(JSON.stringify(jObj));',
'    }',
'}',
'',
'// update incident case',
'if ($v("P120_LAST_BL_ACTION") == "A" && !!$v("P120_LAST_BL_APPROVED_CASE_ID")) {',
'    ',
'    // set last biometric json',
'    if (!$v("P120_LAST_BIOMETRIC_JSON")) $("#P120_LAST_BIOMETRIC_JSON").val(JSON.stringify(getEmptyJSON()));',
'    ',
'    let lastBiometricJSON = JSON.parse(apex.item(''P120_LAST_BIOMETRIC_JSON'').getValue());',
'    let faceSaved = ($v("P120_LAST_BL_APP_FACE_SAVED") == "Y"), fingerSaved = ($v("P120_LAST_BL_APP_FINGER_SAVED") == "Y");',
'    ',
'    if(lastBiometricJSON.abisId) lastBiometricJSON.abisId = null;',
'    ',
'    if (faceSaved) {',
'        //remove face',
'        lastBiometricJSON.faces.length = 0;',
'    }',
'    ',
'    if (fingerSaved) {',
'        //remove finger',
'        lastBiometricJSON.fingerprints.length = 0;',
'    }',
'    ',
'    // re-set last biometric json',
'    $("#P120_LAST_BIOMETRIC_JSON").val(JSON.stringify(lastBiometricJSON));',
'}',
'',
'lspinner$.remove();'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(168300387314934120)
,p_event_id=>wwv_flow_api.id(95455870515695409)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P120_SUBMIT_REASON'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25021922984681820)
,p_name=>'DA_BTN_BL_CANCEL'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(25021761319681818)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111342665937156020)
,p_event_id=>wwv_flow_api.id(25021922984681820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_ALLOW_PASS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25022072701681821)
,p_event_id=>wwv_flow_api.id(25021922984681820)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).trigger("resetBLApprovedSelection");',
'$("#P120_BL_ACTION,#P120_BL_ACTION_DISPLAY").val("C");',
'$("#P120_ALLOW_PASS").trigger("change");',
'openModal(''dialogBLReason'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25023453063681835)
,p_name=>'DA_BTN_BL_APPROVE'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(25021844895681819)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25024762029681848)
,p_event_id=>wwv_flow_api.id(25023453063681835)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'return !($("#P120_BL_APPROVED_IDENTITY").val().trim().length === 0 && $("#P120_ICPO_INCIDENT_ID").val().trim().length === 0);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61494744030943843)
,p_event_id=>wwv_flow_api.id(25023453063681835)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    ',
'    IF :P120_BL_APPROVED_IDENTITY IS NOT NULL THEN',
'',
'        -- get approved case ID',
'        BEGIN',
'            SELECT blacklist_case',
'            INTO :P120_BL_APPROVED_CASE_ID',
'            FROM blacklist_case_identities',
'            WHERE identity = :P120_BL_APPROVED_IDENTITY',
'            AND blacklist_case = :P120_C_RECORD_NO;',
'        EXCEPTION',
'            WHEN NO_DATA_FOUND THEN',
'                :P120_BL_APPROVED_CASE_ID := NULL;',
'        END;',
'',
'        -- get existing bio json',
'        IF :P120_BL_APPROVED_CASE_ID IS NOT NULL THEN',
'            BEGIN',
'                SELECT dl_blacklist.pkg_camunda_rest.get_biometric_data$json(:P120_BL_APPROVED_CASE_ID)',
'                INTO :P120_BIOMETRIC_JSON_ORIG',
'                FROM DUAL;',
'            EXCEPTION',
'                WHEN NO_DATA_FOUND THEN',
'                    :P120_BIOMETRIC_JSON_ORIG := NULL;',
'            END;',
'        END IF;',
'',
'    END IF;',
'',
'END;'))
,p_attribute_02=>'P120_BL_APPROVED_IDENTITY,P120_C_RECORD_NO'
,p_attribute_03=>'P120_BL_APPROVED_CASE_ID,P120_BIOMETRIC_JSON_ORIG'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111342775048156021)
,p_event_id=>wwv_flow_api.id(25023453063681835)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_ALLOW_PASS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25023566572681836)
,p_event_id=>wwv_flow_api.id(25023453063681835)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P120_BL_ACTION,#P120_BL_ACTION_DISPLAY").val("A");',
'$("#P120_ALLOW_PASS").trigger("change");',
'openModal(''dialogBLReason'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25023966605681840)
,p_name=>'Toggle BL Approved Selection'
,p_event_sequence=>150
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'span.cl-span-mark-bl-approve'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#BlacklistContainer'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25024163423681842)
,p_event_id=>wwv_flow_api.id(25023966605681840)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $el=$(this.triggeringElement), isMarked = $el.data("marked-status"), vIdentity = $el.data("identity");',
'',
'console.log(this.triggeringElement.id + ":" + isMarked);',
'',
'//reset',
'$(document).trigger("resetBLApprovedSelection");',
'',
'//this element',
'$el',
'.data("marked-status", (isMarked == "Y") ? "N" : "Y")',
'.removeClass("fa-circle-o fa-dot-circle-o")',
'.addClass((isMarked == "Y") ? "fa-circle-o" : "fa-dot-circle-o")',
'.prop("title", (isMarked == "Y") ? "Click to Mark" : "Click to Un-mark");',
'',
'//set selected identity',
'$("#P120_BL_APPROVED_IDENTITY").val($el.data("marked-status") == "Y" ? vIdentity : "").trigger("change");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25024209930681843)
,p_name=>'P120_BL_APPROVED_IDENTITY: Enable Approve Button'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_BL_APPROVED_IDENTITY'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#P120_BL_APPROVED_IDENTITY").val().trim().length > 0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(168300941970934126)
,p_event_id=>wwv_flow_api.id(25024209930681843)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_BL_APP_ID_FACE_SAVED,P120_BL_APP_ID_FINGER_SAVED,P120_BL_APPROVED_CASE_ID'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25024371297681844)
,p_event_id=>wwv_flow_api.id(25024209930681843)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(25021844895681819)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(168300525971934122)
,p_name=>'P120_BL_APPROVED_IDENTITY: Disable Approve Button'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_BL_APPROVED_IDENTITY'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P120_BL_APPROVED_IDENTITY").val().trim().length === 0 ',
'&& $("#P120_ICPO_INCIDENT_ID").val().trim().length === 0'))
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(168300688122934123)
,p_event_id=>wwv_flow_api.id(168300525971934122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(25021844895681819)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(25024548848681846)
,p_name=>'Reset BL Approved Selection'
,p_event_sequence=>180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'resetBLApprovedSelection'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(25024600012681847)
,p_event_id=>wwv_flow_api.id(25024548848681846)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//all elements',
'$("#SearchResult span.cl-span-mark-bl-approve")',
'.data("marked-status", "N")',
'.removeClass("fa-circle-o fa-dot-circle-o")',
'.addClass("fa-circle-o")',
'.prop("title", "Click to Mark");',
'',
'//set selected identity',
'$("#P120_BL_APPROVED_IDENTITY").val("").trigger("change");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40191230445171103)
,p_name=>'DA_BTN_BL_CLOSE'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(40191173004171102)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40191763136171108)
,p_event_id=>wwv_flow_api.id(40191230445171103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT'');',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT_IG'');',
'END;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40191372804171104)
,p_event_id=>wwv_flow_api.id(40191230445171103)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88125169045688542)
,p_name=>'P120_C_REASON_TMP: Change'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_REASON_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88125223035688543)
,p_event_id=>wwv_flow_api.id(88125169045688542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_REASON'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88125338200688544)
,p_name=>'DA_NextCase'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(192202196092436013)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88125419606688545)
,p_event_id=>wwv_flow_api.id(88125338200688544)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let len = currentCasesById.length, $n = $("#NextCase"), $p = $("#PreviousCase");',
'',
'if (currentCasesById[selectedCaseIdx + 1]) {',
'    setCaseDetails(currentCasesById[selectedCaseIdx + 1]);',
'    selectedCaseIdx += 1;',
'}',
'',
'if (selectedCaseIdx === len - 1) $n.prop("disabled", true);',
'if (selectedCaseIdx > 0) $p.prop("disabled", false);',
'selectedFaceIdx = 0;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(88125536974688546)
,p_name=>'DA_PreviousCase'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(192202573050436017)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(88125622298688547)
,p_event_id=>wwv_flow_api.id(88125536974688546)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let len = currentCasesById.length, $n = $("#NextCase"), $p = $("#PreviousCase");',
'',
'if (currentCasesById[selectedCaseIdx - 1]) {',
'    setCaseDetails(currentCasesById[selectedCaseIdx - 1]);',
'    selectedCaseIdx -= 1;',
'}',
'',
'if (selectedCaseIdx === 0) $p.prop("disabled", true);',
'if (selectedCaseIdx < len - 1) $n.prop("disabled", false);',
'selectedFaceIdx = 0;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95830250382545119)
,p_name=>'DA_NextImage'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95830069753545117)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95830314082545120)
,p_event_id=>wwv_flow_api.id(95830250382545119)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let len = currentCasesById[selectedCaseIdx].biometric.faces.length, $n = $("#NextImage"), $p = $("#PreviousImage");',
'',
'if (currentCasesById[selectedCaseIdx].biometric.faces[selectedFaceIdx + 1]) {',
'    setFaceItem(currentCasesById[selectedCaseIdx].biometric.faces[selectedFaceIdx + 1]);',
'    selectedFaceIdx += 1;',
'}',
'',
'if (selectedFaceIdx === len - 1) $n.prop("disabled", true);',
'if (selectedFaceIdx > 0) $p.prop("disabled", false);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95830779038545124)
,p_name=>'DA_PreviousImage'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95830189223545118)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95830879140545125)
,p_event_id=>wwv_flow_api.id(95830779038545124)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let len = currentCasesById[selectedCaseIdx].biometric.faces.length, $n = $("#NextImage"), $p = $("#PreviousImage");',
'',
'if (currentCasesById[selectedCaseIdx].biometric.faces[selectedFaceIdx - 1]) {',
'    setFaceItem(currentCasesById[selectedCaseIdx].biometric.faces[selectedFaceIdx - 1]);',
'    selectedFaceIdx -= 1;',
'}',
'',
'if (selectedFaceIdx === 0) $p.prop("disabled", true);',
'if (selectedFaceIdx < len - 1) $n.prop("disabled", false);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(111342203346156016)
,p_name=>'P120_C_CASE_TYPE_TMP: Change'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_CASE_TYPE_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(111342335803156017)
,p_event_id=>wwv_flow_api.id(111342203346156016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_CASE_TYPE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(136082951484881303)
,p_name=>'P120_TOGGLE_REMARK_LANG: Click'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(133506959675854549)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(136083032162881304)
,p_event_id=>wwv_flow_api.id(136082951484881303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'toggleMaskLang();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(136083130595881305)
,p_event_id=>wwv_flow_api.id(136082951484881303)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (this.browserEvent === "load" && parent.v_mask_curr_lang != null && !!parent.v_mask_curr_lang) ',
'    v_mask_curr_lang = parent.v_mask_curr_lang;',
'',
'$("#"+this.triggeringElement.id + " span.cl-mask-lang-disp").removeClass("cl-mask-lang-en cl-mask-lang-th").addClass("cl-mask-lang-" + v_mask_curr_lang.substr(0, 2));'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(168301178984934128)
,p_name=>'P120_C_ACTION_CODE_TMP: Change'
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_ACTION_CODE_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(168301234021934129)
,p_event_id=>wwv_flow_api.id(168301178984934128)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_ACTION_CODE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4686926066569369006)
,p_name=>'P120_C_LEVEL_OF_CONF_TMP: Change'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_LEVEL_OF_CONF_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686926170292369007)
,p_event_id=>wwv_flow_api.id(4686926066569369006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_LEVEL_OF_CONFIDENTIALITY'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4686926747341369013)
,p_name=>'P120_BTN_VIEW_CASE: Click'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4686926576098369011)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686926863554369014)
,p_event_id=>wwv_flow_api.id(4686926747341369013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'return ($v("P120_C_RECORD_NO").length > 0);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686926906834369015)
,p_event_id=>wwv_flow_api.id(4686926747341369013)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_url varchar2(2000);',
'    l_app number := 535;',
'    l_session number := v(''APP_SESSION'');',
'BEGIN',
'    l_url := APEX_UTIL.PREPARE_URL(',
'        p_url => ''f?p='' || l_app || '':32:''||l_session||''::NO:32:P32_CASE_ID:'' || :P120_C_RECORD_NO,',
'        p_checksum_type => ''SESSION'');',
'    :P120_REDIRECT_CASE_URL := l_url;',
'END;'))
,p_attribute_02=>'P120_C_RECORD_NO'
,p_attribute_03=>'P120_REDIRECT_CASE_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686927011834369016)
,p_event_id=>wwv_flow_api.id(4686926747341369013)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.redirect(apex.item("P120_REDIRECT_CASE_URL").getValue());'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4686927250349369018)
,p_name=>'P120_C_AUTHORITY_TMP: Change'
,p_event_sequence=>300
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_AUTHORITY_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686927371829369019)
,p_event_id=>wwv_flow_api.id(4686927250349369018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_AUTHORITY'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4686927537329369021)
,p_name=>'P120_C_CONTACT_OWNER_DATA_TMP: Change'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_CONTACT_OWNER_DATA_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686927633000369022)
,p_event_id=>wwv_flow_api.id(4686927537329369021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_CONTACT_OWNER_DATA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4686927865213369024)
,p_name=>'P120_C_BEHAVIOUR_TMP: Change'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_BEHAVIOUR_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686927983716369025)
,p_event_id=>wwv_flow_api.id(4686927865213369024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_BEHAVIOUR'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4686928921461369035)
,p_name=>'P120_C_NATIONALITY_TMP: Change'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_NATIONALITY_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686929052588369036)
,p_event_id=>wwv_flow_api.id(4686928921461369035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_NATIONALITY'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4686929214903369038)
,p_name=>'P120_C_GENDER_TMP: Change'
,p_event_sequence=>340
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_C_GENDER_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686929307439369039)
,p_event_id=>wwv_flow_api.id(4686929214903369038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_C_GENDER'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4686929584933369041)
,p_name=>'P120_R_SEX_TMP: Change'
,p_event_sequence=>350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_R_SEX_TMP'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686929636630369042)
,p_event_id=>wwv_flow_api.id(4686929584933369041)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P120_R_SEX'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$("#" + this.triggeringElement.id + " option:selected").text()'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(192208643426436073)
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
 p_id=>wwv_flow_api.id(168299614468934113)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Incident - Blacklist'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_bl_incident_id              incidents.id%TYPE := :P120_BL_INCIDENT_ID;',
'    l_sex                         VARCHAR2(1);',
'    l_bl_number_of_hits           NUMBER;',
'    l_bl_log_key_value            dl_interface.log_blacklist_hits.key_value%TYPE;',
'    l_bl_action                   incidents.bl_action%TYPE := :P120_BL_ACTION;',
'    l_bl_approved_identity        incidents.bl_approved_identity%TYPE;',
'    l_bl_approved_identity_score  incidents.bl_approved_identity_score%TYPE;',
'    l_allow_pass                  incidents.allow_pass%TYPE;',
'BEGIN',
'',
'    -- get hits (>= 60)',
'    SELECT COUNT(DISTINCT c001)',
'    INTO l_bl_number_of_hits',
'    FROM apex_collections',
'    WHERE collection_name = ''COLL_WS_RESULT_IG'';',
'',
'    -- get log_blacklist_hits PK',
'    BEGIN',
'        SELECT key_value',
'        INTO l_bl_log_key_value',
'        FROM',
'        (',
'            SELECT ',
'            key_value, ROW_NUMBER() OVER (PARTITION BY sender_object_id ORDER BY ins_at DESC) RN',
'            FROM dl_interface.log_blacklist_hits',
'            WHERE sender_object_id = :P17_MVMNTID',
'            AND NVL(sender_system, ''~'') != ''BMBS_ICPO_SLTD''',
'            AND ins_at BETWEEN SYSDATE - 2/24 AND SYSDATE',
'        )',
'        WHERE RN = 1;',
'    EXCEPTION ',
'        WHEN NO_DATA_FOUND THEN',
'            NULL;',
'    END;',
'',
'    -- approved only for ICPO ',
'    IF :P120_BL_APPROVED_IDENTITY IS NULL AND :P120_ICPO_INCIDENT_ID IS NOT NULL AND l_bl_action = ''A'' THEN',
'        l_bl_action := ''C'';',
'    END IF;',
'',
'    -- others',
'    SELECT ',
'        DECODE(UPPER(TRIM(:P120_R_SEX)), ''MALE'', ''M'', ''FEMALE'', ''F'', ''X'')',
'        ,DECODE(l_bl_action, ''A'', :P120_BL_APPROVED_IDENTITY, NULL)',
'        ,DECODE(l_bl_action, ''C'', ''Y'', :P120_ALLOW_PASS)',
'    INTO ',
'        l_sex',
'        ,l_bl_approved_identity',
'        ,l_allow_pass',
'    FROM DUAL;',
'',
'    -- get score',
'    IF l_bl_approved_identity IS NOT NULL THEN',
'        SELECT MAX(NVL(TO_NUMBER(c011), 0) + NVL(TO_NUMBER(c012), 0))',
'        INTO l_bl_approved_identity_score',
'        FROM apex_collections',
'        WHERE collection_name = ''COLL_WS_RESULT_IG''',
'        AND c001 = l_bl_approved_identity;',
'    END IF;',
'',
'    IF l_bl_incident_id IS NULL THEN',
'        pkg_incidents.create_incident(',
'            p_TYPE => 10',
'            ,p_INS_TERMINAL => :AI_TERMINAL_ID',
'            ,p_INS_BORDERPOST => :AI_BORDERPOST_ID',
'            ,p_DOCNO => :P120_R_PASSPORT_NUMBER',
'            ,p_ISSUINGCOUNTRY => :P120_R_NATIONALITY',
'            ,p_LASTNAME => :P120_R_SURNAME',
'            ,p_GIVENNAME => :P120_R_FIRSTNAME',
'            ,p_GENDER => l_sex',
'            ,p_DOB => :P120_DATE_OF_BIRTH',
'            ,p_BRDDOCID => :P17_BRDDOCID',
'            ,p_MVMNTID => :P17_MVMNTID',
'            ,p_BL_STATUS => ''A''',
'            ,p_BL_NUMBER_OF_HITS => l_bl_number_of_hits',
'            ,p_BL_ACTION => l_bl_action',
'            ,p_BL_REMARKS => TRIM(:P120_REASON)',
'            ,p_BL_APPROVED_CASE => :P120_BL_APPROVED_CASE_ID',
'            ,p_BL_APPROVED_IDENTITY => l_bl_approved_identity',
'            ,p_BL_APPROVED_IDENTITY_SCORE => l_bl_approved_identity_score',
'            ,p_BL_APPROVED_FACE_SAVED => :P120_BL_APP_ID_FACE_SAVED',
'            ,p_BL_APPROVED_FINGER_SAVED => :P120_BL_APP_ID_FINGER_SAVED',
'            ,p_BL_LOG_KEY_VALUE => l_bl_log_key_value',
'            ,p_OFFICER => :APP_USER',
'            ,p_SUPERVISOR => UPPER(:P120_SUPERVISOR_LOGIN)',
'            ,p_CLIENT_IP => :AI_TERMINAL_IP',
'            ,p_ALLOW_PASS => l_allow_pass',
'            ,p_ID => l_bl_incident_id',
'        );',
'',
'        :P120_BL_INCIDENT_ID := l_bl_incident_id;',
'    ELSE',
'        pkg_incidents.update_incident(',
'            p_ID => l_bl_incident_id',
'            ,p_TYPE => 10',
'            ,p_INS_TERMINAL => :AI_TERMINAL_ID',
'            ,p_INS_BORDERPOST => :AI_BORDERPOST_ID',
'            ,p_DOCNO => :P120_R_PASSPORT_NUMBER',
'            ,p_ISSUINGCOUNTRY => :P120_R_NATIONALITY',
'            ,p_LASTNAME => :P120_R_SURNAME',
'            ,p_GIVENNAME => :P120_R_FIRSTNAME',
'            ,p_GENDER => l_sex',
'            ,p_DOB => :P120_DATE_OF_BIRTH',
'            ,p_BRDDOCID => :P17_BRDDOCID',
'            ,p_MVMNTID => :P17_MVMNTID',
'            ,p_BL_STATUS => ''A''',
'            ,p_BL_NUMBER_OF_HITS => l_bl_number_of_hits',
'            ,p_BL_ACTION => l_bl_action',
'            ,p_BL_REMARKS => TRIM(:P120_REASON)',
'            ,p_BL_APPROVED_CASE => :P120_BL_APPROVED_CASE_ID',
'            ,p_BL_APPROVED_IDENTITY => l_bl_approved_identity',
'            ,p_BL_APPROVED_IDENTITY_SCORE => l_bl_approved_identity_score',
'            ,p_BL_APPROVED_FACE_SAVED => :P120_BL_APP_ID_FACE_SAVED',
'            ,p_BL_APPROVED_FINGER_SAVED => :P120_BL_APP_ID_FINGER_SAVED',
'            ,p_BL_LOG_KEY_VALUE => l_bl_log_key_value',
'            ,p_OFFICER => :APP_USER',
'            ,p_SUPERVISOR => UPPER(:P120_SUPERVISOR_LOGIN)',
'            ,p_CLIENT_IP => :AI_TERMINAL_IP',
'            ,p_ALLOW_PASS => l_allow_pass',
'        );',
'    END IF;',
'',
'END;'))
,p_process_error_message=>'Error: Update Incident - Blacklist - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(100347629229312136)
,p_process_when=>'P120_BL_INCIDENT_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(168299886808934115)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Incident - ICPO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_icpo_incident_id            incidents.id%TYPE := :P120_ICPO_INCIDENT_ID;',
'    l_sex                         VARCHAR2(1);',
'    l_bl_log_key_value            dl_interface.log_blacklist_hits.key_value%TYPE;',
'    l_bl_action                   incidents.bl_action%TYPE := :P120_BL_ACTION;',
'    l_allow_pass                  incidents.allow_pass%TYPE;',
'BEGIN',
'',
'    -- get log_blacklist_hits PK',
'    BEGIN',
'        SELECT key_value',
'        INTO l_bl_log_key_value',
'        FROM',
'        (',
'            SELECT ',
'                key_value, ROW_NUMBER() OVER (PARTITION BY sender_object_id ORDER BY ins_at DESC) RN',
'            FROM dl_interface.log_blacklist_hits',
'            WHERE sender_object_id = :P17_MVMNTID',
'            AND sender_system = ''BMBS_ICPO_SLTD''',
'            AND ins_at BETWEEN SYSDATE - 2/24 AND SYSDATE',
'        )',
'        WHERE RN = 1;',
'    EXCEPTION ',
'        WHEN NO_DATA_FOUND THEN',
'            NULL;',
'    END;',
'',
'    -- others',
'    SELECT ',
'        DECODE(UPPER(TRIM(:P120_R_SEX)), ''MALE'', ''M'', ''FEMALE'', ''F'', ''X'')',
'        ,DECODE(l_bl_action, ''C'', ''Y'', :P120_ALLOW_PASS)',
'    INTO ',
'        l_sex',
'        ,l_allow_pass',
'    FROM DUAL;',
'',
'    IF l_icpo_incident_id IS NULL THEN',
'        pkg_incidents.create_incident(',
'            p_TYPE => 30',
'            ,p_INS_TERMINAL => :AI_TERMINAL_ID',
'            ,p_INS_BORDERPOST => :AI_BORDERPOST_ID',
'            ,p_DOCNO => :P120_ICPO_PASSPORT_NUMBER',
'            ,p_ISSUINGCOUNTRY => :P120_ICPO_NATIONALITY',
'            ,p_LASTNAME => :P120_R_SURNAME',
'            ,p_GIVENNAME => :P120_R_FIRSTNAME',
'            ,p_GENDER => l_sex',
'            ,p_DOB => :P120_DATE_OF_BIRTH',
'            ,p_BRDDOCID => :P17_BRDDOCID',
'            ,p_MVMNTID => :P17_MVMNTID',
'            ,p_BL_STATUS => ''A''',
'            ,p_BL_ACTION => l_bl_action',
'            ,p_BL_REMARKS => TRIM(:P120_REASON)',
'            ,p_BL_LOG_KEY_VALUE => l_bl_log_key_value',
'            ,p_OFFICER => :APP_USER',
'            ,p_SUPERVISOR => UPPER(:P120_SUPERVISOR_LOGIN)',
'            ,p_CLIENT_IP => :AI_TERMINAL_IP',
'            ,p_ALLOW_PASS => l_allow_pass',
'            ,p_ID => l_icpo_incident_id',
'        );',
'',
'        :P120_ICPO_INCIDENT_ID := l_icpo_incident_id;',
'    ELSE',
'        pkg_incidents.update_incident(',
'            p_ID => l_icpo_incident_id',
'            ,p_TYPE => 30',
'            ,p_INS_TERMINAL => :AI_TERMINAL_ID',
'            ,p_INS_BORDERPOST => :AI_BORDERPOST_ID',
'            ,p_DOCNO => :P120_ICPO_PASSPORT_NUMBER',
'            ,p_ISSUINGCOUNTRY => :P120_ICPO_NATIONALITY',
'            ,p_LASTNAME => :P120_R_SURNAME',
'            ,p_GIVENNAME => :P120_R_FIRSTNAME',
'            ,p_GENDER => l_sex',
'            ,p_DOB => :P120_DATE_OF_BIRTH',
'            ,p_BRDDOCID => :P17_BRDDOCID',
'            ,p_MVMNTID => :P17_MVMNTID',
'            ,p_BL_STATUS => ''A''',
'            ,p_BL_ACTION => l_bl_action',
'            ,p_BL_REMARKS => TRIM(:P120_REASON)',
'            ,p_BL_LOG_KEY_VALUE => l_bl_log_key_value',
'            ,p_OFFICER => :APP_USER',
'            ,p_SUPERVISOR => UPPER(:P120_SUPERVISOR_LOGIN)',
'            ,p_CLIENT_IP => :AI_TERMINAL_IP',
'            ,p_ALLOW_PASS => l_allow_pass',
'        );',
'    END IF;',
'',
'END;'))
,p_process_error_message=>'Error: Update Incident - ICPO - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(100347629229312136)
,p_process_when=>'P120_ICPO_INCIDENT_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(168299709316934114)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Blacklist Biometrics'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    -- update blank',
'    IF ',
'        :P120_LAST_BL_ACTION = ''A''',
'        AND :P120_LAST_BL_APPROVED_CASE_ID IS NOT NULL',
'        AND :P120_LAST_BIOMETRIC_JSON IS NOT NULL',
'        AND',
'        (',
'            (:P120_BL_ACTION = ''C'') ',
'            OR',
'            (:P120_BL_ACTION = ''A'' AND :P120_LAST_BL_APPROVED_CASE_ID != NVL(:P120_BL_APPROVED_CASE_ID, ''~''))',
'        )',
'    THEN',
'        dl_blacklist.pkg_camunda_rest.update_biometrics',
'        (',
'            i_biometric_json => :P120_LAST_BIOMETRIC_JSON, ',
'            i_blacklist_case_id => :P120_LAST_BL_APPROVED_CASE_ID',
'        );',
'    END IF;',
'    ',
'    -- update new',
'    IF :P120_BL_ACTION = ''A'' AND :P120_BL_APPROVED_CASE_ID IS NOT NULL THEN',
'        IF :P120_BIOMETRIC_JSON IS NOT NULL',
'        AND',
'        (',
'            :P120_UPLOADED_FACE IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_1 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_2 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_3 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_4 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_5 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_6 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_7 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_8 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_9 IS NOT NULL',
'            OR :P120_UPLOADED_FINGER_10 IS NOT NULL',
'        ) THEN',
'            dl_blacklist.pkg_camunda_rest.update_biometrics',
'            (',
'                i_biometric_json => :P120_BIOMETRIC_JSON, ',
'                i_blacklist_case_id => :P120_BL_APPROVED_CASE_ID',
'            );',
'        END IF;',
'    END IF;',
'    ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        NULL;',
'END;'))
,p_process_error_message=>'Error: Update Blacklist Biometrics - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(100347629229312136)
,p_process_when_type=>'NEVER'
,p_process_comment=>'disabled on 10/07/2019'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(168300221198934119)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Parent Page Items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'     -- set parent page items',
'     SELECT ',
'        :P120_BL_ACTION',
'        , TRIM(:P120_REASON)',
'        , :P120_BL_INCIDENT_ID',
'        , DECODE(:P120_BL_ACTION, ''C'', ''Y'', :P120_ALLOW_PASS)',
'        , :P120_ICPO_INCIDENT_ID',
'     INTO ',
'        :P17_BLACKLISTALERT_ACTION',
'        , :P17_BLACKLIST_CANCEL_REASON',
'        , :P17_BLACKLIST_INCIDENT_ID',
'        , :P17_BLACKLIST_ALLOW_PASS',
'        , :P17_ICPO_INCIDENT_ID',
'     FROM DUAL;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(168300406258934121)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Collections'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT'');',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT_IG'');',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(168299426116934111)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(40191072023171101)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Incident'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    -- Blacklist',
'    IF :P120_BL_INCIDENT_ID IS NOT NULL THEN',
'        SELECT ',
'            i.bl_action',
'            , i.bl_approved_identity',
'            , i.bl_approved_identity',
'            , i.bl_remarks',
'            , i.allow_pass',
'            , i.bl_approved_face_saved',
'            , i.bl_approved_finger_saved',
'            , i.bl_approved_case',
'        INTO ',
'            :P120_LAST_BL_ACTION',
'            , :P120_LAST_BL_APPROVED_IDENTITY',
'            , :P120_BL_APPROVED_IDENTITY',
'            , :P120_REASON',
'            , :P120_LAST_ALLOW_PASS',
'            , :P120_LAST_BL_APP_FACE_SAVED',
'            , :P120_LAST_BL_APP_FINGER_SAVED',
'            , :P120_LAST_BL_APPROVED_CASE_ID',
'        FROM dl_bordercontrol.incidents i',
'        WHERE i.id = :P120_BL_INCIDENT_ID;',
'        ',
'        -- get last bio json',
'        -- will be modified in js based on incident face/finger saved values',
'        IF :P120_LAST_BL_APPROVED_CASE_ID IS NOT NULL THEN',
'            BEGIN',
'                SELECT dl_blacklist.pkg_camunda_rest.get_biometric_data$json(:P120_LAST_BL_APPROVED_CASE_ID)',
'                INTO :P120_LAST_BIOMETRIC_JSON',
'                FROM DUAL;',
'            EXCEPTION',
'                WHEN NO_DATA_FOUND THEN',
'                    :P120_LAST_BIOMETRIC_JSON := NULL;',
'            END;',
'        END IF;',
'    END IF;',
'',
'    -- ICPO',
'    IF :P120_ICPO_INCIDENT_ID IS NOT NULL THEN',
'        SELECT ',
'            i.bl_action',
'            , i.bl_remarks',
'            , i.allow_pass',
'        INTO ',
'            :P120_LAST_BL_ACTION',
'            , :P120_REASON',
'            , :P120_LAST_ALLOW_PASS',
'        FROM dl_bordercontrol.incidents i',
'        WHERE i.id = :P120_ICPO_INCIDENT_ID;',
'    END IF;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P120_BL_INCIDENT_ID IS NOT NULL ',
'OR',
':P120_ICPO_INCIDENT_ID IS NOT NULL'))
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(192209115659436075)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get_ws_result'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_params          VARCHAR2(32767) := apex_application.g_x01;',
'    l_host            VARCHAR2(200)   := apex_application.g_x02;',
'    l_collection_name VARCHAR2(200)   := ''COLL_WS_RESULT'';',
'BEGIN',
'    apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'    dl_common.pkg_apex_util.create_empty_collection( l_collection_name );',
'',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';   ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';  ',
'    ',
'    apex_collection.add_member(p_collection_name => l_collection_name,',
'                               p_clob001         => apex_web_service.make_rest_request(',
'                                                         --p_url         => l_host||''/bpm/blacklist/search'',',
'                                                         p_url         =>  ''http://10.120.18.87:8090/blacklist/search'',',
'                                                         p_http_method => ''POST'',',
'		                                                 p_body        => l_params',
'		                                            )',
'                             );',
'',
'    apex_json.open_object;',
'    apex_json.write( ''sqlcode'', 0 );',
'    apex_json.write( ''sqlerrm'', ''Request OK'');',
'    apex_json.close_object;',
'    htp.p( apex_json.get_clob_output );',
'    ',
'EXCEPTION ',
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
 p_id=>wwv_flow_api.id(192209448977436077)
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
 p_id=>wwv_flow_api.id(186862558611161708)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_ws_result'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_clob clob := apex_application.g_clob_01;',
'    l_min_threshold NUMBER := 60;',
'begin',
'    apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT'');',
'    APEX_COLLECTION.ADD_MEMBER (',
'        p_collection_name => ''COLL_WS_RESULT'',',
'        p_clob001 => l_clob',
'    );',
'        ',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT_IG'');',
'    ',
'    l_min_threshold := TO_NUMBER(NVL(dl_bordercontrol.pkg_common.Get_Parameter(''BL_SEARCH_THRESHOLD''), 60));',
'    ',
'    -- BIO',
'    FOR x IN',
'    (',
'        SELECT jt.*',
'        FROM JSON_TABLE((SELECT clob001 FROM APEX_collections WHERE collection_name = ''COLL_WS_RESULT'' AND seq_id = 1), ''$.candidates[*]''',
'         COLUMNS ("ID"             VARCHAR2(512 CHAR) PATH ''$.key_value'',',
'                  imageGuid        VARCHAR2(512 CHAR) PATH ''$.faceId'',',
'                  firstname        VARCHAR2(512 CHAR) PATH ''$.givenname'',',
'                  sortingScore     VARCHAR2(512 CHAR) PATH ''$.sortingScore'',',
'                  demographicScore VARCHAR2(512 CHAR) PATH ''$.demographicScore'',',
'                  lastname         VARCHAR2(512 CHAR) PATH ''$.surname'', ',
'                  middlename       VARCHAR2(512 CHAR) PATH ''$.middlename'', ',
'                  biometricScore   VARCHAR2(512 CHAR) PATH ''$.biometricScore'',',
'                  demographicMatch VARCHAR2(512 CHAR) PATH ''$.demographicMatch'',',
'                  biometricMatch   VARCHAR2(512 CHAR) PATH ''$.biometricMatch'',',
'                  nationality      VARCHAR2(512 CHAR) PATH ''$.nationality'',',
'                  sex              VARCHAR2(512 CHAR) PATH ''$.sex'',',
'                  dateOfBirth      VARCHAR2(512 CHAR) PATH ''$.date_of_birth''',
'                  )) jt',
'    )',
'    LOOP',
'      IF NVL(TO_NUMBER(x.demographicScore), 0) + NVL(TO_NUMBER(x.biometricScore), 0) >= l_min_threshold THEN',
'        APEX_COLLECTION.ADD_MEMBER (',
'            p_collection_name => ''COLL_WS_RESULT_IG'',',
'            p_c001            => x.ID,',
'            p_c002            => x.imageGuid,',
'            p_c003            => x.firstname,',
'            p_c004            => x.lastname,',
'            p_c005            => x.nationality,',
'            p_c006            => x.sex,',
'            p_c007            => x.dateOfBirth,',
'            p_c008            => x.demographicMatch,',
'            p_c009            => x.biometricMatch,',
'            p_c010            => x.sortingScore,',
'            p_c011            => x.demographicScore,',
'            p_c012            => x.biometricScore,',
'            p_c013            => x.middlename',
'        );',
'      END IF;',
'    END LOOP;',
'        ',
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
 p_id=>wwv_flow_api.id(61492804833943824)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_ws_result_demo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_clob clob := apex_application.g_clob_01;',
'begin',
'    apex_json.initialize_clob_output(DBMS_LOB.CALL, true, 2);',
'    dl_common.pkg_apex_util.create_empty_collection(''COLL_WS_RESULT'');',
'    APEX_COLLECTION.ADD_MEMBER (',
'        p_collection_name => ''COLL_WS_RESULT'',',
'        p_clob001 => l_clob',
'    );',
'        ',
'    -- DEMOGRAPHIC',
'    FOR x IN',
'    (',
'        SELECT jt.*',
'        FROM JSON_TABLE((SELECT clob001 FROM APEX_collections WHERE collection_name = ''COLL_WS_RESULT'' AND seq_id = 1), ''$.candidates[*]''',
'         COLUMNS ("ID"             VARCHAR2(512 CHAR) PATH ''$.id'',',
'                  --imageGuid        VARCHAR2(512 CHAR) PATH ''$.faceId'',',
'                  firstname        VARCHAR2(512 CHAR) PATH ''$.firstname'',',
'                  --sortingScore     VARCHAR2(512 CHAR) PATH ''$.sortingScore'',',
'                  demographicScore VARCHAR2(512 CHAR) PATH ''$.surnameMatchScore'',',
'                  lastname         VARCHAR2(512 CHAR) PATH ''$.surname'', ',
'                  middlename       VARCHAR2(512 CHAR) PATH ''$.middlename'', ',
'                  --biometricScore   VARCHAR2(512 CHAR) PATH ''$.biometricScore'',',
'                  --demographicMatch VARCHAR2(512 CHAR) PATH ''$.demographicMatch'',',
'                  --biometricMatch   VARCHAR2(512 CHAR) PATH ''$.biometricMatch'',',
'                  nationality      VARCHAR2(512 CHAR) PATH ''$.nationality'',',
'                  sex              VARCHAR2(512 CHAR) PATH ''$.sex'',',
'                  dateOfBirth      VARCHAR2(512 CHAR) PATH ''$.dateOfBirth'',',
'                  firstnameThai    VARCHAR2(512 CHAR) PATH ''$.firstnameThai'',',
'                  surnameThai      VARCHAR2(512 CHAR) PATH ''$.surnameThai'',',
'                  middlenameThai   VARCHAR2(512 CHAR) PATH ''$.middlenameThai''',
'                  )) jt',
'    )',
'    LOOP',
'        APEX_COLLECTION.ADD_MEMBER (',
'            p_collection_name => ''COLL_WS_RESULT_IG'',',
'            p_c001            => x.ID,',
'            p_c002            => NULL, --x.imageGuid,',
'            p_c003            => x.firstname,',
'            p_c004            => x.lastname,',
'            p_c005            => x.nationality,',
'            p_c006            => x.sex,',
'            p_c007            => x.dateOfBirth,',
'            p_c008            => ''true'', --x.demographicMatch,',
'            p_c009            => ''false'', --x.biometricMatch,',
'            p_c010            => 60, --x.sortingScore,',
'            p_c011            => x.demographicScore,',
'            p_c012            => NULL, --x.biometricScore,',
'            p_c013            => x.middlename,',
'            p_c014            => x.firstnameThai,',
'            p_c015            => x.surnameThai,',
'            p_c016            => x.middlenameThai',
'        );',
'    END LOOP;',
'        ',
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
end;
/
