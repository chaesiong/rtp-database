CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."MESSAGES$LC" ("MESSAGE_KEY", "KEY_DELIMITER", "LOCALE", "LOCALE$DLC", "MESSAGE_VALUE", "MESSAGE_VALUE$DLC", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "OWNER", "MESSAGES$RI", "MESSAGES$I18N$RI") AS 
  select t1.MESSAGE_KEY
        ,t1.KEY_DELIMITER
        ,t1.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.MESSAGE_VALUE
        ,t1.MESSAGE_VALUE as MESSAGE_VALUE$DLC
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.OWNER
        ,t1.rowid         as MESSAGES$RI
        ,null             as MESSAGES$I18N$RI
    from DL_COMMON.MESSAGES t1
   where t1.LOCALE = (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                        from dual)
  union all
  select t1.MESSAGE_KEY
        ,t1.KEY_DELIMITER
        ,t2.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t2.MESSAGE_VALUE
        ,t1.MESSAGE_VALUE as MESSAGE_VALUE$DLC
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.OWNER
        ,t1.rowid         as MESSAGES$RI
        ,t2.rowid         as MESSAGES$I18N$RI
    from DL_COMMON.MESSAGES t1
    left join DL_COMMON.MESSAGES$I18N t2
      on (t1.MESSAGE_KEY = t2.MESSAGE_KEY and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."MESSAGES$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."MESSAGES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."MESSAGES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."MESSAGES$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$LC" TO "PORNRUKSA_S";
