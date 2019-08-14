CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_ST_LOSTPASSPORT" AS
    /*
       see architectural description at https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+Dermalog+staging+System+to+Bordercontrol

    */

    g_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    g_tablenames  pkg_utils.tablenames;
    g_step_params pkg_utils.step_params;
    g_start_ts    TIMESTAMP;

    PROCEDURE merge_synctable IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope       logger_logs.scope%TYPE := g_log_scope_prefix || 'merge_sync_tables';
        l_cnt             PLS_INTEGER := 0;
        l_min_create_date DATE;
        l_max_create_date DATE;
        l_cnt_input       NUMBER;
        l_start_ts        TIMESTAMP := systimestamp;
        l_synonym_target  VARCHAR2(100);
    BEGIN
        pkg_utils.start_step(p_step_params => g_step_params);
        SELECT table_owner || '.' || table_name
        INTO l_synonym_target
        FROM all_synonyms
        WHERE table_owner = pkg_utils.gc_staging_schema
        AND synonym_name = g_tablenames.mv_synonym;
        logger.log('synonym ' || pkg_utils.gc_staging_schema || '.' || g_tablenames.mv_synonym || ' points to : ' ||
                   l_synonym_target
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);

        SELECT COUNT(*)
        INTO l_cnt_input
        FROM dl_staging4pibics.mv_log_lostpassport;
        IF l_cnt_input = 0 THEN
            logger.log('No data to process'
                      ,l_log_scope);
            pkg_utils.end_empty_step;
            RETURN;
        END IF;
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        g_step_params.batchsize := 0;
        FOR r IN (WITH basis AS
                       (SELECT lppcd
                             ,CASE
                                  WHEN dmltype$$ IN ('I'
                                                    ,'U') THEN
                                   'Y'
                                  ELSE
                                   'N'
                              END AS is_active_in_mvlog
                             ,sequence$$
                             ,row_number() over(PARTITION BY lppcd ORDER BY sequence$$ DESC) AS rn
                       FROM dl_staging4pibics.mv_log_lostpassport /* synonym */
                       ),
                      mv_last_row AS
                       (SELECT lppcd
                             ,is_active_in_mvlog
                             ,sequence$$
                       FROM basis
                       WHERE rn = 1)
                      SELECT m.lppcd
                            ,m.is_active_in_mvlog
                            ,m.sequence$$
                            ,s.nationcd
                            ,s.passportno
                            ,s.passportexpdte
                            ,s.ownerage
                            ,NVL(s.upddte,s.credte) AS last_update_date
                            ,coalesce(trunc(s.credte)
                                     ,pkg_utils.get_begin_of_time) AS create_date
                      FROM mv_last_row m
                      INNER JOIN dl_staging4pibics.lostpassport s /* left join because deletions */
                      ON s.lppcd = m.lppcd)

        LOOP
            l_min_create_date := least(l_min_create_date
                                      ,r.last_update_date);
            l_max_create_date := greatest(l_min_create_date
                                         ,r.last_update_date);
            BEGIN
                INSERT INTO sync_blacklist_cases tgt
                    (wlcd
                    ,ownerage
                    ,nationcd
                    ,passportno
                    ,expirydate
                    ,pibics_table_cd
                    ,dml_type
                    ,dml_start_ts
                    ,is_active_in_mvlog
                    ,currentness_in_pibics
                    ,create_date)
                VALUES
                    (r.lppcd
                    ,r.ownerage
                    ,r.nationcd
                    ,r.passportno
                    ,r.passportexpdte
                    ,'L'
                    ,'I'
                    ,coalesce(g_start_ts
                             ,l_start_ts)
                    ,r.is_active_in_mvlog
                    ,r.last_update_date
                    ,r.create_date);
            EXCEPTION
                WHEN dup_val_on_index THEN
                    UPDATE sync_blacklist_cases tgt
                    SET dml_type              = 'U'
                       ,dml_start_ts          = coalesce(g_start_ts
                                                        ,l_start_ts)
                       ,is_active_in_mvlog    = r.is_active_in_mvlog
                       ,currentness_in_pibics = r.last_update_date
                    WHERE r.lppcd = tgt.wlcd;
            END;
            DELETE FROM dl_staging4pibics.mv_log_lostpassport /*synonym*/ mvlog
            WHERE mvlog.lppcd = r.lppcd
            AND sequence$$ <= r.sequence$$;

            l_cnt := l_cnt + 1;

        END LOOP;
        COMMIT;
        IF l_cnt = 0 THEN
            pkg_utils.end_empty_step;
        ELSE
