CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."GRANTS$LC" ("ID", "NAME", "NAME$DLC", "DESCRIPTION", "DESCRIPTION$DLC", "SORT_ORDER", "LOCALE", "LOCALE$DLC", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "ROW_FLAG_MASK", "TAG", "GRANTS$RI", "GRANTS$I18N$RI") AS 
  select t1.ID
        ,t1.NAME
        ,t1.NAME          as NAME$DLC
        ,t1.DESCRIPTION
        ,t1.DESCRIPTION   as DESCRIPTION$DLC
        ,t1.SORT_ORDER
        ,t1.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.rowid         as GRANTS$RI
        ,null             as GRANTS$I18N$RI
    from GRANTS t1
   where t1.LOCALE = (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                        from dual)
  union all
  select t1.ID
        ,t2.NAME
        ,t1.NAME          as NAME$DLC
        ,t2.DESCRIPTION
        ,t1.DESCRIPTION   as DESCRIPTION$DLC
        ,t1.SORT_ORDER
        ,t2.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.rowid         as GRANTS$RI
        ,t2.rowid         as GRANTS$I18N$RI
    from GRANTS t1
    left join GRANTS$I18N t2
      on (t1.ID = t2.ID and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$LC" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."GRANTS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."GRANTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."GRANTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$LC" TO "APPSUP";
