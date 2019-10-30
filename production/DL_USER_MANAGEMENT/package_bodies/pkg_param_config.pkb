CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_USER_MANAGEMENT"."PKG_PARAM_CONFIG" 
AS
  /**
  * ========================================================================<br/>
  * <b> Parameter configuration API </b>  <br/> <br/>
  * Read / update parameter settings
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: M. Thierhoff $<br/>
  * @date    $Date: 07:32 16.03.2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  --
  g_scope_prefix constant varchar2(62 char) := lower($$plsql_unit_owner) || '.' ||lower($$plsql_unit) || '.';
  --
  -----------------------------------------------------------------------------
  /**
  * Get the desired value of a parameter <br/>
  * @param  i_param_name        id of parameter
  * @param  o_value_str       parameter value if of string type
  * @param  o_value_num       parameter value if numeric
  * @param  o_value_is_on     parameter value if boolean
  <br/><br/>
  */
  PROCEDURE Get_Param_Value(
      i_param_name  IN VARCHAR2,
      o_value_str OUT VARCHAR2,
      o_value_num OUT NUMBER,
      o_value_is_on OUT NUMBER)
  AS
    --l_scope 			        logger_logs.scope%type := g_scope_prefix || 'Get_Param_Value';
    --l_params 			        logger.tab_param;
  BEGIN
    --
    --logger.append_param(l_params, 'i_param_name', i_param_name);
    --logger.log('START', l_scope, null, l_params);
    --

      SELECT nvl(s.value_str,s.default_str),
        nvl(s.value_num,s.default_num),
        nvl(s.value_is_on,s.default_is_on)
      INTO o_value_str,
        o_value_num,
        o_value_is_on
      FROM parameter_settings s
      WHERE s.name         = i_param_name;
    --
    --logger.log('END', l_scope);
    --
  EXCEPTION
  WHEN OTHERS THEN
     -- logger.log_error('Unhandled Exception', l_scope, null, l_params);
    raise;
  END Get_Param_Value;


/**
* Returns the desired numeric value of a parameter <br/>
* @param  i_param_name        id of parameter
* @return numeric value of the parameter
<br/><br/>
*/
  FUNCTION F_Param_Value_Num(
      i_param_name  IN VARCHAR2)
    RETURN NUMBER
  AS
    --l_scope 			        logger_logs.scope%type := g_scope_prefix || 'F_Param_Value_Num';
    --l_params 			        logger.tab_param;
    l_value_str                 parameter_settings.default_str%type;
    l_value_num                 parameter_settings.default_num%type;
    l_value_is_on               parameter_settings.default_is_on%type;
  BEGIN
    --
    --logger.append_param(l_params, 'i_param_name', i_param_name);
    --logger.log('START', l_scope, null, l_params);
    --
    Get_Param_Value( i_param_name => i_param_name, o_value_str => l_value_str, o_value_num => l_value_num, o_value_is_on =>
    l_value_is_on);
    --
    --logger.log('END', l_scope);
    --
    RETURN l_value_num;
  EXCEPTION
  WHEN OTHERS THEN
      --logger.log_error('Unhandled Exception', l_scope, null, l_params);
    raise;
  END;


/**
* Returns the desired boolean(numeric) value of a parameter <br/>
* @param  i_param_name        id of parameter
* @return       boolean (numeric) value of the parameter
<br/><br/>
*/
  FUNCTION F_Param_Value_Is_On(
      i_param_name  IN VARCHAR2 )
    RETURN NUMBER
  AS
    --l_scope 			        logger_logs.scope%type := g_scope_prefix || 'F_Param_Value_Is_On';
    --l_params 			        logger.tab_param;
    l_value_str                 parameter_settings.default_str%type;
    l_value_num                 parameter_settings.default_num%type;
    l_value_is_on               parameter_settings.default_is_on%type;
  BEGIN
    --
    --logger.append_param(l_params, 'i_param_name', i_param_name);
    --logger.log('START', l_scope, null, l_params);
    --
    Get_Param_Value( i_param_name => i_param_name, o_value_str => l_value_str, o_value_num => l_value_num, o_value_is_on =>
    l_value_is_on);
    --
    --logger.log('END', l_scope);
    --
    RETURN l_value_is_on;
  EXCEPTION
  WHEN OTHERS THEN
      --logger.log_error('Unhandled Exception', l_scope, null, l_params);
    raise;
  END;


/**
* Returns the desired string value of a parameter <br/>
* @param  i_param_name        id of parameter
* @return       string value of the parameter
<br/><br/>
*/
  FUNCTION F_Param_Value_Str(
      i_param_name  IN VARCHAR2 )
    RETURN VARCHAR2
  AS
    --l_scope 			        logger_logs.scope%type := g_scope_prefix || 'F_Param_Value_Str';
    --l_params 			        logger.tab_param;
    l_value_str                 parameter_settings.default_str%type;
    l_value_num                 parameter_settings.default_num%type;
    l_value_is_on               parameter_settings.default_is_on%type;
  BEGIN
    --
    --logger.append_param(l_params, 'i_param_name', i_param_name);
    --logger.log('START', l_scope, null, l_params);
    --
    Get_Param_Value( i_param_name => i_param_name, o_value_str => l_value_str, o_value_num => l_value_num, o_value_is_on =>
    l_value_is_on);
    --
    -- logger.log('END', l_scope);
    --
    RETURN l_value_str;
  EXCEPTION
  WHEN OTHERS THEN
      --logger.log_error('Unhandled Exception', l_scope, null, l_params);
    raise;
  END;


END PKG_PARAM_CONFIG;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_PARAM_CONFIG" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_PARAM_CONFIG" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_PARAM_CONFIG" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_PARAM_CONFIG" TO "BIOSUPPORT";
