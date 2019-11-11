CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_FS_FINES" AS

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

        MERGE INTO fs_fines tgt
        USING (SELECT fines_seqno
                     ,finesno
                     ,fineslipno
                     ,fineslipbookno
                     ,fineslipdate
                     ,printflag
                     ,fineslipamount
                     ,chargedof
                     ,chargeno
                     ,dept_seqno
                     ,passportno
                     ,tm6no
                     ,efirstnm
                     ,emiddlenm
                     ,efamilynm
                     ,sex
                     ,birthdte
                     ,nation_seqno
                     ,conv_seqno
                     ,convregno
                     ,indte
                     ,visatype_seqno
                     ,visaexpdte
                     ,outdte
                     ,finestatus
                     ,finesremark
                     ,flag_system
                     ,create_by
                     ,create_date
                     ,create_ip
                     ,update_by
                     ,update_date
                     ,update_ip
                     ,version
                     ,permit_seqno
                     ,permit_date
                     ,sliptype
                     ,suffix_seqno
                     ,tfamilynm
                     ,tfirstnm
                     ,staff_seqno
               FROM fs_fines@pibics
               WHERE pkg_utils.get_yyyymmdd(p_date => create_date) = p_step_params.timeframe) src
        ON (src.fines_seqno = tgt.fines_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (fines_seqno
                ,finesno
                ,fineslipno
                ,fineslipbookno
                ,fineslipdate
                ,printflag
                ,fineslipamount
                ,chargedof
                ,chargeno
                ,dept_seqno
                ,passportno
                ,tm6no
                ,efirstnm
                ,emiddlenm
                ,efamilynm
                ,sex
                ,birthdte
                ,nation_seqno
                ,conv_seqno
                ,convregno
                ,indte
                ,visatype_seqno
                ,visaexpdte
                ,outdte
                ,finestatus
                ,finesremark
                ,flag_system
                ,create_by
                ,create_date
                ,create_ip
                ,update_by
                ,update_date
                ,update_ip
                ,version
                ,permit_seqno
                ,permit_date
                ,sliptype
                ,suffix_seqno
                ,tfamilynm
                ,tfirstnm
                ,staff_seqno

                 )
            VALUES
                (src.fines_seqno
                ,src.finesno
                ,src.fineslipno
                ,src.fineslipbookno
                ,src.fineslipdate
                ,src.printflag
                ,src.fineslipamount
                ,src.chargedof
                ,src.chargeno
                ,src.dept_seqno
                ,src.passportno
                ,src.tm6no
                ,src.efirstnm
                ,src.emiddlenm
                ,src.efamilynm
                ,src.sex
                ,src.birthdte
                ,src.nation_seqno
                ,src.conv_seqno
                ,src.convregno
                ,src.indte
                ,src.visatype_seqno
                ,src.visaexpdte
                ,src.outdte
                ,src.finestatus
                ,src.finesremark
                ,src.flag_system
                ,src.create_by
                ,src.create_date
                ,src.create_ip
                ,src.update_by
                ,src.update_date
                ,src.update_ip
                ,src.version
                ,src.permit_seqno
                ,src.permit_date
                ,src.sliptype
                ,src.suffix_seqno
                ,src.tfamilynm
                ,src.tfirstnm
                ,src.staff_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.finesno        = src.finesno
               ,tgt.fineslipno     = src.fineslipno
               ,tgt.fineslipbookno = src.fineslipbookno
               ,tgt.fineslipdate   = src.fineslipdate
               ,tgt.printflag      = src.printflag
               ,tgt.fineslipamount = src.fineslipamount
               ,tgt.chargedof      = src.chargedof
               ,tgt.chargeno       = src.chargeno
               ,tgt.dept_seqno     = src.dept_seqno
               ,tgt.passportno     = src.passportno
               ,tgt.tm6no          = src.tm6no
               ,tgt.efirstnm       = src.efirstnm
               ,tgt.emiddlenm      = src.emiddlenm
               ,tgt.efamilynm      = src.efamilynm
               ,tgt.sex            = src.sex
               ,tgt.birthdte       = src.birthdte
               ,tgt.nation_seqno   = src.nation_seqno
               ,tgt.conv_seqno     = src.conv_seqno
               ,tgt.convregno      = src.convregno
               ,tgt.indte          = src.indte
               ,tgt.visatype_seqno = src.visatype_seqno
               ,tgt.visaexpdte     = src.visaexpdte
               ,tgt.outdte         = src.outdte
               ,tgt.finestatus     = src.finestatus
               ,tgt.finesremark    = src.finesremark
               ,tgt.flag_system    = src.flag_system
               ,tgt.create_by      = src.create_by
               ,tgt.create_date    = src.create_date
               ,tgt.create_ip      = src.create_ip
               ,tgt.update_by      = src.update_by
               ,tgt.update_date    = src.update_date
               ,tgt.update_ip      = src.update_ip
               ,tgt.version        = src.version
               ,tgt.permit_seqno   = src.permit_seqno
               ,tgt.permit_date    = src.permit_date
               ,tgt.sliptype       = src.sliptype
               ,tgt.suffix_seqno   = src.suffix_seqno
               ,tgt.tfamilynm      = src.tfamilynm
               ,tgt.tfirstnm       = src.tfirstnm
               ,tgt.staff_seqno    = src.staff_seqno;

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
        INSERT INTO fs_fines
            (fines_seqno
            ,finesno
            ,fineslipno
            ,fineslipbookno
            ,fineslipdate
            ,printflag
            ,fineslipamount
            ,chargedof
            ,chargeno
            ,dept_seqno
            ,passportno
            ,tm6no
            ,efirstnm
            ,emiddlenm
            ,efamilynm
            ,sex
            ,birthdte
            ,nation_seqno
            ,conv_seqno
            ,convregno
            ,indte
            ,visatype_seqno
            ,visaexpdte
            ,outdte
            ,finestatus
            ,finesremark
            ,flag_system
            ,create_by
            ,create_date
            ,create_ip
            ,update_by
            ,update_date
            ,update_ip
            ,version
            ,permit_seqno
            ,permit_date
            ,sliptype
            ,suffix_seqno
            ,tfamilynm
            ,tfirstnm
            ,staff_seqno)
            SELECT fines_seqno
                  ,finesno
                  ,fineslipno
                  ,fineslipbookno
                  ,fineslipdate
                  ,printflag
                  ,fineslipamount
                  ,chargedof
                  ,chargeno
                  ,dept_seqno
                  ,passportno
                  ,tm6no
                  ,efirstnm
                  ,emiddlenm
                  ,efamilynm
                  ,sex
                  ,birthdte
                  ,nation_seqno
                  ,conv_seqno
                  ,convregno
                  ,indte
                  ,visatype_seqno
                  ,visaexpdte
                  ,outdte
                  ,finestatus
                  ,finesremark
                  ,flag_system
                  ,create_by
                  ,create_date
                  ,create_ip
                  ,update_by
                  ,update_date
                  ,update_ip
                  ,version
                  ,permit_seqno
                  ,permit_date
                  ,sliptype
                  ,suffix_seqno
                  ,tfamilynm
                  ,tfirstnm
                  ,staff_seqno
            FROM fs_fines@pibics
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

END pkg_fs_fines;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_FS_FINES" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_FS_FINES" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_FS_FINES" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_FS_FINES" TO "BIOSAADM";
