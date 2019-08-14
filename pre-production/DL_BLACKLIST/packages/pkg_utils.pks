CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_UTILS" AUTHID DEFINER IS

    -- Author  : E1NKLAMANN
    -- Created : 2018-05-18 13:53:38
    -- Purpose : Utilities and Constants
    err_not_active EXCEPTION;
    PRAGMA EXCEPTION_INIT(err_not_active
                         ,-20001);
    err_invalid_input EXCEPTION;
    PRAGMA EXCEPTION_INIT(err_invalid_input
                         ,-20002);

    -- Public type declarations
    SUBTYPE code_t IS VARCHAR2(20 CHAR);
    SUBTYPE reasons_t IS VARCHAR2(4000 CHAR);
    SUBTYPE system_t IS VARCHAR2(255 CHAR);
    SUBTYPE id_t IS VARCHAR2(32 CHAR);
    SUBTYPE guid_t IS VARCHAR2(32 CHAR);
    TYPE return_t IS RECORD(
         code             pkg_utils.code_t
        ,reasons          pkg_utils.reasons_t
        ,transaction_guid pkg_utils.id_t
        ,system           pkg_utils.system_t);

    -- Public constant declarations
    gc_success CONSTANT code_t := 'SUCCESS';
    gc_error   CONSTANT code_t := 'ERROR';
    gc_failure CONSTANT code_t := 'FAILURE';

    gc_no_data_found CONSTANT reasons_t := 'No data found';
    gc_not_active    CONSTANT reasons_t := 'Not active';
    gc_invalid_input CONSTANT reasons_t := 'Invalid Input';
    gc_no_input      CONSTANT reasons_t := 'No Input';

    FUNCTION get_direct_caller RETURN VARCHAR2;
    FUNCTION get_top_level_program_unit RETURN VARCHAR2;
    FUNCTION get_transaction_guid RETURN guid_t;

    PROCEDURE log_input(pi_json IN json_object_t);
    PROCEDURE log_input(pi_string IN VARCHAR2);
    PROCEDURE log_output(pi_json IN json_element_t);

    --- phase out --
    FUNCTION build_return$json(pi_id      IN pkg_utils.id_t DEFAULT NULL
                              ,pi_code    IN pkg_utils.code_t DEFAULT NULL
                              ,pi_reasons IN pkg_utils.reasons_t DEFAULT NULL) RETURN json_object_t;

    FUNCTION build_return(pi_code             IN pkg_utils.code_t DEFAULT NULL
                         ,pi_reasons          IN pkg_utils.reasons_t DEFAULT NULL
                         ,pi_transaction_guid IN pkg_utils.id_t DEFAULT NULL
                         ,pi_system           IN pkg_utils.system_t DEFAULT NULL) RETURN pkg_utils.return_t;

    FUNCTION is_return_success(pi_return IN json_object_t) RETURN BOOLEAN;

    -- calls HTP and OWA_UTIL subroutines
    PROCEDURE write_http_headers_json(pi_return IN json_object_t);
    -- from pljosn_printer
    PROCEDURE htp_output_clob(my_clob CLOB
                             ,jsonp   VARCHAR2 DEFAULT NULL);
    PROCEDURE get_and_use_logger_preferences;

    FUNCTION create_a_case_number RETURN VARCHAR2;
END pkg_utils;
/
