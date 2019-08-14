CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_COMMON"."PKG_SESSION" is
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0014';
  C_OBJECT_COPYRIGHT constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_PACKAGE_Initialized  boolean := false;
  g_PACKAGE_Initializing boolean := false;
  --
  g_AUDIT_User varchar2(255 char);
  g_User_Name  varchar2(255 char);
  g_User_IP    varchar2(255 char);
  g_User_Host  varchar2(255 char);
  g_BY_User    varchar2(255 char);
  g_BY_Host    varchar2(255 char);
  --
  --
  /**
  * ???
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
  * WWirns    02.10.2017  Get_AUDIT_User:Added
  *******************************************************************************/
  --
  function Get_AUDIT_User return varchar2 is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    return g_AUDIT_User;
  end Get_AUDIT_User;
  --
  --
  /**
  * ???
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
  * WWirns    23.07.2018  XX:Added
  *******************************************************************************/
  --
  function Get_User_Name return varchar2 is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    return g_User_Name;
  end Get_User_Name;
  --
  --
  /**
  * ???
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
  * WWirns    23.07.2018  XX:Added
  *******************************************************************************/
  --
  function Get_User_IP return varchar2 is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    return g_User_IP;
  end Get_User_IP;
  --
  --
  /**
  * ???
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
  * WWirns    23.07.2018  XX:Added
  *******************************************************************************/
  --
  function Get_User_Host return varchar2 is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    return g_User_Host;
  end Get_User_Host;
  --
  --
  /**
  * ???
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
  * WWirns    31.08.2018  Set_BY_User:Added
  *******************************************************************************/
  --
  procedure Set_BY_User(p_User in varchar2
                        --
                        ) is
  begin
    g_BY_User := p_User;
  end Set_BY_User;
  --
  --
  /**
  * ???
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
  * WWirns    31.08.2018  Set_BY_Host:Added
  *******************************************************************************/
  --
  procedure Set_BY_Host(p_Host in varchar2
                        --
                        ) is
  begin
    g_BY_Host := p_Host;
  end Set_BY_Host;
  --
  --
  /**
  * ???
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
  * WWirns    30.08.2018  Get_BY_User:Added
  *******************************************************************************/
  --
  function Get_BY_User return varchar2 is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    return nvl(g_BY_User
              ,g_User_Name);
  end Get_BY_User;
  --
  --
  /**
  * ???
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
  * WWirns    30.08.2018  Get_BY_Host:Added
  *******************************************************************************/
  --
  function Get_BY_Host return varchar2 is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    return nvl(g_BY_Host
              ,nvl(g_User_Host
                  ,g_User_IP));
  end Get_BY_Host;
  --
  --
  /**
  * ???
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
  * WWirns    14.12.2017  Refresh_AUDIT_User:Added
  * WWirns    14.12.2017  Refresh_AUDIT_User:Add support of v('AI_CGI_ENV_*')
  * WWirns    23.07.2018  Refresh_AUDIT_User:Changes to support all g_User*-Variables
  * WWirns    10.08.2018  Refresh_AUDIT_User:Fallback to package OWA_UTIL.get_cgi_env(...) if v('AI_CGI_ENV_*') results to null
  *******************************************************************************/
  --
  procedure Refresh_AUDIT_User is
    --
    v_vc_Tmp                  varchar2(32767 char);
    v_ENV_HOST                varchar2(255 char);
    v_ENV_IP_ADDRESS          varchar2(255 char);
    v_ENV_ISDBA               varchar2(255 char);
    v_ENV_LANGUAGE            varchar2(255 char);
    v_ENV_MODULE              varchar2(255 char);
    v_ENV_OS_USER             varchar2(255 char);
    v_ENV_SESSION_USER        varchar2(255 char);
    v_ENV_TERMINAL            varchar2(255 char);
    v_CGI_ENV_HTTP_USER_AGENT varchar2(255 char);
    v_CGI_ENV_REMOTE_HOST     varchar2(255 char);
    v_CGI_ENV_REMOTE_ADDR     varchar2(255 char);
    --
    --
    --
    function L_GET_CGI_ENV(p_PARAM_NAME in varchar2) return varchar2 is
    begin
      --
      -- Following calls to OWA_UTIL.get_cgi_env(...) could raise sometimes: O R A-06502: PL/SQL: numerischer oder Wertefehler
      -- I could not reproduce the error and assume it depends on, that this procedure is called
      -- from a database-logon-trigger!?
      return OWA_UTIL.get_cgi_env(p_PARAM_NAME);
    exception
      when others then
        if (sqlcode != -06502)
        then
          raise;
        end if;
        return null;
    end L_GET_CGI_ENV;
    --
  begin
    --
    --
    select SYS_CONTEXT('USERENV'
                      ,'HOST'
                      ,255) as ENV_HOST
          ,SYS_CONTEXT('USERENV'
                      ,'IP_ADDRESS'
                      ,255) as ENV_IP_ADDRESS
          ,SYS_CONTEXT('USERENV'
                      ,'ISDBA'
                      ,255) as ENV_ISDBA
          ,SYS_CONTEXT('USERENV'
                      ,'LANGUAGE'
                      ,255) as ENV_LANGUAGE
          ,SYS_CONTEXT('USERENV'
                      ,'MODULE'
                      ,255) as ENV_MODULE
          ,SYS_CONTEXT('USERENV'
                      ,'OS_USER'
                      ,255) as ENV_OS_USER
          ,SYS_CONTEXT('USERENV'
                      ,'SESSION_USER'
                      ,255) as ENV_SESSION_USER
          ,SYS_CONTEXT('USERENV'
                      ,'TERMINAL'
                      ,255) as ENV_TERMINAL
      into v_ENV_HOST
          ,v_ENV_IP_ADDRESS
          ,v_ENV_ISDBA
          ,v_ENV_LANGUAGE
          ,v_ENV_MODULE
          ,v_ENV_OS_USER
          ,v_ENV_SESSION_USER
          ,v_ENV_TERMINAL
      from dual;
    --
    --
    v_CGI_ENV_HTTP_USER_AGENT := substr(v('AI_CGI_ENV_HTTP_USER_AGENT')
                                       ,1
                                       ,255);
    if (v_CGI_ENV_HTTP_USER_AGENT is null)
    then
      v_CGI_ENV_HTTP_USER_AGENT := L_GET_CGI_ENV('HTTP_USER_AGENT');
    end if;
    --
    v_CGI_ENV_REMOTE_HOST := substr(v('AI_CGI_ENV_REMOTE_HOST')
                                   ,1
                                   ,255);
    if (v_CGI_ENV_REMOTE_HOST is null)
    then
      v_CGI_ENV_REMOTE_HOST := L_GET_CGI_ENV('REMOTE_HOST');
    end if;
    --
    v_CGI_ENV_REMOTE_ADDR := substr(v('AI_CGI_ENV_REMOTE_ADDR')
                                   ,1
                                   ,255);
    if (v_CGI_ENV_REMOTE_ADDR is null)
    then
      v_CGI_ENV_REMOTE_ADDR := L_GET_CGI_ENV('REMOTE_ADDR');
    end if;
    --
    --
    g_User_Name  := substr(nvl(nvl(v('APP_USER')
                                  ,v_ENV_OS_USER)
                              ,v_ENV_SESSION_USER)
                          ,1
                          ,255);
    g_AUDIT_User := substr(g_User_Name || case
                             when (nvl(v_CGI_ENV_HTTP_USER_AGENT
                                      ,v_ENV_MODULE) is not null) then
                             -- Add a space before the next string,
                             -- so that any viewing application has a chance to word wrap the whole text!
                              ' @' || nvl(v_CGI_ENV_HTTP_USER_AGENT
                                         ,v_ENV_MODULE)
                             else
                              ''
                           end
                          ,1
                          ,255);
    --
    --
    if (nvl(lower(v_ENV_TERMINAL)
           ,'unknown') != 'unknown'
       --
       and nvl(lower(nvl(v_CGI_ENV_REMOTE_HOST
                         ,v_ENV_HOST))
               ,'unknown') != 'unknown')
    then
      v_vc_Tmp := case
                    when (instr(nvl(v_CGI_ENV_REMOTE_HOST
                                   ,v_ENV_HOST)
                               ,v_ENV_TERMINAL) > 0) then
                     nvl(v_CGI_ENV_REMOTE_HOST
                        ,v_ENV_HOST)
                    else
                     v_ENV_TERMINAL
                    -- Add a space before the next string,
                    -- so that any viewing application has a chance to word wrap the whole text!
                     || ' @' || nvl(v_CGI_ENV_REMOTE_HOST
                                   ,v_ENV_HOST)
                  end;
    else
      v_vc_Tmp := nvl(nvl(v_CGI_ENV_REMOTE_HOST
                         ,v_ENV_HOST)
                     ,v_ENV_TERMINAL);
    end if;
    g_User_Host := v_vc_Tmp;
    --
    if (g_AUDIT_User is null)
    then
      g_AUDIT_User := v_vc_Tmp;
    else
      g_AUDIT_User := substr(g_AUDIT_User || ' - ' || v_vc_Tmp
                            ,1
                            ,255);
    end if;
    --
    --
    g_User_IP := nvl(v_CGI_ENV_REMOTE_ADDR
                    ,v_ENV_IP_ADDRESS);
    v_vc_Tmp := case
                  when (g_User_IP is not null) then
                  -- Add a space before the next string,
                  -- so that any viewing application has a chance to word wrap the whole text!
                   ' (' || g_User_IP || ')'
                  else
                   ''
                end;
    --
    if (g_AUDIT_User is null)
    then
      g_AUDIT_User := v_vc_Tmp;
    else
      g_AUDIT_User := substr(g_AUDIT_User || v_vc_Tmp
                            ,1
                            ,255);
    end if;
    --
  end Refresh_AUDIT_User;
  --
  --
  -- *** Standard functions ***************************************************************************
  --
  --
  --
  --
  /**
  * ???
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
  * WWirns    13.01.2016  Init_PACKAGE:Added
  * WWirns    14.12.2017  Init_PACKAGE:Move parts into Refresh_AUDIT_User and call it from here
  *******************************************************************************/
  --
  procedure Init_PACKAGE is
    --
  begin
    --
    -- !!! Attention with call of other packages, because their init routines could be call back !!!
    -- !!! Try to avoid call of other packages here in this init block in order to prevent endless loops !!!
    --
    --
    -- Initial-Block
    if (not g_PACKAGE_Initializing)
    then
      --
      g_PACKAGE_Initializing := true;
      g_PACKAGE_Initialized  := false;
      --
      --
      /*
      g_PACKAGE_NAME := PKG_UTIL.Get_PLSQL_Unit4Caller();
      if (g_PACKAGE_NAME.VC02 != Get_OBJECT_NAME())
      then
        Raise_application_error(-20000
                               ,'Invalid PACKAGE_NAME.VC02[''' || g_PACKAGE_NAME.VC02 || '''] for OBJECT_NAME[''' || Get_OBJECT_NAME() || '''] detected!');
      end if;
      */
      --
      --
      Check_OBJECT_DEPENDENCE();
      --
      --
      Refresh_AUDIT_User();
      --
      --
      g_PACKAGE_Initialized  := true;
      g_PACKAGE_Initializing := false;
      --
    end if;
    --
    -- For example, below are calls into functions they itself calls me
    --
    --
    --
    --Create_CFGKEYS4JOBS$AT();
    --
    --
    --Update_JOBS$AT();
    --
  end Init_PACKAGE;
  --
  --
  --
  procedure Check_OBJECT_DEPENDENCE is
  begin
    -- WWirns: For example check ORACLE-Version
    -- or internal version via "Get_OBJECT_VERSION$VC()" of other package or object types
    -- or if column of table exists
    -- and so on...
    null;
    --
  end Check_OBJECT_DEPENDENCE;
  --
  --
  --
  function Get_PACKAGE_ID return simple_integer deterministic is
  begin
    return C_PACKAGE_ID;
  end;
  --
  function Get_OBJECT_NAME return varchar2 deterministic is
  begin
    return $$plsql_unit_owner || '.' || $$plsql_unit;
  end;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic is
  begin
    return C_OBJECT_COPYRIGHT;
  end;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic is
  begin
    return C_OBJECT_VERSION;
  end;
  --
--
--
begin
  --
  Init_PACKAGE();
  --
end PKG_SESSION;
/
  GRANT EXECUTE ON "DL_COMMON"."PKG_SESSION" TO PUBLIC;
  GRANT EXECUTE ON "DL_COMMON"."PKG_SESSION" TO "DERMALOG_PROXY";
