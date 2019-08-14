CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_UTILS" AS 

  PROCEDURE post (
        p_sender_message     IN CLOB,
        p_service_address    IN VARCHAR2,
        x_response_code      OUT VARCHAR2,
        x_response_message   OUT CLOB
    );

   

   PROCEDURE display (
      p_obj IN JSON_OBJECT_T
    );
END PKG_UTILS;
/
