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
    g_url_icpo_standard       CONSTANT VARCHAR2(2000 CHAR) := dl_bordercontrol.pkg_common.Get_Parameter('ICPO_STANDARD_INT');
    g_url_icpo_detail         CONSTANT VARCHAR2(2000 CHAR) := dl_bordercontrol.pkg_common.Get_Parameter('ICPO_DETAILS_INT');
    g_icpo_timeout            CONSTANT INTEGER := NVL(TO_NUMBER(dl_bordercontrol.pkg_common.Get_Parameter('ICPO_TIMEOUT_INT')), 5);
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
    g_timeout_error_code      CONSTANT INTEGER := -999; -- custome timeout code. should be -ve 
    --
    g_generic_success_msg     CONSTANT VARCHAR2(100 CHAR) := 'SUCCESS';
    g_generic_error_msg       CONSTANT VARCHAR2(100 CHAR) := 'ERROR';
    g_generic_failure_msg     CONSTANT VARCHAR2(100 CHAR) := 'FAIL';
    g_timeout_error_msg       CONSTANT VARCHAR2(100 CHAR) := 'TIMEOUT';
    --
    e_icpo_timeout            EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_icpo_timeout, -29276); -- ORA-29276: transfer timeout
    
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
        
        l_result := APEX_WEB_SERVICE.MAKE_REST_REQUEST (p_url               => p_url
                                                       ,p_http_method       => NVL(p_method, 'POST')
                                                       ,p_transfer_timeout  => g_icpo_timeout
                                                       ,p_body              => p_data);
        
        RETURN l_result;

    EXCEPTION 
        WHEN OTHERS THEN
            IF INSTR(dbms_utility.format_error_stack, 'ORA-29276') > 0 THEN
                logger.log_error(l_scope || ': TIMEOUT', l_scope, NULL, l_params);
                RAISE e_icpo_timeout;
            ELSE
                logger.log_error(l_scope || ': ERROR', l_scope, NULL, l_params);
                RAISE;
            END IF;

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
        
        l_json_obj          JSON_OBJECT_T;
        l_request_data_obj  JSON_OBJECT_T;
        l_json_arr          JSON_ARRAY_T;
        l_request_clob      CLOB;
        l_url               VARCHAR2(2000);
        l_url_type          VARCHAR2(50) := 'STANDARD';
        l_time_start        DATE;
        l_time_end          DATE;
        --
        l_service_name          VARCHAR2(4000);
        l_hits_count            NUMBER := 0;
        l_details_hits_count    NUMBER := 0;
        l_mind_item_id          VARCHAR2(4000);
        l_mind_origin_obj       VARCHAR2(4000);
        l_tdawn_item_id         VARCHAR2(4000);
        l_tdawn_origin_obj      VARCHAR2(4000);
        l_tdawn_color           VARCHAR2(4000);
        l_origin_name           VARCHAR2(4000);
        l_sltd_origin_name      VARCHAR2(4000);
        --
        e_search_icpo_details   EXCEPTION;
        
    BEGIN
    
        logger.append_param(l_params, 'dbms_lob.substr(p_request_clob, 3000, 1)', dbms_lob.substr(p_request_clob, 3000, 1)); -- dont use 4k, could be multibyte
        logger.append_param(l_params, 'p_request_type', p_request_type);
        logger.append_param(l_params, 'p_system', p_system);
        logger.append_param(l_params, 'p_user', p_user);
        logger.append_param(l_params, 'p_object_id', p_object_id);
        logger.log('SEARCH ICPO: START', l_scope, null, l_params);
        
        --l_json_obj := JSON_OBJECT_T();
        l_json_obj  :=  JSON_OBJECT_T.parse
                        (
                            '{

                                "MindAccessInfo": {
                                    "AdministrativeToken": {
                                        "enquiriesReferenceField": "THA"
                                    },
                                    "UserInformation": {
                                        "Username": "cdg",
                                        "ReferenceInCountry": "THA"
                                    },
                                    "UsernameToken": {
                                        "Username": "pibics",
                                        "Password": "vbog9vFr]",
                                        "Version": ""
                                    }
                                },
                                "FindAccessInfo": {
                                    "AdministrativeToken": {
                                        "enquiriesReferenceField": "THA"
                                    },
                                    "UserInformation": {
                                        "Username": "cdg",
                                        "ReferenceInCountry": "THA"
                                    },
                                    "UsernameToken": {
                                        "Username": "ncb.bangkokibcfindtdawnsltdprod.th",
                                        "Password": "pmdfre25gfr",
                                        "Version": ""
                                    }
                                },
                                "TimeOut": 5000,
                                "IsSwitching": 0,
                                "FirstService": 2
                            }'
                        );
        
        --l_json_obj.put('Username', g_icpo_user);
        --l_json_obj.put('Password', g_icpo_pwd);
        l_request_data_obj := JSON_OBJECT_T(p_request_clob).get_object('RequestData');
        l_json_obj.put('RequestData', l_request_data_obj);
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
            MAX(jt.service_name)
            , SUM(COUNT(1)) OVER(PARTITION BY NULL) 
            , CASE MAX(jt.service_name)
                WHEN 'MIND' THEN MAX(DECODE(jt.mind_name, 'MIND', jt.mind_item_id, NULL))
                WHEN 'FIND' THEN MAX(DECODE(jt.find_name, 'IPSG', jt.find_item_id, NULL))
                ELSE NULL
            END MIND_ITEM_ID
            , CASE MAX(jt.service_name)
                WHEN 'MIND' THEN MAX(DECODE(jt.mind_name, 'MIND', jt.mind_origin_obj, NULL))
                WHEN 'FIND' THEN MAX(DECODE(jt.find_name, 'IPSG', jt.find_origin_obj, NULL))
                ELSE NULL
            END MIND_ORIGIN_OBJ
            , CASE MAX(jt.service_name)
                WHEN 'MIND' THEN MAX(DECODE(jt.mind_name, 'MIND.TDAWN', jt.mind_item_id, NULL))
                WHEN 'FIND' THEN MAX(DECODE(jt.find_name, 'IPSG.NOMTD', jt.find_item_id, NULL))
                ELSE NULL
            END TDAWN_ITEM_ID
            , CASE MAX(jt.service_name)
                WHEN 'MIND' THEN MAX(DECODE(jt.mind_name, 'MIND.TDAWN', jt.mind_origin_obj, NULL))
                WHEN 'FIND' THEN MAX(DECODE(jt.find_name, 'IPSG.NOMTD', jt.find_origin_obj, NULL))
                ELSE NULL
            END TDAWN_ORIGIN_OBJ
            , CASE MAX(jt.service_name)
                WHEN 'MIND' THEN MAX(DECODE(jt.mind_name, 'MIND.TDAWN', jt.mind_color, NULL))
                WHEN 'FIND' THEN MAX(DECODE(jt.find_name, 'IPSG.NOMTD', jt.find_color, NULL))
                ELSE NULL
            END TDAWN_COLOR
        INTO 
            l_service_name
            , l_hits_count
            , l_mind_item_id
            , l_mind_origin_obj
            , l_tdawn_item_id
            , l_tdawn_origin_obj
            , l_tdawn_color
        FROM JSON_TABLE
        (
            p_response_clob, '$'
            COLUMNS
            (
                ISSUCCESS    VARCHAR2(4000) PATH '$.IsSuccess',
                SERVICE_NAME VARCHAR2(4000) PATH '$.ServiceName',
                -- MIND columns
                NESTED PATH '$.ResponseData.MindData.xmlDataField."urn1:IPSGDatas"."urn1:datas"."urn1:search"."urn1:origin"[*]'
                COLUMNS 
                (
                    MIND_RN FOR ORDINALITY,
                    MIND_ORIGIN_OBJ  VARCHAR2(4000) FORMAT JSON PATH '$',
                    MIND_STATUS_ID   VARCHAR2(4000) PATH '$."urn1:status_id"',
                    MIND_NAME        VARCHAR2(4000) PATH '$."urn1:name"',
                    NESTED PATH '$."urn1:document"'
                    COLUMNS
                    (
                        MIND_ITEM_ID                 VARCHAR2(4000) PATH '$."@item_id"',
                        MIND_NR                      VARCHAR2(4000) PATH '$."urn1:nr"',
                        MIND_TYPE_ID                 VARCHAR2(4000) PATH '$."urn1:type_id"',
                        MIND_COUNTRY_OF_ISSUANCE_ID  VARCHAR2(4000) PATH '$."urn1:country_of_issuance_id"',
                        MIND_COLOR                   VARCHAR2(4000) PATH '$."urn1:color"'
                    )
                ),
                -- FIND columns
                NESTED PATH '$.ResponseData.FindData.xmlDataField."i:IPSGDatas"."i:datas"."i:search"."i:origin"[*]'
                COLUMNS 
                (
                    FIND_RN FOR ORDINALITY,
                    FIND_ORIGIN_OBJ  VARCHAR2(4000) FORMAT JSON PATH '$',
                    FIND_STATUS_ID   VARCHAR2(4000) PATH '$."i:status_id"',
                    FIND_NAME        VARCHAR2(4000) PATH '$."i:name"',
                    NESTED PATH '$."i:document"'
                    COLUMNS
                    (
                        FIND_ITEM_ID                 VARCHAR2(4000) PATH '$."@item_id"',
                        FIND_NR                      VARCHAR2(4000) PATH '$."i:nr"',
                        FIND_TYPE_ID                 VARCHAR2(4000) PATH '$."i:type_id"',
                        FIND_COUNTRY_OF_ISSUANCE_ID  VARCHAR2(4000) PATH '$."i:country_of_issuance_id"',
                        FIND_COLOR                   VARCHAR2(4000) PATH '$."i:color"'
                    )
                )
            )
        )
        AS jt
        WHERE jt.issuccess = 'true'
        AND (jt.mind_status_id = 'NO_ERROR' OR jt.find_status_id = 'NO_ERROR')
        AND 
        (
            -- MIND condition
            (
                jt.service_name = 'MIND'
                AND
                jt.mind_name = NVL(DECODE(p_request_type, 'SLTD', 'MIND', 'TDAWN', 'MIND.TDAWN', NULL), jt.mind_name)
            )
            OR
            -- FIND condition
            (
                jt.service_name = 'FIND'
                AND
                jt.find_name = NVL(DECODE(p_request_type, 'SLTD', 'IPSG', 'TDAWN', 'IPSG.NOMTD', NULL), jt.find_name)
            )
        )
        ;
        
        logger.append_param(l_params, 'l_service_name', l_service_name);
        logger.append_param(l_params, 'l_hits_count', l_hits_count);
        logger.append_param(l_params, 'l_mind_item_id', l_mind_item_id);
        logger.append_param(l_params, 'l_mind_origin_obj', l_mind_origin_obj);
        logger.append_param(l_params, 'l_tdawn_item_id', l_tdawn_item_id);
        logger.append_param(l_params, 'l_tdawn_origin_obj', l_tdawn_origin_obj);
        logger.append_param(l_params, 'l_tdawn_color', l_tdawn_color);
        
        -- init out array
        l_json_arr := JSON_ARRAY_T();
        
        IF l_hits_count > 0 THEN
            IF g_icpo_details_validation THEN                
                IF NVL(p_request_type, 'SLTD') = 'SLTD' AND l_mind_item_id IS NOT NULL THEN
                    l_details_hits_count := search_icpo_details
                                            (
                                                p_request_type          => 'SLTD'
                                                , p_item_id             => l_mind_item_id
                                                , p_request_data_obj    => l_request_data_obj
                                            );
                
                    IF l_details_hits_count > 0 THEN
                        l_json_arr.append(JSON_OBJECT_T(l_mind_origin_obj));
                    ELSE
                        IF l_tdawn_item_id IS NOT NULL THEN 
                            -- if SLTD details is 0/-ve and TDAWN is not null overwrite count to standard count (-1) to show TDAWN
                            l_details_hits_count := l_hits_count - 1;
                        ELSIF l_details_hits_count < 0 THEN
                            IF l_details_hits_count = g_timeout_error_code THEN
                                RAISE e_icpo_timeout;
                            ELSE
                                RAISE e_search_icpo_details;
                            END IF;
                        END IF;
                    END IF;
                END IF;
            ELSE
                l_details_hits_count := l_hits_count;
                -- add MIND if exists
                IF l_mind_item_id IS NOT NULL THEN
                    l_json_arr.append(JSON_OBJECT_T(l_mind_origin_obj));
                END IF;
            END IF;
            
            -- add TDAWN if exists
            IF l_tdawn_item_id IS NOT NULL THEN
                l_json_arr.append(JSON_OBJECT_T(l_tdawn_origin_obj));
            END IF;
        END IF;
        
        -- set out params
        p_response_clob         := l_json_arr.to_clob();
        p_response_status_code  := l_details_hits_count;
        p_response_status_msg   := g_generic_success_msg;
        
        logger.append_param(l_params, 'dbms_lob.substr(p_response_clob, 3000, 1)', dbms_lob.substr(p_response_clob, 3000, 1)); -- dont use 4k, could be multibyte
        logger.append_param(l_params, 'l_hits_count', l_hits_count);
        logger.append_param(l_params, 'l_details_hits_count', l_details_hits_count);
        logger.log('SEARCH ICPO: DONE', l_scope, NULL, l_params);

    
    EXCEPTION 
        WHEN e_icpo_timeout THEN
            logger.log_error('SEARCH ICPO: TIMEOUT', l_scope, NULL, l_params);
            -- set out params
            p_response_clob         := '[]';
            p_response_status_code  := g_timeout_error_code;
            p_response_status_msg   := g_timeout_error_msg;
        WHEN e_search_icpo_details THEN
            logger.log_error('SEARCH ICPO DETAILS: ERROR', l_scope, NULL, l_params);
            -- set out params
            p_response_clob         := '[]';
            p_response_status_code  := -20;
            p_response_status_msg   := g_generic_error_msg;
        WHEN OTHERS THEN
            logger.log_error('SEARCH ICPO: ERROR', l_scope, NULL, l_params);
            -- set out params
            p_response_clob         := '[]';
            p_response_status_code  := -10;
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
        p_item_id               IN VARCHAR2,
        p_request_data_obj      IN JSON_OBJECT_T DEFAULT NULL
    ) RETURN NUMBER 
    AS
    
        -- Logger
        l_scope     logger_logs.scope%TYPE := g_log_scope_prefix || 'search_icpo_details';
        l_params    logger.tab_param;
        
        l_json_obj          JSON_OBJECT_T;
        l_request_data_obj  JSON_OBJECT_T := p_request_data_obj;
        l_request_clob      CLOB;
        l_response_clob     CLOB;
        l_url               VARCHAR2(2000);
        l_url_type          VARCHAR2(50) := 'DETAIL';
        l_time_start        DATE;
        l_time_end          DATE;
        l_service_name      VARCHAR2(4000);
        l_hits_count        NUMBER := 0;
    
    BEGIN
    
        logger.append_param(l_params, 'p_request_type', p_request_type);
        logger.append_param(l_params, 'p_item_id', p_item_id);
        logger.log('SEARCH ICPO DETAILS: START', l_scope, null, l_params);
        
        --l_json_obj := JSON_OBJECT_T();
        l_json_obj :=   JSON_OBJECT_T
                        (
                            '{
                                "MindAccessInfo": {
                                    "AdministrativeToken": {
                                        "enquiriesReferenceField": "THA"
                                    },
                                    "UserInformation": {
                                        "Username": "cdg",
                                        "ReferenceInCountry": "THA"
                                    },
                                    "UsernameToken": {
                                        "Username": "pibics",
                                        "Password": "vbog9vFr]",
                                        "Version": ""
                                    }
                                },
                                "FindAccessInfo": {
                                    "AdministrativeToken": {
                                        "enquiriesReferenceField": "THA"
                                    },
                                    "UserInformation": {
                                        "Username": "cdg",
                                        "ReferenceInCountry": "THA"
                                    },
                                    "UsernameToken": {
                                        "Username": "ncb.bangkokibcfindtdawnsltdprod.th",
                                        "Password": "pmdfre25gfr",
                                        "Version": ""
                                    }
                                },
                                "TimeOut": 5000,
                                "IsSwitching": 0,
                                "FirstService": 2
                            }'
                        );
                        
        --l_json_obj.put('Username', g_icpo_user);
        --l_json_obj.put('Password', g_icpo_pwd);
        l_request_data_obj.put('ItemId', p_item_id);
        l_json_obj.put('RequestData', l_request_data_obj);
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
        
        -- for FIND details: origin is an object
        -- for MIND details: origin is an array
        SELECT 
            MAX(jt.service_name)
            , COUNT(1)
        INTO 
            l_service_name
            , l_hits_count
        FROM JSON_TABLE
        (
            l_response_clob, '$'
            COLUMNS
            (
                ISSUCCESS    VARCHAR2(4000) PATH '$.IsSuccess',
                SERVICE_NAME VARCHAR2(4000) PATH '$.ServiceName',
                -- MIND columns
                NESTED PATH '$.ResponseData.MindData.xmlDataField."urn1:IPSGDatas"."urn1:datas"."urn1:origin"[*]'
                COLUMNS 
                (
                    MIND_RN FOR ORDINALITY,
                    MIND_STATUS_ID  VARCHAR2(4000) PATH '$."urn1:status_id"',
                    MIND_NAME       VARCHAR2(4000) PATH '$."urn1:name"',
                    NESTED PATH '$."urn1:document"'
                    COLUMNS
                    (
                        --MIND_HAS_INVESTIGATION             NUMBER EXISTS PATH '$."urn1:theft".*'
                        MIND_THEFT_OBJ                     VARCHAR2(4000) FORMAT JSON PATH '$."urn1:theft"'
                    )
                ),
                -- FIND columns
                NESTED PATH '$.ResponseData.FindData.xmlDataField."i:IPSGDatas"."i:datas"."i:origin"[*]'
                COLUMNS 
                (
                    FIND_RN FOR ORDINALITY,
                    FIND_NAME        VARCHAR2(4000) PATH '$."i:name"',
                    NESTED PATH '$."i:document"'
                    COLUMNS
                    (
                        --FIND_HAS_INVESTIGATION             NUMBER EXISTS PATH '$."i:theft".*'
                        FIND_THEFT_OBJ                     VARCHAR2(4000) FORMAT JSON PATH '$."i:theft"'
                    )
                )
            )
        )
        AS jt
        WHERE jt.issuccess = 'true'
        AND (jt.mind_status_id = 'NO_ERROR' OR jt.service_name = 'FIND')
        AND 
        (
            -- MIND
            (
                jt.service_name = 'MIND'
                AND
                jt.mind_name = NVL(DECODE(p_request_type, 'SLTD', 'MIND', 'TDAWN', 'MIND.TDAWN', NULL), jt.mind_name)
                AND
                --jt.mind_has_investigation = 1
                jt.mind_theft_obj IS NOT NULL
            )
            OR
            -- FIND
            (
                jt.service_name = 'FIND'
                AND
                jt.find_name = NVL(DECODE(p_request_type, 'SLTD', 'IPSG', 'TDAWN', 'IPSG.NOMTD', NULL), jt.find_name)
                AND
                --jt.find_has_investigation = 1
                jt.find_theft_obj IS NOT NULL
            )
        )
        ;
        
        logger.append_param(l_params, 'l_service_name', l_service_name);
        logger.append_param(l_params, 'l_hits_count', l_hits_count);
        logger.log('SEARCH ICPO DETAILS: DONE', l_scope, null, l_params);
        
        RETURN l_hits_count;
    
    EXCEPTION 
        WHEN e_icpo_timeout THEN
            logger.log_error('SEARCH ICPO DETAILS: TIMEOUT', l_scope, NULL, l_params);
            -- set out params
            RETURN g_timeout_error_code;
        WHEN OTHERS THEN
            logger.log_error('SEARCH ICPO DETAILS: ERROR', l_scope, NULL, l_params);
            -- set out params
            RETURN -20;
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
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_ICPO_UTIL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_ICPO_UTIL" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_ICPO_UTIL" TO "BIOSAADM";
