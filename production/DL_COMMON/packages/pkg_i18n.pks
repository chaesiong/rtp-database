CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PKG_I18N" authid current_user is
  --
  --
  /*******************************************************************************
  ???

  Do not change the locale between fetches of an OPEN/FETCH/CLOSE-Statements!

  Author    Date        Description
  --------  ----------  -------------------------------------------------------*
  WWirns    15.08.2017  Added
  *******************************************************************************/
  --
  --
  --
  function Get_Main_Data_Locale return LOCALES.KEY_VALUE%type;
  --
  --
  --
  procedure Set_Sess_Data_Locale;
  --
  procedure Set_Sess_Data_Locale(p_LOCALE in LOCALES.KEY_VALUE%type
                                 --
                                 );
  --
  --
  --
  function Get_Sess_Data_Locale return LOCALES.KEY_VALUE%type;
  --
  --
  --
  procedure Alter_Sess_Data_Locale(p_LANGUAGE  in varchar2
                                  ,p_TERRITORY in varchar2
                                   --
                                   );
  --
  procedure Alter_Sess_Data_Locale(p_LOCALE in LOCALES.KEY_VALUE%type
                                   --
                                   );
  --
  --
  --
  function Is_EQ_Main_Sess_Data_Locale return simple_integer;
  --
  --
  --
  procedure Init_PACKAGE;
  --
  procedure Check_OBJECT_DEPENDENCE;
  --
  function Get_PACKAGE_ID return simple_integer deterministic;
  --
  function Get_OBJECT_NAME return varchar2 deterministic;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic;
  --
end PKG_I18N;
/
