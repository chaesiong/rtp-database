CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_UTILS" IS

 /*******************************************************************************
  * ???
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  26.10.2018  Added
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  --

  /**
   * Returns the selected parameter value
   * If no value was found the value NULL will be returned
   *
   * @param p_key_value Primary key of parameters table
   * @return parameters.parameter_value%TYPE
   */
  FUNCTION get_parameter (p_key_value parameters.key_value%TYPE)
  RETURN parameters.parameter_value%TYPE
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_parameter';
    l_params logger.tab_param;
    --
    l_result parameters.parameter_value%TYPE;

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.log('GET PARAMETER: start', l_scope, null, l_params);

    BEGIN

      SELECT parameter_value
        INTO l_result
        FROM parameters
       WHERE key_value = p_key_value;

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        l_result := NULL;
    END;

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('GET PARAMETER: start', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET PARAMETER: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_parameter;

  /**
   * Gets the server address to call the right service
   * @return VARCHAR2 Server address
   */
  FUNCTION get_server_address
  RETURN VARCHAR2
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_server_address';
    l_params logger.tab_param;
    --
    l_result  VARCHAR2(255 CHAR);
    l_server  VARCHAR2(255 CHAR);

  BEGIN

    logger.log('GET SERVER ADDRESS: start', l_scope, null, l_params);

    l_server := COALESCE(owa_util.get_cgi_env('HTTP_HOST'), utl_inaddr.get_host_address);

    IF instr(l_server, ':') > 0
    THEN
        l_server := substr(l_server, 1, instr(l_server, ':') - 1);
    END IF;

    l_result := owa_util.get_cgi_env('REQUEST_PROTOCOL') || '://' || l_server;

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('GET SERVER ADDRESS: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET SERVER ADDRESS: unhandled exeption', l_scope, null, l_params);
      RETURN NULL;
  END get_server_address;
END;
/
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_UTILS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_UTILS" TO "APPSUP";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_UTILS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_UTILS" TO "BIOSUPPORT";
