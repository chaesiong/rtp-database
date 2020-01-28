CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."BC_DOC_CLASS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "ISSUING_AUTHORITY", "BC_DOC_CLASS$RI", "BC_DOC_CLASS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE            as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE            as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ISSUING_AUTHORITY
        ,t1.rowid             as BC_DOC_CLASS$RI
        ,null                 as BC_DOC_CLASS$I18N$RI
    from DL_COMMON.BC_DOC_CLASS t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE            as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NOTICE            as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ISSUING_AUTHORITY
        ,t1.rowid             as BC_DOC_CLASS$RI
        ,t2.rowid             as BC_DOC_CLASS$I18N$RI
    from DL_COMMON.BC_DOC_CLASS t1
    left join DL_COMMON.BC_DOC_CLASS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_COMMON"."BC_DOC_CLASS$LC" TO "PUNYAWII_D";
