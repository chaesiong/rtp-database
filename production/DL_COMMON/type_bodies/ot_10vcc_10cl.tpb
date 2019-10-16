CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_10VCC_10CL" is
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
  * WWirns    02.05.2018  DL_COMMON.OT_10VCC_10CL:Added
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
  * WWirns    02.05.2018  XX:Added
  *******************************************************************************/
  --
  constructor function OT_10VCC_10CL(self  in out nocopy OT_10VCC_10CL
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
                                    ,CL00  in clob
                                    ,CL01  in clob
                                    ,CL02  in clob
                                    ,CL03  in clob
                                    ,CL04  in clob
                                    ,CL05  in clob
                                    ,CL06  in clob
                                    ,CL07  in clob
                                    ,CL08  in clob
                                    ,CL09  in clob
                                     --
                                     ) return self as result is
  begin
    --
    self.Initialize(VCC00
                   ,VCC01
                   ,VCC02
                   ,VCC03
                   ,VCC04
                   ,VCC05
                   ,VCC06
                   ,VCC07
                   ,VCC08
                   ,VCC09
                   ,CL00
                   ,CL01
                   ,CL02
                   ,CL03
                   ,CL04
                   ,CL05
                   ,CL06
                   ,CL07
                   ,CL08
                   ,CL09
                    --
                    );
    --
    return;
    --
  end OT_10VCC_10CL;
  --
  constructor function OT_10VCC_10CL(self in out nocopy OT_10VCC_10CL
                                     --
                                     ) return self as result is
  begin
    --
    self.Initialize();
    --
    return;
    --
  end OT_10VCC_10CL;
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
  * WWirns    02.05.2018  XX:Added
  *******************************************************************************/
  --
  final member procedure Initialize(self    in out nocopy OT_10VCC_10CL
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
                                   ,p_CL00  in clob
                                   ,p_CL01  in clob
                                   ,p_CL02  in clob
                                   ,p_CL03  in clob
                                   ,p_CL04  in clob
                                   ,p_CL05  in clob
                                   ,p_CL06  in clob
                                   ,p_CL07  in clob
                                   ,p_CL08  in clob
                                   ,p_CL09  in clob
                                    --
                                    ) is
    --
  begin
    --
    self.VCC00 := p_VCC00;
    self.VCC01 := p_VCC01;
    self.VCC02 := p_VCC02;
    self.VCC03 := p_VCC03;
    self.VCC04 := p_VCC04;
    self.VCC05 := p_VCC05;
    self.VCC06 := p_VCC06;
    self.VCC07 := p_VCC07;
    self.VCC08 := p_VCC08;
    self.VCC09 := p_VCC09;
    self.CL00  := p_CL00;
    self.CL01  := p_CL01;
    self.CL02  := p_CL02;
    self.CL03  := p_CL03;
    self.CL04  := p_CL04;
    self.CL05  := p_CL05;
    self.CL06  := p_CL06;
    self.CL07  := p_CL07;
    self.CL08  := p_CL08;
    self.CL09  := p_CL09;
    --
  end Initialize;
  --
  final member procedure Initialize(self in out nocopy OT_10VCC_10CL
                                    --
                                    ) is
    --
  begin
    --
    self.Initialize(null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null
                   ,null);
    --
  end Initialize;
  --
end;
/