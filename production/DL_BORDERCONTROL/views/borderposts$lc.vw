CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."BORDERPOSTS$LC" ("KEY_VALUE", "BORDER_TYPE", "NAME", "NAME$DLC", "IS_ACTIVE", "BORDER_TO_COUNTRY", "LOCALE", "LOCALE$DLC", "DISPLAY_ORDER", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "BORDERPOSTS$RI", "BORDERPOSTS$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.BORDER_TYPE
        ,t1.NAME
        ,t1.NAME              as NAME$DLC
        ,t1.IS_ACTIVE
        ,t1.BORDER_TO_COUNTRY
        ,t1.LOCALE
        ,t1.LOCALE            as LOCALE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.rowid             as BORDERPOSTS$RI
        ,null                 as BORDERPOSTS$I18N$RI
    from DL_BORDERCONTROL.BORDERPOSTS t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.KEY_VALUE
        ,t1.BORDER_TYPE
        ,t2.NAME
        ,t1.NAME              as NAME$DLC
        ,t1.IS_ACTIVE
        ,t1.BORDER_TO_COUNTRY
        ,t2.LOCALE
        ,t1.LOCALE            as LOCALE$DLC
        ,t1.DISPLAY_ORDER
        ,t2.INS_AT
        ,t2.INS_BY
        ,t2.DML_AT
        ,t2.DML_BY
        ,t2.DML_TYPE
        ,t1.rowid             as BORDERPOSTS$RI
        ,t2.rowid             as BORDERPOSTS$I18N$RI
    from DL_BORDERCONTROL.BORDERPOSTS t1
    left join DL_BORDERCONTROL.BORDERPOSTS$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$LC" TO "PORNRUKSA_S";
