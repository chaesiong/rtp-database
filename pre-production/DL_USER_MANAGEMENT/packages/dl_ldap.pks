CREATE OR REPLACE EDITIONABLE PACKAGE "DL_USER_MANAGEMENT"."DL_LDAP" is
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for LDAP access in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.4 $<br/>
  * @author  $Author: KSarikaya, MThierhoff $<br/>
  * @date    $Date: 28/03/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  g_ldap_host          varchar2(256) := dl_user_management.pkg_param_config.F_Param_Value_Str(i_param_name => 'ldap_host');
  g_ldap_port          varchar2(256) := trim(dl_user_management.pkg_param_config.F_Param_Value_Num(i_param_name => 'ldap_port'));
  g_ldap_search_base   varchar2(256) := dl_user_management.pkg_param_config.F_Param_Value_Str(i_param_name => 'ldap_search_base');
  g_ldap_domain        varchar2(256) := dl_user_management.pkg_param_config.F_Param_Value_Str(i_param_name => 'ldap_domain');
  g_ldap_read_user     varchar2(256) := dl_user_management.pkg_param_config.F_Param_Value_Str(i_param_name => 'ldap_read_user');
  g_ldap_read_user_pwd varchar2(256) := dl_user_management.pkg_param_config.F_Param_Value_Str(i_param_name => 'ldap_read_user_pwd');

  type attr_type is record(
     id   number(20)
    ,dn   varchar2(256)
    ,cn   varchar2(256)
    ,attr varchar2(256)
    ,val  varchar2(256));

  type tab_attr is table of attr_type;

  type user_attr_type is record(
     id             number(20)
    ,dn             varchar2(256)
    ,sid            varchar2(4000)
    ,cn             varchar2(4000)
    ,sAMAccountName varchar2(4000)
    ,displayName    varchar2(4000)
    ,mail           varchar2(4000)
    ,lastLogon      varchar2(4000)
    ,badPwdCount    varchar2(4000)
    ,primaryGroupID varchar2(4000)
    ,memberOf       varchar2(4000)
    --
    );

  type user_tab_attr is table of user_attr_type;

  type entry_type is record(
     id   number(20)
    ,dn   varchar2(256)
    ,attr varchar2(4000)
    ,val  varchar2(4000)
    --
    );

  type tab_entry is table of entry_type;

  type org_unit_attr_type is record(
     id              number(20)
    ,dn              varchar2(256)
    ,ou              varchar2(4000)
    ,org_unit_name   varchar2(4000)
    ,description     varchar2(4000)
    ,org_unit_parent varchar2(4000)
    --
    );

  type org_unit_tab_attr is table of org_unit_attr_type;

  type computer_attr_type is record(
     id                number(20)
    ,dn                varchar2(256)
    ,sid               varchar2(4000)
    ,cn                varchar2(4000)
    ,computer_name     varchar2(4000)
    ,description       varchar2(4000)
    ,primaryGroupID    varchar2(4000)
    ,computer_memberOf varchar2(4000)
    --
    );

  type computer_tab_attr is table of computer_attr_type;

  function authenticate(i_username in varchar2
                       ,i_password in varchar2) return boolean;

  function get_data(i_filter           in varchar2 default 'objectclass=*'
                   ,i_attribute        in varchar2 default '*' -- retrieve all attributes
                   ,p_Check_Param_Mask in pls_integer default 15 -- Bitmask: 1 => usr_from_ad, 2 => role_from_ad, 4 => org_unit_from_ad, 8 => computer_from_ad
                    ) return tab_attr
    pipelined;

  function Get_Users return user_tab_attr
    pipelined;

  function find_user(i_username in varchar2
                    ,o_dn       out varchar2) return boolean;
  --
  --
  -- p_Check_Param_Mask is a Bitmask: 1 => usr_from_ad, 2 => role_from_ad, 4 => org_unit_from_ad, 8 => computer_from_ad
  function Get_Entries(p_Filter           in varchar2
                      ,p_Attribute        in varchar2
                      ,p_Check_Param_Mask in pls_integer default 15
                       --
                       ) return tab_entry
    pipelined;
  --
  --
  --
  procedure Set_Use_Cache4Roles(p_Use_Cache in pls_integer default 0
                                --
                                );
  --
  --
  --
  procedure Cache_Roles$AT(p_Roles     in TT_LDAP_ROLE
                          ,p_Do_Delete in boolean default false
                           --
                           );
  --
  --
  --
  function Get_Roles(p_Use_Cache in pls_integer default null
                     --
                     ) return TT_LDAP_ROLE
    pipelined;
  --
  --
  --
  function Find_Role(p_Name in varchar2
                    ,p_DN   out varchar2
                     --
                     ) return boolean;
  --
  --
  --
  function Get_Org_Units return org_unit_tab_attr
    pipelined;
  --
  --
  --
  function Find_Org_Unit(p_Name in varchar2
                        ,p_DN   out varchar2
                         --
                         ) return boolean;
  --
  --
  --
  function Get_Computers return computer_tab_attr
    pipelined;
  --
  --
  --
  function Find_Computer(p_Name in varchar2
                        ,p_DN   out varchar2
                         --
                         ) return boolean;
  --
end DL_LDAP;
/
