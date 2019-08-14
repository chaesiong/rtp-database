CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_DL_AUTHORIZATION" is
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for authorization in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: C. Funke $<br/>
  * @date    $Date:  05/12/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  procedure Define_Landing_Page(p_username in Varchar2)
  is
    l_count_roles  number;
    l_role_id      USER_MANAGEMENT.ROLES.ID%type;

  begin
    -- Check number of roles
    select count(urr.role_id)
    into l_count_roles
    from USER_MANAGEMENT.USERS u
    join USER_MANAGEMENT.USER_ROLE_REL urr
    on u.id = urr.user_id
    where u.username = upper(p_username);

    if l_count_roles = 1 then
      --Check if the role_id is REP
      select urr.role_id
      into l_role_id
      from USER_MANAGEMENT.USERS u
      join USER_MANAGEMENT.USER_ROLE_REL urr
      on u.id = urr.user_id
      where u.username = upper(p_username);

      if l_role_id in ('REP', 'FM', 'CU') then
        apex_util.set_session_state('AI_LANDING_PAGE','5900');
      else
        apex_util.set_session_state('AI_LANDING_PAGE','17');
      end if;
    else
      apex_util.set_session_state('AI_LANDING_PAGE','17');
    end if;
  end;

end;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_DL_AUTHORIZATION" TO "DERMALOG_PROXY";
