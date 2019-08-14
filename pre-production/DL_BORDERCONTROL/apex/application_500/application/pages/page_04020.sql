prompt --application/pages/page_04020
begin
wwv_flow_api.create_page(
 p_id=>4020
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Edit Movement'
,p_page_mode=>'MODAL'
,p_step_title=>'Edit Movement'
,p_step_sub_title=>'View/Edit Movement 2'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#jquery.mask.min.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#APP_IMAGES#dynamicActionsPage4020.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function apexCustomEvent(event, data){',
'    apex.event.trigger(document, event, data);',
'}',
'',
'function loadLookUpItems() {',
'    ',
'    // load data into items...',
'    apex.event.trigger("#P4020_VEHICLE_TYPE_D", "checkVehicleTypeD");',
'',
'    apex.event.trigger("#P4020_DISPLAY_FIRSTNAME", "change");',
'    apex.event.trigger("#P4020_DISPLAY_LASTNAME", "change");',
'    apex.event.trigger("#P4020_DISPLAY_GENDER", "change");',
'    apex.event.trigger("#P4020_DISPLAY_DOB_TEXT", "change");',
'    apex.event.trigger("#P4020_TRAVELCARD_NO", "change");',
'    apex.event.trigger("#P4020_TRNSPRTUNITID", "change");',
'    ',
'    if ($("#P4020_VEHICLE_TYPE_D option").length > 1 && $("#P4020_VEHICLE_TYPE_D").val() == "") {',
'        $("#P4020_VEHICLE_TYPE_D").val($("#P4020_VEHICLE_TYPE_D option:nth-child(2)").val()).trigger("change");',
'    }',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("GET_BC_DOC_TYPE_IDS", ',
'{}, ',
'{',
'    success: function(pData) ',
'    {',
'        GET_VEHICLE_TYPE_IDS = pData[0];',
'        GET_VEHICLE_TYPE_KEY_VALUES = pData[1];',
'        GET_VISA_TYPE_IDS = pData[2];',
'        GET_VISA_TYPE_KEY_VALUES = pData[3];',
'        GET_PERMIT_TYPE_IDS = pData[4];',
'        GET_PERMIT_TYPE_KEY_VALUES = pData[5];',
'        GET_PROVINCE_IDS = pData[6];',
'        GET_PROVINCE_KEY_VALUES = pData[7];',
'        GET_NATIONALITY_PIB_IDS = pData[8];',
'        ',
'        console.log(pData);',
'        ',
'        loadLookUpItems();',
'    }',
'});',
'',
'//loadLookUpItems();',
'',
'//stateless',
'let isStateless = $("#P4020_STATELESS").val() != "";',
'if (isStateless) {',
'    apex.event.trigger("#P4020_STATELESS", "change");',
'    apex.event.trigger(document, "toggleStatelessOption");',
'}',
'',
'//dob',
'$("#P4020_DISPLAY_DOB_TEXT").on("change", function() {',
'    var dt = $(this).val();',
'    var target = $(this).attr("data-short-target");',
'    if (dt.length == 10 && $(this).hasClass("autovalidatedatepicker_valid") && $(this)) {',
'        $(target).val(dt.substr(8, 2) + dt.substr(3, 2) + dt.substr(0, 2));',
'    }',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label {',
'font-weight:bold;',
'}',
'',
'.field-warn {',
'    background-color: #FFE200 !important;',
'}',
'',
'.cl-hidden {',
'    display: none;',
'}',
'',
'.cl-stateless-active {',
'    background-color: #FFE200 !important;',
'    color: #000000 !important;',
'}',
'',
'.cl-flash {',
'    -webkit-animation: cl-flash-a 1s ease-out;',
'    -webkit-animation-iteration-count: 1;',
'',
'    -moz-animation: cl-flash-a 1s ease-out;',
'    -moz-animation-iteration-count: 1;',
'',
'    -ms-animation: cl-flash-a 1s ease-out;',
'    -ms-animation-iteration-count: 1;',
'    ',
'    animation:cl-flash-a 1s ease-out;',
'    animation-iteration-count: 1;',
'}',
'',
'@-webkit-keyframes cl-flash-a {',
'    0% { background-color: transparent; }',
'    50% { background-color: #FFC000; }',
'    100% { background-color: transparent; }',
'}',
'',
'@-moz-keyframes cl-flash-a {',
'    0% { background-color: transparent; }',
'    50% { background-color: #FFC000; }',
'    100% { background-color: transparent; }',
'}',
'',
'@-ms-keyframes cl-flash-a {',
'    0% { background-color: transparent; }',
'    50% { background-color: #FFC000; }',
'    100% { background-color: transparent; }',
'}',
'',
'@keyframes cl-flash-a {',
'    0% { background-color: transparent; }',
'    50% { background-color: #FFE200; }',
'    100% { background-color: transparent; }',
'}',
'',
'#P4020_TOGGLE_STATELESS {',
'    margin-top: 3.7em;',
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
'#P4020_DISPLAY_DOB {',
'    visibility: hidden;',
'    margin-left: -6rem;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_width=>'50%'
,p_dialog_css_classes=>'no-close cl-page-edit-mvmnt-4020'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190724182306'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95459139301695442)
,p_plug_name=>'HIDDEN'
,p_region_name=>'ID_REG_HIDDEN'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95459402440695445)
,p_plug_name=>'Edit Region'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
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
 p_id=>wwv_flow_api.id(225524649360780643)
,p_plug_name=>'Remarks'
,p_parent_plug_id=>wwv_flow_api.id(95459402440695445)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>800
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(225524792392780644)
,p_plug_name=>'Remarks Items'
,p_parent_plug_id=>wwv_flow_api.id(225524649360780643)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
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
 p_id=>wwv_flow_api.id(578443083276857153)
,p_plug_name=>'CELL7'
,p_region_name=>'REG_LAYOUT_1_2'
,p_parent_plug_id=>wwv_flow_api.id(95459402440695445)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--large'
,p_region_attributes=>'style="overflow:hidden"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>600
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960318905867074238)
,p_plug_name=>'VISUM'
,p_parent_plug_id=>wwv_flow_api.id(578443083276857153)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(578469281638881846)
,p_plug_name=>'CELL8'
,p_region_name=>'REG_LAYOUT_1_3'
,p_parent_plug_id=>wwv_flow_api.id(95459402440695445)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>700
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960345070496098931)
,p_plug_name=>'LC_RIGHT'
,p_parent_plug_id=>wwv_flow_api.id(578469281638881846)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1037564549405087704)
,p_plug_name=>'CELL14'
,p_region_name=>'CELLE14'
,p_parent_plug_id=>wwv_flow_api.id(95459402440695445)
,p_region_template_options=>'#DEFAULT#:t-Form--large'
,p_region_attributes=>'style="position: relative; padding: 0;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>510
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
 p_id=>wwv_flow_api.id(312821812170313868)
,p_plug_name=>'General Information'
,p_parent_plug_id=>wwv_flow_api.id(1037564549405087704)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1038457430417573472)
,p_plug_name=>'VCENTER14'
,p_parent_plug_id=>wwv_flow_api.id(1037564549405087704)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1038330193414090900)
,p_plug_name=>'Document Information'
,p_parent_plug_id=>wwv_flow_api.id(1038457430417573472)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100159
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
 p_id=>wwv_flow_api.id(1052837830529082963)
