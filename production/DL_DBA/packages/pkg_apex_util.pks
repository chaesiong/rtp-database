CREATE OR REPLACE EDITIONABLE PACKAGE "DL_DBA"."PKG_APEX_UTIL" authid current_user is
  --
  --
  --
  function Script4Static_WS_Files(p_WORKSPACE in varchar2
                                  --
                                  ) return clob;
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
end PKG_APEX_UTIL;
/
