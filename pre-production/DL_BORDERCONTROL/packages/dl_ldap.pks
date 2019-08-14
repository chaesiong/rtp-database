CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."DL_LDAP" 
IS
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for LDAP access in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.1 $<br/>
  * @author  $Author: K. Sarikaya $<br/>
  * @date    $Date:  13/10/2015 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  /*
  l_ldap_host VARCHAR2(256)   := 'shhdc012.dermalog.hh'; --DERMALOG AD-Server
  l_ldap_port VARCHAR2(256)   := '389'; --DERMALOG AD-Server Port
  l_ldap_base VARCHAR2(256)   := 'OU=DERMALOG, DC=dermalog, DC=hh'; --DERMALOG AD-Server Base
  l_ladap_domain VARCHAR2(256):= 'DERMALOG-HH\'; --DERMALOG Domain
  */
  l_ldap_host VARCHAR2(256)   := v('LDAP_HOST');   -- Defined as Substitution String in Apex Application
  l_ldap_port VARCHAR2(256)   := v('LDAP_PORT');   -- Defined as Substitution String in Apex Application
  l_ldap_base VARCHAR2(256)   := v('LDAP_BASE');   -- Defined as Substitution String in Apex Application
  l_ladap_domain VARCHAR2(256):= v('LDAP_DOMAIN'); -- Defined as Substitution String in Apex Application
TYPE usr_rec_type
IS
/* This Package can be used in Oracle APEX for authentication and authorization
   DL_LDAP.authenticate
   DL_LDAP.get_userdata for
   Initial Version: V0.1 23.06.2015 Kazim Sarikaya DERMALOG Identification Systems GmbH
*/
  RECORD
  (
    user_login    VARCHAR2(50),
    user_fullname VARCHAR2(50),
    user_id       VARCHAR2(50) );
TYPE usr_attr_type
IS
  RECORD
  (
    id    NUMBER(20),
    login VARCHAR2(256),
    attr  VARCHAR2(256),
    val   VARCHAR2(256) );
TYPE usr_tab_type
IS
  TABLE OF usr_rec_type;
TYPE usr_tab_attr
IS
  TABLE OF usr_attr_type;
  FUNCTION authenticate(
      p_username IN VARCHAR2,
      p_password IN VARCHAR2)
    RETURN BOOLEAN;
  FUNCTION get_userdata(
      p_ldap_user   IN VARCHAR2,
      p_ldap_passwd IN VARCHAR2 )
    RETURN usr_tab_attr PIPELINED;

type ldap_rec_type is record (
  user_name varchar2(50),
  group_name varchar2(50),
  last_login date,
  is_locked number(1)
);
type ldap_tab_type is table of ldap_rec_type;

TYPE ldap_entry IS record (
  cn VARCHAR2(255),
  gidNumber VARCHAR2(255),
  userId VARCHAR2(255),
  departmentNumber VARCHAR2(255),
  employeeNumber VARCHAR2(255),
  givenName VARCHAR2(255),
  sn VARCHAR2(255),
  userPassword VARCHAR2(255),
  pwdChangedTime VARCHAR2(255),
  modifyTimestamp VARCHAR2(255),
  createTimestamp VARCHAR2(255),
  authTimestamp VARCHAR2(255),
  pwdAccountLockedTime VARCHAR2(255),
  servername VARCHAR2(255)
);
TYPE ldap_tab_entry IS TABLE OF ldap_entry;

TYPE ldap_permission IS record (
  name VARCHAR2(255),
  permissionid NUMBER
);
TYPE ldap_tab_permission IS TABLE OF ldap_permission;

FUNCTION GET_USERS(admin_cn IN VARCHAR2, admin_pass IN VARCHAR2) RETURN ldap_tab_entry pipelined;
FUNCTION ldap_has_user_permission(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2, permission_id IN NUMBER) return NUMBER;
FUNCTION ldap_get_group_permissions(admin_cn IN VARCHAR2, admin_pass IN VARCHAR2, group_cn IN VARCHAR2) RETURN ldap_tab_permission pipelined;
FUNCTION ldap_get_user_permissions(admin_cn IN VARCHAR2, admin_pass IN VARCHAR2, user_cn IN VARCHAR2) RETURN ldap_tab_permission pipelined;
FUNCTION ldap_get_permissions(admin_cn IN VARCHAR2, admin_pass IN VARCHAR2) RETURN ldap_tab_permission pipelined;
function ldap_get_permission_name(admin_cn in varchar2, admin_pass in varchar2, permission_id IN NUMBER) return varchar2;
function ldap_add_user_permission(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2, permission_id IN NUMBER) return varchar2;
function ldap_remove_user_permission(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2, permission_id IN NUMBER) return varchar2;
FUNCTION ldap_modify_user_permissions(admin_cn IN VARCHAR2, admin_pass IN VARCHAR2, user_cn IN VARCHAR2, permission_mask IN VARCHAR2) RETURN VARCHAR2;
function ldap_enumerate_users(admin_cn in varchar2, admin_pass in varchar2) return ldap_tab_type pipelined;

function ldap_add_user(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2, user_pass in varchar2, user_group in varchar2) return varchar2;

function ldap_set_user_password(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2, user_pass in varchar2) return varchar2;

function ldap_set_user_group(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2, user_group in varchar2) return varchar2;

function ldap_remove_user(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2) return varchar2;

function get_ldap_host return varchar2;

function get_ldap_base return varchar2;

function createSSHAPassword(textPassword in varchar2) return varchar2;

function ldap_compare_password(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2, user_password in varchar2) return number;

function ldap_get_last_login(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2) return date;

function ldap_lock_account(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2) return varchar2;

function ldap_unlock_account(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2) return varchar2;

function ldap_lock_date(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2) return date;

function ldap_set_user_metadata(admin_cn in varchar2, admin_pass in varchar2, user_cn in varchar2, user_sn in varchar2, user_givenname in varchar2, user_employeenumber in varchar2) return varchar2;

END DL_LDAP;
/
