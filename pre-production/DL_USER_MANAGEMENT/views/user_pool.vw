CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."USER_POOL" ("SOURCE", "ID_OR_DN", "USERNAME", "FIRST_NAME", "LAST_NAME", "DISPLAYNAME", "MAIL_ADDRESS") AS 
  select 2              as source
        ,t.ID           as ID_OR_DN
        ,t.USERNAME
        ,t.FIRST_NAME
        ,t.LAST_NAME
        ,null           as DISPLAYNAME
        ,t.MAIL_ADDRESS
    from users t
   where pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_dl_um') = 1
  union all
  select 1                as source
        ,t.DN             as ID_OR_DN
        ,t.SAMACCOUNTNAME as USERNAME
        ,null             as FIRST_NAME
        ,null             as LAST_NAME
        ,t.DISPLAYNAME
        ,t.MAIL           as MAIL_ADDRESS
    from table(DL_LDAP.Get_Users()) t;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_POOL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_POOL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_POOL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_POOL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_POOL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_POOL" TO "TESTADM";
