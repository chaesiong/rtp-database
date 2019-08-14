CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."LOOKUPS$LC" ("KEY_CATEGORY", "KEY_VALUE", "PARENT_KEY_CATEGORY", "PARENT_KEY_VALUE", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "LOCALE", "LOCALE$DLC", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "ROW_FLAG_MASK", "TAG", "DISPLAY_VALUE_SHORT", "DISPLAY_VALUE_SHORT$DLC", "DISPLAY_VALUE_ALTERNATIVE", "DISPLAY_VALUE_ALTERNATIVE$DLC", "VALUE_LARGE_DATA_ID", "LOOKUPS$RI", "LOOKUPS$I18N$RI") AS 
  select t1.KEY_CATEGORY
        ,t1.KEY_VALUE
        ,t1.PARENT_KEY_CATEGORY
        ,t1.PARENT_KEY_VALUE
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE             as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE                    as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.LOCALE
        ,t1.LOCALE                    as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.DISPLAY_VALUE_SHORT
        ,t1.DISPLAY_VALUE_SHORT       as DISPLAY_VALUE_SHORT$DLC
        ,t1.DISPLAY_VALUE_ALTERNATIVE
        ,t1.DISPLAY_VALUE_ALTERNATIVE as DISPLAY_VALUE_ALTERNATIVE$DLC
        ,t1.VALUE_LARGE_DATA_ID
        ,t1.rowid                     as LOOKUPS$RI
        ,null                         as LOOKUPS$I18N$RI
    from LOOKUPS t1
   where t1.LOCALE = (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                        from dual)
  union all
  select t1.KEY_CATEGORY
        ,t1.KEY_VALUE
        ,t1.PARENT_KEY_CATEGORY
        ,t1.PARENT_KEY_VALUE
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE             as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NOTICE                    as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t2.LOCALE
        ,t1.LOCALE                    as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t2.DISPLAY_VALUE_SHORT
        ,t1.DISPLAY_VALUE_SHORT       as DISPLAY_VALUE_SHORT$DLC
        ,t2.DISPLAY_VALUE_ALTERNATIVE
        ,t1.DISPLAY_VALUE_ALTERNATIVE as DISPLAY_VALUE_ALTERNATIVE$DLC
        ,t1.VALUE_LARGE_DATA_ID
        ,t1.rowid                     as LOOKUPS$RI
        ,t2.rowid                     as LOOKUPS$I18N$RI
    from LOOKUPS t1
    left join LOOKUPS$I18N t2
      on (t1.KEY_CATEGORY = t2.KEY_CATEGORY and t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$LC" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LOOKUPS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LOOKUPS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LOOKUPS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$LC" TO "TESTADM";
