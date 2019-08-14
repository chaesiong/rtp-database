CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL_POOL" ("SOURCE", "COMPUTER_ID_OR_DN", "COMPUTER_ID", "COMPUTER_DN", "ROLE_ID_OR_DN", "ROLE_ID", "ROLE_DN", "INSERT_DATE", "INSERT_SOURCE", "UPDATE_DATE", "UPDATE_SOURCE") AS 
  with LDAP_COMPUTERS as
   (select c0.DN
          ,c0.PRIMARYGROUPID
      from table(DL_LDAP.Get_Computers()) c0
    --
    )
  select 2 as source
        ,coalesce(t0.COMPUTER_ID
                 ,t0.COMPUTER_DN) as COMPUTER_ID_OR_DN
        ,t0.COMPUTER_ID
        ,t0.COMPUTER_DN
        ,coalesce(t0.ROLE_ID
                 ,t0.ROLE_DN) as ROLE_ID_OR_DN
        ,t0.ROLE_ID
        ,t0.ROLE_DN
        ,t0.INS_AT as INSERT_DATE
        ,t0.INS_BY as INSERT_SOURCE
        ,t0.DML_AT as UPDATE_DATE
        ,t0.DML_BY as UPDATE_SOURCE
    from COMPUTER_ROLE_REL t0
   where nvl2(t0.COMPUTER_ID
             ,pkg_param_config.F_Param_Value_Is_ON('computer_from_dl_um')
             ,pkg_param_config.F_Param_Value_Is_ON('computer_from_ad')) = 1
     and nvl2(t0.ROLE_ID
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'role_from_dl_um')
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'role_from_ad')) = 1
  union all
  select 1    as source
        ,c.DN as COMPUTER_ID_OR_DN
        ,null as COMPUTER_ID
        ,c.DN as COMPUTER_DN
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
   inner join LDAP_COMPUTERS c
      on (r.VAL = c.DN)
  union all
  select 1    as source
        ,c.DN as COMPUTER_ID_OR_DN
        ,null as COMPUTER_ID
        ,c.DN as COMPUTER_DN
        ,r.DN as ROLE_ID_OR_DN
        ,null as ROLE_ID
        ,r.DN as ROLE_DN
        ,null as INSERT_DATE
        ,null as INSERT_SOURCE
        ,null as UPDATE_DATE
        ,null as UPDATE_SOURCE
    from LDAP_COMPUTERS c
   inner join table (DL_LDAP.Get_Roles()) r
      on (c.primaryGroupID = substr(r.SID
                             ,instr(r.SID
                                   ,'-'
                                   ,-1) + 1));
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL_POOL" TO "TESTADM";