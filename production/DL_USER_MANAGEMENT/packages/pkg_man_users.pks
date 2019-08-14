CREATE OR REPLACE EDITIONABLE PACKAGE "DL_USER_MANAGEMENT"."PKG_MAN_USERS" is
  /**
  * ========================================================================<br/>
  * <b> Description of the content of the package </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.5 $<br/>
  * @author  $Author: MThierhoff $<br/>
  * @date    $Date: 09/06/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  procedure STORE_PASSWORD(i_user_id             in varchar2
                          ,i_password            in varchar2
                          ,i_pwd_must_be_changed in varchar2 default 'N');

  function IS_PWD_CHANGE_NECESSARY(i_username in varchar2) return boolean;

  procedure PASSWORD_CORRECT_OR_ERROR(i_user_id       in varchar2
                                     ,i_password      in varchar2);

  function IS_PWD_CHANGE_NECESSARY_LOGIN(i_username      in varchar2
                                        ,i_password      in varchar2) return boolean;

  function PASSWORD_MEETS_SECURITY_RULES(i_username                     in varchar2
                                        ,i_password                     in varchar2
                                        ,i_first_name                   in varchar2 default null
                                        ,i_last_name                    in varchar2 default null
                                        ,i_phone_number                 in varchar2 default null
                                        ,o_pwd_min_length               out boolean
                                        ,o_pwd_max_length               out boolean
                                        ,o_pwd_must_contain_alpha       out boolean
                                        ,o_pwd_must_contain_numeric     out boolean
                                        ,o_pwd_must_contain_punctuation out boolean
                                        ,o_pwd_must_contain_upper_lower out boolean
                                        ,o_pwd_must_differ_from_old     out boolean
                                        ,o_pwd_not_reusable             out boolean
                                        ,o_pwd_must_not_contain_user    out boolean
                                        ,o_pwd_must_not_contain_f_name  out boolean
                                        ,o_pwd_must_not_contain_l_name  out boolean
                                        ,o_pwd_must_not_contain_phone   out boolean
                                        ,o_pwd_must_differ_from_n_last  out boolean
                                        ,o_pwd_char_repeat              out boolean
                                        ,o_pwd_consecutive              out boolean
                                         --
                                         ) return boolean;

  function ADD_USER(i_username            in varchar2
                   ,i_first_name          in varchar2
                   ,i_last_name           in varchar2
                   ,i_mail_address        in varchar2
                   ,i_phone_number        in varchar2
                   ,i_state               in number
                   ,i_password            in varchar2
                   ,i_pwd_must_be_changed in varchar2 default 'N'
                   ,i_insert_source       in varchar2 default user
                   ,i_pw_expire           in number default 1) return varchar2;

  procedure CHANGE_PASSWORD(i_username     in varchar2
                           ,i_password_new in varchar2
                           ,i_password_old in varchar2);

  procedure RESET_PASSWORD(i_username     in varchar2
                          ,i_password_new in varchar2);

  procedure AUTHENTICATE(i_username in varchar2
                        ,i_password in varchar2);

  function APEX_AUTHENTICATE(p_username in varchar2
                            ,p_password in varchar2) return boolean;

  procedure POST_LOGIN(i_username in varchar2 default V('APP_USER'));

  procedure POST_INIT_NEW_DB_SESSION(i_username in varchar2 default V('APP_USER'));

  procedure POST_LOGOUT(i_username in varchar2 default V('APP_USER'));

  function Get_CN_from_DN(i_dn in varchar2) return varchar2;
  --
  --
  --
  function Add_Computer(i_Name        in varchar2
                       ,i_Description in varchar2
                       ,i_DNS_Name    in varchar2
                       ,i_Sort_Order  in integer
                       ,i_Is_Active   in integer
                        --
                        ) return varchar2;
  --
  --
  --
  procedure Save_User_Roles(i_user_id    in varchar2
                           ,i_roles_list in clob
                            --
                            );
  --
  --
  --
  procedure Save_User_Org_Units(i_user_id       in varchar2
                               ,i_org_unit_list in clob
                                --
                                );
  --
  --
  --
  procedure Save_Computer_Roles(i_computer_id in varchar2
                               ,i_roles_list  in clob
                                --
                                );
  --
  --
  --
  procedure Save_Computer_Org_Units(i_computer_id   in varchar2
                                   ,i_org_unit_list in clob
                                    --
                                    );
  --
  --
  --
  procedure Save_Role_Permissions(i_role_id     in varchar2
                                 ,i_object_id   in varchar2
                                 ,i_grants_list in clob
                                  --
                                  );
  --
  --
  --
  procedure Save_Role_Roles(i_role_id    in varchar2
                           ,i_roles_list in clob
                            --
                            );
  --
  --
  --
  procedure Save_Role_Member_Of_Roles(i_role_id    in varchar2
                                     ,i_roles_list in clob
                                      --
                                      );
  --
  --
  --
  procedure Save_Role_Users(i_role_id    in varchar2
                           ,i_users_list in clob
                            --
                            );
  --
  --
  --
  procedure Save_Role_Computers(i_role_id       in varchar2
                               ,i_computer_list in clob
                                --
                                );
  --
  --
  --
  procedure Save_Org_Unit_Org_Units(i_org_unit_id   in varchar2
                                   ,i_org_unit_list in clob
                                    --
                                    );
  --
  --
  --
  procedure Save_Org_Unit_Member_Of_OUnits(i_org_unit_id   in varchar2
                                          ,i_org_unit_list in clob
                                           --
                                           );
  --
  --
  --
  procedure Save_Org_Unit_Users(i_org_unit_id in varchar2
                               ,i_users_list  in clob
                                --
                                );
  --
  --
  --
  procedure Save_Org_Unit_Computers(i_org_unit_id   in varchar2
                                   ,i_computer_list in clob
                                    --
                                    );
  --
  --
  procedure check_pwd_expired;
  --

end PKG_MAN_USERS;
/
