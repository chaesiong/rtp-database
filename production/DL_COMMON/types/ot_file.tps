CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_FILE" force authid current_user is object
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
* WWirns    17.08.2018  DL_COMMON.OT_FILE:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  NAME$P varchar2(255 char),
  PATH$P clob,
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
  constructor function OT_FILE(self   in out nocopy OT_FILE
                              ,NAME$P in varchar2
                              ,PATH$P in clob
                               --
                               ) return self as result,
--
  constructor function OT_FILE(self   in out nocopy OT_FILE
                              ,NAME$P in varchar2
                               --
                               ) return self as result,
--
  constructor function OT_FILE(self in out nocopy OT_FILE
                               --
                               ) return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
  final member procedure Initialize(self   in out nocopy OT_FILE
                                   ,p_NAME in varchar2
                                   ,p_PATH in clob
                                    --
                                    ),
--
  final member procedure Initialize(self   in out nocopy OT_FILE
                                   ,p_NAME in varchar2
                                    --
                                    ),
--
  final member procedure Initialize(self in out nocopy OT_FILE
                                    --
                                    ),
--
--
--
  final member function Get_NAME(self in OT_FILE
                                 --
                                 ) return varchar2,
--
  final member procedure Set_NAME(self   in out nocopy OT_FILE
                                 ,p_NAME in varchar2
                                  --
                                  ),
--
--
--
  final member function Get_PATH(self in OT_FILE
                                 --
                                 ) return varchar2,
--
  final member procedure Set_PATH(self   in out nocopy OT_FILE
                                 ,p_PATH in clob
                                  --
                                  )
--
)
--
not final
/
  GRANT EXECUTE ON "DL_COMMON"."OT_FILE" TO PUBLIC;
