prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(92393441321433977)
,p_name=>'Collective Passport'
,p_page_mode=>'MODAL'
,p_step_title=>'Collective Passport'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Collective Passport'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#Logging.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'noFellowPassengerImage = ''#APP_IMAGES#noimage.jpg'';',
'',
'function deleteRow(triggeringElement){',
'    var seqId = $(triggeringElement).attr(''seqId'');',
'    $(triggeringElement).parent().parent().remove();',
'    ',
'    apex.server.process ( ',
'    "DELETE_ROW",',
'    {',
'		x01 : seqId',
'    },',
'    {',
'		success: function (pData) ',
'		{',
'			console.log("Deleted Row From Collection");',
'			console.log(pData);',
'            apex.submit({  request:"SAVE",  showWait:true});',
'		}',
'    });',
'}',
'',
'function takePhoto(triggeringElement)',
'{',
'    var seqId = $(triggeringElement).attr(''seqId'');',
'    var currentPhoto = getCurrentChildPhoto();',
'    ',
'    var imageElement = $(triggeringElement).parent().siblings("td[headers=''CHILDPHOTO'']").find(''img'');',
'    imageElement.attr(''src'', ''data:image/Jpeg;base64,'' + currentPhoto);',
'    ',
'    //$(''#IMG_CHILD_'' + seqId).attr(''src'', ''data:image/Jpeg;base64,''+ getCurrentChildPhoto());',
'    ',
'    apex.server.process ( ',
'    "SAVE_IMAGE",',
'    {',
'		p_clob_01: currentPhoto,',
'		x01 : seqId',
'    },',
'    {',
'		success: function (pData) ',
'		{',
'			console.log("Image Saved into Collection");',
'			console.log(pData);',
'		}',
'    });',
'}',
'function deletePhoto(triggeringElement)',
'{',
'    var seqId = $(triggeringElement).attr(''seqId'');',
'    var currentPhoto = getCurrentChildPhoto();',
'    ',
'    var imageElement = $(triggeringElement).parent().siblings("td[headers=''CHILDPHOTO'']").find(''img'');',
'    imageElement.attr(''src'', noFellowPassengerImage);',
'    ',
'    //$(''#IMG_CHILD_'' + seqId).attr(''src'', ''data:image/Jpeg;base64,''+ getCurrentChildPhoto());',
'    ',
'    apex.server.process ( ',
'    "DELETE_IMAGE",',
'    {',
'		x01 : seqId',
'    },',
'    {',
'		success: function (pData) ',
'		{',
'			console.log("Image Deleted from Collection");',
'			console.log(pData);',
'		}',
'    });',
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
'}',
'/*',
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
'		}',
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
'    }',
'    age = parseInt(age / 10000);',
'	if (!isNaN(age)) {',
'		$("#"+e.target.id + "_LABEL").text("Age: " + age);',
'		$("#"+e.target.id + "_LABEL").removeClass("u-VisuallyHidden");',
'	} else {',
'		$("#"+e.target.id + "_LABEL").text("");',
'		$("#"+e.target.id + "_LABEL").addClass("u-VisuallyHidden");',
'	}',
'});',
'*/',
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
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#css/CollectivePassportLayout.css',
'#WORKSPACE_IMAGES#roboto.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-BreadcrumbRegion-buttons {',
'	    display: none !important;',
'}',
'',
'thead tr, .reportRow{',
'    background-color:white;',
'}',
'',
'td[headers="CHILDPHOTO"] img',
'{',
'    width: 110px;',
'}',
'',
'.t-Report-cell[headers="ROWNUM"]{',
'    padding:0px;',
'}',
'',
'.monospaced {',
'    font-family: ''Roboto Mono'';',
'}',
'',
'body {',
'    font-family: ''Roboto'';',
'}',
''))
,p_step_template=>wwv_flow_api.id(92344533253433677)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_height=>'700'
,p_dialog_width=>'1350'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'MSTEPHAN'
,p_last_upd_yyyymmddhh24miss=>'20181005140838'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(993974773530134959)
,p_plug_name=>'Outer Frame'
,p_region_name=>'outerFrame'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92349780431433729)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(968778096667531193)
,p_plug_name=>'Child Enrollment Collective Passport'
,p_region_name=>'collectivePassportInfo'
,p_parent_plug_id=>wwv_flow_api.id(993974773530134959)
,p_icon_css_classes=>'fa-info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92354519893433744)
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
 p_id=>wwv_flow_api.id(912033802189651528)
,p_plug_name=>'LiveVideo'
,p_parent_plug_id=>wwv_flow_api.id(968778096667531193)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding: 0"'
,p_plug_template=>wwv_flow_api.id(92349780431433729)
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
 p_id=>wwv_flow_api.id(993981038706217959)
