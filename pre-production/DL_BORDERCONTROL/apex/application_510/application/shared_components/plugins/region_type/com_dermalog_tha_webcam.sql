prompt --application/shared_components/plugins/region_type/com_dermalog_tha_webcam
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(132760284626002452)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.DERMALOG.THA.WEBCAM'
,p_display_name=>'Webcam Region'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.DERMALOG.THA.WEBCAM'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_webcam_region (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'is',
'',
'    l_result apex_plugin.t_region_render_result;',
'',
'begin',
'',
'    htp.p(''<img id="photoPreview" style="width: 450px; height: 337.5px" src="">'');',
'    htp.p(''<button class="t-Button t-Button--noLabel t-Button--icon t-Button--pillStart" type="button" id="xyz"><span class="t-Icon fa fa-refresh fa-2x" aria-hidden="true"></span></button>'');',
'    htp.p(''<button class="t-Button t-Button--noLabel t-Button--icon t-Button--pill" type="button" id="xyz"><span class="t-Icon fa fa-arrow-left-alt fa-2x" aria-hidden="true"></span></button>'');',
'    ',
'    return l_result;',
'end;'))
,p_api_version=>2
,p_render_function=>'render_webcam_region'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
