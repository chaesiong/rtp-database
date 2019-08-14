CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."ORG_UNITS$LC" ("ID", "NAME", "NAME$DLC", "DESCRIPTION", "DESCRIPTION$DLC", "STREET", "STREET$DLC", "CITY", "CITY$DLC", "STATE_PROVINCE", "STATE_PROVINCE$DLC", "POSTCODE", "POSTCODE$DLC", "COUNTRY", "CONTACT_INFO", "CONTACT_INFO$DLC", "SORT_ORDER", "IS_ACTIVE", "LOCALE", "LOCALE$DLC", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "ROW_FLAG_MASK", "TAG", "ORG_UNITS$RI", "ORG_UNITS$I18N$RI") AS 
  select t1.ID
        ,t1.NAME
        ,t1.NAME           as NAME$DLC
        ,t1.DESCRIPTION
        ,t1.DESCRIPTION    as DESCRIPTION$DLC
        ,t1.STREET
        ,t1.STREET         as STREET$DLC
        ,t1.CITY
        ,t1.CITY           as CITY$DLC
        ,t1.STATE_PROVINCE
        ,t1.STATE_PROVINCE as STATE_PROVINCE$DLC
        ,t1.POSTCODE
        ,t1.POSTCODE       as POSTCODE$DLC
        ,t1.COUNTRY
        ,t1.CONTACT_INFO
        ,t1.CONTACT_INFO   as CONTACT_INFO$DLC
        ,t1.SORT_ORDER
        ,t1.IS_ACTIVE
        ,t1.LOCALE
        ,t1.LOCALE         as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.rowid          as ORG_UNITS$RI
        ,null              as ORG_UNITS$I18N$RI
    from ORG_UNITS t1
   where t1.LOCALE = (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                        from dual)
  union all
  select t1.ID
        ,t2.NAME
        ,t1.NAME           as NAME$DLC
        ,t2.DESCRIPTION
        ,t1.DESCRIPTION    as DESCRIPTION$DLC
        ,t2.STREET
        ,t1.STREET         as STREET$DLC
        ,t2.CITY
        ,t1.CITY           as CITY$DLC
        ,t2.STATE_PROVINCE
        ,t1.STATE_PROVINCE as STATE_PROVINCE$DLC
        ,t2.POSTCODE
        ,t1.POSTCODE       as POSTCODE$DLC
        ,t1.COUNTRY
        ,t2.CONTACT_INFO
        ,t1.CONTACT_INFO   as CONTACT_INFO$DLC
        ,t1.SORT_ORDER
        ,t1.IS_ACTIVE
        ,t2.LOCALE
        ,t1.LOCALE         as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.ROW_FLAG_MASK
        ,t1.TAG
        ,t1.rowid          as ORG_UNITS$RI
        ,t2.rowid          as ORG_UNITS$I18N$RI
    from ORG_UNITS t1
    left join ORG_UNITS$I18N t2
      on (t1.ID = t2.ID and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != (select DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                         from dual);
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$LC" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$LC" TO "TESTADM";
