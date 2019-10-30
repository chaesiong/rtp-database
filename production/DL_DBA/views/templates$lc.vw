CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_DBA"."TEMPLATES$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "ROW_FLAG_MASK", "ROW_FLAG_MASK$I18N", "OWNER", "OWNER$I18N", "TEMPLATE_KEY", "TEMPLATE_VAL", "TEMPLATES$RI", "TEMPLATES$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,null             as ROW_FLAG_MASK$I18N
        ,t1.OWNER
        ,null             as OWNER$I18N
        ,t1.TEMPLATE_KEY
        ,t1.TEMPLATE_VAL
        ,t1.rowid         as TEMPLATES$RI
        ,null             as TEMPLATES$I18N$RI
    from DL_DBA.TEMPLATES t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t2.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t2.ROW_FLAG_MASK as ROW_FLAG_MASK$I18N
        ,t1.OWNER
        ,t2.OWNER         as OWNER$I18N
        ,t1.TEMPLATE_KEY
        ,t1.TEMPLATE_VAL
        ,t1.rowid         as TEMPLATES$RI
        ,t2.rowid         as TEMPLATES$I18N$RI
    from DL_DBA.TEMPLATES t1
    left join DL_DBA.TEMPLATES$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_DBA"."TEMPLATES$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_DBA"."TEMPLATES$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_DBA"."TEMPLATES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_DBA"."TEMPLATES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$LC" TO "APPSUP";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$LC" TO "BIOSUPPORT";
