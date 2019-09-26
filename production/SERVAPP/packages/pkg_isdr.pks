CREATE OR REPLACE EDITIONABLE PACKAGE "SERVAPP"."PKG_ISDR" AS 

 PROCEDURE CHECK_OVER_STAY (
        p_data     IN BLOB,
        p_error_code OUT VARCHAR2,
        p_error_desc OUT CLOB,
        p_message   OUT CLOB
    );

 PROCEDURE CHECK_ADDRESS (
        p_data     IN BLOB,
        p_error_code OUT VARCHAR2,
        p_error_desc OUT CLOB,
        p_message   OUT CLOB
    );

END PKG_ISDR;
/
