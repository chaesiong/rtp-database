CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" ("RELATION_SOURCE", "USER_ID_OR_DN", "USER_ID", "USER_DN", "ROLE_ID_OR_DN", "ROLE_ID", "ROLE_DN", "INSERT_DATE", "INSERT_SOURCE", "UPDATE_DATE", "UPDATE_SOURCE") AS 
  with LDAP_USERS as
   (select u0.DN
          ,u0.PRIMARYGROUPID
      from table(DL_LDAP.Get_Users()) u0
    --
    )
  select 'UM' as RELATION_SOURCE
        ,coalesce(t.USER_ID
                 ,t.USER_DN) as USER_ID_OR_DN
        ,t.USER_ID
        ,t.USER_DN
        ,coalesce(t.ROLE_ID
                 ,t.ROLE_DN) as ROLE_ID_OR_DN
        ,t.ROLE_ID
        ,t.ROLE_DN
        ,t.INS_AT as INSERT_DATE
        ,t.INS_BY as INSERT_SOURCE
        ,t.DML_AT as UPDATE_DATE
        ,t.DML_BY as UPDATE_SOURCE
    from USER_ROLE_REL t
   where nvl2(t.USER_ID
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_dl_um')
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad')) = 1
     and nvl2(t.ROLE_ID
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'role_from_dl_um')
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'role_from_ad')) = 1
  union all
  select 'AD' as RELATION_SOURCE
        ,u.DN as USER_ID_OR_DN
        ,null as USER_ID
        ,u.DN as USER_DN
        ,r.DN as ROLE_ID_OR_DN
        ,null as ROLE_ID
        ,r.DN as ROLE_DN
        ,null as INSERT_DATE
        ,null as INSERT_SOURCE
        ,null as UPDATE_DATE
        ,null as UPDATE_SOURCE
    from table(DL_LDAP.Get_Entries(p_Filter           => 'objectCategory=group'
                                  ,p_Attribute        => 'member'
                                  ,p_Check_Param_Mask => 2
                                   --
                                   )
               --
               ) r
   inner join LDAP_USERS u
      on (r.VAL = u.DN)
  union all
  select 'AD' as RELATION_SOURCE
        ,u.DN as USER_ID_OR_DN
        ,null as USER_ID
        ,u.DN as USER_DN
        ,r.DN as ROLE_ID_OR_DN
        ,null as ROLE_ID
        ,r.DN as ROLE_DN
        ,null as INSERT_DATE
        ,null as INSERT_SOURCE
        ,null as UPDATE_DATE
        ,null as UPDATE_SOURCE
    from LDAP_USERS u
   inner join table (DL_LDAP.Get_Roles()) r
      on (u.primaryGroupID = substr(r.SID
                             ,instr(r.SID
                                   ,'-'
                                   ,-1) + 1));
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL_POOL" TO "SANTIPATN_P";
