CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_USER_MANAGEMENT"."DROP_DB_OBJ$AICU" (p_FROM_SCHEMA     in varchar2
                                                               ,p_Creation_Prefix in varchar2 default null
                                                                --
                                                                ) authid current_user is
  --
  --
  /*******************************************************************************
  * ???
  *
  *
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * WWirns    22.08.2018  Added
  * WWirns    23.08.2018  Overwork the rights
  * WWirns    28.08.2018  Add entity COMPUTER
  *******************************************************************************/
  --
  v_FROM_SCHEMA varchar2(30 char);
  --
begin
  --
  --
  v_FROM_SCHEMA := upper(p_FROM_SCHEMA);
  --
  begin
    select t.USERNAME
      into v_FROM_SCHEMA
      from ALL_USERS t
     where upper(t.USERNAME) = v_FROM_SCHEMA;
  exception
    when NO_DATA_FOUND then
      Raise_application_error(-20000
                             ,'FROM_SCHEMA[''' || v_FROM_SCHEMA || '''] does not exist!');
  end;
  --
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$I18N$HIS'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS$I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS$I18N$HIS'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ACTIVITIES'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ACTIVITIES$HIS'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USERS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USERS$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USERS$SGD'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$I18N$HIS'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$I18N$HIS'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$I18N$HIS'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS$I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS$I18N$HIS'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS$I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS$I18N$HIS'
                                 ,-01434);
  --
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ROLE_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ROLE_REL$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ROLE_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ROLE_REL$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ORG_UNIT_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ORG_UNIT_REL$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_OBJECT_GRANT_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_OBJECT_GRANT_REL$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECT_GRANT_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECT_GRANT_REL$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECT_PAGE_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECT_PAGE_REL$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_ROLE_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_ROLE_REL$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_ORG_UNIT_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_ORG_UNIT_REL$HIS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ORG_UNIT_REL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ORG_UNIT_REL$HIS'
                                 ,-01434);
  --
  -- views
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$LC'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS#I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS$LC'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS#I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$LC'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES#I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$LC'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS#I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$LC'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS#I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS$LC'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS#I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS$LC'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS#I18N'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ROLE_REL_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ROLE_REL_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ORG_UNIT_REL_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_ROLE_REL_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_ROLE_ROLES_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_ORG_UNIT_REL_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ORG_UNIT_REL_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USERS#SGD'
                                 ,-01434);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PKG_AUTHORIZATION'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PKG_MAN_USERS'
                                 ,-01434);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('drop synonym ' || v_FROM_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PKG_SET_CUSTOM_CTX'
                                 ,-01434);
  --
end DROP_DB_OBJ$AICU;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DROP_DB_OBJ$AICU" TO "DERMALOG_PROXY";
