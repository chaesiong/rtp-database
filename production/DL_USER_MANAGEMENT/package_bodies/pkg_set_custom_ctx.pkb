CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_USER_MANAGEMENT"."PKG_SET_CUSTOM_CTX" is
  /**
  * ========================================================================<br/>
  * <b> Package for custom context custom_ctx </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: MThierhoff $<br/>
  * @date    $Date: 13/03/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  g_scope_prefix constant varchar2(62 char) := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.';

  /**
  * Set username in custom context <br/>
  * @param  i_username    username
  <br/><br/>
  */
  procedure Set_User(i_username    in varchar2
                    ,i_user_source in number) is
    --l_scope  logger_logs.scope%type := g_scope_prefix || 'SET_USER';
    --l_params logger.tab_param;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    DBMS_SESSION.SET_CONTEXT(g_CtxNamespace
                            ,g_CtxUserName
                            ,i_username);
    DBMS_SESSION.SET_CONTEXT(g_CtxNamespace
                            ,g_CtxUserSource
                            ,i_user_source);
    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
                      -- ,l_scope
                      -- ,null
                      -- ,l_params);
      raise;
  end Set_User;

  /**
  * Set application name in custom context <br/>
  * @param  i_app_name    application name
  <br/><br/>
  */
  procedure Set_App_Name(i_app_name in varchar2) is
    --l_scope  logger_logs.scope%type := g_scope_prefix || 'SET_APP_NAME';
    --l_params logger.tab_param;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    DBMS_SESSION.SET_CONTEXT(g_CtxNamespace
                            ,g_CtxAppName
                            ,i_app_name);
    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Set_App_Name;

  /**
  * Set IP in custom context <br/>
  * @param  i_IP    IP
  <br/><br/>
  */
  procedure Set_IP(i_IP in varchar2) is
    --l_scope  logger_logs.scope%type := g_scope_prefix || 'SET_IP';
    --l_params logger.tab_param;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    DBMS_SESSION.SET_CONTEXT(g_CtxNamespace
                            ,g_CtxIP
                            ,i_IP);
    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Set_IP;
  --
  --
  /**
  * Set custom context attributes after logon on database
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    17.07.2018  Post_Db_Logon:Try to detect the right remote ip address
  *******************************************************************************/
  --
  procedure Post_Db_Logon is
    --l_scope    logger_logs.scope%type := g_scope_prefix || 'POST_DB_LOGON';
    --l_params   logger.tab_param;
    l_username varchar2(50) := SYS_CONTEXT('USERENV'
                                          ,'SESSION_USER');
    v_IP       varchar2(200);
    --l_app_name varchar2(200) := SYS_CONTEXT('USERENV','MODULE');
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    set_user(l_username
            ,3);
    --
    -- Following raises sometimes: O R A-06502: PL/SQL: numerischer oder Wertefehler
    -- I could not reproduce the error and assume it depends on, that this procedure is called
    -- from a database-logon-trigger!?
    begin
      v_IP := OWA_UTIL.get_cgi_env('REMOTE_ADDR');
    exception
      when others then
        if (sqlcode != -06502)
        then
          raise;
        end if;
    end;
    if (v_IP is null)
    then
      v_IP := SYS_CONTEXT('USERENV'
                         ,'IP_ADDRESS');
    end if;
    set_IP(v_IP);

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Post_Db_Logon;
  --
  --
  /**
  * Set custom context attributes after logon in apex
  *
  * PARAMETERS
  *   @param  i_user_source    1 if user from AD, 2 if user from Dermalog User Management
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    17.07.2018  Set_Apex_Context:Try to detect the right remote ip address
  *******************************************************************************/
  --
  procedure Set_Apex_Context(i_user_source in number) is
    --l_scope    logger_logs.scope%type := g_scope_prefix || 'Set_Apex_Context';
    --l_params   logger.tab_param;
    l_username varchar2(50) := V('APP_USER');
    v_IP       varchar2(200);
    l_app_name varchar2(200) := V('APP_ALIAS');
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    set_user(l_username
            ,i_user_source);

    v_IP := v('AI_CGI_ENV_REMOTE_ADDR');
    if (v_IP is null)
    then
      v_IP := owa_util.get_cgi_env('REMOTE_ADDR');
      if (v_IP is null)
      then
        v_IP := SYS_CONTEXT('USERENV'
                           ,'IP_ADDRESS');
      end if;
    end if;
    set_IP(v_IP);

    -- set_app_name(l_app_name);
    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Set_Apex_Context;

end PKG_SET_CUSTOM_CTX;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_SET_CUSTOM_CTX" TO "APEX_USER_MANAGEMENT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_SET_CUSTOM_CTX" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_SET_CUSTOM_CTX" TO "DERMALOG_PROXY";
