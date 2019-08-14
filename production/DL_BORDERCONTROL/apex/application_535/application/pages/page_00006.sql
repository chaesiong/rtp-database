prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'LiveCaptureFaceInCase'
,p_page_mode=>'MODAL'
,p_step_title=>'Live Capture Face'
,p_step_sub_title=>'LiveCaptureFaceInCase'
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
'        $(''<div class="overlay" onClick="hideImage(this)"><img class="overlay-image" src="/image/''+guid+''?width=450" /></div>'').appendTo(''.t-Region-body'').first();',
'    }',
'}',
'',
'function hideImage(overlay){',
'    $(overlay).remove();',
'}',
'',
'',
'',
'var testcase = {',
'  "biometrics": {',
'    "candidates": [',
'      {',
'        "biometrics": {',
'          "faces": [',
'            {',
'              "image": {',
'                "data": "string",',
'                "guid": "string",',
'                "href": "string"',
'              },',
'              "type": "string"',
'            }',
'          ],',
'          "fingerprints": [',
'            {',
'              "image": {',
'                "data": "string",',
'                "guid": "string",',
'                "href": "string"',
'              },',
'              "nistImpressionType": 0,',
'              "nistPosition": 0,',
'              "type": "string"',
'            }',
'          ]',
'        },',
'        "blacklistId": "string",',
'        "demographics": {',
'          "dateOfBirth": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "details": {',
'            "arrivalDate": "2018-04-26",',
'            "authority": "string",',
'            "behaviour": "string",',
'            "caseNumber": "string",',
'            "contactRequired": "string",',
'            "dateOfBirth": "2018-04-26",',
'            "entryDate": "2018-04-26",',
'            "faceShape": "string",',
'            "figure": "string",',
'            "firstname": "string",',
'            "firstnameThai": "string",',
'            "gender": "string",',
'            "givenname": "string",',
'            "givennameThai": "string",',
'            "hairColor": "string",',
'            "hairType": "string",',
'            "lastname": "string",',
'            "lastnameThai": "string",',
'            "levelOfConfidentially": "string",',
'            "middlename": "string",',
'            "middlenameThai": "string",',
'            "nationality": "string",',
'            "nextStep": "string",',
'            "passportNo": "string",',
'            "phone": "string",',
'            "reason": "string",',
'            "size": "string",',
'            "tM6Number": "string",',
'            "weight": "string"',
'          },',
'          "firstname": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "firstnameThai": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "gender": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "lastname": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "lastnameThai": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "middlename": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "middlenameThai": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "nationality": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "passportNumber": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "sex": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "surname": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "surnameThai": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          }',
'        }',
'      }',
'    ],',
'    "hit": true,',
'    "status": {',
'      "code": "SUCCESS",',
'      "reasons": "string"',
'    },',
'    "system": "string",',
'    "transactionId": "string"',
'  },',
'  "demographics": {',
'    "candidates": [',
'      {',
'        "biometrics": {',
'          "faces": [',
'            {',
'              "image": {',
'                "data": "string",',
'                "guid": "string",',
'                "href": "string"',
'              },',
'              "type": "string"',
'            }',
'          ],',
'          "fingerprints": [',
'            {',
'              "image": {',
'                "data": "string",',
'                "guid": "string",',
'                "href": "string"',
'              },',
'              "nistImpressionType": 0,',
'              "nistPosition": 0,',
'              "type": "string"',
'            }',
'          ]',
'        },',
'        "blacklistId": "string",',
'        "demographics": {',
'          "dateOfBirth": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "details": {',
'            "arrivalDate": "2018-04-26",',
'            "authority": "string",',
'            "behaviour": "string",',
'            "caseNumber": "string",',
'            "contactRequired": "string",',
'            "dateOfBirth": "2018-04-26",',
'            "entryDate": "2018-04-26",',
'            "faceShape": "string",',
'            "figure": "string",',
'            "firstname": "string",',
'            "firstnameThai": "string",',
'            "gender": "string",',
'            "givenname": "string",',
'            "givennameThai": "string",',
'            "hairColor": "string",',
'            "hairType": "string",',
'            "lastname": "string",',
'            "lastnameThai": "string",',
'            "levelOfConfidentially": "string",',
'            "middlename": "string",',
'            "middlenameThai": "string",',
'            "nationality": "string",',
'            "nextStep": "string",',
'            "passportNo": "string",',
'            "phone": "string",',
'            "reason": "string",',
'            "size": "string",',
'            "tM6Number": "string",',
'            "weight": "string"',
'          },',
'          "firstname": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "firstnameThai": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "gender": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "lastname": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "lastnameThai": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "middlename": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "middlenameThai": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "nationality": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "passportNumber": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "sex": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "surname": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          },',
'          "surnameThai": {',
'            "matchScore": 0,',
'            "matched": true,',
'            "queryValue": "string"',
'          }',
'        }',
'      }',
'    ],',
'    "hit": true,',
'    "status": {',
'      "code": "SUCCESS",',
'      "reasons": "string"',
'    },',
'    "system": "string",',
'    "transactionId": "string"',
'  },',
'  "hit": true,',
'  "status": {',
'    "code": "SUCCESS",',
'    "reasons": "string"',
'  },',
'  "system": "string",',
'  "transactionId": "string"',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.onbeforeunload = function(){',
'    $(''.FaceCaptureContainer'').each(function () {',
'     $(this).FaceCapture(''releaseDevice'');',
'    });',
'}'))
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
'    max-height:700px;',
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
'.t-Form-inputContainer {',
'    padding:0;',
'}',
'.FaceItemLayout .fc-item-content.hasImage {',
'    background-color: #fff;',
'}',
'.result-container>.t-Region-bodyWrap>.t-Region-body {',
'    min-height: 600px;',
'    max-height: 600px;',
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
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'800px'
,p_dialog_max_width=>'900px'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190404142141'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78378256216424298)
,p_plug_name=>'FaceCapture'
,p_region_css_classes=>'result-container region-100 '
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.DERMALOG.FACECAPTURE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'default'
,p_attribute_02=>'Y'
,p_attribute_03=>'webcam'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'WXGA'
,p_attribute_07=>'20'
,p_attribute_08=>'1'
,p_attribute_09=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "Automatically": true,',
'  "FacePosition": "Portrait",',
'  "FaceAngleThreshold": 10,',
'  "FaceQualityThreshold": 70,',
'  "FaceFakeDetection": false,',
'  "FaceICAOCheck": false,',
'  "FaceLivenessDetection": false,',
'  "ShowSelectionShadowOverlay": false,',
'  "ShowAcceptDeclineDialog": false,',
'  "ImageSort": {',
'    "Sortby": "quality",',
'    "Sortorder":"asc"',
'  },',
'  "AutoAcceptBest": false,',
'  "AutoAcceptThreshold": 90,',
'  "MaxImageCount": 5,',
'  "FaceMarking": {',
'    "showMarking": true,',
'    "BadThreshold": 30,',
'    "GoodThreshold": 70,',
'    "BadColor": "#ff0000",',
'    "MediumColor": "#ffff00",',
'    "GoodColor": "#00ff00",',
'    "DefaultColor": "#ffffff",',
'    "QualityType": "FaceMatching"',
'  }',
'}'))
,p_attribute_19=>'N'
,p_attribute_23=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7795757592712764)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(78378256216424298)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7796188467712767)
,p_name=>'P6_CASE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(78378256216424298)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7796523557712772)
,p_name=>'P6_IMAGE_URL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(78378256216424298)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7798146283712786)
,p_name=>'FaceAccepted'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(78378256216424298)
,p_bind_type=>'bind'
,p_bind_event_type=>'PLUGIN_COM.DERMALOG.FACECAPTURE|REGION TYPE|facecapturestepaccepted'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7798638082712788)
,p_event_id=>wwv_flow_api.id(7798146283712786)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'top.window.FaceWindow.setFaceToItem(this.data.getImageURL());',
'$(''.FaceCaptureContainer'').each(function () {',
'    $(this).FaceCapture(''releaseDevice'');',
'});',
'setTimeout(function(){apex.navigation.dialog.close(true,["6"])},700);',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7797011380712783)
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
 p_id=>wwv_flow_api.id(7797804497712786)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'InitItems'
,p_process_sql_clob=>':P6_IMAGE_URL := NULL;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
