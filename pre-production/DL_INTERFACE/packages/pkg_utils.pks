CREATE OR REPLACE EDITIONABLE PACKAGE "DL_INTERFACE"."PKG_UTILS" is
  --
  --
  /*******************************************************************************
  * ???
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  26.10.2018  Added
  *******************************************************************************/
  --
  --
  /**
   * Returns the selected parameter value
   * If no value was found the value NULL will be returned
   *
   * @param p_key_value Primary key of parameters table
   * @return parameters.parameter_value%TYPE
   */
  FUNCTION get_parameter (p_key_value parameters.key_value%TYPE)
  RETURN parameters.parameter_value%TYPE;

  /**
   * Gets the server address to call the right service
   * @return VARCHAR2 Server address
   */
  FUNCTION get_server_address
  RETURN VARCHAR2;

end;
/
