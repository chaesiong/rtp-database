CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$LC" ("KEY_VALUE", "DML_AT", "DML_BY", "DML_TYPE", "INS_AT", "INS_BY", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "NAME$DLC", "DISPLAY_CODE", "DISPLAY_ORDER", "IS_ACTIVE", "NOTICE", "ADM_CLASS_PROVINCE$RI", "ADM_CLASS_PROVINCE$I18N$RI", "ADM_CLASS_REGION") AS 
  SELECT t1.key_value
        ,t1.dml_at
        ,t1.dml_by
        ,t1.dml_type
        ,t1.ins_at
        ,t1.ins_by
        ,t1.locale
        ,t1.locale        AS locale$DLC
        ,t1.display_value
        ,t1.display_value AS name$dlc
        ,t1.display_code
        ,t1.display_order
        ,t1.is_active
        ,t1.notice
        ,t1.ROWID             AS adm_class_province$ri
        ,NULL                 AS adm_class_province$i18n$ri
        ,t1.adm_class_region
    FROM dl_bordercontrol.adm_class_province t1
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
        ,t1.rowid             AS adm_class_province$ri
        ,t2.rowid             AS adm_class_province$i18n$ri
        ,t1.adm_class_region
    FROM dl_bordercontrol.adm_class_province t1
    LEFT JOIN dl_bordercontrol.adm_class_province$i18n t2
      ON (t1.key_value = t2.key_value and t2.locale = dl_common.pkg_i18n.get_sess_data_locale())
   WHERE t1.locale != dl_common.pkg_i18n.get_sess_data_locale()
;
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$LC" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$LC" TO "TESTADM";