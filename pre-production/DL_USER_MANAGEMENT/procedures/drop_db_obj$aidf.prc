CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_USER_MANAGEMENT"."DROP_DB_OBJ$AIDF" (p_FROM_SCHEMA in varchar2
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
  -- "revoke all on ..." to be drastically, so revoke how you have been granted!
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.LOOKUPS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.LOOKUPS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.LOOKUPS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.LOOKUPS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.LOOKUPS$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.LOOKUPS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.LOOKUPS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.LOOKUPS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.LOOKUPS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.LOOKUPS$I18N$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.PARAMETER_SETTINGS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$I18N$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ACTIVITIES from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ACTIVITIES$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USERS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.USERS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.USERS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USERS$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USERS$SGD from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLES from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke references on DL_USER_MANAGEMENT.ROLES from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ROLES from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ROLES from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ROLES from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLES$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLES$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ROLES$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ROLES$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ROLES$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLES$I18N$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNITS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke references on DL_USER_MANAGEMENT.ORG_UNITS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ORG_UNITS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ORG_UNITS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ORG_UNITS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNITS$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNITS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ORG_UNITS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ORG_UNITS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ORG_UNITS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNITS$I18N$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTERS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke references on DL_USER_MANAGEMENT.COMPUTERS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.COMPUTERS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.COMPUTERS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.COMPUTERS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTERS$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTERS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.COMPUTERS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.COMPUTERS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.COMPUTERS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTERS$I18N$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.GRANTS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.GRANTS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.GRANTS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS$I18N$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.OBJECTS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.OBJECTS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.OBJECTS$I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS$I18N$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.USER_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.USER_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.USER_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ROLE_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECT_GRANT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.OBJECT_GRANT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.OBJECT_GRANT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.OBJECT_GRANT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECT_GRANT_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECT_PAGE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.OBJECT_PAGE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.OBJECT_PAGE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.OBJECT_PAGE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECT_PAGE_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ROLE_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ROLE_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ROLE_ROLE_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_ROLE_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke insert on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL$HIS from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTER_ORG_UNIT_REL_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  -- views
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.LOOKUPS$LC from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.LOOKUPS#I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS$LC from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.GRANTS#I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS$LC from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.OBJECTS#I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLES$LC from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLES#I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNITS$LC from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNITS#I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTERS$LC from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTERS#I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS$LC from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.PARAMETER_SETTINGS#I18N from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTER_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ROLE_REL_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.COMPUTER_ROLE_REL_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_ROLE_REL_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ROLE_ROLE_ROLES_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_ORG_UNITS_POOL from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke select on DL_USER_MANAGEMENT.USERS#SGD from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke update on DL_USER_MANAGEMENT.USERS#SGD from ' || v_FROM_SCHEMA
                                 ,-01927);
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke delete on DL_USER_MANAGEMENT.USERS#SGD from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
  --
  DL_DBA.PKG_DDL_UTIL.Execute_DDL('revoke all on DL_USER_MANAGEMENT.PKG_SET_CUSTOM_CTX from ' || v_FROM_SCHEMA
                                 ,-01927);
  --
end DROP_DB_OBJ$AIDF;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DROP_DB_OBJ$AIDF" TO "DERMALOG_PROXY";
