CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_DL_I18N" AS

  ---------------------------------------------------------------------------------------------------

  PROCEDURE trace(i_message IN VARCHAR2, i_label IN VARCHAR2 DEFAULT NULL) IS
    BEGIN

      PKG_DL_UTILS.output_message(i_message, i_label);

    END trace;

  ---------------------------------------------------------------------------------------------------

  FUNCTION get_newline RETURN VARCHAR2 IS

    lc_new_line CONSTANT VARCHAR2(2 CHAR) NOT NULL := CHR(13) || CHR(10);

    BEGIN

      RETURN lc_new_line;

    END get_newline;

  ---------------------------------------------------------------------------------------------------

  FUNCTION create_apex_text_messages_ctx(i_apex_application_id IN apex_application_id_t, i_language_code IN language_code_t, i_widget_name IN widget_name_t DEFAULT NULL) RETURN apex_text_messages_context_t IS

    l_apex_workspace_name apex_workspace_name_t;
    l_apex_security_group_id apex_security_group_id_t;
    l_context apex_text_messages_context_t;

    BEGIN

      SELECT workspace INTO l_apex_workspace_name FROM apex_applications WHERE application_id = i_apex_application_id;
      l_apex_security_group_id := apex_util.find_security_group_id(l_apex_workspace_name);

      l_context.v_apex_workspace_name := gc_apex_workspace_name;
      l_context.v_apex_security_group_id := l_apex_security_group_id;
      l_context.v_apex_application_id := i_apex_application_id;
      l_context.v_language_code := i_language_code;
      l_context.v_territory_code := NULL;
      l_context.v_widget_name := i_widget_name;

      RETURN l_context;

    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION create_apex_text_messages_ctx(i_language_code IN language_code_t, i_widget_name IN widget_name_t DEFAULT NULL) RETURN apex_text_messages_context_t IS
    BEGIN

      RETURN create_apex_text_messages_ctx(TO_NUMBER(v('APP_ID')), i_language_code, i_widget_name); --TO_NUMBER(NVL(v('APP_ID'), 100)); for testing outside of APEX ??

    END;

  ---------------------------------------------------------------------------------------------------

  PROCEDURE trace_apex_text_messages_ctx(i_apex_text_messages_context IN apex_text_messages_context_t) IS
    BEGIN

      trace('-- Apex Text Message Context --');
      trace('APEX WORKSPACE NAME: ' || i_apex_text_messages_context.v_apex_workspace_name);
      trace('APEX SECURITY GROUP ID: ' || TO_CHAR(i_apex_text_messages_context.v_apex_security_group_id));
      trace('APEX APPLICATION ID: ' || TO_CHAR(i_apex_text_messages_context.v_apex_application_id));
      trace('LANGUAGE CODE: ' || i_apex_text_messages_context.v_language_code);
      trace('TERRITORY CODE: ' || i_apex_text_messages_context.v_territory_code);
      trace('WIDGET NAME: ' || i_apex_text_messages_context.v_widget_name);

    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION query_available_languages(i_apex_text_message_context IN apex_text_messages_context_t) RETURN language_code_list_t IS

    l_language_code_list language_code_list_t := language_code_list_t();

    BEGIN

      SELECT DISTINCT language_code
      BULK COLLECT INTO l_language_code_list
      FROM apex_application_translations -- read-only view
      WHERE 1 = 1
            AND workspace = i_apex_text_message_context.v_apex_workspace_name
            AND application_id = i_apex_text_message_context.v_apex_application_id;

      RETURN l_language_code_list;

    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION query_text_messages(i_apex_text_message_context IN apex_text_messages_context_t) RETURN apex_text_messages_t IS

    l_apex_text_messages apex_text_messages_t;
    l_message_name_sql_filter VARCHAR2(4096 CHAR) NOT NULL DEFAULT '%';

    BEGIN

      IF i_apex_text_message_context.v_widget_name IS NULL THEN
        RAISE PKG_DL_UTILS.e_missing_parameter;
      END IF;

      l_apex_text_messages.v_context := i_apex_text_message_context;
      l_message_name_sql_filter := l_apex_text_messages.v_context.v_widget_name || gc_widget_name_delimiter || l_message_name_sql_filter;

      -- NOTE: Querying the read-only view apex_050100.apex_application_translations takes the query authorizations into consideration.

      SELECT
        SUBSTR(translatable_message, INSTR(translatable_message, gc_widget_name_delimiter) + 1) AS message_key,
        message_text
      BULK COLLECT INTO l_apex_text_messages.v_list
      FROM apex_application_translations
      WHERE 1 = 1
            AND workspace = i_apex_text_message_context.v_apex_workspace_name
            AND application_id = i_apex_text_message_context.v_apex_application_id
            AND language_code LIKE LOWER((i_apex_text_message_context.v_language_code || '%'))
            AND translatable_message LIKE UPPER((l_message_name_sql_filter))
      ORDER BY translatable_message ASC;

      RETURN l_apex_text_messages;

    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION convert_to_json_tree(i_apex_text_messages_context IN apex_text_messages_context_t, i_apex_text_messages_set IN apex_text_messages_set_t) RETURN json IS

    -- NOTE: Based upon PL/JSON that can be found at http://pljson.github.io/pljson/ due to some improper functionality in APEX_JSON.
    -- The parser follows the json specification described @ www.json.org.

      pljson_scanner_exception EXCEPTION; PRAGMA exception_init(pljson_scanner_exception, -20100);
      pljson_parser_exception EXCEPTION; PRAGMA exception_init(pljson_parser_exception, -20101);
      pljson_jext_exception EXCEPTION; PRAGMA exception_init(pljson_jext_exception, -20110);

    l_language_count NATURALN := 0;
    l_message_count NATURALN := 0;
    l_apex_text_message apex_text_message_t;
    l_json_message_nodes json_list NOT NULL := json_list();
    l_json_message_node json NOT NULL := json();
    l_json_result_tree json NOT NULL := json('{ "language": "' || i_apex_text_messages_context.v_language_code || '" }');

    BEGIN

      l_language_count := i_apex_text_messages_set.count();
      FOR i IN 1..l_language_count LOOP

        l_message_count := i_apex_text_messages_set(i).v_list.count();
        FOR j IN 1..l_message_count LOOP

          l_apex_text_message := i_apex_text_messages_set(i).v_list(j);
          l_json_message_node := json();
          l_json_message_node.put(gc_message_key_identifier, LOWER(l_apex_text_message.v_key));
          l_json_message_node.put(gc_message_text_identifier, l_apex_text_message.v_text);
          l_json_message_nodes.append(l_json_message_node.to_json_value);

        END LOOP;

        l_json_result_tree.put(gc_message_list_identifier, l_json_message_nodes);

      END LOOP;

      RETURN l_json_result_tree;

      EXCEPTION
      WHEN pljson_scanner_exception THEN
      SYS.dbms_output.put_line(SQLERRM);
      WHEN pljson_parser_exception THEN
      SYS.dbms_output.put_line(SQLERRM);
      WHEN pljson_jext_exception THEN
      SYS.dbms_output.put_line(SQLERRM);
    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION convert_to_json_tree(i_apex_text_messages_context IN apex_text_messages_context_t, i_apex_text_messages IN apex_text_messages_t) RETURN json IS
    BEGIN

      RETURN convert_to_json_tree(i_apex_text_messages_context, apex_text_messages_set_t(i_apex_text_messages));

    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION query_text_messages_as_json(i_apex_text_messages_context IN apex_text_messages_context_t) RETURN json IS

    l_apex_text_messages apex_text_messages_t;
    l_json_tree json;

    BEGIN

      l_apex_text_messages := query_text_messages(i_apex_text_messages_context);
      l_json_tree := convert_to_json_tree(i_apex_text_messages_context, l_apex_text_messages);

      RETURN l_json_tree;

    END query_text_messages_as_json;

  ---------------------------------------------------------------------------------------------------

