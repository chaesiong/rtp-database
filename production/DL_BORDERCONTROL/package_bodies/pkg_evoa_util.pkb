CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_EVOA_UTIL" IS
  
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* MSCS      24.10.2019  Added to consume EVOA services
*******************************************************************************/
    
    ---------------------
    -- version --
    ---------------------
    c_object_version            CONSTANT VARCHAR2(19) := '1.0.0000';
    c_object_copyright          CONSTANT VARCHAR2(255 CHAR) := 'Copyright: MSC Sittipol Co. Ltd., 2013-' || TO_CHAR(SYSDATE, 'YYYY');
    
    ---------------------
    -- queue --
    ---------------------
    c_hook_queue_name           CONSTANT VARCHAR2(100 CHAR) := 'DL_BORDERCONTROL.AQ_EVOA_HOOKS_QUEUE';
    c_consumer_name             CONSTANT VARCHAR2(100 CHAR) := 'SUBMIT_EVOA';
    
    ---------------------
    -- scope --
    ---------------------
    g_log_scope_prefix          CONSTANT VARCHAR2(62 CHAR) := LOWER($$plsql_unit_owner) || '.' || LOWER($$plsql_unit) || '.';
    
    ---------------------
    -- global vars --
    ---------------------
    -- internal urls
    g_url_evoa_search           CONSTANT VARCHAR2(2000 CHAR) := dl_bordercontrol.pkg_common.Get_Parameter('EVOA_SEARCH_INT');
    g_url_evoa_submit           CONSTANT VARCHAR2(2000 CHAR) := dl_bordercontrol.pkg_common.Get_Parameter('EVOA_SUBMIT_INT');
    --
    g_param_evoa_hash           CONSTANT VARCHAR2(2000 CHAR) := dl_bordercontrol.pkg_common.Get_Parameter('EVOA_HASH_INT');
    g_evoa_timeout              CONSTANT INTEGER := NVL(TO_NUMBER(dl_bordercontrol.pkg_common.Get_Parameter('EVOA_TIMEOUT_INT')), 60);
    --
    g_success_ok_code           CONSTANT INTEGER := 200;
    g_success_created_code      CONSTANT INTEGER := 201;
    g_bad_request_code          CONSTANT INTEGER := 400;
    g_not_found_code            CONSTANT INTEGER := 404; -- also used as generic fail when no error
    g_method_not_allowed_code   CONSTANT INTEGER := 405;
    g_timeout_error_code        CONSTANT INTEGER := -999; -- custom timeout code. should be -ve 
    --
    g_generic_success_msg       CONSTANT VARCHAR2(100 CHAR) := 'SUCCESS';
    g_generic_error_msg         CONSTANT VARCHAR2(100 CHAR) := 'ERROR';
    g_generic_failure_msg       CONSTANT VARCHAR2(100 CHAR) := 'FAIL';
    g_timeout_error_msg         CONSTANT VARCHAR2(100 CHAR) := 'TIMEOUT';
    --
    e_evoa_timeout              EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_evoa_timeout, -29276); -- ORA-29276: transfer timeout
    
    ---------------------
    -- Internals START --
    ---------------------
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      24.10.2019  Added
    *******************************************************************************/
    PROCEDURE call_rest
    (  
        p_url           IN  VARCHAR2,
        p_method        IN  VARCHAR2 DEFAULT 'POST',
        p_request       IN  CLOB,
        p_response_code OUT VARCHAR2,
        p_response      OUT CLOB
    ) AS

        l_result    CLOB;
        
        -- Logger
        l_scope     logger_logs.scope%TYPE := g_log_scope_prefix || 'call_rest';
        l_params    logger.tab_param;

    BEGIN

        apex_web_service.g_request_headers(1).name := 'Content-Type';
        apex_web_service.g_request_headers(1).value := 'application/json; charset=utf-8';
        
        apex_web_service.g_request_headers(2).name := 'HASH';
        apex_web_service.g_request_headers(2).value := g_param_evoa_hash;
        
        p_response := APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url               => p_url
                                                        ,p_http_method       => NVL(p_method, 'POST')
                                                        ,p_transfer_timeout  => g_evoa_timeout
                                                        ,p_body              => p_request);
        
        p_response_code := apex_web_service.g_status_code;

    EXCEPTION 
        WHEN OTHERS THEN
            IF INSTR(dbms_utility.format_error_stack, 'ORA-29276') > 0 THEN
                logger.log_error(l_scope || ': TIMEOUT', l_scope, NULL, l_params);
                RAISE e_evoa_timeout;
            ELSE
                logger.log_error(l_scope || ': ERROR', l_scope, NULL, l_params);
                RAISE;
            END IF;

    END call_rest;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      24.10.2019  Added
    *******************************************************************************/
    FUNCTION get_evoa_url (p_type IN VARCHAR2 DEFAULT 'STANDARD') RETURN VARCHAR2 AS

        l_url       VARCHAR2(2000);

    BEGIN
    
        IF p_type = 'SEARCH' THEN
            l_url := g_url_evoa_search;
        ELSIF p_type = 'SUBMIT' THEN
            l_url := g_url_evoa_submit;
        END IF;

        RETURN l_url;

    EXCEPTION 
        WHEN OTHERS THEN
            RETURN NULL;
        
    END get_evoa_url;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      24.10.2019  Added
    *******************************************************************************/
    PROCEDURE add_log_evoa_search (p_log_rec IN log_evoa_search%ROWTYPE)
    IS
        l_scope     logger_logs.scope%type := g_log_scope_prefix || 'add_log_evoa_search';
        l_params    logger.tab_param;
    BEGIN
    
        logger.log('ADD LOG EVOA SEARCH: start', l_scope, null, l_params);
    
        INSERT INTO log_evoa_search VALUES p_log_rec;
    
        logger.log('ADD LOG EVOA SEARCH: done', l_scope, null, l_params);
    
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('ADD LOG EVOA SEARCH: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END add_log_evoa_search;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      30.10.2019  Added submit_evoa 
    *******************************************************************************/
    FUNCTION add_log_evoa_submit (p_log_rec IN log_evoa_submit%ROWTYPE)
    RETURN log_evoa_submit.key_value%TYPE
    IS
        -- Logger
        l_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'add_log_evoa_submit';
        l_params          logger.tab_param;
        --
        l_result log_evoa_submit.key_value%TYPE;
        --
    BEGIN
    
        logger.append_param(l_params, 'p_log_rec.dml_at'                  , p_log_rec.dml_at);
        logger.append_param(l_params, 'p_log_rec.dml_by'                  , p_log_rec.dml_by);
        logger.append_param(l_params, 'p_log_rec.dml_type'                , p_log_rec.dml_type);
        logger.append_param(l_params, 'p_log_rec.ins_at'                  , p_log_rec.ins_at);
        logger.append_param(l_params, 'p_log_rec.ins_by'                  , p_log_rec.ins_by);
        logger.append_param(l_params, 'p_log_rec.sender'                  , p_log_rec.sender);
        logger.append_param(l_params, 'p_log_rec.sender_object'           , p_log_rec.sender_object);
        logger.append_param(l_params, 'p_log_rec.sender_object_id'        , p_log_rec.sender_object_id);
        logger.append_param(l_params, 'p_log_rec.request'                 , dbms_lob.substr(p_log_rec.request, 4000, 1));
        logger.append_param(l_params, 'p_log_rec.response_code'           , p_log_rec.response_code);
        logger.append_param(l_params, 'p_log_rec.response_status'         , p_log_rec.response_status);
        logger.append_param(l_params, 'p_log_rec.response_status_desc'    , p_log_rec.response_status_desc);
        logger.append_param(l_params, 'p_log_rec.response'                , dbms_lob.substr(p_log_rec.response, 4000, 1));
        logger.append_param(l_params, 'p_log_rec.process_time'            , p_log_rec.process_time);
    
        logger.log('ADD LOG EVOA SUBMIT: start', l_scope, null, l_params);
    
        INSERT INTO log_evoa_submit
        VALUES p_log_rec
        RETURNING key_value INTO l_result;
    
        logger.append_param(l_params, 'l_result', l_result);
        logger.log('ADD LOG EVOA SUBMIT: done', l_scope, null, l_params);
    
        RETURN l_result;
    
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('ADD LOG EVOA SUBMIT: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END add_log_evoa_submit;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      30.10.2019  Added send_hook_information 
    *******************************************************************************/
    PROCEDURE send_hook_information (p_json_obj_input IN CLOB)
    IS
        -- Logger
        l_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'send_hook_information';
        l_params          logger.tab_param;
        --
        l_json            APEX_JSON.T_VALUES;
        l_json_sender     VARCHAR2(255 CHAR);
        l_json_object     VARCHAR2(500 CHAR);
        l_json_pk         VARCHAR2(500 CHAR);
        --
    BEGIN
    
        logger.append_param(l_params, 'dbms_lob.substr(p_json_object_input, 4000, 1)', dbms_lob.substr(p_json_obj_input, 4000, 1));
        logger.log('SEND HOOK INFORMATION: start', l_scope, null, l_params);
    
        APEX_JSON.PARSE(l_json, p_json_obj_input);
        l_json_sender  := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'sender');
        l_json_object  := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'object');
        l_json_pk      := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'pk');
    
        logger.append_param(l_params, 'l_json_sender', l_json_sender);
        logger.append_param(l_params, 'l_json_object', l_json_object);
        logger.append_param(l_params, 'l_json_pk', l_json_pk);
    
        -- define action that should be done to send the information
        IF l_json_sender = 'bordercontrol' AND l_json_object = 'movement' THEN
            submit_mvmnt_evoa(l_json_pk);
        ELSIF l_json_sender = 'bordercontrol' AND l_json_object = 'evoa' THEN
            submit_evoa(l_json_pk);
        END IF;
    
        logger.log('SEND HOOK INFORMATION: done', l_scope, null, l_params);
    
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('SEND HOOK INFORMATION: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END send_hook_information;
    
    ---------------------
    -- Internals END --
    ---------------------
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      30.10.2019  Added search_evoa 
    *******************************************************************************/
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
    ) IS
        -- Logger
        l_scope             logger_logs.scope%TYPE := g_log_scope_prefix || 'search_evoa';
        l_params            logger.tab_param;
        --
        l_url               VARCHAR2(2000);
        l_url_type          VARCHAR2(50) := 'SEARCH';
        --
        l_time_start        DATE;
        l_time_end          DATE;
        --
        l_log_evoa_rec      dl_bordercontrol.log_evoa_search%ROWTYPE;
        l_number_of_hits    NUMBER := 0;
        l_response_code     NUMBER;
        --
        l_json_result       JSON_OBJECT_T;
        l_json_element      JSON_ELEMENT_T;
        --
    BEGIN

        logger.append_param(l_params, 'dbms_lob.substr(p_request_clob, 3000, 1)', dbms_lob.substr(p_request_clob, 3000, 1));
        logger.append_param(l_params, 'p_user', p_user);
        logger.append_param(l_params, 'p_system', p_system);
        logger.append_param(l_params, 'p_object', p_object);
        logger.append_param(l_params, 'p_object_id', p_object_id);
        logger.log('SEARCH EVOA: START', l_scope, NULL, l_params);

        l_url := get_evoa_url(l_url_type);
        l_time_start := SYSDATE;

        call_rest
        (
            p_url           => l_url, 
            p_method        => 'POST', 
            p_request       => p_request_clob,
            p_response_code => p_response_status_code,
            p_response      => p_response_clob
        );

        l_time_end := SYSDATE;
        
        logger.append_param(l_params, 'p_response_status_code', p_response_status_code);
        logger.append_param(l_params, 'dbms_lob.substr(p_response_clob, 3000, 1)', dbms_lob.substr(p_response_clob, 3000, 1));
        logger.append_param(l_params, 'elapsed_time_seconds', (l_time_end - l_time_start) * 24 * 60 * 60);
        
        --
        l_json_result := JSON_OBJECT_T(p_response_clob);
        --
        l_json_element := l_json_result.get_object('status').get('code');
        IF NOT l_json_element.is_null THEN
            l_response_code := l_json_element.to_number;
        END IF;
        --
        l_json_element := l_json_result.get('appData');
        IF l_json_element.is_array THEN
            l_number_of_hits := l_json_element.get_size;
        END IF;
        --

        l_log_evoa_rec.sender_system        := p_system;
        l_log_evoa_rec.sender_user          := p_user;
        l_log_evoa_rec.sender_object        := p_object;
        l_log_evoa_rec.sender_object_id     := p_object_id;
        l_log_evoa_rec.request              := p_request_clob;
        l_log_evoa_rec.response             := p_response_clob; 
        l_log_evoa_rec.response_code        := l_response_code;
        l_log_evoa_rec.elapsed_time_seconds := (l_time_end - l_time_start) * 24 * 60 * 60;
        l_log_evoa_rec.number_of_hits       := l_number_of_hits;

        add_log_evoa_search(l_log_evoa_rec);
        
        -- set out params
        p_response_status_code  := 1; --l_number_of_hits;
        p_response_status_msg   := g_generic_success_msg;
        
        logger.append_param(l_params, 'dbms_lob.substr(p_response_clob, 3000, 1)', dbms_lob.substr(p_response_clob, 3000, 1));
        logger.log('SEARCH EVOA: DONE', l_scope, NULL, l_params);
        
    EXCEPTION
        WHEN e_evoa_timeout THEN
            logger.log_error('SEARCH EVOA: TIMEOUT', l_scope, NULL, l_params);
            -- set out params
            p_response_clob         := '[]';
            p_response_status_code  := g_timeout_error_code;
            p_response_status_msg   := g_timeout_error_msg;
        WHEN OTHERS THEN
            logger.log_error('SEARCH EVOA: ERROR', l_scope, NULL, l_params);
            -- set out params
            p_response_clob         := '[]';
            p_response_status_code  := -10;
            p_response_status_msg   := g_generic_error_msg;
            RAISE;
    END search_evoa;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      30.10.2019  Added submit_evoa 
    *******************************************************************************/
    PROCEDURE submit_evoa (p_key_value IN movements_evoa.key_value%TYPE)
    IS
        -- Logger
        l_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'submit_evoa';
        l_params          logger.tab_param;
        --
        l_request_clob    CLOB;
        l_url             VARCHAR2(2000);
        l_url_type        VARCHAR2(50) := 'SUBMIT';
        --
        l_log_rec         log_evoa_submit%ROWTYPE;
        l_time_start      DATE;
        l_time_end        DATE;
        --
        l_json_result       JSON_OBJECT_T;
        --
    BEGIN
        
        logger.append_param(l_params, 'p_key_value', p_key_value);
        logger.log('SUBMIT EVOA: START', l_scope, NULL, l_params);

        l_url := get_evoa_url(l_url_type);
        l_time_start := SYSDATE;
        
        -- add a new entry to the logging table
        l_log_rec.dml_type                := 'I';
        l_log_rec.sender                  := 'BORDERCONTROL';
        l_log_rec.sender_object           := 'EVOA';
        l_log_rec.sender_object_id        := p_key_value;
        
        SELECT 
            json_object
            (
                 KEY 'passenger_id'     VALUE me.passenger_id
                ,KEY 'nationality'      VALUE me.nationality
                ,KEY 'passportNo'       VALUE me.docno
                ,KEY 'birth_date'       VALUE TO_CHAR(TO_DATE(me.dob, 'DD/MM/YYYY'), 'YYYY-MM-DD')
                ,KEY 'process_datetime' VALUE TO_CHAR(me.process_datetime, 'YYYY-MM-DD HH24:MI:SS')
                ,KEY 'process_user'     VALUE NVL((SELECT UPPER(NVL(TRIM(first_name_thai || ' '|| last_name_thai), NVL(first_name || ' ' || last_name, username))) AS NAME FROM dl_user_management.users#sgd WHERE USERNAME = me.process_user), me.process_user) --me.process_user
                ,KEY 'voa_date'         VALUE TO_CHAR(m.date_of_entry, 'YYYY-MM-DD HH24:MI:SS')
                ,KEY 'VisaNo'           VALUE CASE WHEN me.voa_visa_text IS NOT NULL AND me.voa_visa_num IS NOT NULL THEN me.voa_visa_text || me.voa_visa_num ELSE me.manual_visano END
            )
        INTO l_request_clob
        FROM dl_bordercontrol.movements_evoa me,
        dl_bordercontrol.movements m
        WHERE me.key_value = p_key_value
        AND m.mvmntid = me.mvmntid
        AND m.is_finished = 'Y';
        
        l_log_rec.request := l_request_clob;
        
        call_rest
        (
            p_url           => l_url, 
            p_method        => 'POST', 
            p_request       => l_request_clob,
            p_response_code => l_log_rec.response_code,
            p_response      => l_log_rec.response
        );

        l_time_end := SYSDATE;
        
        --
        l_json_result := JSON_OBJECT_T(l_log_rec.response);
        --
        l_log_rec.response_status := l_json_result.get_string('status');
        l_log_rec.response_status_desc := l_json_result.get_string('statusDescription');
        --
        
        l_log_rec.process_time := ROUND((l_time_end - l_time_start) * 24 * 60 * 60);
        l_log_rec.key_value := add_log_evoa_submit(l_log_rec);
        COMMIT;
        
        logger.append_param(l_params, 'dbms_lob.substr(l_log_rec.response, 3000, 1)', dbms_lob.substr(l_log_rec.response, 3000, 1));
        logger.append_param(l_params, 'elapsed_time_seconds', (l_time_end - l_time_start) * 24 * 60 * 60);
        
        logger.log('SUBMIT EVOA: done', l_scope, null, l_params);
        
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('SUBMIT EVOA: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END submit_evoa;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      30.10.2019  Added submit_mvmnt_evoa 
    *******************************************************************************/
    PROCEDURE submit_mvmnt_evoa (p_mvmntid IN movements_evoa.mvmntid%TYPE)
    IS
        -- Logger
        l_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'submit_mvmnt_evoa';
        l_params          logger.tab_param;
        --
        l_request_clob    CLOB;
        l_url             VARCHAR2(2000);
        l_url_type        VARCHAR2(50) := 'SUBMIT';
        --
        l_response_status_code  INTEGER;
        l_response_clob         CLOB;
        --
        l_time_start      DATE;
        l_time_end        DATE;
        --
    BEGIN
        
        logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
        logger.log('SUBMIT MVMNT EVOA: START', l_scope, NULL, l_params);

        FOR x IN
        (
            SELECT me.key_value 
            FROM dl_bordercontrol.movements_evoa me,
            dl_bordercontrol.movements m
            WHERE me.mvmntid = p_mvmntid
            AND m.mvmntid = me.mvmntid
            AND m.is_finished = 'Y'
        )
        LOOP
            submit_evoa(x.key_value);
        END LOOP;
        
        logger.log('SUBMIT MVMNT EVOA: done', l_scope, null, l_params);
        
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('SUBMIT MVMNT EVOA: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END submit_mvmnt_evoa;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      30.10.2019  Added enqueue_submit_evoa 
    *******************************************************************************/
    PROCEDURE enqueue_submit_evoa 
    (
        p_key_value     IN VARCHAR2
        ,p_object_type  IN VARCHAR2 DEFAULT 'movement'
    )
    IS
        -- Logger
        l_scope              logger_logs.scope%TYPE := g_log_scope_prefix || 'enqueue_submit_evoa';
        l_params             logger.tab_param;
        --
        l_payload            t_hook_payload;
        l_enqueue_options    dbms_aq.enqueue_options_t;
        l_message_properties dbms_aq.message_properties_t;
        l_msgid              RAW(16);
        --
    BEGIN
    
        logger.append_param(l_params, 'p_key_value', p_key_value);
        logger.append_param(l_params, 'p_object_type', p_object_type);
        logger.log('ENQUEUE SUBMIT EVOA: start', l_scope, null, l_params);
    
        -- enqueue message in Advanced Queue
        l_payload := t_hook_payload(null, null);
        l_payload.obj_version := '0.1';
    
        APEX_JSON.INITIALIZE_CLOB_OUTPUT;

        APEX_JSON.OPEN_OBJECT();
        APEX_JSON.WRITE('sender', 'bordercontrol');
        APEX_JSON.WRITE('object', p_object_type);
        APEX_JSON.WRITE('pk', p_key_value);
        APEX_JSON.CLOSE_OBJECT();
    
        l_payload.obj_input := APEX_JSON.GET_CLOB_OUTPUT;
    
        APEX_JSON.FREE_OUTPUT;

        dbms_aq.enqueue
        (
            queue_name           => c_hook_queue_name
            ,enqueue_options     => l_enqueue_options
            ,message_properties  => l_message_properties
            ,payload             => l_payload
            ,msgid               => l_msgid
        );
        COMMIT;
    
        logger.log('ENQUEUE SUBMIT EVOA: done', l_scope, null, l_params);

    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('ENQUEUE SUBMIT EVOA: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END enqueue_submit_evoa;
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      30.10.2019  Added enqueue_submit_evoa 
    *******************************************************************************/
    PROCEDURE dequeue_submit_evoa
    IS
        -- Logger
        l_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'dequeue_submit_evoa';
        l_params          logger.tab_param;
        --
        l_dequeue_options DBMS_AQ.DEQUEUE_OPTIONS_T;
        l_enqueue_options DBMS_AQ.ENQUEUE_OPTIONS_T;
        l_message_prop    DBMS_AQ.MESSAGE_PROPERTIES_T;
        l_message_hdl     RAW(16);
        l_payload         dl_bordercontrol.t_hook_payload;
        --
        l_json            APEX_JSON.T_VALUES;
        l_json_object     VARCHAR2(500 CHAR);
        l_json_pk         VARCHAR2(500 CHAR);
        --    
    BEGIN
    
        logger.log('DEQUEUE SUBMIT EVOA: start', l_scope, null, l_params);
    
        LOOP
            l_dequeue_options.wait := 5;
            l_dequeue_options.consumer_name := c_consumer_name;
            dbms_aq.dequeue(c_hook_queue_name, l_dequeue_options, l_message_prop, l_payload, l_message_hdl);
        
            send_hook_information(l_payload.obj_input);
        
            COMMIT;
        END LOOP;
    
        logger.log('DEQUEUE SUBMIT EVOA: done', l_scope, null, l_params);
    
    EXCEPTION
        WHEN OTHERS THEN
            logger.log('DEQUEUE SUBMIT EVOA: No more messages for processing', l_scope, null, l_params);
            COMMIT;
    END dequeue_submit_evoa;
    
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
    
end PKG_EVOA_UTIL;
/
