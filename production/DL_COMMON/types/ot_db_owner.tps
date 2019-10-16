CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_DB_OWNER" force authid current_user is object
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
* WWirns    08.02.2018  DL_COMMON.OT_DB_OBJECT_TBLSPC:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  OBJ_TYPE varchar2(23 byte)
--
)
--
not final
 alter type           "DL_COMMON"."OT_DB_OWNER" add attribute OBJ_OWNER varchar2(128 byte)
--
cascade
 alter type           "DL_COMMON"."OT_DB_OWNER" 
--
-- *** STATICS ***
--
--
--
--
add static function Get_OBJECT_NAME
  return varchar2 deterministic,
--
add static function Get_OBJECT_COPYRIGHT
  return varchar2 deterministic,
--
add static function Get_OBJECT_VERSION$VC
  return varchar2 deterministic,
--
--
--
add static function Construct(p_OBJ_TYPE in varchar2
                             ,p_OBJ_OWNER in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_OWNER,
--
add static function Construct(p_OBJ_OWNER in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_OWNER,
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_OWNER(self in out nocopy OT_DB_OWNER
                                    ,OBJ_TYPE in varchar2
                                    ,OBJ_OWNER in varchar2
                                     --
                                     )
  return self as result,
--
add constructor function OT_DB_OWNER(self in out nocopy OT_DB_OWNER
                                    ,p_OBJ_OWNER in varchar2
                                     --
                                     )
  return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
add final member procedure Initialize(self in out nocopy OT_DB_OWNER
                                     ,p_OBJ_TYPE in varchar2
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      ),
--
add final member procedure Initialize(self in out nocopy OT_DB_OWNER
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      )
--
cascade
--
/
  GRANT EXECUTE ON "DL_COMMON"."OT_DB_OWNER" TO PUBLIC;
