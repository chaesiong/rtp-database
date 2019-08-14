CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."APEX_MENU$LC" ("KEY_VALUE", "PARENT_KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "NOTICE", "NOTICE$DLC", "TARGET", "IS_CURRENT_LIST_ENTRY", "IMAGE", "IMAGE_ATTRIBUTE", "IMAGE_ALT_ATTRIBUTE", "APP_ALIAS", "PAGE_ID", "OWNER", "APEX_MENU$RI", "APEX_MENU$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.PARENT_KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE                as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE         as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.NOTICE
        ,t1.NOTICE                as NOTICE$DLC
        ,t1.TARGET
        ,t1.IS_CURRENT_LIST_ENTRY
        ,t1.IMAGE
        ,t1.IMAGE_ATTRIBUTE
        ,t1.IMAGE_ALT_ATTRIBUTE
        ,t1.APP_ALIAS
        ,t1.PAGE_ID
        ,t1.OWNER
        ,t1.rowid                 as APEX_MENU$RI
        ,null                     as APEX_MENU$I18N$RI
    from DL_COMMON.APEX_MENU t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.KEY_VALUE
        ,t1.PARENT_KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE                as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE         as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t2.NOTICE
        ,t1.NOTICE                as NOTICE$DLC
        ,t1.TARGET
        ,t1.IS_CURRENT_LIST_ENTRY
        ,t1.IMAGE
        ,t1.IMAGE_ATTRIBUTE
        ,t1.IMAGE_ALT_ATTRIBUTE
        ,t1.APP_ALIAS
        ,t1.PAGE_ID
        ,t1.OWNER
        ,t1.rowid                 as APEX_MENU$RI
        ,t2.rowid                 as APEX_MENU$I18N$RI
    from DL_COMMON.APEX_MENU t1
    left join DL_COMMON.APEX_MENU$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."APEX_MENU$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."APEX_MENU$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."APEX_MENU$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$LC" TO "APPSUP";
