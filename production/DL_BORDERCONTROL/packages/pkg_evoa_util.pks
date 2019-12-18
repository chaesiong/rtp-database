CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_EVOA_UTIL" IS

/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* MSCS      24.10.2019  Added to consume EVOA services
*******************************************************************************/
    
    -- search_evoa
    PROCEDURE search_evoa
    (
        p_request_clob           IN CLOB
        ,p_user                  IN VARCHAR2 DEFAULT NULL
        ,p_system                IN VARCHAR2 DEFAULT 'BMBS'
        ,p_object                IN VARCHAR2 DEFAULT 'MOVEMENT'
        ,p_object_id             IN VARCHAR2 DEFAULT NULL
        ,p_response_status_code  OUT INTEGER
        ,p_response_status_msg   OUT VARCHAR2
        ,p_response_clob         OUT CLOB
    );
    
    -- submit_evoa
    PROCEDURE submit_evoa (p_key_value IN movements_evoa.key_value%TYPE);
    
    -- submit_mvmnt_evoa
    PROCEDURE submit_mvmnt_evoa (p_mvmntid IN movements_evoa.mvmntid%TYPE);
    
    -- enqueue_submit_evoa
    PROCEDURE enqueue_submit_evoa 
    (
        p_key_value     IN VARCHAR2
        ,p_object_type  IN VARCHAR2 DEFAULT 'movement'
    );
    
    -- dequeue_submit_evoa
    PROCEDURE dequeue_submit_evoa;
    
    --
    --
    --
    FUNCTION get_object_name RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_object_copyright RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_object_version$vc RETURN VARCHAR2 DETERMINISTIC;
    --
END PKG_EVOA_UTIL;
/
