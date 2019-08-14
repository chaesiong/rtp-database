prompt --application/shared_components/plugins/dynamic_action/com_dermalog_fingercapture_releasedevice
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(30844828361554858)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.DERMALOG.FINGERCAPTURE.RELEASEDEVICE'
,p_display_name=>'FingerCapture realease the device for other controller'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM.DERMALOG.FINGERCAPTURE.RELEASEDEVICE'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'FUNCTION render(',
'    p_dynamic_action IN apex_plugin.t_dynamic_action,',
'    p_plugin         IN apex_plugin.t_plugin',
') RETURN apex_plugin.t_dynamic_action_render_result',
'IS',
'    l_result apex_plugin.t_dynamic_action_render_result;',
'BEGIN',
'    l_result.javascript_function := ''com.dermalog.fingercapture.releasedevice'';',
'    RETURN l_result;',
'END render;',
'',
''))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.8.10'
);
end;
/