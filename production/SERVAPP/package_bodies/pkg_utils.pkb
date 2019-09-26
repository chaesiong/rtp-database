CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."PKG_UTILS" AS

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


  PROCEDURE log_service (
         p_dml_by   IN VARCHAR2,
        p_dml_type   IN VARCHAR2,
        p_ins_by   IN VARCHAR2,
        p_sender   IN VARCHAR2,
        p_sender_object   IN VARCHAR2,
        p_sender_object_id   IN VARCHAR2,
        p_sender_message   IN CLOB,
        p_sender_response_code   IN VARCHAR2,
        p_sender_response_message   IN CLOB,
        p_receiver_response_id   IN VARCHAR2,
        p_receiver_response   IN CLOB,
        p_process_time in NUMBER,
        p_request_url IN VARCHAR2) as

  BEGIN

   insert into MSCS_LOG_SYNC_WEBSERVICES
   (
     DML_AT
    ,DML_BY
    ,DML_TYPE
    ,INS_AT
    ,INS_BY
    ,SENDER
    ,SENDER_OBJECT
    ,SENDER_OBJECT_ID
    ,SENDER_MESSAGE
    ,SENDER_RESPONSE_CODE
    ,SENDER_RESPONSE_MESSAGE
    ,RECEIVER_RESPONSE_ID
    ,RECEIVER_RESPONSE
    ,PROCESS_TIME
    ,REQUEST_URL
   )values
   (
     CURRENT_TIMESTAMP                     
    ,p_dml_by                     
    ,p_dml_type                   
    ,sysdate                           
    ,p_ins_by                           
    ,p_sender                     
    ,p_sender_object              
    ,p_sender_object_id           
    ,p_sender_message             
    ,p_sender_response_code       
    ,p_sender_response_message    
    ,p_receiver_response_id       
    ,p_receiver_response          
    ,p_process_time
    ,p_request_url
   );
   commit;
   exception when others then
   rollback;
     DBMS_OUTPUT.put_line(sqlerrm);
  END log_service;

    PROCEDURE display (
         p_obj IN JSON_OBJECT_T) as
  BEGIN
   DBMS_OUTPUT.put_line(p_obj.stringify);
  END display;

   PROCEDURE sp_log (
             p_request IN BLOB) as
l_obj json_object_t;
l_temp_obj1 json_object_t;

v_dml_by    VARCHAR2(200);
v_dml_type    VARCHAR2(200);
v_ins_by    VARCHAR2(200);
c_data    CLOB;
b_data blob;  
v_module    VARCHAR2(200);
v_method    VARCHAR2(200);
v_client_ip  VARCHAR2(200);
  BEGIN

l_obj := JSON_OBJECT_T(p_request);
--l_temp_obj1 := l_obj.get_object('recordInfo'); 
v_dml_by    := l_obj.get_string('dml_by');
v_dml_type  := l_obj.get_string('dml_type');
v_ins_by    := l_obj.get_string('ins_by');

v_module    := l_obj.get_string('module');
v_method    := l_obj.get_string('method');
v_client_ip := l_obj.get_string('client_ip');

b_data      := l_obj.get_blob('data');
--  c_data := FN_BLOB_TO_STRING(b_data);
   insert into MSCS_LOG_WEBSERVICES i
   (
     DML_AT
    ,DML_BY
    ,DML_TYPE
    ,INS_AT
    ,INS_BY
    ,LOG_DATA
    ,MODULE
    ,SERVICE_METHOD
    ,CLIENT_IP
   )values
   (
     CURRENT_TIMESTAMP                     
    ,v_dml_by                     
    ,v_dml_type                   
    ,sysdate                           
    ,v_ins_by                           
    ,b_data                     
    ,v_module              
    ,v_method           
    ,v_client_ip             
   )  ;
   commit;
   exception when others then
   rollback;
     DBMS_OUTPUT.put_line(sqlerrm);
  END sp_log;
  
  PROCEDURE sp_insert_log_api (
        p_dml_by IN VARCHAR2,
        p_dml_type IN VARCHAR2,
        p_ins_by IN VARCHAR2,
        p_log_data IN CLOB,
        p_module IN VARCHAR2,
        p_service_method IN VARCHAR2,
        p_client_ip IN VARCHAR2) as

  BEGIN

   insert into MSCS_LOG_WEBSERVICES
   (
     DML_AT
    ,DML_BY
    ,DML_TYPE
    ,INS_AT
    ,INS_BY
    ,LOG_DATA
    ,MODULE
    ,SERVICE_METHOD
    ,CLIENT_IP
   )values
   (
     CURRENT_TIMESTAMP                     
    ,p_dml_by                     
    ,p_dml_type                   
    ,sysdate                           
    ,p_ins_by                                              
    ,p_log_data              
    ,p_module           
    ,p_service_method             
    ,p_client_ip       
   );
   commit;
   exception when others then
   rollback;
     DBMS_OUTPUT.put_line(sqlerrm);
  END sp_insert_log_api;
END PKG_UTILS;
/
