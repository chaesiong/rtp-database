CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_BIN_FILE" force authid current_user under OT_FILE
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
* WWirns    17.08.2018  DL_COMMON.OT_BIN_FILE:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  CONTENT blob,
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
  constructor function OT_BIN_FILE(self    in out nocopy OT_BIN_FILE
                                  ,NAME$P  in varchar2
                                  ,PATH$P  in clob
                                  ,CONTENT in blob
                                   --
                                   ) return self as result,
--
  constructor function OT_BIN_FILE(self   in out nocopy OT_BIN_FILE
                                  ,NAME$P in varchar2
                                  ,PATH$P in clob
                                   --
                                   ) return self as result,
--
  constructor function OT_BIN_FILE(self   in out nocopy OT_BIN_FILE
                                  ,NAME$P in varchar2
                                   --
                                   ) return self as result,
--
  constructor function OT_BIN_FILE(self in out nocopy OT_BIN_FILE
                                   --
                                   ) return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
  final member procedure Initialize(self      in out nocopy OT_BIN_FILE
                                   ,p_NAME    in varchar2
                                   ,p_PATH    in clob
                                   ,p_CONTENT in blob
                                    --
                                    )
--
)
--
not final
/
  GRANT EXECUTE ON "DL_COMMON"."OT_BIN_FILE" TO PUBLIC;
