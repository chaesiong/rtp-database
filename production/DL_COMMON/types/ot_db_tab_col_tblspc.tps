CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_DB_TAB_COL_TBLSPC" force authid current_user under OT_DB_TAB_COL
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
* WWirns    08.02.2018  DL_COMMON.OT_DB_TAB_COL_TBLSPC:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  DB_TBLSPC OT_DB_TBLSPC
--
)
--
not final
 alter type           "DL_COMMON"."OT_DB_TAB_COL_TBLSPC" 
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
                             ,p_OBJ_NAME in varchar2
                             ,p_COL_NAME in varchar2
                             ,p_TBLSPC_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_TAB_COL_TBLSPC,
--
add static function Construct(p_OBJ_OWNER in varchar2
                             ,p_OBJ_NAME in varchar2
                             ,p_COL_NAME in varchar2
                             ,p_TBLSPC_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_TAB_COL_TBLSPC,
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_TAB_COL_TBLSPC(self in out nocopy OT_DB_TAB_COL_TBLSPC
                                             ,OBJ_TYPE in varchar2
                                             ,OBJ_OWNER in varchar2
                                             ,OBJ_NAME in varchar2
                                             ,COL_NAME in varchar2
                                             ,DB_TBLSPC in OT_DB_TBLSPC
                                              --
                                              )
  return self as result,
--
add constructor function OT_DB_TAB_COL_TBLSPC(self in out nocopy OT_DB_TAB_COL_TBLSPC
                                             ,p_OBJ_TYPE in varchar2
                                             ,p_OBJ_OWNER in varchar2
                                             ,p_OBJ_NAME in varchar2
                                             ,p_COL_NAME in varchar2
                                             ,p_TBLSPC_NAME in varchar2
                                              --
                                              )
  return self as result,
--
add constructor function OT_DB_TAB_COL_TBLSPC(self in out nocopy OT_DB_TAB_COL_TBLSPC
                                             ,p_OBJ_OWNER in varchar2
                                             ,p_OBJ_NAME in varchar2
                                             ,p_COL_NAME in varchar2
                                             ,p_TBLSPC_NAME in varchar2
                                              --
                                              )
  return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
add final member procedure Initialize(self in out nocopy OT_DB_TAB_COL_TBLSPC
                                     ,p_OBJ_TYPE in varchar2
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                     ,p_COL_NAME in varchar2
                                     ,p_DB_TBLSPC in OT_DB_TBLSPC
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      ),
--
add final member procedure Initialize(self in out nocopy OT_DB_TAB_COL_TBLSPC
                                     ,p_OBJ_TYPE in varchar2
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                     ,p_COL_NAME in varchar2
                                     ,p_TBLSPC_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      ),
--
add final member procedure Initialize(self in out nocopy OT_DB_TAB_COL_TBLSPC
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                     ,p_COL_NAME in varchar2
                                     ,p_TBLSPC_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      )
--
cascade
--
 alter type           "DL_COMMON"."OT_DB_TAB_COL_TBLSPC" 
--
-- *** STATICS ***
--
--
--
--
add static function Construct(p_OBJ_NAME in varchar2
                             ,p_COL_NAME in varchar2
                             ,p_TBLSPC_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_TAB_COL_TBLSPC,
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_TAB_COL_TBLSPC(self in out nocopy OT_DB_TAB_COL_TBLSPC
                                             ,p_OBJ_NAME in varchar2
                                             ,p_COL_NAME in varchar2
                                             ,p_TBLSPC_NAME in varchar2
                                              --
                                              )
  return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
add final member procedure Initialize(self in out nocopy OT_DB_TAB_COL_TBLSPC
                                     ,p_OBJ_NAME in varchar2
                                     ,p_COL_NAME in varchar2
                                     ,p_TBLSPC_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      )
--
cascade
--
/
  GRANT EXECUTE ON "DL_COMMON"."OT_DB_TAB_COL_TBLSPC" TO PUBLIC;
