CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."TEST" AS

function convert_image(p_blob in blob) return json_value
        as
            l_img clob;         -- image as base64
            l_b64 json_value;   -- base64 as pljson value
        begin
            if p_blob is null then
                return l_b64;
            end if;

            -- convert image from blob to base64 in clob
            l_img := apex_web_service.blob2clobbase64( p_blob );
            -- transform image clob to pljson value
            l_b64 := pljson_value( l_img );

            return l_b64;
end;

  PROCEDURE send_json_request_xx (p_sender_message   IN  CLOB
                              ,p_service_address  IN  VARCHAR2
                              ,x_response_code    OUT VARCHAR2
                              ,x_response_message OUT CLOB)
  IS
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
        x_response_code := 404;
        x_response_message := 'Service ' || l_service_address || ' could not be reached';
      ELSE
        RAISE;
      END IF;
  END send_json_request_xx;

END TEST;
/
