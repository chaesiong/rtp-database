CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_UTILS" IS
    g_start_time       TIMESTAMP;
    g_transaction_guid guid_t;

    PROCEDURE init IS
    BEGIN
        g_start_time       := systimestamp;
        g_transaction_guid := sys_guid();
    END;
    FUNCTION get_transaction_guid RETURN guid_t IS
    BEGIN
        RETURN g_transaction_guid;
    END get_transaction_guid;

    FUNCTION build_return$json(pi_id      IN pkg_utils.id_t DEFAULT NULL
                              ,pi_code    IN pkg_utils.code_t DEFAULT NULL
                              ,pi_reasons IN pkg_utils.reasons_t DEFAULT NULL) RETURN json_object_t IS
        l_res json_object_t;
        l_st  json_object_t;
    BEGIN
        /*
        {
          "blacklistId": "string",
          "status": {
            "code": "SUCCESS",
            "reasons": "string"
          },
          "system": "string",
        }
              */
        l_res := json_object_t('{}');
        l_st  := json_object_t('{}');
        l_st.put('code'
                ,pi_code);
        l_st.put('reasons'
                ,pi_reasons);
        l_res.put('status'
                 ,l_st);
        l_res.put('blacklistid'
                 ,pi_id);
        l_res.put('system'
                 ,pkg_utils.get_top_level_program_unit);

        RETURN l_res;
    END build_return$json;

    FUNCTION build_return(pi_code             IN pkg_utils.code_t DEFAULT NULL
                         ,pi_reasons          IN pkg_utils.reasons_t DEFAULT NULL
                         ,pi_transaction_guid IN pkg_utils.id_t DEFAULT NULL
                         ,pi_system           IN pkg_utils.system_t DEFAULT NULL) RETURN pkg_utils.return_t IS
        l_res pkg_utils.return_t;
    BEGIN
        l_res.code             := pi_code;
        l_res.reasons          := pi_reasons;
        l_res.transaction_guid := pi_transaction_guid;
        l_res.system           := pi_system;
        RETURN l_res;
    END build_return;

    FUNCTION get_direct_caller RETURN VARCHAR2 IS
        l_level CONSTANT PLS_INTEGER := 3;
        -- 3 is not the caller of 'get_direct_caller', but its caller ;-)
    BEGIN
        RETURN utl_call_stack.owner(l_level) || '.' || utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(l_level));
    END get_direct_caller;

    FUNCTION get_top_level_program_unit RETURN VARCHAR2 IS
        l_level PLS_INTEGER;
    BEGIN
        l_level := utl_call_stack.dynamic_depth() - 1;
        -- top of the call stack is anonymous block or something which is not relevant, so we subtract 1
        RETURN utl_call_stack.owner(l_level) || '.' || utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(l_level));
    END get_top_level_program_unit;

    PROCEDURE log_input(pi_json IN json_object_t) IS
        l_clob CLOB;
    BEGIN
        init;
        l_clob := pi_json.to_clob();
        logger.log(p_text  => 'TRANSACTION_GUID:' || g_transaction_guid || ' START'
                  ,p_extra => l_clob
                  ,p_scope => pkg_utils.get_top_level_program_unit);

    END log_input;

    PROCEDURE log_input(pi_string IN VARCHAR2) IS
        l_clob CLOB;
    BEGIN
        init;
        l_clob := to_clob(pi_string);

        logger.log(p_text  => 'TRANSACTION_GUID:' || g_transaction_guid || ' START'
                  ,p_extra => l_clob
                  ,p_scope => pkg_utils.get_top_level_program_unit);
    END log_input;

    PROCEDURE log_output(pi_json IN json_element_t) IS
        l_clob CLOB;
    BEGIN
        l_clob := to_clob(pi_json.stringify());
        logger.log(p_text  => 'TRANSACTION_GUID:' || g_transaction_guid || ' END'
                  ,p_extra => l_clob
                  ,p_scope => pkg_utils.get_top_level_program_unit);
    END log_output;

    FUNCTION is_return_success(pi_return IN json_object_t) RETURN BOOLEAN IS
    BEGIN
        IF pi_return IS NULL THEN
            RETURN FALSE;
        END IF;
        IF pi_return.get_object('status').get_string('code') = gc_success THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END is_return_success;

    -- calls HTP and OWA_UTIL subroutines
    PROCEDURE write_http_headers_json(pi_return IN json_object_t) IS
    BEGIN
        IF pi_return IS NULL THEN
            owa_util.mime_header('application/json'
                                ,TRUE
                                ,'UTF-8');
        ELSE
            owa_util.mime_header('application/json'
                                ,FALSE
                                ,'UTF-8');
            htp.p('X-CODE: ' || pi_return.get_object('status').get_string('code'));
            htp.p('X-REASONS: ' || pi_return.get_object('status').get_string('reasons'));
            htp.p('X-SYSTEM: ' || pi_return.get_string('system'));
            htp.p('X-DB-TRANSACTION-GUID: ' || pkg_utils.get_transaction_guid());
            owa_util.http_header_close;
        END IF;

    END write_http_headers_json;

    PROCEDURE htp_output_clob(my_clob CLOB
                             ,jsonp   VARCHAR2 DEFAULT NULL) AS
        /*amount number := 4096;
        pos number := 1;
        len number;
        */
        l_amt NUMBER DEFAULT 30;
        l_off NUMBER DEFAULT 1;
        l_str VARCHAR2(4096);
    BEGIN
        IF (jsonp IS NOT NULL) THEN
            htp.prn(jsonp || '(');
        END IF;

        BEGIN
            LOOP
                dbms_lob.read(my_clob
                             ,l_amt
                             ,l_off
                             ,l_str);

                -- it is vital to use htp.PRN to avoid
                -- spurious line feeds getting added to your
                -- document
                htp.prn(l_str);
                l_off := l_off + l_amt;
                l_amt := 4096;
            END LOOP;
        EXCEPTION
            WHEN no_data_found THEN
                NULL;
        END;
        IF (jsonp IS NOT NULL) THEN
            htp.prn(')');
        END IF;
    END htp_output_clob;

    PROCEDURE get_and_use_logger_preferences AS
        l_loglevel  ops_preferences.pref_value%TYPE;
        l_client_id ops_preferences.pref_value%TYPE;
    BEGIN
        SELECT *
        INTO l_loglevel
            ,l_client_id
        FROM (SELECT pref_name
                    ,pref_value
              FROM ops_preferences)
        pivot(MAX(pref_value)
        FOR pref_name IN('LOGGER_LEVEL'
                        ,'LOGGER_CLIENT_ID'));

        logger.set_level(p_level     => l_loglevel
                        ,p_client_id => l_client_id);

        sys.dbms_session.set_identifier(l_client_id);
    END get_and_use_logger_preferences;

    FUNCTION create_a_case_number RETURN VARCHAR2 IS
        l_res VARCHAR2(20);
        l_seq NUMBER;
    BEGIN
        SELECT blacklist_cases$seq00.nextval
        INTO l_seq
        FROM dual;
        l_res := 'B' || to_char(l_seq
                               ,'FM099999');
        RETURN l_res;
    END create_a_case_number;
END pkg_utils;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_UTILS" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_UTILS" TO "DERMALOG_PROXY";
