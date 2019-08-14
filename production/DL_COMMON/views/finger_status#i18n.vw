CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."FINGER_STATUS#I18N" ("KEY_VALUE", "LOCALE", "DISPLAY_VALUE", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NUM_VALUE", "FINGER_STATUS$RI", "FINGER_STATUS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NUM_VALUE
        ,t1.rowid         as FINGER_STATUS$RI
        ,null             as FINGER_STATUS$I18N$RI
    from DL_COMMON.FINGER_STATUS t1
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NUM_VALUE
        ,t1.rowid         as FINGER_STATUS$RI
        ,t2.rowid         as FINGER_STATUS$I18N$RI
    from DL_COMMON.FINGER_STATUS t1
   inner join DL_COMMON.FINGER_STATUS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS#I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."FINGER_STATUS#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."FINGER_STATUS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."FINGER_STATUS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS#I18N" TO "APPSUP";
