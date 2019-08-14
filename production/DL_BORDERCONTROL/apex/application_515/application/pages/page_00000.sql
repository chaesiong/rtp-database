prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(71772255799297339)
,p_name=>'Global Page - Desktop'
,p_page_mode=>'NORMAL'
,p_step_title=>'Global Page - Desktop'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DNOTZON'
,p_last_upd_yyyymmddhh24miss=>'20180712131401'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99807805481740510)
,p_plug_name=>'deviceStatusIcons.css Addition'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71728592795297126)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.hardwareStatus .fingerprintReaderIcon {',
'    -webkit-mask: url(#APP_IMAGES#svg/Fingerprint-Scan.svg ) no-repeat center;',
'}',
'.hardwareStatus .webcamIcon {',
'    -webkit-mask: url(#APP_IMAGES#svg/Webcam.svg ) no-repeat center;',
'}',
'.hardwareStatus .passReaderIcon {',
'    -webkit-mask: url(#APP_IMAGES#svg/Passport-Scan.svg ) no-repeat center;',
'}',
'</style>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_plug_comment=>'This will show the Icons in the Navbar. It can''t be included in the css file because workspace images won''t get loaded that way.'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(66473249798557973)
,p_name=>'Fix Alert Button Icon'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(66473393007557974)
,p_event_id=>wwv_flow_api.id(66473249798557973)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#APEX_ERROR_MESSAGE .t-Body-alert div.t-Alert-buttons span.t-Icon").initialize( function(){',
'    $(this).addClass(''fa'');',
'});',
'',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
