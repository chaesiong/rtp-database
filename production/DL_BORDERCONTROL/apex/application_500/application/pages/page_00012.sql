prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Collective Passport'
,p_page_mode=>'MODAL'
,p_step_title=>'Collective Passport'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#Logging.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'function deleteRow(id){',
'    //$.event.trigger("Delete_Row");',
'    $x("P12_ID").value = id;',
'    apex.event.trigger(document, "Delete_Row");',
'}',
'',
'(function() {',
'    var v_pluginWebcam = new WebCamPlugin(0, "status", null, function(sender, resp) {',
'        if (resp.Command != "Stream") {',
'            return;',
'        }',
'        $("#CAMERA_PREVIEW_CHILD")[0].src = resp.ImageType + ", " + resp.Image;',
'    });',
'',
'    // start video capture',
'    v_pluginWebcam.connect().done(function (data) {',
'        if (data.Result == 0) {',
'            v_pluginWebcam.connectDevice().done(',
'                function (data) {',
'                    LogMessage("LIVE_CHILD_FACE_MANAGEMENT", "Camera started");',
'                    v_pluginWebcam.startDevice();',
'                }',
'            );',
'        }',
'    });',
'})();',
'',
'function getCurrentChildPhoto(){',
'    return $("#CAMERA_PREVIEW_CHILD").attr("src").split(", ")[1];',
'    console.log("ich bin hier");',
'    ',
'}',
'',
'function saveFellowPassangerBlob(){',
'    var rownum = $(''#P12_MAX_ROWNUM'').val();',
'    var counter = 1;',
'    console.log(''saveFellowPassangerBlob'');',
'    console.log(''rownum ''+rownum);',
'    console.log(''counter ''+counter);',
'    while (counter <= rownum){',
'        var picture = $("#IMG_CHILD_" + counter).attr("src").split(",")[1];',
'        console.log(''picture'');',
'        console.log(picture);',
'        var keyValue = $(''#KEY_VALUE_'' + counter).val();',
'        console.log(''keyValue'');',
'        console.log(keyValue);',
'        if (picture != null){',
'            StoreValueInSessionBagChild("CHILD_1", picture, counter);',
'            counter++;',
'        }else {',
'            counter++;',
'        }',
'    }',
'    apex.submit({',
'     request:"SAVE" //,',
'     //set:{"P1_DEPTNO":10, "P1_EMPNO":5433',
'    });',
'}',
'',
'function IsChildAgeFine(dob){',
'	if (dob.trim().length == 0) {',
'		return true;',
'	}',
'    var dobNumber = parseInt(dob.substr(6, 4) + dob.substr(3, 2) + dob.substr(0, 2));',
'    var now = new Date();',
'    var nowNumber = (now.getFullYear()) * 10000 + (now.getMonth() + 1) * 100 + (now.getDate());',
'    var age = nowNumber - dobNumber;',
'    ',
'    if (age >= 0) {',
'		return true;',
'	}',
'    return false;',
'}',
'',
'function checkAllChildAges(){',
'    var AllAgesFine = true;',
'    $(''.css_calculate_age'').each(function(index, elem) {',
'		/*var ageOk = IsChildAgeFine(this.value);',
'        if (!ageOk) {',
'            AllAgesFine = false;',
'		}*/',
'		var i = parseInt($(elem).attr("id").split("_")[1]);',
'		var $elem = $(elem);',
'		var valLength = $elem.val().length;',
'		var ageOk = IsChildAgeFine($elem.val());',
'		var imgSrc = $(''#IMG_CHILD_''+i).attr(''src'').substring(0, 200);',
'		var imgProtocol = imgSrc.substring(0, 2);',
'		//console.log("ageOk = ", ageOk, " i = ", i, " valLength = ", valLength, " imgSrc = ", imgSrc, " imgProtocol = ", imgProtocol);',
'        if (!ageOk || (valLength > 0 && imgProtocol == "ws")) {',
'            AllAgesFine = false;',
'		}',
'    });',
'    return AllAgesFine;',
'}',
'',
'function allRowsComplete() {',
'	for (var line = 1; line <= 20; line++) {',
'		var cnt = 0;',
'		for (var field = 2; field <= 5; field++) {',
'			// f02_0001',
'			var lineStr = String("0000" + line).slice(-4);',
'			var fieldStr = String("00" + field).slice(-2);',
'			var elem = $("#f" + fieldStr + "_" + lineStr);',
'			//console.log("lineStr: ", lineStr, " fieldStr: ", fieldStr, " elem: ", elem);',
'			if (elem != null) {',
'				cnt += elem.val().trim().length;',
'			}',
'		}',
'		cnt += $("#IMG_CHILD_" + line).attr("src").substr(0, 2) != "ws";',
'		if (cnt > 0 && cnt < 5) {',
'			return false;',
'		}',
'	}',
'	return true;',
'}',
'',
'function setStatusForSaveButton() {',
'	//$("#BTN_SAVE_CLOSE").attr("disabled", "disabled");',
'	if (checkAllChildAges() == true && allRowsComplete() == true) {',
'	//	$("#BTN_SAVE_CLOSE").removeAttr("disabled");',
'        console.log(''button disabled'');',
'	}',
'}',
'',
'$(".css_calculate_age").change(function( e) {',
'    ',
'    var dob = this.value;',
'	var isSet = dob.trim().length > 0;',
'	var dobValid = isCambodianDateStringValid(dob);',
'	if (isSet && !dobValid) {',
'		$("#"+e.target.id + "_LABEL").text("");',
'		$("#"+e.target.id + "_LABEL").addClass("u-VisuallyHidden");',
'		return;',
'	}',
'    var dobNumber = parseInt(dob.substr(6, 4) + dob.substr(3, 2) + dob.substr(0, 2));',
'    var now = new Date();',
'    var nowNumber = (now.getFullYear()) * 10000 + (now.getMonth() + 1) * 100 + (now.getDate());',
'    var age = nowNumber - dobNumber;',
'    /*if (age < 0) {',
'        age += 1000000;',
'    }*/',
'    age = parseInt(age / 10000);',
'	if (!isNaN(age)) {',
'		$("#"+e.target.id + "_LABEL").text("Age: " + age);',
'		$("#"+e.target.id + "_LABEL").removeClass("u-VisuallyHidden");',
'	} else {',
'		$("#"+e.target.id + "_LABEL").text("");',
'		$("#"+e.target.id + "_LABEL").addClass("u-VisuallyHidden");',
'	}',
'});',
'',
'//$("input, select").change(setStatusForSaveButton);',
'',
'/*function SaveAndClose(){',
'// Save Children Data',
'var childstodelete = '''';',
'for (i = 1; i <= 20; i++) { ',
'	var srcdata = $(''#IMG_CHILD_''+i).attr(''src'');',
'    var actioncode = srcdata.substring(0, 2);',
'    ',
'    if (actioncode == ''da''){//picture was set in javascript, save into Session Bag',
'        StoreValueInSessionBag(''CHILD_''+i,$(''#IMG_CHILD_''+i).attr(''src'').split(",")[1]);        ',
'    }',
'    ',
'    if (actioncode == ''ws''){//no-picture was set in javascript, delete from session bag        ',
'        if (childstodelete == '''')',
'            childstodelete = childstodelete + ''CHILD_''+i;',
'        else',
'            childstodelete = childstodelete + "," + ''CHILD_''+i;    ',
'    }',
'    ',
'    ',
'    ',
'    ',
'}  ',
'',
'// delete child photos if necessary',
'deletechildphoto(childstodelete);',
'    ',
'// finally submit the page',
'apex.submit(''SUBMITANDCLOSE'');',
'',
'}  */',
''))
,p_javascript_code_onload=>'PARAMETER_REST_PREFIX = ''&AI_REST_PREFIX.'';'
,p_css_file_urls=>'#APP_IMAGES#Layout.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-BreadcrumbRegion-buttons {',
'	    display: none !important;',
'}'))
,p_step_template=>wwv_flow_api.id(563808839563049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'700'
,p_dialog_width=>'1200'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'MSTEPHAN'
,p_last_upd_yyyymmddhh24miss=>'20180531151336'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(925620118573251913)
,p_plug_name=>'Outer Frame'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:table"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(900423441710648147)
,p_plug_name=>'Child Enrollment Collective Passport'
,p_parent_plug_id=>wwv_flow_api.id(925620118573251913)
,p_icon_css_classes=>'fa-info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this page to register children traveling on the current passport.<br>',
'Please make sure the child''s face is properly visible and use the camera symbol to take a photo.'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843679147232768482)
,p_plug_name=>'LiveVideo'
,p_parent_plug_id=>wwv_flow_api.id(900423441710648147)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding: 0"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<img id = "CAMERA_PREVIEW_CHILD" style="max-height: 130px"/>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(925626383749334913)
,p_plug_name=>'Report Host'
,p_region_name=>'REPORT_HOST'
,p_parent_plug_id=>wwv_flow_api.id(925620118573251913)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(191040767836524437)
,p_name=>'Fellow Passengers'
,p_region_name=>'FELLOW_PASSENGERS'
,p_parent_plug_id=>wwv_flow_api.id(925626383749334913)
,p_template=>wwv_flow_api.id(563820435896049617)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<img src="#APP_IMAGES#trash.PNG" alt="delete" id="Delete_Row_''||seq_id||''" onclick="deleteRow(this.id);">'' Delete_row,',
'       ',
'       APEX_ITEM.HIDDEN(p_idx     => 1,',
'                        p_value   => c001,',
'                        p_item_id => ''f01_''||seq_id) key_value,',
'',
'       APEX_ITEM.SELECT_LIST_FROM_LOV(',
'        p_idx     => 2,',
'        p_value   => c002,',
'        p_lov     => ''LOV_RELATIONS_PK'',',
'        p_show_null => ''NO'',',
'        p_item_id => ''f02_''||seq_id) relation,',
'        ',
'       APEX_ITEM.TEXT(',
'        p_idx     => 3,',
'        p_value   => c003,',
'        p_item_id => ''f03_''||seq_id)last_name,',
'       ',
'       APEX_ITEM.TEXT(',
'        p_idx     => 4,',
'        p_value   => c004,',
'        p_item_id => ''f04_''||seq_id) first_name,',
'       ',
'       APEX_ITEM.DATE_POPUP2(',
'        p_idx      => 5,',
'        p_value    => c005,',
'        p_date_format => ''DD/MM/YYYY'',',
'        p_item_id => ''f05_''||seq_id,',
'        p_navigation_list_for => ''MONTH_AND_YEAR'',',
'        p_year_range => ''-100:+100'',',
'        p_attributes => ''style="width:80px"'') date_of_birth,',
'        ',
'       APEX_ITEM.SELECT_LIST_FROM_LOV(',
'        p_idx     => 6,',
'        p_value   => c006,',
'        p_lov     => ''LOV_SEX_PK'',',
'        p_show_null => ''NO'',',
'        p_item_id => ''f06_''||seq_id) sex,',
'        ',
'       APEX_ITEM.POPUP_FROM_LOV(',
'        p_idx     => 7,',
'        p_value   => c007,',
'        p_lov_name => ''LOV_NATIONALITY_PK'',',
'        p_item_id => ''f07_''||seq_id) nationality,',
'        ',
'       ''<img src="#WORKSPACE_IMAGES#no_photo_01.png"'' NO_PHOTO_PLACEHOLDER,',
'       ''text'' as button,',
'       ''delete'' as deletebutton,',
'       ',
'       APEX_ITEM.DISPLAY_AND_SAVE(',
'        p_idx         => 8,',
'        p_value       => seq_id,',
'        p_item_id     => ''f08_''||seq_id) as "ROWNUM",',
'        ',
'       ''<img id="IMG_CHILD_''||seq_id||''" style="border: 0px solid #CCC; -moz-border-radius: 0px; -webkit-border-radius: 0px;object-fit:contain; max-width: 110px;" ''||''src="''||decode(nvl(dbms_lob.getlength(BLOB001),0),0,''#WORKSPACE_IMAGES#no_photo_01.'
||'png'',apex_util.get_blob_file_src(''P18_IMAGE'',c001))||''" />'' childphoto ',
'from apex_collections',
'where collection_name = ''COLL_FELLOW_PASSENGER''',
'order by seq_id'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_header=>'<div style = "height: 365px; overflow:auto;">'
,p_footer=>'</div>'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(193998921702622994)
,p_query_column_id=>1
,p_column_alias=>'DELETE_ROW'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192785394709888412)
,p_query_column_id=>2
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192785477125888413)
,p_query_column_id=>3
,p_column_alias=>'RELATION'
,p_column_display_sequence=>5
,p_column_heading=>'Relation'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192785595598888414)
,p_query_column_id=>4
,p_column_alias=>'LAST_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Last Name'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192785651734888415)
,p_query_column_id=>5
,p_column_alias=>'FIRST_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'First Name'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192785745713888416)
,p_query_column_id=>6
,p_column_alias=>'DATE_OF_BIRTH'
,p_column_display_sequence=>6
,p_column_heading=>'Date of birth'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span style="display:block; width:130px">#DATE_OF_BIRTH#</span>'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192785829047888417)
,p_query_column_id=>7
,p_column_alias=>'SEX'
,p_column_display_sequence=>7
,p_column_heading=>'Gender'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192785988259888418)
,p_query_column_id=>8
,p_column_alias=>'NATIONALITY'
,p_column_display_sequence=>8
,p_column_heading=>'Nationality'
,p_use_as_row_header=>'N'
,p_display_when_cond_type=>'NEVER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192786098898888419)
,p_query_column_id=>9
,p_column_alias=>'NO_PHOTO_PLACEHOLDER'
,p_column_display_sequence=>13
,p_column_heading=>'No photo placeholder'
,p_use_as_row_header=>'N'
,p_display_when_cond_type=>'NEVER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192786220264888420)
,p_query_column_id=>10
,p_column_alias=>'BUTTON'
,p_column_display_sequence=>9
,p_column_heading=>'Take Photo'
,p_column_link=>'javascript:$(''#IMG_CHILD_#ROWNUM#'').attr(''src'', ''data:image/Jpeg;base64,''+getCurrentChildPhoto());$(''.css_calculate_age'').trigger(''change'');'
,p_column_linktext=>'<i class="fa fa-camera fa-3x"></i>'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192786270001888421)
,p_query_column_id=>11
,p_column_alias=>'DELETEBUTTON'
,p_column_display_sequence=>11
,p_column_heading=>'Delete Photo'
,p_column_link=>'javascript:$(''#IMG_CHILD_#ROWNUM#'').attr(''src'', ''dl_bordercontrol/r/files/static/v3463/no_photo_01.png'');$(''.css_calculate_age'').trigger(''change'');'
,p_column_linktext=>'<i class="fa fa-close fa-3x" style="color:red"></i>'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192787061053888429)
,p_query_column_id=>12
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>2
,p_column_heading=>'Row No'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(192786978480888428)
,p_query_column_id=>13
,p_column_alias=>'CHILDPHOTO'
,p_column_display_sequence=>10
,p_column_heading=>'Child Photo'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(925626694147337212)
,p_plug_name=>'Button Host'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(907340266169328440)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(925626694147337212)
,p_button_name=>'SUBMITANDCLOSE'
,p_button_static_id=>'BTN_SAVE_CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save and Close'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-circle-o'
,p_button_cattributes=>'style="margin-top: 1rem;float:right"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(192786601749888424)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(925626694147337212)
,p_button_name=>'New_Row'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'New Row'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus-circle'
,p_button_cattributes=>'style="margin-top: 1rem;"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176609022013283416)
,p_name=>'P12_VALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(925626694147337212)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192787164960888430)
,p_name=>'P12_MAX_ROWNUM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(925626694147337212)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193999157598622997)
,p_name=>'P12_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(925626694147337212)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(937591245048275992)
,p_name=>'P12_COLL_TO_DELETE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(925626694147337212)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(925637712956388893)
,p_name=>'DA_INIT_BUTTON_HOST'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(925638155296388927)
,p_event_id=>wwv_flow_api.id(925637712956388893)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#REPORT_HOST'').parent().css(''overflow'', ''auto'').css(''max-height'', ''440px'').css(''max-width'', ''99.6%'').css(''border-bottom'', ''1px solid #d6d6d6'');',
'$("#CAMERA_PREVIEW_CHILD").parent().parent().parent().parent().parent().parent().css("padding", "0").css("margin" ,"0");',
'/*var p = $("#CAMERA_PREVIEW_CHILD");',
'while (p != null && !p.hasClass(".t-HeroRegion-col")) {',
'  p = p.parent();',
'}',
'if (p != null) {',
'  p.css("padding", "0");',
'}*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937976545907805543)
,p_name=>'DA_SAVEANDCLOSE'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(907340266169328440)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937976913400805545)
,p_event_id=>wwv_flow_api.id(937976545907805543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.widget.waitPopup();',
'//SaveAndClose();',
'saveFellowPassangerBlob();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(938933758851903202)
,p_name=>'DA_PerformAgeCheck'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(938934121657903204)
,p_event_id=>wwv_flow_api.id(938933758851903202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".hasDatepicker").each(function(index, elem) {',
'    if ($(elem).val().length > 0) $(elem).trigger("change");',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(192786717476888425)
,p_name=>'New Row'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(192786601749888424)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192786759687888426)
,p_event_id=>wwv_flow_api.id(192786717476888425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_seq_num number;',
'begin',
'    apex_collection.add_member(p_collection_name => ''COLL_FELLOW_PASSENGER'',  ',
'                               p_c010 => ''I'',',
'                               p_c003 => null);',
'',
'    select max(seq_id)',
'    into :P12_MAX_ROWNUM',
'    from apex_collections',
'    where collection_name = ''COLL_FELLOW_PASSENGER'';',
'    ',
'end;'))
,p_attribute_03=>'P12_MAX_ROWNUM'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(192786920483888427)
,p_event_id=>wwv_flow_api.id(192786717476888425)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(191040767836524437)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(193999003124622995)
,p_name=>'Delete_Row'
,p_event_sequence=>50
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'Delete_Row'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193999080733622996)
,p_event_id=>wwv_flow_api.id(193999003124622995)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_id number;',
'  l_key_value FELLOW_PASSENGER.KEY_VALUE%type;',
'begin',
'  l_id := to_number(substr(:P12_ID, 12));',
'  ',
'  Select c001',
'    into l_key_value',
'    from apex_collections',
'   where collection_name = ''COLL_FELLOW_PASSENGER''',
'     and seq_id = l_id;',
'     ',
'  delete DL_BORDERCONTROL.FELLOW_PASSENGER',
'   where key_value = l_key_value;',
'  commit;',
'  ',
'  DL_MOVEMENTHANDLING.Load_Fellow_Passenger(:P17_MVMNTID',
'                                          , :MOVEMENT_ENTRY_EXIT',
'                                          , :DG_DOCUMENTNUMBER',
'                                          , :P17_NATIONALITY',
'                                          , :P17_DISPLAY_EXPIRYDATE);',
'                                          ',
'  select max(seq_id)',
'    into :P12_MAX_ROWNUM',
'    from apex_collections',
'    where collection_name = ''COLL_FELLOW_PASSENGER'';',
'        ',
'end;'))
,p_attribute_02=>'P12_ID'
,p_attribute_03=>'P12_MAX_ROWNUM'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(193999319457622998)
,p_event_id=>wwv_flow_api.id(193999003124622995)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(191040767836524437)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(195021892695621190)
,p_event_id=>wwv_flow_api.id(193999003124622995)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(176608836434283414)
,p_name=>'Save Collection'
,p_event_sequence=>60
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input[name="f03"],input[name="f04"],select[name="f02"],input[name="f05"],select[name="f06"]'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#FELLOW_PASSENGERS'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176608895326283415)
,p_event_id=>wwv_flow_api.id(176608836434283414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.id'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176609307637283419)
,p_event_id=>wwv_flow_api.id(176608836434283414)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_VALUE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176609346310283420)
,p_event_id=>wwv_flow_api.id(176608836434283414)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_seq_id  number;',
'  l_column  number;',
'  l_value   varchar2(500);',
'begin',
'  select substr(:P12_ID,instr(:P12_ID, ''_'')+1)',
'  into l_seq_id',
'  from dual;',
'  ',
'  select to_number(substr(:P12_ID,2,2))',
'  into l_column',
'  from dual;',
'  ',
'  apex_collection.update_member_attribute(',
'    p_collection_name   => ''COLL_FELLOW_PASSENGER'',',
'    p_seq               => l_seq_id,',
'    p_attr_number       => l_column,',
'    p_attr_value        => :P12_VALUE);',
'end;'))
,p_attribute_02=>'P12_ID,P12_VALUE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(192787405507888432)
,p_process_sequence=>15
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Fellow Passengers'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DL_MOVEMENTHANDLING.Save_Fellow_Passanger(p_MVMNTID          => :P17_MVMNTID',
'                                      ,p_KEY_VALUE        => apex_application.g_F01',
'                                      ,p_RELATION         => apex_application.g_F02',
'                                      ,p_LAST_NAME        => apex_application.g_F03',
'                                      ,p_FIRST_NAME       => apex_application.g_F04',
'                                      ,p_DATE_OF_BIRTH    => apex_application.g_F05',
'                                      ,p_SEX              => apex_application.g_F06',
'                                      --,p_NATIONALITY      => apex_application.g_F07',
'                                      ,p_SEQ_NO           => apex_application.g_F08',
'                                      );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(907363976476390444)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'PROC_CLOSE_DIALOG'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(193606756996926692)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Collection Fellow Passenger'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DL_MOVEMENTHANDLING.Load_Fellow_Passenger(:P17_MVMNTID',
'                                          , :MOVEMENT_ENTRY_EXIT',
'                                          , :DG_DOCUMENTNUMBER',
'                                          , :P17_NATIONALITY',
'                                          , :P17_DISPLAY_EXPIRYDATE);',
'                                          ',
'select max(seq_id)',
'    into :P12_MAX_ROWNUM',
'    from apex_collections',
'    where collection_name = ''COLL_FELLOW_PASSENGER'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(937609360665310117)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_DELETE_CHILD_PHOTOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   BAR   VARCHAR2 (1024) := :P12_COLL_TO_DELETE;',
'BEGIN',
'   FOR FOO IN (    SELECT REGEXP_SUBSTR (BAR,',
'                                         ''[^,]+'',',
'                                         1,',
'                                         LEVEL)',
'                             TXT',
'                     FROM DUAL',
'               CONNECT BY REGEXP_SUBSTR (BAR,',
'                                         ''[^,]+'',',
'                                         1,',
'                                         LEVEL)',
'                             IS NOT NULL)',
'   LOOP',
'      ',
'      ',
'      PKG_APEX_UTIL.COLL_Init(FOO.TXT);',
'      APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => FOO.TXT,p_seq => ''1'',p_c050 =>FOO.TXT, p_n001 => to_number(substr(FOO.TXT, 7)));    ',
'   END LOOP;',
'END;',
'',
'',
'',
'',
''))
);
end;
/
