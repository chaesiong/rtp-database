CREATE OR REPLACE EDITIONABLE PACKAGE "DL_USER_MANAGEMENT"."PKG_PARAM_CONFIG" 
IS
  /**
  * ========================================================================<br/>
  * <b> Parameter configuration API </b>  <br/> <br/>
  * Read / update parameter settings
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: M. Thierhoff $<br/>
  * @date    $Date: 16:19 20.02.2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */
  --


  PROCEDURE Get_Param_Value(
      i_param_name  IN VARCHAR2,
      o_value_str OUT VARCHAR2,
      o_value_num OUT NUMBER,
      o_value_is_on OUT NUMBER);

  FUNCTION F_Param_Value_Num(
      i_param_name  IN VARCHAR2)
    RETURN NUMBER;

  FUNCTION F_Param_Value_Is_On(
      i_param_name  IN VARCHAR2 )
    RETURN NUMBER;

  FUNCTION F_Param_Value_Str(
      i_param_name  IN VARCHAR2)
    RETURN VARCHAR2;


END PKG_PARAM_CONFIG;
/
