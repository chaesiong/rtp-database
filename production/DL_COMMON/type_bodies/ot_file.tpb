CREATE OR REPLACE EDITIONABLE TYPE BODY "DL_COMMON"."OT_FILE" is
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
  * WWirns    17.08.2018  DL_COMMON.OT_FILE:Added
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
  constructor function OT_FILE(self   in out nocopy OT_FILE
                              ,NAME$P in varchar2
                              ,PATH$P in clob
                               --
                               ) return self as result is
  begin
    --
    self.Initialize(NAME$P
                   ,PATH$P
                    --
                    );
    --
    return;
    --
  end OT_FILE;
  --
  constructor function OT_FILE(self   in out nocopy OT_FILE
                              ,NAME$P in varchar2
                               --
                               ) return self as result is
  begin
    --
    self.Initialize(NAME$P
                    --
                    );
    --
    return;
    --
  end OT_FILE;
  --
  constructor function OT_FILE(self in out nocopy OT_FILE
                               --
                               ) return self as result is
  begin
    --
    self.Initialize();
    --
    return;
    --
  end OT_FILE;
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
  final member procedure Initialize(self   in out nocopy OT_FILE
                                   ,p_NAME in varchar2
                                   ,p_PATH in clob
                                    --
                                    ) is
    --
  begin
    --
    self.Set_NAME(p_NAME);
    --
    if (not regexp_like(p_NAME
                       ,'[/\]'
                       ,'i')
       --
       or p_PATH is not null)
    then
      self.Set_PATH(p_PATH);
    end if;
    --
  end Initialize;
  --
  final member procedure Initialize(self   in out nocopy OT_FILE
                                   ,p_NAME in varchar2
                                    --
                                    ) is
    --
  begin
    --
    self.Initialize(p_NAME
                   ,null
                    --
                    );
    --
  end Initialize;
  --
  final member procedure Initialize(self in out nocopy OT_FILE
                                    --
                                    ) is
    --
  begin
    --
    self.Initialize(null
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
  * WWirns    17.08.2018  *et_NAME:Added
  *******************************************************************************/
  --
  final member function Get_NAME(self in OT_FILE
                                 --
                                 ) return varchar2 is
  begin
    return self.NAME$P;
  end Get_NAME;
  --
  final member procedure Set_NAME(self   in out nocopy OT_FILE
                                 ,p_NAME in varchar2
                                  --
                                  ) is
    --
    v_NAME           self.NAME$P%type;
    v_Last_Delim_Pos pls_integer;
    --
  begin
    if (regexp_like(p_NAME
                   ,'[/\]'
                   ,'i'))
    then
      --
      -- p_NAME contains also the path
      --
      v_Last_Delim_Pos := instr(p_NAME
                               ,'\'
                               ,-1);
      if (v_Last_Delim_Pos = 0)
      then
        v_Last_Delim_Pos := instr(p_NAME
                                 ,'/'
                                 ,-1);
      end if;
      v_NAME := substr(p_NAME
                      ,v_Last_Delim_Pos + 1);
      self.Set_PATH(substr(p_NAME
                          ,1
                          ,v_Last_Delim_Pos));
      --
    else
      --
      -- p_NAME contains only the name
      --
      v_NAME := p_NAME;
      --
    end if;
    --
    if (regexp_like(v_NAME
                   ,'[/\:*"?<>|]'
                   ,'i'))
    then
      Raise_application_error(-20000
                             ,'Invalid NAME, found any of [/\:*"?<>|]!');
    end if;
    self.NAME$P := v_NAME;
  end Set_NAME;
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
  * WWirns    17.08.2018  *et_PATH:Added
  *******************************************************************************/
  --
  final member function Get_PATH(self in OT_FILE
                                 --
                                 ) return varchar2 is
  begin
    return self.PATH$P;
  end Get_PATH;
  --
  final member procedure Set_PATH(self   in out nocopy OT_FILE
                                 ,p_PATH in clob
                                  --
                                  ) is
    --
    v_Not_Allowed_Chars4PATH varchar2(32 char);
    --
  begin
    --
    -- Path is n elements of filenames and max. 32767 char length
    if (instr(p_PATH
             ,'\') > 0)
    then
      v_Not_Allowed_Chars4PATH := '/:*"?<>|';
    else
      v_Not_Allowed_Chars4PATH := '\:*"?<>|';
    end if;
    if (regexp_like(p_PATH
                   ,'[' || v_Not_Allowed_Chars4PATH || ']'
                   ,'i'))
    then
      Raise_application_error(-20000
                             ,'Invalid PATH, found any of [' || v_Not_Allowed_Chars4PATH || ']!');
    end if;
    if (lengthc(p_PATH) > 32767)
    then
      Raise_application_error(-20000
                             ,'Invalid PATH, length exceeds 32767 chars!');
    end if;
    self.PATH$P := p_PATH;
  end Set_PATH;
  --
end;
/
