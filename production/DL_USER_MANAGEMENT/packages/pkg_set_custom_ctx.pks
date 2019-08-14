CREATE OR REPLACE EDITIONABLE PACKAGE "DL_USER_MANAGEMENT"."PKG_SET_CUSTOM_CTX" authid current_user is
  /**
  * ========================================================================<br/>
  * <b> Package for custom context </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: MThierhoff $<br/>
  * @date    $Date: 13/03/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  g_CtxNamespace  constant varchar2(100) := 'CUSTOM_CTX'; -- Context Namespace
  g_CtxUserName   constant varchar2(100) := 'USER_NAME'; -- Context Parameter for current user name
  g_CtxIP         constant varchar2(100) := 'IP_ADDRESS';
  g_CtxUserSource constant varchar2(100) := 'USER_SOURCE';
  g_CtxAppName    constant varchar2(100) := 'APP_NAME';

  procedure Set_User(i_username    in varchar2
                    ,i_user_source in number);

  procedure Set_App_Name(i_app_name in varchar2);

  procedure Set_IP(i_IP in varchar2);

  procedure Post_Db_Logon;

  procedure Set_Apex_Context(i_user_source in number);

end PKG_SET_CUSTOM_CTX;
/
