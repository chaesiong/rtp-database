CREATE OR REPLACE EDITIONABLE PACKAGE "DL_DBA"."PKG_MODULE_INSTALL" is
  --
  type VT_CURR_INST_ARGS is varray(1024000) of MODULE_CURR_INST_ARGS.ARG_VALUE%type;
  --
  function Get_CURR_INST_ARG(p_MODULE_TITLE in MODULE_CURR_INST_ARGS.MODULE_TITLE%type
                            ,p_ARG_NAME     in MODULE_CURR_INST_ARGS.ARG_NAME%type
                            ,p_Prevent_EXCE in boolean default false
                             --
                             ) return MODULE_CURR_INST_ARGS.ARG_VALUE%type;
  --
  function Get_CURR_INST_ARGS(p_MODULE_TITLE in MODULE_CURR_INST_ARGS.MODULE_TITLE%type
                             ,p_ARG_NAME     in MODULE_CURR_INST_ARGS.ARG_NAME%type
                             ,p_Prevent_EXCE in boolean default false
                              --
                              ) return VT_CURR_INST_ARGS;
  --
end PKG_MODULE_INSTALL;
/
