CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_ICPO_UTIL" IS

/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* MSCS      06.06.2019  Added to consume ICPO services
*******************************************************************************/
    
    -- search_icpo (SLTD: Stolen and Lost Travel Documents; TDAWN: Travel Documents Associated With Notices)
    PROCEDURE search_icpo
    (
        p_request_clob          IN  CLOB,
        p_request_type          IN  VARCHAR2 DEFAULT NULL, -- SLTD:TDAWN
        p_user                  IN  VARCHAR2 DEFAULT NULL,
        p_system                IN  VARCHAR2 DEFAULT NULL,
        p_object_id             IN  VARCHAR2 DEFAULT NULL,
        p_response_status_code  OUT INTEGER,
        p_response_status_msg   OUT VARCHAR2,
        p_response_clob         OUT CLOB
    );
    
    -- search_icpo details
    PROCEDURE search_icpo_details
    (
        p_request_type          IN  VARCHAR2, -- SLTD:TDAWN
        p_item_id               IN  VARCHAR2,
        p_request_data_obj      IN  JSON_OBJECT_T,
        p_response_data_obj     OUT JSON_OBJECT_T
    );
    --
    --
    --
    FUNCTION get_object_name RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_object_copyright RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_object_version$vc RETURN VARCHAR2 DETERMINISTIC;
    --
END PKG_ICPO_UTIL;
/
