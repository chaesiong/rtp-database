CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_EXCHANGE_OBJECTS" IS

 /*******************************************************************************
  * ???
  *
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  18.05.2018  Added
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31)   := lower($$plsql_unit) || '.';
  c_date_format_json    CONSTANT VARCHAR2(50)   := 'YYYY-MM-DD"T"HH24:MI:SS'; --TZH:TZM
  c_date_format_short   CONSTANT VARCHAR2(32)   := 'YYYYMMDD';
  /*c_service_address     CONSTANT VARCHAR2(255)  := 'http://10.50.1.39/bioservice/rest/isds/inout/';*/
  --

  /**
   * Handles the response from pibics web service
   * @param p_request_body Request Body of APEX REST Service
   */
   -- TODO: receives pks from pibics / somapa --> refactor
  PROCEDURE receive_response_from_pibics (p_request_body IN CLOB)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'receive_response_from_pibics';
    l_params logger.tab_param;
    --
    l_body CLOB;

    l_bordercontrol_object      dl_interface.log_sync_webservices.sender_object%type;
    l_bordercontrol_object_id   dl_interface.log_sync_webservices.sender_object_id%type;
    l_response_code             dl_interface.log_sync_webservices.sender_response_code%type;
    l_biopk                     dl_interface.log_sync_webservices.KEY_VALUE%type;

  BEGIN

    logger.append_param(l_params, 'p_request_body', p_request_body);
    logger.log('RECEIVE RESPONSE FROM PIBICS: start', l_scope, null, l_params);

    APEX_JSON.parse(p_request_body);

    l_RESPONSE_CODE            := APEX_JSON.get_varchar2(p_path => 'msgRes.msgCode');
    l_BIOPK                    := APEX_JSON.get_varchar2(p_path => 'bioPk');

    logger.append_param(l_params, 'l_RESPONSE_CODE', l_RESPONSE_CODE);
    logger.append_param(l_params, 'l_BIOPK', l_BIOPK);

    UPDATE dl_interface.log_sync_webservices
    SET
        receiver_response  = l_body
    WHERE
        key_value = l_biopk;

    logger.log('RECEIVE RESPONSE FROM PIBICS: start', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('RECEIVE RESPONCE FROM PIBICS: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END receive_response_from_pibics;

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
                              ,x_response_message OUT CLOB)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_json_request';
    l_params logger.tab_param;
    --
    l_response_code     VARCHAR2(500 CHAR);
    l_response_message  CLOB;
    l_result            CLOB;
    --
    l_service_address   VARCHAR2(255 CHAR) := /*pkg_utils.get_server_address() ||*/ p_service_address;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_sender_message, 4000, 1)', dbms_lob.substr(p_sender_message, 4000, 1));
    logger.append_param(l_params, 'p_service_address', p_service_address);
    logger.log('SEND JSON REQUEST: start', l_scope, null, l_params);

    -- reset headers
    apex_web_service.g_request_headers.delete();
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json';

    -- make REST request
    l_result := apex_web_service.make_rest_request(
                    p_url => l_service_address
                  , p_http_method => 'POST'
                  , p_transfer_timeout => 60
                  , p_body => p_sender_message
                );

    x_response_code := apex_web_service.g_status_code;
    x_response_message := l_result;

    logger.append_param(l_params, 'x_response_code', apex_web_service.g_status_code);
    logger.append_param(l_params, 'x_response_message', dbms_lob.substr(x_response_message, 4000, 1));

    logger.log('SEND JSON REQUEST: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN

      IF SQLCODE = '-29273'
      THEN
        x_response_code := 404;
        x_response_message := 'Service ' || l_service_address || ' could not be reached';
      ELSE
        logger.log_error('SEND JSON REQUEST: unhandled exeption', l_scope, null, l_params);
        RAISE;
      END IF;
  END send_json_request;

END;
/
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_EXCHANGE_OBJECTS" TO "DERMALOG_PROXY";
