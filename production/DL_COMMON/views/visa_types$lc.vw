CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."VISA_TYPES$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "TRANS_MODE", "ICAO_DC_LIST", "PERMIT_DAYS", "CAN_EDIT_EXPIRY_DT", "AUTO_GENERATE_VISA", "VISA_TYPES$RI", "VISA_TYPES$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE             as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE      as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.NOTICE
        ,t1.NOTICE             as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.TRANS_MODE
        ,t1.ICAO_DC_LIST
        ,t1.PERMIT_DAYS
        ,t1.CAN_EDIT_EXPIRY_DT
        ,t1.AUTO_GENERATE_VISA
        ,t1.rowid              as VISA_TYPES$RI
        ,null                  as VISA_TYPES$I18N$RI
    from DL_COMMON.VISA_TYPES t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE             as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE      as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t2.NOTICE
        ,t1.NOTICE             as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.TRANS_MODE
        ,t1.ICAO_DC_LIST
        ,t1.PERMIT_DAYS
        ,t1.CAN_EDIT_EXPIRY_DT
        ,t1.AUTO_GENERATE_VISA
        ,t1.rowid              as VISA_TYPES$RI
        ,t2.rowid              as VISA_TYPES$I18N$RI
    from DL_COMMON.VISA_TYPES t1
    left join DL_COMMON.VISA_TYPES$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."VISA_TYPES$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."VISA_TYPES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."VISA_TYPES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_COMMON"."VISA_TYPES$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$LC" TO "SANTIPATN_P";
