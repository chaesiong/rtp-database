CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."BS_RELATIONSHIPS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "ROW_FLAG_MASK", "ROW_FLAG_MASK$I18N", "OWNER", "OWNER$I18N", "BS_RELATIONSHIPS$RI", "BS_RELATIONSHIPS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE           as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE    as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NOTICE           as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,null             as ROW_FLAG_MASK$I18N
        ,t1.OWNER
        ,null             as OWNER$I18N
         ,t1.rowid            as BS_RELATIONSHIPS$RI
         ,null                as BS_RELATIONSHIPS$I18N$RI
    from DL_COMMON.BS_RELATIONSHIPS t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE           as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE    as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t2.NOTICE
        ,t1.NOTICE           as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t2.ROW_FLAG_MASK as ROW_FLAG_MASK$I18N
        ,t1.OWNER
        ,t2.OWNER         as OWNER$I18N
         ,t1.rowid            as BS_RELATIONSHIPS$RI
         ,t2.rowid            as BS_RELATIONSHIPS$I18N$RI
    from DL_COMMON.BS_RELATIONSHIPS t1
    left join DL_COMMON.BS_RELATIONSHIPS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."BS_RELATIONSHIPS$LC" TO "PORNRUKSA_S";
