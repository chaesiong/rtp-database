CREATE OR REPLACE EDITIONABLE PACKAGE "DL_DBA"."PKG_SQL_SCRIPT" authid definer is
  --
  --
  --
  function Templates4LOOKUP(p_DB_OBJECT  in DL_COMMON.OT_DB_OBJECT
                           ,p_TBLSPC4DAT in DL_COMMON.OT_DB_TBLSPC
                           ,p_TBLSPC4IDX in DL_COMMON.OT_DB_TBLSPC
                           ,p_TBLSPC4LOB in DL_COMMON.OT_DB_TBLSPC
                           ,p_Author     in varchar2
                            --
                            ) return DL_COMMON.VT_CHAR_FILE;
  --
  function Templates4LOOKUP(p_OBJ_OWNER  in varchar2
                           ,p_OBJ_NAME   in varchar2
                           ,p_TBLSPC4DAT in varchar2
                           ,p_TBLSPC4IDX in varchar2
                           ,p_TBLSPC4LOB in varchar2
                           ,p_Author     in varchar2
                            --
                            ) return DL_COMMON.VT_CHAR_FILE;
  --
  procedure Templates4LOOKUP(p_OBJ_OWNER  in varchar2
                            ,p_OBJ_NAME   in varchar2
                            ,p_TBLSPC4DAT in varchar2
                            ,p_TBLSPC4IDX in varchar2
                            ,p_TBLSPC4LOB in varchar2
                            ,p_Author     in varchar2
                            ,p_DIRECTORY  in varchar2
                             --
                             );
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
end PKG_SQL_SCRIPT;
/
