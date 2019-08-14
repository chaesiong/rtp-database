CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_DBA"."PKG_APEX_UTIL" is
  --
  --
  /*******************************************************************************
  ???


  Author    Date        Description
  --------  ----------  -------------------------------------------------------*
  WWirns    28.03.2018  Added
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
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0000';
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
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    28.03.2018  Script4Static_WS_Files:Added
  *******************************************************************************/
  --
  function Script4Static_WS_Files(p_WORKSPACE in varchar2
                                  --
                                  ) return clob is
    --
    type RT_FILE is record(
       FILE_NAME    varchar2(4000 char)
      ,MIME_TYPE    varchar2(4000 char)
      ,FILE_CHARSET varchar2(4000 char)
      ,FILE_CONTENT blob
      --
      );
    --
    v_Result             clob;
    v_ACTIVE_APEX_SCHEMA varchar2(30 char);
    v_security_group_id  number;
    v_C0                 sys_refcursor;
    v_R0                 RT_FILE;
    v_vc_Tmp             varchar2(32767 char);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    DBMS_LOB.createtemporary(v_Result
                            ,true);
    --
    --
    select t.TABLE_OWNER as ACTIVE_APEX_SCHEMA
      into v_ACTIVE_APEX_SCHEMA
      from ALL_SYNONYMS t
     where t.OWNER = 'PUBLIC'
       and t.SYNONYM_NAME = 'APEX_WORKSPACES';
    --
    begin
      select t.WORKSPACE_ID
        into v_security_group_id
        from APEX_WORKSPACES t
       where t.WORKSPACE not in ('INTERNAL'
                                ,'COM.ORACLE.APEX.REPOSITORY'
                                ,'COM.ORACLE.CUST.REPOSITORY'
                                 --
                                 )
         and t.WORKSPACE = upper(p_WORKSPACE);
    exception
      when NO_DATA_FOUND then
        Raise_application_error(-20000
                               ,'The workspace p_WORKSPACE[''' || p_WORKSPACE || '''] does not exist!');
    end;
    --
    wwv_flow_api.set_security_group_id(p_security_group_id => v_security_group_id);
    --
    DBMS_LOB.createtemporary(v_Result
                            ,true);
    --
    open v_C0 for '
select t.FILE_NAME
      ,t.MIME_TYPE
      ,t.FILE_CHARSET
      ,t.FILE_CONTENT
  from ' || v_ACTIVE_APEX_SCHEMA || '.WWV_FLOW_COMPANY_STATIC_FILES t
 where t.SECURITY_GROUP_ID = wwv_flow_api.get_security_group_id()
 order by t.FILE_NAME';
    --
    loop
      fetch v_C0
        into v_R0;
      exit when v_C0%notfound;
      --
      v_vc_Tmp := '
declare
  v_BLOB blob;
begin
  DBMS_LOB.createtemporary(v_BLOB
                          ,true);';
      --
      DBMS_LOB.append(v_Result
                     ,v_vc_Tmp);
      --
      --
      declare
        raw_Buffer raw(1024);
        i_Offset   integer := 1;
        i_Amount   integer := 1024;
      begin
        --
        --
        loop
          DBMS_LOB.read(v_R0.FILE_CONTENT
                       ,i_Amount
                       ,i_Offset
                       ,raw_Buffer);
          i_Offset := i_Offset + i_Amount;
          --
          --
          v_vc_Tmp := '
  DBMS_LOB.append(v_BLOB, HexToRaw(''' || RawToHex(raw_Buffer) || '''));';
          --
          DBMS_LOB.append(v_Result
                         ,v_vc_Tmp);
          --
        end loop;
        --
      exception
        when NO_DATA_FOUND then
          null;
          --
      end;
      --
      --
      v_vc_Tmp := '
  wwv_flow_api.create_workspace_static_file(p_file_name    => ''' || v_R0.FILE_NAME || '''
                                           ,p_mime_type    => ''' || v_R0.MIME_TYPE || '''
                                           ,p_file_charset => ''' || v_R0.FILE_CHARSET || '''
                                           ,p_file_content => v_BLOB
                                            --
                                            );
  commit;
  DBMS_LOB.freetemporary(v_BLOB);
  v_BLOB := null;'
                 --
                  || chr(13) || chr(10) || 'end;'
                 --
                  || chr(13) || chr(10) || '/'
                 --
                  || chr(13) || chr(10);
      --
      DBMS_LOB.append(v_Result
                     ,v_vc_Tmp);
      --
    end loop;
    --
    close v_C0;
    --
    --
    return v_Result;
    --
  end Script4Static_WS_Files;
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
end PKG_APEX_UTIL;
/
  GRANT EXECUTE ON "DL_DBA"."PKG_APEX_UTIL" TO PUBLIC;
  GRANT EXECUTE ON "DL_DBA"."PKG_APEX_UTIL" TO "DERMALOG_PROXY";
