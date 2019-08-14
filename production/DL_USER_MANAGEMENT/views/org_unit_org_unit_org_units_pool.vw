CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL" ("SOURCE", "ORG_UNIT_ID_OR_DN", "ORG_UNIT_ID", "ORG_UNIT_DN", "NAME", "DESCRIPTION") AS 
  select 2             as source
        ,u.ID          as ORG_UNIT_ID_OR_DN
        ,u.ID          as ORG_UNIT_ID
        ,null          as ORG_UNIT_DN
        ,u.NAME
        ,u.DESCRIPTION
    from ORG_UNITS u
   where pkg_param_config.F_Param_Value_Is_ON('org_unit_from_dl_um') = 1
  union all
  select 1               as source
        ,t.DN            as ORG_UNIT_ID_OR_DN
        ,null            as ORG_UNIT_ID
        ,t.DN            as ORG_UNIT_DN
        ,t.ORG_UNIT_NAME as name
        ,t.DESCRIPTION
    from table(DL_LDAP.Get_Org_Units()) t;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL" TO "APPSUP";
