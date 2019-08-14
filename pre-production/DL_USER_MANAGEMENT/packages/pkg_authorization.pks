CREATE OR REPLACE EDITIONABLE PACKAGE "DL_USER_MANAGEMENT"."PKG_AUTHORIZATION" is

  /**
  * ========================================================================
  * <b> Functions / Procedures for authorization </b>
  *
  * @file    $HeadURL: $
  * @version $Revision: 1.6 $
  * @author  $Author: M. Thierhoff $
  * @date    $Date: 19/05/2017 $
  * @version $Id: $
  * ========================================================================
  * @headcom
  */

  --
  gc_v_start_msg varchar2(20) := '** START';
  gc_v_end_msg   varchar2(20) := '** END  ';
  --

  function HAS_USER_PERMISSION(i_user_id_or_dn in varchar2
                              ,i_object_id     in varchar2
                              ,i_grant_id      in varchar2
                               --
                               ) return boolean;

  function HAS_USER_PERMISSION(i_user_id_or_dn in varchar2
                              ,i_object_id     in varchar2
                               --
                               ) return boolean;

  function HAS_USER_PERMISSION_(i_username in varchar2
                              ,i_object_id     in varchar2
                               --
                               ) return number;

  function APEX_HAS_USER_PERMISSION(i_object_id in varchar2
                                   ,i_grant_id  in varchar2
                                    --
                                    ) return boolean;

  function APEX_HAS_USER_GRANT_ON_PAGE(i_grant_id in varchar2
                                       --
                                       ) return boolean;

  function APEX_HAS_USER_GRANT_ON_PAGE(i_grant_id in varchar2
                                      ,i_app_name in varchar2
                                      ,i_page_id  in number
                                       --
                                       ) return boolean;

  function APEX_IS_PAGE_ALLOWED(i_app_name in varchar2
                               ,i_page_id  in number
                                --
                                ) return boolean;

  function APEX_IS_PAGE_ALLOWED return boolean;

  function APEX_MENU_AUTORIZATION(i_app_name in varchar2
                                 ,i_page_id  in number
                                  --
                                  ) return number;

  function apex_menu_sql (i_username in varchar2 ) return varchar2;
  --
  --
  --
  function Is_User_Member_Of_Role(i_member_user_id_or_dn in varchar2
                                 ,i_role_id_or_dn        in varchar2
                                 ,i_Query_Hierarchically in boolean default true
                                 ,i_Prevent_EXCE         in boolean default false
                                  --
                                  ) return boolean;
  --
  function Is_User_Member_Of_Role_(i_member_user_id_or_dn in varchar2
                                  ,i_role_id_or_dn        in varchar2
                                  ,i_Query_Hierarchically in pls_integer default 1
                                  ,i_Prevent_EXCE         in pls_integer default 0
                                   --
                                   ) return pls_integer;
  --
  --
  --
  function Is_User_Member_Of_Org_Unit(i_member_user_id_or_dn in varchar2
                                     ,i_org_unit_id_or_dn    in varchar2
                                     ,i_Query_Hierarchically in boolean default false
                                     ,i_Prevent_EXCE         in boolean default false
                                      --
                                      ) return boolean;
  --
  function Is_User_Member_Of_Org_Unit_(i_member_user_id_or_dn in varchar2
                                      ,i_org_unit_id_or_dn    in varchar2
                                      ,i_Query_Hierarchically in pls_integer default 0
                                      ,i_Prevent_EXCE         in pls_integer default 0
                                       --
                                       ) return pls_integer;
  --
  --
  --
  function Is_Computer_Member_Of_Role(i_member_computer_id_or_dn in varchar2
                                     ,i_role_id_or_dn            in varchar2
                                     ,i_Query_Hierarchically     in boolean default true
                                     ,i_Prevent_EXCE             in boolean default false
                                      --
                                      ) return boolean;
  --
  function Is_Computer_Member_Of_Role_(i_member_computer_id_or_dn in varchar2
                                      ,i_role_id_or_dn            in varchar2
                                      ,i_Query_Hierarchically     in pls_integer default 1
                                      ,i_Prevent_EXCE             in pls_integer default 0
                                       --
                                       ) return pls_integer;
  --
  --
  --
  function Is_Computer_Member_Of_Org_Unit(i_member_computer_id_or_dn in varchar2
                                         ,i_org_unit_id_or_dn        in varchar2
                                         ,i_Query_Hierarchically     in boolean default false
                                         ,i_Prevent_EXCE             in boolean default false
                                          --
                                          ) return boolean;
  --
  function Is_Computer_Member_Of_Org_Unit_(i_member_computer_id_or_dn in varchar2
                                          ,i_org_unit_id_or_dn        in varchar2
                                          ,i_Query_Hierarchically     in pls_integer default 0
                                          ,i_Prevent_EXCE             in pls_integer default 0
                                           --
                                           ) return pls_integer;
  --
  --
  --
  function Is_Role_Member_Of_Role(i_member_role_id_or_dn in varchar2
                                 ,i_role_id_or_dn        in varchar2
                                 ,i_Query_Hierarchically in boolean default true
                                 ,i_Prevent_EXCE         in boolean default false
                                  --
                                  ) return boolean;
  --
  function Is_Role_Member_Of_Role_(i_member_role_id_or_dn in varchar2
                                  ,i_role_id_or_dn        in varchar2
                                  ,i_Query_Hierarchically in pls_integer default 1
                                  ,i_Prevent_EXCE         in pls_integer default 0
                                   --
                                   ) return pls_integer;
  --
  --
  --
  function Is_Org_Unit_Member_Of_Org_Unit(i_member_Org_Unit_id_or_dn in varchar2
                                         ,i_Org_Unit_id_or_dn        in varchar2
                                         ,i_Query_Hierarchically     in boolean default false
                                         ,i_Prevent_EXCE             in boolean default false
                                          --
                                          ) return boolean;
  --
  function Is_Org_Unit_Member_Of_Org_Unit_(i_member_Org_Unit_id_or_dn in varchar2
                                          ,i_Org_Unit_id_or_dn        in varchar2
                                          ,i_Query_Hierarchically     in pls_integer default 0
                                          ,i_Prevent_EXCE             in pls_integer default 0
                                           --
                                           ) return pls_integer;
  --
end PKG_AUTHORIZATION;
/
