CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_UTILS" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /*
     General utilities
    */
    e_not_initialized EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_not_initialized
                         ,-20001);
    e_data_in_runs_table EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_data_in_runs_table
                         ,-20002);
    e_run_id_invalid EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_run_id_invalid
                         ,-20003);
    e_invalid_parameter EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_invalid_parameter
                         ,-20004);

    SUBTYPE table_name IS VARCHAR2(ora_max_name_len);
    SUBTYPE process_name IS VARCHAR2(ora_max_name_len);
    SUBTYPE yyyymm IS VARCHAR2(6);
    SUBTYPE msg_text IS VARCHAR2(200);
    --
    TYPE run_params IS RECORD(
         method       log_run_steps.topic%TYPE
        ,process_name log_run_steps.topic%TYPE
        ,tag          log_run_steps.tag%TYPE);
    --
    TYPE run_status IS RECORD(
         run_id       log_run_steps.run_id%TYPE
        ,start_ts     log_run_steps.start_ts%TYPE
        ,end_ts       log_run_steps.end_ts%TYPE
        ,events       log_run_steps.events%TYPE
        ,session_sid  log_run_steps.session_sid%TYPE
        ,tag          log_run_steps.tag%TYPE
        ,ora_err_tag$ log_run_steps.tag%TYPE);
    --
    TYPE step_params IS RECORD(
         table_name process_name
        ,timeframe  yyyymm
        ,batchsize  NUMBER);

    --

    TYPE tablenames IS RECORD(
         mv_synonym      table_name
        ,sync_table      table_name
        ,error_table     table_name
        ,pibics_table_cd VARCHAR2(1)
        ,backend_table   table_name);

    TYPE tablenames_tab IS TABLE OF tablenames;

    gc_staging_schema CONSTANT table_name := 'DL_STAGING4PIBICS';

    -- sync an bordercontrol tables
    -- transcoding tables

    -- high-level processes

    gc_method_load CONSTANT VARCHAR2(10) := 'LOAD';
    gc_method_copy CONSTANT VARCHAR2(10) := 'COPY';

    FUNCTION get_tablenames(p_processname IN table_name) RETURN tablenames;
    FUNCTION get_tablenames_backend(p_sync_table_name IN table_name
                                   ,p_pibics_table_cd IN VARCHAR2) RETURN tablenames;
    FUNCTION get_tablenames_backend RETURN tablenames_tab;

    --
    PROCEDURE start_run(p_params IN run_params);

    PROCEDURE start_step(p_step_params IN step_params);
    PROCEDURE record_event(p_event IN log_run_steps.events%TYPE);
    PROCEDURE record_error_and_end_step(p_event IN log_run_steps.events%TYPE);
    PROCEDURE end_step(p_cnt        IN NUMBER
                      ,p_tablenames IN tablenames);
    PROCEDURE end_step(p_cnt IN NUMBER);

    PROCEDURE end_empty_step;
    FUNCTION get_status RETURN log_run_steps%ROWTYPE;

    ---
    FUNCTION get_begin_of_time RETURN DATE DETERMINISTIC;
    /* necessary because SQL does not accept package constants, only functions */

    FUNCTION get_trunc_date(p_date IN DATE) RETURN DATE DETERMINISTIC;
    FUNCTION get_yyyymm(p_date IN DATE) RETURN yyyymm DETERMINISTIC;

    FUNCTION is_warning(p_errormessage IN VARCHAR2) RETURN PLS_INTEGER DETERMINISTIC;
    --1 => true, 0 => false

    FUNCTION is_error(p_errormessage IN VARCHAR2) RETURN PLS_INTEGER DETERMINISTIC;
    --1 => true, 0 => false
    PROCEDURE update_sync_counter(p_tablenames IN tablenames
                                 ,p_yyyymm     IN yyyymm);
    PROCEDURE update_sync_counter(p_tablenames IN tablenames
                                 ,p_min_date   IN DATE
                                 ,p_max_date   IN DATE);
    PROCEDURE update_sync_counter(p_tablenames IN tablenames);
    
    PROCEDURE reset_sync_counter(p_sync_table      IN table_name
                                ,p_pibics_table_cd IN dl_staging4pibics_intf.ops_sync_processes.pibics_table_cd%TYPE);

    PROCEDURE update_transcode_counter(p_trcd_table IN table_name);
    PROCEDURE reset_transcode_counter(p_trcd_table IN table_name);
END pkg_utils;
/
