CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_UTILS" AS
    gc_begin_of_time CONSTANT DATE := to_date('19700101'
                                             ,'YYYYMMDD');

    g_status log_run_steps%ROWTYPE;

    FUNCTION get_top_level_program_unit RETURN VARCHAR2 IS
        l_level PLS_INTEGER;
    BEGIN
        l_level := utl_call_stack.dynamic_depth() - 1;
        -- top of the call stack is anonymous block or something which is not relevant, so we subtract 1
        RETURN utl_call_stack.owner(l_level) || '.' || utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(l_level));
    END get_top_level_program_unit;

    FUNCTION get_calling_program_unit RETURN VARCHAR2 IS
        l_level PLS_INTEGER;
    BEGIN
        l_level := 3;
        -- top of the call stack is anonymous block or something which is not relevant, so we subtract 1
        RETURN utl_call_stack.owner(l_level) || '.' || utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(l_level));
    END get_calling_program_unit;

    FUNCTION is_warning_impl(p_errormessage IN VARCHAR2) RETURN PLS_INTEGER IS
    BEGIN
        IF substr(p_errormessage
                 ,1
                 ,9) IN ('ORA-00001') THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END is_warning_impl;

    PROCEDURE record_event(p_event IN log_run_steps.events%TYPE) IS
    BEGIN
        g_status.events := ltrim(g_status.events || ';' || p_event
                                ,';');
    END record_event;

    PROCEDURE record_error_and_end_step(p_event IN log_run_steps.events%TYPE) IS
    BEGIN
        record_event(p_event => p_event);
        end_step(p_cnt => -1);
        logger.log_error(p_event
                        ,get_calling_program_unit);
    END record_error_and_end_step;

    FUNCTION prep_update_sc_stmt(p_tablenames IN tablenames) RETURN VARCHAR2 IS

        l_stmt_3cols      VARCHAR2(4000) := q'[
       MERGE INTO dl_staging4pibics_intf.CNT_SYNC  tgt
        USING (SELECT trunc(create_date) create_date
                     ,COUNT(*) COUNT
                     ,coalesce(SUM(CASE WHEN coalesce(#KEYCOL_LIST# ,NULL) IS NULL AND row_shall_be_ignored  ='N'  THEN   1   ELSE  0  END)  ,0) AS to_insert
                     ,pibics_table_cd
                     ,SUM ( CASE   WHEN currentness_in_pibics >  coalesce ( currentness_in_bc ,currentness_in_pibics )   AND row_shall_be_ignored  ='N'  THEN 1   ELSE 0     END ) AS to_update
                     ,sum ( case when row_shall_be_ignored  ='N' then 0 else 1 end ) as to_be_ignored
             FROM #SYNCTABNAM# where  #WHERECOND#
                 GROUP BY trunc(create_date), pibics_table_cd  )  src
        ON (src.create_date = tgt.create_date_day  AND (tgt.pibics_table_cd  = src.pibics_table_cd OR( tgt.pibics_table_cd is NULL AND  src.pibics_table_cd is NULL ))  AND tgt.sync_table_name = '#SYNCTABNAM#')
        WHEN NOT MATCHED THEN
            INSERT
                ( sync_table_name
                ,pibics_table_cd
                ,create_date_day
                ,COUNT
                ,to_insert
                ,to_update
                ,to_be_ignored
                ,dml_at)
            VALUES
                ('#SYNCTABNAM#'
                ,src.pibics_table_cd
                ,src.create_date
                ,src.count
                ,src.to_insert
                ,src.to_update
                ,src.to_be_ignored
               ,systimestamp)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.count  = src.count
               ,tgt.dml_at = SYSDATE
               ,tgt.to_insert = src.to_insert
               ,tgt.to_update = src.to_update
               ,tgt.to_be_ignored = src.to_be_ignored
               ]';
        l_key_column_list ops_backend_processes.key_column_list%TYPE;
        l_stmt2           VARCHAR2(4000);
    BEGIN
        SELECT key_column_list
        INTO l_key_column_list
        FROM ops_backend_processes
        WHERE sync_table_name = p_tablenames.sync_table
        AND backend_table_name = p_tablenames.backend_table
        AND ((pibics_table_cd IS NULL AND p_tablenames.pibics_table_cd IS NULL) OR
              pibics_table_cd = p_tablenames.pibics_table_cd);

        l_stmt2 := REPLACE(srcstr => l_stmt_3cols
                          ,oldsub => '#SYNCTABNAM#'
                          ,newsub => upper(p_tablenames.sync_table));

        RETURN REPLACE(srcstr => l_stmt2
                      ,oldsub => '#KEYCOL_LIST#'
                      ,newsub => upper(l_key_column_list));
    END prep_update_sc_stmt;

    --
    --
    -- P U B L I C
    --
    --
    FUNCTION get_begin_of_time RETURN DATE DETERMINISTIC IS
    BEGIN
        RETURN gc_begin_of_time;
    END get_begin_of_time;

    FUNCTION get_trunc_date(p_date IN DATE) RETURN DATE DETERMINISTIC IS
    BEGIN
        IF p_date IS NULL THEN
            RETURN trunc(gc_begin_of_time);
        ELSE
            RETURN trunc(p_date);
        END IF;
    END get_trunc_date;
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

    FUNCTION is_warning(p_errormessage IN VARCHAR2) RETURN PLS_INTEGER DETERMINISTIC
    --1 => true, 0 => false
     IS
    BEGIN
        RETURN is_warning_impl(p_errormessage);
    END is_warning;

    FUNCTION is_error(p_errormessage IN VARCHAR2) RETURN PLS_INTEGER DETERMINISTIC
    --1 => true, 0 => false
     IS
    BEGIN
        IF is_warning_impl(p_errormessage) = 0 THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END is_error;

    FUNCTION get_tablenames(p_processname IN table_name) RETURN tablenames IS
        l_res tablenames;
    BEGIN
        -- every SQL problem here shows that the metadata is wrong and shall abort the run
        SELECT 'MV_LOG_' || st.process_name AS mv_synonym_name
              ,sy.sync_table_name
              ,sy.error_table_name
              ,sy.pibics_table_cd
              ,backend_table_name
        INTO l_res
        FROM dl_staging4pibics_intf.ops_staging_processes st
        LEFT JOIN dl_staging4pibics_intf.ops_sync_processes sy
        ON sy.staging_table_name = st.process_name
        LEFT JOIN dl_staging4pibics_intf.ops_backend_processes bp
        ON bp.sync_table_name = sy.sync_table_name
        WHERE st.kind = 'B'
        AND upper(process_name) = upper(p_processname)
        AND rownum = 1;
        RETURN l_res;
    END get_tablenames;

    FUNCTION get_tablenames_backend(p_sync_table_name IN table_name
                                   ,p_pibics_table_cd IN VARCHAR2) RETURN tablenames IS
        l_res tablenames;
    BEGIN
        -- every SQL problem here shows that the metadata is wrong and shall abort the run
        SELECT NULL AS mv_synonym_name
              ,sync_table_name
              ,error_table_name
              ,pibics_table_cd
              ,backend_table_name
        INTO l_res
        FROM dl_staging4pibics_intf.ops_backend_processes bp
        WHERE sync_table_name = p_sync_table_name
        AND ((pibics_table_cd IS NULL AND p_pibics_table_cd IS NULL) OR pibics_table_cd = p_pibics_table_cd);

        RETURN l_res;
    END get_tablenames_backend;

    FUNCTION get_tablenames_backend RETURN tablenames_tab IS
        l_res pkg_utils.tablenames_tab;
        l_tmp tablenames;
    BEGIN
        l_res := pkg_utils.tablenames_tab();
        FOR r IN (SELECT NULL                  AS mv_synonym_name
                        ,bp.sync_table_name
                        ,bp.error_table_name
                        ,NULL                  AS pibics_table_cd
                        ,bp.backend_table_name
                  FROM dl_staging4pibics_intf.ops_backend_processes bp
                  WHERE sync_table_name IS NOT NULL
                  AND shall_be_synced = 'Y')
        LOOP
            l_res.extend();
            l_tmp.mv_synonym := r.mv_synonym_name;
            l_tmp.sync_table := r.sync_table_name;
            l_tmp.error_table := r.error_table_name;
            l_tmp.pibics_table_cd := r.pibics_table_cd;
            l_tmp.backend_table := r.backend_table_name;
            l_res(l_res.last) := l_tmp;
        END LOOP;
        RETURN l_res;
    END get_tablenames_backend;

    PROCEDURE start_run(p_params IN run_params) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        SELECT sys_context('USERENV'
                          ,'SID')
        INTO g_status.session_sid
        FROM dual;
        g_status.topic        := p_params.process_name || ' ' || p_params.method;
        g_status.tag          := coalesce(p_params.tag
                                         ,sys_context('USERENV'
                                                     ,'CLIENT_INFO')
                                         ,'?');
        g_status.program_unit := get_top_level_program_unit;
        g_status.called_by    := dl_common.pkg_session.get_audit_user;
        g_status.run_id       := sys_guid;

    END start_run;

    PROCEDURE start_step(p_step_params IN step_params) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_default_run_params run_params;
    BEGIN
        g_status.start_ts := systimestamp;

        g_status.subtopic  := p_step_params.table_name;
        g_status.timeframe := p_step_params.timeframe;
        g_status.batchsize := p_step_params.batchsize;
        g_status.events    := NULL;
        IF g_status.run_id IS NULL THEN
            l_default_run_params.process_name := p_step_params.table_name;
            start_run(p_params => l_default_run_params);
        END IF;
        INSERT INTO log_run_steps
            (run_id
            ,topic
            ,session_sid
            ,tag
            ,program_unit
            ,called_by
            ,subtopic
            ,start_ts
            ,timeframe
            ,batchsize)
        VALUES
            (g_status.run_id
            ,g_status.topic
            ,g_status.session_sid
            ,g_status.tag
            ,g_status.program_unit
            ,g_status.called_by
            ,g_status.subtopic
            ,g_status.start_ts
            ,g_status.timeframe
            ,g_status.batchsize)
        RETURNING step_id INTO g_status.step_id;

        COMMIT;
    END start_step;

    PROCEDURE end_step(p_cnt        IN NUMBER
                      ,p_tablenames IN tablenames) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_stmt_select      VARCHAR2(1000);
        l_stmt_delete      VARCHAR2(1000);
        l_errcnt           NUMBER := 0;
        l_warncnt          NUMBER := 0;
        l_table_name       process_name;
        l_calling_programn VARCHAR2(100);
    BEGIN
        IF g_status.step_id IS NULL THEN
            start_step(p_step_params => NULL);
        END IF;
        IF p_tablenames.mv_synonym IS NOT NULL THEN
            l_table_name := p_tablenames.sync_table;
        ELSE
            l_table_name := p_tablenames.backend_table;
        END IF;
        l_calling_programn := get_calling_program_unit;
        IF (p_cnt) = 0 THEN
            logger.log_info('No data processed'
                           ,l_calling_programn);
        END IF;
        IF p_tablenames.error_table IS NOT NULL
           AND g_status.tag IS NOT NULL THEN
            l_stmt_select := ' SELECT  SUM(pkg_utils.is_error(ora_err_mesg$) ) ,SUM(pkg_utils.is_warning(ora_err_mesg$) ) ' ||
                             ' INTO :l_errcnt,:l_warncnt  FROM ' || p_tablenames.error_table ||
                             '  WHERE     ora_err_tag$ = :p_ora_err_tag$ ';
            EXECUTE IMMEDIATE l_stmt_select
                INTO l_errcnt, l_warncnt
                USING g_status.tag;

            IF l_errcnt > 0 THEN
                record_event(l_errcnt || ' Errors');
                logger.log_warning('Errors occured in table  ' || l_table_name || ' , cnt is ' || l_errcnt
                                  ,l_calling_programn);

            END IF;

            IF l_warncnt > 0 THEN
                l_stmt_delete := ' DELETE  FROM ' || p_tablenames.error_table ||
                                 '  WHERE   ora_err_tag$ = :p_ora_err_tag$ and pkg_utils.is_warning(ora_err_mesg$) = 1 ';
                EXECUTE IMMEDIATE l_stmt_delete
                    USING g_status.tag;
                record_event(l_warncnt || ' warnings');
                logger.log_warning('Warnings occured in table  ' || l_table_name || ' , cnt is ' || l_warncnt
                                  ,l_calling_programn);

            END IF;
        END IF;
        UPDATE log_run_steps
        SET cnt_processed = p_cnt
           ,events        = g_status.events
           ,end_ts        = systimestamp
        WHERE step_id = g_status.step_id;
        COMMIT;
    END end_step;

    PROCEDURE end_step(p_cnt IN NUMBER) IS
    BEGIN
        IF g_status.step_id IS NULL THEN
            start_step(p_step_params => NULL);
        END IF;
        IF p_cnt = 0 THEN
            record_event('no data produced');
        END IF;
        UPDATE log_run_steps
        SET cnt_processed = p_cnt
           ,events        = g_status.events
           ,end_ts        = systimestamp
        WHERE step_id = g_status.step_id;
        COMMIT;
    END end_step;

    PROCEDURE end_empty_step IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        UPDATE log_run_steps
        SET cnt_processed = 0
           ,events        = 'NO DATA'
           ,end_ts        = systimestamp
        WHERE step_id = g_status.step_id;
        COMMIT;
    END end_empty_step;

    FUNCTION get_status RETURN log_run_steps%ROWTYPE IS
    BEGIN
        RETURN g_status;
    END get_status;

    PROCEDURE update_sync_counter(p_tablenames IN tablenames
                                 ,p_yyyymm     IN yyyymm) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_stmt VARCHAR2(4000);
    BEGIN
        l_stmt := REPLACE(srcstr => prep_update_sc_stmt(p_tablenames => p_tablenames)
                         ,oldsub => '#WHERECOND#'
                         ,newsub => 'pkg_utils.get_yyyymm(create_date) = ''' || p_yyyymm || '''');
        EXECUTE IMMEDIATE l_stmt;
        COMMIT;

    END update_sync_counter;

    PROCEDURE update_sync_counter(p_tablenames IN tablenames
                                 ,p_min_date   IN DATE
                                 ,p_max_date   IN DATE) IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_stmt VARCHAR2(4000);
    BEGIN
        l_stmt := REPLACE(srcstr => prep_update_sc_stmt(p_tablenames => p_tablenames)
                         ,oldsub => '#WHERECOND#'
                         ,newsub => 'trunc(create_date)  between  trunc(' || p_min_date || ') and trunc(' || p_max_date || ')');
        EXECUTE IMMEDIATE l_stmt;
        COMMIT;

    END update_sync_counter;

    PROCEDURE update_sync_counter(p_tablenames IN tablenames) IS

        l_stmt VARCHAR2(4000);
    BEGIN
        l_stmt := REPLACE(srcstr => prep_update_sc_stmt(p_tablenames => p_tablenames)
                         ,oldsub => '#WHERECOND#'
                         ,newsub => '1=1');
        dbms_output.put_line(l_stmt);
        EXECUTE IMMEDIATE l_stmt;
        COMMIT;

    END update_sync_counter;
    
    PROCEDURE reset_sync_counter(p_sync_table      IN table_name
                                ,p_pibics_table_cd IN dl_staging4pibics_intf.ops_sync_processes.pibics_table_cd%TYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        IF p_pibics_table_cd IS NULL THEN
            DELETE FROM dl_staging4pibics_intf.cnt_sync
            WHERE sync_table_name = upper(p_sync_table);
        ELSE
            DELETE FROM dl_staging4pibics_intf.cnt_sync
            WHERE sync_table_name = upper(p_sync_table)
            AND pibics_table_cd = upper(p_pibics_table_cd);
        END IF;
        COMMIT;
    END reset_sync_counter;

    PROCEDURE update_transcode_counter(p_trcd_table IN table_name) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        EXECUTE IMMEDIATE '
        MERGE INTO cnt_transcode tgt
        USING (SELECT ''' || upper(p_trcd_table) ||
                          ''' AS trcd_table_name
                     ,(SELECT COUNT(*) FROM ' || upper(p_trcd_table) ||
                          ' ) AS COUNT
                     ,SYSDATE      AS dml_at
               FROM dual) src
        ON (src.trcd_table_name = tgt.trcd_table_name)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.count  = src.count
               ,tgt.dml_at = src.dml_at
        WHEN NOT MATCHED THEN
            INSERT
                (trcd_table_name
                ,COUNT
                ,dml_at)
            VALUES
                (src.trcd_table_name
                ,src.count
                ,src.dml_at)';
        COMMIT;
    END update_transcode_counter;

    PROCEDURE reset_transcode_counter(p_trcd_table IN table_name) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        MERGE INTO cnt_transcode tgt
        USING (SELECT p_trcd_table AS trcd_table_name
                     ,0            AS COUNT
                     ,SYSDATE      AS dml_at
               FROM dual) src
        ON (src.trcd_table_name = tgt.trcd_table_name)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.count  = src.count
               ,tgt.dml_at = src.dml_at
        WHEN NOT MATCHED THEN
            INSERT
                (trcd_table_name
                ,COUNT
                ,dml_at)
            VALUES
                (src.trcd_table_name
                ,src.count
                ,src.dml_at);
        COMMIT;
    END reset_transcode_counter;

END pkg_utils;

--
--   Public
--
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_UTILS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_UTILS" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_UTILS" TO "TRAINEE";