--            pkg_utils.update_sync_counter(p_tablenames => g_tablenames
--                                         ,p_min_date   => l_min_create_date
--                                         ,p_max_date   => l_max_create_date);
            pkg_utils.end_step(p_cnt        => l_cnt
                              ,p_tablenames => g_tablenames);
        END IF;

    END merge_synctable;

    PROCEDURE insert_synctable(p_yyyymm IN pkg_utils.yyyymm
                              ,p_tag    IN log_run_steps.tag%TYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope      logger_logs.scope%TYPE := g_log_scope_prefix || 'insert_synctable';
        l_cnt            PLS_INTEGER;
        l_cnt_duplicates PLS_INTEGER;
        l_start_ts       TIMESTAMP := systimestamp;
    BEGIN
        logger.log('START ' || p_yyyymm
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        g_step_params.timeframe := p_yyyymm;
        pkg_utils.start_step(p_step_params => g_step_params);

        INSERT INTO sync_blacklist_cases
            (wlcd
            ,ownerage
            ,nationcd
            ,passportno
            ,expirydate
            ,pibics_table_cd
            ,dml_type
            ,dml_start_ts
            ,is_active_in_mvlog
            ,currentness_in_pibics
            ,create_date)
            SELECT src.lppcd
                  ,src.ownerage
                  ,src.nationcd
                  ,src.passportno
                  ,src.passportexpdte
                  ,'L'
                  ,'L'
                  ,coalesce(g_start_ts
                           ,l_start_ts)
                  ,'Y'
                  ,coalesce(src.upddte
                           ,pkg_utils.get_begin_of_time) AS upddte
                  ,coalesce(trunc(src.credte)
                           ,pkg_utils.get_begin_of_time) AS create_date

            FROM dl_staging4pibics.lostpassport src
            WHERE pkg_utils.get_yyyymm(src.credte) = p_yyyymm;

        l_cnt := SQL%ROWCOUNT;
        --duplicate key errors during this phase dont bother us
        DELETE FROM err$_sync_blacklist_cases t
        WHERE t.ora_err_tag$ = p_tag
        AND t.ora_err_number$ = 1;
        l_cnt_duplicates := SQL%ROWCOUNT;
        COMMIT;
        IF l_cnt = 0 THEN
            pkg_utils.end_empty_step;
        ELSE
            IF l_cnt_duplicates > 0 THEN
                pkg_utils.record_event('Duplicate  rows ' || l_cnt_duplicates);
            END IF;
            pkg_utils.update_sync_counter(p_tablenames => g_tablenames
                                         ,p_yyyymm     => p_yyyymm);

            pkg_utils.end_step(p_cnt        => l_cnt
                              ,p_tablenames => g_tablenames);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Exception  with parameter value  ' || p_yyyymm);
            RAISE;
    END insert_synctable;

    --
    --  Public
    --

    PROCEDURE keep_current(p_tag IN log_run_steps.tag%TYPE) AS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_synonym_target VARCHAR2(100);
        l_run_params     pkg_utils.run_params;

    BEGIN
        l_run_params.process_name := gc_process_name;
        l_run_params.method       := pkg_utils.gc_method_copy;
        l_run_params.tag          := p_tag;
        g_start_ts                := systimestamp;
        pkg_utils.start_run(p_params => l_run_params);
        merge_synctable;
        pkg_bl_blacklist_cases.insert_target_lostpassport(p_tag => p_tag);

    END keep_current;

    PROCEDURE initial_load_for_yyyymm(p_yyyymm                 IN pkg_utils.yyyymm
                                     ,p_tag                    IN log_run_steps.tag%TYPE
                                     ,p_include_copy_to_target IN BOOLEAN) AS

        l_run_params pkg_utils.run_params;

    BEGIN
        l_run_params.process_name := gc_process_name;
        l_run_params.method       := pkg_utils.gc_method_load;
        l_run_params.tag          := p_tag;
        g_start_ts                := systimestamp;
        pkg_utils.start_run(p_params => l_run_params);

        insert_synctable(p_yyyymm => p_yyyymm
                        ,p_tag    => p_tag);
        IF p_include_copy_to_target THEN
            pkg_bl_blacklist_cases.insert_target_lostpassport(p_tag => p_tag);
        END IF;
    END initial_load_for_yyyymm;
    
BEGIN
    g_tablenames := pkg_utils.get_tablenames(gc_process_name);
    pkg_preferences.get_and_use_logger_preferences;
    g_step_params.table_name := g_tablenames.sync_table;
END pkg_st_lostpassport;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_LOSTPASSPORT" TO "PIBICSAPP";
