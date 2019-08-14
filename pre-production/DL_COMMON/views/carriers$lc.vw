CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."CARRIERS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "CARRIER_TYPE_MASK", "COUNTRY", "ICAO", "IATA_PREFIX", "IATA", "NUM_VALUE", "IS_SEA_CARRIER", "IS_AIR_CARRIER", "IS_RAIL_CARRIER", "IS_ROAD_CARRIER", "CARRIERS$RI", "CARRIERS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE            as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE            as NOTICE$DLC
        ,t1.CARRIER_TYPE_MASK
        ,t1.COUNTRY
        ,t1.ICAO
        ,t1.IATA_PREFIX
        ,t1.IATA
        ,t1.NUM_VALUE
        ,t1.IS_SEA_CARRIER
        ,t1.IS_AIR_CARRIER
        ,t1.IS_RAIL_CARRIER
        ,t1.IS_ROAD_CARRIER
        ,t1.rowid             as CARRIERS$RI
        ,null                 as CARRIERS$I18N$RI
    from DL_COMMON.CARRIERS t1
   where t1.LOCALE = (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                        from dual)
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
        ,t1.CARRIER_TYPE_MASK
        ,t1.COUNTRY
        ,t1.ICAO
        ,t1.IATA_PREFIX
        ,t1.IATA
        ,t1.NUM_VALUE
        ,t1.IS_SEA_CARRIER
        ,t1.IS_AIR_CARRIER
        ,t1.IS_RAIL_CARRIER
        ,t1.IS_ROAD_CARRIER
        ,t1.rowid             as CARRIERS$RI
        ,t2.rowid             as CARRIERS$I18N$RI
    from DL_COMMON.CARRIERS t1
    left join DL_COMMON.CARRIERS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_COMMON"."CARRIERS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."CARRIERS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."CARRIERS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."CARRIERS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CARRIERS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."CARRIERS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CARRIERS$LC" TO "TESTADM";