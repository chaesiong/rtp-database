CREATE OR REPLACE EDITIONABLE PACKAGE "DL_INTERFACE"."PKG_EXCHANGE_OBJECTS" is
  --
  --
  /*******************************************************************************
  * ???
  *
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  22.05.2018  Added receive_response_from_pibics
  * CHageman  22.05.2018  Added send_movement_to_pibics
  * CHageman  18.05.2018  Added
  *******************************************************************************/
  --
  --

  /**
   * Handles the response from pibics web service
   * @param p_request_body Request Body of APEX REST Service
   */
  PROCEDURE receive_response_from_pibics (p_request_body IN CLOB);

  /**
   * This function sends a REST request to the named service (uses the NGINX logic of the database server)
   * @param p_sender_message    Message body that should be send
   * @param p_service_address   Name of the service that should be used
   * @param x_response_code     Response code that was send by the other service
   * @param x_response_message  Response message that was send by the other service
   */
  PROCEDURE send_json_request (p_sender_message   IN  CLOB
                              ,p_service_address  IN  VARCHAR2
                              ,x_response_code    OUT VARCHAR2
                              ,x_response_message OUT CLOB);

end;
/
