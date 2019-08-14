CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_ICPO_UTIL" IS
  
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* MSCS      06.06.2019  Added to consume ICPO services
*******************************************************************************/
    
    ---------------------
    -- version --
    ---------------------
    c_object_version   CONSTANT VARCHAR2(19) := '1.0.0000';
    c_object_copyright CONSTANT VARCHAR2(255 CHAR) := 'Copyright: MSC Sittipol Co. Ltd., 2013-' || TO_CHAR(SYSDATE, 'YYYY');
    
    ---------------------
    -- scope --
    ---------------------
    g_log_scope_prefix CONSTANT VARCHAR2(62 CHAR) := LOWER($$plsql_unit_owner) || '.' || LOWER($$plsql_unit) || '.';
    
    ---------------------
    -- global vars --
    ---------------------
    -- old urls
    --g_url_icpo_standard       CONSTANT VARCHAR2(2000 CHAR) := 'http://172.22.6.66:7097/api/interpol/search';
    --g_url_icpo_detail         CONSTANT VARCHAR2(2000 CHAR) := 'http://172.22.6.66:7097/api/interpol/detail';
    --new urls
    g_url_icpo_standard       CONSTANT VARCHAR2(2000 CHAR) := 'http://172.22.6.66:8011/api/TDAWNSLTD/Search';
    g_url_icpo_detail         CONSTANT VARCHAR2(2000 CHAR) := 'http://172.22.6.66:8011/api/TDAWNSLTD/Details';
    --
    g_icpo_user               CONSTANT VARCHAR2(50 CHAR) := 'pibics';
    g_icpo_pwd                CONSTANT VARCHAR2(50 CHAR) := 'vbog9vFr]';
    g_icpo_details_validation CONSTANT BOOLEAN := TRUE;
    --
    g_success_ok_code         CONSTANT INTEGER := 200;
    g_success_created_code    CONSTANT INTEGER := 201;
    g_bad_request_code        CONSTANT INTEGER := 400;
    g_not_found_code          CONSTANT INTEGER := 404; -- also used as generic fail when no error
    g_method_not_allowed_code CONSTANT INTEGER := 405;
    --
    g_generic_success_msg     CONSTANT VARCHAR2(100 CHAR) := 'SUCCESS';
    g_generic_error_msg       CONSTANT VARCHAR2(100 CHAR) := 'ERROR';
    g_generic_failure_msg     CONSTANT VARCHAR2(100 CHAR) := 'FAIL';
    
    ---------------------
    -- Internals START --
    ---------------------
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      06.06.2019  Added
    *******************************************************************************/
    FUNCTION call_rest
    (  
        p_url       IN VARCHAR2,
        p_method    IN VARCHAR2 DEFAULT 'POST',
        p_data      IN OUT NOCOPY CLOB
    ) RETURN CLOB AS

        l_result    CLOB;
        
        -- Logger
        l_scope     logger_logs.scope%TYPE := g_log_scope_prefix || 'call_rest';
        l_params    logger.tab_param;

    BEGIN

        apex_web_service.g_request_headers(1).name := 'Content-Type';
        apex_web_service.g_request_headers(1).value := 'application/json; charset=utf-8';
        
        l_result := APEX_WEB_SERVICE.MAKE_REST_REQUEST (p_url         => p_url
                                                       ,p_http_method => NVL(p_method, 'POST')
                                                       ,p_body        => p_data);
        
        RETURN l_result;

    EXCEPTION 
        WHEN OTHERS THEN
            logger.log_error(l_scope || ': ERROR', l_scope, NULL, l_params);
            RAISE;

    END call_rest;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      06.06.2019  Added
    *******************************************************************************/
    FUNCTION get_icpo_url (p_type IN VARCHAR2 DEFAULT 'STANDARD') RETURN VARCHAR2 AS

        l_url       VARCHAR2(2000);

    BEGIN
    
        IF p_type = 'STANDARD' THEN
            l_url := g_url_icpo_standard;
        ELSIF p_type = 'DETAIL' THEN
            l_url := g_url_icpo_detail;
        END IF;

        RETURN l_url;

    EXCEPTION 
        WHEN OTHERS THEN
            RETURN NULL;
        
    END get_icpo_url;
    
    ---------------------
    -- Internals END --
    ---------------------
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      06.06.2019  Added search_icpo 
    *                       1. SLTD: Stolen and Lost Travel Documents
    *                       2. TDAWN: Travel Documents Associated With Notices
    *******************************************************************************/
    PROCEDURE search_icpo
    (
        p_request_clob          IN CLOB,
        p_request_type          IN VARCHAR2 DEFAULT NULL, -- SLTD:TDAWN
        p_user                  IN VARCHAR2 DEFAULT NULL,
        p_system                IN VARCHAR2 DEFAULT NULL,
        p_object_id             IN VARCHAR2 DEFAULT NULL,
        p_response_status_code  OUT INTEGER,
        p_response_status_msg   OUT VARCHAR2,
        p_response_clob         OUT CLOB
    ) AS
    
        -- Logger
        l_scope     logger_logs.scope%TYPE := g_log_scope_prefix || 'search_icpo';
        l_params    logger.tab_param;
        
        l_json_obj      JSON_OBJECT_T;
        l_json_arr      JSON_ARRAY_T;
        l_request_clob  CLOB;
        l_url           VARCHAR2(2000);
        l_url_type      VARCHAR2(50) := 'STANDARD';
        l_time_start    DATE;
        l_time_end      DATE;
        l_hits_count            NUMBER := 0;
        l_details_hits_count    NUMBER := 0;
        l_mind_item_id          VARCHAR2(4000);
        l_tdawn_item_id         VARCHAR2(4000);
        
    
    BEGIN
    
        logger.append_param(l_params, 'dbms_lob.substr(p_request_clob, 3000, 1)', dbms_lob.substr(p_request_clob, 3000, 1)); -- dont use 4k, could be multibyte
        logger.append_param(l_params, 'p_request_type', p_request_type);
        logger.append_param(l_params, 'p_system', p_system);
        logger.append_param(l_params, 'p_user', p_user);
        logger.append_param(l_params, 'p_object_id', p_object_id);
        logger.log('SEARCH ICPO: START', l_scope, null, l_params);
        
        l_json_obj := JSON_OBJECT_T();
        l_json_obj.put('Username', g_icpo_user);
        l_json_obj.put('Password', g_icpo_pwd);
        l_json_obj.put('RequestData', JSON_OBJECT_T(p_request_clob).get_object('RequestData'));
        l_request_clob := l_json_obj.to_clob();
        
        logger.append_param(l_params, 'Updated p_request_clob', dbms_lob.substr(l_request_clob, 3000, 1)); -- dont use 4k, could be multibyte
    
        l_url := get_icpo_url(l_url_type);
        
        l_time_start := SYSDATE;
        
        p_response_clob := call_rest
                            (  
                                p_url       => l_url,
                                p_method    => 'POST',
                                p_data      => l_request_clob
                            );
    
        l_time_end := SYSDATE;
        
        logger.append_param(l_params, 'dbms_lob.substr(p_response_clob, 3000, 1)', dbms_lob.substr(p_response_clob, 3000, 1)); -- dont use 4k, could be multibyte
        logger.append_param(l_params, 'elapsed_time_seconds', (l_time_end - l_time_start) * 24 * 60 * 60);
        
        /*
        resultCodeField:
        0 : NO_ERROR    : No error, the function has been executed and entries have been found.
        1 : NO_ANSWER   : No error, the function has been executed but no entries meeting the criteria have been found.
        
        status_id:
        NO_ERROR  : No error, the function has been executed and entries have been found.
        NO_ANSWER : No error, the function has been executed but no entries meeting the criteria have been found.
        
        name:
        MIND        : SLTD
        MIND.TDAWN  : TDAWN
        
        -- new url attr
        IsSuccess
        true  : equivalent to resultCodeField 0
        false : equivalent to resultCodeField 1
        */
        
        SELECT 
            SUM(COUNT(1)) OVER(PARTITION BY NULL) 
            , MAX(DECODE(jt.name, 'MIND', jt.item_id, NULL)) MIND_ITEM_ID
            , MAX(DECODE(jt.name, 'MIND.TDAWN', jt.item_id, NULL)) TDAWN_ITEM_ID
        INTO 
            l_hits_count
            , l_mind_item_id
            , l_tdawn_item_id
        FROM JSON_TABLE
        (
            p_response_clob, '$'
            COLUMNS
            (
                ISSUCCESS VARCHAR2(4000) PATH '$.IsSuccess',
                NESTED PATH '$.ResponseData.MindData.xmlDataField."urn1:IPSGDatas"."urn1:datas"."urn1:search"."urn1:origin"[*]'
                COLUMNS 
                (
                    RN FOR ORDINALITY,
                    STATUS_ID   VARCHAR2(4000) PATH '$."urn1:status_id"',
                    NAME        VARCHAR2(4000) PATH '$."urn1:name"',
                    NESTED PATH '$."urn1:document"'
                    COLUMNS
                    (
                        ITEM_ID                 VARCHAR2(4000) PATH '$."@item_id"',
                        NR                      VARCHAR2(4000) PATH '$."urn1:nr"',
                        TYPE_ID                 VARCHAR2(4000) PATH '$."urn1:type_id"',
                        COUNTRY_OF_ISSUANCE_ID  VARCHAR2(4000) PATH '$."urn1:country_of_issuance_id"',
                        COLOR                   VARCHAR2(4000) PATH '$."urn1:color"'
                    )
                )
            )
        )
        AS jt
        WHERE jt.issuccess = 'true'
        AND jt.status_id = 'NO_ERROR'
        AND jt.name = NVL(DECODE(p_request_type, 'SLTD', 'MIND', 'TDAWN', 'MIND.TDAWN', NULL), jt.name);
        
        -- set response
        l_json_obj := JSON_OBJECT_T(p_response_clob);
        l_json_arr := JSON_ARRAY_T(l_json_obj.get_object('ResponseData').get_object('MindData').get_object('xmlDataField').get_object('urn1:IPSGDatas').get_object('urn1:datas').get_object('urn1:search').get_array('urn1:origin'));
        p_response_clob := l_json_arr.to_clob();
        
        logger.append_param(l_params, 'dbms_lob.substr(p_response_clob, 3000, 1)', dbms_lob.substr(p_response_clob, 3000, 1)); -- dont use 4k, could be multibyte
        
        IF l_hits_count > 0 THEN
            IF g_icpo_details_validation THEN
                l_url := get_icpo_url('DETAIL');
                
                IF NVL(p_request_type, 'SLTD') = 'SLTD' AND l_mind_item_id IS NOT NULL THEN
                    l_details_hits_count := search_icpo_details
                                            (
                                                p_request_type => 'SLTD'
                                                , p_item_id    => l_mind_item_id
                                            );
                END IF;
                
                IF l_details_hits_count <= 0 AND NVL(p_request_type, 'TDAWN') = 'TDAWN' AND l_tdawn_item_id IS NOT NULL THEN
                    l_details_hits_count := search_icpo_details
                                            (
                                                p_request_type => 'TDAWN'
                                                , p_item_id    => l_mind_item_id
                                            );
                END IF;
            ELSE
                l_details_hits_count := l_hits_count;
            END IF;
        END IF;
        
        
        
        -- set out params
        p_response_status_code  := l_details_hits_count;
        p_response_status_msg   := g_generic_success_msg;
        
        logger.append_param(l_params, 'l_hits_count', l_hits_count);
        logger.append_param(l_params, 'l_details_hits_count', l_details_hits_count);
        logger.log('SEARCH ICPO: DONE', l_scope, NULL, l_params);

    
    EXCEPTION 
        WHEN OTHERS THEN
            logger.log_error('SEARCH ICPO: ERROR', l_scope, NULL, l_params);
            -- set out params
            p_response_status_code  := -1;
            p_response_status_msg   := g_generic_error_msg;
            --RAISE;
    
    END search_icpo;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      15.07.2019  Added search_icpo_details 
    *******************************************************************************/
    FUNCTION search_icpo_details
    (
        p_request_type          IN VARCHAR2, -- SLTD:TDAWN
        p_item_id               IN VARCHAR2
    ) RETURN NUMBER 
    AS
    
        -- Logger
        l_scope     logger_logs.scope%TYPE := g_log_scope_prefix || 'search_icpo_details';
        l_params    logger.tab_param;
        
        l_json_obj      JSON_OBJECT_T;
        l_request_clob  CLOB;
        l_response_clob CLOB;
        l_url           VARCHAR2(2000);
        l_url_type      VARCHAR2(50) := 'DETAIL';
        l_time_start    DATE;
        l_time_end      DATE;
        l_hits_count    NUMBER := 0;
    
    BEGIN
    
        logger.append_param(l_params, 'p_request_type', p_request_type);
        logger.append_param(l_params, 'p_item_id', p_item_id);
        logger.log('SEARCH ICPO DETAILS: START', l_scope, null, l_params);
        
        l_json_obj := JSON_OBJECT_T();
        l_json_obj.put('Username', g_icpo_user);
        l_json_obj.put('Password', g_icpo_pwd);
        l_json_obj.put('RequestData', JSON_OBJECT_T('{"ItemId":"' || p_item_id || '"}'));
        l_request_clob := l_json_obj.to_clob();
        
        logger.append_param(l_params, 'l_request_clob', dbms_lob.substr(l_request_clob, 3000, 1));
        
        l_url := get_icpo_url(l_url_type);
        
        l_time_start := SYSDATE;
        
        l_response_clob := call_rest
                            (  
                                p_url       => l_url,
                                p_method    => 'POST',
                                p_data      => l_request_clob
                            );
        
        l_time_end := SYSDATE;
        
        logger.append_param(l_params, 'dbms_lob.substr(l_response_clob, 3000, 1)', dbms_lob.substr(l_response_clob, 3000, 1));
        logger.append_param(l_params, 'elapsed_time_seconds', (l_time_end - l_time_start) * 24 * 60 * 60);
        
        /*
        "urn1:investigation":
        null  : DO NOT DISPLAY
        !null : DISPLAY
        */
        
        SELECT COUNT(1)
        INTO l_hits_count
        FROM JSON_TABLE
        (
            l_response_clob, '$'
            COLUMNS
            (
                ISSUCCESS VARCHAR2(4000) PATH '$.IsSuccess',
                NESTED PATH '$.ResponseData.MindData.xmlDataField."urn1:IPSGDatas"."urn1:datas"."urn1:origin"[*]'
                COLUMNS 
                (
                    RN FOR ORDINALITY,
                    STATUS_ID   VARCHAR2(4000) PATH '$."urn1:status_id"',
                    NAME        VARCHAR2(4000) PATH '$."urn1:name"',
                    NESTED PATH '$."urn1:document"'
                    COLUMNS
                    (
                        HAS_INVESTIGATION             NUMBER EXISTS PATH '$."urn1:investigation".*'
                    )
                )
            )
        )
        AS jt
        WHERE jt.issuccess = 'true'
        AND jt.status_id = 'NO_ERROR'
        AND jt.name = NVL(DECODE(p_request_type, 'SLTD', 'MIND', 'TDAWN', 'MIND.TDAWN', NULL), jt.name)
        AND jt.has_investigation = 1;
        
        logger.append_param(l_params, 'l_hits_count', l_hits_count);
        logger.log('SEARCH ICPO DETAILS: DONE', l_scope, null, l_params);
        
        RETURN l_hits_count;
    
    EXCEPTION 
        WHEN OTHERS THEN
            logger.log_error('SEARCH ICPO DETAILS: ERROR', l_scope, NULL, l_params);
            -- set out params
            RETURN -1;
            --RAISE;
    
    END search_icpo_details;
    --
    --
    -- *** Standard functions ***************************************************************************
    --
    FUNCTION Get_OBJECT_NAME RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN $$plsql_unit_owner || '.' || $$plsql_unit;
    END;
    --
    FUNCTION Get_OBJECT_COPYRIGHT RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN c_object_copyright;
    END;
    --
    FUNCTION Get_OBJECT_VERSION$VC RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN c_object_version;
    END;
    --
    
end PKG_ICPO_UTIL;
/
