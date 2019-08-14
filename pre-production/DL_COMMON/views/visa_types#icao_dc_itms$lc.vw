CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."VISA_TYPES#ICAO_DC_ITMS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "TRANS_MODE", "ICAO_DC_LIST", "PERMIT_DAYS", "CAN_EDIT_EXPIRY_DT", "AUTO_GENERATE_VISA", "ICAO_DOC_CODE", "VISA_TYPES$RI", "VISA_TYPES$I18N$RI", "ICAO_DC_LISTS$RI", "ICAO_DC_LIST_ITMS$RI") AS 
  select t0.KEY_VALUE
        ,t0.LOCALE
        ,t0.LOCALE$DLC
        ,t0.DISPLAY_VALUE
        ,t0.DISPLAY_VALUE$DLC
        ,t0.DISPLAY_ORDER
        ,t0.IS_ACTIVE
        ,t0.NOTICE
        ,t0.NOTICE$DLC
        ,t0.NUM_VALUE
        ,t0.TRANS_MODE
        ,t0.ICAO_DC_LIST
        ,t0.PERMIT_DAYS
        ,t0.CAN_EDIT_EXPIRY_DT
        ,t0.AUTO_GENERATE_VISA
        ,t2.ICAO_DOC_CODE
        ,t0.VISA_TYPES$RI
        ,t0.VISA_TYPES$I18N$RI
        ,t1.rowid              as ICAO_DC_LISTS$RI
        ,t2.rowid              as ICAO_DC_LIST_ITMS$RI
    from DL_COMMON.VISA_TYPES$LC t0
    left join(DL_COMMON.ICAO_DC_LISTS t1
   inner join DL_COMMON.ICAO_DC_LIST_ITMS t2
      on (t1.KEY_VALUE = t2.KEY_VALUE)) on (t0.ICAO_DC_LIST = t1.KEY_VALUE)
   where t0.is_active = 'Y'
   order by CASE t2.is_default
              WHEN 'Y' THEN 1
              ELSE 0
            END DESC, t0.display_order ASC
;
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES#ICAO_DC_ITMS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES#ICAO_DC_ITMS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."VISA_TYPES#ICAO_DC_ITMS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."VISA_TYPES#ICAO_DC_ITMS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES#ICAO_DC_ITMS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."VISA_TYPES#ICAO_DC_ITMS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES#ICAO_DC_ITMS$LC" TO "TESTADM";
