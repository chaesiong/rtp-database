CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_USER_MANAGEMENT"."PKG_AUTHORIZATION" is
  /**
  * ========================================================================
  * <b> Functions / Procedures for authorization in apex application </b>
  *
  * @file    $HeadURL: $
  * @version $Revision: 1.8 $
  * @author  $Author: M. Thierhoff $
  * @date    $Date: 19/05/2017 $
  * @version $Id: $
  * ========================================================================
  * @headcom
  */

  g_scope_prefix constant varchar2(62 char) := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.';

  -- Error codes
  --gc_err_wrong_usg constant number := -20300;

  -- Error messages
  --gc_err_msg_wrong_usg_le constant varchar2(100 char) := 'Wrong Usage. This function is for List Entries only!';

  --
  --
  /**
  * Authorization check function. Returns info, if a given user has a given grant on a given object
  *
  * PARAMETERS
  *   @param  i_user_id_or_dn ID or DN of user
  *   @param  i_object_id     ID of the object requested
  *   @param  i_grant_id      ID of the grant requested
  *   @return true, if user has permission; else false
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
  * WWirns    02.08.2018  HAS_USER_PERMISSION: Changes because of "role in role" feature
  *                                            and add an overload
  *******************************************************************************/
  --
  function HAS_USER_PERMISSION(i_user_id_or_dn in varchar2
                              ,i_object_id     in varchar2
                              ,i_grant_id      in varchar2
                               --
                               ) return boolean is
    --
    -- l_scope      logger_logs.scope%type := g_scope_prefix || 'HAS_USER_PERMISSION';
    -- l_params     logger.tab_param;
    l_cnt_rights number := 0;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_user_id_or_dn'
    --                    ,i_user_id_or_dn);
    -- logger.append_param(l_params
    --                    ,'i_object_id'
    --                    ,i_object_id);
    -- logger.append_param(l_params
    --                    ,'i_grant_id'
    --                    ,i_grant_id);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --
    -- Check if user has the requested permission
    for R0 in (
               --
               select distinct t0.ROLE_ID_OR_DN
                 from (
                        --
                        select coalesce(t0.ROLE_ID
                                        ,t0.ROLE_DN) as ROLE_ID_OR_DN
                          from ROLE_OBJECT_GRANT_REL t0
                         inner join OBJECT_GRANT_REL t1
                            on t0.OBJECT_GRANT_REL_ID = t1.ID
                         where t1.OBJECT_ID = i_object_id
                           and t1.GRANT_ID = i_grant_id
                        --
                        ) t2
                      ,ROLE_ROLE_ROLES_POOL t0
                 left join ROLE_ROLE_REL_POOL t1
                   on t0.ROLE_ID_OR_DN = t1.ROLE_ID_OR_DN
                start with t0.ROLE_ID_OR_DN = t2.ROLE_ID_OR_DN
               connect by nocycle t0.ROLE_ID_OR_DN = prior t1.MEMBER_ROLE_ID_OR_DN
                      and nvl(t1.MEMBER_ROLE_ID_OR_DN
                             ,'$NV$') != t2.ROLE_ID_OR_DN
               --
               )
    loop
      --
      select count(*)
        into l_cnt_rights
        from USER_ROLE_REL_POOL t
       where t.USER_ID_OR_DN = i_user_id_or_dn
         and t.ROLE_ID_OR_DN = R0.ROLE_ID_OR_DN;
      --
      exit when l_cnt_rights > 0;
      --
    end loop;
    --
    -- logger.log('END'
    --           ,l_scope);
    --
    if l_cnt_rights > 0
    then
      return true;
    else
      return false;
    end if;
    --
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end HAS_USER_PERMISSION;
  --
  function HAS_USER_PERMISSION(i_user_id_or_dn in varchar2
                              ,i_object_id     in varchar2
                               --
                               ) return boolean is
    --
    -- l_scope      logger_logs.scope%type := g_scope_prefix || 'HAS_USER_PERMISSION';
    -- l_params     logger.tab_param;
    l_cnt_rights number := 0;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_user_id_or_dn'
    --                    ,i_user_id_or_dn);
    -- logger.append_param(l_params
    --                    ,'i_object_id'
    --                    ,i_object_id);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --
    -- Check if user has the requested permission
    for R0 in (
               --
               select distinct t0.ROLE_ID_OR_DN
                 from (
                        --
                        select coalesce(t0.ROLE_ID
                                        ,t0.ROLE_DN) as ROLE_ID_OR_DN
                          from ROLE_OBJECT_GRANT_REL t0
                         inner join OBJECT_GRANT_REL t1
                            on t0.OBJECT_GRANT_REL_ID = t1.ID
                         where t1.OBJECT_ID = i_object_id
                        --
                        ) t2
                      ,ROLE_ROLE_ROLES_POOL t0
                 left join ROLE_ROLE_REL_POOL t1
                   on t0.ROLE_ID_OR_DN = t1.ROLE_ID_OR_DN
                start with t0.ROLE_ID_OR_DN = t2.ROLE_ID_OR_DN
               connect by nocycle t0.ROLE_ID_OR_DN = prior t1.MEMBER_ROLE_ID_OR_DN
                      and nvl(t1.MEMBER_ROLE_ID_OR_DN
                             ,'$NV$') != t2.ROLE_ID_OR_DN
               --
               )
    loop
      --
      select count(*)
        into l_cnt_rights
        from USER_ROLE_REL_POOL t
       where t.USER_ID_OR_DN = i_user_id_or_dn
         and t.ROLE_ID_OR_DN = R0.ROLE_ID_OR_DN;
      --
      exit when l_cnt_rights > 0;
      --
    end loop;
    --
    -- logger.log('END'
    --           ,l_scope);
    --
    if l_cnt_rights > 0
    then
      return true;
    else
      return false;
    end if;
    --
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end HAS_USER_PERMISSION;
  --
  function HAS_USER_PERMISSION_(i_username in varchar2
                              ,i_object_id     in varchar2
                               --
                               ) return number is
    --
    -- l_scope      logger_logs.scope%type := g_scope_prefix || 'HAS_USER_PERMISSION';
    -- l_params     logger.tab_param;
    l_cnt_rights number := 0;
    l_user_id_or_dn USERS.ID%type;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_user_id_or_dn'
    --                    ,i_user_id_or_dn);
    -- logger.append_param(l_params
    --                    ,'i_object_id'
    --                    ,i_object_id);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --
    --Find User ID
    select id
    into l_user_id_or_dn
    from USERS
    where USERNAME = i_username;
    -- Check if user has the requested permission
    for R0 in (
               --
               select distinct t0.ROLE_ID_OR_DN
                 from (
                        --
                        select coalesce(t0.ROLE_ID
                                        ,t0.ROLE_DN) as ROLE_ID_OR_DN
                          from ROLE_OBJECT_GRANT_REL t0
                         inner join OBJECT_GRANT_REL t1
                            on t0.OBJECT_GRANT_REL_ID = t1.ID
                         where t1.OBJECT_ID = i_object_id
                        --
                        ) t2
                      ,ROLE_ROLE_ROLES_POOL t0
                 left join ROLE_ROLE_REL_POOL t1
                   on t0.ROLE_ID_OR_DN = t1.ROLE_ID_OR_DN
                start with t0.ROLE_ID_OR_DN = t2.ROLE_ID_OR_DN
               connect by nocycle t0.ROLE_ID_OR_DN = prior t1.MEMBER_ROLE_ID_OR_DN
                      and nvl(t1.MEMBER_ROLE_ID_OR_DN
                             ,'$NV$') != t2.ROLE_ID_OR_DN
               --
               )
    loop
      --
      select count(*)
        into l_cnt_rights
        from USER_ROLE_REL_POOL t
       where t.USER_ID_OR_DN = l_user_id_or_dn
         and t.ROLE_ID_OR_DN = R0.ROLE_ID_OR_DN;
      --
      exit when l_cnt_rights > 0;
      --
    end loop;
    --
    -- logger.log('END'
    --           ,l_scope);
    --
      return l_cnt_rights;
    --
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end;

  /**
  * Authorization check function for apex applications. Returns info, if the apex user has a given grant on a given object
  * @param  i_object_id     ID of the object requested
  * @param  i_grant_id      ID of the grant requested
  * @return true, if user has permission; else false
  */
  function APEX_HAS_USER_PERMISSION(i_object_id in varchar2
                                   ,i_grant_id  in varchar2
                                    --
                                    ) return boolean is
    -- l_scope         logger_logs.scope%type := g_scope_prefix || 'APEX_HAS_USER_PERMISSION';
    -- l_params        logger.tab_param;
    l_username      varchar2(256) := v('APP_USER');
    l_user_id_or_dn user_pool.id_or_dn%type;
    l_return        boolean;
  begin
    -- logger.append_param(l_params
    --                    ,'i_object_id'
    --                    ,i_object_id);
    -- logger.append_param(l_params
    --                    ,'i_grant_id'
    --                    ,i_grant_id);
    -- --
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    if v('AUTHORIZATION_ACTIVE') = 'N'
    then
      return true;
    end if;

    select id_or_dn
      into l_user_id_or_dn
      from user_pool
     where username = l_username;

    l_return := HAS_USER_PERMISSION(i_user_id_or_dn => l_user_id_or_dn
                                   ,i_object_id     => i_object_id
                                   ,i_grant_id      => i_grant_id);

    --
    -- logger.log('END'
    --           ,l_scope);
    --

    return l_return;

  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      return false;
  end APEX_HAS_USER_PERMISSION;

  /**
  * Authorization check function for apex applications. Returns info, if the apex user has a given grant on the current page
  * @param  i_grant_id      ID of the grant requested
  * @param  i_app_name      APEX application alias
  * @param  i_page_id     Apex page ID
  * @return true, if user has permission; else false
  */
  function APEX_HAS_USER_GRANT_ON_PAGE(i_grant_id in varchar2
                                      ,i_app_name in varchar2
                                      ,i_page_id  in number
                                       --
                                       ) return boolean is
    -- l_scope     logger_logs.scope%type := g_scope_prefix || 'APEX_HAS_USER_GRANT_ON_PAGE';
    -- l_params    logger.tab_param;
    l_object_id object_page_rel.object_id%type;
  begin
    -- logger.append_param(l_params
    --                    ,'i_grant_id'
    --                    ,i_grant_id);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --

    if v('AUTHORIZATION_ACTIVE') = 'N'
    then
      return true;
    end if;

    /* Loop through all objects, the page is assigned to and check if the user has the given grant on the page */
    for obj_cur in (select object_id
                      into l_object_id
                      from object_page_rel
                     where app_name = i_app_name
                       and page_id = i_page_id)
    loop
      if APEX_HAS_USER_PERMISSION(i_object_id => obj_cur.object_id
                                 ,i_grant_id  => i_grant_id)
      then
        -- logger.log('END'
        --           ,l_scope);
        return true;
      end if;
    end loop;

    --
    -- logger.log('END'
    --           ,l_scope);
    --
    return false;

  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      return false;
  end APEX_HAS_USER_GRANT_ON_PAGE;

  /**
  * Authorization check function for apex applications. Returns info, if the apex user has a given grant on the current page
  * @param  i_grant_id      ID of the grant requested
  * @return true, if user has permission; else false
  */
  function APEX_HAS_USER_GRANT_ON_PAGE(i_grant_id in varchar2
                                       --
                                       ) return boolean is
    -- l_scope    logger_logs.scope%type := g_scope_prefix || 'APEX_HAS_USER_GRANT_ON_PAGE';
    -- l_params   logger.tab_param;
    l_app_name varchar2(100 char) := v('APP_ALIAS');
    l_page_id  number := v('APP_PAGE_ID');
    l_return   boolean;
  begin
    -- logger.append_param(l_params
    --                    ,'i_grant_id'
    --                    ,i_grant_id);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --

    l_return := APEX_HAS_USER_GRANT_ON_PAGE(i_grant_id => i_grant_id
                                           ,i_app_name => l_app_name
                                           ,i_page_id  => l_page_id);

    --
    -- logger.log('END'
    --           ,l_scope);
    --
    return l_return;

  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      return false;
  end APEX_HAS_USER_GRANT_ON_PAGE;
  --
  --
  /**
  * Authorization check function for apex applications. Returns info, if the apex user has ANY grant on the current page (If he has any grant, then he sould be allowed to access the page)
  *
  * PARAMETERS
  *   @param  i_app_name      APEX application alias
  *   @param  i_page_id     Apex page ID
  *   @return true, if user has any permission; else false
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
  * WWirns    02.08.2018  APEX_IS_PAGE_ALLOWED: Changes because of "role in role" feature
  *******************************************************************************/
  --
  function APEX_IS_PAGE_ALLOWED(i_app_name in varchar2
                               ,i_page_id  in number
                                --
                                ) return boolean is
    -- l_scope         logger_logs.scope%type := g_scope_prefix || 'APEX_IS_PAGE_ALLOWED';
    -- l_params        logger.tab_param;
    l_username      varchar2(256) := v('APP_USER');
    l_user_id_or_dn user_pool.id_or_dn%type;
    l_cnt_rights    number := 0;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --
    if v('AUTHORIZATION_ACTIVE') = 'N'
    then
      return true;
    end if;

    select id_or_dn
      into l_user_id_or_dn
      from user_pool
     where username = upper(l_username);

    -- Loop through all objects, the page is assigned to and check if the user has the given grant on the page
    for obj_cur in (select object_id
                      from object_page_rel
                     where app_name = i_app_name
                       and page_id = i_page_id)
    loop
      --
      -- Check if user has the requested permission
      l_cnt_rights := sys.diutil.bool_to_int(HAS_USER_PERMISSION(l_user_id_or_dn
                                                                ,obj_cur.object_id
                                                                 --
                                                                 ));
      --
      exit when l_cnt_rights > 0;
      --
    end loop;
    --
    -- logger.log('END'
    --           ,l_scope);
    --
    if l_cnt_rights > 0
    then
      return true;
    else
      return false;
    end if;
    --
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      return false;
  end APEX_IS_PAGE_ALLOWED;

  /**
  * Authorization check function for apex applications. Returns info, if the apex user has ANY grant on the current page (If he has any grant, then he sould be allowed to access the page)
  * @return true, if user has any permission; else false
  */
  function APEX_IS_PAGE_ALLOWED return boolean is
    -- l_scope    logger_logs.scope%type := g_scope_prefix || 'APEX_IS_PAGE_ALLOWED';
    -- l_params   logger.tab_param;
    l_app_name varchar2(100 char) := v('APP_ALIAS');
    l_page_id  number := v('APP_PAGE_ID');
    l_return   boolean;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --

    l_return := APEX_IS_PAGE_ALLOWED(i_app_name => l_app_name
                                    ,i_page_id  => l_page_id);

    --
    -- logger.log('END'
    --           ,l_scope);
    --

    return l_return;

  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      return false;
  end APEX_IS_PAGE_ALLOWED;
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
  * WWirns    02.08.2018  APEX_MENU_AUTORIZATION: Changes because of "role in role" feature
  *******************************************************************************/
  --
  function APEX_MENU_AUTORIZATION(i_app_name in varchar2
                                 ,i_page_id  in number
                                  --
                                  ) return number is
    -- l_scope         logger_logs.scope%type := g_scope_prefix || 'APEX_MENU_AUTORIZATION';
    -- l_params        logger.tab_param;
    l_username      varchar2(256) := v('APP_USER');
    l_user_id_or_dn user_pool.id_or_dn%type;
    l_cnt_rights    number := 0;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --
    if v('AUTHORIZATION_ACTIVE') = 'N'
    then
      return 1;
    end if;
    --
    select id_or_dn
      into l_user_id_or_dn
      from user_pool
     where username = upper(l_username);
    --
    -- Loop through all objects, the page is assigned to and check if the user has the given grant on the page
    for obj_cur in (select object_id
                      from object_page_rel
                     where app_name = i_app_name
                       and page_id = i_page_id)
    loop
      --
      -- Check if user has the requested permission
      l_cnt_rights := sys.diutil.bool_to_int(HAS_USER_PERMISSION(l_user_id_or_dn
                                                                ,obj_cur.object_id
                                                                 --
                                                                 ));
      --
      exit when l_cnt_rights > 0;
      --
    end loop;
    --
    -- logger.log('END'
    --           ,l_scope);
    --
    return l_cnt_rights;
    --
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      return 0;
  end APEX_MENU_AUTORIZATION;

  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MStahl    18.10.2018  added; due to performance issues, couldnt use APEX_MENU_AUTORIZATION
  *******************************************************************************/
  --
  function apex_menu_sql(i_username in varchar2) return varchar2
  as
      l_menu_id varchar2(8000) := '';
      l_sql varchar(32000) := '';
    begin

      select listagg( menu_id, ',') within group (order by menu_id)
        into l_menu_id
        from (select distinct menu_id
                from dl_user_management.apex_menu_permissions
               where menu_user = i_username);

      l_sql := q'[select level As lvl,
          NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) As DISPLAY_VALUE,
          target,
          DL_COMMON.PKG_APEX_UTIL.IS_CURRENT_PAGE(i_pageid => PAGE_ID, i_app_alias => APP_ALIAS, i_current_pageid => :APP_PAGE_ID, i_current_applicationid =>  TO_NUMBER (v('APP_ID')) ) as is_current_list_entry,
          image as imagevalue
    from dl_common.apex_menu$lc
    where key_value in (]' || l_menu_id || q'[)
    start with parent_key_value is null
    connect by prior key_value = parent_key_value
    order siblings by DISPLAY_VALUE$DLC;]';
    return(l_sql);
  end apex_menu_sql;
  --
  --
  /**
  * Checks whether a given entity is member of an other entity
  *
  * PARAMETERS
  *   @param  i_member_user_id_or_dn   ID or DN of a user
  *   @param  i_role_id_or_dn          ID or DN of a role
  *   @return boolean                  Returns TRUE/FALSE
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
  * WWirns    31.08.2018  Is_User_Member_Of_Role: Added
  *******************************************************************************/
  --
  function Is_User_Member_Of_Role(i_member_user_id_or_dn in varchar2
                                 ,i_role_id_or_dn        in varchar2
                                 ,i_Query_Hierarchically in boolean default true
                                 ,i_Prevent_EXCE         in boolean default false
                                  --
                                  ) return boolean is
    --
    v_Result boolean;
    v_pi_Tmp pls_integer;
    --
  begin
    --
    if (i_member_user_id_or_dn is null or i_role_id_or_dn is null)
    then
      Raise_application_error(-20000
                             ,'Any argument is NULL! i_member_user_id_or_dn[''' || i_member_user_id_or_dn || '''], i_role_id_or_dn[''' || i_role_id_or_dn || ''']');
    end if;
    --
    if (nvl(i_Query_Hierarchically
           ,true))
    then
      --
      select count(1)
        into v_pi_Tmp
        from (
              --
              select distinct t1.ROLE_ID_OR_DN
                from (
                       --
                       select t00.ROLE_ID_OR_DN
                         from USER_ROLE_REL_POOL t00
                        where t00.USER_ID_OR_DN = i_member_user_id_or_dn
                       --
                       ) t0
                     ,ROLE_ROLE_ROLES_POOL t1
                left join ROLE_ROLE_REL_POOL t2
                  on t1.ROLE_ID_OR_DN = t2.ROLE_ID_OR_DN
               start with t1.ROLE_ID_OR_DN = t0.ROLE_ID_OR_DN
              connect by nocycle prior t1.ROLE_ID_OR_DN = t2.MEMBER_ROLE_ID_OR_DN
                     and nvl(t2.MEMBER_ROLE_ID_OR_DN
                            ,'$NV$') != t0.ROLE_ID_OR_DN
              --
              ) t
       where t.ROLE_ID_OR_DN = i_role_id_or_dn;
      --
    else
      --
      select count(1)
        into v_pi_Tmp
        from USER_ROLE_REL_POOL t
       where t.USER_ID_OR_DN = i_member_user_id_or_dn
         and t.ROLE_ID_OR_DN = i_role_id_or_dn;
      --
    end if;
    --
    v_Result := case
                  when (v_pi_Tmp > 0) then
                   true
                  else
                   false
                end;
    --
    return v_Result;
    --
  exception
    when others then
      if (not nvl(i_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
      return null;
      --
  end Is_User_Member_Of_Role;
  --
  function Is_User_Member_Of_Role_(i_member_user_id_or_dn in varchar2
                                  ,i_role_id_or_dn        in varchar2
                                  ,i_Query_Hierarchically in pls_integer default 1
                                  ,i_Prevent_EXCE         in pls_integer default 0
                                   --
                                   ) return pls_integer is
  begin
    return sys.diutil.bool_to_int(Is_User_Member_Of_Role(i_member_user_id_or_dn
                                                        ,i_role_id_or_dn
                                                        ,sys.diutil.int_to_bool(i_Query_Hierarchically)
                                                        ,sys.diutil.int_to_bool(i_Prevent_EXCE)
                                                         --
                                                         )
                                  --
                                  );
  end Is_User_Member_Of_Role_;
  --
  --
  /**
  * Checks whether a given entity is member of an other entity
  *
  * PARAMETERS
  *   @param  i_member_user_id_or_dn   ID or DN of a user
  *   @param  i_org_unit_id_or_dn      ID or DN of an organisation unit
  *   @return boolean                  Returns TRUE/FALSE
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
  * WWirns    31.08.2018  Is_User_Member_Of_Org_Unit: Added
  *******************************************************************************/
  --
  function Is_User_Member_Of_Org_Unit(i_member_user_id_or_dn in varchar2
                                     ,i_org_unit_id_or_dn    in varchar2
                                     ,i_Query_Hierarchically in boolean default false
                                     ,i_Prevent_EXCE         in boolean default false
                                      --
                                      ) return boolean is
    --
    v_Result boolean;
    v_pi_Tmp pls_integer;
    --
  begin
    --
    if (i_member_user_id_or_dn is null or i_org_unit_id_or_dn is null)
    then
      Raise_application_error(-20000
                             ,'Any argument is NULL! i_member_user_id_or_dn[''' || i_member_user_id_or_dn || '''], i_org_unit_id_or_dn[''' || i_org_unit_id_or_dn || ''']');
    end if;
    --
    if (nvl(i_Query_Hierarchically
           ,false))
    then
      --
      select count(1)
        into v_pi_Tmp
        from (
              --
              select distinct t1.ORG_UNIT_ID_OR_DN
                from (
                       --
                       select t00.ORG_UNIT_ID_OR_DN
                         from USER_ORG_UNIT_REL_POOL t00
                        where t00.USER_ID_OR_DN = i_member_user_id_or_dn
                       --
                       ) t0
                     ,ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL t1
                left join ORG_UNIT_ORG_UNIT_REL_POOL t2
                  on t1.ORG_UNIT_ID_OR_DN = t2.ORG_UNIT_ID_OR_DN
               start with t1.ORG_UNIT_ID_OR_DN = t0.ORG_UNIT_ID_OR_DN
              connect by nocycle prior t1.ORG_UNIT_ID_OR_DN = t2.MEMBER_ORG_UNIT_ID_OR_DN
              -- ??? : and nvl(t2.MEMBER_ORG_UNIT_ID_OR_DN ,'$NV$') != t0.ORG_UNIT_ID_OR_DN
              --
              ) t
       where t.ORG_UNIT_ID_OR_DN = i_org_unit_id_or_dn;
      --
    else
      --
      select count(1)
        into v_pi_Tmp
        from USER_ORG_UNIT_REL_POOL t
       where t.USER_ID_OR_DN = i_member_user_id_or_dn
         and t.ORG_UNIT_ID_OR_DN = i_org_unit_id_or_dn;
      --
    end if;
    --
    v_Result := case
                  when (v_pi_Tmp > 0) then
                   true
                  else
                   false
                end;
    --
    return v_Result;
    --
  exception
    when others then
      if (not nvl(i_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
      return null;
      --
  end Is_User_Member_Of_Org_Unit;
  --
  function Is_User_Member_Of_Org_Unit_(i_member_user_id_or_dn in varchar2
                                      ,i_org_unit_id_or_dn    in varchar2
                                      ,i_Query_Hierarchically in pls_integer default 0
                                      ,i_Prevent_EXCE         in pls_integer default 0
                                       --
                                       ) return pls_integer is
  begin
    return sys.diutil.bool_to_int(Is_User_Member_Of_Org_Unit(i_member_user_id_or_dn
                                                            ,i_org_unit_id_or_dn
                                                            ,sys.diutil.int_to_bool(i_Query_Hierarchically)
                                                            ,sys.diutil.int_to_bool(i_Prevent_EXCE)
                                                             --
                                                             )
                                  --
                                  );
  end Is_User_Member_Of_Org_Unit_;
  --
  --
  /**
  * Checks whether a given entity is member of an other entity
  *
  * PARAMETERS
  *   @param  i_member_computer_id_or_dn   ID or DN of a computer
  *   @param  i_role_id_or_dn              ID or DN of a role
  *   @return boolean                      Returns TRUE/FALSE
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
  * WWirns    31.08.2018  Is_Computer_Member_Of_Role: Added
  *******************************************************************************/
  --
  function Is_Computer_Member_Of_Role(i_member_computer_id_or_dn in varchar2
                                     ,i_role_id_or_dn            in varchar2
                                     ,i_Query_Hierarchically     in boolean default true
                                     ,i_Prevent_EXCE             in boolean default false
                                      --
                                      ) return boolean is
    --
    v_Result boolean;
    v_pi_Tmp pls_integer;
    --
  begin
    --
    if (i_member_computer_id_or_dn is null or i_role_id_or_dn is null)
    then
      Raise_application_error(-20000
                             ,'Any argument is NULL! i_member_computer_id_or_dn[''' || i_member_computer_id_or_dn || '''], i_role_id_or_dn[''' || i_role_id_or_dn || ''']');
    end if;
    --
    if (nvl(i_Query_Hierarchically
           ,true))
    then
      --
      select count(1)
        into v_pi_Tmp
        from (
              --
              select distinct t1.ROLE_ID_OR_DN
                from (
                       --
                       select t00.ROLE_ID_OR_DN
                         from COMPUTER_ROLE_REL_POOL t00
                        where t00.COMPUTER_ID_OR_DN = i_member_computer_id_or_dn
                       --
                       ) t0
                     ,ROLE_ROLE_ROLES_POOL t1
                left join ROLE_ROLE_REL_POOL t2
                  on t1.ROLE_ID_OR_DN = t2.ROLE_ID_OR_DN
               start with t1.ROLE_ID_OR_DN = t0.ROLE_ID_OR_DN
              connect by nocycle prior t1.ROLE_ID_OR_DN = t2.MEMBER_ROLE_ID_OR_DN
                     and nvl(t2.MEMBER_ROLE_ID_OR_DN
                            ,'$NV$') != t0.ROLE_ID_OR_DN
              --
              ) t
       where t.ROLE_ID_OR_DN = i_role_id_or_dn;
      --
    else
      --
      select count(1)
        into v_pi_Tmp
        from COMPUTER_ROLE_REL_POOL t
       where t.COMPUTER_ID_OR_DN = i_member_computer_id_or_dn
         and t.ROLE_ID_OR_DN = i_role_id_or_dn;
      --
    end if;
    --
    v_Result := case
                  when (v_pi_Tmp > 0) then
                   true
                  else
                   false
                end;
    --
    return v_Result;
    --
  exception
    when others then
      if (not nvl(i_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
      return null;
      --
  end Is_Computer_Member_Of_Role;
  --
  function Is_Computer_Member_Of_Role_(i_member_computer_id_or_dn in varchar2
                                      ,i_role_id_or_dn            in varchar2
                                      ,i_Query_Hierarchically     in pls_integer default 1
                                      ,i_Prevent_EXCE             in pls_integer default 0
                                       --
                                       ) return pls_integer is
  begin
    return sys.diutil.bool_to_int(Is_Computer_Member_Of_Role(i_member_computer_id_or_dn
                                                            ,i_role_id_or_dn
                                                            ,sys.diutil.int_to_bool(i_Query_Hierarchically)
                                                            ,sys.diutil.int_to_bool(i_Prevent_EXCE)
                                                             --
                                                             )
                                  --
                                  );
  end Is_Computer_Member_Of_Role_;
  --
  --
  /**
  * Checks whether a given entity is member of an other entity
  *
  * PARAMETERS
  *   @param  i_member_computer_id_or_dn   ID or DN of a computer
  *   @param  i_org_unit_id_or_dn          ID or DN of an organisation unit
  *   @return boolean                      Returns TRUE/FALSE
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
  * WWirns    31.08.2018  Is_Computer_Member_Of_Org_Unit: Added
  *******************************************************************************/
  --
  function Is_Computer_Member_Of_Org_Unit(i_member_computer_id_or_dn in varchar2
                                         ,i_org_unit_id_or_dn        in varchar2
                                         ,i_Query_Hierarchically     in boolean default false
                                         ,i_Prevent_EXCE             in boolean default false
                                          --
                                          ) return boolean is
    --
    v_Result boolean;
    v_pi_Tmp pls_integer;
    --
  begin
    --
    if (i_member_computer_id_or_dn is null or i_org_unit_id_or_dn is null)
    then
      Raise_application_error(-20000
                             ,'Any argument is NULL! i_member_computer_id_or_dn[''' || i_member_computer_id_or_dn || '''], i_org_unit_id_or_dn[''' || i_org_unit_id_or_dn || ''']');
    end if;
    --
    if (nvl(i_Query_Hierarchically
           ,false))
    then
      --
      select count(1)
        into v_pi_Tmp
        from (
              --
              select distinct t1.ORG_UNIT_ID_OR_DN
                from (
                       --
                       select t00.ORG_UNIT_ID_OR_DN
                         from COMPUTER_ORG_UNIT_REL_POOL t00
                        where t00.COMPUTER_ID_OR_DN = i_member_computer_id_or_dn
                       --
                       ) t0
                     ,ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL t1
                left join ORG_UNIT_ORG_UNIT_REL_POOL t2
                  on t1.ORG_UNIT_ID_OR_DN = t2.ORG_UNIT_ID_OR_DN
               start with t1.ORG_UNIT_ID_OR_DN = t0.ORG_UNIT_ID_OR_DN
              connect by nocycle prior t1.ORG_UNIT_ID_OR_DN = t2.MEMBER_ORG_UNIT_ID_OR_DN
              -- ??? : and nvl(t2.MEMBER_ORG_UNIT_ID_OR_DN ,'$NV$') != t0.ORG_UNIT_ID_OR_DN
              --
              ) t
       where t.ORG_UNIT_ID_OR_DN = i_org_unit_id_or_dn;
      --
    else
      --
      select count(1)
        into v_pi_Tmp
        from COMPUTER_ORG_UNIT_REL_POOL t
       where t.COMPUTER_ID_OR_DN = i_member_computer_id_or_dn
         and t.ORG_UNIT_ID_OR_DN = i_org_unit_id_or_dn;
      --
    end if;
    --
    v_Result := case
                  when (v_pi_Tmp > 0) then
                   true
                  else
                   false
                end;
    --
    return v_Result;
    --
  exception
    when others then
      if (not nvl(i_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
      return null;
      --
  end Is_Computer_Member_Of_Org_Unit;
  --
  function Is_Computer_Member_Of_Org_Unit_(i_member_computer_id_or_dn in varchar2
                                          ,i_org_unit_id_or_dn        in varchar2
                                          ,i_Query_Hierarchically     in pls_integer default 0
                                          ,i_Prevent_EXCE             in pls_integer default 0
                                           --
                                           ) return pls_integer is
  begin
    return sys.diutil.bool_to_int(Is_Computer_Member_Of_Org_Unit(i_member_computer_id_or_dn
                                                                ,i_org_unit_id_or_dn
                                                                ,sys.diutil.int_to_bool(i_Query_Hierarchically)
                                                                ,sys.diutil.int_to_bool(i_Prevent_EXCE)
                                                                 --
                                                                 )
                                  --
                                  );
  end Is_Computer_Member_Of_Org_Unit_;
  --
  --
  /**
  * Checks whether a given entity is member of an other entity
  *
  * PARAMETERS
  *   @param  i_member_role_id_or_dn   ID or DN of a role
  *   @param  i_role_id_or_dn          ID or DN of a role
  *   @return boolean                  Returns TRUE/FALSE
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
  * WWirns    31.08.2018  Is_Role_Member_Of_Role: Added
  *******************************************************************************/
  --
  function Is_Role_Member_Of_Role(i_member_role_id_or_dn in varchar2
                                 ,i_role_id_or_dn        in varchar2
                                 ,i_Query_Hierarchically in boolean default true
                                 ,i_Prevent_EXCE         in boolean default false
                                  --
                                  ) return boolean is
    --
    v_Result boolean;
    v_pi_Tmp pls_integer;
    --
  begin
    --
    if (i_member_role_id_or_dn is null or i_role_id_or_dn is null)
    then
      Raise_application_error(-20000
                             ,'Any argument is NULL! i_member_role_id_or_dn[''' || i_member_role_id_or_dn || '''], i_role_id_or_dn[''' || i_role_id_or_dn || ''']');
    end if;
    --
    if (nvl(i_Query_Hierarchically
           ,true))
    then
      --
      select count(1)
        into v_pi_Tmp
        from (
              --
              select distinct t1.ROLE_ID_OR_DN
                from ROLE_ROLE_ROLES_POOL t1
                left join ROLE_ROLE_REL_POOL t2
                  on t1.ROLE_ID_OR_DN = t2.ROLE_ID_OR_DN
               start with t1.ROLE_ID_OR_DN = i_member_role_id_or_dn
              connect by nocycle prior t1.ROLE_ID_OR_DN = t2.MEMBER_ROLE_ID_OR_DN
              -- ??? : and nvl(t2.MEMBER_ROLE_ID_OR_DN ,'$NV$') != i_member_role_id_or_dn
              -- ??? : and t2.ROLE_ID_OR_DN != i_member_role_id_or_dn
              --
              ) t
       where t.ROLE_ID_OR_DN != i_member_role_id_or_dn
         and t.ROLE_ID_OR_DN = i_role_id_or_dn;
      --
    else
      --
      select count(1)
        into v_pi_Tmp
        from ROLE_ROLE_REL_POOL t
       where t.MEMBER_ROLE_ID_OR_DN = i_member_role_id_or_dn
         and t.ROLE_ID_OR_DN = i_role_id_or_dn;
      --
    end if;
    --
    v_Result := case
                  when (v_pi_Tmp > 0) then
                   true
                  else
                   false
                end;
    --
    return v_Result;
    --
  exception
    when others then
      if (not nvl(i_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
      return null;
      --
  end Is_Role_Member_Of_Role;
  --
  function Is_Role_Member_Of_Role_(i_member_role_id_or_dn in varchar2
                                  ,i_role_id_or_dn        in varchar2
                                  ,i_Query_Hierarchically in pls_integer default 1
                                  ,i_Prevent_EXCE         in pls_integer default 0
                                   --
                                   ) return pls_integer is
  begin
    return sys.diutil.bool_to_int(Is_Role_Member_Of_Role(i_member_role_id_or_dn
                                                        ,i_role_id_or_dn
                                                        ,sys.diutil.int_to_bool(i_Query_Hierarchically)
                                                        ,sys.diutil.int_to_bool(i_Prevent_EXCE)
                                                         --
                                                         )
                                  --
                                  );
  end Is_Role_Member_Of_Role_;
  --
  --
  /**
  * Checks whether a given entity is member of an other entity
  *
  * PARAMETERS
  *   @param  i_member_Org_Unit_id_or_dn   ID or DN of an organisation unit
  *   @param  i_Org_Unit_id_or_dn          ID or DN of an organisation unit
  *   @return boolean                      Returns TRUE/FALSE
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
  * WWirns    31.08.2018  Is_Org_Unit_Member_Of_Org_Unit: Added
  *******************************************************************************/
  --
  function Is_Org_Unit_Member_Of_Org_Unit(i_member_org_unit_id_or_dn in varchar2
                                         ,i_Org_Unit_id_or_dn        in varchar2
                                         ,i_Query_Hierarchically     in boolean default false
                                         ,i_Prevent_EXCE             in boolean default false
                                          --
                                          ) return boolean is
    --
    v_Result boolean;
    v_pi_Tmp pls_integer;
    --
  begin
    --
    if (i_member_org_unit_id_or_dn is null or i_org_unit_id_or_dn is null)
    then
      Raise_application_error(-20000
                             ,'Any argument is NULL! i_member_org_unit_id_or_dn[''' || i_member_org_unit_id_or_dn || '''], i_org_unit_id_or_dn[''' || i_org_unit_id_or_dn || ''']');
    end if;
    --
    if (nvl(i_Query_Hierarchically
           ,false))
    then
      --
      select count(1)
        into v_pi_Tmp
        from (
              --
              select distinct t1.ORG_UNIT_ID_OR_DN
                from ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL t1
                left join ORG_UNIT_ORG_UNIT_REL_POOL t2
                  on t1.ORG_UNIT_ID_OR_DN = t2.ORG_UNIT_ID_OR_DN
               start with t1.ORG_UNIT_ID_OR_DN = i_member_org_unit_id_or_dn
              connect by nocycle prior t1.ORG_UNIT_ID_OR_DN = t2.MEMBER_ORG_UNIT_ID_OR_DN
              -- ??? : and nvl(t2.MEMBER_ORG_UNIT_ID_OR_DN ,'$NV$') != i_member_org_unit_id_or_dn
              -- ??? : and t2.ORG_UNIT_ID_OR_DN != i_member_org_unit_id_or_dn
              --
              ) t
       where t.ORG_UNIT_ID_OR_DN != i_member_org_unit_id_or_dn
         and t.ORG_UNIT_ID_OR_DN = i_org_unit_id_or_dn;
      --
    else
      --
      select count(1)
        into v_pi_Tmp
        from ORG_UNIT_ORG_UNIT_REL_POOL t
       where t.MEMBER_ORG_UNIT_ID_OR_DN = i_member_org_unit_id_or_dn
         and t.ORG_UNIT_ID_OR_DN = i_org_unit_id_or_dn;
      --
    end if;
    --
    v_Result := case
                  when (v_pi_Tmp > 0) then
                   true
                  else
                   false
                end;
    --
    return v_Result;
    --
  exception
    when others then
      if (not nvl(i_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
      return null;
      --
  end Is_Org_Unit_Member_Of_Org_Unit;
  --
  function Is_Org_Unit_Member_Of_Org_Unit_(i_member_Org_Unit_id_or_dn in varchar2
                                          ,i_Org_Unit_id_or_dn        in varchar2
                                          ,i_Query_Hierarchically     in pls_integer default 0
                                          ,i_Prevent_EXCE             in pls_integer default 0
                                           --
                                           ) return pls_integer is
  begin
    return sys.diutil.bool_to_int(Is_Org_Unit_Member_Of_Org_Unit(i_member_Org_Unit_id_or_dn
                                                                ,i_Org_Unit_id_or_dn
                                                                ,sys.diutil.int_to_bool(i_Query_Hierarchically)
                                                                ,sys.diutil.int_to_bool(i_Prevent_EXCE)
                                                                 --
                                                                 )
                                  --
                                  );
  end Is_Org_Unit_Member_Of_Org_Unit_;
  --
end PKG_AUTHORIZATION;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_AUTHORIZATION" TO PUBLIC;
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_AUTHORIZATION" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_AUTHORIZATION" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_AUTHORIZATION" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_AUTHORIZATION" TO "BIOSUPPORT";
