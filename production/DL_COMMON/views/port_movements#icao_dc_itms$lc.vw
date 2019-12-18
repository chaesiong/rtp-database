CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "IS_NEED_ENTRY_FORM", "ICAO_DC_LIST4NO_ENTRY_FORM", "MUST_APPROVE_ENTRY_FORM_NO", "ICAO_DOC_CODE", "PORT_MOVEMENTS$RI", "PORT_MOVEMENTS$I18N$RI", "ICAO_DC_LISTS$RI", "ICAO_DC_LIST_ITMS$RI") AS 
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
        ,t0.IS_NEED_ENTRY_FORM
        ,t0.ICAO_DC_LIST4NO_ENTRY_FORM
        ,t0.MUST_APPROVE_ENTRY_FORM_NO
        ,t2.ICAO_DOC_CODE
        ,t0.PORT_MOVEMENTS$RI
        ,t0.PORT_MOVEMENTS$I18N$RI
        ,t1.rowid                      as ICAO_DC_LISTS$RI
        ,t2.rowid                      as ICAO_DC_LIST_ITMS$RI
    from DL_COMMON.PORT_MOVEMENTS$LC t0
    left join(DL_COMMON.ICAO_DC_LISTS t1
   inner join DL_COMMON.ICAO_DC_LIST_ITMS t2
      on (t1.KEY_VALUE = t2.KEY_VALUE)) on (t0.ICAO_DC_LIST4NO_ENTRY_FORM = t1.KEY_VALUE);
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS#ICAO_DC_ITMS$LC" TO "PORNRUKSA_S";
