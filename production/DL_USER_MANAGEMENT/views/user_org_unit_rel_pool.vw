CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" ("RELATION_SOURCE", "USER_ID_OR_DN", "USER_ID", "USER_DN", "ORG_UNIT_ID_OR_DN", "ORG_UNIT_ID", "ORG_UNIT_DN", "INSERT_DATE", "INSERT_SOURCE", "UPDATE_DATE", "UPDATE_SOURCE") AS 
  select 'UM' as relation_source
        ,coalesce(user_id
                 ,user_dn) as user_id_or_dn
        ,user_id
        ,user_dn
        ,coalesce(ORG_UNIT_id
                 ,ORG_UNIT_dn) as ORG_UNIT_id_or_dn
        ,ORG_UNIT_ID
        ,ORG_UNIT_DN
        ,INS_AT as insert_date
        ,INS_BY as insert_source
        ,DML_AT as update_date
        ,DML_BY as update_source
    from USER_ORG_UNIT_REL
   where nvl2(user_id
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_dl_um')
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad')) = 1
     and nvl2(ORG_UNIT_id
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'org_unit_from_dl_um')
             ,pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'org_unit_from_ad')) = 1
  union all
  select 'AD' as RELATION_SOURCE
        ,t0.DN as USER_ID_OR_DN
        ,null as USER_ID
        ,t0.DN as USER_DN
        ,substr(t0.DN
               ,t0.POS_OF_OU) as ORG_UNIT_ID_OR_DN
        ,null as ORG_UNIT_ID
        ,substr(t0.DN
               ,t0.POS_OF_OU) as ORG_UNIT_DN
        ,null as INSERT_DATE
        ,null as INSERT_SOURCE
        ,null as UPDATE_DATE
        ,null as UPDATE_SOURCE
    from (
          --
          select t.DN
                 ,instr(t.DN
                       ,'OU=') as POS_OF_OU
            from table(DL_LDAP.Get_Entries(p_Filter           => 'objectCategory=user'
                                           ,p_Attribute        => ''
                                           ,p_Check_Param_Mask => 5
                                            --
                                            )
                        --
                        ) t
          --
          ) t0
   where t0.POS_OF_OU > 0;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL_POOL" TO "BIOSAADM";