PROCEDURE create_text_message(i_apex_text_messages_context IN apex_text_messages_context_t, i_message_key IN message_key_t, i_message_text IN message_text_t) IS

    l_count         NATURAL NOT NULL := 0;
    l_message_name  VARCHAR2(4000 CHAR);
BEGIN
    l_message_name := i_apex_text_messages_context.v_widget_name || gc_widget_name_delimiter || i_message_key;

    SELECT  COUNT(*)
    INTO    l_count
    FROM    apex_wwv_flow_messages
    WHERE   flow_id = i_apex_text_messages_context.v_apex_application_id
    AND     message_language = LOWER( i_apex_text_messages_context.v_language_code )
    AND     name = UPPER( l_message_name )
    AND     security_group_id = i_apex_text_messages_context.v_apex_security_group_id
    ;

    IF TRUE THEN
        apex_debug.enable(1); -- param: severity level
        trace_apex_text_messages_ctx(i_apex_text_messages_context);
    END IF;

    IF l_count = 0 THEN
        INSERT INTO apex_wwv_flow_messages
        (       id,
                flow_id,
                name,
                message_language,
                message_text,
                is_js_message,
                security_group_id,
                last_updated_by,
                last_updated_on,
                created_by,
                created_on,
                message_comment
        )
        VALUES(
          /* ID */ NULL, -- NOTE: automatically created by trigger apex_050100.WWV_FLOW_MESSAGES_T1
         /* FLOW_ID */ i_apex_text_messages_context.v_apex_application_id,
         /* NAME */ UPPER( l_message_name ),
         /* MESSAGE_LANGUAGE */ LOWER( i_apex_text_messages_context.v_language_code ),
         /* MESSAGE_TEXT */ i_message_text,
         /* IS_JS_MESSAGE */ 'Y',
         /* SECURITY_GROUP_ID */ i_apex_text_messages_context.v_apex_security_group_id,
         /* LAST_UPDATED_BY */ NULL,
         /* LAST_UPDATED_ON */ NULL,
         /* CREATED_BY */ NULL, -- wwv_flow.g_user
         /* CREATED_ON */ SYSDATE,
          /* MESSAGE_COMMENT */ NULL
        );

    END IF;

