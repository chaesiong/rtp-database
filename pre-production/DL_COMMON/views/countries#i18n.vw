CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."COUNTRIES#I18N" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "NOTICE", "NOTICE$DLC", "ISO3166_A3", "ISO3166_A2", "ISO3166_NUM", "TL_DOMAIN", "PHONE_AREA_CODE", "ICAO_LOC_PART", "NATIONALITY", "NUM_VALUE", "ROW_FLAG_MASK", "ROW_FLAG_MASK$I18N", "OFFICIAL_LANGUAGE", "OWNER", "OWNER$I18N", "COUNTRIES$RI", "COUNTRIES$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE            as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NOTICE            as NOTICE$DLC
        ,t1.ISO3166_A3
        ,t1.ISO3166_A2
        ,t1.ISO3166_NUM
        ,t1.TL_DOMAIN
        ,t1.PHONE_AREA_CODE
        ,t1.ICAO_LOC_PART
        ,t1.NATIONALITY
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,null                 as ROW_FLAG_MASK$I18N
        ,t1.OFFICIAL_LANGUAGE
        ,t1.OWNER
        ,null                 as OWNER$I18N
        ,t1.rowid             as COUNTRIES$RI
        ,null                 as COUNTRIES$I18N$RI
    from DL_COMMON.COUNTRIES t1
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE            as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t2.NOTICE
        ,t1.NOTICE            as NOTICE$DLC
        ,t1.ISO3166_A3
        ,t1.ISO3166_A2
        ,t1.ISO3166_NUM
        ,t1.TL_DOMAIN
        ,t1.PHONE_AREA_CODE
        ,t1.ICAO_LOC_PART
        ,t2.NATIONALITY
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t2.ROW_FLAG_MASK     as ROW_FLAG_MASK$I18N
        ,t1.OFFICIAL_LANGUAGE
        ,t1.OWNER
        ,t2.OWNER             as OWNER$I18N
        ,t1.rowid             as COUNTRIES$RI
        ,t2.rowid             as COUNTRIES$I18N$RI
    from DL_COMMON.COUNTRIES t1
   inner join DL_COMMON.COUNTRIES$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_COMMON"."COUNTRIES#I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."COUNTRIES#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."COUNTRIES#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."COUNTRIES#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."COUNTRIES#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES#I18N" TO "TESTADM";