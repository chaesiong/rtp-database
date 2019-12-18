CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PKG_DYNAMIC_SQLS" IS

/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* MSCS      19.09.2019  Added 
*******************************************************************************/
    

    /*
    -- Get dynamic sql text from dl_common.dynamic_sqls.sql_text: Generic
    -- Added by MSCS
    */
    FUNCTION get_dyn_sql_text
    (
        p_name          IN dl_common.dynamic_sqls.name%type
        , p_app_alias   IN dl_common.dynamic_sqls.app_alias%type
    ) RETURN dl_common.dynamic_sqls.sql_text%type;
    
    
    /*
    -- Get dynamic sql bind var names from dl_common.dynamic_sqls.bind_var_names: Generic
    -- Added by MSCS
    */
    FUNCTION get_dyn_bind_names
    (
        p_name          IN dl_common.dynamic_sqls.name%type
        , p_app_alias   IN dl_common.dynamic_sqls.app_alias%type
    ) RETURN dl_common.dynamic_sqls.bind_var_names%type;
    --
    --
    FUNCTION get_object_name RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_object_copyright RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_object_version$vc RETURN VARCHAR2 DETERMINISTIC;
    --
END PKG_DYNAMIC_SQLS;
/
