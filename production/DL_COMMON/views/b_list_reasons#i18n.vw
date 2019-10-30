CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."B_LIST_REASONS#I18N" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "B_LIST_REASONS$RI", "B_LIST_REASONS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.rowid         as B_LIST_REASONS$RI
        ,null             as B_LIST_REASONS$I18N$RI
    from DL_COMMON.B_LIST_REASONS t1
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.rowid         as B_LIST_REASONS$RI
        ,t2.rowid         as B_LIST_REASONS$I18N$RI
    from DL_COMMON.B_LIST_REASONS t1
   inner join DL_COMMON.B_LIST_REASONS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_COMMON"."B_LIST_REASONS#I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."B_LIST_REASONS#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."B_LIST_REASONS#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."B_LIST_REASONS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."B_LIST_REASONS#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."B_LIST_REASONS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."B_LIST_REASONS#I18N" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."B_LIST_REASONS#I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."B_LIST_REASONS#I18N" TO "BIOSUPPORT";
