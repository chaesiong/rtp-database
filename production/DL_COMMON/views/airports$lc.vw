CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."AIRPORTS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "LATITUDE", "LONGITUDE", "ALTITUDE", "COUNTRY", "CITY", "TZ_OFFSET", "TZ_REGION", "TZ_ABBREV", "ICAO", "IATA", "NUM_VALUE", "AIRPORTS$RI", "AIRPORTS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.LATITUDE
        ,t1.LONGITUDE
        ,t1.ALTITUDE
        ,t1.COUNTRY
        ,t1.CITY
        ,t1.TZ_OFFSET
        ,t1.TZ_REGION
        ,t1.TZ_ABBREV
        ,t1.ICAO
        ,t1.IATA
        ,t1.NUM_VALUE
        ,t1.rowid         as AIRPORTS$RI
        ,null             as AIRPORTS$I18N$RI
    from DL_COMMON.AIRPORTS t1
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
        ,t1.LATITUDE
        ,t1.LONGITUDE
        ,t1.ALTITUDE
        ,t1.COUNTRY
        ,t1.CITY
        ,t1.TZ_OFFSET
        ,t1.TZ_REGION
        ,t1.TZ_ABBREV
        ,t1.ICAO
        ,t1.IATA
        ,t1.NUM_VALUE
        ,t1.rowid         as AIRPORTS$RI
        ,t2.rowid         as AIRPORTS$I18N$RI
    from DL_COMMON.AIRPORTS t1
    left join DL_COMMON.AIRPORTS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."AIRPORTS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."AIRPORTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."AIRPORTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."AIRPORTS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS$LC" TO "PUNYAWII_D";
