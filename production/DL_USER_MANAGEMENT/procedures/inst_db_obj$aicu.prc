CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_USER_MANAGEMENT"."INST_DB_OBJ$AICU" (p_TO_SCHEMA         in varchar2
                                                               ,p_Creation_Prefix   in varchar2 default null
                                                               ,p_Is_Trusted_Schema in boolean default false
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
  v_TO_SCHEMA         varchar2(30 char);
  v_Is_Trusted_Schema boolean;
  --
begin
  --
  --
  v_TO_SCHEMA         := upper(p_TO_SCHEMA);
  v_Is_Trusted_Schema := nvl(p_Is_Trusted_Schema
                            ,false);
  --
  --
  begin
    select t.USERNAME
      into v_TO_SCHEMA
      from ALL_USERS t
     where upper(t.USERNAME) = v_TO_SCHEMA;
  exception
    when NO_DATA_FOUND then
      Raise_application_error(-20000
                             ,'TO_SCHEMA[''' || v_TO_SCHEMA || '''] does not exist!');
  end;
  --
  -- Lookups
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS for DL_USER_MANAGEMENT.LOOKUPS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$HIS for DL_USER_MANAGEMENT.LOOKUPS$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$I18N for DL_USER_MANAGEMENT.LOOKUPS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$I18N$HIS for DL_USER_MANAGEMENT.LOOKUPS$I18N$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$LC for DL_USER_MANAGEMENT.LOOKUPS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS#I18N for DL_USER_MANAGEMENT.LOOKUPS#I18N');
  else
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS for DL_USER_MANAGEMENT.LOOKUPS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$I18N for DL_USER_MANAGEMENT.LOOKUPS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS$LC for DL_USER_MANAGEMENT.LOOKUPS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'LOOKUPS#I18N for DL_USER_MANAGEMENT.LOOKUPS#I18N');
  end if;
  --
  -- Parameter settings
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS for DL_USER_MANAGEMENT.PARAMETER_SETTINGS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS$HIS for DL_USER_MANAGEMENT.PARAMETER_SETTINGS$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS$I18N for DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS$I18N$HIS for DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS$LC for DL_USER_MANAGEMENT.PARAMETER_SETTINGS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PARAMETER_SETTINGS#I18N for DL_USER_MANAGEMENT.PARAMETER_SETTINGS#I18N');
  end if;
  --
  -- Activities
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ACTIVITIES for DL_USER_MANAGEMENT.ACTIVITIES');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ACTIVITIES$HIS for DL_USER_MANAGEMENT.ACTIVITIES$HIS');
  end if;
  --
  -- Users
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USERS for DL_USER_MANAGEMENT.USERS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USERS$HIS for DL_USER_MANAGEMENT.USERS$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USERS$SGD for DL_USER_MANAGEMENT.USERS$SGD');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USERS#SGD for DL_USER_MANAGEMENT.USERS#SGD');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_POOL for DL_USER_MANAGEMENT.USER_POOL');
  end if;
  --
  -- Roles
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES for DL_USER_MANAGEMENT.ROLES');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$HIS for DL_USER_MANAGEMENT.ROLES$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$I18N for DL_USER_MANAGEMENT.ROLES$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$I18N$HIS for DL_USER_MANAGEMENT.ROLES$I18N$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$LC for DL_USER_MANAGEMENT.ROLES$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES#I18N for DL_USER_MANAGEMENT.ROLES#I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_POOL for DL_USER_MANAGEMENT.ROLE_POOL');
  else
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES for DL_USER_MANAGEMENT.ROLES');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$I18N for DL_USER_MANAGEMENT.ROLES$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES$LC for DL_USER_MANAGEMENT.ROLES$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLES#I18N for DL_USER_MANAGEMENT.ROLES#I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_POOL for DL_USER_MANAGEMENT.ROLE_POOL');
  end if;
  --
  -- Org-Units
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS for DL_USER_MANAGEMENT.ORG_UNITS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$HIS for DL_USER_MANAGEMENT.ORG_UNITS$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$I18N for DL_USER_MANAGEMENT.ORG_UNITS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$I18N$HIS for DL_USER_MANAGEMENT.ORG_UNITS$I18N$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$LC for DL_USER_MANAGEMENT.ORG_UNITS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS#I18N for DL_USER_MANAGEMENT.ORG_UNITS#I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_POOL for DL_USER_MANAGEMENT.ORG_UNIT_POOL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS for DL_USER_MANAGEMENT.COMPUTERS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$HIS for DL_USER_MANAGEMENT.COMPUTERS$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$I18N for DL_USER_MANAGEMENT.COMPUTERS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$I18N$HIS for DL_USER_MANAGEMENT.COMPUTERS$I18N$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$LC for DL_USER_MANAGEMENT.COMPUTERS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS#I18N for DL_USER_MANAGEMENT.COMPUTERS#I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_POOL for DL_USER_MANAGEMENT.COMPUTER_POOL');
  else
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS for DL_USER_MANAGEMENT.ORG_UNITS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$I18N for DL_USER_MANAGEMENT.ORG_UNITS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS$LC for DL_USER_MANAGEMENT.ORG_UNITS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNITS#I18N for DL_USER_MANAGEMENT.ORG_UNITS#I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_POOL for DL_USER_MANAGEMENT.ORG_UNIT_POOL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS for DL_USER_MANAGEMENT.COMPUTERS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$I18N for DL_USER_MANAGEMENT.COMPUTERS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS$LC for DL_USER_MANAGEMENT.COMPUTERS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTERS#I18N for DL_USER_MANAGEMENT.COMPUTERS#I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_POOL for DL_USER_MANAGEMENT.COMPUTER_POOL');
  end if;
  --
  -- Grants
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS for DL_USER_MANAGEMENT.GRANTS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS$HIS for DL_USER_MANAGEMENT.GRANTS$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS$I18N for DL_USER_MANAGEMENT.GRANTS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS$I18N$HIS for DL_USER_MANAGEMENT.GRANTS$I18N$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS$LC for DL_USER_MANAGEMENT.GRANTS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'GRANTS#I18N for DL_USER_MANAGEMENT.GRANTS#I18N');
  end if;
  --
  -- Objects
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS for DL_USER_MANAGEMENT.OBJECTS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS$HIS for DL_USER_MANAGEMENT.OBJECTS$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS$I18N for DL_USER_MANAGEMENT.OBJECTS$I18N');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS$I18N$HIS for DL_USER_MANAGEMENT.OBJECTS$I18N$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS$LC for DL_USER_MANAGEMENT.OBJECTS$LC');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECTS#I18N for DL_USER_MANAGEMENT.OBJECTS#I18N');
  end if;
  --
  --
  if (v_Is_Trusted_Schema)
  then
    -- Object <-> Grant
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECT_GRANT_REL for DL_USER_MANAGEMENT.OBJECT_GRANT_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECT_GRANT_REL$HIS for DL_USER_MANAGEMENT.OBJECT_GRANT_REL$HIS');
    -- Object <-> Page
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECT_PAGE_REL for DL_USER_MANAGEMENT.OBJECT_PAGE_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'OBJECT_PAGE_REL$HIS for DL_USER_MANAGEMENT.OBJECT_PAGE_REL$HIS');
    -- Role <-> (Object <-> Grant)
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_OBJECT_GRANT_REL for DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_OBJECT_GRANT_REL$HIS for DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL$HIS');
    -- User <-> Role
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ROLE_REL for DL_USER_MANAGEMENT.USER_ROLE_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ROLE_REL$HIS for DL_USER_MANAGEMENT.USER_ROLE_REL$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ROLE_REL_POOL for DL_USER_MANAGEMENT.USER_ROLE_REL_POOL');
    -- Computer <-> Role
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ROLE_REL for DL_USER_MANAGEMENT.COMPUTER_ROLE_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ROLE_REL$HIS for DL_USER_MANAGEMENT.COMPUTER_ROLE_REL$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ROLE_REL_POOL for DL_USER_MANAGEMENT.COMPUTER_ROLE_REL_POOL');
  end if;
  --
  --
  if (v_Is_Trusted_Schema)
  then
    -- Role <-> Role
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_ROLE_REL for DL_USER_MANAGEMENT.ROLE_ROLE_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_ROLE_REL$HIS for DL_USER_MANAGEMENT.ROLE_ROLE_REL$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_ROLE_REL_POOL for DL_USER_MANAGEMENT.ROLE_ROLE_REL_POOL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ROLE_ROLE_ROLES_POOL for DL_USER_MANAGEMENT.ROLE_ROLE_ROLES_POOL');
    -- Org-Unit <-> Org-Unit
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_ORG_UNIT_REL for DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_ORG_UNIT_REL$HIS for DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_ORG_UNIT_REL_POOL for DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL_POOL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL for DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL');
    -- User <-> Org-Unit
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ORG_UNIT_REL for DL_USER_MANAGEMENT.USER_ORG_UNIT_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ORG_UNIT_REL$HIS for DL_USER_MANAGEMENT.USER_ORG_UNIT_REL$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'USER_ORG_UNIT_REL_POOL for DL_USER_MANAGEMENT.USER_ORG_UNIT_REL_POOL');
    -- Computer <-> Org-Unit
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ORG_UNIT_REL for DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ORG_UNIT_REL$HIS for DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL$HIS');
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'COMPUTER_ORG_UNIT_REL_POOL for DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL_POOL');
  end if;
  --
  --
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PKG_SET_CUSTOM_CTX for DL_USER_MANAGEMENT.PKG_SET_CUSTOM_CTX');
  end if;
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PKG_AUTHORIZATION for DL_USER_MANAGEMENT.PKG_AUTHORIZATION');
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('create or replace synonym ' || v_TO_SCHEMA || '.' || upper(p_Creation_Prefix) || 'PKG_MAN_USERS for DL_USER_MANAGEMENT.PKG_MAN_USERS');
  --
end INST_DB_OBJ$AICU;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ$AICU" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ$AICU" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ$AICU" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ$AICU" TO "BIOSAADM";
