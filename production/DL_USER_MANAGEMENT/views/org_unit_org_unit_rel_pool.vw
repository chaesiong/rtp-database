CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" ("SOURCE", "ORG_UNIT_ID_OR_DN", "ORG_UNIT_ID", "ORG_UNIT_DN", "MEMBER_ORG_UNIT_ID_OR_DN", "MEMBER_ORG_UNIT_ID", "MEMBER_ORG_UNIT_DN", "INSERT_DATE", "INSERT_SOURCE", "UPDATE_DATE", "UPDATE_SOURCE") AS 
  select 2 as source
        ,coalesce(t0.ORG_UNIT_ID
                 ,t0.ORG_UNIT_DN) as ORG_UNIT_ID_OR_DN
        ,t0.ORG_UNIT_ID
        ,t0.ORG_UNIT_DN
        ,coalesce(t0.MEMBER_ORG_UNIT_ID
                 ,t0.MEMBER_ORG_UNIT_DN) as MEMBER_ORG_UNIT_ID_OR_DN
        ,t0.MEMBER_ORG_UNIT_ID
        ,t0.MEMBER_ORG_UNIT_DN
        ,t0.INS_AT as INSERT_DATE
        ,t0.INS_BY as INSERT_SOURCE
        ,t0.DML_AT as UPDATE_DATE
        ,t0.DML_BY as UPDATE_SOURCE
    from ORG_UNIT_ORG_UNIT_REL t0
   where nvl2(t0.ORG_UNIT_ID
             ,pkg_param_config.F_Param_Value_Is_ON('org_unit_from_dl_um')
             ,pkg_param_config.F_Param_Value_Is_ON('org_unit_from_ad')) = 1
  union all
  select 1                 as source
        ,t.ORG_UNIT_PARENT as ORG_UNIT_ID_OR_DN
        ,null              as ORG_UNIT_ID
        ,t.ORG_UNIT_PARENT as ORG_UNIT_DN
        ,t.DN              as MEMBER_ORG_UNIT_ID_OR_DN
        ,null              as MEMBER_ORG_UNIT_ID
        ,t.DN              as MEMBER_ORG_UNIT_DN
        ,null              as INSERT_DATE
        ,null              as INSERT_SOURCE
        ,null              as UPDATE_DATE
        ,null              as UPDATE_SOURCE
    from table(DL_LDAP.Get_Org_Units()) t
   where t.ORG_UNIT_PARENT is not null;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL_POOL" TO "SANTIPATN_P";
