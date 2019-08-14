CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_DL_I18N" AS

  -- ATTENTION: Omit the actual database scheme name reflecting the APEX version number to prevent from this dependency.
  SUBTYPE apex_workspace_name_t IS apex_application_translations.workspace%TYPE; -- apex_applications.workspace%TYPE
  SUBTYPE apex_security_group_id_t IS NUMBER; -- wwv_flow_companies.provisioning_company_id%TYPE
  SUBTYPE apex_application_id_t IS apex_application_translations.application_id%TYPE;
  SUBTYPE language_code_t IS VARCHAR2(2 CHAR);
  SUBTYPE territory_code_t IS VARCHAR2(2 CHAR);
  SUBTYPE widget_name_t IS VARCHAR2(50 CHAR);
  SUBTYPE context_name_t IS VARCHAR2(15 CHAR);

  gc_apex_workspace_name CONSTANT apex_workspace_name_t NOT NULL := 'DL_BORDERCONTROL';
  gc_default_language_code CONSTANT language_code_t NOT NULL := 'en';
  gc_widget_name_max_len CONSTANT POSITIVEN := 30;
  gc_widget_name_delimiter CONSTANT VARCHAR2(1 CHAR) NOT NULL := ':';
  gc_context_name_max_len CONSTANT POSITIVEN := 15;
  gc_context_name CONSTANT context_name_t NOT NULL := 'I18N';
  gc_message_list_identifier CONSTANT VARCHAR2(1000 CHAR) NOT NULL := 'items';
  gc_message_key_identifier CONSTANT VARCHAR2(1000 CHAR) NOT NULL := 'translatable_message';
  gc_message_text_identifier CONSTANT VARCHAR2(1000 CHAR) NOT NULL := 'message_text';

  TYPE apex_text_messages_context_t IS RECORD
  (
    v_apex_workspace_name apex_workspace_name_t,
    v_apex_security_group_id apex_security_group_id_t,
    v_apex_application_id apex_application_id_t,
    v_language_code language_code_t,
    v_territory_code territory_code_t,
    v_widget_name widget_name_t -- aka 'namespace' in javascript code
  );

  -- ATTENTION: On these views you cannot omit the actual database scheme name reflecting the APEX version number to prevent from this dependency.
  SUBTYPE message_key_t IS  apex_wwv_flow_messages.name%TYPE;
  SUBTYPE message_text_t IS apex_wwv_flow_messages.message_text%TYPE;

  gc_message_key_separator CONSTANT VARCHAR2(1 CHAR) NOT NULL := '.';

  TYPE apex_text_message_t IS RECORD
  (
    v_key message_key_t,
    v_text message_text_t
  );

  TYPE apex_text_message_list_t IS TABLE OF apex_text_message_t;

  TYPE apex_text_messages_t IS RECORD
  (
    v_context apex_text_messages_context_t,
    v_list apex_text_message_list_t
  );

  TYPE apex_text_messages_set_t IS TABLE OF apex_text_messages_t;

  TYPE language_code_list_t IS TABLE OF language_code_t;

  ---------------------------------------------------------------------------------------------------

  FUNCTION create_apex_text_messages_ctx(i_apex_application_id IN apex_application_id_t, i_language_code IN language_code_t, i_widget_name IN widget_name_t DEFAULT NULL) RETURN apex_text_messages_context_t;

  FUNCTION create_apex_text_messages_ctx(i_language_code IN language_code_t, i_widget_name IN widget_name_t DEFAULT NULL) RETURN apex_text_messages_context_t;

  FUNCTION query_available_languages(i_apex_text_message_context IN apex_text_messages_context_t) RETURN language_code_list_t;

  FUNCTION query_text_messages(i_apex_text_message_context IN apex_text_messages_context_t) RETURN apex_text_messages_t;

  -- TESTING: PROCEDURE persist_text_messages(i_apex_text_messages_context IN apex_text_messages_context_t, i_json_text_messages_tree_text IN VARCHAR2);

  FUNCTION process_ajax_region_request(p_region IN apex_plugin.t_region, p_plugin IN apex_plugin.t_plugin) RETURN apex_plugin.t_region_ajax_result;

  FUNCTION process_ajax_item_request(p_item IN apex_plugin.T_PAGE_ITEM, p_plugin IN apex_plugin.T_PLUGIN ) RETURN apex_plugin.T_PAGE_ITEM_AJAX_RESULT;

END PKG_DL_I18N;
/
