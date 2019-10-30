CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_SEARCH_DEFINITION" is
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
  * WWirns    15.08.2018  DL_COMMON.OT_SEARCH_DEFINITION:Added
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
  * WWirns    15.08.2018  XX:Added
  *******************************************************************************/
  --
  constructor function OT_SEARCH_DEFINITION(self             in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN          in varchar2
                                           ,REPLACEMENT      in varchar2
                                           ,POSITION         in integer
                                           ,OCCURENCE        in pls_integer
                                           ,SEARCH_FLAG_MASK in pls_integer
                                            --
                                            ) return self as result is
  begin
    --
    self.Initialize(PATTERN
                   ,REPLACEMENT
                   ,POSITION
                   ,OCCURENCE
                   ,SEARCH_FLAG_MASK
                    --
                    );
    --
    return;
    --
  end OT_SEARCH_DEFINITION;
  --
  constructor function OT_SEARCH_DEFINITION(self        in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN     in varchar2
                                           ,REPLACEMENT in varchar2
                                           ,POSITION    in integer
                                           ,OCCURENCE   in pls_integer
                                            --
                                            ) return self as result is
  begin
    --
    self.Initialize(PATTERN
                   ,REPLACEMENT
                   ,POSITION
                   ,OCCURENCE
                    --
                    );
    --
    return;
    --
  end OT_SEARCH_DEFINITION;
  --
  constructor function OT_SEARCH_DEFINITION(self        in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN     in varchar2
                                           ,REPLACEMENT in varchar2
                                           ,POSITION    in integer
                                            --
                                            ) return self as result is
  begin
    --
    self.Initialize(PATTERN
                   ,REPLACEMENT
                   ,POSITION
                    --
                    );
    --
    return;
    --
  end OT_SEARCH_DEFINITION;
  --
  constructor function OT_SEARCH_DEFINITION(self        in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN     in varchar2
                                           ,REPLACEMENT in varchar2
                                            --
                                            ) return self as result is
  begin
    --
    self.Initialize(PATTERN
                   ,REPLACEMENT
                    --
                    );
    --
    return;
    --
  end OT_SEARCH_DEFINITION;
  --
  constructor function OT_SEARCH_DEFINITION(self    in out nocopy OT_SEARCH_DEFINITION
                                           ,PATTERN in varchar2
                                            --
                                            ) return self as result is
  begin
    --
    self.Initialize(PATTERN
                    --
                    );
    --
    return;
    --
  end OT_SEARCH_DEFINITION;
  --
  constructor function OT_SEARCH_DEFINITION(self in out nocopy OT_SEARCH_DEFINITION
                                            --
                                            ) return self as result is
  begin
    --
    self.Initialize();
    --
    return;
    --
  end OT_SEARCH_DEFINITION;
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
  * WWirns    15.08.2018  XX:Added
  *******************************************************************************/
  --
  final member procedure Initialize(self               in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN          in varchar2
                                   ,p_REPLACEMENT      in varchar2
                                   ,p_POSITION         in integer
                                   ,p_OCCURENCE        in pls_integer
                                   ,p_SEARCH_FLAG_MASK in pls_integer
                                    --
                                    ) is
    --
  begin
    --
    self.PATTERN          := p_PATTERN;
    self.REPLACEMENT      := p_REPLACEMENT;
    self.POSITION         := nvl(p_POSITION
                                ,1);
    self.OCCURENCE        := nvl(p_OCCURENCE
                                ,1);
    self.SEARCH_FLAG_MASK := nvl(p_SEARCH_FLAG_MASK
                                ,1);
    --
  end Initialize;
  --
  final member procedure Initialize(self          in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN     in varchar2
                                   ,p_REPLACEMENT in varchar2
                                   ,p_POSITION    in integer
                                   ,p_OCCURENCE   in pls_integer
                                    --
                                    ) is
    --
  begin
    --
    self.Initialize(p_PATTERN
                   ,p_REPLACEMENT
                   ,p_POSITION
                   ,p_OCCURENCE
                   ,null
                    --
                    );
    --
  end Initialize;
  --
  final member procedure Initialize(self          in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN     in varchar2
                                   ,p_REPLACEMENT in varchar2
                                   ,p_POSITION    in integer
                                    --
                                    ) is
    --
  begin
    --
    self.Initialize(p_PATTERN
                   ,p_REPLACEMENT
                   ,p_POSITION
                   ,null
                   ,null
                    --
                    );
    --
  end Initialize;
  --
  final member procedure Initialize(self          in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN     in varchar2
                                   ,p_REPLACEMENT in varchar2
                                    --
                                    ) is
    --
  begin
    --
    self.Initialize(p_PATTERN
                   ,p_REPLACEMENT
                   ,null
                   ,null
                   ,null
                    --
                    );
    --
  end Initialize;
  --
  final member procedure Initialize(self      in out nocopy OT_SEARCH_DEFINITION
                                   ,p_PATTERN in varchar2
                                    --
                                    ) is
    --
  begin
    --
    self.Initialize(p_PATTERN
                   ,null
                   ,null
                   ,null
                   ,null
                    --
                    );
    --
  end Initialize;
  --
  final member procedure Initialize(self in out nocopy OT_SEARCH_DEFINITION
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
                    --
                    );
    --
  end Initialize;
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
  * WWirns    15.08.2018  Is_Pattern_Case_Sensitive:Added
  *******************************************************************************/
  --
  final member function Is_Pattern_Case_Sensitive(self in OT_SEARCH_DEFINITION
                                                  --
                                                  ) return pls_integer is
  begin
    if (bitand(self.SEARCH_FLAG_MASK
              ,1) = 1)
    then
      return 1;
    else
      return 0;
    end if;
  end Is_Pattern_Case_Sensitive;
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
  * WWirns    15.08.2018  Is_Pattern_Like:Added
  *******************************************************************************/
  --
  final member function Is_Pattern_Like(self in OT_SEARCH_DEFINITION
                                        --
                                        ) return pls_integer is
  begin
    if (bitand(self.SEARCH_FLAG_MASK
              ,2) = 2)
    then
      return 1;
    else
      return 0;
    end if;
  end Is_Pattern_Like;
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
  * WWirns    15.08.2018  Is_Pattern_RegExp:Added
  *******************************************************************************/
  --
  final member function Is_Pattern_RegExp(self in OT_SEARCH_DEFINITION
                                          --
                                          ) return pls_integer is
  begin
    if (bitand(self.SEARCH_FLAG_MASK
              ,4) = 4)
    then
      return 1;
    else
      return 0;
    end if;
  end Is_Pattern_RegExp;
  --
end;
/
  
