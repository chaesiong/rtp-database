CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "DISPLAY_CODE", "IS_ACTIVE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "ROW_FLAG_MASK", "ROW_FLAG_MASK$I18N", "FAF_PERMIT_TYPE$RI", "FAF_PERMIT_TYPE$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE           as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE    as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.display_code
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,null             as ROW_FLAG_MASK$I18N
        ,t1.rowid            as FAF_PERMIT_TYPE$RI
        ,null                as FAF_PERMIT_TYPE$I18N$RI
    from DL_BORDERCONTROL.FAF_PERMIT_TYPE t1
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE           as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE    as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.display_code
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t2.NOTICE
        ,t1.NOTICE           as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t2.ROW_FLAG_MASK as ROW_FLAG_MASK$I18N
        ,t1.rowid            as FAF_PERMIT_TYPE$RI
        ,t2.rowid            as FAF_PERMIT_TYPE$I18N$RI
    from DL_BORDERCONTROL.FAF_PERMIT_TYPE t1
   inner join DL_BORDERCONTROL.FAF_PERMIT_TYPE$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#I18N" TO "PUNYAWII_D";
