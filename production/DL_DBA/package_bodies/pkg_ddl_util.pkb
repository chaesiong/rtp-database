CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_DBA"."PKG_DDL_UTIL" is
  --
  -- TODO: Write logger logs
  --
  /* TODO:
  select userenv('SCHEMAID'),t.*
    from user_tables t
  select * from  V$RESERVED_WORDS
  */
  --
  --
  /*******************************************************************************
  ???


  Author    Date        Description
  --------  ----------  -------------------------------------------------------*
  WWirns    09.02.2018  Added
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
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0028';
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
  * WWirns    04.07.2018  C_DBOPT_*:Added
  *******************************************************************************/
  --
  function C_DBOPT_PARALLEL_BACKUP_RECOVE return varchar2 deterministic is
  begin
    return 'Parallel backup and recovery';
  end;
  function C_DBOPT_PARALLEL_EXECUTION return varchar2 deterministic is
  begin
    return 'Parallel execution';
  end;
  function C_DBOPT_PARALLEL_LOAD return varchar2 deterministic is
  begin
    return 'Parallel load';
  end;
  function C_DBOPT_PARTITIONING return varchar2 deterministic is
  begin
    return 'Partitioning';
  end;
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
  * WWirns    04.07.2018  Is_DB_Option:Added
  *******************************************************************************/
  --
  function Is_DB_Option_(p_DBOPT in varchar2
                         --
                         ) return pls_integer is
    --
    v_Result pls_integer;
    --
  begin
    --
    --
    select 1
      into v_Result
      from V$OPTION t
     where upper(t.PARAMETER) = upper(p_DBOPT)
       and t.VALUE = 'TRUE';
    --
    return v_Result;
    --
  exception
    when NO_DATA_FOUND then
      return 0;
      --
  end Is_DB_Option_;
  --
  function Is_DB_Option(p_DBOPT in varchar2
                        --
                        ) return boolean is
    --
  begin
    --
    --
    return sys.diutil.int_to_bool(Is_DB_Option_(p_DBOPT));
    --
  end Is_DB_Option;
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
  * WWirns    04.07.2018  Is_Parallel_Execution:Added
  *******************************************************************************/
  --
  function Is_Parallel_Execution_ return pls_integer is
  begin
    --
    return Is_DB_Option_(C_DBOPT_PARALLEL_EXECUTION()
                         --
                         );
    --
  end Is_Parallel_Execution_;
  --
  function Is_Parallel_Execution return boolean is
    --
  begin
    --
    --
    return sys.diutil.int_to_bool(Is_Parallel_Execution_());
    --
  end Is_Parallel_Execution;
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
  * WWirns    04.07.2018  Is_Partitioning:Added
  *******************************************************************************/
  --
  function Is_Partitioning_ return pls_integer is
  begin
    --
    return Is_DB_Option_(C_DBOPT_PARTITIONING()
                         --
                         );
    --
  end Is_Partitioning_;
  --
  function Is_Partitioning return boolean is
    --
  begin
    --
    --
    return sys.diutil.int_to_bool(Is_Partitioning_());
    --
  end Is_Partitioning;
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
  * WWirns    16.02.2018  Check_Tablespace:Added
  *******************************************************************************/
  --
  procedure Check_Tablespace(p_TBLSPCS in DL_COMMON.VT_DB_TBLSPC
                             --
                             ) is
    --
    v_vc_Tmp varchar2(32767 char);
    i        pls_integer;
    --
  begin
    --
    --
    if (p_TBLSPCS is null)
    then
      Raise_application_error(-20000
                             ,'The argument p_TBLSPCS must be not null!');
    end if;
    --
    --
    i := p_TBLSPCS.first;
    while (i is not null)
    loop
      begin
        -- Accessible tablespaces
        select t.TABLESPACE_NAME
          into v_vc_Tmp
          from USER_TABLESPACES t
         where t.TABLESPACE_NAME = p_TBLSPCS(i).TBLSPC_NAME;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'Tablespace p_TBLSPCS(i).TBLSPC_NAME[''' || p_TBLSPCS(i).TBLSPC_NAME || '''] is not accessible or does not exist!');
      end;
      i := p_TBLSPCS.next(i);
    end loop;
    --
  end Check_Tablespace;
  --
  procedure Check_Tablespace(p_TBLSPC in DL_COMMON.OT_DB_TBLSPC
                             --
                             ) is
    --
  begin
    --
    --
    Check_Tablespace(p_TBLSPCS => DL_COMMON.VT_DB_TBLSPC(p_TBLSPC));
    --
  end Check_Tablespace;
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
  * WWirns    19.02.2018  Cycle_TBLSPC_IDX:Added
  *******************************************************************************/
  --
  function Cycle_TBLSPC_IDX(p_TBLSPCS  in DL_COMMON.VT_DB_TBLSPC
                           ,p_Curr_IDX in pls_integer
                            --
                            ) return pls_integer is
    --
    v_Result pls_integer;
    --
  begin
    --
    v_Result := p_TBLSPCS.next(p_Curr_IDX);
    if (v_Result is null)
    then
      v_Result := p_TBLSPCS.first();
    end if;
    --
    return v_Result;
    --
  end Cycle_TBLSPC_IDX;
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
  * WWirns    16.02.2018  Check_Tablespace:Added
  *******************************************************************************/
  --
  procedure Execute_Stmt(p_STMT in varchar2
                         --
                         ) is
  begin
    --dbms_output.put_line(p_STMT);
    execute immediate p_STMT;
  exception
    when others then
      Raise_application_error(-20000
                             ,'p_STMT[''' || p_STMT || '''] raises:' || sqlerrm);
  end Execute_Stmt;
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
  * WWirns    12.02.2018  Move_Table2TBLSPC$AT:Added
  * WWirns    19.02.2018  Move_Table2TBLSPC$AT:Add logger
  * WWirns    19.02.2018  Move_Table2TBLSPC$AT:Add overload for DL_COMMON.OT_DB_TBLSPC
  * WWirns    26.02.2018  Do not work on TEMPORARY or SECONDARY db-objects
  *******************************************************************************/
  --
  procedure Move_Table2TBLSPC$AT(p_TBLSPCS             in DL_COMMON.VT_DB_TBLSPC
                                ,p_TBLS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                                ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_INCULDE_PARTITIONED in pls_integer default 1
                                 --
                                 ) is
    --
    pragma autonomous_transaction;
    --
    v_LOG_Scope logger_logs.scope%type := Get_OBJECT_NAME() || '.Move_Table2TBLSPC$AT';
    --v_LOG_Params logger.tab_param;
    --
    v_TBLSPC_IDX pls_integer;
    --
  begin
    --
    --
    /*
    logger.append_param(p_params => v_LOG_Params
                       ,p_name   => 'p_TBLSPC_NAME'
                       ,p_val    => p_TBLSPC_NAME
                        --
                        );
    --
    logger.append_param(p_params => v_LOG_Params
                       ,p_name   => 'p_TBLS_OF_OWNER.OBJ_OWNER'
                       ,p_val    => p_TBLS_OF_OWNER.OBJ_OWNER
                        --
                        );
    */
    --
    logger.log(p_text  => 'START'
              ,p_scope => v_LOG_Scope
               --,p_extra  => null
               --,p_params => v_LOG_Params
               --
               );
    --
    --
    Check_Tablespace(p_TBLSPCS);
    --
    --
    if (p_TBLS_OF_OWNER is null and p_ONLY_TBLS is null)
    then
      Raise_application_error(-20000
                             ,'Either argument p_TBLS_OF_OWNER or p_ONLY_TBLS must be not null!');
    end if;
    --
    --
    v_TBLSPC_IDX := null;
    --
    for R0 in (
               --
               select 'alter table "' || t.OWNER || '"."' || t.TABLE_NAME || '" move tablespace ' || ':TBLSPC_NAME' as STMT
                 from ALL_TABLES t
                where t.IOT_TYPE IS NULL
                  and t.PARTITIONED = 'NO'
                  and t.DROPPED = 'NO'
                  and t.TEMPORARY = 'N'
                  and t.SECONDARY = 'N'
                  and not exists (select null
                         from table(p_TBLSPCS) ts
                        where ts.TBLSPC_NAME = t.TABLESPACE_NAME
                       --
                       )
                  and (
                      --
                       (
                       --
                        t.OWNER = p_TBLS_OF_OWNER.OBJ_OWNER
                       --
                        and t.TABLE_NAME not like 'BIN$%'
                       --
                        and p_ONLY_TBLS is null
                       --
                       )
                      --
                       or exists (select null
                                    from table(p_ONLY_TBLS) e0
                                   where nvl(e0.OBJ_OWNER
                                            ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                     and e0.OBJ_NAME = t.TABLE_NAME
                                  --
                                  )
                      --
                      )
                  and not exists (select null
                         from table(p_EXCL_TBLS) e
                        where nvl(e.OBJ_OWNER
                                 ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                          and e.OBJ_NAME = t.TABLE_NAME
                       --
                       )
               --
               )
    loop
      --
      v_TBLSPC_IDX := Cycle_TBLSPC_IDX(p_TBLSPCS
                                      ,v_TBLSPC_IDX);
      --
      R0.STMT := replace(R0.STMT
                        ,':TBLSPC_NAME'
                        ,p_TBLSPCS(v_TBLSPC_IDX).TBLSPC_NAME
                         --
                         );
      --
      logger.log_permanent(p_text  => 'Execute_Stmt'
                          ,p_scope => v_LOG_Scope
                          ,p_extra => R0.STMT
                           --
                           );
      --
      Execute_Stmt(R0.STMT);
      --
    end loop;
    --
    --
    if (nvl(p_INCULDE_PARTITIONED
           ,1) != 0)
    then
      --
      --
      for R1 in (
                 --
                 select 'alter table "' || t1.OWNER || '"."' || t1.TABLE_NAME || '"'
                         --
                          || case
                            when (t1.INTERVAL is not null) then
                             ' set store in(' || (select LISTAGG(s0.TBLSPC_NAME
                                                                ,',' on overflow truncate '' without count) within group(order by s0.TBLSPC_NAME) as TBLSPC_LIST
                                                    from table(p_TBLSPCS) s0) || ')'
                            else
                             ' modify default attributes tablespace ' || p_TBLSPCS(1).TBLSPC_NAME
                          end as STMT
                   from ALL_TABLES t
                  inner join ALL_PART_TABLES t1
                     on (t.OWNER = t1.OWNER and t.TABLE_NAME = t1.TABLE_NAME)
                  where t.PARTITIONED = 'YES'
                    and t.DROPPED = 'NO'
                    and t.TEMPORARY = 'N'
                    and t.SECONDARY = 'N'
                    and not exists (select null
                           from table(p_TBLSPCS) ts
                          where ts.TBLSPC_NAME = t1.DEF_TABLESPACE_NAME
                         --
                         )
                    and (
                        --
                         (
                         --
                          t.OWNER = p_TBLS_OF_OWNER.OBJ_OWNER
                         --
                          and t1.TABLE_NAME not like 'BIN$%'
                         --
                          and p_ONLY_TBLS is null
                         --
                         )
                        --
                         or exists (select null
                                      from table(p_ONLY_TBLS) e0
                                     where nvl(e0.OBJ_OWNER
                                              ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.OWNER
                                       and e0.OBJ_NAME = t1.TABLE_NAME
                                    --
                                    )
                        --
                        )
                    and not exists (select null
                           from table(p_EXCL_TBLS) e
                          where nvl(e.OBJ_OWNER
                                   ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.OWNER
                            and e.OBJ_NAME = t1.TABLE_NAME
                         --
                         )
                 --
                 )
      loop
        --
        --
        logger.log_permanent(p_text  => 'Execute_Stmt'
                            ,p_scope => v_LOG_Scope
                            ,p_extra => R1.STMT
                             --
                             );
        --
        Execute_Stmt(R1.STMT);
        --
      end loop;
      --
      --
      v_TBLSPC_IDX := null;
      --
      for R2 in (
                 --
                 select 'alter table "' || t1.TABLE_OWNER || '"."' || t1.TABLE_NAME || '" move partition "' || t1.PARTITION_NAME || '" tablespace ' || ':TBLSPC_NAME' as STMT
                   from ALL_TABLES t
                  inner join ALL_TAB_PARTITIONS t1
                     on (t.OWNER = t1.TABLE_OWNER and t.TABLE_NAME = t1.TABLE_NAME)
                  where t.PARTITIONED = 'YES'
                    and t.DROPPED = 'NO'
                    and t.TEMPORARY = 'N'
                    and t.SECONDARY = 'N'
                    and not exists (select null
                           from table(p_TBLSPCS) ts
                          where ts.TBLSPC_NAME = t1.TABLESPACE_NAME
                         --
                         )
                    and (
                        --
                         (
                         --
                          t1.TABLE_OWNER = p_TBLS_OF_OWNER.OBJ_OWNER
                         --
                          and t1.TABLE_NAME not like 'BIN$%'
                         --
                          and p_ONLY_TBLS is null
                         --
                         )
                        --
                         or exists (select null
                                      from table(p_ONLY_TBLS) e0
                                     where nvl(e0.OBJ_OWNER
                                              ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                       and e0.OBJ_NAME = t1.TABLE_NAME
                                    --
                                    )
                        --
                        )
                    and not exists (select null
                           from table(p_EXCL_TBLS) e
                          where nvl(e.OBJ_OWNER
                                   ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                            and e.OBJ_NAME = t1.TABLE_NAME
                         --
                         )
                 --
                 )
      loop
        --
        v_TBLSPC_IDX := Cycle_TBLSPC_IDX(p_TBLSPCS
                                        ,v_TBLSPC_IDX);
        --
        R2.STMT := replace(R2.STMT
                          ,':TBLSPC_NAME'
                          ,p_TBLSPCS(v_TBLSPC_IDX).TBLSPC_NAME
                           --
                           );
        --
        --
        logger.log_permanent(p_text  => 'Execute_Stmt'
                            ,p_scope => v_LOG_Scope
                            ,p_extra => R2.STMT
                             --
                             );
        --
        Execute_Stmt(R2.STMT);
        --
      end loop;
      --
    end if;
    --
    --
    commit;
    --
    --
    logger.log(p_text  => 'RETURN'
              ,p_scope => v_LOG_Scope
               --
               );
    --
  exception
    when others then
      --
      --
      logger.log_error(p_text  => 'Unhandled Exception'
                      ,p_scope => v_LOG_Scope
                       --
                       );
      --
      raise;
      --
  end Move_Table2TBLSPC$AT;
  --
  procedure Move_Table2TBLSPC$AT(p_TBLSPC              in DL_COMMON.OT_DB_TBLSPC
                                ,p_TBLS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                                ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_INCULDE_PARTITIONED in pls_integer default 1
                                 --
                                 ) is
    --
  begin
    --
    --
    Move_Table2TBLSPC$AT(DL_COMMON.VT_DB_TBLSPC(p_TBLSPC)
                        ,p_TBLS_OF_OWNER
                        ,p_ONLY_TBLS
                        ,p_EXCL_TBLS
                        ,p_INCULDE_PARTITIONED
                         --
                         );
    --
  end Move_Table2TBLSPC$AT;
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
  * WWirns    15.02.2018  Move_LOB2TBLSPC$AT:Added
  * WWirns    19.02.2018  Move_LOB2TBLSPC$AT:Add logger
  * WWirns    19.02.2018  Move_LOB2TBLSPC$AT:Add overload for DL_COMMON.OT_DB_TBLSPC
  *******************************************************************************/
  --
  procedure Move_LOB2TBLSPC$AT(p_TBLSPCS             in DL_COMMON.VT_DB_TBLSPC
                              ,p_TBLS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                              ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                              ,p_ONLY_TAB_COLS       in DL_COMMON.VT_DB_TAB_COL default null
                              ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                              ,p_EXCL_TAB_COLS       in DL_COMMON.VT_DB_TAB_COL default null
                              ,p_INCULDE_PARTITIONED in pls_integer default 1
                               --
                               ) is
    --
    pragma autonomous_transaction;
    --
    v_LOG_Scope logger_logs.scope%type := Get_OBJECT_NAME() || '.Move_LOB2TBLSPC$AT';
    --v_LOG_Params logger.tab_param;
    --
    v_TBLSPC_IDX pls_integer;
    --
  begin
    --
    --
    /*
    logger.append_param(p_params => v_LOG_Params
                       ,p_name   => 'p_TBLSPC_NAME'
                       ,p_val    => p_TBLSPC_NAME
                        --
                        );
    */
    --
    logger.log(p_text  => 'START'
              ,p_scope => v_LOG_Scope
               --,p_extra  => null
               --,p_params => v_LOG_Params
               --
               );
    --
    --
    Check_Tablespace(p_TBLSPCS);
    --
    --
    if (p_TBLS_OF_OWNER is null and p_ONLY_TBLS is null and p_ONLY_TAB_COLS is null)
    then
      Raise_application_error(-20000
                             ,'Either argument p_TBLS_OF_OWNER or p_ONLY_TBLS or p_ONLY_TAB_COLS must be not null!');
    end if;
    --
    --
    v_TBLSPC_IDX := null;
    --
    for R0 in (
               --
               select 'alter table "' || t.OWNER || '"."' || t.TABLE_NAME || '" move lob("' || t.COLUMN_NAME || '") store as (tablespace ' || ':TBLSPC_NAME' || ')' as STMT
                 from ALL_LOBS t
                where t.PARTITIONED = 'NO'
                  and not exists (select null
                         from table(p_TBLSPCS) ts
                        where ts.TBLSPC_NAME = t.TABLESPACE_NAME
                       --
                       )
                  and (
                      --
                       (
                       --
                        t.OWNER = p_TBLS_OF_OWNER.OBJ_OWNER
                       --
                        and t.TABLE_NAME not like 'BIN$%'
                       --
                        and p_ONLY_TBLS is null
                       --
                        and p_ONLY_TAB_COLS is null
                       --
                       )
                      --
                       or (
                       --
                        exists (select null
                                     from table(p_ONLY_TBLS) e0
                                    where nvl(e0.OBJ_OWNER
                                             ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                      and e0.OBJ_NAME = t.TABLE_NAME
                                   --
                                   )
                       --
                        and p_ONLY_TAB_COLS is null
                       --
                       )
                      --
                       or exists (select null
                                    from table(p_ONLY_TAB_COLS) e1
                                   where nvl(e1.OBJ_OWNER
                                            ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                     and e1.OBJ_NAME = t.TABLE_NAME
                                     and e1.COL_NAME = t.COLUMN_NAME
                                  --
                                  )
                      --
                      )
                  and not (
                       --
                        exists (select null
                                     from table(p_EXCL_TBLS) e2
                                    where nvl(e2.OBJ_OWNER
                                             ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                      and e2.OBJ_NAME = t.TABLE_NAME
                                   --
                                   )
                       --
                        or exists (select null
                                        from table(p_EXCL_TAB_COLS) e3
                                       where nvl(e3.OBJ_OWNER
                                                ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                         and e3.OBJ_NAME = t.TABLE_NAME
                                         and e3.COL_NAME = t.COLUMN_NAME
                                      --
                                      )
                       --
                       )
               --
               )
    loop
      --
      v_TBLSPC_IDX := Cycle_TBLSPC_IDX(p_TBLSPCS
                                      ,v_TBLSPC_IDX);
      --
      R0.STMT := replace(R0.STMT
                        ,':TBLSPC_NAME'
                        ,p_TBLSPCS(v_TBLSPC_IDX).TBLSPC_NAME
                         --
                         );
      --
      logger.log_permanent(p_text  => 'Execute_Stmt'
                          ,p_scope => v_LOG_Scope
                          ,p_extra => R0.STMT
                           --
                           );
      --
      Execute_Stmt(R0.STMT);
      --
    end loop;
    --
    --
    if (nvl(p_INCULDE_PARTITIONED
           ,1) != 0)
    then
      --
      --
      for R1 in (
                 --
                 select 'alter table "' || t1.TABLE_OWNER || '"."' || t1.TABLE_NAME || '" modify default attributes lob("' || t1.COLUMN_NAME || '") (tablespace ' || p_TBLSPCS(1).TBLSPC_NAME || ')' as STMT
                   from ALL_PART_LOBS t1
                  inner join ALL_LOBS t
                     on (t1.TABLE_OWNER = t.OWNER and t1.TABLE_NAME = t.TABLE_NAME and t1.COLUMN_NAME = t.COLUMN_NAME)
                  where t.PARTITIONED = 'YES'
                    and not exists (select null
                           from table(p_TBLSPCS) ts
                          where ts.TBLSPC_NAME = t1.DEF_TABLESPACE_NAME
                         --
                         )
                    and (
                        --
                         (
                         --
                          t1.TABLE_OWNER = p_TBLS_OF_OWNER.OBJ_OWNER
                         --
                          and t1.TABLE_NAME not like 'BIN$%'
                         --
                          and p_ONLY_TBLS is null
                         --
                          and p_ONLY_TAB_COLS is null
                         --
                         )
                        --
                         or (
                         --
                          exists (select null
                                       from table(p_ONLY_TBLS) e0
                                      where nvl(e0.OBJ_OWNER
                                               ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                        and e0.OBJ_NAME = t1.TABLE_NAME
                                     --
                                     )
                         --
                          and p_ONLY_TAB_COLS is null
                         --
                         )
                        --
                         or exists (select null
                                      from table(p_ONLY_TAB_COLS) e1
                                     where nvl(e1.OBJ_OWNER
                                              ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                       and e1.OBJ_NAME = t1.TABLE_NAME
                                       and e1.COL_NAME = t1.COLUMN_NAME
                                    --
                                    )
                        --
                        )
                    and not (
                         --
                          exists (select null
                                       from table(p_EXCL_TBLS) e2
                                      where nvl(e2.OBJ_OWNER
                                               ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                        and e2.OBJ_NAME = t1.TABLE_NAME
                                     --
                                     )
                         --
                          or exists (select null
                                          from table(p_EXCL_TAB_COLS) e3
                                         where nvl(e3.OBJ_OWNER
                                                  ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                           and e3.OBJ_NAME = t1.TABLE_NAME
                                           and e3.COL_NAME = t1.COLUMN_NAME
                                        --
                                        )
                         --
                         )
                 --
                 )
      loop
        --
        --
        logger.log_permanent(p_text  => 'Execute_Stmt'
                            ,p_scope => v_LOG_Scope
                            ,p_extra => R1.STMT
                             --
                             );
        --
        Execute_Stmt(R1.STMT);
        --
      end loop;
      --
      --
      v_TBLSPC_IDX := null;
      --
      for R2 in (
                 --
                 select 'alter table "' || t1.TABLE_OWNER || '"."' || t1.TABLE_NAME || '" move partition "' || t1.PARTITION_NAME || '" lob ("' || t1.COLUMN_NAME || '") store as (tablespace ' || ':TBLSPC_NAME' || ')' as STMT
                   from ALL_LOB_PARTITIONS t1
                  inner join ALL_LOBS t
                     on (t1.TABLE_OWNER = t.OWNER and t1.TABLE_NAME = t.TABLE_NAME and t1.COLUMN_NAME = t.COLUMN_NAME)
                  where t.PARTITIONED = 'YES'
                    and not exists (select null
                           from table(p_TBLSPCS) ts
                          where ts.TBLSPC_NAME = t1.TABLESPACE_NAME
                         --
                         )
                    and (
                        --
                         (
                         --
                          t1.TABLE_OWNER = p_TBLS_OF_OWNER.OBJ_OWNER
                         --
                          and t1.TABLE_NAME not like 'BIN$%'
                         --
                          and p_ONLY_TBLS is null
                         --
                          and p_ONLY_TAB_COLS is null
                         --
                         )
                        --
                         or (
                         --
                          exists (select null
                                       from table(p_ONLY_TBLS) e0
                                      where nvl(e0.OBJ_OWNER
                                               ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                        and e0.OBJ_NAME = t1.TABLE_NAME
                                     --
                                     )
                         --
                          and p_ONLY_TAB_COLS is null
                         --
                         )
                        --
                         or exists (select null
                                      from table(p_ONLY_TAB_COLS) e1
                                     where nvl(e1.OBJ_OWNER
                                              ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                       and e1.OBJ_NAME = t1.TABLE_NAME
                                       and e1.COL_NAME = t1.COLUMN_NAME
                                    --
                                    )
                        --
                        )
                    and not (
                         --
                          exists (select null
                                       from table(p_EXCL_TBLS) e2
                                      where nvl(e2.OBJ_OWNER
                                               ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                        and e2.OBJ_NAME = t1.TABLE_NAME
                                     --
                                     )
                         --
                          or exists (select null
                                          from table(p_EXCL_TAB_COLS) e3
                                         where nvl(e3.OBJ_OWNER
                                                  ,p_TBLS_OF_OWNER.OBJ_OWNER) = t1.TABLE_OWNER
                                           and e3.OBJ_NAME = t1.TABLE_NAME
                                           and e3.COL_NAME = t1.COLUMN_NAME
                                        --
                                        )
                         --
                         )
                 --
                 )
      loop
        --
        v_TBLSPC_IDX := Cycle_TBLSPC_IDX(p_TBLSPCS
                                        ,v_TBLSPC_IDX);
        --
        R2.STMT := replace(R2.STMT
                          ,':TBLSPC_NAME'
                          ,p_TBLSPCS(v_TBLSPC_IDX).TBLSPC_NAME
                           --
                           );
        --
        logger.log_permanent(p_text  => 'Execute_Stmt'
                            ,p_scope => v_LOG_Scope
                            ,p_extra => R2.STMT
                             --
                             );
        --
        Execute_Stmt(R2.STMT);
        --
      end loop;
      --
    end if;
    --
    --
    commit;
    --
    --
    logger.log(p_text  => 'RETURN'
              ,p_scope => v_LOG_Scope
               --
               );
    --
  exception
    when others then
      --
      --
      logger.log_error(p_text  => 'Unhandled Exception'
                      ,p_scope => v_LOG_Scope
                       --
                       );
      --
      raise;
      --
  end Move_LOB2TBLSPC$AT;
  --
  procedure Move_LOB2TBLSPC$AT(p_TBLSPC              in DL_COMMON.OT_DB_TBLSPC
                              ,p_TBLS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                              ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                              ,p_ONLY_TAB_COLS       in DL_COMMON.VT_DB_TAB_COL default null
                              ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                              ,p_EXCL_TAB_COLS       in DL_COMMON.VT_DB_TAB_COL default null
                              ,p_INCULDE_PARTITIONED in pls_integer default 1
                               --
                               ) is
    --
  begin
    --
    --
    Move_LOB2TBLSPC$AT(DL_COMMON.VT_DB_TBLSPC(p_TBLSPC)
                      ,p_TBLS_OF_OWNER
                      ,p_ONLY_TBLS
                      ,p_ONLY_TAB_COLS
                      ,p_EXCL_TBLS
                      ,p_EXCL_TAB_COLS
                      ,p_INCULDE_PARTITIONED
                       --
                       );
    --
  end Move_LOB2TBLSPC$AT;
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
  * WWirns    15.02.2018  Move_Index2TBLSPC$AT:Added
  * WWirns    19.02.2018  Move_Index2TBLSPC$AT:Add logger
  * WWirns    19.02.2018  Move_Index2TBLSPC$AT:Add overload for DL_COMMON.OT_DB_TBLSPC
  * WWirns    26.02.2018  Do not work on TEMPORARY or SECONDARY db-objects
  *******************************************************************************/
  --
  procedure Move_Index2TBLSPC$AT(p_TBLSPCS             in DL_COMMON.VT_DB_TBLSPC
                                ,p_IDXS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                                ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_ONLY_IDXS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_IDXS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_INCULDE_PARTITIONED in pls_integer default 1
                                 --
                                 ) is
    --
    pragma autonomous_transaction;
    --
    v_LOG_Scope logger_logs.scope%type := Get_OBJECT_NAME() || '.Move_Index2TBLSPC$AT';
    --v_LOG_Params logger.tab_param;
    --
    v_TBLSPC_IDX pls_integer;
    --
  begin
    --
    --
    /*
    logger.append_param(p_params => v_LOG_Params
                       ,p_name   => 'p_TBLSPC_NAME'
                       ,p_val    => p_TBLSPC_NAME
                        --
                        );
    */
    --
    logger.log(p_text  => 'START'
              ,p_scope => v_LOG_Scope
               --,p_extra  => null
               --,p_params => v_LOG_Params
               --
               );
    --
    --
    Check_Tablespace(p_TBLSPCS);
    --
    --
    if (p_IDXS_OF_OWNER is null and p_ONLY_TBLS is null and p_ONLY_IDXS is null)
    then
      Raise_application_error(-20000
                             ,'Either argument p_IDXS_OF_OWNER or p_ONLY_TBLS or p_ONLY_IDXS must be not null!');
    end if;
    --
    --
    v_TBLSPC_IDX := null;
    --
    for R0 in (
               --
               select 'alter index "' || t.OWNER || '"."' || t.INDEX_NAME || '" rebuild tablespace ' || ':TBLSPC_NAME' as STMT
                 from ALL_INDEXES t
                where t.INDEX_TYPE NOT IN ('IOT - TOP')
                  and t.PARTITIONED = 'NO'
                  and t.DROPPED = 'NO'
                  and t.TEMPORARY = 'N'
                  and t.SECONDARY = 'N'
                  and t.INDEX_TYPE not in ('LOB')
                  and not exists (select null
                         from table(p_TBLSPCS) ts
                        where ts.TBLSPC_NAME = t.TABLESPACE_NAME
                       --
                       )
                  and (
                      --
                       (
                       --
                        t.OWNER = p_IDXS_OF_OWNER.OBJ_OWNER
                       --
                        and t.INDEX_NAME not like 'BIN$%'
                       --
                        and p_ONLY_TBLS is null
                       --
                        and p_ONLY_IDXS is null
                       --
                       )
                      --
                       or (
                       --
                        exists (select null
                                     from table(p_ONLY_TBLS) e1
                                    where nvl(e1.OBJ_OWNER
                                             ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                      and e1.OBJ_NAME = t.TABLE_NAME
                                   --
                                   )
                       --
                        and p_ONLY_IDXS is null
                       --
                       )
                      --
                       or (
                       --
                        exists (select null
                                     from table(p_ONLY_IDXS) e0
                                    where nvl(e0.OBJ_OWNER
                                             ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                      and e0.OBJ_NAME = t.INDEX_NAME
                                   --
                                   )
                       --
                       )
                      --
                      )
                  and not (
                       --
                        exists (select null
                                     from table(p_EXCL_IDXS) e2
                                    where nvl(e2.OBJ_OWNER
                                             ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                      and e2.OBJ_NAME = t.INDEX_NAME
                                   --
                                   )
                       --
                        or exists (select null
                                        from table(p_EXCL_TBLS) e3
                                       where nvl(e3.OBJ_OWNER
                                                ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                         and e3.OBJ_NAME = t.TABLE_NAME
                                      --
                                      )
                       --
                       )
               --
               )
    loop
      --
      v_TBLSPC_IDX := Cycle_TBLSPC_IDX(p_TBLSPCS
                                      ,v_TBLSPC_IDX);
      --
      R0.STMT := replace(R0.STMT
                        ,':TBLSPC_NAME'
                        ,p_TBLSPCS(v_TBLSPC_IDX).TBLSPC_NAME
                         --
                         );
      --
      logger.log_permanent(p_text  => 'Execute_Stmt'
                          ,p_scope => v_LOG_Scope
                          ,p_extra => R0.STMT
                           --
                           );
      --
      Execute_Stmt(R0.STMT);
      --
    end loop;
    --
    --
    if (nvl(p_INCULDE_PARTITIONED
           ,1) != 0)
    then
      --
      --
      for R1 in (
                 --
                 select 'alter index "' || t.OWNER || '"."' || t.INDEX_NAME || '" modify default attributes tablespace ' || p_TBLSPCS(1).TBLSPC_NAME as STMT
                   from ALL_INDEXES t
                  inner join ALL_PART_INDEXES t1
                     on (t.OWNER = t1.OWNER and t.INDEX_NAME = t1.INDEX_NAME)
                  where t.PARTITIONED = 'YES'
                    and t.DROPPED = 'NO'
                    and t.TEMPORARY = 'N'
                    and t.SECONDARY = 'N'
                    and t.INDEX_TYPE not in ('LOB')
                    and not exists (select null
                           from table(p_TBLSPCS) ts
                          where ts.TBLSPC_NAME = t1.DEF_TABLESPACE_NAME
                         --
                         )
                    and (
                        --
                         (
                         --
                          t.OWNER = p_IDXS_OF_OWNER.OBJ_OWNER
                         --
                          and t.INDEX_NAME not like 'BIN$%'
                         --
                          and p_ONLY_TBLS is null
                         --
                          and p_ONLY_IDXS is null
                         --
                         )
                        --
                         or (
                         --
                          exists (select null
                                       from table(p_ONLY_TBLS) e1
                                      where nvl(e1.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                        and e1.OBJ_NAME = t.TABLE_NAME
                                     --
                                     )
                         --
                          and p_ONLY_IDXS is null
                         --
                         )
                        --
                         or (
                         --
                          exists (select null
                                       from table(p_ONLY_IDXS) e0
                                      where nvl(e0.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                        and e0.OBJ_NAME = t.INDEX_NAME
                                     --
                                     )
                         --
                         )
                        --
                        )
                    and not (
                         --
                          exists (select null
                                       from table(p_EXCL_IDXS) e2
                                      where nvl(e2.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                        and e2.OBJ_NAME = t.INDEX_NAME
                                     --
                                     )
                         --
                          or exists (select null
                                          from table(p_EXCL_TBLS) e3
                                         where nvl(e3.OBJ_OWNER
                                                  ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                           and e3.OBJ_NAME = t.TABLE_NAME
                                        --
                                        )
                         --
                         )
                 --
                 )
      loop
        --
        --
        logger.log_permanent(p_text  => 'Execute_Stmt'
                            ,p_scope => v_LOG_Scope
                            ,p_extra => R1.STMT
                             --
                             );
        --
        Execute_Stmt(R1.STMT);
        --
      end loop;
      --
      --
      v_TBLSPC_IDX := null;
      --
      for R2 in (
                 --
                 select 'alter index "' || t.OWNER || '"."' || t.INDEX_NAME || '" rebuild partition "' || t1.PARTITION_NAME || '" tablespace ' || ':TBLSPC_NAME' as STMT
                   from ALL_INDEXES t
                  inner join ALL_IND_PARTITIONS t1
                     on (t.OWNER = t1.INDEX_OWNER and t.INDEX_NAME = t1.INDEX_NAME)
                  where t.PARTITIONED = 'YES'
                    and t.DROPPED = 'NO'
                    and t.TEMPORARY = 'N'
                    and t.SECONDARY = 'N'
                    and t.INDEX_TYPE not in ('LOB')
                    and not exists (select null
                           from table(p_TBLSPCS) ts
                          where ts.TBLSPC_NAME = t1.TABLESPACE_NAME
                         --
                         )
                    and (
                        --
                         (
                         --
                          t.OWNER = p_IDXS_OF_OWNER.OBJ_OWNER
                         --
                          and t.INDEX_NAME not like 'BIN$%'
                         --
                          and t1.PARTITION_NAME not like 'BIN$%'
                         --
                          and p_ONLY_TBLS is null
                         --
                          and p_ONLY_IDXS is null
                         --
                         )
                        --
                         or (
                         --
                          exists (select null
                                       from table(p_ONLY_TBLS) e1
                                      where nvl(e1.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                        and e1.OBJ_NAME = t.TABLE_NAME
                                     --
                                     )
                         --
                          and p_ONLY_IDXS is null
                         --
                         )
                        --
                         or (
                         --
                          exists (select null
                                       from table(p_ONLY_IDXS) e0
                                      where nvl(e0.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                        and e0.OBJ_NAME = t.INDEX_NAME
                                     --
                                     )
                         --
                         )
                        --
                        )
                    and not (
                         --
                          exists (select null
                                       from table(p_EXCL_IDXS) e2
                                      where nvl(e2.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                        and e2.OBJ_NAME = t.INDEX_NAME
                                     --
                                     )
                         --
                          or exists (select null
                                          from table(p_EXCL_TBLS) e3
                                         where nvl(e3.OBJ_OWNER
                                                  ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                           and e3.OBJ_NAME = t.TABLE_NAME
                                        --
                                        )
                         --
                         )
                 --
                 )
      loop
        --
        v_TBLSPC_IDX := Cycle_TBLSPC_IDX(p_TBLSPCS
                                        ,v_TBLSPC_IDX);
        --
        R2.STMT := replace(R2.STMT
                          ,':TBLSPC_NAME'
                          ,p_TBLSPCS(v_TBLSPC_IDX).TBLSPC_NAME
                           --
                           );
        --
        logger.log_permanent(p_text  => 'Execute_Stmt'
                            ,p_scope => v_LOG_Scope
                            ,p_extra => R2.STMT
                             --
                             );
        --
        Execute_Stmt(R2.STMT);
        --
      end loop;
      --
    end if;
    --
    --
    commit;
    --
    --
    logger.log(p_text  => 'RETURN'
              ,p_scope => v_LOG_Scope
               --
               );
    --
  exception
    when others then
      --
      --
      logger.log_error(p_text  => 'Unhandled Exception'
                      ,p_scope => v_LOG_Scope
                       --
                       );
      --
      raise;
      --
  end Move_Index2TBLSPC$AT;
  --
  procedure Move_Index2TBLSPC$AT(p_TBLSPC              in DL_COMMON.OT_DB_TBLSPC
                                ,p_IDXS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                                ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_ONLY_IDXS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_IDXS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_INCULDE_PARTITIONED in pls_integer default 1
                                 --
                                 ) is
    --
  begin
    --
    --
    Move_Index2TBLSPC$AT(DL_COMMON.VT_DB_TBLSPC(p_TBLSPC)
                        ,p_IDXS_OF_OWNER
                        ,p_ONLY_TBLS
                        ,p_ONLY_IDXS
                        ,p_EXCL_TBLS
                        ,p_EXCL_IDXS
                        ,p_INCULDE_PARTITIONED
                         --
                         );
    --
  end Move_Index2TBLSPC$AT;
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
  * WWirns    16.02.2018  Rebuild_Indexes$AT:Added
  * WWirns    19.02.2018  Rebuild_Indexes$AT:Add logger
  *******************************************************************************/
  --
  procedure Rebuild_Indexes$AT(p_IDXS_OF_OWNER        in DL_COMMON.OT_DB_OWNER default null
                              ,p_ONLY_TBLS            in DL_COMMON.VT_DB_OBJECT default null
                              ,p_ONLY_IDXS            in DL_COMMON.VT_DB_OBJECT default null
                              ,p_EXCL_TBLS            in DL_COMMON.VT_DB_OBJECT default null
                              ,p_EXCL_IDXS            in DL_COMMON.VT_DB_OBJECT default null
                              ,p_INCULDE_PARTITIONED  in pls_integer default 1
                              ,p_ONLY_INVALID_INDEXES in pls_integer default 1
                               --
                               ) is
    --
    pragma autonomous_transaction;
    --
    v_LOG_Scope logger_logs.scope%type := Get_OBJECT_NAME() || '.Rebuild_Indexes$AT';
    --v_LOG_Params logger.tab_param;
    --
  begin
    --
    --
    /*
    logger.append_param(p_params => v_LOG_Params
                       ,p_name   => 'p_TBLSPC_NAME'
                       ,p_val    => p_TBLSPC_NAME
                        --
                        );
    */
    --
    logger.log(p_text  => 'START'
              ,p_scope => v_LOG_Scope
               --,p_extra  => null
               --,p_params => v_LOG_Params
               --
               );
    --
    --
    if (p_IDXS_OF_OWNER is null and p_ONLY_TBLS is null and p_ONLY_IDXS is null)
    then
      Raise_application_error(-20000
                             ,'Either argument p_IDXS_OF_OWNER or p_ONLY_TBLS or p_ONLY_IDXS must be not null!');
    end if;
    --
    --
    for R0 in (
               --
               select 'alter index "' || t.OWNER || '"."' || t.INDEX_NAME || '" rebuild' as STMT
                 from ALL_INDEXES t
                where t.DROPPED = 'NO'
                  and t.PARTITIONED = 'NO'
                  and t.INDEX_TYPE not in ('LOB')
                  and (t.STATUS != 'VALID' or nvl(p_ONLY_INVALID_INDEXES
                                                 ,1) = 0)
                  and (
                      --
                       (
                       --
                        t.OWNER = p_IDXS_OF_OWNER.OBJ_OWNER
                       --
                        and t.INDEX_NAME not like 'BIN$%'
                       --
                        and p_ONLY_TBLS is null
                       --
                        and p_ONLY_IDXS is null
                       --
                       )
                      --
                       or (
                       --
                        exists (select null
                                     from table(p_ONLY_TBLS) e1
                                    where nvl(e1.OBJ_OWNER
                                             ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                      and e1.OBJ_NAME = t.TABLE_NAME
                                   --
                                   )
                       --
                        and p_ONLY_IDXS is null
                       --
                       )
                      --
                       or (
                       --
                        exists (select null
                                     from table(p_ONLY_IDXS) e0
                                    where nvl(e0.OBJ_OWNER
                                             ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                      and e0.OBJ_NAME = t.INDEX_NAME
                                   --
                                   )
                       --
                       )
                      --
                      )
                  and not (
                       --
                        exists (select null
                                     from table(p_EXCL_IDXS) e2
                                    where nvl(e2.OBJ_OWNER
                                             ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                      and e2.OBJ_NAME = t.INDEX_NAME
                                   --
                                   )
                       --
                        or exists (select null
                                        from table(p_EXCL_TBLS) e3
                                       where nvl(e3.OBJ_OWNER
                                                ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                         and e3.OBJ_NAME = t.TABLE_NAME
                                      --
                                      )
                       --
                       )
               --
               )
    loop
      --
      --
      logger.log_permanent(p_text  => 'Execute_Stmt'
                          ,p_scope => v_LOG_Scope
                          ,p_extra => R0.STMT
                           --
                           );
      --
      Execute_Stmt(R0.STMT);
      --
    end loop;
    --
    --
    if (nvl(p_INCULDE_PARTITIONED
           ,1) != 0)
    then
      --
      --
      for R2 in (
                 --
                 select 'alter index "' || t.OWNER || '"."' || t.INDEX_NAME || '" rebuild partition "' || t1.PARTITION_NAME || '"' as STMT
                   from ALL_INDEXES t
                  inner join ALL_IND_PARTITIONS t1
                     on (t.OWNER = t1.INDEX_OWNER and t.INDEX_NAME = t1.INDEX_NAME)
                  where t.DROPPED = 'NO'
                    and t.PARTITIONED = 'YES'
                    and t.INDEX_TYPE not in ('LOB')
                    and (t1.STATUS != 'USABLE' or nvl(p_ONLY_INVALID_INDEXES
                                                     ,1) = 0)
                    and (
                        --
                         (
                         --
                          t.OWNER = p_IDXS_OF_OWNER.OBJ_OWNER
                         --
                          and t.INDEX_NAME not like 'BIN$%'
                         --
                          and t1.PARTITION_NAME not like 'BIN$%'
                         --
                          and p_ONLY_TBLS is null
                         --
                          and p_ONLY_IDXS is null
                         --
                         )
                        --
                         or (
                         --
                          exists (select null
                                       from table(p_ONLY_TBLS) e1
                                      where nvl(e1.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                        and e1.OBJ_NAME = t.TABLE_NAME
                                     --
                                     )
                         --
                          and p_ONLY_IDXS is null
                         --
                         )
                        --
                         or (
                         --
                          exists (select null
                                       from table(p_ONLY_IDXS) e0
                                      where nvl(e0.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                        and e0.OBJ_NAME = t.INDEX_NAME
                                     --
                                     )
                         --
                         )
                        --
                        )
                    and not (
                         --
                          exists (select null
                                       from table(p_EXCL_IDXS) e2
                                      where nvl(e2.OBJ_OWNER
                                               ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                        and e2.OBJ_NAME = t.INDEX_NAME
                                     --
                                     )
                         --
                          or exists (select null
                                          from table(p_EXCL_TBLS) e3
                                         where nvl(e3.OBJ_OWNER
                                                  ,p_IDXS_OF_OWNER.OBJ_OWNER) = t.TABLE_OWNER
                                           and e3.OBJ_NAME = t.TABLE_NAME
                                        --
                                        )
                         --
                         )
                 --
                 )
      loop
        --
        --
        logger.log_permanent(p_text  => 'Execute_Stmt'
                            ,p_scope => v_LOG_Scope
                            ,p_extra => R2.STMT
                             --
                             );
        --
        Execute_Stmt(R2.STMT);
        --
      end loop;
      --
    end if;
    --
    --
    commit;
    --
    --
    logger.log(p_text  => 'RETURN'
              ,p_scope => v_LOG_Scope
               --
               );
    --
  exception
    when others then
      --
      --
      logger.log_error(p_text  => 'Unhandled Exception'
                      ,p_scope => v_LOG_Scope
                       --
                       );
      --
      raise;
      --
  end Rebuild_Indexes$AT;
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
  * WWirns    16.02.2018  Ensure_Char_Semantic$AT:Added
  * WWirns    19.02.2018  Ensure_Char_Semantic$AT:Add logger
  *******************************************************************************/
  --
  procedure Ensure_Char_Semantic$AT(p_TBLS_OF_OWNER in DL_COMMON.OT_DB_OWNER default null
                                   ,p_ONLY_TBLS     in DL_COMMON.VT_DB_OBJECT default null
                                   ,p_ONLY_TAB_COLS in DL_COMMON.VT_DB_TAB_COL default null
                                   ,p_EXCL_TBLS     in DL_COMMON.VT_DB_OBJECT default null
                                   ,p_EXCL_TAB_COLS in DL_COMMON.VT_DB_TAB_COL default null
                                   ,p_CHAR_SEMANTIC in varchar2 default 'C'
                                    --
                                    ) is
    --
    pragma autonomous_transaction;
    --
    v_LOG_Scope logger_logs.scope%type := Get_OBJECT_NAME() || '.Ensure_Char_Semantic$AT';
    --v_LOG_Params logger.tab_param;
    --
  begin
    --
    --
    /*
    logger.append_param(p_params => v_LOG_Params
                       ,p_name   => 'p_TBLSPC_NAME'
                       ,p_val    => p_TBLSPC_NAME
                        --
                        );
    */
    --
    logger.log(p_text  => 'START'
              ,p_scope => v_LOG_Scope
               --,p_extra  => null
               --,p_params => v_LOG_Params
               --
               );
    --
    --
    if (p_CHAR_SEMANTIC not in ('B'
                               ,'C'))
    then
      Raise_application_error(-20000
                             ,'Argument p_CHAR_SEMANTIC must be in "C" or "B"!');
    end if;
    --
    --
    if (p_TBLS_OF_OWNER is null and p_ONLY_TBLS is null and p_ONLY_TAB_COLS is null)
    then
      Raise_application_error(-20000
                             ,'Either argument p_TBLS_OF_OWNER or p_ONLY_TBLS or p_ONLY_TAB_COLS must be not null!');
    end if;
    --
    --
    for R0 in (
               --
               select 'alter table "' || t.OWNER || '"."' || t.TABLE_NAME || '" modify "' || t.COLUMN_NAME || '" ' || t.DATA_TYPE || '(' || t.CHAR_LENGTH || ' char)' as STMT
                 from ALL_TAB_COLUMNS t
                inner join ALL_TABLES t1
                   on (t.OWNER = t1.OWNER and t.TABLE_NAME = t1.TABLE_NAME)
                where t.DATA_TYPE like '%CHAR%'
                  and t.CHAR_USED != p_CHAR_SEMANTIC
                  and (
                      --
                       (
                       --
                        t.OWNER = p_TBLS_OF_OWNER.OBJ_OWNER
                       --
                        and t.TABLE_NAME not like 'BIN$%'
                       --
                        and p_ONLY_TBLS is null
                       --
                        and p_ONLY_TAB_COLS is null
                       --
                       )
                      --
                       or (
                       --
                        exists (select null
                                     from table(p_ONLY_TBLS) e0
                                    where nvl(e0.OBJ_OWNER
                                             ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                      and e0.OBJ_NAME = t.TABLE_NAME
                                   --
                                   )
                       --
                        and p_ONLY_TAB_COLS is null
                       --
                       )
                      --
                       or exists (select null
                                    from table(p_ONLY_TAB_COLS) e1
                                   where nvl(e1.OBJ_OWNER
                                            ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                     and e1.OBJ_NAME = t.TABLE_NAME
                                     and e1.COL_NAME = t.COLUMN_NAME
                                  --
                                  )
                      --
                      )
                  and not (
                       --
                        exists (select null
                                     from table(p_EXCL_TBLS) e2
                                    where nvl(e2.OBJ_OWNER
                                             ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                      and e2.OBJ_NAME = t.TABLE_NAME
                                   --
                                   )
                       --
                        or exists (select null
                                        from table(p_EXCL_TAB_COLS) e3
                                       where nvl(e3.OBJ_OWNER
                                                ,p_TBLS_OF_OWNER.OBJ_OWNER) = t.OWNER
                                         and e3.OBJ_NAME = t.TABLE_NAME
                                         and e3.COL_NAME = t.COLUMN_NAME
                                      --
                                      )
                       --
                       )
               --
               )
    loop
      --
      --
      logger.log_permanent(p_text  => 'Execute_Stmt'
                          ,p_scope => v_LOG_Scope
                          ,p_extra => R0.STMT
                           --
                           );
      --
      Execute_Stmt(R0.STMT);
      --
    end loop;
    --
    --
    commit;
    --
    --
    logger.log(p_text  => 'RETURN'
              ,p_scope => v_LOG_Scope
               --
               );
    --
  exception
    when others then
      --
      --
      logger.log_error(p_text  => 'Unhandled Exception'
                      ,p_scope => v_LOG_Scope
                       --
                       );
      --
      raise;
      --
  end Ensure_Char_Semantic$AT;
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
  * WWirns    16.02.2018  Recompile:Added
  * WWirns    19.02.2018  Recompile:Add logger
  *******************************************************************************/
  --
  procedure Recompile(p_SCHEMA              in DL_COMMON.OT_DB_OWNER
                     ,p_IS_DEPENDED_SCHEMAS in pls_integer default 1
                      --
                      ) is
    --
    v_LOG_Scope logger_logs.scope%type := Get_OBJECT_NAME() || '.Recompile';
    --v_LOG_Params logger.tab_param;
    --
    v_Curr_CNT number := 0;
    v_Last_CNT number := 0;
    --
  begin
    --
    --
    /*
    logger.append_param(p_params => v_LOG_Params
                       ,p_name   => 'p_TBLSPC_NAME'
                       ,p_val    => p_TBLSPC_NAME
                        --
                        );
    */
    --
    logger.log(p_text  => 'START'
              ,p_scope => v_LOG_Scope
               --,p_extra  => null
               --,p_params => v_LOG_Params
               --
               );
    --
    --
    if (p_SCHEMA is null)
    then
      Raise_application_error(-20000
                             ,'Argument p_SCHEMA must be not null!');
    end if;
    --
    --
    DBMS_UTILITY.COMPILE_SCHEMA(schema         => p_SCHEMA.OBJ_OWNER
                               ,compile_all    => false
                               ,reuse_settings => false
                                --
                                );
    --
    --
    if (nvl(p_IS_DEPENDED_SCHEMAS
           ,1) != 0)
    then
      --
      select count(*)
        into v_Last_CNT
        from ALL_OBJECTS t0
       where t0.STATUS != 'VALID'
         and t0.OWNER in (select distinct t1.OWNER
                            from ALL_DEPENDENCIES t1
                           where t1.REFERENCED_OWNER = p_SCHEMA.OBJ_OWNER
                             and t1.OWNER != p_SCHEMA.OBJ_OWNER);
      --
      loop
        --
        for R0 in (select distinct t.OWNER
                     from ALL_DEPENDENCIES t
                    where t.REFERENCED_OWNER = p_SCHEMA.OBJ_OWNER
                      and t.OWNER != p_SCHEMA.OBJ_OWNER
                   --
                   )
        loop
          DBMS_UTILITY.COMPILE_SCHEMA(schema         => R0.OWNER
                                     ,compile_all    => false
                                     ,reuse_settings => false
                                      --
                                      );
        end loop;
        --
        select count(*)
          into v_Curr_CNT
          from ALL_OBJECTS t0
         where t0.STATUS != 'VALID'
           and t0.OWNER in (select distinct t1.OWNER
                              from ALL_DEPENDENCIES t1
                             where t1.REFERENCED_OWNER = p_SCHEMA.OBJ_OWNER
                               and t1.OWNER != p_SCHEMA.OBJ_OWNER);
        --
        if (v_Curr_CNT = 0)
        then
          exit;
        elsif (v_Curr_CNT >= v_Last_CNT)
        then
          exit;
        else
          v_Last_CNT := v_Curr_CNT;
        end if;
        --
      end loop;
      --
    end if;
    --
    --
    logger.log(p_text  => 'RETURN'
              ,p_scope => v_LOG_Scope
               --
               );
    --
  exception
    when others then
      --
      --
      logger.log_error(p_text  => 'Unhandled Exception'
                      ,p_scope => v_LOG_Scope
                       --
                       );
      --
      raise;
      --
  end Recompile;
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
  * WWirns    02.05.2018  L2CL$PL:Added as copy from NGA20708
  *******************************************************************************/
  --
  -- Long to Clob (L2CL)
  --
  -- Select one to five CHAR-Columns and one to five LONG-Columns.
  --
  -- The function outputs all CHAR-Columns into the attributs VC01..VC05 of the object OT_L2CL
  -- in order of there appereance in the select list and outputs all LONG-Columns converted to CLOB
  -- into the attributs CL01..CL05 of the object OT_L2CL in order of there appereance
  -- in the select list.
  --
  -- i_SQL => 'select CHAR1[, CHAR2[, CHAR3[, CHAR4[, CHAR5]]]], LONG1[, LONG2[, LONG3[, LONG4[, LONG5]]]] from TABLE [WHERE...] [...] [ORDER BY...]'
  --
  function L2CL$PL(p_SQL in varchar2
                   --
                   ) return dl_common.TT_10VCC_10CL
    pipelined is
    --
    v_Each_Result dl_common.OT_10VCC_10CL;
    --
    v_cl_Tmp              clob;
    v_n_Tmp               number;
    v_Idx                 integer;
    v_Offset4Buffer       integer;
    v_Buffer              varchar2(32767 char);
    v_Buffer_Length       integer;
    v_Buffer_Fetch_Length integer;
    v_VC_COLUMN_Cnt       integer;
    v_L_COLUMN_Cnt        integer;
    v_SEL_COL_Cnt         number;
    v_SQL_Cur_Num         integer;
    v_SQL_desc_rec3       DBMS_SQL.desc_rec3;
    v_SQL_desc_tab3       DBMS_SQL.desc_tab3;
    --
    --
    --
    procedure L_DEF_COL4Char is
    begin
      --
      v_VC_COLUMN_Cnt := v_VC_COLUMN_Cnt + 1;
      if (v_VC_COLUMN_Cnt > 5)
      then
        -- ot_Result.VC06.. does not exists
        Raise_application_error(-20000
                               ,'Too many CHAR columns in SELECT-List!!!');
      end if;
      --
      DBMS_SQL.define_column(v_SQL_Cur_Num
                            ,v_Idx
                            ,v_Each_Result.VCC00
                            ,4000 -- ??? Welche Auswirkung hat dieses Argument
                             --
                             );
      --
    end L_DEF_COL4Char;
    --
    --
    --
    procedure L_DEF_COL4Long is
    begin
      --
      v_L_COLUMN_Cnt := v_L_COLUMN_Cnt + 1;
      if (v_L_COLUMN_Cnt > 5)
      then
        -- ot_Result.CL06.. does not exists
        Raise_application_error(-20000
                               ,'Too many LONG columns in SELECT-List!!!');
      end if;
      --
      DBMS_SQL.define_column_long(v_SQL_Cur_Num
                                 ,v_Idx);
      --
    end L_DEF_COL4Long;
    --
    --
    --
    procedure L_COL_VAL4Char is
    begin
      --
      v_VC_COLUMN_Cnt := v_VC_COLUMN_Cnt + 1;
      case v_VC_COLUMN_Cnt
        when 1 then
          DBMS_SQL.column_value(v_SQL_Cur_Num
                               ,v_Idx
                               ,v_Each_Result.VCC00);
        when 2 then
          DBMS_SQL.column_value(v_SQL_Cur_Num
                               ,v_Idx
                               ,v_Each_Result.VCC01);
        when 3 then
          DBMS_SQL.column_value(v_SQL_Cur_Num
                               ,v_Idx
                               ,v_Each_Result.VCC02);
        when 4 then
          DBMS_SQL.column_value(v_SQL_Cur_Num
                               ,v_Idx
                               ,v_Each_Result.VCC03);
        when 5 then
          DBMS_SQL.column_value(v_SQL_Cur_Num
                               ,v_Idx
                               ,v_Each_Result.VCC04);
      end case;
      --
    end L_COL_VAL4Char;
    --
    --
    --
    procedure L_COL_VAL4Long is
    begin
      --
      v_L_COLUMN_Cnt := v_L_COLUMN_Cnt + 1;
      loop
        DBMS_SQL.column_value_long(c            => v_SQL_Cur_Num
                                  ,position     => v_Idx
                                  ,length       => v_Buffer_Fetch_Length
                                  ,offset       => v_Offset4Buffer
                                  ,value        => v_Buffer
                                  ,value_length => v_Buffer_Length);
        v_cl_Tmp        := v_cl_Tmp || v_Buffer;
        v_Offset4Buffer := v_Offset4Buffer + v_Buffer_Fetch_Length;
        exit when v_Buffer_Length < v_Buffer_Fetch_Length;
      end loop;
      --
      case v_L_COLUMN_Cnt
        when 1 then
          v_Each_Result.CL00 := v_cl_Tmp;
        when 2 then
          v_Each_Result.CL01 := v_cl_Tmp;
        when 3 then
          v_Each_Result.CL02 := v_cl_Tmp;
        when 4 then
          v_Each_Result.CL03 := v_cl_Tmp;
        when 5 then
          v_Each_Result.CL04 := v_cl_Tmp;
      end case;
      --
    end L_COL_VAL4Long;
    --
  begin
    --
    --
    --if (p_vc_SQL not like 'select %') then
    --Raise_application_error(-20000   ,'Unsupported column type[' ||
    --
    --vc_SQL := q'[select TRIGGER_NAME, TRIGGER_BODY from USER_TRIGGERS where TRIGGER_BODY is not null and rownum < 4]';
    --
    --
    v_cl_Tmp              := '#';
    v_n_Tmp               := DBMS_LOB.getchunksize(v_cl_Tmp);
    v_Buffer_Fetch_Length := trunc(32767 / v_n_Tmp) * v_n_Tmp;
    --
    --
    v_SQL_Cur_Num := DBMS_SQL.open_cursor();
    --
    --
    DBMS_SQL.parse(v_SQL_Cur_Num
                  ,p_SQL
                  ,DBMS_SQL.native);
    --
    --
    v_VC_COLUMN_Cnt := 0;
    v_L_COLUMN_Cnt  := 0;
    v_SEL_COL_Cnt   := null;
    --
    /*
    --
    select t.data_type
          ,t.dbms_sql
      from EP_ORA_TYPES t
     order by decode(t.type_group
                    ,'STRING'
                    ,0
                    ,'NUMBER'
                    ,1
                    ,'DATE'
                    ,2
                    ,'BINARY'
                    ,3
                    ,'ARRAY'
                    ,4
                    ,'OBJECT'
                    ,5
                    ,'POINTER'
                    ,6
                    ,9999999)
             ,t.dbms_sql
             ,t.data_type;
    --
    */
    --
    DBMS_SQL.describe_columns3(v_SQL_Cur_Num
                              ,v_SEL_COL_Cnt
                              ,v_SQL_desc_tab3
                               --
                               );
    --
    for i in 1 .. v_SEL_COL_Cnt
    loop
      --
      v_Idx           := i;
      v_SQL_desc_rec3 := v_SQL_desc_tab3(v_Idx);
      --
      -- DBMS_SQL.BIND_VARIABLE(...
      --
      case v_SQL_desc_rec3.col_type
        when DBMS_SQL.Varchar2_Type then
          -- xVARCHAR2 : 1
          L_DEF_COL4Char();
          --
        when DBMS_SQL.Long_Type then
          -- LONG : 8
          L_DEF_COL4Long();
          --
        when DBMS_SQL.Char_Type then
          -- xCHAR  : 96
          L_DEF_COL4Char();
          --
        when DBMS_SQL.Clob_Type then
          -- xCLOB : 112
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
      -- VARCHAR
      -- FLOAT
        when DBMS_SQL.Number_Type then
          -- NUMBER : 2
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Binary_Float_Type then
          -- BINARY_FLOAT : 100
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Binary_Bouble_Type then
          -- BINARY_DOUBLE  : 101
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
      -- BINARY_INTEGER
      -- INTEGER
      -- PLS_INTEGER
      -- SIMPLE_INTEGER
        when DBMS_SQL.Date_Type then
          -- DATE : 12
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Timestamp_Type then
          -- TIMESTAMP  : 180
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Timestamp_With_TZ_Type then
          -- TIMESTAMP WITH TIME ZONE : 181
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Interval_Year_to_Month_Type then
          -- INTERVAL YEAR TO MONTH : 182
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Interval_Day_To_Second_Type then
          -- INTERVAL DAY TO SECOND : 183
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Timestamp_With_Local_TZ_type then
          -- TIMESTAMP WITH LOCAL TIME ZONE : 231
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Raw_Type then
          -- RAW  : 23
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Long_Raw_Type then
          -- LONG RAW : 24
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Blob_Type then
          -- BLOB : 113
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Bfile_Type then
          -- BFILE  : 114
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.User_Defined_Type then
          -- Nested table / Object type  / VARRAY : 109
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Rowid_Type then
          -- ROWID  : 11
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when 102 then
          -- Strong/Weak REF CURSOR : 102
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.MLSLabel_Type then
          -- MLSLabel : 106
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Ref_Type then
          -- REF  : 111
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        when DBMS_SQL.Urowid_Type then
          -- UROWID : 208
          Raise_application_error(-20000
                                 ,'Unsupported column type[' || v_SQL_desc_rec3.col_type || ']!!!');
          --
        else
          --
          Raise_application_error(-20000
                                 ,'Unknown column type[' || v_SQL_desc_rec3.col_type || ']!!!');
      end case;
      --
    end loop;
    --
    --
    --i_Rows := dbms_sql.execute(crn);
    v_n_Tmp := DBMS_SQL.execute(v_SQL_Cur_Num);
    --
    --
    while (DBMS_SQL.fetch_rows(v_SQL_Cur_Num) > 0)
    loop
      --
      --i_Rows := dbms_sql.last_row_count();
      --
      v_Each_Result   := dl_common.OT_10VCC_10CL();
      v_cl_Tmp        := null;
      v_Offset4Buffer := 0;
      v_Buffer        := null;
      v_Buffer_Length := 0;
      v_VC_COLUMN_Cnt := 0;
      v_L_COLUMN_Cnt  := 0;
      --
      for i in 1 .. v_SEL_COL_Cnt
      loop
        --
        v_Idx           := i;
        v_SQL_desc_rec3 := v_SQL_desc_tab3(v_Idx);
        --
        case v_SQL_desc_rec3.col_type
          when DBMS_SQL.Varchar2_Type then
            -- xVARCHAR2 : 1
            L_COL_VAL4Char();
            --
          when DBMS_SQL.Long_Type then
            -- LONG : 8
            L_COL_VAL4Long();
            --
          when DBMS_SQL.Char_Type then
            -- xCHAR  : 96
            L_COL_VAL4Char();
            --
        end case;
        --
      end loop;
      --
      --
      pipe row(v_Each_Result);
      --
    end loop;
    --
    --
    DBMS_SQL.close_cursor(v_SQL_Cur_Num);
    --
    --
    return;
    --
  end L2CL$PL;
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
  * WWirns    02.05.2018  Execute_DDL:Added as copy from NGA20708
  * WWirns    25.07.2018  Execute_DDL:Functions and overloads added
  * WWirns    27.07.2018  Execute_DDL:Add argument "p_Get_Row_Count" and rename argument to "p_Prevent_EXCE_CODE*"
  *******************************************************************************/
  --
  function Execute_DDL(p_DDL                in varchar2
                      ,p_Prevent_EXCE_CODES in dl_common.TT_N5 default null
                      ,p_Prevent_EXEC       in boolean default false
                      ,p_Get_Row_Count      in boolean default false
                       --
                       ) return integer is
    --
    v_Result             integer := 0;
    v_Prevent_EXCE_CODES dl_common.TT_N5;
    --v_SQLCODE           number;
    --v_SQLERRM           varchar2(32767 );
    --
  begin
    --
    /*
    --
    O R A-22324: Geänderter Typ weist Kompilierungsfehler auf
    O R A-22332: Ein abhängiges Objekt in Schema "DEMOGRAPHIC" weist Fehler auf.
    P L S-00410: duplicate fields in RECORD,TABLE or argument list are not permitted
    O R A-06550: Zeile 0, Spalte 0:
    PL/SQL: Compilation unit analysis terminated
    --
    O R A-22324: Geänderter Typ weist Kompilierungsfehler auf
    O R A-22332: Ein abhängiges Objekt in Schema "DEMOGRAPHIC" weist Fehler auf.
    P L S-00305: previous use of 'OT_10VC' (at line 142) conflicts with this use
    O R A-06550: Zeile 0, Spalte 0:
    PL/SQL: Compilation unit analysis terminated
    --
    */
    --
    if (p_Prevent_EXCE_CODES is null)
    then
      v_Prevent_EXCE_CODES := dl_common.TT_N5();
    else
      v_Prevent_EXCE_CODES := p_Prevent_EXCE_CODES;
    end if;
    --
    --
    begin
      execute immediate p_DDL;
      if (nvl(p_Get_Row_Count
             ,false))
      then
        v_Result := sql%rowcount;
      else
        v_Result := 1;
      end if;
    exception
      when others then
        if (sqlcode not member of v_Prevent_EXCE_CODES)
        then
          Raise_application_error(-20000
                                 ,'p_DDL[''' || substr(p_DDL
                                                      ,1
                                                      ,1000) || '''] raises:' || sqlerrm
                                 ,true);
          --raise;
        end if;
    end;
    --
    --
    return v_Result;
    --
  exception
    when others then
      --v_SQLCODE := sqlcode;
      --v_SQLERRM := sqlerrm;
      if (not nvl(p_Prevent_EXEC
                 ,false))
      then
        raise;
        --
        /*
        --
        -- ToDo: Write DDL into a log table?!
        DBMS_OUTPUT.put_line('DDL[''' || substr(i_DDL
                                               ,1
                                               ,256) || case when(length(i_DDL) > 256) then '...' else ''
                             end || '''] raises:' || v_SQLERRM);
        --
        */
        --
      end if;
      --
      --
      return v_Result;
      --
  end Execute_DDL;
  --
  function Execute_DDL(p_DDL               in varchar2
                      ,p_Prevent_EXCE_CODE in pls_integer
                      ,p_Prevent_EXEC      in boolean default false
                      ,p_Get_Row_Count     in boolean default false
                       --
                       ) return integer is
  begin
    return Execute_DDL(p_DDL
                      ,dl_common.TT_N5(p_Prevent_EXCE_CODE)
                      ,p_Prevent_EXEC
                      ,p_Get_Row_Count
                       --
                       );
  end Execute_DDL;
  --
  procedure Execute_DDL(p_DDL                in varchar2
                       ,p_Prevent_EXCE_CODES in dl_common.TT_N5 default null
                       ,p_Prevent_EXEC       in boolean default false
                        --
                        ) is
    v_i_Tmp integer;
  begin
    v_i_Tmp := Execute_DDL(p_DDL
                          ,p_Prevent_EXCE_CODES
                          ,p_Prevent_EXEC
                           --
                           );
  end Execute_DDL;
  --
  procedure Execute_DDL(p_DDL               in varchar2
                       ,p_Prevent_EXCE_CODE in pls_integer
                       ,p_Prevent_EXEC      in boolean default false
                        --
                        ) is
  begin
    Execute_DDL(p_DDL
               ,dl_common.TT_N5(p_Prevent_EXCE_CODE)
               ,p_Prevent_EXEC
                --
                );
  end Execute_DDL;
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
  * WWirns    27.07.2018  Execute_DML:Added
  *******************************************************************************/
  --
  function Execute_DML(p_DML                in varchar2
                      ,p_Prevent_EXCE_CODES in dl_common.TT_N5 default null
                      ,p_Prevent_EXEC       in boolean default false
                       --
                       ) return integer is
  begin
    return Execute_DDL(p_DML
                      ,p_Prevent_EXCE_CODES
                      ,p_Prevent_EXEC
                      ,true
                       --
                       );
  end Execute_DML;
  --
  function Execute_DML(p_DML               in varchar2
                      ,p_Prevent_EXCE_CODE in pls_integer
                      ,p_Prevent_EXEC      in boolean default false
                       --
                       ) return integer is
  begin
    return Execute_DDL(p_DML
                      ,dl_common.TT_N5(p_Prevent_EXCE_CODE)
                      ,p_Prevent_EXEC
                      ,true
                       --
                       );
  end Execute_DML;
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
  * WWirns    02.05.2018  Check_SQL4Create_INDEX:Added as copy from NGA20708
  *******************************************************************************/
  --
  function Check_SQL4Create_INDEX(p_TABLE           in dl_common.OT_DB_OBJECT
                                 ,p_INDEX           in dl_common.OT_DB_OBJECT
                                 ,p_INDEX_COL_EXPRS in dl_common.TT_VCC
                                 ,p_Prevent_EXCE    in boolean default false
                                  --
                                  ) return varchar2 is
    --
    v_Result varchar2(32767 char);
    i        integer;
    --
  begin
    --
    --
    if (p_INDEX_COL_EXPRS.count() < 1)
    then
      Raise_application_error(-20000
                             ,'Parameter i_INDEX_COL_EXPRS is empty!');
    end if;
    --
    --
    v_Result := '
select 1
  from ALL_INDEXES t
 where t.TABLE_OWNER = ''' || p_TABLE.OBJ_OWNER || '''
   and t.TABLE_NAME = ''' || p_TABLE.OBJ_NAME || '''
   and t.OWNER = ''' || p_INDEX.OBJ_OWNER || '''
   and t.INDEX_NAME = ''' || p_INDEX.OBJ_NAME || '''
   and (';
    --
    --
    i := p_INDEX_COL_EXPRS.first;
    --
    -- "if (i is not null ) then" is not needed, because its already checked abouve!
    v_Result := v_Result || '
       --
        not exists (select null
                      from ALL_IND_COLUMNS ic
                      left join (
                                 --
                                 select to_number(ll.VCC00) as COLUMN_POSITION
                                        ,ll.CL00 as COLUMN_EXPRESSION
                                   from table(DL_DBA.PKG_DDL_UTIL.L2CL$PL(''select to_char(t.COLUMN_POSITION) as COLUMN_POSITION
                          ,t.COLUMN_EXPRESSION
                      from ALL_IND_EXPRESSIONS t
                     where t.TABLE_OWNER = ''''' || p_TABLE.OBJ_OWNER || '''''
                       and t.TABLE_NAME = ''''' || p_TABLE.OBJ_NAME || '''''
                       and t.INDEX_OWNER = ''''' || p_INDEX.OBJ_OWNER || '''''
                       and t.INDEX_NAME = ''''' || p_INDEX.OBJ_NAME || ''''''')) ll
                                 --
                                 ) ie
                        on (ic.COLUMN_POSITION = ie.COLUMN_POSITION)
                     where ic.INDEX_OWNER = t.OWNER
                       and ic.INDEX_NAME = t.INDEX_NAME
                       and ic.TABLE_OWNER = t.TABLE_OWNER
                       and ic.TABLE_NAME = t.TABLE_NAME
                       and ic.COLUMN_POSITION = ' || trim(i) || '
                       and translate(nvl(cast(ie.COLUMN_EXPRESSION as varchar2(4000 char)), ic.COLUMN_NAME), ''0 "'', ''0'') = ''' ||
                upper(translate(replace(p_INDEX_COL_EXPRS(i)
                                       ,''''
                                       ,'''''')
                               ,'0 "'
                               ,'0')) || '''
                    --
                    )';
    --
    --
    i := p_INDEX_COL_EXPRS.next(i);
    --
    while (i is not null)
    loop
      --
      v_Result := v_Result || '
       --
        or not exists (select null
                         from ALL_IND_COLUMNS ic
                         left join (
                                    --
                                    select to_number(ll.VCC00) as COLUMN_POSITION
                                           ,ll.CL00 as COLUMN_EXPRESSION
                                      from table(DL_DBA.PKG_DDL_UTIL.L2CL$PL(''select to_char(t.COLUMN_POSITION) as COLUMN_POSITION
                             ,t.COLUMN_EXPRESSION
                         from ALL_IND_EXPRESSIONS t
                        where t.TABLE_OWNER = ''''' || p_TABLE.OBJ_OWNER || '''''
                          and t.TABLE_NAME = ''''' || p_TABLE.OBJ_NAME || '''''
                          and t.INDEX_OWNER = ''''' || p_INDEX.OBJ_OWNER || '''''
                          and t.INDEX_NAME = ''''' || p_INDEX.OBJ_NAME || ''''''')) ll
                                    --
                                    ) ie
                           on (ic.COLUMN_POSITION = ie.COLUMN_POSITION)
                        where ic.INDEX_OWNER = t.OWNER
                          and ic.INDEX_NAME = t.INDEX_NAME
                          and ic.TABLE_OWNER = t.TABLE_OWNER
                          and ic.TABLE_NAME = t.TABLE_NAME
                          and ic.COLUMN_POSITION = ' || trim(i) || '
                          and translate(nvl(cast(ie.COLUMN_EXPRESSION as varchar2(4000 char)), ic.COLUMN_NAME), ''0 "'', ''0'') = ''' ||
                  upper(translate(replace(p_INDEX_COL_EXPRS(i)
                                         ,''''
                                         ,'''''')
                                 ,'0 "'
                                 ,'0')) || '''
                    --
                    )';
      --
      --
      i := p_INDEX_COL_EXPRS.next(i);
      --
    end loop;
    --
    --
    v_Result := v_Result || '
       --
        or (select count(*)
                            from ALL_IND_COLUMNS ic
                           where ic.INDEX_OWNER = t.OWNER
                             and ic.INDEX_NAME = t.INDEX_NAME
                             and ic.TABLE_OWNER = t.TABLE_OWNER
                             and ic.TABLE_NAME = t.TABLE_NAME
                          --
                          ) != ' || trim(p_INDEX_COL_EXPRS.count()) || '
       --
       )';
    --
    --
    return v_Result;
    --
  exception
    when others then
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
  end Check_SQL4Create_INDEX;
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
  * WWirns    02.05.2018  Create_INDEX:Added as copy from NGA20708
  *******************************************************************************/
  --
  procedure Create_INDEX(p_TABLE                  in dl_common.OT_DB_OBJECT
                        ,p_INDEX                  in dl_common.OT_DB_OBJECT
                        ,p_INDEX_COL_EXPRS        in dl_common.TT_VCC
                        ,p_Create_Addition        in varchar2
                        ,p_Drop_Wrong_Index       in boolean default false
                        ,p_Prevent_DDL_EXCE_CODES in dl_common.TT_N5 default dl_common.TT_N5(-00955)
                        ,p_Prevent_EXCE           in boolean default false
                         --
                         ) is
    --
    v_Prevent_DDL_EXCE_CODES dl_common.TT_N5;
    v_C0                     sys_refcursor;
    v_SQL                    varchar2(32767 char);
    i                        integer;
    --
  begin
    --
    --
    if (p_INDEX_COL_EXPRS.count() < 1)
    then
      Raise_application_error(-20000
                             ,'Parameter i_INDEX_COL_EXPRS is empty!');
    end if;
    --
    --
    if (p_Prevent_DDL_EXCE_CODES is null)
    then
      v_Prevent_DDL_EXCE_CODES := dl_common.TT_N5();
    else
      v_Prevent_DDL_EXCE_CODES := p_Prevent_DDL_EXCE_CODES;
    end if;
    --
    --
    begin
      --
      select t.INDEX_TYPE
        into v_SQL
        from ALL_INDEXES t
       where t.TABLE_OWNER = p_TABLE.OBJ_OWNER
         and t.TABLE_NAME = p_TABLE.OBJ_NAME
         and t.OWNER = p_INDEX.OBJ_OWNER
         and t.INDEX_NAME = p_INDEX.OBJ_NAME;
      --
      if (v_SQL not in ('NORMAL'
                       ,'FUNCTION-BASED NORMAL'))
      then
        --
        -- !!! Could be more index types !!!
        -- NORMAL/REV
        -- IOT - TOP
        -- FUNCTION-BASED DOMAIN
        -- FUNCTION-BASED NORMAL
        -- BITMAP
        -- NORMAL
        --
        Raise_application_error(-20000
                               ,'This procedure does not support INDEX_TYPE[''' || v_SQL || ''']!');
        --
      end if;
      --
      --
      v_SQL := Check_SQL4Create_INDEX(p_TABLE
                                     ,p_INDEX
                                     ,p_INDEX_COL_EXPRS
                                     ,p_Prevent_EXCE
                                      --
                                      );
      --
      --
      open v_C0 for v_SQL;
      --
      fetch v_C0
        into i;
      --
      if (v_C0%found)
      then
        --
        if (nvl(p_Drop_Wrong_Index
               ,false))
        then
          --
          --
          v_SQL := 'drop index ' || p_INDEX.OBJ_OWNER || '.' || p_INDEX.OBJ_NAME;
          --
          Execute_DDL(v_SQL
                     ,v_Prevent_DDL_EXCE_CODES
                     ,p_Prevent_EXCE);
          --
        else
          --
          Raise_application_error(-20001
                                 ,'Index has wrong column list!');
          --
        end if;
        --
      end if;
      --
      close v_C0;
      --
    exception
      when NO_DATA_FOUND then
        -- Index does not exists!
        null;
    end;
    --
    --
    v_SQL := '
create index ' || p_INDEX.OBJ_OWNER || '.' || p_INDEX.OBJ_NAME || ' on ' || p_TABLE.OBJ_OWNER || '.' || p_TABLE.OBJ_NAME || '(';
    --
    --
    i := p_INDEX_COL_EXPRS.first;
    --
    v_SQL := v_SQL || upper(p_INDEX_COL_EXPRS(i));
    --
    --
    i := p_INDEX_COL_EXPRS.next(i);
    --
    while (i is not null)
    loop
      --
      v_SQL := v_SQL || ',' || upper(p_INDEX_COL_EXPRS(i));
      --
      --
      i := p_INDEX_COL_EXPRS.next(i);
      --
    end loop;
    --
    --
    v_SQL := v_SQL || ')';
    --
    --
    if (p_Create_Addition is not null)
    then
      v_SQL := v_SQL || ' ' || p_Create_Addition;
    end if;
    --
    --
    Execute_DDL(v_SQL
               ,v_Prevent_DDL_EXCE_CODES
               ,p_Prevent_EXCE);
    --
  exception
    when others then
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
  end Create_INDEX;
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
  * WWirns    03.05.2018  Create_UNIQUE_INDEX:Added as copy from NGA20708
  *******************************************************************************/
  --
  procedure Create_UNIQUE_INDEX(p_TABLE                  in dl_common.OT_DB_OBJECT
                               ,p_INDEX                  in dl_common.OT_DB_OBJECT
                               ,p_INDEX_COL_EXPRS        in dl_common.TT_VCC
                               ,p_Create_Addition        in varchar2
                               ,p_Drop_Wrong_Index       in boolean default false
                               ,p_Prevent_DDL_EXCE_CODES in dl_common.TT_N5 default dl_common.TT_N5(-00955)
                               ,p_Prevent_EXCE           in boolean default false
                                --
                                ) is
    --
    v_Prevent_DDL_EXCE_CODES dl_common.TT_N5;
    v_C0                     sys_refcursor;
    v_SQL                    varchar2(32767 char);
    i                        integer;
    --
  begin
    --
    --
    if (p_INDEX_COL_EXPRS.count() < 1)
    then
      Raise_application_error(-20000
                             ,'Paramter p_INDEX_COL_EXPRS is empty!');
    end if;
    --
    --
    if (p_Prevent_DDL_EXCE_CODES is null)
    then
      v_Prevent_DDL_EXCE_CODES := dl_common.TT_N5();
    else
      v_Prevent_DDL_EXCE_CODES := p_Prevent_DDL_EXCE_CODES;
    end if;
    --
    --
    begin
      --
      select t.INDEX_TYPE
        into v_SQL
        from ALL_INDEXES t
       where t.TABLE_OWNER = p_TABLE.OBJ_OWNER
         and t.TABLE_NAME = p_TABLE.OBJ_NAME
         and t.OWNER = p_INDEX.OBJ_OWNER
         and t.INDEX_NAME = p_INDEX.OBJ_NAME;
      --
      if (v_SQL not in ('NORMAL'
                       ,'FUNCTION-BASED NORMAL'))
      then
        --
        -- !!! Could be more index types !!!
        -- NORMAL/REV
        -- IOT - TOP
        -- FUNCTION-BASED DOMAIN
        -- FUNCTION-BASED NORMAL
        -- BITMAP
        -- NORMAL
        --
        Raise_application_error(-20000
                               ,'This procedure does not support INDEX_TYPE[''' || v_SQL || ''']!');
        --
      end if;
      --
      --
      v_SQL := Check_SQL4Create_INDEX(p_TABLE
                                     ,p_INDEX
                                     ,p_INDEX_COL_EXPRS
                                     ,p_Prevent_EXCE
                                      --
                                      );
      --
      --
      open v_C0 for v_SQL;
      --
      fetch v_C0
        into i;
      --
      if (v_C0%found)
      then
        --
        if (nvl(p_Drop_Wrong_Index
               ,false))
        then
          --
          --
          v_SQL := 'drop index ' || p_INDEX.OBJ_OWNER || '.' || p_INDEX.OBJ_NAME;
          --
          Execute_DDL(v_SQL
                     ,v_Prevent_DDL_EXCE_CODES
                     ,p_Prevent_EXCE);
          --
        else
          --
          Raise_application_error(-20001
                                 ,'Index has wrong column list!');
          --
        end if;
        --
      end if;
      --
      close v_C0;
      --
    exception
      when NO_DATA_FOUND then
        -- Index does not exists!
        null;
    end;
    --
    --
    v_SQL := '
create unique index ' || p_INDEX.OBJ_OWNER || '.' || p_INDEX.OBJ_NAME || ' on ' || p_TABLE.OBJ_OWNER || '.' || p_TABLE.OBJ_NAME || '(';
    --
    --
    i := p_INDEX_COL_EXPRS.first;
    --
    v_SQL := v_SQL || upper(p_INDEX_COL_EXPRS(i));
    --
    --
    i := p_INDEX_COL_EXPRS.next(i);
    --
    while (i is not null)
    loop
      --
      v_SQL := v_SQL || ',' || upper(p_INDEX_COL_EXPRS(i));
      --
      --
      i := p_INDEX_COL_EXPRS.next(i);
      --
    end loop;
    --
    --
    v_SQL := v_SQL || ')';
    --
    --
    if (p_Create_Addition is not null)
    then
      v_SQL := v_SQL || ' ' || p_Create_Addition;
    end if;
    --
    --
    Execute_DDL(v_SQL
               ,v_Prevent_DDL_EXCE_CODES
               ,p_Prevent_EXCE);
    --
  exception
    when others then
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
  end Create_UNIQUE_INDEX;
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
  * WWirns    03.05.2018  Create_SEQUENCE:Added as copy from NGA20708
  *******************************************************************************/
  --
  procedure Create_SEQUENCE(p_SEQUENCE               in dl_common.OT_DB_OBJECT
                           ,p_MIN_VALUE              in number
                           ,p_MAX_VALUE              in number
                           ,p_START_WITH             in number
                           ,p_INCREMENT_BY           in number
                           ,p_CACHE_SIZE             in pls_integer default 20
                           ,p_IS_CYCLE               in boolean default false
                           ,p_IS_ORDER               in boolean default false
                           ,p_Prevent_DDL_EXCE_CODES in dl_common.TT_N5 default dl_common.TT_N5(-00955
                                                                                               ,-04007
                                                                                               ,-04009)
                           ,p_Prevent_EXCE           in boolean default false
                            --
                            ) is
    --
    v_Prevent_DDL_EXCE_CODES dl_common.TT_N5;
    --
  begin
    --
    --
    -- SEQUENCE_OWNER  SEQUENCE_NAME MIN_VALUE MAX_VALUE INCREMENT_BY  CYCLE_FLAG  ORDER_FLAG  CACHE_SIZE  LAST_NUMBER
    -- DEMOGRAPHIC     SEQ_WWI_0     -1E19     -1        -1            N           N           20          -1
    -- DEMOGRAPHIC     SEQ_WWI_1     1         1E19      1             N           N           20          1
    --    select t.*
    --    from all_sequences t
    --    where t.sequence_owner = 'DEMOGRAPHIC'
    --    and t.sequence_name like 'SEQ_WWI%'
    --    and (t.last_number = t.min_value or t.last_number = t.max_value)
    --
    --
    if (p_Prevent_DDL_EXCE_CODES is null)
    then
      v_Prevent_DDL_EXCE_CODES := dl_common.TT_N5();
    else
      v_Prevent_DDL_EXCE_CODES := p_Prevent_DDL_EXCE_CODES;
    end if;
    --
    --
    Execute_DDL('
create sequence ' || p_SEQUENCE.OBJ_OWNER || '.' || p_SEQUENCE.OBJ_NAME || '
  minvalue ' || trim(p_MIN_VALUE) || '
  maxvalue ' || trim(p_MAX_VALUE) || '
  start with ' || trim(p_START_WITH) || '
  increment by ' || trim(p_INCREMENT_BY)
                --
                || case when(p_CACHE_SIZE is not null) then case when(p_CACHE_SIZE > 0) then '
  cache ' || trim(p_CACHE_SIZE) else 'nocache' end else '' end
                --
                || case when(p_IS_CYCLE is not null) then '
  ' || case when(p_IS_CYCLE) then '' else 'no' end || 'cycle' else '' end
                --
                || case when(p_IS_ORDER is not null) then '
  ' || case when(p_IS_ORDER) then '' else 'no' end || 'order' else '' end
               ,v_Prevent_DDL_EXCE_CODES
               ,p_Prevent_EXCE);
    --
    Execute_DDL('
alter sequence ' || p_SEQUENCE.OBJ_OWNER || '.' || p_SEQUENCE.OBJ_NAME || '
  minvalue ' || trim(p_MIN_VALUE)
               ,v_Prevent_DDL_EXCE_CODES
               ,p_Prevent_EXCE);
    --
    Execute_DDL('
alter sequence ' || p_SEQUENCE.OBJ_OWNER || '.' || p_SEQUENCE.OBJ_NAME || '
  maxvalue ' || trim(p_MAX_VALUE)
               ,v_Prevent_DDL_EXCE_CODES
               ,p_Prevent_EXCE);
    --
    Execute_DDL('
alter sequence ' || p_SEQUENCE.OBJ_OWNER || '.' || p_SEQUENCE.OBJ_NAME || '
  increment by ' || trim(p_INCREMENT_BY)
                --
                || case when(p_CACHE_SIZE is not null) then case when(p_CACHE_SIZE > 0) then '
  cache ' || trim(p_CACHE_SIZE) else 'nocache' end else '' end
                --
                || case when(p_IS_CYCLE is not null) then '
  ' || case when(p_IS_CYCLE) then '' else 'no' end || 'cycle' else '' end
                --
                || case when(p_IS_ORDER is not null) then '
  ' || case when(p_IS_ORDER) then '' else 'no' end || 'order' else '' end
               ,v_Prevent_DDL_EXCE_CODES
               ,p_Prevent_EXCE);
    --
  exception
    when others then
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        raise;
      end if;
      --
  end Create_SEQUENCE;

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
end PKG_DDL_UTIL;
/
  GRANT EXECUTE ON "DL_DBA"."PKG_DDL_UTIL" TO PUBLIC;
  GRANT EXECUTE ON "DL_DBA"."PKG_DDL_UTIL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_DBA"."PKG_DDL_UTIL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_DBA"."PKG_DDL_UTIL" TO "BIOSUPPORT";
