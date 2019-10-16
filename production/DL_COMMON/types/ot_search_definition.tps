CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_SEARCH_DEFINITION" force authid current_user is object
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
* WWirns    15.08.2018  DL_COMMON.OT_SEARCH_DEFINITION:Added
*******************************************************************************/
--
--
-- *** ATTRIBUTES ***
--
  PATTERN     varchar2(4000 char),
  REPLACEMENT varchar2(4000 char),
  POSITION    integer,
  OCCURENCE   integer,
-- 'Bitmask: 1 => pattern is case sensitive, 2 => pattern is like, 4 => pattern is regexp, 8 .. 524288 => reserved!'
  SEARCH_FLAG_MASK number(6),
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
  constructor function OT_SEARCH_DEFINITION(self             in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN          in varchar2
                                           ,REPLACEMENT      in varchar2
                                           ,POSITION         in integer
                                           ,OCCURENCE        in pls_integer
                                           ,SEARCH_FLAG_MASK in pls_integer
                                            --
                                            ) return self as result,
--
  constructor function OT_SEARCH_DEFINITION(self        in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN     in varchar2
                                           ,REPLACEMENT in varchar2
                                           ,POSITION    in integer
                                           ,OCCURENCE   in pls_integer
                                            --
                                            ) return self as result,
--
  constructor function OT_SEARCH_DEFINITION(self        in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN     in varchar2
                                           ,REPLACEMENT in varchar2
                                           ,POSITION    in integer
                                            --
                                            ) return self as result,
--
  constructor function OT_SEARCH_DEFINITION(self        in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN     in varchar2
                                           ,REPLACEMENT in varchar2
                                            --
                                            ) return self as result,
--
  constructor function OT_SEARCH_DEFINITION(self    in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN in varchar2
                                            --
                                            ) return self as result,
--
  constructor function OT_SEARCH_DEFINITION(self in out nocopy OT_SEARCH_DEFINITION
                                            --
                                            ) return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
  final member procedure Initialize(self               in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN          in varchar2
                                   ,p_REPLACEMENT      in varchar2
                                   ,p_POSITION         in integer
                                   ,p_OCCURENCE        in pls_integer
                                   ,p_SEARCH_FLAG_MASK in pls_integer
                                    --
                                    ),
--
  final member procedure Initialize(self          in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN     in varchar2
                                   ,p_REPLACEMENT in varchar2
                                   ,p_POSITION    in integer
                                   ,p_OCCURENCE   in pls_integer
                                    --
                                    ),
--
  final member procedure Initialize(self          in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN     in varchar2
                                   ,p_REPLACEMENT in varchar2
                                   ,p_POSITION    in integer
                                    --
                                    ),
--
  final member procedure Initialize(self          in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN     in varchar2
                                   ,p_REPLACEMENT in varchar2
                                    --
                                    ),
--
  final member procedure Initialize(self      in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN in varchar2
                                    --
                                    ),
--
  final member procedure Initialize(self in out nocopy OT_SEARCH_DEFINITION
                                    --
                                    ),
--
--
--
  final member function Is_Pattern_Case_Sensitive(self in OT_SEARCH_DEFINITION
                                                  --
                                                  ) return pls_integer,
--
--
--
  final member function Is_Pattern_Like(self in OT_SEARCH_DEFINITION
                                        --
                                        ) return pls_integer,
--
--
--
  final member function Is_Pattern_RegExp(self in OT_SEARCH_DEFINITION
                                          --
                                          ) return pls_integer
--
)
--
not final
 alter type           "DL_COMMON"."OT_SEARCH_DEFINITION" modify attribute PATTERN varchar2(32767 char)
  ,modify attribute REPLACEMENT varchar2(32767 char)
--
cascade
/
  GRANT EXECUTE ON "DL_COMMON"."OT_SEARCH_DEFINITION" TO PUBLIC;
