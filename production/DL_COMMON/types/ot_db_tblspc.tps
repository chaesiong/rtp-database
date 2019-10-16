CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_DB_TBLSPC" force authid current_user is object
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
* WWirns    19.02.2018  DL_COMMON.OT_DB_TBLSPC:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  TBLSPC_NAME varchar2(30 byte)
--
)
--
not final
 alter type           "DL_COMMON"."OT_DB_TBLSPC" 
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
add static function Construct(p_TBLSPC_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_TBLSPC,
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_TBLSPC(self in out nocopy OT_DB_TBLSPC
                                     ,TBLSPC_NAME in varchar2
                                      --
                                      )
  return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
add final member procedure Initialize(self in out nocopy OT_DB_TBLSPC
                                     ,p_TBLSPC_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      )
--
cascade
--
/
 GRANT EXECUTE ON "DL_COMMON"."OT_DB_TBLSPC" TO PUBLIC;
