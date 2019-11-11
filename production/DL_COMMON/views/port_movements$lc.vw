CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."PORT_MOVEMENTS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "IS_NEED_ENTRY_FORM", "ICAO_DC_LIST4NO_ENTRY_FORM", "MUST_APPROVE_ENTRY_FORM_NO", "PORT_MOVEMENTS$RI", "PORT_MOVEMENTS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE                     as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE              as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE                     as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.IS_NEED_ENTRY_FORM
        ,t1.ICAO_DC_LIST4NO_ENTRY_FORM
        ,t1.MUST_APPROVE_ENTRY_FORM_NO
        ,t1.rowid                      as PORT_MOVEMENTS$RI
        ,null                          as PORT_MOVEMENTS$I18N$RI
    from DL_COMMON.PORT_MOVEMENTS t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE                     as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE              as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NOTICE                     as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.IS_NEED_ENTRY_FORM
        ,t1.ICAO_DC_LIST4NO_ENTRY_FORM
        ,t1.MUST_APPROVE_ENTRY_FORM_NO
        ,t1.rowid                      as PORT_MOVEMENTS$RI
        ,t2.rowid                      as PORT_MOVEMENTS$I18N$RI
    from DL_COMMON.PORT_MOVEMENTS t1
    left join DL_COMMON.PORT_MOVEMENTS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."PORT_MOVEMENTS$LC" TO "BIOSAADM";
