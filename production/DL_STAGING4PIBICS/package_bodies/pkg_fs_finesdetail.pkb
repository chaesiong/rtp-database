CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_FS_FINESDETAIL" AS

    gc_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    --
    -- P U B L I C
    --

    PROCEDURE merge_yyyymmdd(p_step_params IN pkg_utils.step_params) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_step_status pkg_utils.step_status;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'merge_yyyymmdd';
        --
        l_cnt_already_processed NUMBER;
    BEGIN
        pkg_utils.start_step(p_step_params => p_step_params);

        l_step_status.start_ts := systimestamp;

        l_cnt_already_processed := pkg_utils.get_already_processed(p_table_name           => p_step_params.table_name
                                                                  ,p_create_date_yyyymmdd => p_step_params.timeframe);
        IF l_cnt_already_processed > 0 THEN
            logger.log(p_step_params.table_name || ' ' || p_step_params.timeframe || '  data already processed.'
                      ,l_log_scope);
        END IF;

        MERGE INTO fs_finesdetail tgt
        USING (SELECT finesdetail_seqno
                     ,fines_seqno
                     ,prate_seqno
                     ,fineslipamount
                     ,overstayday
                     ,create_by
                     ,create_date
                     ,create_ip
                     ,update_by
                     ,update_date
                     ,update_ip
                     ,version
               FROM fs_finesdetail@pibics
               WHERE pkg_utils.get_yyyymmdd(p_date => create_date) = p_step_params.timeframe) src
        ON (src.finesdetail_seqno = tgt.finesdetail_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (finesdetail_seqno
                ,fines_seqno
                ,prate_seqno
                ,fineslipamount
                ,overstayday
                ,create_by
                ,create_date
                ,create_ip
                ,update_by
                ,update_date
                ,update_ip
                ,version)
            VALUES
                (src.finesdetail_seqno
                ,src.fines_seqno
                ,src.prate_seqno
                ,src.fineslipamount
                ,src.overstayday
                ,src.create_by
                ,src.create_date
                ,src.create_ip
                ,src.update_by
                ,src.update_date
                ,src.update_ip
                ,src.version)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.fines_seqno    = src.fines_seqno
               ,tgt.prate_seqno    = src.prate_seqno
               ,tgt.fineslipamount = src.fineslipamount
               ,tgt.overstayday    = src.overstayday
               ,tgt.create_by      = src.create_by
               ,tgt.create_date    = src.create_date
               ,tgt.create_ip      = src.create_ip
               ,tgt.update_by      = src.update_by
               ,tgt.update_date    = src.update_date
               ,tgt.update_ip      = src.update_ip
               ,tgt.version        = src.version;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        logger.log(p_step_params.table_name || ' ' || p_step_params.timeframe || ' , cnt: ' ||
                   l_step_status.cnt_processed
                  ,l_log_scope);
        pkg_utils.update_staging_counter(pi_table_name => p_step_params.table_name
                                        ,pi_yyyymmdd   => p_step_params.timeframe);
        pkg_utils.end_step(p_step_status => l_step_status);

    END merge_yyyymmdd;

    PROCEDURE insert_yyyymm(p_step_params IN pkg_utils.step_params) IS
        PRAGMA AUTONOMOUS_TRANSACTION;

        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'insert_yyyymm';
        l_step_status pkg_utils.step_status;
        --
    BEGIN
        pkg_utils.start_step(p_step_params => p_step_params);
        l_step_status.start_ts := systimestamp;
        INSERT INTO fs_finesdetail
            (finesdetail_seqno
            ,fines_seqno
            ,prate_seqno
            ,fineslipamount
            ,overstayday
            ,create_by
            ,create_date
            ,create_ip
            ,update_by
            ,update_date
            ,update_ip
            ,version)
            SELECT finesdetail_seqno
                  ,fines_seqno
                  ,prate_seqno
                  ,fineslipamount
                  ,overstayday
                  ,create_by
                  ,create_date
                  ,create_ip
                  ,update_by
                  ,update_date
                  ,update_ip
                  ,version
            FROM fs_finesdetail@pibics
            WHERE pkg_utils.get_yyyymm(p_date => create_date) = p_step_params.timeframe;
        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        logger.log(p_step_params.table_name || ' ' || p_step_params.timeframe || ' , cnt: ' ||
                   l_step_status.cnt_processed
                  ,l_log_scope);
        pkg_utils.update_staging_counter(pi_table_name => p_step_params.table_name
                                        ,pi_yyyymm     => p_step_params.timeframe);
        pkg_utils.end_step(p_step_status => l_step_status);

    EXCEPTION
        WHEN dup_val_on_index THEN
            pkg_utils.note_step_event(p_messsage => pkg_utils.gc_txt_duplicate_key_error);
            pkg_utils.end_step(p_step_status => l_step_status);
            RAISE;
    END insert_yyyymm;

END pkg_fs_finesdetail;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_FS_FINESDETAIL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_FS_FINESDETAIL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_FS_FINESDETAIL" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_FS_FINESDETAIL" TO "BIOSAADM";
