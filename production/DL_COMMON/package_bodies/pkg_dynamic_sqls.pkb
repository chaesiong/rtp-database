CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_COMMON"."PKG_DYNAMIC_SQLS" IS
  
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* MSCS      19.09.2019  Added 
*******************************************************************************/
    
    ---------------------
    -- version --
    ---------------------
    c_object_version   CONSTANT VARCHAR2(19) := '1.0.0000';
    c_object_copyright CONSTANT VARCHAR2(255 CHAR) := 'Copyright: MSC Sittipol Co. Ltd., 2013-' || TO_CHAR(SYSDATE, 'YYYY');
    
    ---------------------
    -- scope --
    ---------------------
    c_scope_prefix CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
    
    ---------------------
    -- global vars --
    ---------------------
    
    
    /*
    -- Get dynamic sql text from dl_common.dynamic_sqls.sql_text: Generic
    -- Added by MSCS
    */
    FUNCTION get_dyn_sql_text
    (
        p_name          IN dl_common.dynamic_sqls.name%type
        , p_app_alias   IN dl_common.dynamic_sqls.app_alias%type
    ) RETURN dl_common.dynamic_sqls.sql_text%type
    IS
        l_scope        logger_logs.scope%TYPE := c_scope_prefix || 'get_dyn_sql_text';
        l_params       logger.tab_param;
        --
        l_sql_text              dl_common.dynamic_sqls.sql_text%type;
        --
        E_DYN_SQL_NOT_FOUND     EXCEPTION;
        --
    BEGIN
        
        logger.append_param(l_params, 'p_name', p_name);
        logger.append_param(l_params, 'p_app_alias', p_app_alias);
        logger.log('GET DYNAMIC SQL TEXT: start', l_scope, null, l_params);
        
        -- get sql
        BEGIN
            SELECT sql_text
            INTO l_sql_text
            FROM dl_common.dynamic_sqls
            WHERE name = p_name
            AND app_alias = p_app_alias;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE E_DYN_SQL_NOT_FOUND;
        END;
        
        logger.log('GET DYNAMIC SQL TEXT: done', l_scope, null, l_params);
        
        -- return
        RETURN l_sql_text;
        
    EXCEPTION
        WHEN E_DYN_SQL_NOT_FOUND THEN
            logger.log_error('get_dyn_sql_text: E_DYN_SQL_NOT_FOUND', l_scope, null, l_params);
            RETURN NULL;
        WHEN OTHERS THEN
            logger.log_error('get_dyn_sql_text: unhandled exeption', l_scope, null, l_params);
            RETURN NULL;
                
    END get_dyn_sql_text;
    
    
    /*
    -- Get dynamic sql bind var names from dl_common.dynamic_sqls.bind_var_names: Generic
    -- Added by MSCS
    */
    FUNCTION get_dyn_bind_names
    (
        p_name          IN dl_common.dynamic_sqls.name%type
        , p_app_alias   IN dl_common.dynamic_sqls.app_alias%type
    ) RETURN dl_common.dynamic_sqls.bind_var_names%type
    IS
        l_scope        logger_logs.scope%TYPE := c_scope_prefix || 'get_dyn_bind_names';
        l_params       logger.tab_param;
        --
        l_bind_var_names        dl_common.dynamic_sqls.bind_var_names%type;
        --
        E_DYN_SQL_NOT_FOUND     EXCEPTION;
        --
    BEGIN
    
        logger.append_param(l_params, 'p_name', p_name);
        logger.append_param(l_params, 'p_app_alias', p_app_alias);
        logger.log('GET DYNAMIC SQL BIND NAMES: start', l_scope, null, l_params);
        
        -- get sql
        BEGIN
            SELECT bind_var_names
            INTO l_bind_var_names
            FROM dl_common.dynamic_sqls
            WHERE name = p_name
            AND app_alias = p_app_alias;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE E_DYN_SQL_NOT_FOUND;
        END;
        
        logger.log('GET DYNAMIC SQL BIND NAMES: done', l_scope, null, l_params);
        
        -- return
        RETURN l_bind_var_names;
    
    EXCEPTION
        WHEN E_DYN_SQL_NOT_FOUND THEN
            logger.log_error('get_dyn_bind_names: E_DYN_SQL_NOT_FOUND', l_scope, null, l_params);
            RETURN NULL;
        WHEN OTHERS THEN
            logger.log_error('get_dyn_bind_names: unhandled exeption', l_scope, null, l_params);
            RETURN NULL;
                
    END get_dyn_bind_names;
    --
    --
    -- *** Standard functions ***************************************************************************
    --
    FUNCTION Get_OBJECT_NAME RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN $$plsql_unit_owner || '.' || $$plsql_unit;
    END;
    --
    FUNCTION Get_OBJECT_COPYRIGHT RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN c_object_copyright;
    END;
    --
    FUNCTION Get_OBJECT_VERSION$VC RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN c_object_version;
    END;
    --
    
end PKG_DYNAMIC_SQLS;
/
  GRANT EXECUTE ON "DL_COMMON"."PKG_DYNAMIC_SQLS" TO "DL_BORDERCONTROL";
