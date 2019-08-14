CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_DBA"."PKG_MODULE_INSTALL" is
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    09.07.2018  Added
  *******************************************************************************/
  --
  function Get_CURR_INST_ARG(p_MODULE_TITLE in MODULE_CURR_INST_ARGS.MODULE_TITLE%type
                            ,p_ARG_NAME     in MODULE_CURR_INST_ARGS.ARG_NAME%type
                            ,p_Prevent_EXCE in boolean default false
                             --
                             ) return MODULE_CURR_INST_ARGS.ARG_VALUE%type is
    v_Result MODULE_CURR_INST_ARGS.ARG_VALUE%type;
  begin
    select t.ARG_VALUE
      into v_Result
      from DL_DBA.MODULE_CURR_INST_ARGS t
     where t.MODULE_TITLE = p_MODULE_TITLE
       and t.ARG_NAME = p_ARG_NAME;
    return v_Result;
  exception
    when others then
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      return null;
  end Get_CURR_INST_ARG;
  --
  function Get_CURR_INST_ARGS(p_MODULE_TITLE in MODULE_CURR_INST_ARGS.MODULE_TITLE%type
                             ,p_ARG_NAME     in MODULE_CURR_INST_ARGS.ARG_NAME%type
                             ,p_Prevent_EXCE in boolean default false
                              --
                              ) return VT_CURR_INST_ARGS is
    v_Result VT_CURR_INST_ARGS;
  begin
    select t.ARG_VALUE
      bulk collect
      into v_Result
      from DL_DBA.MODULE_CURR_INST_ARGS t
     where t.MODULE_TITLE = p_MODULE_TITLE
       and t.ARG_NAME like p_ARG_NAME || '.' || '%'
     order by t.ARG_NAME;
    return v_Result;
  exception
    when others then
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      return null;
  end Get_CURR_INST_ARGS;
  --
end PKG_MODULE_INSTALL;
/
  GRANT EXECUTE ON "DL_DBA"."PKG_MODULE_INSTALL" TO "DERMALOG_PROXY";
