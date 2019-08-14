CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PKG_APEX_UTIL" AS

    FUNCTION IS_CURRENT_PAGE(i_pageid NUMBER,i_app_alias VARCHAR2, i_current_pageid NUMBER, i_current_applicationid NUMBER) return VARCHAR2;

  -- START: f_user_has_other_sessions - Function returns false when user has others Sessions and true if not ******************************************************************
    function f_user_has_other_sessions return number;

  -- START: prc_kill_apex_session - procedure kills the specified APEX Session (not Oracle Session) ******************************************************************
    procedure prc_kill_apex_session ( p_apex_session_id number );

    procedure create_empty_collection(p_collection_name varchar2);

END PKG_APEX_UTIL;
/
