CREATE OR REPLACE EDITIONABLE PACKAGE "DL_DBA"."PKG_DDL_UTIL" authid current_user is
  --
  --
  --
  function C_DBOPT_PARALLEL_BACKUP_RECOVE return varchar2 deterministic;
  function C_DBOPT_PARALLEL_EXECUTION return varchar2 deterministic;
  function C_DBOPT_PARALLEL_LOAD return varchar2 deterministic;
  function C_DBOPT_PARTITIONING return varchar2 deterministic;
  --
  --
  --
  function Is_DB_Option_(p_DBOPT in varchar2
                         --
                         ) return pls_integer;
  --
  function Is_DB_Option(p_DBOPT in varchar2
                        --
                        ) return boolean;
  --
  --
  --
  function Is_Parallel_Execution_ return pls_integer;
  --
  function Is_Parallel_Execution return boolean;
  --
  --
  --
  function Is_Partitioning_ return pls_integer;
  --
  function Is_Partitioning return boolean;
  --
  --
  --
  procedure Move_Table2TBLSPC$AT(p_TBLSPCS             in DL_COMMON.VT_DB_TBLSPC
                                ,p_TBLS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                                ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_INCULDE_PARTITIONED in pls_integer default 1
                                 --
                                 );
  --
  procedure Move_Table2TBLSPC$AT(p_TBLSPC              in DL_COMMON.OT_DB_TBLSPC
                                ,p_TBLS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                                ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_INCULDE_PARTITIONED in pls_integer default 1
                                 --
                                 );
  --
  --
  --
  procedure Move_LOB2TBLSPC$AT(p_TBLSPCS             in DL_COMMON.VT_DB_TBLSPC
                              ,p_TBLS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                              ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                              ,p_ONLY_TAB_COLS       in DL_COMMON.VT_DB_TAB_COL default null
                              ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                              ,p_EXCL_TAB_COLS       in DL_COMMON.VT_DB_TAB_COL default null
                              ,p_INCULDE_PARTITIONED in pls_integer default 1
                               --
                               );
  --
  procedure Move_LOB2TBLSPC$AT(p_TBLSPC              in DL_COMMON.OT_DB_TBLSPC
                              ,p_TBLS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                              ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                              ,p_ONLY_TAB_COLS       in DL_COMMON.VT_DB_TAB_COL default null
                              ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                              ,p_EXCL_TAB_COLS       in DL_COMMON.VT_DB_TAB_COL default null
                              ,p_INCULDE_PARTITIONED in pls_integer default 1
                               --
                               );
  --
  --
  --
  procedure Move_Index2TBLSPC$AT(p_TBLSPCS             in DL_COMMON.VT_DB_TBLSPC
                                ,p_IDXS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                                ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_ONLY_IDXS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_IDXS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_INCULDE_PARTITIONED in pls_integer default 1
                                 --
                                 );
  --
  procedure Move_Index2TBLSPC$AT(p_TBLSPC              in DL_COMMON.OT_DB_TBLSPC
                                ,p_IDXS_OF_OWNER       in DL_COMMON.OT_DB_OWNER default null
                                ,p_ONLY_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_ONLY_IDXS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_TBLS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_EXCL_IDXS           in DL_COMMON.VT_DB_OBJECT default null
                                ,p_INCULDE_PARTITIONED in pls_integer default 1
                                 --
                                 );
  --
  --
  --
  procedure Rebuild_Indexes$AT(p_IDXS_OF_OWNER        in DL_COMMON.OT_DB_OWNER default null
                              ,p_ONLY_TBLS            in DL_COMMON.VT_DB_OBJECT default null
                              ,p_ONLY_IDXS            in DL_COMMON.VT_DB_OBJECT default null
                              ,p_EXCL_TBLS            in DL_COMMON.VT_DB_OBJECT default null
                              ,p_EXCL_IDXS            in DL_COMMON.VT_DB_OBJECT default null
                              ,p_INCULDE_PARTITIONED  in pls_integer default 1
                              ,p_ONLY_INVALID_INDEXES in pls_integer default 1
                               --
                               );
  --
  --
  --
  procedure Ensure_Char_Semantic$AT(p_TBLS_OF_OWNER in DL_COMMON.OT_DB_OWNER default null
                                   ,p_ONLY_TBLS     in DL_COMMON.VT_DB_OBJECT default null
                                   ,p_ONLY_TAB_COLS in DL_COMMON.VT_DB_TAB_COL default null
                                   ,p_EXCL_TBLS     in DL_COMMON.VT_DB_OBJECT default null
                                   ,p_EXCL_TAB_COLS in DL_COMMON.VT_DB_TAB_COL default null
                                   ,p_CHAR_SEMANTIC in varchar2 default 'C'
                                    --
                                    );
  --
  --
  --
  procedure Recompile(p_SCHEMA              in DL_COMMON.OT_DB_OWNER
                     ,p_IS_DEPENDED_SCHEMAS in pls_integer default 1
                      --
                      );
  --
  --
  --
  function L2CL$PL(p_SQL in varchar2
                   --
                   ) return dl_common.TT_10VCC_10CL
    pipelined;
  --
  --
  --
  function Execute_DDL(p_DDL                in varchar2
                      ,p_Prevent_EXCE_CODES in dl_common.TT_N5 default null
                      ,p_Prevent_EXEC       in boolean default false
                      ,p_Get_Row_Count      in boolean default false
                       --
                       ) return integer;
  --
  function Execute_DDL(p_DDL               in varchar2
                      ,p_Prevent_EXCE_CODE in pls_integer
                      ,p_Prevent_EXEC      in boolean default false
                      ,p_Get_Row_Count     in boolean default false
                       --
                       ) return integer;
  --
  procedure Execute_DDL(p_DDL                in varchar2
                       ,p_Prevent_EXCE_CODES in dl_common.TT_N5 default null
                       ,p_Prevent_EXEC       in boolean default false
                        --
                        );
  --
  procedure Execute_DDL(p_DDL               in varchar2
                       ,p_Prevent_EXCE_CODE in pls_integer
                       ,p_Prevent_EXEC      in boolean default false
                        --
                        );
  --
  --
  --
  function Execute_DML(p_DML                in varchar2
                      ,p_Prevent_EXCE_CODES in dl_common.TT_N5 default null
                      ,p_Prevent_EXEC       in boolean default false
                       --
                       ) return integer;
  --
  function Execute_DML(p_DML               in varchar2
                      ,p_Prevent_EXCE_CODE in pls_integer
                      ,p_Prevent_EXEC      in boolean default false
                       --
                       ) return integer;
  --
  --
  --
  function Check_SQL4Create_INDEX(p_TABLE           in dl_common.OT_DB_OBJECT
                                 ,p_INDEX           in dl_common.OT_DB_OBJECT
                                 ,p_INDEX_COL_EXPRS in dl_common.TT_VCC
                                 ,p_Prevent_EXCE    in boolean default false
                                  --
                                  ) return varchar2;
  --
  --
  --
  procedure Create_INDEX(p_TABLE                  in dl_common.OT_DB_OBJECT
                        ,p_INDEX                  in dl_common.OT_DB_OBJECT
                        ,p_INDEX_COL_EXPRS        in dl_common.TT_VCC
                        ,p_Create_Addition        in varchar2
                        ,p_Drop_Wrong_Index       in boolean default false
                        ,p_Prevent_DDL_EXCE_CODES in dl_common.TT_N5 default dl_common.TT_N5(-00955)
                        ,p_Prevent_EXCE           in boolean default false
                         --
                         );
  --
  --
  --
  procedure Create_UNIQUE_INDEX(p_TABLE                  in dl_common.OT_DB_OBJECT
                               ,p_INDEX                  in dl_common.OT_DB_OBJECT
                               ,p_INDEX_COL_EXPRS        in dl_common.TT_VCC
                               ,p_Create_Addition        in varchar2
                               ,p_Drop_Wrong_Index       in boolean default false
                               ,p_Prevent_DDL_EXCE_CODES in dl_common.TT_N5 default dl_common.TT_N5(-00955)
                               ,p_Prevent_EXCE           in boolean default false
                                --
                                );
  --
  --
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
end PKG_DDL_UTIL;
/