,p_plug_name=>'DOC_INFO_RIGHT'
,p_parent_plug_id=>wwv_flow_api.id(1038330193414090900)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3746563591952942059)
,p_plug_name=>'DOC_INFO_LEFT'
,p_parent_plug_id=>wwv_flow_api.id(1038330193414090900)
,p_region_css_classes=>'region-show-dialog-button'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'no-padding'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213168247896155864)
,p_plug_name=>'Button Region'
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
 p_id=>wwv_flow_api.id(267707985904105246)
,p_plug_name=>'History'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>1000
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(267948370041143141)
,p_plug_name=>'Comments'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>900
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117710248295460454)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(213168247896155864)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2811516485251452614)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3746563591952942059)
,p_button_name=>'P4020_TOGGLE_STATELESS'
,p_button_static_id=>'P4020_TOGGLE_STATELESS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Stateless'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-globe'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2842098635370083646)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(213168247896155864)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Delete'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'    return true;',
'  else',
'    return false;',
'  end if;',
'  ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117710563717460454)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(213168247896155864)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95459219256695443)
,p_name=>'P4020_MVMNTID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95459139301695442)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117727873531460473)
,p_name=>'P4020_DATE_OF_ENTRY_HIS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Movement Date:'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>55
,p_cMaxlength=>255
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117728212770460474)
,p_name=>'P4020_INS_BY'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Officer:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1020
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117728625235460474)
,p_name=>'P4020_INS_TERMINAL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Terminal:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TERMINALS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(NAME,NAME$DLC) d,',
'   id r',
'FROM',
'    DL_BORDERCONTROL.TERMINALS$LC',
'    where ACTIVE = 1 ',
'    order by NAME',
'    ;'))
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117729026619460474)
,p_name=>'P4020_INS_BORDERPOST'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Borderpost:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(NAME,NAME$DLC) d,',
'   key_value r',
'FROM',
'    DL_BORDERCONTROL.BORDERPOSTS$LC',
'    where IS_ACTIVE = ''Y''',
'    order by NAME',
'    ;'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117729494022460474)
,p_name=>'P4020_SOURCE_SYSTEM'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Source System:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:BIO;BIO,PIB;PIB,ATC;ATC,N/A;N/A'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117729845986460474)
,p_name=>'P4020_DML_BY'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Last updated by:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1020
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117730290500460475)
,p_name=>'P4020_DML_AT'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Last updated at:'
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>55
,p_cMaxlength=>10
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117730614363460475)
,p_name=>'P4020_PS_3'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Supervisor:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1024
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117731010385460475)
,p_name=>'P4020_PS_4'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Supervisor Reason:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1024
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117731462505460475)
,p_name=>'P4020_INS_AT'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'Movement Date:'
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>55
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117731807755460476)
,p_name=>'P4020_DML_TYPE'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_prompt=>'DML Type'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>4
,p_grid_label_column_span=>1
,p_display_when_type=>'NEVER'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117732280223460476)
,p_name=>'P4020_MOVEMENT_DT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(267707985904105246)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117800479790692679)
,p_name=>'P4020_MOVEMENT_ENTRY_EXIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(312821812170313868)
,p_prompt=>'Direction:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_cHeight=>1
,p_tag_attributes=>'style="width:300px"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE mandatory-field'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117800843524692679)
,p_name=>'P4020_TRNSPRTUNITID_SEA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(312821812170313868)
,p_prompt=>'Vehicle Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE '
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE force-numeric-input'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117801296698692679)
,p_name=>'P4020_VEHICLE_TYPE_D'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(312821812170313868)
,p_item_default=>'0001'
,p_prompt=>'Vehicle Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.DISPLAY_VALUE, t0.key_value',
'  from dl_common.TRANS_VEHICLES$LC t0',
' inner join dl_common.TRANS_MODES t1',
'    on (t0.TRANS_MODE is null or t0.TRANS_MODE = t1.KEY_VALUE)',
' inner join dl_common.BORDER_TYPES t2',
'    on (t1.BORDER_TYPE is null or t1.BORDER_TYPE = t2.KEY_VALUE)',
' where t2.KEY_VALUE = :AI_BORDER_TYPE',
' and t0.is_active = ''Y''',
' order by ',
'   case ',
'     when :AI_TRANSPORT_MODE = 2 and t0.key_value = ''OTHERS'' then 1',
'     when :AI_TRANSPORT_MODE = 1 and t0.key_value = ''SHIP'' then 1',
'     else 2',
'   end,',
'   t0.DISPLAY_VALUE'))
,p_lov_display_null=>'YES'
,p_tag_css_classes=>'mandatory-field'
,p_tag_attributes=>'style="width:200px"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117802484728692680)
,p_name=>'P4020_IS_CREW_MEMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(312821812170313868)
,p_prompt=>'Crew:'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117802800908692681)
,p_name=>'P4020_TRAVELCARD_NO'
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_api.id(312821812170313868)
,p_prompt=>'TM6 No.:'
,p_placeholder=>'XX99999'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>7
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_tag_attributes=>'do-auto-uppercase mask-pattern="aabbbbb" mask-pattern-a="/[A-Z]/" mask-pattern-b="/[0-9]/"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117803244773692681)
,p_name=>'P4020_DATE_OF_ENTRY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(312821812170313868)
,p_item_default=>'to_char(sysdate, ''DD/MM/YYYY HH24:MI'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Date of Entry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_css_classes=>'mandatory-field'
,p_grid_label_column_span=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117806595976692687)
,p_name=>'P4020_DOC_CLASS_ID'
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'mandatory-field force-numeric-input'
,p_grid_label_column_span=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117806996536692687)
,p_name=>'P4020_DISPLAY_DOCCLASS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DOCUEMENT_CLASS_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'mandatory-field'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117807333820692687)
,p_name=>'P4020_DISPLAY_DOCTYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Document Type:'
,p_placeholder=>'Type'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'mandatory-field auto-upper-case'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117807753827692687)
,p_name=>'P4020_NATIONALITY_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117808117621692688)
,p_name=>'P4020_NATIONALITY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Nationality:'
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
,p_tag_css_classes=>'mandatory-field'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117808519702692688)
,p_name=>'P4020_SUBNAT_PLACEHOLDER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Sub-Nationality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117808966454692688)
,p_name=>'P4020_SUBNATIONALITY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Subnationality'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, r from (',
'    select ''A'' d, 1 r, ''CHN'' p from dual union all select ''B'', 2, ''CHN'' from dual union all select ''C'', 3, ''CHN'' from dual',
')',
'where p = :P4020_NATIONALITY'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P4020_NATIONALITY'
,p_ajax_items_to_submit=>'P4020_NATIONALITY'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117809320475692688)
,p_name=>'P4020_DISPLAY_DOCNUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Document No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'mandatory-field auto-upper-case'
,p_grid_label_column_span=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117810545466692689)
,p_name=>'P4020_DISPLAY_EXPIRYDATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Date of Expiry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20'
,p_tag_attributes=>'data-short-target="#DG_EXPIRATIONDATE"'
,p_colspan=>7
,p_grid_label_column_span=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117810962817692689)
,p_name=>'P4020_MANUAL_EXPIRYDATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Manual expirydate'
,p_placeholder=>'Manual'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117811751646692690)
,p_name=>'P4020_DISPLAY_LASTNAME'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'mandatory-field auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117812187946692690)
,p_name=>'P4020_DISPLAY_FIRSTNAME'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117812508254692690)
,p_name=>'P4020_DISPLAY_MIDDLENAME'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117812910762692691)
,p_name=>'P4020_DISPLAY_DOB'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Date of Birth:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_css_classes=>'autovalidatedatepicker datetypepast mandatory-field'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117813740874692691)
,p_name=>'P4020_DISPLAY_GENDER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_tag_css_classes=>'mandatory-field'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117823879268696995)
,p_name=>'P4020_VISUM_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Visa Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117824603248696995)
,p_name=>'P4020_VISA_TYPE_ID'
,p_item_sequence=>81
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'force-numeric-input'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117825078123696995)
,p_name=>'P4020_VISUM'
,p_item_sequence=>85
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d, r',
'FROM',
'(',
'    -- 1',
'    SELECT NVL(vt.display_value, vt.display_value$dlc) || NVL2(vt.permit_days, '' - ''|| vt.permit_days, '''') d, vt.key_value r, DECODE(vis.defaultvisa, ''Y'', -2, 0) SORT_ORDER',
'    FROM dl_common.visa_types$lc vt,',
'    dl_bordercontrol.v_visabynation vis',
'    WHERE vt.is_active = ''Y''',
'    AND vt.key_value != ''0022''',
'    AND vis.countcd = (SELECT icao.notice$dlc FROM dl_common.icao_doc_codes$lc icao WHERE icao.key_value = :P4020_NATIONALITY)',
'    AND vis.actflag = ''Y''',
'    AND vt.key_value = vis.visatypecd',
'    UNION ALL',
'    -- 2',
'    SELECT NVL(vt.display_value, vt.display_value$dlc) || NVL2(vt.permit_days, '' - ''|| vt.permit_days, '''') d, vt.key_value r, CASE WHEN vt.key_value = ''0008'' THEN -1 ELSE TO_NUMBER(vt.notice$dlc) END SORT_ORDER',
'    FROM dl_common.visa_types$lc vt',
'    WHERE vt.is_active = ''Y''',
'    AND vt.key_value != ''0022''',
'    AND vt.key_value NOT IN ',
'	(',
'		SELECT vt.key_value',
'		FROM dl_common.visa_types$lc vt,',
'		dl_bordercontrol.v_visabynation vis',
'		WHERE vt.is_active = ''Y''',
'		AND vt.key_value != ''0022''',
'		AND vis.countcd = (SELECT icao.notice$dlc FROM dl_common.icao_doc_codes$lc icao WHERE icao.key_value = :P4020_NATIONALITY)',
'		AND vis.actflag = ''Y''',
'		AND vt.key_value = vis.visatypecd',
'	)',
')',
'ORDER BY sort_order',
';'))
,p_lov_display_null=>'YES'
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE mandatory-field'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117826248506696997)
,p_name=>'P4020_VISUM_5'
,p_item_sequence=>131
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Date of Expiry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20 validate_mustbefuture CLASS_STATUSRELEVANCE'
,p_colspan=>8
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117826672855696997)
,p_name=>'P4020_VISUM_4'
,p_item_sequence=>141
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Length of Stay:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>4
,p_tag_css_classes=>'force-numeric-input number-allow-negative'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'-9999'
,p_attribute_02=>'9999'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117830215654697000)
,p_name=>'P4020_PERMIT_TYPE'
,p_item_sequence=>241
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Permit Type:'
,p_source=>'SELECT TM8_TYPE d, KEY_VALUE r FROM TM8_REENTRIES WHERE PASSPORTNO = :P4020_DISPLAY_DOCNUMBER AND PASSPORT_ISSUED_BY = :P4020_NATIONALITY AND PASSPORT_EXPIRY_DATE = nvl(pkg_common.parse_date(:P4020_DISPLAY_EXPIRYDATE, 1, 0, 0, 0), pkg_common.parse_da'
||'te(:P4020_DISPLAY_EXPIRYDATE, 0, 1, 0, 0))'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'/*decode(TM8_TYPE, ''S'', ''Single'', ''M'', ''Multiple'', ''N/A'') d, KEY_VALUE r FROM TM8_REENTRIES WHERE PASSPORTNO = :P4020_DISPLAY_DOCNUMBER AND PASSPORT_ISSUED_BY = :P4020_NATIONALITY AND PASSPORT_EXPIRY_DATE = nvl(pkg_common.parse_date(:P4020_DISPLAY_EX'
||'PIRYDATE, 1, 0, 0, 0), pkg_common.parse_date(:P4020_DISPLAY_EXPIRYDATE, 0, 1, 0, 0))*/',
'    nvl(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM',
'    DL_COMMON.PERMIT_TYPES$LC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117830635276697000)
,p_name=>'P4020_PERMIT_TYPE_ID'
,p_item_sequence=>251
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Permit Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117831409981697001)
,p_name=>'P4020_PERMIT_DAYS_TOTAL'
,p_item_sequence=>271
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Permit days total'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'disabled="disabled"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117832640577697003)
,p_name=>'P4020_PERMIT_EXPIRY'
,p_item_sequence=>301
,p_item_plug_id=>wwv_flow_api.id(960318905867074238)
,p_prompt=>'Date of Permit Expiry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20'
,p_colspan=>8
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117850804996721686)
,p_name=>'P4020_PROVINCE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(960345070496098931)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'force-numeric-input'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117851243565721686)
,p_name=>'P4020_PROVINCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(960345070496098931)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_adm_class_province;'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117852055405721687)
,p_name=>'P4020_AMPUR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(960345070496098931)
,p_prompt=>'Ampur:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value, return_value FROM dl_bordercontrol.lov_adm_class_district',
'WHERE adm_class_province = :P4020_PROVINCE'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P4020_PROVINCE'
,p_ajax_items_to_submit=>'P4020_PROVINCE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117852868388721687)
,p_name=>'P4020_TAMBON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(960345070496098931)
,p_prompt=>'Tambon:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value, return_value FROM lov_adm_class_subdistrict ',
'WHERE adm_class_district = :P4020_AMPUR'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P4020_AMPUR'
,p_ajax_items_to_submit=>'P4020_AMPUR'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117853653372721688)
,p_name=>'P4020_LC_ADDRESS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(960345070496098931)
,p_prompt=>'Address:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>255
,p_cMaxlength=>256
,p_tag_attributes=>'style="resize: none;"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117905636657037721)
,p_name=>'P4020_LC_ADD_INFO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(225524792392780644)
,p_prompt=>'Note:'
,p_placeholder=>'Additional Information'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>500
,p_cMaxlength=>2000
,p_cHeight=>2
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117950174811498322)
,p_name=>'P4020_MVMNT_MANUAL_UPDATE_NOTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(267948370041143141)
,p_prompt=>'Comment for Edit:'
,p_placeholder=>'Comment for Edit'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>52
,p_cMaxlength=>2000
,p_cHeight=>5
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119104028761171004)
,p_name=>'P4020_BRDDOCID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95459139301695442)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119104168906171005)
,p_name=>'P4020_VISA_KEY_VALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(95459139301695442)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121291958779384048)
,p_name=>'P4020_TRNSPRTUNITID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(312821812170313868)
,p_prompt=>'Vehicle No.:'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_sql VARCHAR2(4000);',
'BEGIN',
'    -- AIR_BORDER',
'    IF :AI_TRANSPORT_MODE = 0 THEN',
'        l_sql := ''select distinct flightnum ',
'                    from flights ',
'                    where active = 1',
'                    and ins_borderpost = NVL(:AI_BORDERPOST_ID, ins_borderpost)'';',
'    -- SEA_BORDER',
'    ELSIF :AI_TRANSPORT_MODE = 1 THEN',
'        l_sql := ''select NULL from dual where 1 = 2'';',
'    -- LAND_BORDER',
'    ELSIF :AI_TRANSPORT_MODE = 2 THEN',
'        l_sql := ''select NULL from dual where 1 = 2'';',
'    ELSE',
'        l_sql := ''select NULL from dual where 1 = 2'';',
'    END IF;',
'    ',
'    RETURN l_sql;',
'END;'))
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE auto-upper-case autofocus-on-load'
,p_colspan=>8
,p_grid_label_column_span=>4
,p_grid_column_css_classes=>'CLASS_STATUSRELEVANCE '
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122648208184809736)
,p_name=>'P4020_AGE_DISPLAY'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Age'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2811516731199452617)
,p_name=>'P4020_CURRENT_STATELESS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(95459139301695442)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2811516845740452618)
,p_name=>'P4020_STATELESS_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2811516938820452619)
,p_name=>'P4020_STATELESS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_STATELESS_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'AND icao.key_value IN (''XXA'', ''XXB'', ''XXC'', ''XXX'')',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
,p_lov_display_null=>'YES'
,p_tag_css_classes=>'mandatory-field'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2842099061222083650)
,p_name=>'P4020_FP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95459139301695442)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683852256212328615)
,p_name=>'P4020_DISPLAY_DOB_TEXT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(1052837830529082963)
,p_prompt=>'Date of Birth:'
,p_placeholder=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'actdatepicker autovalidatedatepicker2 datetypepast mandatory-field'
,p_tag_attributes=>'data-short-target="#P4020_DG_DATEOFBIRTH"'
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683852907628328622)
,p_name=>'P4020_IS_DOB_PARTIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(95459139301695442)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683853032744328623)
,p_name=>'P4020_DG_DATEOFBIRTH'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(95459139301695442)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5173629518878838601)
,p_validation_name=>'P4020_TRAVELCARD_NO Invalid'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P4020_NATIONALITY = ''THA'' ',
'OR',
'(',
'    :P4020_TRAVELCARD_NO IS NOT NULL',
'    AND LENGTH(:P4020_TRAVELCARD_NO) = 7',
')'))
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Invalid TM6'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(117710563717460454)
,p_associated_item=>wwv_flow_api.id(117802800908692681)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(119104419917171008)
,p_validation_name=>'P4020_MVMNT_MANUAL_UPDATE_NOTE not null'
,p_validation_sequence=>20
,p_validation=>'P4020_MVMNT_MANUAL_UPDATE_NOTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'กรุณากรอก #LABEL#'
,p_always_execute=>'Y'
,p_validation_condition=>'SAVE,DELETE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(117950174811498322)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_validation_comment=>'#LABEL# cannot be blank.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(117750297239460494)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(117710248295460454)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(117750770994460495)
,p_event_id=>wwv_flow_api.id(117750297239460494)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122570273546115770)
,p_name=>'ON CHANGE: EVENT-BASED'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input, select'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122570674808115772)
,p_event_id=>wwv_flow_api.id(122570273546115770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var item = this.triggeringElement.getAttribute("id")',
'let isArrival = !parseInt($v("P4020_MOVEMENT_ENTRY_EXIT"));',
'let hasVisaInformation = (!!$("#P4020_VISUM_1").val() && !!$("#P4020_VISUM").val()); // Visa Number and Visa Type',
'',
'p4020.nationality.set("P4020_STATELESS_ID", "P4020_STATELESS");',
'p4020.permitType.set("P4020_PERMIT_TYPE_ID", "P4020_PERMIT_TYPE");',
'p4020.vehicleType.set("P4020_TRNSPRTUNITID_SEA", "P4020_VEHICLE_TYPE_D");',
'p4020.visaType.set("P4020_VISA_TYPE_ID", "P4020_VISUM");',
'',
'if(item === "P4020_DISPLAY_FIRSTNAME") {',
'    //$(document).trigger("checkForCrewStatus");',
'    apexCustomEvent(''splitMiddleName'');',
'}',
'else if(item === "P4020_VISUM_5") {',
'    console.error("visa changed to ", $("#P4020_VISUM_5").val());',
'}',
'else if(item === "P4020_STATELESS") {',
'    p4020.nationality.setIdItem();',
'}',
'else if(item === "P4020_STATELESS_ID") {',
'    p4020.nationality.setSelectItem();',
'}',
'else if(item === "P4020_PERMIT_TYPE") {',
'    p4020.permitType.setIdItem();',
'    apex.event.trigger("P4020_PERMIT_TYPE", "getPermitTypeInformation");',
'}',
'else if(item === "P4020_PERMIT_TYPE_ID") {',
'    p4020.permitType.setSelectItem();',
'}',
'else if(item === "P4020_VEHICLE_TYPE_D") {',
'    p4020.vehicleType.setIdItem();',
'    apex.event.trigger("#" + item, "checkVehicleTypeD");',
'}',
'else if(item === "P4020_TRNSPRTUNITID_SEA") {',
'    p4020.vehicleType.setSelectItem();',
'}',
'else if(item === "P4020_VISA_TYPE_ID") {',
'    //if(isArrival) {',
'        p4020.visaType.setSelectItem(); ',
'        (p4020.visaType.getCheckIfRun() ? apex.event.trigger("#P4020_VISUM", "change") : null);',
'    //}',
'}',
'else if(item === "P4020_VISUM") {',
'    //if(isArrival) {',
'        p4020.visaType.setIdItem();',
'    //}',
'}',
'else if(item === "P4020_VISUM_1") {',
'    null;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122586709330220171)
,p_name=>'P4020_DISPLAY_FIRSTNAME: Split Middle Names'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'splitMiddleName'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122587193178220172)
,p_event_id=>wwv_flow_api.id(122586709330220171)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//debugger;',
'let elems = {firstName: "#P4020_DISPLAY_FIRSTNAME", middleName: "#P4020_DISPLAY_MIDDLENAME"};',
'console.log("NAMES: 1", ''"'' + $(elems.firstName).val() + ''"'', ''"'' + $(elems.middleName).val() + ''"'');',
'let currentFirstName = ($(elems.firstName).val() || "").trim();',
'let currentMiddleName = ($(elems.middleName).val() || "").trim();',
'if (currentFirstName.replace(/^.*? +/, "") == currentMiddleName) {',
'    currentFirstName = currentFirstName.replace(/ .*/, "").trim();',
'}',
'let names = {firstName: (currentFirstName.trim() + " " + currentMiddleName.trim()).trim(), middleName: ""};',
'let order = ["middleName", "firstName"];',
'if (names.firstName.length > 0) { ',
'    let idx = names.firstName.indexOf('' ''); ',
'    if (idx > 0) { ',
'        names.middleName = names.firstName.substr(idx).trim(); ',
'        names.firstName = names.firstName.substr(0, idx).trim(); ',
'    } ',
'}',
'console.log("NAMES: 2", ''"'' + $(elems.firstName).val() + ''"'', ''"'' + $(elems.middleName).val() + ''"'');',
'for (let i in order) { ',
'    let a = order[i];',
'    if ($(elems[a]).val() != names[a]) {',
'        console.log("NAMES:", "setting " + a);',
'        $(elems[a]).val(names[a]);',
'    }',
'} ',
'console.log("NAMES: 3", ''"'' + $(elems.firstName).val() + ''"'', ''"'' + $(elems.middleName).val() + ''"'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122602307691353661)
,p_name=>'MANDATORY: P4020_VEHICLE_TYPE_D'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_VEHICLE_TYPE_D'
,p_condition_element=>'P4020_VEHICLE_TYPE_D'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkVehicleTypeD'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122602791466353662)
,p_event_id=>wwv_flow_api.id(122602307691353661)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122603256735353663)
,p_event_id=>wwv_flow_api.id(122602307691353661)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122604131697377855)
,p_name=>'GET: PERMIT TYPE INFORMATION'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_PERMIT_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getPermitTypeInformation'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122604536917377855)
,p_event_id=>wwv_flow_api.id(122604131697377855)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select number_of_entries',
'      ,number_of_entries_used',
'      ,endpermit_date',
'  into :P4020_PERMIT_DAYS_TOTAL',
'      ,:P4020_PERMIT_DAYS_USED',
'      ,:P4020_PERMIT_EXPIRY',
'  from tm8_reentries ',
' where key_value = :P4020_PERMIT_TYPE',
'   and rownum = 1;'))
,p_attribute_02=>'P4020_PERMIT_TYPE'
,p_attribute_03=>'P4020_PERMIT_DAYS_TOTAL,P4020_PERMIT_DAYS_USED,P4020_PERMIT_EXPIRY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122648434893818763)
,p_name=>'Date of Birth Change'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_DISPLAY_DOB_TEXT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683852530558328618)
,p_event_id=>wwv_flow_api.id(122648434893818763)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $dt = $("#P4020_DISPLAY_DOB_TEXT"), dt = $dt.val().trim(), $isPartial = $("#P4020_IS_DOB_PARTIAL"), isPartial, isValid = true;',
'',
'if (dt.length < 6) {',
'    return;',
'}',
'else if (!(dt.indexOf("<") >= 0 || dt.indexOf("X") >= 0 || dt.indexOf("00") >= 0)) {',
'    $isPartial.val("");',
'    validateDatePicker.call($dt);',
'    return;',
'} else {',
'    apex.server.process("GET_PARTIAL_DATE", ',
'    {',
'        x01: dt,',
'        x02: "DD/MM/YYYY",',
'        x03: "1",',
'        x04: "0",',
'        x05: "0",',
'        x06: "0"',
'    }, ',
'    {',
'        success: function(pData) ',
'        {',
'            console.log(''GET_PARTIAL_DATE Result: '', pData);',
'            isValid = (pData.status == "1" && pData.formatted_date.length > 0 ? true : false);',
'            isPartial = pData.is_partial;',
'            console.log(''isValid: '', isValid);',
'            console.log(''isPartial: '', isPartial);',
'            $isPartial.val(isPartial);',
'            if (dt != pData.formatted_date) {',
'                $dt.val(pData.formatted_date).trigger("change");',
'            }',
'        }',
'    });',
'}',
'',
'console.log(''isValid: '', isValid);',
'$dt.removeClass("autovalidatedatepicker_invalid autovalidatedatepicker_valid").addClass(!!isValid ? "autovalidatedatepicker_valid" : "autovalidatedatepicker_invalid");'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122648828631818764)
,p_event_id=>wwv_flow_api.id(122648434893818763)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let ageText = "";',
'let dob = $("#P4020_DISPLAY_DOB_TEXT").val();',
'if (!!dob) {',
'    let dobDate = parseCambodianDate(dob);',
'    if (!!dobDate) {',
'        let now = new Date();',
'        let age = (new Date(now.getTime() - dobDate.getTime())).getFullYear() - 1970;',
'        ',
'        ageText = "Age " + age;',
'    }',
'}',
'',
'$("#P4020_AGE_DISPLAY").text(ageText);',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683852696162328619)
,p_name=>'Date of Birth Key Release'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_DISPLAY_DOB_TEXT'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683852734444328620)
,p_event_id=>wwv_flow_api.id(4683852696162328619)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $dt = $("#P4020_DISPLAY_DOB_TEXT"), dt = $dt.val().trim(), $isPartial = $("#P4020_IS_DOB_PARTIAL"), isPartial, isValid = true;',
'',
'if (dt.length < 6) {',
'    return;',
'}',
'else if (!(dt.indexOf("<") >= 0 || dt.indexOf("X") >= 0 || dt.indexOf("00") >= 0)) {',
'    $isPartial.val("");',
'    validateDatePicker.call($dt);',
'    return;',
'} else {',
'    apex.server.process("GET_PARTIAL_DATE", ',
'    {',
'        x01: dt,',
'        x02: "DD/MM/YYYY",',
'        x03: "1",',
'        x04: "0",',
'        x05: "0",',
'        x06: "0"',
'    }, ',
'    {',
'        success: function(pData) ',
'        {',
'            console.log(''GET_PARTIAL_DATE Result: '', pData);',
'            isValid = (pData.status == "1" && pData.formatted_date.length > 0 ? true : false);',
'            isPartial = pData.is_partial;',
'            console.log(''isValid: '', isValid);',
'            console.log(''isPartial: '', isPartial);',
'            $isPartial.val(isPartial);',
'            if (dt != pData.formatted_date) {',
'                $dt.val(pData.formatted_date).trigger("change");',
'            }',
'        }',
'    });',
'}',
'',
'console.log(''isValid: '', isValid);',
'$dt.removeClass("autovalidatedatepicker_invalid autovalidatedatepicker_valid").addClass(!!isValid ? "autovalidatedatepicker_valid" : "autovalidatedatepicker_invalid");'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683852839345328621)
,p_event_id=>wwv_flow_api.id(4683852696162328619)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let ageText = "";',
'let dob = $("#P4020_DISPLAY_DOB_TEXT").val();',
'if (!!dob) {',
'    let dobDate = parseCambodianDate(dob);',
'    if (!!dobDate) {',
'        let now = new Date();',
'        let age = (new Date(now.getTime() - dobDate.getTime())).getFullYear() - 1970;',
'        ',
'        ageText = "Age " + age;',
'    }',
'}',
'',
'$("#P4020_AGE_DISPLAY").text(ageText);',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122649646295840716)
,p_name=>'Set Visa Expiry Date and Length of stay'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_VISUM'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v("P4020_MOVEMENT_ENTRY_EXIT") != "1" && $v("P4020_DISPLAY_DOCNUMBER") != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122650033601840716)
,p_event_id=>wwv_flow_api.id(122649646295840716)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(permit_days), trunc(sysdate) + max(permit_days) - 1 ',
'into :P4020_VISUM_4, :P4020_VISUM_5 ',
'--from dl_common.visa_types#icao_doc_codes$lc ',
'from dl_common.visa_types$lc ',
'where key_value = :P4020_VISUM',
'--and icao_doc_code = :P4020_NATIONALITY',
';'))
,p_attribute_02=>'P4020_VISUM,P4020_NATIONALITY'
,p_attribute_03=>'P4020_VISUM_4,P4020_VISUM_5'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122650761983851781)
,p_name=>'P4020_VISUM: Select VISA after refresh'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_VISUM'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122651108038851782)
,p_event_id=>wwv_flow_api.id(122650761983851781)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let isArrival = !parseInt($v("MOVEMENT_ENTRY_EXIT"));',
'',
'if ($("#P4020_VISUM option").length > 1 && $("#P4020_VISUM").val() == "") {',
'    console.log("setting visa");',
'    if ($v("P4020_IS_CREW_MEMBER") === "Y") {',
'        console.log("is Crew: 0023");',
'        $("#P4020_VISUM").val("0023");',
'    }',
'    else {',
'        $("#P4020_VISUM").val($("#P4020_VISUM option:nth-child(2)").val());',
'    }',
'    if (isArrival) {',
'        console.log("triggering change");',
'        $("#P4020_VISUM").trigger("change");',
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122651872421862427)
,p_name=>'Set Visa Length of stay'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_VISUM_5'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v("P4020_MOVEMENT_ENTRY_EXIT") != "1" && $v("P4020_DISPLAY_DOCNUMBER") != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122652281644862427)
,p_event_id=>wwv_flow_api.id(122651872421862427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_los number;',
'begin',
'    l_los := to_date(:P4020_VISUM_5, ''DD/MM/YYYY'') - trunc(sysdate) + 1; -- - 1;',
'    :P4020_VISUM_4 := l_los;',
'end;'))
,p_attribute_02=>'P4020_VISUM_5'
,p_attribute_03=>'P4020_VISUM_4'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'Javascript?'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122652793310862428)
,p_event_id=>wwv_flow_api.id(122651872421862427)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*document.getElementsByClassName(''.u-Processing-spinner:before'').style.visibility=''hidden'';*/',
'',
''))
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Delete'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122653494846878369)
,p_name=>'Set Visa Expiry Date'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_VISUM_4'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'!parseInt($("#P4020_MOVEMENT_ENTRY_EXIT").val()) && !!$("#P4020_DISPLAY_DOCNUMBER").val()'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122654375023878370)
,p_event_id=>wwv_flow_api.id(122653494846878369)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("P4020_VISUM_4").replace("-", "").length === 0)',
'    $("#P4020_VISUM_4").val("");'))
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Delete'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122653803879878370)
,p_event_id=>wwv_flow_api.id(122653494846878369)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P4020_VISUM_5 := trunc(sysdate) + to_number(:P4020_VISUM_4) - 1; -- + 1;'
,p_attribute_02=>'P4020_VISUM_4'
,p_attribute_03=>'P4020_VISUM_5'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'Javascript'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122655077965888925)
,p_name=>'After Refresh: P4020_PERMIT_TYPE'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_PERMIT_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122655478473888926)
,p_event_id=>wwv_flow_api.id(122655077965888925)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#P4020_PERMIT_DAYS_USED,#P4020_PERMIT_DAYS_TOTAL").prop("disabled", true).addClass("apex_disabled");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122663536690908698)
,p_name=>'P4020_PROVINCE_ID Change: Set Province'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_PROVINCE_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122663909905908699)
,p_event_id=>wwv_flow_api.id(122663536690908698)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let currentValue = $v(''P4020_PROVINCE'');',
'let currentCode = GET_PROVINCE_IDS[currentValue];',
'let newCode = $v(''P4020_PROVINCE_ID'');',
'let newValue = GET_PROVINCE_KEY_VALUES[newCode] || null;',
'',
'if (newValue != currentValue) {',
'    if (!newValue) {',
'        $("#P4020_PROVINCE_ID,#P4020_PROVINCE").val("");',
'        $("#P4020_PROVINCE").trigger("change");',
'    } else {',
'        $(''#P4020_PROVINCE'').val(newValue).trigger("change");',
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122664991431924469)
,p_name=>'P4020_PROVINCE Change: Set Province ID'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_PROVINCE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122665329307924469)
,p_event_id=>wwv_flow_api.id(122664991431924469)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let currentCode = $v(''P4020_PROVINCE_ID'');',
'let newValue = $v(''P4020_PROVINCE'');',
'let newCode = GET_PROVINCE_IDS[newValue] || currentCode;',
'',
'if (newCode != currentCode) {',
'    $(''#P4020_PROVINCE_ID'').val(newCode).trigger("change");',
'}',
'',
'if (!newValue) {',
'    $("#P4020_PROVINCE_ID,#P17_PROVINCE").val("");',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122666367850930285)
,p_name=>'P4020_AMPUR - Refresh: Set Ampur'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_AMPUR'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122666785320930285)
,p_event_id=>wwv_flow_api.id(122666367850930285)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let ampur = apex.item("P4020_TMP_AMPUR").getValue();',
'if (!!ampur) {',
'    apex.item("P4020_AMPUR").setValue(ampur);',
'    apex.item("P4020_TMP_AMPUR").setValue("");',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(122667738420936880)
,p_name=>'P4020_TAMBON - Refresh: Set Tambon'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_TAMBON'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(122668109722936881)
,p_event_id=>wwv_flow_api.id(122667738420936880)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let ampur = apex.item("P4020_AMPUR").getValue();',
'let tambon = apex.item("P4020_TMP_TAMBON").getValue();',
'if (!!ampur && !!tambon) {',
'    apex.item("P4020_TAMBON").setValue(tambon);',
'    apex.item("P4020_TMP_TAMBON").setValue("");',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124943003251531365)
,p_name=>'P4020_IS_CREW_MEMBER: Warning Color'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_IS_CREW_MEMBER'
,p_condition_element=>'P4020_IS_CREW_MEMBER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124943404206531372)
,p_event_id=>wwv_flow_api.id(124943003251531365)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#P4020_IS_CREW_MEMBER>label:first'
,p_attribute_01=>'field-warn'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124943960564531372)
,p_event_id=>wwv_flow_api.id(124943003251531365)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#P4020_IS_CREW_MEMBER>label:first'
,p_attribute_01=>'field-warn'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124971670466575679)
,p_name=>'MANDATORY: ITEMS'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_DISPLAY_FIRSTNAME,P4020_DISPLAY_DOB_TEXT,P4020_DISPLAY_LASTNAME,P4020_DISPLAY_GENDER,P4020_TRNSPRTUNITID'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.value == ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124972092678575680)
,p_event_id=>wwv_flow_api.id(124971670466575679)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124972506232575680)
,p_event_id=>wwv_flow_api.id(124971670466575679)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(124973191424605749)
,p_name=>'P4020_SUBNATIONALITY: After Refresh'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_SUBNATIONALITY'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#P4020_SUBNATIONALITY option").length > 1'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124973526009605749)
,p_event_id=>wwv_flow_api.id(124973191424605749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4020_SUBNATIONALITY,P4020_SUBNAT_PLACEHOLDER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(124974009727605750)
,p_event_id=>wwv_flow_api.id(124973191424605749)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4020_SUBNATIONALITY,P4020_SUBNAT_PLACEHOLDER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2811516501895452615)
,p_name=>'DA_ToggleStatelessOption'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2811516485251452614)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811516631864452616)
,p_event_id=>wwv_flow_api.id(2811516501895452615)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger(document, "toggleStatelessOption");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2811517095055452620)
,p_name=>'Toggle Stateless Option'
,p_event_sequence=>210
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'toggleStatelessOption'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811517167899452621)
,p_event_id=>wwv_flow_api.id(2811517095055452620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $btn = $("#P4020_TOGGLE_STATELESS"), $s = $("#P4020_STATELESS"), $sc = $("#P4020_STATELESS_CONTAINER"), $sid = $("#P4020_STATELESS_ID"), $sidc = $("#P4020_STATELESS_ID_CONTAINER"), $nat = $("#P4020_NATIONALITY_CONTAINER"), $natId = $("#P4020_NATI'
||'ONALITY_ID_CONTAINER");',
'let actClass = "cl-stateless-active", hideClass = "cl-hidden", flashClass = "cl-flash";',
'let isActive = $btn.hasClass(actClass);',
'let currStateless = $v("P4020_CURRENT_STATELESS");',
'',
'if (isActive) {',
'    $s.removeClass(flashClass);',
'    $s.val("").trigger("change"); $sid.val("");',
'    $sidc.addClass(hideClass);',
'    $sc.addClass(hideClass);',
'    $natId.removeClass(hideClass);',
'    $nat.removeClass(hideClass);',
'    $btn.removeClass(actClass);',
'}',
'else {',
'    $btn.addClass(actClass);',
'    $nat.addClass(hideClass);',
'    $natId.addClass(hideClass);',
'    $sc.removeClass(hideClass);',
'    $sidc.removeClass(hideClass);',
'    $s.val(currStateless).trigger("change");',
'    $s.addClass(flashClass);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2842098704630083647)
,p_name=>'DELETE: Click'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2842098635370083646)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2842098866056083648)
,p_event_id=>wwv_flow_api.id(2842098704630083647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete this movement ?',
'Please click "OK" to confirm.'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2842098955650083649)
,p_event_id=>wwv_flow_api.id(2842098704630083647)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'DELETE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5173629647517838602)
,p_name=>'MANDATORY: P14020_TRAVELCARD_NO'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_TRAVELCARD_NO'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.value.length != 7'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173629715971838603)
,p_event_id=>wwv_flow_api.id(5173629647517838602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173629841566838604)
,p_event_id=>wwv_flow_api.id(5173629647517838602)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5173629995637838605)
,p_name=>'settings for THAI'
,p_event_sequence=>240
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173630020861838606)
,p_event_id=>wwv_flow_api.id(5173629995637838605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($("#P4020_NATIONALITY").val() == "THA") {',
'    $("#P4020_TRAVELCARD_NO").val('''').trigger("change");',
'    $("#REG_LAYOUT_1_3,#REG_LAYOUT_1_2,#P4020_TRAVELCARD_NO,#P4020_TRAVELCARD_NO_LABEL").hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683852385439328616)
,p_name=>'P4020_DISPLAY_DOB: Change'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4020_DISPLAY_DOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683852413058328617)
,p_event_id=>wwv_flow_api.id(4683852385439328616)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let dob = $("#P4020_DISPLAY_DOB").val();',
'',
'if (dob.length > 0)',
'$("#P4020_DISPLAY_DOB_TEXT").val(dob).trigger("change");'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117749068750460491)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Movement'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_person_type    dl_bordercontrol.movements.person_type%TYPE;',
'    --l_transport      dl_bordercontrol.movements.scanned_flight%TYPE;',
'    l_visa_type      dl_bordercontrol.visas.visa_type%TYPE;',
'BEGIN',
'',
'    -- person_type, scanned_flight',
'    SELECT ',
'        DECODE(:P4020_IS_CREW_MEMBER, ''Y'', 2, 1)',
'        --, DECODE(:AI_TRANSPORT_MODE, 0, :P4020_TRNSPRTUNITID, 1, :P4020_TRNSPRTUNITID_SEA, 2, :P4020_TRNSPRTUNITID_LAND, ''n.a.'')',
'    INTO ',
'        l_person_type',
'        --, l_transport',
'    FROM DUAL;',
'    ',
'    -- visa_type',
'    SELECT DECODE(:P4020_NATIONALITY, ''THA'', DECODE(l_person_type, 2, ''0023'', ''0022''), :P4020_VISUM)',
'    INTO l_visa_type',
'    FROM DUAL;',
'',
'    dl_bordercontrol.pkg_edite_movements.edit_last_movement_info',
'    (',
'        p_MVMNTID                   => :P4020_MVMNTID',
'        ,p_EXITFLG                  => :P4020_MOVEMENT_ENTRY_EXIT',
'        ,p_MAX_STAY_DT              => TO_DATE(:P4020_VISUM_5, ''DD/MM/YYYY'')',
'        ,p_TRNSPRTUNITID            => :P4020_TRNSPRTUNITID_SEA',
'        ,p_PERSON_TYPE              => l_person_type',
'        ,p_SCANNED_FLIGHT           => :P4020_TRNSPRTUNITID --l_transport',
'        ,p_VISA_TYPE                => l_visa_type',
'        ,p_VISA_NUMBER              => :P4020_VISUM_1',
'        ,p_VISA_EXPIRY_DATE         => :P4020_VISUM_5',
'        ,p_PERMIT_TYPE              => :P4020_PERMIT_TYPE',
'        ,p_PERMIT_EXPIRY_DATE       => :P4020_PERMIT_EXPIRY',
'        ,p_GIVENNAME                => :P4020_DISPLAY_FIRSTNAME',
'        ,p_SURNAME                  => :P4020_DISPLAY_LASTNAME',
'        ,p_MIDDLENAME               => :P4020_DISPLAY_MIDDLENAME',
'        ,p_SEX                      => :P4020_DISPLAY_GENDER',
'        ,p_DOB                      => :P4020_DG_DATEOFBIRTH',
'        ,p_SUB_NATIONALITY          => :P4020_SUBNATIONALITY',
'        ,p_ENTRY_FORM_NO            => :P4020_TRAVELCARD_NO',
'        ,p_PROVINCE                 => :P4020_PROVINCE',
'        ,p_DISTRICT                 => :P4020_AMPUR',
'        ,p_SUBDISTRICT              => :P4020_TAMBON',
'        ,p_ADDRESS                  => :P4020_LC_ADDRESS',
'        ,p_NOTE                     => :P4020_LC_ADD_INFO',
'        ,p_MVMNT_MANUAL_UPDATE_NOTE => :P4020_MVMNT_MANUAL_UPDATE_NOTE',
'        ,p_STATELESS                => :P4020_STATELESS',
'    );',
'',
'END;'))
,p_process_error_message=>'Error: Save Movement - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(117710563717460454)
,p_process_success_message=>'Saved successfully.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5173630166414838607)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Movement'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    DL_BORDERCONTROL.PKG_EDITE_MOVEMENTS.delete_movement',
'    (',
'        p_MVMNTID                   => :P4020_MVMNTID',
'        ,p_MVMNT_MANUAL_UPDATE_NOTE => :P4020_MVMNT_MANUAL_UPDATE_NOTE',
'    );',
'',
'END;'))
,p_process_error_message=>'Error: Delete Movement - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(2842098635370083646)
,p_process_success_message=>'Deleted successfully.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117749492751460493)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_process_error_message=>'Error: Close Dialog - #SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Action completed successfully.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95459579634695446)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    SELECT',
'        -- hidden',
'        m.brddocid',
'        , m.visa',
'        -- general movement',
'        , m.exitflg --P4020_MOVEMENT_ENTRY_EXIT',
'        , m.TRNSPRTUNITID --P4020_TRNSPRTUNITID_SEA',
'        --, m.TRNSPRTUNITID --P4020_VEHICLE_TYPE_D',
'        , m.SCANNED_FLIGHT --P4020_TRNSPRTUNITID',
'        , DECODE(m.PERSON_TYPE, ''2'', ''Y'', ''N'') --P4020_IS_CREW_MEMBER',
'        , m.FORM_NO --P4020_TRAVELCARD_NO',
'        , m.DATE_OF_ENTRY --P4020_DATE_OF_ENTRY',
'        -- doc',
'        , m.DOCCLASS --P4020_DOC_CLASS_ID',
'        , m.DOCCLASS --P4020_DISPLAY_DOCCLASS',
'        , m.DOCTYPE --P4020_DISPLAY_DOCTYPE',
'        , m.ISSUECTRY --:P4020_NATIONALITY_ID',
'        , m.ISSUECTRY --:P4020_NATIONALITY',
'        , m.SUB_NATIONALITY --:P4020_SUBNATIONALITY',
'        , m.DOCNO --P4020_DISPLAY_DOCNUMBER',
'        , m.EXPIRYDATE --:P4020_DISPLAY_EXPIRYDATE',
'        , m.MANUAL_EXPIRY_DATE --:P4020_MANUAL_EXPIRYDATE',
'        , m.SURNAME --:P4020_DISPLAY_LASTNAME',
'        , m.GIVENNAME --:P4020_DISPLAY_FIRSTNAME',
'        , m.MIDDLENAME --:P4020_DISPLAY_MIDDLENAME',
'        , m.DOB --:P4020_DISPLAY_DOB_TEXT',
'        , m.SEX --:P4020_DISPLAY_GENDER',
'        -- visa',
'        , v.visa_number --:P4020_VISUM_1',
'        , SUBSTR(m.VISA_TYPE, -2, 2) --:P4020_VISA_TYPE_ID',
'        , m.VISA_TYPE --:P4020_VISUM',
'        , v.expiry_Date --:P4020_VISUM_5',
'        , v.expiry_Date - TRUNC(SYSDATE) + 1 --:P4020_VISUM_4',
'        , v.PERMIT_TYPE --:P4020_PERMIT_TYPE',
'        , v.PERMIT_TYPE --:P4020_PERMIT_TYPE_ID',
'        , NULL --:P4020_PERMIT_DAYS_TOTAL',
'        , v.permit_expiry_date --:P4020_PERMIT_EXPIRY',
'        -- other',
'        , (SELECT display_code FROM dl_bordercontrol.adm_class_province$lc WHERE key_value = m.province) --:P4020_PROVINCE_ID',
'        , m.PROVINCE --:P4020_PROVINCE',
'        , m.DISTRICT --:P4020_AMPUR',
'        , m.SUBDISTRICT --:P4020_TAMBON',
'        , m.ADDRESS --:P4020_LC_ADDRESS',
'        , m.NOTE --:P4020_LC_ADD_INFO',
'		-- history',
'		, m.DATE_OF_ENTRY --:P4020_DATE_OF_ENTRY_HIS',
'		, m.INS_BY --:P4020_INS_BY',
'		, m.ins_terminal --:P4020_INS_TERMINAL',
'		, m.ins_borderpost --:P4020_INS_BORDERPOST',
'		, m.SOURCE_SYSTEM --:P4020_SOURCE_SYSTEM',
'		, m.DML_BY --:P4020_DML_BY',
'		, m.DML_AT --:P4020_DML_AT',
'		, m.PS_3 --:P4020_PS_3',
'		, m.PS_4 --:P4020_PS_4',
'		, m.INS_AT --:P4020_INS_AT',
'        -- stateless',
'        , CASE WHEN m.NAT != m.ISSUECTRY AND m.NAT LIKE ''XX%'' THEN m.NAT ELSE NULL END --:P4020_CURRENT_STATELESS',
'        , CASE WHEN m.NAT != m.ISSUECTRY AND m.NAT LIKE ''XX%'' THEN m.NAT ELSE NULL END --:P4020_STATELESS',
'    INTO ',
'        -- hidden',
'        :P4020_BRDDOCID',
'        , :P4020_VISA_KEY_VALUE',
'        -- general movement',
'        , :P4020_MOVEMENT_ENTRY_EXIT',
'        , :P4020_TRNSPRTUNITID_SEA',
'        --, :P4020_VEHICLE_TYPE_D',
'        , :P4020_TRNSPRTUNITID',
'        , :P4020_IS_CREW_MEMBER',
'        , :P4020_TRAVELCARD_NO',
'        , :P4020_DATE_OF_ENTRY',
'        -- doc',
'        , :P4020_DOC_CLASS_ID',
'        , :P4020_DISPLAY_DOCCLASS',
'        , :P4020_DISPLAY_DOCTYPE',
'        , :P4020_NATIONALITY_ID',
'        , :P4020_NATIONALITY',
'        , :P4020_SUBNATIONALITY',
'        , :P4020_DISPLAY_DOCNUMBER',
'        , :P4020_DISPLAY_EXPIRYDATE',
'        , :P4020_MANUAL_EXPIRYDATE',
'        , :P4020_DISPLAY_LASTNAME',
'        , :P4020_DISPLAY_FIRSTNAME',
'        , :P4020_DISPLAY_MIDDLENAME',
'        , :P4020_DISPLAY_DOB_TEXT',
'        , :P4020_DISPLAY_GENDER',
'        -- visa',
'        , :P4020_VISUM_1',
'        , :P4020_VISA_TYPE_ID',
'        , :P4020_VISUM',
'        , :P4020_VISUM_5',
'        , :P4020_VISUM_4',
'        , :P4020_PERMIT_TYPE',
'        , :P4020_PERMIT_TYPE_ID',
'        , :P4020_PERMIT_DAYS_TOTAL',
'        , :P4020_PERMIT_EXPIRY',
'        -- other',
'        , :P4020_PROVINCE_ID',
'        , :P4020_PROVINCE',
'        , :P4020_AMPUR',
'        , :P4020_TAMBON',
'        , :P4020_LC_ADDRESS',
'        , :P4020_LC_ADD_INFO',
'		-- history',
'		, :P4020_DATE_OF_ENTRY_HIS',
'		, :P4020_INS_BY',
'		, :P4020_INS_TERMINAL',
'		, :P4020_INS_BORDERPOST',
'		, :P4020_SOURCE_SYSTEM',
'		, :P4020_DML_BY',
'		, :P4020_DML_AT',
'		, :P4020_PS_3',
'		, :P4020_PS_4',
'		, :P4020_INS_AT',
'        -- stateless',
'        , :P4020_CURRENT_STATELESS',
'        , :P4020_STATELESS',
'    FROM dl_bordercontrol.v_edit_movements m',
'	LEFT JOIN dl_bordercontrol.visas v',
'	ON v.key_value = m.visa',
'    WHERE mvmntid = :P4020_MVMNTID;',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P4020_MVMNTID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122406247679004595)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_BC_DOC_TYPE_IDS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    --apex_json.open_object();',
'    apex_json.open_array();',
'',
'    --Vehicle Type',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.TRANS_VEHICLES WHERE num_value IS NOT NULL) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.TRANS_VEHICLES WHERE num_value IS NOT NULL) LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value) );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    --Visa Type',
'    apex_json.open_object();',
'    FOR i_type in (SELECT SUBSTR(key_value, -2, 2) AS NUM_VALUE, KEY_VALUE FROM dl_common.VISA_TYPES WHERE is_active = ''Y'') LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT SUBSTR(key_value, -2, 2) AS NUM_VALUE, KEY_VALUE FROM dl_common.VISA_TYPES WHERE is_active = ''Y'') LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    --Permit Type',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.PERMIT_TYPES) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.PERMIT_TYPES) LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    -- Provinces',
'    apex_json.open_object();',
'    FOR i_type in (SELECT display_code num_value, KEY_VALUE FROM adm_class_province$lc) LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT display_code num_value, KEY_VALUE FROM adm_class_province$lc) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value);',
'    END LOOP;',
'    apex_json.close_object();',
'    ',
'    --Nationality with PIBICS country code',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NOTICE$DLC AS NUM_VALUE, KEY_VALUE FROM dl_common.ICAO_DOC_CODES$LC WHERE is_active = ''Y'' AND NOTICE$DLC IS NOT NULL) LOOP',
'        apex_json.write(i_type.num_value, i_type.key_value);',
'    END LOOP;',
'    FOR i_type in (SELECT COUNTRY AS NUM_VALUE, ICAO_CODE AS KEY_VALUE FROM dl_common.COUNTRIES_ICAO_DOC_CODES c WHERE NOT EXISTS (SELECT NULL FROM dl_common.ICAO_DOC_CODES$LC WHERE is_active = ''Y'' AND NOTICE$DLC = c.country)) LOOP',
'        apex_json.write(i_type.num_value, i_type.key_value);',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.close_array();',
'    --apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
