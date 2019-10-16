CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_DB_EXCE_CODE" is
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
  * WWirns    02.05.2018  DL_COMMON.OT_DB_EXCE_CODE:Added
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
  * WWirns    02.05.2018  XX:Added
  *******************************************************************************/
  --
  static function Construct(p_CODE in number
                            --
                            ) return OT_DB_EXCE_CODE is
    --
    v_Result OT_DB_EXCE_CODE;
    --
  begin
    v_Result := new OT_DB_EXCE_CODE(null);
    v_Result.Initialize(p_CODE);
    return v_Result;
  end Construct;
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
  static procedure Check_Codes(p_CODES in TT_N5
                               --
                               ) is
    --
    i pls_integer;
    --
  begin
    i := p_CODES.first;
    while (i is not null)
    loop
      if (p_CODES(i) >= 1 and not p_CODES(i) = 100)
      then
        Raise_application_error(-20000
                               ,'Argument p_CODES(' || trim(i) || ')[' || trim(p_CODES(i)) || '] is not negative or 0 or 100!');
      end if;
      i := p_CODES.next(i);
    end loop;
  end Check_Codes;
  --
  static procedure Check_Codes(p_CODES in VT_N5
                               --
                               ) is
    --
    i pls_integer;
    --
  begin
    i := p_CODES.first;
    while (i is not null)
    loop
      if (p_CODES(i) >= 1 and not p_CODES(i) = 100)
      then
        Raise_application_error(-20000
                               ,'Argument p_CODES(' || trim(i) || ')[' || trim(p_CODES(i)) || '] is not negative or 0 or 100!');
      end if;
      i := p_CODES.next(i);
    end loop;
  end Check_Codes;
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
  constructor function OT_DB_EXCE_CODE(self in out nocopy OT_DB_EXCE_CODE
                                      ,CODE in number
                                       --
                                       ) return self as result is
  begin
    --
    self.Initialize(CODE);
    --
    return;
    --
  end OT_DB_EXCE_CODE;
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
  final member procedure Initialize(self   in out nocopy OT_DB_EXCE_CODE
                                   ,p_CODE in number
                                    --
                                    ) is
    --
  begin
    --
    if (p_CODE >= 1 and not p_CODE = 100)
    then
      Raise_application_error(-20000
                             ,'Argument p_CODE[' || trim(p_CODE) || '] is not negative or 0 or 100!');
    end if;
    --
    self.CODE := p_CODE;
    --
  end Initialize;
  --
end;
/