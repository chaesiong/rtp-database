prompt --application/shared_components/plugins/dynamic_action/com_dermalog_shortcut
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(47883221811587600)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.DERMALOG.SHORTCUT'
,p_display_name=>'Shortcut'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM.DERMALOG.SHORTCUT'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/**',
' * This function renders the Javascript Code to provide the implementation of new shortcuts',
' * @param p_dynamic_action  Object of Dynamic Action (includes the attributes of the plugin)',
' * @param p_plugin          Object of the Plugin',
' * @return apex_plugin.t_dynamic_action_render_result',
' */',
'FUNCTION add_shortcut (p_dynamic_action IN apex_plugin.t_dynamic_action',
'                      ,p_plugin         IN apex_plugin.t_plugin )',
'RETURN apex_plugin.t_dynamic_action_render_result',
'IS',
'',
'    l_shortcut_attribute VARCHAR2(25 CHAR)   := p_dynamic_action.attribute_01;',
'    l_execute_code       VARCHAR2(5 CHAR)    := p_dynamic_action.attribute_02;',
'    l_javascript_code    VARCHAR2(4000 CHAR) := p_dynamic_action.attribute_03;',
'    l_plsql_code         VARCHAR2(4000 CHAR) := p_dynamic_action.attribute_04;',
'    -- ',
'    l_result             apex_plugin.t_dynamic_action_render_result;',
'',
'BEGIN',
'',
'    -- check what type of code should be executed and execute the snippets',
'    l_result.javascript_function := ''shortcut.add("'' || l_shortcut_attribute || ''", function() {'' || l_javascript_code || ''})'';',
'',
'    --l_result.javascript_function := ''shortcut.add("'' || l_shortcut_attribute || ''", function() {alert("test")})'';',
'    apex_javascript.add_inline_code(p_code => ''console.log("Shortcut '' || l_shortcut_attribute || '' initialized")'');',
'    apex_javascript.add_inline_code(p_code => ''console.log("Shortcut '' || apex_plugin_util.escape(p_value => p_dynamic_action.attribute_02, p_escape => true) || '' initialized")'');',
'    apex_javascript.add_inline_code(p_code => ''console.log("Shortcut '' || apex_plugin_util.escape(p_value => p_dynamic_action.attribute_03, p_escape => true) || '' initialized")'');',
'    apex_javascript.add_inline_code(p_code => ''console.log("Shortcut '' || apex_plugin_util.escape(p_value => p_dynamic_action.attribute_04, p_escape => true) || '' initialized")'');',
'',
'    RETURN l_result;',
'END;'))
,p_api_version=>2
,p_render_function=>'add_shortcut'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47884122587603223)
,p_plugin_id=>wwv_flow_api.id(47883221811587600)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Shortcut'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'F7'
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Value for one key:',
'F7',
'',
'Value for multiple keys:',
'Ctrl+Shift+D'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(47901367197845269)
,p_plugin_id=>wwv_flow_api.id(47883221811587600)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Javascript Code'
,p_attribute_type=>'JAVASCRIPT'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
end;
/
