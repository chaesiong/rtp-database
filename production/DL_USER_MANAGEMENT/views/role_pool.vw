CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."ROLE_POOL" ("SOURCE", "ID_OR_DN", "NAME", "DESCRIPTION", "SORT_ORDER") AS 
  select 2             as source
        ,t.ID          as ID_OR_DN
        ,t.NAME
        ,t.DESCRIPTION
        ,t.SORT_ORDER
    from roles t
   where pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'role_from_dl_um') = 1
  union all
  select 1             as source
        ,t.DN          as ID_OR_DN
        ,t.ROLE_NAME   as name
        ,t.DESCRIPTION
        ,null          as SORT_ORDER
    from table(DL_LDAP.Get_Roles()) t;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_POOL" TO "PORNRUKSA_S";
