prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Vehicle Detail TM2'
,p_page_mode=>'MODAL'
,p_step_title=>'Vehicle Detail TM2'
,p_step_sub_title=>'Vehicle Detail TM2'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var $wP = null;',
'',
'function ShowSpinner() {',
'    if ($wP == null)',
'    $wP = apex.widget.waitPopup();',
'}',
'',
'function HideSpinner() {',
'    if ($wP != null) {',
'        $wP.remove();',
'        $wP = null;',
'    }',
'}',
'',
'function ie_onload(){win_load();}',
'',
'function win_load(){',
' HideSpinner()',
'}',
'',
'window.onload = function () {win_load();};'))
,p_javascript_code_onload=>'ShowSpinner();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Dialog-body,',
'.t-Dialog-body > .container,',
'.t-Dialog-body > .container,',
'.t-Dialog-body > .container > .row:nth-child(2),',
'.t-Dialog-body > .container > .row:nth-child(2) > .col:first-child,',
'#REG_EXT_URL_TM2 {',
'    height: 100%;',
'    padding: 0;',
'}'))
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_css_classes=>'no-close cl-dialog-vehicle-detail-tm2'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190306012358'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44207768987536931)
,p_plug_name=>'REG_HIDDEN'
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83185834448510178)
,p_plug_name=>'Vehicle Detail TM2 External URL'
,p_region_name=>'REG_EXT_URL_TM2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_URL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&P14_URL.?user=&P14_ENC_USER.&password=&P14_ENC_PWD.&dept_seqno=&P14_DEPT_SEQNO.'
,p_attribute_02=>'IFRAME'
,p_attribute_03=>'width="100%" height="100%" name="BmBS_iframe_extURL_TM2" id="id-BmBS-iframe-extURL-TM2" onreadystatechange="ie_onload();" onload="win_load();"'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(176522950048645982)
,p_plug_name=>'Footer'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(563812934294049615)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42995251132375460)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(176522950048645982)
,p_button_name=>'P14_BTN_CLOSE'
,p_button_static_id=>'P14_BTN_CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44207822153536932)
,p_name=>'P14_DEPT_SEQNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44207768987536931)
,p_use_cache_before_default=>'NO'
,p_item_default=>'355'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DL_STAGING4PIBICS_INTF.pkg_transcode_reverse.get_borderpost_seqno(:AI_BORDERPOST_ID)',
'FROM DUAL;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44207982611536933)
,p_name=>'P14_ENC_USER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(44207768987536931)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    LISTAGG(TO_CHAR( TO_NUMBER( RAWTOHEX(letter), ''XXXX'' ) + TO_NUMBER( ''2'', ''XX'' ), ''FMXXXX'' ), '''' ) WITHIN GROUP (ORDER BY THE_LEVEL) AS ENCR_USER_NAME',
'FROM',
'(',
'    SELECT LEVEL THE_LEVEL, SUBSTR(:APP_USER, LEVEL, 1) LETTER',
'    FROM DUAL',
'    CONNECT BY LEVEL <= LENGTH(:APP_USER)',
');'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44208270043536936)
,p_name=>'P14_ENC_PWD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(44207768987536931)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    LISTAGG(TO_CHAR( TO_NUMBER( RAWTOHEX(letter), ''XXXX'' ) + TO_NUMBER( ''2'', ''XX'' ), ''FMXXXX'' ), '''' ) WITHIN GROUP (ORDER BY THE_LEVEL) AS ENCR_USER_NAME',
'FROM',
'(',
'    SELECT LEVEL THE_LEVEL, SUBSTR(''P'' || :APP_USER, LEVEL, 1) LETTER',
'    FROM DUAL',
'    CONNECT BY LEVEL <= LENGTH(''P'' || :APP_USER)',
');'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(792671881221460141)
,p_name=>'P14_URL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(44207768987536931)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT target',
'FROM dl_common.apex_lists',
'WHERE list_name = ''VEHICLE_DETAILS_TM2''',
'AND ROWNUM = 1;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40193100290171122)
,p_name=>'DA_Close_Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(42995251132375460)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40193232213171123)
,p_event_id=>wwv_flow_api.id(40193100290171122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(44208039602536934)
,p_name=>'New'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(44208151999536935)
,p_event_id=>wwv_flow_api.id(44208039602536934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''&AI_BORDERPOST_ID.'');'
,p_stop_execution_on_error=>'Y'
);
end;
/
