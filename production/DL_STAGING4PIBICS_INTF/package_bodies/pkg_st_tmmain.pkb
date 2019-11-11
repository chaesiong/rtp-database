CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_ST_TMMAIN" AS
    /*
       see architectural description at https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+Dermalog+staging+System+to+Bordercontrol

    */

    g_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    g_tablenames  pkg_utils.tablenames;
    g_step_params pkg_utils.step_params;
    g_start_ts    TIMESTAMP;

    PROCEDURE merge_synctable(p_lowest_tmrunno_to_copy  IN dl_staging4pibics.cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                             ,p_highest_tmrunno_to_copy IN dl_staging4pibics.cnt_tmmain.highest_tmrunno_to_copy%TYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope       logger_logs.scope%TYPE := g_log_scope_prefix || 'merge_sync_tables';
        l_cnt             PLS_INTEGER := 0;
        l_min_create_date DATE;
        l_max_create_date DATE;
        l_cnt_input       NUMBER;
        l_start_ts        TIMESTAMP := systimestamp;
    BEGIN
        pkg_utils.start_step(p_step_params => g_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        g_step_params.batchsize := 0;
        FOR r IN (SELECT seqno
                        ,credte AS create_date
                        ,inoutdte
                        ,tdtno
                        ,pkg_transcode.get_country(s.nationcd) AS issuectry
                        ,passportexpdte
                        ,tm6no
                        ,pkg_from_pibics.cardtype(s.cardtype) AS exitflg
                        ,coalesce(upddte
                                 ,credte) AS update_date
                  FROM tmmain_union s
                  WHERE tmrunno >= p_lowest_tmrunno_to_copy
                  AND tmrunno <= p_highest_tmrunno_to_copy)

        LOOP
            BEGIN
                INSERT INTO dl_staging4pibics_intf.sync_movements
                    (seqno
                    ,create_date
                    ,movement_dt
                    ,docno
                    ,issuectry
                    ,expirydate
                    ,tm6no
                    ,exitflg
                    ,is_active_in_mvlog
                    ,dml_type
                    ,dml_start_ts
                    ,currentness_in_pibics
                    ,pibics_table_cd)
                VALUES
                    (r.seqno
                    ,r.create_date
                    ,r.inoutdte
                    ,r.tdtno
                    ,r.issuectry
                    ,r.passportexpdte
                    ,r.tm6no
                    ,r.exitflg
                    ,'Y' -- r.is_active_in_mvlog
                    ,'I'
                    ,coalesce(g_start_ts
                             ,l_start_ts)
                    ,r.update_date
                    ,g_tablenames.pibics_table_cd);
            EXCEPTION
                WHEN dup_val_on_index THEN
                    UPDATE sync_movements tgt
                    SET dml_type              = 'U'
                       ,dml_start_ts          = coalesce(g_start_ts
                                                        ,l_start_ts)
                       ,is_active_in_mvlog    = 'Y'
                       ,currentness_in_pibics = r.update_date
                    WHERE tgt.seqno = r.seqno;

            END;
            l_cnt := l_cnt + 1;
        END LOOP;

        UPDATE dl_staging4pibics.cnt_tmmain
        SET copied_cnt_sync = l_cnt
           ,copied_at_sync  = SYSDATE
        WHERE highest_tmrunno_to_copy = p_highest_tmrunno_to_copy;
        COMMIT;
        pkg_utils.update_sync_counter(p_tablenames => g_tablenames);
        pkg_utils.end_step(p_cnt        => l_cnt
                          ,p_tablenames => g_tablenames);

    END merge_synctable;

    --
    --  Public
    --

    PROCEDURE copy_to_target(p_lowest_tmrunno_to_copy  IN dl_staging4pibics.cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                            ,p_highest_tmrunno_to_copy IN dl_staging4pibics.cnt_tmmain.highest_tmrunno_to_copy%TYPE
                            ,p_tag                     IN log_run_steps.tag%TYPE) AS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope      logger_logs.scope%TYPE := g_log_scope_prefix || 'keep_current';
        l_synonym_target VARCHAR2(100);
        l_run_params     pkg_utils.run_params;

    BEGIN
        l_run_params.process_name := gc_process_name;
        l_run_params.method       := pkg_utils.gc_method_copy;
        l_run_params.tag          := p_tag;
        g_start_ts                := systimestamp;
        logger.log('START'
                  ,l_log_scope);
        pkg_utils.start_run(p_params => l_run_params);
        merge_synctable(p_lowest_tmrunno_to_copy  => p_lowest_tmrunno_to_copy
                       ,p_highest_tmrunno_to_copy => p_highest_tmrunno_to_copy);

        pkg_bc_movements.insert_target_tmmain(p_lowest_tmrunno_to_copy  => p_lowest_tmrunno_to_copy
                                             ,p_highest_tmrunno_to_copy => p_highest_tmrunno_to_copy
                                             ,p_tag                     => p_tag);
        logger.log('END'
                  ,l_log_scope);
    END copy_to_target;

BEGIN
    g_tablenames := pkg_utils.get_tablenames(gc_process_name);
    pkg_preferences.get_and_use_logger_preferences;
    g_step_params.table_name := g_tablenames.sync_table;
END pkg_st_tmmain;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMMAIN" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMMAIN" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMMAIN" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMMAIN" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_ST_TMMAIN" TO "BIOSAADM";
