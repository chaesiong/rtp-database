CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_USER_MANAGEMENT"."INST_DB_OBJ$AIDF" (p_TO_SCHEMA         in varchar2
                                                               ,p_Is_Trusted_Schema in boolean default false
                                                                --
                                                                ) authid definer is
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
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.LOOKUPS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.LOOKUPS$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.LOOKUPS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.LOOKUPS$I18N$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.LOOKUPS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.LOOKUPS#I18N to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.LOOKUPS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.LOOKUPS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.LOOKUPS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.LOOKUPS$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.LOOKUPS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.LOOKUPS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.LOOKUPS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.LOOKUPS$I18N$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    --
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.LOOKUPS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.LOOKUPS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.LOOKUPS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.LOOKUPS#I18N to ' || v_TO_SCHEMA);
  end if;
  --
  -- Parameter settings
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, update on DL_USER_MANAGEMENT.PARAMETER_SETTINGS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS#I18N to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.PARAMETER_SETTINGS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$LC from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS#I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    --
  end if;
  --
  -- Activities
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ACTIVITIES to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ACTIVITIES$HIS to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ACTIVITIES from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ACTIVITIES$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
  end if;
  --
  -- Users
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, update, delete on DL_USER_MANAGEMENT.USERS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.USERS$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.USERS$SGD to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, update, delete on DL_USER_MANAGEMENT.USERS#SGD to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.USER_POOL to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USERS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.USERS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.USERS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USERS$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USERS$SGD from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_POOL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USERS#SGD from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.USERS#SGD from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.USERS#SGD from ' || v_TO_SCHEMA
                                   ,-01927);
    --
  end if;
  --
  -- Roles
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.ROLES to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLES$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.ROLES$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLES$I18N$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLES$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLES#I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLE_POOL to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ROLES from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ROLES from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ROLES from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLES$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ROLES$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ROLES$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ROLES$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLES$I18N$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    --
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, references on DL_USER_MANAGEMENT.ROLES to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLES$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLES$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLES#I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLE_POOL to ' || v_TO_SCHEMA);
  end if;
  --
  -- Org-Units
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.ORG_UNITS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNITS$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.ORG_UNITS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNITS$I18N$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNITS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNITS#I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNIT_POOL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.COMPUTERS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTERS$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.COMPUTERS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTERS$I18N$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTERS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTERS#I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTER_POOL to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ORG_UNITS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ORG_UNITS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ORG_UNITS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNITS$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ORG_UNITS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ORG_UNITS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ORG_UNITS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNITS$I18N$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    --
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, references on DL_USER_MANAGEMENT.ORG_UNITS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNITS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNITS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNITS#I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNIT_POOL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, references on DL_USER_MANAGEMENT.COMPUTERS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTERS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTERS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTERS#I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTER_POOL to ' || v_TO_SCHEMA);
  end if;
  --
  -- Grants
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.GRANTS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.GRANTS$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.GRANTS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.GRANTS$I18N$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.GRANTS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.GRANTS#I18N to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.GRANTS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.GRANTS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.GRANTS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS$I18N$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS$LC from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS#I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    --
  end if;
  --
  -- Objects
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.OBJECTS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.OBJECTS$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.OBJECTS$I18N to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.OBJECTS$I18N$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.OBJECTS$LC to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.OBJECTS#I18N to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.OBJECTS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.OBJECTS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.OBJECTS$I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS$I18N$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS$LC from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS#I18N from ' || v_TO_SCHEMA
                                   ,-01927);
    --
  end if;
  --
  --
  if (v_Is_Trusted_Schema)
  then
    -- Object <-> Grant
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.OBJECT_GRANT_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.OBJECT_GRANT_REL$HIS to ' || v_TO_SCHEMA);
    -- Object <-> Page
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.OBJECT_PAGE_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.OBJECT_PAGE_REL$HIS to ' || v_TO_SCHEMA);
    -- Role <-> (Object <-> Grant)
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL$HIS to ' || v_TO_SCHEMA);
    -- User <-> Role
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.USER_ROLE_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.USER_ROLE_REL$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.USER_ROLE_REL_POOL to ' || v_TO_SCHEMA);
    -- Computer <-> Role
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL_POOL to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    -- Object <-> Grant
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECT_GRANT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.OBJECT_GRANT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.OBJECT_GRANT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.OBJECT_GRANT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECT_GRANT_REL$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    -- Object <-> Page
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECT_PAGE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.OBJECT_PAGE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.OBJECT_PAGE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.OBJECT_PAGE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECT_PAGE_REL$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    -- Role <-> (Object <-> Grant)
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    -- User <-> Role
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ROLE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.USER_ROLE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.USER_ROLE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.USER_ROLE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ROLE_REL$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ROLE_REL_POOL from ' || v_TO_SCHEMA
                                   ,-01927);
    --
  end if;
  --
  --
  if (v_Is_Trusted_Schema)
  then
    -- Role <-> Role
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.ROLE_ROLE_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLE_ROLE_REL$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLE_ROLE_REL_POOL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ROLE_ROLE_ROLES_POOL to ' || v_TO_SCHEMA);
    -- Org-Unit <-> Org-Unit
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL_POOL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL to ' || v_TO_SCHEMA);
    -- User <-> Org-Unit
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL_POOL to ' || v_TO_SCHEMA);
    -- Computer <-> Org-Unit
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select, insert, update, delete on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL$HIS to ' || v_TO_SCHEMA);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant select on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL_POOL to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    -- Role <-> Role
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_ROLE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ROLE_ROLE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ROLE_ROLE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ROLE_ROLE_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_ROLE_REL$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_ROLE_REL_POOL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_ROLE_ROLES_POOL from ' || v_TO_SCHEMA
                                   ,-01927);
    -- Org-Unit <-> Org-Unit
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL_POOL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL from ' || v_TO_SCHEMA
                                   ,-01927);
    -- User <-> Org-Unit
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL$HIS from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL_POOL from ' || v_TO_SCHEMA
                                   ,-01927);
    --
  end if;
  --
  --
  if (v_Is_Trusted_Schema)
  then
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('grant execute on DL_USER_MANAGEMENT.PKG_SET_CUSTOM_CTX to ' || v_TO_SCHEMA);
  else
    -- Revoke by mistake given grants
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke all on DL_USER_MANAGEMENT.PKG_SET_CUSTOM_CTX from ' || v_TO_SCHEMA
                                   ,-01927);
    DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke all on DL_USER_MANAGEMENT.PKG_SET_CUSTOM_CTX from PUBLIC'
                                   ,-01927);
  end if;
  --
end INST_DB_OBJ$AIDF;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ$AIDF" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ$AIDF" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ$AIDF" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ$AIDF" TO "BIOSAADM";
