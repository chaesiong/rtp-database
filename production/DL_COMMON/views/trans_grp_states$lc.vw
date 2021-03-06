CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."TRANS_GRP_STATES$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "TRANS_GRP_STATES$RI", "TRANS_GRP_STATES$I18N$RI") AS 
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
        ,t1.rowid         as TRANS_GRP_STATES$RI
        ,null             as TRANS_GRP_STATES$I18N$RI
    from DL_COMMON.TRANS_GRP_STATES t1
   where t1.LOCALE = (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                        from dual)
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
        ,t1.rowid         as TRANS_GRP_STATES$RI
        ,t2.rowid         as TRANS_GRP_STATES$I18N$RI
    from DL_COMMON.TRANS_GRP_STATES t1
    left join DL_COMMON.TRANS_GRP_STATES$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."TRANS_GRP_STATES$LC" TO "SANTIPATN_P";