,p_plug_name=>'Report Host'
,p_region_name=>'reportHost'
,p_parent_plug_id=>wwv_flow_api.id(993974773530134959)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92349780431433729)
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
 p_id=>wwv_flow_api.id(259395422793407483)
,p_name=>'Fellow Passengers'
,p_parent_plug_id=>wwv_flow_api.id(993981038706217959)
,p_template=>wwv_flow_api.id(92356180518433747)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT        ',
'        ROWNUM || APEX_ITEM.HIDDEN(',
'        p_idx         => 1,',
'        p_value       => KEY_VALUE, ',
'        p_item_id     => ''f01_''||KEY_VALUE) as "Rownum",',
'        t1.* FROM (Select ',
'       KEY_VALUE,',
'       KEY_VALUE Delete_row,',
'',
'       APEX_ITEM.SELECT_LIST_FROM_LOV(',
'        p_idx     => 2,',
'        p_value   => RELATION,',
'        p_lov     => ''LOV_RELATIONS'', ',
'        p_show_null => ''NO'',',
'        p_item_id => ''f02_''||KEY_VALUE,',
'        p_attributes => ''class="selectlist apex-item-select"'') relation,',
'        ',
'       APEX_ITEM.TEXT(',
'        p_idx     => 3,',
'        p_value   => LAST_NAME,',
'        p_item_id => ''f03_''||KEY_VALUE,',
'        p_attributes => ''class="text_field apex-item-text"'')last_name,',
'       ',
'       APEX_ITEM.TEXT(',
'        p_idx     => 4,',
'        p_value   => FIRST_NAME,',
'        p_item_id => ''f04_''||KEY_VALUE,',
'        p_attributes => ''class="text_field apex-item-text"'') first_name,',
'                   ',
'       APEX_ITEM.TEXT(',
'        p_idx     => 8,',
'        p_value   => TM6_NO,',
'        p_item_id => ''f08_''||KEY_VALUE,',
'        p_attributes => ''class="text_field apex-item-text"'') tm6_no,',
'       ',
'       APEX_ITEM.DATE_POPUP2(',
'        p_idx      => 5,',
'        p_value    => DATE_OF_BIRTH,',
'        p_date_format => ''DD/MM/YYYY'',',
'        p_item_id => ''f05_''||KEY_VALUE,',
'        p_navigation_list_for => ''MONTH_AND_YEAR'',',
'        p_year_range => ''-100:+100'',',
'        p_attributes => ''style="width:95px; padding-top: 2px;" class="datepicker apex-item-text apex-item-datepicker"'') date_of_birth,',
'        ',
'       APEX_ITEM.SELECT_LIST_FROM_LOV(',
'        p_idx     => 6,',
'        p_value   => GENDER,',
'        p_lov     => ''LOV_GENDERS_VC'',',
'        p_show_null => ''NO'',',
'        p_item_id => ''f06_''||KEY_VALUE,',
'        p_attributes => ''class="selectlist apex-item-select"'') sex,',
'                   ',
'       APEX_ITEM.SELECT_LIST(',
'        p_idx     => 7,',
'        p_value   => NATIONALITY,',
'        p_list_values   => '''',',
'        p_item_id => ''f07_''||KEY_VALUE,',
'        p_attributes => ''class="selectlist apex-item-select nationalities" style="max-width: 222px"'') nationality,',
'       /* ',
'       APEX_ITEM.POPUP_FROM_LOV(',
'        p_idx     => 7,',
'        --p_width   => 8,',
'        p_value   => NATIONALITY,',
'        p_lov_name => ''LOV_NATIONALITY_PK'',',
'        p_item_id => ''f07_''||KEY_VALUE,',
'        p_attributes => ''style="width: 50px; border-color: #a9a9a9; background-color: #fff;" class="popup_lov apex-item-text apex-item-popup-lov"'') nationality,*/',
'',
'       KEY_VALUE as TAKE_PHOTO,',
'       KEY_VALUE as DELETE_PHOTO,',
'        --seq_id as childphoto',
'        dbms_lob.getlength(IMAGE) childphoto ',
'from TMP_COLLECTIVE_PASSPORT_DATA',
'where APP_SESSION = v(''APP_SESSION'')',
'order by INSERT_AT DESC) t1'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(92369713901433801)
,p_query_num_rows=>500
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95671719929938521)
,p_query_column_id=>1
,p_column_alias=>'Rownum'
,p_column_display_sequence=>2
,p_column_heading=>'Row'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95671303220938520)
,p_query_column_id=>2
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95672103522938522)
,p_query_column_id=>3
,p_column_alias=>'DELETE_ROW'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span class="fa fa-trash" aria-hidden="true" alt="delete" id="Delete_Row_#DELETE_ROW#" seqid="#DELETE_ROW#" onclick="deleteRow(this);" style="color: red; cursor: pointer;"></span>'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95672538005938524)
,p_query_column_id=>4
,p_column_alias=>'RELATION'
,p_column_display_sequence=>5
,p_column_heading=>'Relation'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-fieldContainer">',
'    <div class="t-Form-itemWrapper">',
'        #RELATION#',
'    </div>',
'</div>'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95672914507938525)
,p_query_column_id=>5
,p_column_alias=>'LAST_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Last Name'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-fieldContainer">',
'    <div class="t-Form-itemWrapper">',
'        #LAST_NAME#',
'    </div>',
'</div>',
''))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95673318023938526)
,p_query_column_id=>6
,p_column_alias=>'FIRST_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'First Name'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-fieldContainer">',
'    <div class="t-Form-itemWrapper">',
'        #FIRST_NAME#',
'    </div>',
'</div>'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(44650248621055127)
,p_query_column_id=>7
,p_column_alias=>'TM6_NO'
,p_column_display_sequence=>9
,p_column_heading=>'TM6 No.'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95673677039938527)
,p_query_column_id=>8
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
 p_id=>wwv_flow_api.id(95674117090938529)
,p_query_column_id=>9
,p_column_alias=>'SEX'
,p_column_display_sequence=>7
,p_column_heading=>'Gender'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-fieldContainer">',
'    <div class="t-Form-itemWrapper">',
'        #SEX#',
'    </div>',
'</div>'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95674505833938530)
,p_query_column_id=>10
,p_column_alias=>'NATIONALITY'
,p_column_display_sequence=>8
,p_column_heading=>'Nationality'
,p_use_as_row_header=>'N'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-fieldContainer">',
'    <div class="t-Form-itemWrapper">',
'        #NATIONALITY# ',
'    </div>',
'</div>'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95670567930938513)
,p_query_column_id=>11
,p_column_alias=>'TAKE_PHOTO'
,p_column_display_sequence=>10
,p_column_heading=>'Take photo'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span class="fa fa-camera fa-3x" aria-hidden="true" alt="take" id="Take_Photo_#TAKE_PHOTO#" seqid="#TAKE_PHOTO#" onclick="takePhoto(this);" style="cursor: pointer;"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95671028324938518)
,p_query_column_id=>12
,p_column_alias=>'DELETE_PHOTO'
,p_column_display_sequence=>12
,p_column_heading=>'Delete photo'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span class="fa fa-times fa-3x" aria-hidden="true" alt="delete" id="Delete_Photo_#DELETE_PHOTO#" seqid="#DELETE_PHOTO#" onclick="deletePhoto(this);" style="color:red; cursor: pointer;"></span>'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(95674899583938532)
,p_query_column_id=>13
,p_column_alias=>'CHILDPHOTO'
,p_column_display_sequence=>11
,p_column_heading=>'Child Photo'
,p_use_as_row_header=>'N'
,p_column_format=>'IMAGE:V_COLLECTIVE_PASSPORT_PICTURES:IMAGE:KEY_VALUE::MIME_TYPE::::::'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(993981349104220258)
,p_plug_name=>'Button Host'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(92350242746433731)
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
 p_id=>wwv_flow_api.id(95666750346938455)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(993981349104220258)
,p_button_name=>'SUBMITANDCLOSE'
,p_button_static_id=>'BTN_SAVE_CLOSE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save and Close'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-check-circle-o'
,p_button_cattributes=>'style="margin-top: 1rem;float:right"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95667100637938459)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(993981349104220258)
,p_button_name=>'New_Row'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(92382733427433869)
,p_button_image_alt=>'New Row'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus-circle'
,p_button_cattributes=>'style="margin-top: 1rem;"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95668735730938487)
,p_name=>'P20_KEY_VALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(993981349104220258)
,p_use_cache_before_default=>'NO'
,p_source=>'SELECT SYS_GUID() FROM DUAL;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95677660948938579)
,p_name=>'DA_INIT_BUTTON_HOST'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95678175338938583)
,p_event_id=>wwv_flow_api.id(95677660948938579)
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
 p_id=>wwv_flow_api.id(95678585261938584)
,p_name=>'New Row'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(95667100637938459)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95679133732938586)
,p_event_id=>wwv_flow_api.id(95678585261938584)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_key_value FELLOW_PASSENGER.KEY_VALUE%type;',
'BEGIN',
'    l_key_value := PKG_COLLECTIVE_PASSPORT.ADD_EMPTY_PASSENGER();',
'END;'))
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95679651800938587)
,p_event_id=>wwv_flow_api.id(95678585261938584)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95680009093938588)
,p_name=>'Fix missing Images'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95680488693938589)
,p_event_id=>wwv_flow_api.id(95680009093938588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.t-Report-cell[headers="CHILDPHOTO"]'').each(',
'    function(index, element) ',
'    {  ',
'        var numberOfImages = $(element).has( ''img'').length; console.log(numberOfImages);  ',
'        if(numberOfImages == 0)',
'        {',
'            $(element).append(''<img src="#APP_IMAGES#noimage.jpg">'');',
'        }',
'    }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(44650563548055131)
,p_name=>'LOAD_NATIONALITIES'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44650678418055132)
,p_event_id=>wwv_flow_api.id(44650563548055131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process(',
'    ''GET_NATIONALITIES'',                           ',
'    {',
'',
'    }, ',
'    {',
'        success: function (pData)',
'        {           ',
'            console.log(pData);',
'            nationalities = pData;',
'            for (var key in pData) {',
'                if (pData.hasOwnProperty(key)) {',
'                    //console.log(key + " -> " + pData[key]);',
'                    //var myElement = $(".nationalities option[value=''"+key+"'']")',
'                    //myElement.html(pData[key]);',
'                    $(".nationalities").append(new Option(pData[key],key));',
'                }',
'            }',
'            ',
'            let preselectNationality = null;',
'            if (!!parent.getNationality && typeof parent.getNationality === "function") {',
'                preselectNationality = parent.getNationality();',
'            }',
'            ',
'            $(''.nationalities'').each(function()',
'            {',
'                $(this).addClass("monospaced");',
'                ',
'                var myelement = $(this).find("option:selected");',
'                console.log(myelement);',
'                ',
'                var selectThis = myelement.val();',
'                console.log(selectThis);',
'                ',
'                if(selectThis.length > 0)',
'                {',
'                    myelement.remove();',
'',
'                    $(this).find(''option[value=''+selectThis+'']'').attr(''selected'',''selected'');',
'                } else {',
'                    if (!!preselectNationality) {',
'                        $(this).val(preselectNationality);',
'                    }',
'                }',
'',
'            });',
'',
'',
'        },',
'		error: function(pData)',
'        {',
'			console.log(pData);',
'        }          ',
'    }',
');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95675290109938570)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create First Fellow Passenger'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_COLLECTIVE_PASSPORT.INIT_TEMP_TABLE();',
'    '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95676532751938575)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_COLLECTIVE_PASSPORT.SAVE_IMAGE(apex_application.g_x01, apex_application.g_clob_01);',
'',
'',
'--Write some JSON out for the response',
'apex_json.open_object();',
'apex_json.write(''status'', ''success'');',
'apex_json.write(''seqId'', apex_application.g_x01);',
'apex_json.write(''action'', ''save_image'');',
'apex_json.write(''image'', apex_application.g_clob_01 );',
'apex_json.close_object();',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95676870162938576)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_COLLECTIVE_PASSPORT.SAVE_IMAGE(apex_application.g_x01, NULL);',
'',
'--Write some JSON out for the response',
'apex_json.open_object();',
'apex_json.write(''status'', ''success'');',
'apex_json.write(''seqId'', apex_application.g_x01);',
'apex_json.write(''action'', ''delete_image'');',
'apex_json.close_object();',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95677299951938577)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_ROW'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_COLLECTIVE_PASSPORT.DELETE_FELLOW_PASSENGER(apex_application.g_x01);',
'',
'apex_json.open_object();',
'apex_json.write(''status'', ''success'');',
'apex_json.write(''seqId'', apex_application.g_x01);',
'apex_json.write(''action'', ''delete_row'');',
'apex_json.close_object();'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44650482640055130)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_NATIONALITIES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'BEGIN',
'    apex_json.open_object;',
'                 ',
'    FOR i_rec IN (SELECT key_value || '' - '' || NVL(display_value, display_value$dlc) d, key_value r',
'          FROM dl_common.icao_doc_codes$lc',
'          WHERE is_active = ''Y''',
'          ORDER BY lower(NVL(display_value, display_value$dlc)) ASC) LOOP -- display_order ASC) LOOP',
'     ',
'        apex_json.write(i_rec.R, i_rec.D);',
'',
'     ',
'    END LOOP;',
'    apex_json.close_all; ',
' ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95676131748938574)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Collective Passport'
,p_process_sql_clob=>'PKG_COLLECTIVE_PASSPORT.PROCESS_FXX_DATA();'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95675752512938573)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_01=>'P20_KEY_VALUE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95666750346938455)
);
null;
end;
/
