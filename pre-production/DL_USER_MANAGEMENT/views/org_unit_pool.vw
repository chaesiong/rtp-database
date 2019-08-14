CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."ORG_UNIT_POOL" ("SOURCE", "ID_OR_DN", "NAME", "DESCRIPTION", "SORT_ORDER") AS 
  select 2             as source
        ,t.ID          as ID_OR_DN
        ,t.NAME
        ,t.DESCRIPTION
        ,t.SORT_ORDER
    from ORG_UNITS t
   where pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'org_unit_from_dl_um') = 1
  union all
  select 1               as source
        ,t.DN            as ID_OR_DN
        ,t.ORG_UNIT_NAME as name
        ,t.DESCRIPTION
        ,null            as SORT_ORDER
    from table(DL_LDAP.Get_Org_Units()) t;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_POOL" TO "TESTADM";
