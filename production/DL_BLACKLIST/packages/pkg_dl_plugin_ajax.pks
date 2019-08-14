CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_DL_PLUGIN_AJAX" AS

  FUNCTION process_ajax_item_request(p_item IN apex_plugin.T_PAGE_ITEM, p_plugin IN apex_plugin.T_PLUGIN)
    RETURN apex_plugin.T_PAGE_ITEM_AJAX_RESULT;

  FUNCTION process_ajax_region_request(p_region IN apex_plugin.T_REGION, p_plugin IN apex_plugin.T_PLUGIN)
    RETURN apex_plugin.T_REGION_AJAX_RESULT;

END PKG_DL_PLUGIN_AJAX;
/
