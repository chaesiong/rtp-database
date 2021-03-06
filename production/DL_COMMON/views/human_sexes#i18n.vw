CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."HUMAN_SEXES#I18N" ("KEY_VALUE", "LOCALE", "DISPLAY_VALUE", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "ISO5218", "ICAO", "NUM_VALUE", "HUMAN_SEXES$RI", "HUMAN_SEXES$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.ISO5218
        ,t1.ICAO
        ,t1.NUM_VALUE
        ,t1.rowid         as HUMAN_SEXES$RI
        ,null             as HUMAN_SEXES$I18N$RI
    from DL_COMMON.HUMAN_SEXES t1
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.ISO5218
        ,t1.ICAO
        ,t1.NUM_VALUE
        ,t1.rowid         as HUMAN_SEXES$RI
        ,t2.rowid         as HUMAN_SEXES$I18N$RI
    from DL_COMMON.HUMAN_SEXES t1
   inner join DL_COMMON.HUMAN_SEXES$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES#I18N" TO "SANTIPATN_P";
