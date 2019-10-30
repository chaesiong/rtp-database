CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."HUMAN_FINGERS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "HUMAN_FINGERS$RI", "HUMAN_FINGERS$I18N$RI") AS 
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
        ,t1.rowid         as HUMAN_FINGERS$RI
        ,null             as HUMAN_FINGERS$I18N$RI
    from DL_COMMON.HUMAN_FINGERS t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
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
        ,t1.rowid         as HUMAN_FINGERS$RI
        ,t2.rowid         as HUMAN_FINGERS$I18N$RI
    from DL_COMMON.HUMAN_FINGERS t1
    left join DL_COMMON.HUMAN_FINGERS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_COMMON"."HUMAN_FINGERS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."HUMAN_FINGERS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."HUMAN_FINGERS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."HUMAN_FINGERS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."HUMAN_FINGERS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."HUMAN_FINGERS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."HUMAN_FINGERS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."HUMAN_FINGERS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."HUMAN_FINGERS$LC" TO "BIOSUPPORT";
