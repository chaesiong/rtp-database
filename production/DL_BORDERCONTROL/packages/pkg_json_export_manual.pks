CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_JSON_EXPORT_MANUAL" AS 

function get_movements_jira(p_id in varchar2) return clob;
  /* TODO enter package declarations (types, exceptions, methods etc) here */ 

END PKG_JSON_EXPORT_MANUAL;
/
