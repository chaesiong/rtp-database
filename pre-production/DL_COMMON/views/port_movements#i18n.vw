CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."PORT_MOVEMENTS#I18N" ("KEY_VALUE", "LOCALE", "DISPLAY_VALUE", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NUM_VALUE", "IS_NEED_ENTRY_FORM", "ICAO_DC_LIST4NO_ENTRY_FORM", "MUST_APPROVE_ENTRY_FORM_NO", "PORT_MOVEMENTS$RI", "PORT_MOVEMENTS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NUM_VALUE
        ,t1.IS_NEED_ENTRY_FORM
        ,t1.ICAO_DC_LIST4NO_ENTRY_FORM
        ,t1.MUST_APPROVE_ENTRY_FORM_NO
        ,t1.rowid                      as PORT_MOVEMENTS$RI
        ,null                          as PORT_MOVEMENTS$I18N$RI
    from DL_COMMON.PORT_MOVEMENTS t1
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NUM_VALUE
        ,t1.IS_NEED_ENTRY_FORM
        ,t1.ICAO_DC_LIST4NO_ENTRY_FORM
        ,t1.MUST_APPROVE_ENTRY_FORM_NO
        ,t1.rowid                      as PORT_MOVEMENTS$RI
        ,t2.rowid                      as PORT_MOVEMENTS$I18N$RI
    from DL_COMMON.PORT_MOVEMENTS t1
   inner join DL_COMMON.PORT_MOVEMENTS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PORT_MOVEMENTS#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PORT_MOVEMENTS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PORT_MOVEMENTS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#I18N" TO "TESTADM";
