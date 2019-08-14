CREATE OR REPLACE EDITIONABLE TYPE "DL_COMMON"."OT_DB_OBJECT_TBLSPC" force authid current_user under OT_DB_OBJECT
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
  DB_TBLSPC OT_DB_TBLSPC
--
)
--
not final
 alter type           "DL_COMMON"."OT_DB_OBJECT_TBLSPC" 
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
                             ,p_TBLSPC_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_OBJECT_TBLSPC,
--
add static function Construct(p_OBJ_OWNER in varchar2
                             ,p_OBJ_NAME in varchar2
                             ,p_TBLSPC_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_OBJECT_TBLSPC,
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_OBJECT_TBLSPC(self in out nocopy OT_DB_OBJECT_TBLSPC
                                            ,OBJ_TYPE in varchar2
                                            ,OBJ_OWNER in varchar2
                                            ,OBJ_NAME in varchar2
                                            ,DB_TBLSPC in OT_DB_TBLSPC
                                             --
                                             )
  return self as result,
--
add constructor function OT_DB_OBJECT_TBLSPC(self in out nocopy OT_DB_OBJECT_TBLSPC
                                            ,p_OBJ_TYPE in varchar2
                                            ,p_OBJ_OWNER in varchar2
                                            ,p_OBJ_NAME in varchar2
                                            ,p_TBLSPC_NAME in varchar2
                                             --
                                             )
  return self as result,
--
add constructor function OT_DB_OBJECT_TBLSPC(self in out nocopy OT_DB_OBJECT_TBLSPC
                                            ,p_OBJ_OWNER in varchar2
                                            ,p_OBJ_NAME in varchar2
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
add final member procedure Initialize(self in out nocopy OT_DB_OBJECT_TBLSPC
                                     ,p_OBJ_TYPE in varchar2
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                     ,p_DB_TBLSPC in OT_DB_TBLSPC
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      ),
--
add final member procedure Initialize(self in out nocopy OT_DB_OBJECT_TBLSPC
                                     ,p_OBJ_TYPE in varchar2
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                     ,p_TBLSPC_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      ),
--
add final member procedure Initialize(self in out nocopy OT_DB_OBJECT_TBLSPC
                                     ,p_OBJ_OWNER in varchar2
                                     ,p_OBJ_NAME in varchar2
                                     ,p_TBLSPC_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      )
--
cascade
--
 alter type           "DL_COMMON"."OT_DB_OBJECT_TBLSPC" 
--
-- *** STATICS ***
--
--
--
--
add static function Construct(p_OBJ_NAME in varchar2
                             ,p_TBLSPC_NAME in varchar2
                             ,p_Is_Case_Sensitive in pls_integer default 0
                              --
                              )
  return OT_DB_OBJECT_TBLSPC,
--
-- *** CONSTRUCTORS ***
--
--
--
--
add constructor function OT_DB_OBJECT_TBLSPC(self in out nocopy OT_DB_OBJECT_TBLSPC
                                            ,p_OBJ_NAME in varchar2
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
add final member procedure Initialize(self in out nocopy OT_DB_OBJECT_TBLSPC
                                     ,p_OBJ_NAME in varchar2
                                     ,p_TBLSPC_NAME in varchar2
                                     ,p_Is_Case_Sensitive in pls_integer default 0
                                      --
                                      )
--
cascade
--
/
CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_DB_OBJECT_TBLSPC" is
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
  * WWirns    15.02.2018  DL_COMMON.OT_DB_OBJECT_TBLSPC:Added
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
                           ,p_TBLSPC_NAME       in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_OBJECT_TBLSPC is
    --
    v_Result OT_DB_OBJECT_TBLSPC;
    --
  begin
    v_Result := new OT_DB_OBJECT_TBLSPC(null
                                       ,null);
    v_Result.Initialize(p_OBJ_TYPE
                       ,p_OBJ_OWNER
                       ,p_OBJ_NAME
                       ,p_TBLSPC_NAME
                       ,p_Is_Case_Sensitive);
    return v_Result;
  end Construct;
  --
  static function Construct(p_OBJ_OWNER         in varchar2
                           ,p_OBJ_NAME          in varchar2
                           ,p_TBLSPC_NAME       in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_OBJECT_TBLSPC is
  begin
    return Construct(null
                    ,p_OBJ_OWNER
                    ,p_OBJ_NAME
                    ,p_TBLSPC_NAME
                    ,p_Is_Case_Sensitive);
  end Construct;
  --
  static function Construct(p_OBJ_NAME          in varchar2
                           ,p_TBLSPC_NAME       in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_OBJECT_TBLSPC is
  begin
    return Construct(null
                    ,null
                    ,p_OBJ_NAME
                    ,p_TBLSPC_NAME
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
  constructor function OT_DB_OBJECT_TBLSPC(self      in out nocopy OT_DB_OBJECT_TBLSPC
                                          ,OBJ_TYPE  in varchar2
                                          ,OBJ_OWNER in varchar2
                                          ,OBJ_NAME  in varchar2
                                          ,DB_TBLSPC in OT_DB_TBLSPC
                                           --
                                           ) return self as result is
  begin
    --
    self.Initialize(OBJ_TYPE
                   ,OBJ_OWNER
                   ,OBJ_NAME
                   ,DB_TBLSPC);
    --
    return;
    --
  end OT_DB_OBJECT_TBLSPC;
  --
  constructor function OT_DB_OBJECT_TBLSPC(self          in out nocopy OT_DB_OBJECT_TBLSPC
                                          ,p_OBJ_TYPE    in varchar2
                                          ,p_OBJ_OWNER   in varchar2
                                          ,p_OBJ_NAME    in varchar2
                                          ,p_TBLSPC_NAME in varchar2
                                           --
                                           ) return self as result is
  begin
    --
    self.Initialize(p_OBJ_TYPE
                   ,p_OBJ_OWNER
                   ,p_OBJ_NAME
                   ,p_TBLSPC_NAME);
    --
    return;
    --
  end OT_DB_OBJECT_TBLSPC;
  --
  constructor function OT_DB_OBJECT_TBLSPC(self          in out nocopy OT_DB_OBJECT_TBLSPC
                                          ,p_OBJ_OWNER   in varchar2
                                          ,p_OBJ_NAME    in varchar2
                                          ,p_TBLSPC_NAME in varchar2
                                           --
                                           ) return self as result is
  begin
    --
    self.Initialize(p_OBJ_OWNER
                   ,p_OBJ_NAME
                   ,p_TBLSPC_NAME);
    --
    return;
    --
  end OT_DB_OBJECT_TBLSPC;
  --
  constructor function OT_DB_OBJECT_TBLSPC(self          in out nocopy OT_DB_OBJECT_TBLSPC
                                          ,p_OBJ_NAME    in varchar2
                                          ,p_TBLSPC_NAME in varchar2
                                           --
                                           ) return self as result is
  begin
    --
    self.Initialize(p_OBJ_NAME
                   ,p_TBLSPC_NAME);
    --
    return;
    --
  end OT_DB_OBJECT_TBLSPC;
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
  final member procedure Initialize(self                in out nocopy OT_DB_OBJECT_TBLSPC
                                   ,p_OBJ_TYPE          in varchar2
                                   ,p_OBJ_OWNER         in varchar2
                                   ,p_OBJ_NAME          in varchar2
                                   ,p_DB_TBLSPC         in OT_DB_TBLSPC
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
    --
  begin
    --
    --
    (self as OT_DB_OBJECT).Initialize(p_OBJ_TYPE
                                     ,p_OBJ_OWNER
                                     ,p_OBJ_NAME
                                     ,p_Is_Case_Sensitive);
    --
    --
    self.DB_TBLSPC := p_DB_TBLSPC;
    --
  end Initialize;
  --
  final member procedure Initialize(self                in out nocopy OT_DB_OBJECT_TBLSPC
                                   ,p_OBJ_TYPE          in varchar2
                                   ,p_OBJ_OWNER         in varchar2
                                   ,p_OBJ_NAME          in varchar2
                                   ,p_TBLSPC_NAME       in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
    --
  begin
    --
    --
    self.Initialize(p_OBJ_TYPE
                   ,p_OBJ_OWNER
                   ,p_OBJ_NAME
                   ,OT_DB_TBLSPC.Construct(p_TBLSPC_NAME
                                          ,p_Is_Case_Sensitive)
                   ,p_Is_Case_Sensitive);
    --
  end Initialize;
  --
  final member procedure Initialize(self                in out nocopy OT_DB_OBJECT_TBLSPC
                                   ,p_OBJ_OWNER         in varchar2
                                   ,p_OBJ_NAME          in varchar2
                                   ,p_TBLSPC_NAME       in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
  begin
    --
    self.Initialize(null
                   ,p_OBJ_OWNER
                   ,p_OBJ_NAME
                   ,p_TBLSPC_NAME
                   ,p_Is_Case_Sensitive);
    --
  end Initialize;
  --
  final member procedure Initialize(self                in out nocopy OT_DB_OBJECT_TBLSPC
                                   ,p_OBJ_NAME          in varchar2
                                   ,p_TBLSPC_NAME       in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
  begin
    --
    self.Initialize(null
                   ,null
                   ,p_OBJ_NAME
                   ,p_TBLSPC_NAME
                   ,p_Is_Case_Sensitive);
    --
  end Initialize;
  --
end;
/
  GRANT EXECUTE ON "DL_COMMON"."OT_DB_OBJECT_TBLSPC" TO PUBLIC;
