CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" ("KEY_VALUE", "LOCALE", "DISPLAY_VALUE", "DISPLAY_ORDER", "DISPLAY_CODE", "IS_ACTIVE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "NOTICE", "NUM_VALUE", "ROW_FLAG_MASK", "OWNER", "TAG", "NOTICE$TAG", "INS_AT$TAG", "INS_BY$TAG", "DML_AT$TAG", "DML_BY$TAG", "DML_TYPE$TAG", "ROW_FLAG_MASK$TAG", "FAF_PERMIT_TYPE$RI", "FAF_PERMIT_TYPE$TAG$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.display_code
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t2.OWNER
        ,t2.TAG
        ,t2.NOTICE           as NOTICE$TAG
        ,t2.INS_AT           as INS_AT$TAG
        ,t2.INS_BY           as INS_BY$TAG
        ,t2.DML_AT           as DML_AT$TAG
        ,t2.DML_BY           as DML_BY$TAG
        ,t2.DML_TYPE         as DML_TYPE$TAG
        ,t2.ROW_FLAG_MASK    as ROW_FLAG_MASK$TAG
        ,t1.rowid            as FAF_PERMIT_TYPE$RI
        ,t2.rowid            as FAF_PERMIT_TYPE$TAG$RI
    from DL_BORDERCONTROL.FAF_PERMIT_TYPE t1
    left join DL_BORDERCONTROL.FAF_PERMIT_TYPE$TAG t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE#TAG" TO "PUNYAWII_D";
