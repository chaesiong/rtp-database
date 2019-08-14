CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."ROLES#I18N" ("ID", "NAME", "NAME$DLC", "DESCRIPTION", "DESCRIPTION$DLC", "SORT_ORDER", "IS_ACTIVE", "LOCALE", "LOCALE$DLC", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "ROW_FLAG_MASK", "TAG", "ROLES$RI", "ROLES$I18N$RI") AS 
  select t1.ID
        ,t1.NAME
        ,t1.NAME          as NAME$DLC
        ,t1.DESCRIPTION
        ,t1.DESCRIPTION   as DESCRIPTION$DLC
        ,t1.SORT_ORDER
        ,t1.IS_ACTIVE
        ,t1.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.rowid         as ROLES$RI
        ,null             as ROLES$I18N$RI
    from ROLES t1
  union all
  select t1.ID
        ,t2.NAME
        ,t1.NAME          as NAME$DLC
        ,t2.DESCRIPTION
        ,t1.DESCRIPTION   as DESCRIPTION$DLC
        ,t1.SORT_ORDER
        ,t1.IS_ACTIVE
        ,t2.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.rowid         as ROLES$RI
        ,t2.rowid         as ROLES$I18N$RI
    from ROLES t1
   inner join ROLES$I18N t2
      on (t1.ID = t2.ID);
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLES#I18N" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLES#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLES#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLES#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLES#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLES#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLES#I18N" TO "APPSUP";
