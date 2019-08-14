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
CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_BIN_FILE" is
  --
  -- *** STATICS ***
  --
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
  static function Get_OBJECT_NAME return varchar2 deterministic is
  begin
    return $$plsql_unit_owner || '.' || $$plsql_unit;
  end;
  --
  static function Get_OBJECT_COPYRIGHT return varchar2 deterministic is
  begin
    return 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || standard.to_char(sysdate
                                                                                                          ,'yyyy');
  end;
  --
  static function Get_OBJECT_VERSION$VC return varchar2 deterministic is
    --v_OT_VERSION OT_VERSION;
  begin
    --
    Raise_application_error(-20000
                           ,'Not implemented, yet!');
    return null;
    --
    /*
    --
    -- !!! INCREMENT THIS VERSIONS ON EACH CHANGE INSIDE THE DB-OBJECT !!!
    --
    v_OT_VERSION := OT_VERSION(Title  => null
                              ,Remark => null
                              ,Major  => 1
                              ,Minor  => 0
                              ,Patch  => 0
                               --
                               );
    --
    --
    return v_OT_VERSION.to_String();
    --
    */
    --
  end;
  --
  -- *** CONSTRUCTORS ***
  --
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
  * WWirns    17.08.2018  XX:Added
  *******************************************************************************/
  --
  constructor function OT_BIN_FILE(self    in out nocopy OT_BIN_FILE
                                  ,NAME$P  in varchar2
                                  ,PATH$P  in clob
                                  ,CONTENT in blob
                                   --
                                   ) return self as result is
  begin
    --
    self.Initialize(NAME$P
                   ,PATH$P
                   ,CONTENT
                    --
                    );
    --
    return;
    --
  end OT_BIN_FILE;
  --
  constructor function OT_BIN_FILE(self   in out nocopy OT_BIN_FILE
                                  ,NAME$P in varchar2
                                  ,PATH$P in clob
                                   --
                                   ) return self as result is
  begin
    --
    self.Initialize(NAME$P
                   ,PATH$P
                   ,null
                    --
                    );
    --
    return;
    --
  end OT_BIN_FILE;
  --
  constructor function OT_BIN_FILE(self   in out nocopy OT_BIN_FILE
                                  ,NAME$P in varchar2
                                   --
                                   ) return self as result is
  begin
    --
    self.Initialize(NAME$P
                   ,null
                   ,null
                    --
                    );
    --
    return;
    --
  end OT_BIN_FILE;
  --
  constructor function OT_BIN_FILE(self in out nocopy OT_BIN_FILE
                                   --
                                   ) return self as result is
  begin
    --
    self.Initialize(null
                   ,null
                   ,null
                    --
                    );
    --
    return;
    --
  end OT_BIN_FILE;
  --
  -- *** FINAL MEMBERS ***
  --
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
  * WWirns    17.08.2018  XX:Added
  *******************************************************************************/
  --
  final member procedure Initialize(self      in out nocopy OT_BIN_FILE
                                   ,p_NAME    in varchar2
                                   ,p_PATH    in clob
                                   ,p_CONTENT in blob
                                    --
                                    ) is
    --
  begin
    --
    (self as OT_FILE).Initialize(p_NAME
                                ,p_PATH
                                 --
                                 );
    --
    self.CONTENT := p_CONTENT;
    --
  end Initialize;
  --
end;
/
  GRANT EXECUTE ON "DL_COMMON"."OT_BIN_FILE" TO PUBLIC;
