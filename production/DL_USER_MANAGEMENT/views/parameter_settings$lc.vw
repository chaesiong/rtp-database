CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" ("ID", "NAME", "NAME$DLC", "DISPLAY_NAME", "DISPLAY_NAME$DLC", "DESCRIPTION", "DESCRIPTION$DLC", "IS_MODIFIABLE_IN_APEX", "SORT_ORDER", "VALUE_TYPE", "DEFAULT_STR", "DEFAULT_NUM", "DEFAULT_IS_ON", "VALUE_STR", "VALUE_NUM", "VALUE_IS_ON", "ACTIVE_STR", "ACTIVE_NUM", "ACTIVE_IS_ON", "ACTIVE_VALUE", "LOCALE", "LOCALE$DLC", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "ROW_FLAG_MASK", "TAG", "PARAMETER_SETTINGS$RI", "PARAMETER_SETTINGS$I18N$RI") AS 
  select t1.ID
        ,t1.NAME
        ,t1.NAME                  as NAME$DLC
        ,t1.DISPLAY_NAME
        ,t1.DISPLAY_NAME          as DISPLAY_NAME$DLC
        ,t1.DESCRIPTION
        ,t1.DESCRIPTION           as DESCRIPTION$DLC
        ,t1.IS_MODIFIABLE_IN_APEX
        ,t1.SORT_ORDER
        ,t1.VALUE_TYPE
        ,t1.DEFAULT_STR
        ,t1.DEFAULT_NUM
        ,t1.DEFAULT_IS_ON
        ,t1.VALUE_STR
        ,t1.VALUE_NUM
        ,t1.VALUE_IS_ON
        ,t1.ACTIVE_STR
        ,t1.ACTIVE_NUM
        ,t1.ACTIVE_IS_ON
        ,t1.ACTIVE_VALUE
        ,t1.LOCALE
        ,t1.LOCALE                as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.rowid                 as PARAMETER_SETTINGS$RI
        ,null                     as PARAMETER_SETTINGS$I18N$RI
    from PARAMETER_SETTINGS t1
   where t1.LOCALE = (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                        from dual)
  union all
  select t1.ID
        ,t2.NAME
        ,t1.NAME                  as NAME$DLC
        ,t2.DISPLAY_NAME
        ,t1.DISPLAY_NAME          as DISPLAY_NAME$DLC
        ,t2.DESCRIPTION
        ,t1.DESCRIPTION           as DESCRIPTION$DLC
        ,t1.IS_MODIFIABLE_IN_APEX
        ,t1.SORT_ORDER
        ,t1.VALUE_TYPE
        ,t1.DEFAULT_STR
        ,t1.DEFAULT_NUM
        ,t1.DEFAULT_IS_ON
        ,t1.VALUE_STR
        ,t1.VALUE_NUM
        ,t1.VALUE_IS_ON
        ,t1.ACTIVE_STR
        ,t1.ACTIVE_NUM
        ,t1.ACTIVE_IS_ON
        ,t1.ACTIVE_VALUE
        ,t2.LOCALE
        ,t1.LOCALE                as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.rowid                 as PARAMETER_SETTINGS$RI
        ,t2.rowid                 as PARAMETER_SETTINGS$I18N$RI
    from PARAMETER_SETTINGS t1
    left join PARAMETER_SETTINGS$I18N t2
      on (t1.ID = t2.ID and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$LC" TO "BIOSUPPORT";
