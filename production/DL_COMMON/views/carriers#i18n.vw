CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."CARRIERS#I18N" ("KEY_VALUE", "LOCALE", "DISPLAY_VALUE", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "CARRIER_TYPE_MASK", "COUNTRY", "ICAO", "IATA_PREFIX", "IATA", "NUM_VALUE", "IS_SEA_CARRIER", "IS_AIR_CARRIER", "IS_RAIL_CARRIER", "IS_ROAD_CARRIER", "CARRIERS$RI", "CARRIERS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
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
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
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
   inner join DL_COMMON.CARRIERS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_COMMON"."CARRIERS#I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."CARRIERS#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."CARRIERS#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."CARRIERS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CARRIERS#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."CARRIERS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CARRIERS#I18N" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."CARRIERS#I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."CARRIERS#I18N" TO "BIOSAADM";
