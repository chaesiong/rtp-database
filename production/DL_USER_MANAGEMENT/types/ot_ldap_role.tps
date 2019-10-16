CREATE OR REPLACE EDITIONABLE TYPE "DL_USER_MANAGEMENT"."OT_LDAP_ROLE" force authid current_user is object
(
--
--
/**
* ???
*
* PARAMETERS
*   ???
*
* EXCEPTIONS
*   ???
*
* NOTES
*   ???
*
*/
--
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* WWirns    31.08.2018  DL_USER_MANAGEMENT.OT_LDAP_ROLE:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  ID          number(20),
  DN          varchar2(256 char),
  SID         varchar2(4000 char),
  CN          varchar2(4000 char),
  ROLE_NAME   varchar2(4000 char),
  DESCRIPTION varchar2(4000 char),
--ROLE_MEMBER   varchar2(4000 char),
--ROLE_MEMBEROF varchar2(4000 char),
--
-- *** STATICS ***
--
--
--
--
  static function Get_OBJECT_NAME return varchar2 deterministic,
--
  static function Get_OBJECT_COPYRIGHT return varchar2 deterministic,
--
  static function Get_OBJECT_VERSION$VC return varchar2 deterministic,
--
-- *** CONSTRUCTORS ***
--
--
--
--
  constructor function OT_LDAP_ROLE(self in out nocopy OT_LDAP_ROLE
                                    --
                                    ) return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
  final member procedure Initialize(self in out nocopy OT_LDAP_ROLE
                                    --
                                    )
--
)
--
not final
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."OT_LDAP_ROLE" TO PUBLIC;
