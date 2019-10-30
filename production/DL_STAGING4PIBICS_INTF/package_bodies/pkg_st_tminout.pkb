CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_ST_TMINOUT" AS
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
    BEGIN
        pkg_utils.start_step(p_step_params => g_step_params);
        SELECT COUNT(*)
        INTO l_cnt_input
        FROM dl_staging4pibics.mv_log_tminout;
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
                       (SELECT seqno
                             ,dmltype$$
                             ,sequence$$
                             ,row_number() over(PARTITION BY seqno ORDER BY sequence$$ DESC) AS rn
                       FROM dl_staging4pibics.mv_log_tminout /* synonym */
                       ),
                      mv_last_row AS
                       (SELECT seqno
                             ,CASE
                                  WHEN dmltype$$ IN ('I'
                                                    ,'U') THEN
                                   'Y'
                                  ELSE
                                   'N'
                              END AS is_active_in_mvlog
                             ,sequence$$
                       FROM basis
                       WHERE rn = 1)
                      SELECT m.seqno
                            ,m.is_active_in_mvlog
                            ,s.tdtno
                            ,s.passportexpdte
                            ,pkg_transcode.get_country(s.nationcd) AS issuectry
                            ,coalesce(s.update_date
                                     ,pkg_utils.get_begin_of_time) AS last_update_date
                            ,s.tm6no
                            ,s.inoutdte
                            ,s.update_date
                            ,pkg_from_pibics.cardtype(s.cardtype) AS exitflg
                            ,trunc(s.create_date) AS create_date
                      FROM mv_last_row m
                      INNER JOIN dl_staging4pibics.tminout s /* left join because deletions */
                      ON s.seqno = m.seqno)

        LOOP
            l_min_create_date := least(l_min_create_date
                                      ,r.last_update_date);
            l_max_create_date := greatest(l_min_create_date
                                         ,r.last_update_date);
            BEGIN
                INSERT INTO dl_staging4pibics_intf.sync_movements
                    (seqno
                    ,create_date
                    ,movement_dt
                    ,docno
                    ,issuectry
                    ,expirydate
                    ,tm6no
                    ,is_active_in_mvlog
                    ,dml_type
                    ,dml_start_ts
                    ,currentness_in_pibics
                    ,pibics_table_cd
                    ,exitflg)
                VALUES
                    (r.seqno
                    ,r.create_date
                    ,r.inoutdte
                    ,r.tdtno
                    ,r.issuectry
                    ,r.passportexpdte
                    ,r.tm6no
                    ,r.is_active_in_mvlog
                    ,'I'
                    ,coalesce(g_start_ts
                             ,l_start_ts)
                    ,r.update_date
                    ,g_tablenames.pibics_table_cd
                    , r.exitflg);
            EXCEPTION
                WHEN dup_val_on_index THEN
                    UPDATE sync_movements tgt
                    SET dml_type              = 'U'
                       ,dml_start_ts          = coalesce(g_start_ts
                                                        ,l_start_ts)
                       ,is_active_in_mvlog    = r.is_active_in_mvlog
                       ,currentness_in_pibics = r.last_update_date
                    WHERE tgt.seqno = r.seqno;

            END;
            l_cnt := l_cnt + 1;
        END LOOP;

        COMMIT;
--        pkg_utils.update_sync_counter(p_tablenames => g_tablenames
--                                     ,p_min_date   => l_min_create_date
--                                     ,p_max_date   => l_max_create_date);
        pkg_utils.end_step(p_cnt        => l_cnt
                          ,p_tablenames => g_tablenames);

    END merge_synctable;

    PROCEDURE insert_synctable(p_yyyymm IN pkg_utils.yyyymm
                              ,p_tag    IN log_run_steps.tag%TYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope logger_logs.scope%TYPE := g_log_scope_prefix || 'insert_sync_movements';
        l_cnt       PLS_INTEGER;
        l_start_ts  TIMESTAMP := systimestamp;
    BEGIN
        logger.log('START ' || p_yyyymm
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        g_step_params.timeframe := p_yyyymm;
        pkg_utils.start_step(p_step_params => g_step_params);

        INSERT INTO sync_movements
            (seqno
            ,create_date
            ,movement_dt
            ,docno
            ,issuectry
            ,expirydate
            ,tm6no
            ,is_active_in_mvlog
            ,dml_type
            ,dml_start_ts
            ,currentness_in_pibics
            ,pibics_table_cd
            ,exitflg)
            SELECT CAST(seqno AS NUMBER) crew_seqno
                  ,coalesce(create_date
                           ,pkg_utils.get_begin_of_time)
                  ,inoutdte
                  ,tdtno
                  ,pkg_transcode.get_country(s.nationcd)
                  ,s.passportexpdte
                  ,s.tdtno
                  ,'Y' AS is_active_in_mvlog
                  ,'L' AS dml_type
                  ,coalesce(g_start_ts
                           ,l_start_ts)
                  ,coalesce(update_date
                           ,pkg_utils.get_begin_of_time)
                  ,g_tablenames.pibics_table_cd
                  ,pkg_from_pibics.cardtype(cardtype) AS exitflg
            FROM dl_staging4pibics.tminout s
            WHERE pkg_utils.get_yyyymm(update_date) = p_yyyymm;
        l_cnt := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.update_sync_counter(p_tablenames => g_tablenames
                                     ,p_yyyymm     => p_yyyymm);

        pkg_utils.end_step(p_cnt        => l_cnt
                          ,p_tablenames => g_tablenames);

    END insert_synctable;

    --
    --  Public
    --

    PROCEDURE keep_current(p_tag IN log_run_steps.tag%TYPE) AS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope      logger_logs.scope%TYPE := g_log_scope_prefix || 'keep_current';
        l_synonym_target VARCHAR2(100);
        l_run_params     pkg_utils.run_params;

    BEGIN
        l_run_params.process_name := gc_process_name;
        l_run_params.method       := pkg_utils.gc_method_copy;
        l_run_params.tag          := p_tag;
        g_start_ts                := systimestamp;
        pkg_utils.start_run(p_params => l_run_params);
        SELECT table_owner || '.' || table_name
        INTO l_synonym_target
        FROM all_synonyms
        WHERE table_owner = pkg_utils.gc_staging_schema
        AND synonym_name = g_tablenames.mv_synonym;
        logger.log('synonym ' || pkg_utils.gc_staging_schema || '.' || g_tablenames.mv_synonym || ' points to : ' ||
                   l_synonym_target
                  ,l_log_scope);
        merge_synctable;

        pkg_bc_movements.insert_target(p_tag => p_tag);
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
            pkg_bc_movements.insert_target(p_tag => p_tag);
        END IF;
    END initial_load_for_yyyymm;

BEGIN
    g_tablenames := pkg_utils.get_tablenames(gc_process_name);
    pkg_preferences.get_and_use_logger_preferences;
    g_step_params.table_name := g_tablenames.sync_table;
END pkg_st_tminout;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMINOUT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMINOUT" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMINOUT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMINOUT" TO "BIOSUPPORT";
