CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."ROLE_ROLE_REL_POOL" ("SOURCE", "ROLE_ID_OR_DN", "ROLE_ID", "ROLE_DN", "MEMBER_ROLE_ID_OR_DN", "MEMBER_ROLE_ID", "MEMBER_ROLE_DN", "INSERT_DATE", "INSERT_SOURCE", "UPDATE_DATE", "UPDATE_SOURCE") AS 
  select 2 as source
        ,coalesce(t0.ROLE_ID
                 ,t0.ROLE_DN) as ROLE_ID_OR_DN
        ,t0.ROLE_ID
        ,t0.ROLE_DN
        ,coalesce(t0.MEMBER_ROLE_ID
                 ,t0.MEMBER_ROLE_DN) as MEMBER_ROLE_ID_OR_DN
        ,t0.MEMBER_ROLE_ID
        ,t0.MEMBER_ROLE_DN
        ,t0.INS_AT as INSERT_DATE
        ,t0.INS_BY as INSERT_SOURCE
        ,t0.DML_AT as UPDATE_DATE
        ,t0.DML_BY as UPDATE_SOURCE
    from ROLE_ROLE_REL t0
   where nvl2(t0.ROLE_ID
             ,pkg_param_config.F_Param_Value_Is_ON('role_from_dl_um')
             ,pkg_param_config.F_Param_Value_Is_ON('role_from_ad')) = 1
  union all
  select 1    as source
        ,t.DN as ROLE_ID_OR_DN
        ,null as ROLE_ID
        ,t.DN as ROLE_DN
        ,r.DN as MEMBER_ROLE_ID_OR_DN
        ,null as MEMBER_ROLE_ID
        ,r.DN as MEMBER_ROLE_DN
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
               ) t
   inner join table(DL_LDAP.Get_Roles()) r
      on (t.VAL = r.DN);
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL_POOL" TO "APPSUP";
