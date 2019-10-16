CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_DB_EXCE_CODE" force authid current_user is object
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
* WWirns    02.05.2018  DL_COMMON.OT_DB_EXCE_CODE:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  CODE number(5
             ,0)
--
)
--
not final
 alter type           "DL_COMMON"."OT_DB_EXCE_CODE" 
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
add static function Construct(p_CODE in number
                              --
                              )
  return OT_DB_EXCE_CODE,
--
--
--
add static procedure Check_Codes(p_CODES in TT_N5
                                 --
                                 ),
--
add static procedure Check_Codes(p_CODES in VT_N5
                                 --
                                 ),
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_EXCE_CODE(self in out nocopy OT_DB_EXCE_CODE
                                        ,CODE in number
                                         --
                                         )
  return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
add final member procedure Initialize(self in out nocopy OT_DB_EXCE_CODE
                                     ,p_CODE in number
                                      --
                                      )
--
cascade
--
/
  GRANT EXECUTE ON "DL_COMMON"."OT_DB_EXCE_CODE" TO PUBLIC;