END;

  ---------------------------------------------------------------------------------------------------

  PROCEDURE create_text_messages(i_apex_text_messages_context IN apex_text_messages_context_t, i_apex_text_message_list IN apex_text_message_list_t) IS
    BEGIN

      IF i_apex_text_message_list IS NOT NULL THEN

        BEGIN
          FOR i IN 1..i_apex_text_message_list.COUNT LOOP

            create_text_message(i_apex_text_messages_context, i_apex_text_message_list(i).v_key,  i_apex_text_message_list(i).v_text);

          END LOOP;
          COMMIT;
          EXCEPTION
          WHEN OTHERS THEN
          ROLLBACK;
          RAISE;
        END;

      END IF;

    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION create_text_message_record(i_message_key IN message_key_t, i_message_text IN message_text_t) RETURN apex_text_message_t IS

    l_apex_text_message apex_text_message_t;

    BEGIN

      l_apex_text_message.v_key := i_message_key;
      l_apex_text_message.v_text := i_message_text;

      RETURN l_apex_text_message;

    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION convert_to_text_message_list(i_json_text_messages_tree IN json) RETURN apex_text_message_list_t IS

    l_json_node json;
    l_json_node_content json_value;
    l_json_text_message_list json_list;

    l_message_key message_key_t;
    l_message_text message_text_t;

    l_apex_text_message_list apex_text_message_list_t := apex_text_message_list_t();

    BEGIN

      IF i_json_text_messages_tree.exist(gc_message_list_identifier) THEN
        l_json_node_content := i_json_text_messages_tree.get(gc_message_list_identifier);
        IF l_json_node_content.is_array THEN

          l_json_text_message_list := json_list(l_json_node_content);
          FOR i IN 1..l_json_text_message_list.count LOOP

            l_json_node := json(l_json_text_message_list.get(i));
            IF l_json_node.exist(gc_message_key_identifier) THEN

              l_message_key := l_json_node.get(gc_message_key_identifier).get_string;
              IF l_message_key IS NOT NULL AND l_json_node.exist(gc_message_text_identifier) THEN

                l_message_text := l_json_node.get(gc_message_text_identifier).get_string;
                l_apex_text_message_list.extend();
                l_apex_text_message_list(l_apex_text_message_list.count()) := create_text_message_record(l_message_key, l_message_text);

              END IF;
            END IF;

          END LOOP;

        END IF;
      END IF;

      RETURN l_apex_text_message_list;

    END;

  ---------------------------------------------------------------------------------------------------

  PROCEDURE persist_text_messages(i_apex_text_messages_context IN apex_text_messages_context_t, i_json_text_messages_tree_text IN VARCHAR2) IS

    l_json_text_messages_tree json;
    l_apex_text_message_list apex_text_message_list_t;

      pljson_scanner_exception EXCEPTION; PRAGMA exception_init(pljson_scanner_exception, -20100);
      pljson_parser_exception EXCEPTION; PRAGMA exception_init(pljson_parser_exception, -20101);
      pljson_jext_exception EXCEPTION; PRAGMA exception_init(pljson_jext_exception, -20110);

    BEGIN

      IF i_json_text_messages_tree_text IS NOT NULL THEN

        l_json_text_messages_tree := json(i_json_text_messages_tree_text);
        l_apex_text_message_list := convert_to_text_message_list(l_json_text_messages_tree);
        create_text_messages(i_apex_text_messages_context, l_apex_text_message_list);

      END IF;

      EXCEPTION
      WHEN OTHERS THEN
      SYS.dbms_output.put_line(SQLERRM);
      RAISE;

    END persist_text_messages;

  ---------------------------------------------------------------------------------------------------

  FUNCTION get_widget_name(i_plugin IN apex_plugin.t_plugin) RETURN VARCHAR2 IS

    lc_plugin_name_prefix CONSTANT VARCHAR2(30 CHAR) := 'COM.DERMALOG.';
    l_plugin_name_prefix_pos NATURAL;
    l_widget_name widget_name_t;

    BEGIN

      IF i_plugin.name IS NOT NULL THEN
        IF lc_plugin_name_prefix IS NULL THEN
          l_widget_name := UPPER(i_plugin.name);
        ELSE
          l_plugin_name_prefix_pos := INSTR(i_plugin.name, lc_plugin_name_prefix);
          IF l_plugin_name_prefix_pos > 0 THEN
            l_widget_name := UPPER(SUBSTR(i_plugin.name, l_plugin_name_prefix_pos + LENGTH(lc_plugin_name_prefix)));
          END IF;
        END IF;
      END IF;

      RETURN l_widget_name;

    END;

  ---------------------------------------------------------------------------------------------------

  FUNCTION process_ajax_region_request(p_region IN apex_plugin.t_region, p_plugin IN apex_plugin.t_plugin) RETURN apex_plugin.t_region_ajax_result IS

    lc_ajax_requested_operation CONSTANT VARCHAR2(30 CHAR) := v('APP_AJAX_X02');
    l_apex_text_messages_context apex_text_messages_context_t;
    l_json_tree_as_text VARCHAR2(32767 CHAR);
    l_ajax_result apex_plugin.t_region_ajax_result;

    BEGIN

      apex_plugin_util.debug_region(p_plugin, p_region);

      IF FALSE THEN
        apex_debug.enable(1); -- param: severity level
        -- pkg_dl_apex_utils.trace_plugin_record(p_plugin);
        -- pkg_dl_apex_utils.trace_region_record(p_region);
      END IF;

      IF lc_ajax_requested_operation IS NULL THEN
        RAISE_APPLICATION_ERROR(-20003, 'Missing the operation name in APP_AJAX_X02 for the AJAX request received!');
      END IF;

      l_apex_text_messages_context := create_apex_text_messages_ctx(v('APP_ID'), v('APP_AJAX_X03'), get_widget_name(p_plugin)); -- APEX_UTIL.GET_SESSION_LANG? v('BROWSER_LANGUAGE')?

      CASE lc_ajax_requested_operation

        WHEN 'GET' THEN
        SYS.owa_util.mime_header('application/json', TRUE); --apex_plugin_util.print_json_http_header;
        query_text_messages_as_json(l_apex_text_messages_context).htp();
        WHEN 'POST' THEN
        l_json_tree_as_text := v('APP_AJAX_X04');
        persist_text_messages(l_apex_text_messages_context, l_json_tree_as_text);
      ELSE
        RAISE_APPLICATION_ERROR(-20004, 'Invalid operation name has been encountered in APP_AJAX_X02 for the AJAX request received!');

      END CASE;

      RETURN l_ajax_result;

    END process_ajax_region_request;

  FUNCTION process_ajax_item_request(
    p_item   IN apex_plugin.T_PAGE_ITEM,
    p_plugin IN apex_plugin.T_PLUGIN
  ) RETURN apex_plugin.T_PAGE_ITEM_AJAX_RESULT
  IS

    lc_ajax_requested_operation CONSTANT VARCHAR2(30 CHAR) := v('APP_AJAX_X02');
    l_apex_text_messages_context apex_text_messages_context_t;
    l_json_tree_as_text VARCHAR2(32767 CHAR);
    l_ajax_result apex_plugin.t_page_item_ajax_result;

    BEGIN

      apex_plugin_util.debug_page_item(p_plugin, p_item);

      IF FALSE THEN
        apex_debug.enable(1); -- param: severity level
        -- pkg_dl_apex_utils.trace_plugin_record(p_plugin);
      END IF;

      IF lc_ajax_requested_operation IS NULL THEN
        RAISE_APPLICATION_ERROR(-20003, 'Missing the operation name in APP_AJAX_X02 for the AJAX request received!');
      END IF;

      l_apex_text_messages_context := create_apex_text_messages_ctx(v('APP_ID'), v('APP_AJAX_X03'), get_widget_name(p_plugin)); -- APEX_UTIL.GET_SESSION_LANG? v('BROWSER_LANGUAGE')?

      CASE lc_ajax_requested_operation

        WHEN 'GET' THEN
        SYS.owa_util.mime_header('application/json', TRUE); --apex_plugin_util.print_json_http_header;
        query_text_messages_as_json(l_apex_text_messages_context).htp();
        WHEN 'POST' THEN
        l_json_tree_as_text := v('APP_AJAX_X04');
        persist_text_messages(l_apex_text_messages_context, l_json_tree_as_text);
      ELSE
        RAISE_APPLICATION_ERROR(-20004, 'Invalid operation name has been encountered in APP_AJAX_X02 for the AJAX request received!');

      END CASE;

      RETURN l_ajax_result;

    END process_ajax_item_request;

  ---------------------------------------------------------------------------------------------------

END PKG_DL_I18N;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_I18N" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_I18N" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_I18N" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_I18N" TO "BIOSUPPORT";
