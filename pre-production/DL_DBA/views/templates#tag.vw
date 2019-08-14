CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_DBA"."TEMPLATES#TAG" ("KEY_VALUE", "LOCALE", "DISPLAY_VALUE", "DISPLAY_ORDER", "IS_ACTIVE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "NOTICE", "NUM_VALUE", "ROW_FLAG_MASK", "OWNER", "TAG", "NOTICE$TAG", "INS_AT$TAG", "INS_BY$TAG", "DML_AT$TAG", "DML_BY$TAG", "DML_TYPE$TAG", "ROW_FLAG_MASK$TAG", "OWNER$TAG", "TEMPLATE_KEY", "TEMPLATE_VAL", "TEMPLATES$RI", "TEMPLATES$TAG$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t1.OWNER
        ,t2.TAG
        ,t2.NOTICE        as NOTICE$TAG
        ,t2.INS_AT        as INS_AT$TAG
        ,t2.INS_BY        as INS_BY$TAG
        ,t2.DML_AT        as DML_AT$TAG
        ,t2.DML_BY        as DML_BY$TAG
        ,t2.DML_TYPE      as DML_TYPE$TAG
        ,t2.ROW_FLAG_MASK as ROW_FLAG_MASK$TAG
        ,t2.OWNER         as OWNER$TAG
        ,t1.TEMPLATE_KEY
        ,t1.TEMPLATE_VAL
        ,t1.rowid         as TEMPLATES$RI
        ,t2.rowid         as TEMPLATES$TAG$RI
    from DL_DBA.TEMPLATES t1
    left join DL_DBA.TEMPLATES$TAG t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_DBA"."TEMPLATES#TAG" TO "BIO_BD";
  GRANT DELETE ON "DL_DBA"."TEMPLATES#TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_DBA"."TEMPLATES#TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES#TAG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_DBA"."TEMPLATES#TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES#TAG" TO "TESTADM";
