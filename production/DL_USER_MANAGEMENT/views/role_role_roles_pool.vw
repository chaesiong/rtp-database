CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" ("SOURCE", "ROLE_ID_OR_DN", "ROLE_ID", "ROLE_DN", "NAME", "DESCRIPTION") AS 
  select 2              as source
        ,u0.ID          as ROLE_ID_OR_DN
        ,u0.ID          as ROLE_ID
        ,null           as ROLE_DN
        ,u0.NAME
        ,u0.DESCRIPTION
    from ROLES u0
   where pkg_param_config.F_Param_Value_Is_ON('role_from_dl_um') = 1
  union all
  select 1              as source
        ,t0.DN          as ROLE_ID_OR_DN
        ,null           as ROLE_ID
        ,t0.DN          as ROLE_DN
        ,t0.ROLE_NAME   as name
        ,t0.DESCRIPTION
    from table(DL_LDAP.Get_Roles()) t0;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_ROLES_POOL" TO "DL_BORDERCONTROL";
