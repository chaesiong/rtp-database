CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_10VCC_10CL" force authid current_user is object
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
* WWirns    02.05.2018  DL_COMMON.OT_10VCC_10CL:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  VCC00 varchar2(4000 char),
  VCC01 varchar2(4000 char),
  VCC02 varchar2(4000 char),
  VCC03 varchar2(4000 char),
  VCC04 varchar2(4000 char),
  VCC05 varchar2(4000 char),
  VCC06 varchar2(4000 char),
  VCC07 varchar2(4000 char),
  VCC08 varchar2(4000 char),
  VCC09 varchar2(4000 char),
  CL00  clob,
  CL01  clob,
  CL02  clob,
  CL03  clob,
  CL04  clob,
  CL05  clob,
  CL06  clob,
  CL07  clob,
  CL08  clob,
  CL09  clob
--
)
--
not final
 alter type           "DL_COMMON"."OT_10VCC_10CL" modify attribute VCC00 varchar2(32767 char)
  ,modify attribute VCC01 varchar2(32767 char)
  ,modify attribute VCC02 varchar2(32767 char)
  ,modify attribute VCC03 varchar2(32767 char)
  ,modify attribute VCC04 varchar2(32767 char)
  ,modify attribute VCC05 varchar2(32767 char)
  ,modify attribute VCC06 varchar2(32767 char)
  ,modify attribute VCC07 varchar2(32767 char)
  ,modify attribute VCC08 varchar2(32767 char)
  ,modify attribute VCC09 varchar2(32767 char)
--
cascade
 alter type           "DL_COMMON"."OT_10VCC_10CL" 
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
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_10VCC_10CL(self in out nocopy OT_10VCC_10CL
                                      ,VCC00 in varchar2
                                      ,VCC01 in varchar2
                                      ,VCC02 in varchar2
                                      ,VCC03 in varchar2
                                      ,VCC04 in varchar2
                                      ,VCC05 in varchar2
                                      ,VCC06 in varchar2
                                      ,VCC07 in varchar2
                                      ,VCC08 in varchar2
                                      ,VCC09 in varchar2
                                      ,CL00 in clob
                                      ,CL01 in clob
                                      ,CL02 in clob
                                      ,CL03 in clob
                                      ,CL04 in clob
                                      ,CL05 in clob
                                      ,CL06 in clob
                                      ,CL07 in clob
                                      ,CL08 in clob
                                      ,CL09 in clob
                                       --
                                       )
  return self as result,
--
add constructor function OT_10VCC_10CL(self in out nocopy OT_10VCC_10CL
                                       --
                                       )
  return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
add final member procedure Initialize(self in out nocopy OT_10VCC_10CL
                                     ,p_VCC00 in varchar2
                                     ,p_VCC01 in varchar2
                                     ,p_VCC02 in varchar2
                                     ,p_VCC03 in varchar2
                                     ,p_VCC04 in varchar2
                                     ,p_VCC05 in varchar2
                                     ,p_VCC06 in varchar2
                                     ,p_VCC07 in varchar2
                                     ,p_VCC08 in varchar2
                                     ,p_VCC09 in varchar2
                                     ,p_CL00 in clob
                                     ,p_CL01 in clob
                                     ,p_CL02 in clob
                                     ,p_CL03 in clob
                                     ,p_CL04 in clob
                                     ,p_CL05 in clob
                                     ,p_CL06 in clob
                                     ,p_CL07 in clob
                                     ,p_CL08 in clob
                                     ,p_CL09 in clob
                                      --
                                      ),
--
add final member procedure Initialize(self in out nocopy OT_10VCC_10CL
                                      --
                                      )
--
cascade
--
/
  GRANT EXECUTE ON "DL_COMMON"."OT_10VCC_10CL" TO PUBLIC;
