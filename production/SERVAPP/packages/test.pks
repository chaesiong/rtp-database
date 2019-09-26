CREATE OR REPLACE EDITIONABLE PACKAGE "SERVAPP"."TEST" AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
  PROCEDURE send_json_request_xx (p_sender_message   IN  CLOB
                              ,p_service_address  IN  VARCHAR2
                              ,x_response_code    OUT VARCHAR2
                              ,x_response_message OUT CLOB);
END TEST;
/
