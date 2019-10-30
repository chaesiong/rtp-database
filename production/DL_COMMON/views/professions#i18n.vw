CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."PROFESSIONS#I18N" ("KEY_VALUE", "DML_AT", "DML_BY", "DML_TYPE", "INS_AT", "INS_BY", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "NAME$DLC", "DISPLAY_CODE", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "PROFESSIONS$RI", "PROFESSIONS$I18N$RI") AS 
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
        ,t1.ROWID             AS professions$ri
        ,NULL                 AS professions$i18n$ri
    FROM dl_common.professions t1
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
        ,t1.rowid             AS professions$ri
        ,t2.rowid             AS professions$i18n$ri
    FROM dl_common.professions t1
   INNER JOIN dl_common.professions$i18n t2
      ON (t1.key_value = t2.key_value);
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS#I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PROFESSIONS#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PROFESSIONS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PROFESSIONS#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS#I18N" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS#I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS#I18N" TO "BIOSUPPORT";
