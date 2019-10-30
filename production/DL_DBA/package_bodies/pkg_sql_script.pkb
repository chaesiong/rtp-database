CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_DBA"."PKG_SQL_SCRIPT" is
  --
  --
  /*******************************************************************************
  ???


  Author    Date        Description
  --------  ----------  -------------------------------------------------------*
  WWirns    16.08.2018  Added
  *******************************************************************************/
  --
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0002';
  C_OBJECT_COPYRIGHT constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_PACKAGE_Initialized  boolean := false;
  g_PACKAGE_Initializing boolean := false;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  --
  --
  select t.key_value
        ,t.display_value
        ,t.display_order
        ,t.template_key
        ,t.template_val
        ,t.rowid
    from DL_DBA.TEMPLATES t
   order by substr(t.template_key
                  ,1
                  ,6)
           ,t.display_order;
  --
  --
  select to_char(t.PATH$P) as SCRIPT_PATH
        ,t.NAME$P as SCRIPT_NAME
        ,t.CONTENT as SCRIPT_CONTENT
    from table(DL_DBA.PKG_SQL_SCRIPT.Templates4LOOKUP('table_owner'
                                                     ,'table_name'
                                                     ,'datastore'
                                                     ,'datastore_idx'
                                                     ,'datastore_lob'
                                                     ,'WWirns'
                                                      --
                                                      )
               --
               ) t;
  --
  --
  --
  -- Create directory
  create or replace directory ROOT_HOME_ORACLE as '/home/oracle/';
  --
  -- Important: Grant to user DL_DBA, because package DL_DBA.PKG_SQL_SCRIPT runs under "AUTHID DEFINER"
  grant read, write on directory ROOT_HOME_ORACLE to DL_DBA;
  --
  -- Create SQL-Files onto DIRECTORY-Path
  begin
    DL_DBA.PKG_SQL_SCRIPT.Templates4LOOKUP(p_obj_owner  => 'DL_WW'
                                          ,p_obj_name   => 'WW_TBL_B'
                                          ,p_tblspc4dat => 'DATASTORE'
                                          ,p_tblspc4idx => 'DATASTORE_IDX'
                                          ,p_tblspc4lob => 'DATASTORE_LOB'
                                          ,p_author     => 'WWirns'
                                          ,p_directory  => 'ROOT_HOME_ORACLE'
                                           --
                                           );
  end;
  --
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    16.08.2018  Templates4LOOKUP:Added
  *******************************************************************************/
  --
  function Templates4LOOKUP(p_DB_OBJECT  in DL_COMMON.OT_DB_OBJECT
                           ,p_TBLSPC4DAT in DL_COMMON.OT_DB_TBLSPC
                           ,p_TBLSPC4IDX in DL_COMMON.OT_DB_TBLSPC
                           ,p_TBLSPC4LOB in DL_COMMON.OT_DB_TBLSPC
                           ,p_Author     in varchar2
                            --
                            ) return DL_COMMON.VT_CHAR_FILE is
    --
    v_Result DL_COMMON.VT_CHAR_FILE;
    --
    C_TEMPLATES_KEY constant TEMPLATES.TEMPLATE_KEY%type := 'LOOKUP';
    v_Filename_Replacements dl_common.VT_SEARCH_DEFINITION;
    v_Script_Replacements   dl_common.VT_SEARCH_DEFINITION;
    v_CHAR_FILE             DL_COMMON.OT_CHAR_FILE;
    --
  begin
    --
    --
    if (p_DB_OBJECT.OBJ_OWNER is null
       --
       or p_DB_OBJECT.OBJ_NAME is null
       --
       or p_TBLSPC4DAT.TBLSPC_NAME is null
       --
       or p_TBLSPC4IDX.TBLSPC_NAME is null
       --
       or p_TBLSPC4LOB.TBLSPC_NAME is null
       --
       or p_Author is null
       --
       )
    then
      Raise_application_error(-20000
                             ,'Any parameter is NULL!');
    end if;
    --
    --
    v_Filename_Replacements := dl_common.VT_SEARCH_DEFINITION(dl_common.OT_SEARCH_DEFINITION('[schemaname]'
                                                                                            ,p_DB_OBJECT.OBJ_OWNER
                                                                                             --
                                                                                             )
                                                             ,dl_common.OT_SEARCH_DEFINITION('[objectname]'
                                                                                            ,p_DB_OBJECT.OBJ_NAME
                                                                                             --
                                                                                             )
                                                              --
                                                              );
    --
    -- First entry is a placeholder for dynamically build "OT_SEARCH_DEFINITION()"
    v_Script_Replacements := dl_common.VT_SEARCH_DEFINITION(null
                                                           ,dl_common.OT_SEARCH_DEFINITION('"[schemaname]"'
                                                                                          ,p_DB_OBJECT.OBJ_OWNER
                                                                                           --
                                                                                           )
                                                           ,dl_common.OT_SEARCH_DEFINITION('"[objectname]"'
                                                                                          ,p_DB_OBJECT.OBJ_NAME
                                                                                           --
                                                                                           )
                                                           ,dl_common.OT_SEARCH_DEFINITION('"[tablespace-dat]"'
                                                                                          ,p_TBLSPC4DAT.TBLSPC_NAME
                                                                                           --
                                                                                           )
                                                           ,dl_common.OT_SEARCH_DEFINITION('"[tablespace-idx]"'
                                                                                          ,p_TBLSPC4IDX.TBLSPC_NAME
                                                                                           --
                                                                                           )
                                                           ,dl_common.OT_SEARCH_DEFINITION('"[tablespace-lob]"'
                                                                                          ,p_TBLSPC4LOB.TBLSPC_NAME
                                                                                           --
                                                                                           )
                                                            --
                                                            );
    --
    --
    v_Result := DL_COMMON.VT_CHAR_FILE();
    --
    for R0 in (
               --
               select t.*
                 from TEMPLATES t
                where t.TEMPLATE_KEY like C_TEMPLATES_KEY || ':%'
                order by substr(t.TEMPLATE_KEY
                                ,1
                                ,length(C_TEMPLATES_KEY)
                                 --
                                 )
                         ,t.DISPLAY_ORDER
               --
               )
    loop
      --
      --
      v_CHAR_FILE := DL_COMMON.OT_CHAR_FILE(DL_COMMON.PKG_UTIL.Multi_Replace(substr(R0.TEMPLATE_KEY
                                                                                   ,length(C_TEMPLATES_KEY) + 2)
                                                                            ,v_Filename_Replacements
                                                                             --
                                                                             )
                                            --
                                            );
      --
      -- Set dynamically build entry
      v_Script_Replacements(1) := dl_common.OT_SEARCH_DEFINITION('* Author    Date        Description%**********/'
                                                                , '* Author    Date        Description' || chr(13) || chr(10)
                                                                 --
                                                                  || case
                                                                    when (R0.TEMPLATE_KEY like '%\Trigger\%') then
                                                                     '  '
                                                                    else
                                                                     ''
                                                                  end
                                                                 --
                                                                  || '* --------  ----------  -------------------------------------------------------*' || chr(13) || chr(10)
                                                                 --
                                                                  || case
                                                                    when (R0.TEMPLATE_KEY like '%\Trigger\%') then
                                                                     '  '
                                                                    else
                                                                     ''
                                                                  end || '* '
                                                                 --
                                                                  || substr(rpad(nvl(p_Author
                                                                                    ,' '
                                                                                     --
                                                                                     )
                                                                                ,8
                                                                                ,' '
                                                                                 --
                                                                                 )
                                                                           ,1
                                                                           ,8
                                                                            --
                                                                            ) || '  ' || to_char(sysdate
                                                                                                ,'DD.MM.YYYY'
                                                                                                 --
                                                                                                 )
                                                                 --
                                                                  || '  Added as copy of template ' || C_TEMPLATES_KEY || '-' || trim(R0.MAJOR) || '.' || trim(R0.MINOR) || '.' || trim(R0.PATCH) || chr(13) || chr(10)
                                                                 --
                                                                  || case
                                                                    when (R0.TEMPLATE_KEY like '%\Trigger\%') then
                                                                     '  '
                                                                    else
                                                                     ''
                                                                  end || '*******************************************************************************/'
                                                                ,1
                                                                ,1
                                                                ,3
                                                                 --
                                                                 );
      --
      v_CHAR_FILE.CONTENT := DL_COMMON.PKG_UTIL.Multi_Replace(R0.TEMPLATE_VAL
                                                             ,v_Script_Replacements
                                                              --
                                                              );
      --
      --
      v_Result.extend();
      v_Result(v_Result.last()) := v_CHAR_FILE;
      --
    end loop;
    --
    --
    return v_Result;
    --
  end Templates4LOOKUP;
  --
  function Templates4LOOKUP(p_OBJ_OWNER  in varchar2
                           ,p_OBJ_NAME   in varchar2
                           ,p_TBLSPC4DAT in varchar2
                           ,p_TBLSPC4IDX in varchar2
                           ,p_TBLSPC4LOB in varchar2
                           ,p_Author     in varchar2
                            --
                            ) return DL_COMMON.VT_CHAR_FILE is
  begin
    --
    --
    return Templates4LOOKUP(DL_COMMON.OT_DB_OBJECT(p_OBJ_OWNER
                                                  ,p_OBJ_NAME)
                           ,DL_COMMON.OT_DB_TBLSPC(p_TBLSPC4DAT)
                           ,DL_COMMON.OT_DB_TBLSPC(p_TBLSPC4IDX)
                           ,DL_COMMON.OT_DB_TBLSPC(p_TBLSPC4LOB)
                           ,p_Author
                            --
                            );
    --
  end Templates4LOOKUP;
  --
  procedure Templates4LOOKUP(p_OBJ_OWNER  in varchar2
                            ,p_OBJ_NAME   in varchar2
                            ,p_TBLSPC4DAT in varchar2
                            ,p_TBLSPC4IDX in varchar2
                            ,p_TBLSPC4LOB in varchar2
                            ,p_Author     in varchar2
                            ,p_DIRECTORY  in varchar2
                             --
                             ) is
    --
    i           integer;
    v_CHAR_FILE DL_COMMON.VT_CHAR_FILE;
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
    --
    --
    procedure L_Finally is
    begin
      --
      if (v_CHAR_FILE is not null)
      then
        --
        i := v_CHAR_FILE.first;
        while (i is not null)
        loop
          DL_COMMON.PKG_UTIL.FreeTempLOB(v_CHAR_FILE(i).CONTENT
                                        ,true
                                         --
                                         );
          i := v_CHAR_FILE.next(i);
        end loop;
        --
        v_CHAR_FILE := null;
        --
      end if;
      --
    end L_Finally;
    --
  begin
    --
    --
    if (p_DIRECTORY is null)
    then
      Raise_application_error(-20000
                             ,'Parameter p_DIRECTORY is NULL!');
    end if;
    --
    --
    v_CHAR_FILE := Templates4LOOKUP(p_OBJ_OWNER
                                   ,p_OBJ_NAME
                                   ,p_TBLSPC4DAT
                                   ,p_TBLSPC4IDX
                                   ,p_TBLSPC4LOB
                                   ,p_Author
                                    --
                                    );
    --
    begin
      --
      --
      i := v_CHAR_FILE.first;
      while (i is not null)
      loop
        DL_COMMON.PKG_UTIL.LOB2DIRECTORY(v_CHAR_FILE(i).CONTENT
                                        ,p_DIRECTORY
                                        ,v_CHAR_FILE(i).Get_NAME()
                                         --
                                         );
        i := v_CHAR_FILE.next(i);
      end loop;
      --
      -- Finally
      L_Finally();
      --
    exception
      when others then
        DL_COMMON.PKG_UTIL.FormatErrMsg(v_SQLCODE
                                       ,v_SQLERRM);
        --
        -- Finally
        L_Finally();
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
        --
    end;
    --
  end Templates4LOOKUP;
  --
  --
  -- *** Standard functions ***************************************************************************
  --
  --
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    13.01.2016  Init_PACKAGE:Added
  *******************************************************************************/
  --
  procedure Init_PACKAGE is
    --
  begin
    --
    -- !!! Attention with call of other packages, because their init routines could be call back !!!
    -- !!! Try to avoid call of other packages here in this init block in order to prevent endless loops !!!
    --
    --
    -- Initial-Block
    if (not g_PACKAGE_Initializing)
    then
      --
      g_PACKAGE_Initializing := true;
      g_PACKAGE_Initialized  := false;
      --
      --
      /*
      g_PACKAGE_NAME := PKG_UTIL.Get_PLSQL_Unit4Caller();
      if (g_PACKAGE_NAME.VC02 != Get_OBJECT_NAME())
      then
        Raise_application_error(-20000
                               ,'Invalid PACKAGE_NAME.VC02[''' || g_PACKAGE_NAME.VC02 || '''] for OBJECT_NAME[''' || Get_OBJECT_NAME() || '''] detected!');
      end if;
      */
      --
      --
      Check_OBJECT_DEPENDENCE();
      --
      --
      /*
      Session_NLS_Save();
      --
      --
      Init_Sequential_03();
      Init_Sequential_14();
      */
      --
      --
      g_PACKAGE_Initialized  := true;
      g_PACKAGE_Initializing := false;
      --
    end if;
    --
    -- For example, below are calls into functions they itself calls me
    --
    --
    --
    --Create_CFGKEYS4JOBS$AT();
    --
    --
    --Update_JOBS$AT();
    --
  end Init_PACKAGE;
  --
  --
  --
  procedure Check_OBJECT_DEPENDENCE is
  begin
    -- WWirns: For example check ORACLE-Version
    -- or internal version via "Get_OBJECT_VERSION$VC()" of other package or object types
    -- or if column of table exists
    -- and so on...
    null;
    --
  end Check_OBJECT_DEPENDENCE;
  --
  --
  --
  function Get_PACKAGE_ID return simple_integer deterministic is
  begin
    return C_PACKAGE_ID;
  end;
  --
  function Get_OBJECT_NAME return varchar2 deterministic is
  begin
    return $$plsql_unit_owner || '.' || $$plsql_unit;
  end;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic is
  begin
    return C_OBJECT_COPYRIGHT;
  end;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic is
  begin
    return C_OBJECT_VERSION;
  end;
  --
--
--
begin
  --
  --
  logger.log(p_text  => 'START'
            ,p_scope => Get_OBJECT_NAME() || '.begin'
             --
             );
  --
  --
  Init_PACKAGE();
  --
  --
  logger.log(p_text  => 'END'
            ,p_scope => Get_OBJECT_NAME() || '.begin'
             --
             );
  --
end PKG_SQL_SCRIPT;
/
  GRANT EXECUTE ON "DL_DBA"."PKG_SQL_SCRIPT" TO "DBA";
  GRANT EXECUTE ON "DL_DBA"."PKG_SQL_SCRIPT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_DBA"."PKG_SQL_SCRIPT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_DBA"."PKG_SQL_SCRIPT" TO "BIOSUPPORT";
