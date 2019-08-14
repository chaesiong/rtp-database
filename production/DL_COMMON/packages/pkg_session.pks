CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PKG_SESSION" authid current_user is
  --
  --
  /*******************************************************************************
  ???


  Author    Date        Description
  --------  ----------  -------------------------------------------------------*
  WWirns    02.10.2017  Added
  *******************************************************************************/
  --
  --
  --
  function Get_AUDIT_User return varchar2;
  --
  --
  --
  function Get_User_Name return varchar2;
  --
  --
  --
  function Get_User_IP return varchar2;
  --
  --
  --
  function Get_User_Host return varchar2;
  --
  --
  --
  procedure Set_BY_User(p_User in varchar2);
  --
  --
  --
  procedure Set_BY_Host(p_Host in varchar2);
  --
  --
  --
  function Get_BY_User return varchar2;
  --
  --
  --
  function Get_BY_Host return varchar2;
  --
  --
  --
  procedure Refresh_AUDIT_User;
  --
  --
  --
  procedure Init_PACKAGE;
  --
  procedure Check_OBJECT_DEPENDENCE;
  --
  function Get_PACKAGE_ID return simple_integer deterministic;
  --
  function Get_OBJECT_NAME return varchar2 deterministic;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic;
  --
end PKG_SESSION;
/
