CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_DB_OBJECT" force authid current_user under OT_DB_OWNER
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
)
--
not final
 alter type           "DL_COMMON"."OT_DB_OBJECT" add attribute OBJ_NAME varchar2(128 byte)
--
cascade
 alter type           "DL_COMMON"."OT_DB_OBJECT" 
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
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_OBJECT,
--
add static function Construct(p_OBJ_OWNER in varchar2
                             ,p_OBJ_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_OBJECT,
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_OBJECT(self in out nocopy OT_DB_OBJECT
                                     ,OBJ_TYPE in varchar2
                                     ,OBJ_OWNER in varchar2
                                     ,OBJ_NAME in varchar2
                                      --
                                      )
  return self as result,
--
add constructor function OT_DB_OBJECT(self in out nocopy OT_DB_OBJECT
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                      --
                                      )
  return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
add final member procedure Initialize(self in out nocopy OT_DB_OBJECT
                                     ,p_OBJ_TYPE in varchar2
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      ),
--
add final member procedure Initialize(self in out nocopy OT_DB_OBJECT
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      )
--
cascade
--
 alter type           "DL_COMMON"."OT_DB_OBJECT" 
--
-- *** STATICS ***
--
--
--
--
add static function Construct(p_OBJ_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_OBJECT,
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_OBJECT(self in out nocopy OT_DB_OBJECT
                                     ,p_OBJ_NAME in varchar2
                                      --
                                      )
  return self as result,
--
-- *** FINAL MEMBERS ***
--
--
--
--
add final member procedure Initialize(self in out nocopy OT_DB_OBJECT
                                     ,p_OBJ_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      )
--
cascade
--
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_DB_OBJECT" is
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
  * WWirns    15.02.2018  DL_COMMON.OT_DB_OBJECT:Added
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
  * WWirns    15.02.2018  XX:Added
  *******************************************************************************/
  --
  static function Construct(p_OBJ_TYPE          in varchar2
                           ,p_OBJ_OWNER         in varchar2
                           ,p_OBJ_NAME          in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_OBJECT is
    --
    v_Result OT_DB_OBJECT;
    --
  begin
    v_Result := new OT_DB_OBJECT(null);
    v_Result.Initialize(p_OBJ_TYPE
                       ,p_OBJ_OWNER
                       ,p_OBJ_NAME
                       ,p_Is_Case_Sensitive);
    return v_Result;
  end Construct;
  --
  static function Construct(p_OBJ_OWNER         in varchar2
                           ,p_OBJ_NAME          in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_OBJECT is
  begin
    return Construct(null
                    ,p_OBJ_OWNER
                    ,p_OBJ_NAME
                    ,p_Is_Case_Sensitive);
  end Construct;
  --
  static function Construct(p_OBJ_NAME          in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_OBJECT is
  begin
    return Construct(null
                    ,null
                    ,p_OBJ_NAME
                    ,p_Is_Case_Sensitive);
  end Construct;
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
  * WWirns    08.02.2018  XX:Added
  *******************************************************************************/
  --
  constructor function OT_DB_OBJECT(self      in out nocopy OT_DB_OBJECT
                                   ,OBJ_TYPE  in varchar2
                                   ,OBJ_OWNER in varchar2
                                   ,OBJ_NAME  in varchar2
                                    --
                                    ) return self as result is
  begin
    --
    self.Initialize(OBJ_TYPE
                   ,OBJ_OWNER
                   ,OBJ_NAME);
    --
    return;
    --
  end OT_DB_OBJECT;
  --
  constructor function OT_DB_OBJECT(self        in out nocopy OT_DB_OBJECT
                                   ,p_OBJ_OWNER in varchar2
                                   ,p_OBJ_NAME  in varchar2
                                    --
                                    ) return self as result is
  begin
    --
    self.Initialize(p_OBJ_OWNER
                   ,p_OBJ_NAME);
    --
    return;
    --
  end OT_DB_OBJECT;
  --
  constructor function OT_DB_OBJECT(self       in out nocopy OT_DB_OBJECT
                                   ,p_OBJ_NAME in varchar2
                                    --
                                    ) return self as result is
  begin
    --
    self.Initialize(p_OBJ_NAME);
    --
    return;
    --
  end OT_DB_OBJECT;
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
  * WWirns    08.02.2018  XX:Added
  *******************************************************************************/
  --
  final member procedure Initialize(self                in out nocopy OT_DB_OBJECT
                                   ,p_OBJ_TYPE          in varchar2
                                   ,p_OBJ_OWNER         in varchar2
                                   ,p_OBJ_NAME          in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
    --
    /*
    $if dbms_db_version.ver_le_11 $then
    v_Max_Identifier_Length pls_integer := 30;
    $else
    v_Max_Identifier_Length pls_integer := 128;
    $end
    */
    --
  begin
    --
    --
    (self as OT_DB_OWNER).Initialize(p_OBJ_TYPE
                                    ,p_OBJ_OWNER
                                    ,p_Is_Case_Sensitive);
    --
    --
    if (nvl(p_Is_Case_Sensitive
           ,0) != 0)
    then
      self.OBJ_NAME := p_OBJ_NAME;
    else
      self.OBJ_NAME := upper(trim(p_OBJ_NAME));
    end if;
    --
  end Initialize;
  --
  final member procedure Initialize(self                in out nocopy OT_DB_OBJECT
                                   ,p_OBJ_OWNER         in varchar2
                                   ,p_OBJ_NAME          in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
  begin
    --
    self.Initialize(null
                   ,p_OBJ_OWNER
                   ,p_OBJ_NAME
                   ,p_Is_Case_Sensitive);
    --
  end Initialize;
  --
  final member procedure Initialize(self                in out nocopy OT_DB_OBJECT
                                   ,p_OBJ_NAME          in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
  begin
    --
    self.Initialize(null
                   ,null
                   ,p_OBJ_NAME
                   ,p_Is_Case_Sensitive);
    --
  end Initialize;
  --
end;
/
  GRANT EXECUTE ON "DL_COMMON"."OT_DB_OBJECT" TO PUBLIC;
