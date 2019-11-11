CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_UTILS" AS

   PROCEDURE post (p_sender_message   IN  CLOB
                              ,p_service_address  IN  VARCHAR2
                              ,x_response_code    OUT VARCHAR2
                              ,x_response_message OUT CLOB) AS
      --
    l_response_code     VARCHAR2(500 CHAR);
    l_response_message  CLOB;
    l_result            CLOB;
    --
    l_service_address   VARCHAR2(255 CHAR) := /*pkg_utils.get_server_address() ||*/ p_service_address;
   
  BEGIN
  
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

  
  EXCEPTION
    WHEN OTHERS
    THEN
      IF SQLCODE = '-29273'
      THEN
       DBMS_OUTPUT.put_line(sqlerrm);
        x_response_code := 404;
        x_response_message := 'Service ' || l_service_address || ' could not be reached ('||sqlerrm||')';
        
      ELSE
        RAISE;
      END IF;
  END post;

  
    PROCEDURE display (
         p_obj IN JSON_OBJECT_T) as
  BEGIN
   DBMS_OUTPUT.put_line(p_obj.stringify);
  END display;

END PKG_UTILS;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_UTILS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_UTILS" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_UTILS" TO "BIOSAADM";
