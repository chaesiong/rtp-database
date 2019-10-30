CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."PORTS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "LATITUDE", "LONGITUDE", "ALTITUDE", "COUNTRY", "CITY", "TZ_OFFSET", "TZ_REGION", "TZ_ABBREV", "PORT_TYPE_MASK", "UN_LOCODE", "NUM_VALUE", "IS_SEA_PORT", "IS_AIRPORT", "IS_RAIL_TERMINAL", "IS_ROAD_TERMINAL", "PORTS$RI", "PORTS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE           as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE    as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE           as NOTICE$DLC
        ,t1.LATITUDE
        ,t1.LONGITUDE
        ,t1.ALTITUDE
        ,t1.COUNTRY
        ,t1.CITY
        ,t1.TZ_OFFSET
        ,t1.TZ_REGION
        ,t1.TZ_ABBREV
        ,t1.PORT_TYPE_MASK
        ,t1.UN_LOCODE
        ,t1.NUM_VALUE
        ,t1.IS_SEA_PORT
        ,t1.IS_AIRPORT
        ,t1.IS_RAIL_TERMINAL
        ,t1.IS_ROAD_TERMINAL
        ,t1.rowid            as PORTS$RI
        ,null                as PORTS$I18N$RI
    from DL_COMMON.PORTS t1
   where t1.LOCALE = (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                        from dual)
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE           as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE    as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NOTICE           as NOTICE$DLC
        ,t1.LATITUDE
        ,t1.LONGITUDE
        ,t1.ALTITUDE
        ,t1.COUNTRY
        ,t1.CITY
        ,t1.TZ_OFFSET
        ,t1.TZ_REGION
        ,t1.TZ_ABBREV
        ,t1.PORT_TYPE_MASK
        ,t1.UN_LOCODE
        ,t1.NUM_VALUE
        ,t1.IS_SEA_PORT
        ,t1.IS_AIRPORT
        ,t1.IS_RAIL_TERMINAL
        ,t1.IS_ROAD_TERMINAL
        ,t1.rowid            as PORTS$RI
        ,t2.rowid            as PORTS$I18N$RI
    from DL_COMMON.PORTS t1
    left join DL_COMMON.PORTS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_COMMON"."PORTS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."PORTS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PORTS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PORTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORTS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PORTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORTS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."PORTS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."PORTS$LC" TO "BIOSUPPORT";
