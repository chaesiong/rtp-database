CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."SALUTATIONS$LC" ("KEY_VALUE", "DML_AT", "DML_BY", "DML_TYPE", "INS_AT", "INS_BY", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "NAME$DLC", "DISPLAY_CODE", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "SALUTATIONS$RI", "SALUTATIONS$I18N$RI") AS 
  SELECT t1.key_value
        ,t1.dml_at
        ,t1.dml_by
        ,t1.dml_type
        ,t1.ins_at
        ,t1.ins_by
        ,t1.locale
        ,t1.locale            AS locale$DLC
        ,t1.display_value
        ,t1.display_value     AS name$dlc
        ,t1.display_code
        ,t1.display_order
        ,t1.is_active
        ,t1.notice
        ,t1.ROWID             AS salutations$ri
        ,NULL                 AS salutations$i18n$ri
    FROM dl_common.salutations t1
   WHERE t1.locale = dl_common.pkg_i18n.get_sess_data_locale()
  UNION ALL
  SELECT t1.key_value
        ,t2.dml_at
        ,t2.dml_by
        ,t2.dml_type
        ,t2.ins_at
        ,t2.ins_by
        ,t2.locale
        ,t1.locale            AS locale$dlc
        ,t2.display_value
        ,t1.display_value     AS name$dlc
        ,t1.display_code
        ,t1.display_order
        ,t1.is_active
        ,t1.notice
        ,t1.rowid             AS salutations$ri
        ,t2.rowid             AS salutations$i18n$ri
    FROM dl_common.salutations t1
    LEFT JOIN dl_common.salutations$i18n t2
      ON (t1.key_value = t2.key_value and t2.locale = dl_common.pkg_i18n.get_sess_data_locale())
   WHERE t1.locale != dl_common.pkg_i18n.get_sess_data_locale()
;
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."SALUTATIONS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."SALUTATIONS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."SALUTATIONS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$LC" TO "APPSUP";
