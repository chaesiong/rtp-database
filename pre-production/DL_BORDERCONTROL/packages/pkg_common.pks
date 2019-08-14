CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_COMMON" is
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for common logic in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: C. Funke $<br/>
  * @date    $Date:  24/10/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */
  --
  --
  --
  function Get_Parameter(p_NAME in varchar2
                         --
                         ) return varchar2;
  --
  --
  --
  function Parse_Date(p_DATETEXT       in varchar2
                     ,p_MUST_BE_PAST   in number default 0
                     ,p_MUST_BE_FUTURE in number default 0
                     ,p_YEARLIMIT      in number default 0
                     ,p_REVERSEDATE    in number default 0
                      --
                      ) return date;
  --
  --
  --
  function Tolerant_To_Date(p_DATETEXT in varchar2
                           ,p_FORMAT   in varchar2
                      --
                      ) return date;
  --
  --
  --
  function Resolve_Host(p_IP_ADDR in varchar2
                        --
                        ) return varchar2;
  --
  --
  --
  function Get_Borderpost4NAME(p_NAME         in BORDERPOSTS.NAME%type
                              ,p_Only_ACTIVE  in pls_integer default 1
                              ,p_Prevent_EXCE in pls_integer default 0
                               --
                               ) return BORDERPOSTS.KEY_VALUE%type RESULT_CACHE;
  --
  --
  --
  function Get_Borderpost4TERM_NAME(p_NAME         in TERMINALS.NAME%type
                                   ,p_Only_ACTIVE  in pls_integer default 1
                                   ,p_Prevent_EXCE in pls_integer default 0
                                    --
                                    ) return BORDERPOSTS.KEY_VALUE%type RESULT_CACHE;
  --
  --
  --
  function Get_Borderpost4TERM_IPADDR(p_IPADDRESS    in TERMINALS.IPADDRESS%type
                                     ,p_Only_ACTIVE  in pls_integer default 1
                                     ,p_Prevent_EXCE in pls_integer default 0
                                      --
                                      ) return BORDERPOSTS.KEY_VALUE%type RESULT_CACHE;
  --
  --
  --
  function Get_Borderpost4TERM_ID(p_ID           in TERMINALS.ID%type
                                 ,p_Only_ACTIVE  in pls_integer default 1
                                 ,p_Prevent_EXCE in pls_integer default 0
                                  --
                                  ) return BORDERPOSTS.KEY_VALUE%type RESULT_CACHE;
  --
  --
  --
  FUNCTION Get_Partial_Date(p_DATETEXT          IN VARCHAR2
                            ,p_MUST_BE_PAST     IN NUMBER DEFAULT 0
                            ,p_MUST_BE_FUTURE   IN NUMBER DEFAULT 0
                            ,p_YEARLIMIT        IN NUMBER DEFAULT 0
                            ,p_REVERSEDATE      IN NUMBER DEFAULT 0
                            ,p_Prevent_EXCE     IN PLS_INTEGER DEFAULT 0
                           ) RETURN DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;
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
  function Get_MODULE_VERSION(p_ModuleName in varchar2) return varchar2;
  --
  function Get_RELEASE_VERSION return varchar2;
  --
  procedure print_loginversion_html(p_modulename in varchar2);
  --
  /**
   * Returns the value of form no from table ENTRY_FORMS by the give PK (key_value)
   *
   * @param i_key_value PK of table ENTRY_FORMS
   * @return entry_forms.form_no Number of form (e.g. TM6 number)
   */
  FUNCTION get_entry_form_no_by_pk (i_key_value IN entry_forms.key_value%TYPE)
  RETURN entry_forms.form_no%TYPE;

end PKG_COMMON;
/
