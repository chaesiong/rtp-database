prompt --application/shared_components/plugins/dynamic_action/com_dermalog_shortcut
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(73689998319956758)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.DERMALOG.SHORTCUT'
,p_display_name=>'Shortcut'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM.DERMALOG.SHORTCUT'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/**',
' * This function executes the PL/SQL code that is set for execution in add_shortcut function',
' * @param p_dynamic_action  Object of Dynamic Action (includes the attributes of the plugin)',
' * @param p_plugin          Object of the Plugin',
' * @return apex_plugin.t_dynamic_action_ajax_result',
' */',
'FUNCTION add_shortcut_ajax (p_dynamic_action in apex_plugin.t_dynamic_action',
'                           ,p_plugin         in apex_plugin.t_plugin )',
'RETURN apex_plugin.t_dynamic_action_ajax_result',
'IS',
'',
'    l_result apex_plugin.t_dynamic_action_ajax_result;',
'',
'BEGIN',
'',
'    apex_javascript.add_inline_code(p_code => ''console.log("ADD_SHORTCUT_AJAX")'');',
'',
'    RETURN l_result;',
'',
'END;',
'',
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
'    IF l_execute_code = ''JS'' AND l_javascript_code IS NOT NULL ',
'    THEN',
'',
'        l_result.javascript_function := ''shortcut.add("'' || l_shortcut_attribute || ''", function() {'' || l_javascript_code || ''})'';',
'',
'    ELSIF l_execute_code = ''PLSQL'' AND l_plsql_code IS NOT NULL',
'    THEN',
'        ',
'        l_result.javascript_function := ''apex.server.plugin("'' || apex_plugin.get_ajax_identifier || ''",',
'                                                            {},',
'                                                            { success: function(pData) {',
'                                                                alert("something");',
'                                                            }})'';',
'',
'    ELSE',
'        NULL;',
'',
'    END IF;',
'',
'    apex_javascript.add_inline_code(p_code => ''console.log("Shortcut '' || l_shortcut_attribute || '' initialized")'');',
'    apex_javascript.add_inline_code(p_code => ''console.log("Shortcut '' || apex_plugin_util.escape(p_value => p_dynamic_action.attribute_02, p_escape => true) || '' initialized")'');',
'    apex_javascript.add_inline_code(p_code => ''console.log("Shortcut '' || apex_plugin_util.escape(p_value => p_dynamic_action.attribute_03, p_escape => true) || '' initialized")'');',
'    apex_javascript.add_inline_code(p_code => ''console.log("Shortcut '' || apex_plugin_util.escape(p_value => p_dynamic_action.attribute_04, p_escape => true) || '' initialized")'');',
'',
'    RETURN l_result;',
'END;'))
,p_api_version=>2
,p_render_function=>'add_shortcut'
,p_ajax_function=>'add_shortcut_ajax'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(73690899095972381)
,p_plugin_id=>wwv_flow_api.id(73689998319956758)
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
 p_id=>wwv_flow_api.id(73712341032260740)
,p_plugin_id=>wwv_flow_api.id(73689998319956758)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Execute Code'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'JS'
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(73712993442261712)
,p_plugin_attribute_id=>wwv_flow_api.id(73712341032260740)
,p_display_sequence=>10
,p_display_value=>'Javascript'
,p_return_value=>'JS'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(73713463817262365)
,p_plugin_attribute_id=>wwv_flow_api.id(73712341032260740)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Code'
,p_return_value=>'PLSQL'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(73708143706214427)
,p_plugin_id=>wwv_flow_api.id(73689998319956758)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Javascript Code'
,p_attribute_type=>'JAVASCRIPT'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(73712341032260740)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'JS'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(73708859120216644)
,p_plugin_id=>wwv_flow_api.id(73689998319956758)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'PL/SQL Code'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(73712341032260740)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PLSQL'
);
end;
/
