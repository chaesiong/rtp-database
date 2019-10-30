CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_COMMON"."PKG_I18N" is
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0000';
  C_OBJECT_COPYRIGHT constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_PACKAGE_Initialized  boolean := false;
  g_PACKAGE_Initializing boolean := false;
  --
  g_Main_Data_Locale LOCALES.KEY_VALUE%type := null;
  g_Sess_Data_Locale LOCALES.KEY_VALUE%type := null;
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
  * WWirns    20.09.2017  Get_Session_Locale:Added
  *******************************************************************************/
  --
  function Get_Main_Data_Locale return LOCALES.KEY_VALUE%type is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    return g_Main_Data_Locale;
  end Get_Main_Data_Locale;
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
  * WWirns    20.09.2017  Get_Session_Locale:Added
  *******************************************************************************/
  --
  procedure Set_Sess_Data_Locale is
    vc_Tmp varchar2(32767 char);
  begin
    vc_Tmp             := SYS_CONTEXT('USERENV'
                                     ,'LANGUAGE');
    g_Sess_Data_Locale := UTL_I18N.map_locale_to_iso(regexp_replace(srcstr     => vc_Tmp
                                                                   ,pattern    => '^([A-Z ]+)_([A-Z ]+)\.([A-Z0-9 ]+)$'
                                                                   ,replacestr => '\1'
                                                                   ,modifier   => 'c')
                                                    ,regexp_replace(srcstr     => vc_Tmp
                                                                   ,pattern    => '^([A-Z ]+)_([A-Z ]+)\.([A-Z0-9 ]+)$'
                                                                   ,replacestr => '\2'
                                                                   ,modifier   => 'c')
                                                     --
                                                     );
  end Set_Sess_Data_Locale;
  --
  procedure Set_Sess_Data_Locale(p_LOCALE in LOCALES.KEY_VALUE%type
                                 --
                                 ) is
  begin
    if (not regexp_like(p_LOCALE
                       ,'^[a-z]{2}_[A-Z]{2}$'
                       ,'c'))
    then
      Raise_application_error(-20000
                             ,'Arg. p_LOCALE[''' || p_LOCALE || '''] is invalid!');
    end if;
    g_Sess_Data_Locale := p_LOCALE;
  end Set_Sess_Data_Locale;
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
  * WWirns    20.09.2017  Get_Session_Locale:Added
  *******************************************************************************/
  --
  function Get_Sess_Data_Locale return LOCALES.KEY_VALUE%type is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    return g_Sess_Data_Locale;
  end Get_Sess_Data_Locale;
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
  * WWirns    20.09.2017  Get_Session_Locale:Added
  *******************************************************************************/
  --
  procedure Alter_Sess_Data_Locale(p_LANGUAGE  in varchar2
                                  ,p_TERRITORY in varchar2
                                   --
                                   ) is
  begin
    execute immediate 'alter session set NLS_LANGUAGE=''' || upper(p_LANGUAGE) || ''' NLS_TERRITORY=''' || upper(p_TERRITORY) || '''';
    Set_Sess_Data_Locale();
  end Alter_Sess_Data_Locale;
  --
  procedure Alter_Sess_Data_Locale(p_LOCALE in LOCALES.KEY_VALUE%type
                                   --
                                   ) is
    v_LANGUAGE  varchar2(256 char);
    v_TERRITORY varchar2(256 char);
  begin
    v_LANGUAGE  := UTL_I18N.map_language_from_iso(p_LOCALE);
    v_TERRITORY := UTL_I18N.map_territory_from_iso(p_LOCALE);
    Alter_Sess_Data_Locale(v_LANGUAGE
                          ,v_TERRITORY
                           --
                           );
  end Alter_Sess_Data_Locale;
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
  * WWirns    20.09.2017  Get_Session_Locale:Added
  *******************************************************************************/
  --
  function Is_EQ_Main_Sess_Data_Locale return simple_integer is
  begin
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    if (g_Main_Data_Locale = g_Sess_Data_Locale)
    then
      return 1;
    else
      return 0;
    end if;
  end Is_EQ_Main_Sess_Data_Locale;
  --
  --
  -- *** Standard functions ***************************************************************************
  --
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
  * WWirns    13.01.2016  Init_PACKAGE:Added
  *******************************************************************************/
  --
  procedure Init_PACKAGE is
    --
  begin
    --
    -- !!! Attention with call of other packages, because their init routines could be call back !!!
    -- !!! Try to avoid call of other packages here in this init block in order to prevent endless loops !!!
    --
    --
    -- Initial-Block
    if (not g_PACKAGE_Initializing)
    then
      --
      g_PACKAGE_Initializing := true;
      g_PACKAGE_Initialized  := false;
      --
      --
      /*
      g_PACKAGE_NAME := PKG_UTIL.Get_PLSQL_Unit4Caller();
      if (g_PACKAGE_NAME.VC02 != Get_OBJECT_NAME())
      then
        Raise_application_error(-20000
                               ,'Invalid PACKAGE_NAME.VC02[''' || g_PACKAGE_NAME.VC02 || '''] for OBJECT_NAME[''' || Get_OBJECT_NAME() || '''] detected!');
      end if;
      */
      --
      --
      Check_OBJECT_DEPENDENCE();
      --
      --
      --g_AUDIT_STD_Values := PKG_AUDIT.Get_AUDIT_STD_Values();
      g_Main_Data_Locale := 'en_US';
      Set_Sess_Data_Locale();
      --
      --
      g_PACKAGE_Initialized  := true;
      g_PACKAGE_Initializing := false;
      --
    end if;
    --
    -- For example, below are calls into functions they itself calls me
    --
    --
    --
    --Create_CFGKEYS4JOBS$AT();
    --
    --
    --Update_JOBS$AT();
    --
  end Init_PACKAGE;
  --
  --
  --
  procedure Check_OBJECT_DEPENDENCE is
  begin
    -- WWirns: For example check ORACLE-Version
    -- or internal version via "Get_OBJECT_VERSION$VC()" of other package or object types
    -- or if column of table exists
    -- and so on...
    null;
    --
  end Check_OBJECT_DEPENDENCE;
  --
  --
  --
  function Get_PACKAGE_ID return simple_integer deterministic is
  begin
    return C_PACKAGE_ID;
  end;
  --
  function Get_OBJECT_NAME return varchar2 deterministic is
  begin
    return $$plsql_unit_owner || '.' || $$plsql_unit;
  end;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic is
  begin
    return C_OBJECT_COPYRIGHT;
  end;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic is
  begin
    return C_OBJECT_VERSION;
  end;
  --
--
--
begin
  --
  Init_PACKAGE();
  --
end PKG_I18N;
/
  GRANT EXECUTE ON "DL_COMMON"."PKG_I18N" TO PUBLIC;
  GRANT EXECUTE ON "DL_COMMON"."PKG_I18N" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_COMMON"."PKG_I18N" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_COMMON"."PKG_I18N" TO "BIOSUPPORT";
