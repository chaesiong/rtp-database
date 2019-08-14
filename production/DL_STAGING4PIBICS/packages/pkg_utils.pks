CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_UTILS" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /*
     Utilities for the other  packages  for the synchronisation of Data from PIBICS to DL_BORDERCONTROL

    */

    e_not_initialized EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_not_initialized
                         ,-20001);
    e_data_in_runs_table EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_data_in_runs_table
                         ,-20002);
    e_preference_not_given EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_preference_not_given
                         ,-20003);
    e_invalid_log_level EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_invalid_log_level
                         ,-20004);
    ora_invalid_identifier EXCEPTION;
    PRAGMA EXCEPTION_INIT(ora_invalid_identifier
                         ,-904);
    SUBTYPE msg_text IS VARCHAR2(200);
    SUBTYPE process_name IS VARCHAR2(32);
    SUBTYPE qualified_object_name IS VARCHAR2(80); -- schema . table @ dblink ~ 80
    SUBTYPE yyyymmdd IS VARCHAR2(8);
    SUBTYPE yyyymm IS VARCHAR2(6);
    SUBTYPE yyyy IS VARCHAR2(2);
    --
    TYPE run_params IS RECORD(
         process_name log_run_steps.topic%TYPE
        ,tag          log_run_steps.tag%TYPE);
    --
    TYPE run_status IS RECORD(
         run_id      log_run_steps.run_id%TYPE
        ,start_ts    log_run_steps.start_ts%TYPE
        ,session_sid log_run_steps.session_sid%TYPE
        ,tag         log_run_steps.tag%TYPE
        ,called_by   log_run_steps.called_by%TYPE);
    --
    TYPE step_params IS RECORD(
         table_name process_name
        ,timeframe  yyyymmdd);
    --
    TYPE step_status IS RECORD(
         step_id       log_run_steps.run_id%TYPE
        ,start_ts      log_run_steps.start_ts%TYPE
        ,cnt_input     NUMBER
        ,cnt_processed NUMBER);

    TYPE load_param IS RECORD(
         timeframe    VARCHAR2(8)
        ,cnt_distinct NUMBER);
    TYPE load_param_t IS TABLE OF load_param; -- INDEX BY BINARY_INTEGER;

    TYPE logger_preferences IS RECORD(
         loglevel  ops_preferences.pref_value%TYPE
        ,client_id ops_preferences.pref_value%TYPE);
    --
    TYPE batchsize_preferences IS RECORD(
         batch_size NUMBER
        ,is_default BOOLEAN);
    --
    TYPE tag_preferences IS RECORD(
         tag        ops_preferences.pref_value%TYPE
        ,is_default BOOLEAN);
    --
    TYPE process_tablenames IS RECORD(
         pibics  process_name
        ,staging process_name);

    gc_txt_default_tag         CONSTANT msg_text := 'We take the default tag';
    gc_txt_duplicate_key_error CONSTANT msg_text := ' produces duplicate keys and will be ignored.';

    gc_p_many CONSTANT process_name := '~MANY~';

    --
    PROCEDURE start_run(p_params IN run_params);

    PROCEDURE start_step(p_step_params IN step_params);

    PROCEDURE note_step_event(p_messsage IN msg_text);
    PROCEDURE end_step(p_step_status IN step_status);

    FUNCTION get_tablenames(pi_process_name IN process_name) RETURN process_tablenames;

    FUNCTION get_begin_of_time RETURN DATE DETERMINISTIC;
    -- these  functions return get_begin_of_time if p_date is null
    FUNCTION get_trunc_date(p_date IN DATE) RETURN DATE DETERMINISTIC;
    FUNCTION get_yyyymmdd(p_date IN DATE) RETURN yyyymmdd DETERMINISTIC;
    FUNCTION get_yyyymm(p_date IN DATE) RETURN yyyymm DETERMINISTIC;
    FUNCTION get_yyyy(p_date IN DATE) RETURN yyyy DETERMINISTIC;

    FUNCTION get_already_processed(p_table_name           IN process_name
                                  ,p_create_date_yyyymmdd IN yyyymmdd) RETURN NUMBER;
    FUNCTION get_already_processed(p_table_name         IN process_name
                                  ,p_create_date_yyyymm IN yyyymm) RETURN NUMBER;
    FUNCTION get_already_processed(p_table_name       IN process_name
                                  ,p_create_date_yyyy IN yyyy) RETURN NUMBER;

    PROCEDURE set_logger_preferences(p_prefs IN logger_preferences);
    -- put the preferences in table for later use

    FUNCTION get_logger_preferences RETURN logger_preferences;
    -- get the preferences from table
    -- SIDE EFFECT : initializes the table if no setting is found

    PROCEDURE use_logger_preferences(p_prefs   IN logger_preferences
                                    ,p_verbose IN BOOLEAN DEFAULT FALSE);
    -- use the preferences as given, don't deal with the preferences table
    -- if p_verbose is true then write to server output
    -- SIDE EFFECT : Session identifier will be set here

    PROCEDURE get_and_use_logger_preferences(p_verbose IN BOOLEAN DEFAULT FALSE);
    -- take the preferences from table and use them
    -- if p_verbose is true then write to server output
    -- SIDE EFFECT : Session identifier will be set here

    FUNCTION get_batchsize_preferences(p_batchsize IN NUMBER) RETURN batchsize_preferences;
    -- SIDE EFFECT : initializes the table if no setting is found

    FUNCTION get_tag_preferences(p_tag IN VARCHAR2) RETURN tag_preferences;
    -- SIDE EFFECT : initializes the table if no setting is found

    PROCEDURE update_pibics_counter(pi_table_name IN process_name);
    PROCEDURE reset_pibics_counter(pi_table_name IN process_name);

    PROCEDURE update_staging_counter(pi_table_name IN process_name);
    PROCEDURE update_staging_counter(pi_table_name IN process_name
                                    ,pi_yyyymm     IN yyyymm);
    PROCEDURE update_staging_counter(pi_table_name IN process_name
                                    ,pi_yyyymmdd   IN yyyymmdd);
    PROCEDURE reset_staging_counter(pi_table_name IN process_name);
END pkg_utils;
/
