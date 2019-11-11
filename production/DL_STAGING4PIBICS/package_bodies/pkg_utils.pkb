CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_UTILS" AS
    gc_begin_of_time CONSTANT DATE := to_date('19700101'
                                             ,'YYYYMMDD');

    g_status log_run_steps%ROWTYPE;
    gc_logger_level      CONSTANT ops_preferences.pref_name%TYPE := 'LOGGER_LEVEL';
    gc_level_description CONSTANT ops_preferences.description%TYPE := 'Logging Level for LOGGER-Package, related to client_id, ' ||
                                                                      'see LOGGING_CLIENT_ID. If the Value is NULL, the system LOGGER-Level will be used';
    --
    gc_logger_client_id      CONSTANT ops_preferences.pref_name%TYPE := 'LOGGER_CLIENT_ID';
    gc_client_id_description CONSTANT ops_preferences.description%TYPE := 'Client-Id for LOGGER-Pakage. This will be set with  sys.dbms_session.set_identifier during runtime. ' ||
                                                                          ' If LOGGER_LEVEL is NULL, this value is ignored.';
    --
    gc_default_batchsize     CONSTANT ops_preferences.pref_name%TYPE := 'DEFAULT_BATCHSIZE';
    gc_batchsize_description CONSTANT ops_preferences.description%TYPE := 'Default Batchsize for synchronization processes';
    --
    gc_default_tag     CONSTANT ops_preferences.pref_name%TYPE := 'DEFAULT_TAG';
    gc_tag_description CONSTANT ops_preferences.description%TYPE := 'Default tag to mark severel process runs with one value';

    --
    FUNCTION get_top_level_program_unit RETURN VARCHAR2 IS
        l_level PLS_INTEGER;
    BEGIN
        l_level := utl_call_stack.dynamic_depth() - 1;
        -- top of the call stack is anonymous block or something which is not relevant, so we subtract 1
        RETURN utl_call_stack.owner(l_level) || '.' || utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(l_level));
    END get_top_level_program_unit;

    FUNCTION get_createdate_column_name(pi_table_name IN VARCHAR2) RETURN VARCHAR2 IS
        l_column_name process_name;
    BEGIN
        SELECT column_name
        INTO l_column_name
        FROM cols
        WHERE table_name = upper(pi_table_name)
        AND column_name = 'CREATE_DATE';

        RETURN l_column_name;
    EXCEPTION
        WHEN no_data_found THEN
            SELECT column_name
            INTO l_column_name
            FROM cols
            WHERE table_name = upper(pi_table_name)
            AND column_name = 'CREDTE';

            RETURN l_column_name;

    END get_createdate_column_name;

    PROCEDURE set_content(p_name        IN ops_preferences.pref_name%TYPE
                         ,p_description IN ops_preferences.description%TYPE
                         ,p_value       IN ops_preferences.pref_value%TYPE) AS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        MERGE INTO ops_preferences tgt
        USING (SELECT p_name        AS pref_name
                     ,p_description AS description
                     ,p_value       AS pref_value
               FROM dual) src
        ON (src.pref_name = tgt.pref_name)
        WHEN NOT MATCHED THEN
            INSERT
                (pref_name
                ,description
                ,pref_value)
            VALUES
                (src.pref_name
                ,src.description
                ,src.pref_value);

        COMMIT;
    END set_content;

    PROCEDURE init_content_logging IS
        lc_client_id_value CONSTANT ops_preferences.pref_value%TYPE := 'set a useful value here';
    BEGIN
        set_content(gc_logger_client_id
                   ,gc_client_id_description
                   ,lc_client_id_value);
        set_content(gc_logger_level
                   ,gc_level_description
                   ,logger.g_debug_name);
    END init_content_logging;

    PROCEDURE init_default_batchsize IS
        lc_batchsize_value CONSTANT NUMBER := 1000;
    BEGIN
        set_content(gc_default_batchsize
                   ,gc_batchsize_description
                   ,lc_batchsize_value);
    END init_default_batchsize;

    PROCEDURE init_default_tag IS
        lc_tag_value CONSTANT ops_preferences.pref_value%TYPE := 'Entwicklertest';
    BEGIN
        set_content(gc_default_tag
                   ,gc_tag_description
                   ,lc_tag_value);
    END init_default_tag;

    FUNCTION get_pref_value(p_pref_name IN ops_preferences.pref_name%TYPE) RETURN ops_preferences.pref_value%TYPE IS
        l_result ops_preferences.pref_value%TYPE;
    BEGIN
        SELECT pref_value
        INTO l_result
        FROM ops_preferences
        WHERE pref_name = p_pref_name;

        RETURN l_result;
    EXCEPTION
        WHEN no_data_found THEN
            RAISE e_preference_not_given;
        WHEN OTHERS THEN
            RAISE;
    END get_pref_value;

    FUNCTION prepare_sc_statement(pi_table_name IN process_name) RETURN VARCHAR2 IS
        l_stmt VARCHAR2(4000) := q'[
       MERGE INTO dl_staging4pibics.CNT_STAGING tgt
        USING (SELECT pkg_utils.get_trunc_date(#COLNAM#) create_date
                     ,COUNT(*) COUNT
               FROM #TABNAM# WHERE  #WHERECOND#
                 GROUP BY pkg_utils.get_trunc_date(#COLNAM#)  )  src
        ON (src.create_date = tgt.create_date AND tgt.table_name = '#TABNAM#')
        WHEN NOT MATCHED THEN
            INSERT
                (table_name
                ,create_date
                ,COUNT
                ,dml_at)
            VALUES
                ('#TABNAM#'
                ,src.create_date
                ,src.count
                ,SYSDATE)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.count  = src.count
               ,tgt.dml_at = SYSDATE]';
    BEGIN
        RETURN REPLACE(srcstr => l_stmt
                      ,oldsub => '#TABNAM#'
                      ,newsub => upper(pi_table_name));
    END prepare_sc_statement;

    --
    -- public
    --

    FUNCTION get_begin_of_time RETURN DATE DETERMINISTIC IS
    BEGIN
        RETURN gc_begin_of_time;
    END get_begin_of_time;

    PROCEDURE start_run(p_params IN run_params) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        g_status.start_ts := systimestamp;
        SELECT sys_context('USERENV'
                          ,'SID')
        INTO g_status.session_sid
        FROM dual;
        g_status.topic        := p_params.process_name;
        g_status.tag          := coalesce(p_params.tag
                                         ,sys_context('USERENV'
                                                     ,'CLIENT_IDENTIFIER')
                                         ,'?');
        g_status.program_unit := get_top_level_program_unit;
        g_status.called_by    := dl_common.pkg_session.get_audit_user;
        g_status.run_id       := sys_guid;

    END start_run;

    PROCEDURE start_step(p_step_params IN step_params) IS
        PRAGMA AUTONOMOUS_TRANSACTION;

    BEGIN
        IF g_status.run_id IS NULL THEN
            start_run(p_params => NULL);
        END IF;
        g_status.start_ts := systimestamp;

        g_status.subtopic  := p_step_params.table_name;
        g_status.timeframe := p_step_params.timeframe;
        INSERT INTO dl_staging4pibics.log_run_steps
            (run_id
            ,topic
            ,session_sid
            ,tag
            ,program_unit
            ,called_by
            ,subtopic
            ,start_ts
            ,timeframe)
        VALUES
            (g_status.run_id
            ,coalesce(g_status.topic
                     ,'~')
            ,g_status.session_sid
            ,g_status.tag
            ,g_status.program_unit
            ,g_status.called_by
            ,g_status.subtopic
            ,g_status.start_ts
            ,g_status.timeframe)
        RETURNING step_id INTO g_status.step_id;

        COMMIT;
    END start_step;

    PROCEDURE note_step_event(p_messsage IN msg_text) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        UPDATE log_run_steps tgt
        SET tgt.events = ltrim(tgt.events || ';' || TRIM(p_messsage)
                              ,';')
        WHERE step_id = g_status.step_id;

        COMMIT;
    END note_step_event;

    PROCEDURE end_step(p_step_status IN step_status) AS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        IF g_status.step_id IS NULL THEN
            start_step(p_step_params => NULL);
        END IF;

        UPDATE log_run_steps tgt
        SET end_ts        = systimestamp
           ,cnt_input     = p_step_status.cnt_input
           ,cnt_processed = p_step_status.cnt_processed
        WHERE step_id = g_status.step_id;
        COMMIT;
    END end_step;

    FUNCTION get_tablenames(pi_process_name IN process_name) RETURN process_tablenames IS
        l_res process_tablenames;
    BEGIN
        SELECT 'MV_' || process_name
              ,process_name
        INTO l_res
        FROM dl_staging4pibics.ops_pibics_load_processes
        WHERE process_name = upper(pi_process_name);
        RETURN l_res;
    END get_tablenames;

    FUNCTION get_trunc_date(p_date IN DATE) RETURN DATE DETERMINISTIC IS
    BEGIN
        IF p_date IS NULL THEN
            RETURN trunc(gc_begin_of_time);
        ELSE
            RETURN trunc(p_date);
        END IF;
    END get_trunc_date;

    FUNCTION get_yyyymmdd(p_date IN DATE) RETURN yyyymmdd DETERMINISTIC IS
    BEGIN
        IF p_date IS NULL THEN
            RETURN to_char(gc_begin_of_time
                          ,'YYYYMMDD');
        ELSE
            RETURN to_char(p_date
                          ,'YYYYMMDD');
        END IF;
    END get_yyyymmdd;

    FUNCTION get_yyyymm(p_date IN DATE) RETURN yyyymm DETERMINISTIC IS
    BEGIN
        IF p_date IS NULL THEN
            RETURN to_char(gc_begin_of_time
                          ,'YYYYMM');
        ELSE
            RETURN to_char(p_date
                          ,'YYYYMM');
        END IF;
    END get_yyyymm;

    FUNCTION get_yyyy(p_date IN DATE) RETURN yyyy DETERMINISTIC IS
    BEGIN
        IF p_date IS NULL THEN
            RETURN to_char(gc_begin_of_time
                          ,'YYYY');
        ELSE
            RETURN to_char(p_date
                          ,'YYYY');
        END IF;
    END get_yyyy;

    FUNCTION get_already_processed(p_table_name           IN process_name
                                  ,p_create_date_yyyymmdd IN yyyymmdd) RETURN NUMBER IS
        l_cnt NUMBER;
    BEGIN
        SELECT coalesce(SUM(COUNT)
                       ,0)
        INTO l_cnt
        FROM dl_staging4pibics.cnt_staging
        WHERE get_yyyymmdd(create_date) = p_create_date_yyyymmdd
        AND table_name = p_table_name;

        RETURN l_cnt;
    END get_already_processed;

    FUNCTION get_already_processed(p_table_name         IN process_name
                                  ,p_create_date_yyyymm IN yyyymm) RETURN NUMBER IS
        l_cnt NUMBER;
    BEGIN
        SELECT coalesce(SUM(COUNT)
                       ,0)
        INTO l_cnt
        FROM dl_staging4pibics.cnt_staging
        WHERE pkg_utils.get_yyyymm(create_date) = p_create_date_yyyymm
        AND table_name = p_table_name;
        RETURN l_cnt;
    END get_already_processed;

    FUNCTION get_already_processed(p_table_name       IN process_name
                                  ,p_create_date_yyyy IN yyyy) RETURN NUMBER IS
        l_cnt NUMBER;
    BEGIN
        SELECT coalesce(SUM(COUNT)
                       ,0)
        INTO l_cnt
        FROM dl_staging4pibics.cnt_staging
        WHERE pkg_utils.get_yyyy(create_date) = p_create_date_yyyy
        AND table_name = p_table_name;
        RETURN l_cnt;
    END get_already_processed;

    -- prferences
    PROCEDURE set_logger_preferences(p_prefs IN logger_preferences) IS
        l_prefs logger_preferences := p_prefs;
    BEGIN
        -- prevent errors
        IF p_prefs.loglevel NOT IN (logger.g_off_name
                                   ,logger.g_permanent_name
                                   ,logger.g_error_name
                                   ,logger.g_warning_name
                                   ,logger.g_information_name
                                   ,logger.g_debug_name
                                   ,NULL) THEN
            RAISE e_invalid_log_level;
        END IF;

        IF l_prefs.loglevel IS NULL THEN
            l_prefs.client_id := NULL;
        END IF;
        set_content(gc_logger_client_id
                   ,gc_client_id_description
                   ,l_prefs.client_id);
        set_content(gc_logger_level
                   ,gc_level_description
                   ,l_prefs.loglevel);
    END set_logger_preferences;

    FUNCTION get_logger_preferences RETURN logger_preferences IS
        l_prefs logger_preferences;
    BEGIN
        SELECT *
        INTO l_prefs.loglevel
            ,l_prefs.client_id
        FROM (SELECT pref_name
                    ,pref_value
              FROM ops_preferences)
        pivot(MAX(pref_value)
        FOR pref_name IN('LOGGER_LEVEL'
                        ,'LOGGER_CLIENT_ID'));

        RETURN l_prefs;
    EXCEPTION
        WHEN no_data_found THEN
            init_content_logging;
            RETURN get_logger_preferences;
        WHEN OTHERS THEN
            RAISE;
    END get_logger_preferences;

    PROCEDURE use_logger_preferences(p_prefs   IN logger_preferences
                                    ,p_verbose IN BOOLEAN DEFAULT FALSE) IS
        l_prefs logger_preferences := p_prefs;
        lc_stack_level CONSTANT PLS_INTEGER := 3;
    BEGIN
        -- logger.set_level(p_level     => l_prefs.loglevel
        --                 ,p_client_id => l_prefs.client_id);

        sys.dbms_session.set_identifier(l_prefs.client_id);
        IF p_verbose THEN
            sys.dbms_output.put_line(sys.utl_call_stack.owner(lc_stack_level) || '.' ||
                                     sys.utl_call_stack.concatenate_subprogram(sys.utl_call_stack.subprogram(lc_stack_level)) || ' (' ||
                                     sys.utl_call_stack.unit_line(lc_stack_level) || ') set LOGGER.LEVEL to "' ||
                                     l_prefs.loglevel || '"\n  LOGGER.CLIENT_ID  and SESSION identifier to "' ||
                                     l_prefs.client_id || '"');
        END IF;
    END use_logger_preferences;

    PROCEDURE get_and_use_logger_preferences(p_verbose IN BOOLEAN DEFAULT FALSE) AS
        l_prefs logger_preferences;
    BEGIN
        l_prefs := get_logger_preferences;
        use_logger_preferences(l_prefs
                              ,p_verbose);
    END get_and_use_logger_preferences;

    FUNCTION get_batchsize_preferences(p_batchsize IN NUMBER) RETURN batchsize_preferences IS
        l_result batchsize_preferences;
    BEGIN
        IF p_batchsize IS NULL THEN
            l_result.batch_size := get_pref_value(gc_default_batchsize);
            l_result.is_default := TRUE;
        ELSE
            l_result.batch_size := p_batchsize;
            l_result.is_default := FALSE;
        END IF;

        RETURN l_result;
    EXCEPTION
        WHEN e_preference_not_given THEN
            init_default_batchsize;
            RETURN get_batchsize_preferences(p_batchsize);
        WHEN OTHERS THEN
            RAISE;
    END get_batchsize_preferences;

    FUNCTION get_tag_preferences(p_tag IN VARCHAR2) RETURN tag_preferences IS
        l_result tag_preferences;
    BEGIN
        IF p_tag IS NULL THEN
            l_result.tag        := get_pref_value(gc_default_tag);
            l_result.is_default := TRUE;
        ELSE
            l_result.tag        := p_tag;
            l_result.is_default := FALSE;
        END IF;

        RETURN l_result;
    EXCEPTION
        WHEN e_preference_not_given THEN
            init_default_tag;
            RETURN get_tag_preferences(p_tag);
        WHEN OTHERS THEN
            RAISE;
    END get_tag_preferences;

    PROCEDURE update_pibics_counter(pi_table_name IN process_name) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_datecolname VARCHAR2(100);
        l_stmt        VARCHAR2(4000) := q'[
        MERGE INTO dl_staging4pibics.CNT_PIBICS tgt
        USING (SELECT pkg_utils.get_trunc_date(#COLNAM#)  AS create_date
                     ,COUNT(*) AS COUNT
                     ,'#TABNAM#' AS table_name
               FROM #TABNAM#@pibics
               GROUP BY pkg_utils.get_trunc_date(#COLNAM#)
                       ,'#TABNAM#') src
        ON (src.table_name = tgt.table_name AND src.create_date = tgt.create_date)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.count  = src.count
               ,tgt.dml_at = SYSDATE
        WHEN NOT MATCHED THEN
            INSERT
                (table_name
                ,create_date
                ,COUNT
                ,dml_at)
            VALUES
                (src.table_name
                ,src.create_date
                ,src.count
                ,SYSDATE)]';

    BEGIN
        l_datecolname := get_createdate_column_name(pi_table_name => pi_table_name);
        EXECUTE IMMEDIATE REPLACE(srcstr => REPLACE(srcstr => l_stmt
                                                   ,oldsub => '#COLNAM#'
                                                   ,newsub => upper(l_datecolname))
                                 ,oldsub => '#TABNAM#'
                                 ,newsub => upper(pi_table_name));
        COMMIT;
    END update_pibics_counter;

    PROCEDURE reset_pibics_counter(pi_table_name IN process_name) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        DELETE FROM dl_staging4pibics.cnt_pibics
        WHERE table_name = upper(pi_table_name);
        COMMIT;
    END reset_pibics_counter;

    PROCEDURE update_staging_counter(pi_table_name IN process_name) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_datecolname VARCHAR2(100);
        l_stmt        VARCHAR2(4000);
    BEGIN
        l_datecolname := get_createdate_column_name(pi_table_name => pi_table_name);
        l_stmt        := REPLACE(srcstr => REPLACE(srcstr => prepare_sc_statement(pi_table_name => pi_table_name)
                                                  ,oldsub => '#WHERECOND#'
                                                  ,newsub => '1=1')
                                ,oldsub => '#COLNAM#'
                                ,newsub => upper(l_datecolname));
        dbms_output.put_line(l_stmt);
        EXECUTE IMMEDIATE l_stmt;

        COMMIT;
    END update_staging_counter;

    PROCEDURE update_staging_counter(pi_table_name IN process_name
                                    ,pi_yyyymm     IN yyyymm) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_datecolname VARCHAR2(100);
        l_stmt        VARCHAR2(4000);
    BEGIN
        l_datecolname := get_createdate_column_name(pi_table_name => pi_table_name);
        l_stmt        := REPLACE(srcstr => REPLACE(srcstr => prepare_sc_statement(pi_table_name => pi_table_name)
                                                  ,oldsub => '#WHERECOND#'
                                                  ,newsub => 'pkg_utils.get_yyyymm(#COLNAM#) = ''' || pi_yyyymm || '''')
                                ,oldsub => '#COLNAM#'
                                ,newsub => upper(l_datecolname));
        EXECUTE IMMEDIATE l_stmt;
        COMMIT;
    END update_staging_counter;

    PROCEDURE update_staging_counter(pi_table_name IN process_name
                                    ,pi_yyyymmdd   IN yyyymmdd) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_datecolname VARCHAR2(100);
        l_stmt        VARCHAR2(4000);
    BEGIN
        l_datecolname := get_createdate_column_name(pi_table_name => pi_table_name);
        l_stmt        := REPLACE(srcstr => REPLACE(srcstr => prepare_sc_statement(pi_table_name => pi_table_name)
                                                  ,oldsub => '#WHERECOND#'
                                                  ,newsub => 'pkg_utils.get_yyyymmdd(#COLNAM#) = ''' || pi_yyyymmdd || '''')
                                ,oldsub => '#COLNAM#'
                                ,newsub => upper(l_datecolname));
        EXECUTE IMMEDIATE l_stmt;
        COMMIT;
    END update_staging_counter;

    PROCEDURE reset_staging_counter(pi_table_name IN process_name) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        DELETE FROM dl_staging4pibics.cnt_staging
        WHERE table_name = upper(pi_table_name);
        COMMIT;
    END reset_staging_counter;

END pkg_utils;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_UTILS" TO "PIBICSDM2";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_UTILS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_UTILS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_UTILS" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_UTILS" TO "BIOSAADM";
