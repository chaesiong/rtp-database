CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_DB_TBLSPC" is
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
  * WWirns    19.02.2018  DL_COMMON.OT_DB_TBLSPC:Added
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
  * WWirns    19.02.2018  XX:Added
  *******************************************************************************/
  --
  static function Construct(p_TBLSPC_NAME       in varchar2
                           ,p_Is_Case_Sensitive in pls_integer default 0
                            --
                            ) return OT_DB_TBLSPC is
    --
    v_Result OT_DB_TBLSPC;
    --
  begin
    v_Result := new OT_DB_TBLSPC(null);
    v_Result.Initialize(p_TBLSPC_NAME
                       ,p_Is_Case_Sensitive);
    return v_Result;
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
  * WWirns    19.02.2018  XX:Added
  *******************************************************************************/
  --
  constructor function OT_DB_TBLSPC(self        in out nocopy OT_DB_TBLSPC
                                   ,TBLSPC_NAME in varchar2
                                    --
                                    ) return self as result is
  begin
    --
    self.Initialize(TBLSPC_NAME);
    --
    return;
    --
  end OT_DB_TBLSPC;
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
  * WWirns    19.02.2018  XX:Added
  *******************************************************************************/
  --
  final member procedure Initialize(self                in out nocopy OT_DB_TBLSPC
                                   ,p_TBLSPC_NAME       in varchar2
                                   ,p_Is_Case_Sensitive in pls_integer default 0
                                    --
                                    ) is
    --
  begin
    --
    --
    if (nvl(p_Is_Case_Sensitive
           ,0) != 0)
    then
      self.TBLSPC_NAME := p_TBLSPC_NAME;
    else
      self.TBLSPC_NAME := upper(trim(p_TBLSPC_NAME));
    end if;
    --
  end Initialize;
  --
end;
/
  
