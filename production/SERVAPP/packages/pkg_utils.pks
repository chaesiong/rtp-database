CREATE OR REPLACE EDITIONABLE PACKAGE "SERVAPP"."PKG_UTILS" AS
    PROCEDURE post (
        p_sender_message     IN CLOB,
        p_service_address    IN VARCHAR2,
        x_response_code      OUT VARCHAR2,
        x_response_message   OUT CLOB
    );

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
        p_request_url IN VARCHAR2
    );

   PROCEDURE display (
      p_obj IN JSON_OBJECT_T
    );

     PROCEDURE sp_log (
       p_request   IN blob
    );
    
     PROCEDURE sp_insert_log_api (
        p_dml_by IN VARCHAR2,
        p_dml_type IN VARCHAR2,
        p_ins_by IN VARCHAR2,
        p_log_data IN CLOB,
        p_module IN VARCHAR2,
        p_service_method IN VARCHAR2,
        p_client_ip IN VARCHAR2
    );
END pkg_utils;
/
