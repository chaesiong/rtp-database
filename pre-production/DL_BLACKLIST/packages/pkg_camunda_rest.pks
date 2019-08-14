CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_CAMUNDA_REST" IS

    -- Author  : E1JKROPP
    -- Created : 25.06.2018 16:52:31
    -- Purpose : Package für BBS Biometric Blacklist System
    --           Sollte später in bestehende Packages integriert werden.

    /*
    *   Gets Camunda-Server-Url
    */
    FUNCTION get_camunda_server_url RETURN VARCHAR2;

    /*
    *   Gets Biometric Data: Fingerprints and Faces JSON
    *   for use in View V_BLACKLIST_CASES
    */
    FUNCTION get_biometric_data$json(i_blacklist_case_id VARCHAR2)
        RETURN VARCHAR2;

    /*
    *   Updates Biometric Records: Faces and Fingerprints
    *   Sends REST-Call to Camunda for updating ABIS
    *   Used in Instead OF Trigger of V_BLACKLIST_CASES
    */
    PROCEDURE update_biometrics
    (
        i_biometric_json    VARCHAR2,
        i_blacklist_case_id VARCHAR2
    );

    /*
    *   Inserts Biometric Records: Faces and Fingerprints
    *   Sends REST-Call to Camunda for inserting into ABIS
    *   Used in Instead OF Trigger of V_BLACKLIST_CASES
    */
    PROCEDURE insert_biometrics
    (
        i_biometric_json    VARCHAR2,
        i_blacklist_case_id VARCHAR2
    );

    /*
    *   Sends JSON-Request via UTL_HTTP
    *   Should be replaced by an common Procudure
    */
    PROCEDURE send_json_request
    (
        i_request     IN CLOB,
        i_method      IN VARCHAR2,
        i_url         IN VARCHAR2,
        o_http_status OUT NUMBER,
        o_response    OUT CLOB,
        o_timestamp   OUT VARCHAR2,
        o_status      OUT NUMBER,
        o_error       OUT VARCHAR2,
        o_exception   OUT VARCHAR2,
        o_message     OUT VARCHAR2,
        o_path        OUT VARCHAR2
    );

END pkg_camunda_rest;
/
