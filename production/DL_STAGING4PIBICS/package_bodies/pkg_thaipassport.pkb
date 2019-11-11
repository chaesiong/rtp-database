CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_THAIPASSPORT" AS

    gc_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

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

        MERGE INTO thaipassport tgt
        USING (SELECT citizenid
                     ,personid
                     ,passportno
                     ,passno
                     ,tfamilynm
                     ,tfirstnm
                     ,tmiddlenm
                     ,efamilynm
                     ,efirstnm
                     ,emiddlenm
                     ,sex
                     ,nationcd
                     ,height
                     ,weight
                     ,addr
                     ,district
                     ,citycd
                     ,statecd
                     ,zipcode
                     ,telno
                     ,passportdte
                     ,passportexpdte
                     ,microrollno
                     ,micropicno
                     ,micropicnol
                     ,birthdte
                     ,birthplace
                     ,domicile
                     ,pps_seqno
                     ,pass_seqno
                     ,create_date
                     ,update_date
                     ,typedpassport
                     ,passportsts
                     ,tmppass_seqno
                     ,imgpass
               FROM pibicsdm2.thaipassport
               WHERE pkg_utils.get_yyyymmdd(p_date => create_date) = p_step_params.timeframe) src
        ON (src.citizenid = tgt.citizenid AND src.passportno = tgt.passportno)
        WHEN NOT MATCHED THEN
            INSERT
                (citizenid
                ,personid
                ,passportno
                ,passno
                ,tfamilynm
                ,tfirstnm
                ,tmiddlenm
                ,efamilynm
                ,efirstnm
                ,emiddlenm
                ,sex
                ,nationcd
                ,height
                ,weight
                ,addr
                ,district
                ,citycd
                ,statecd
                ,zipcode
                ,telno
                ,passportdte
                ,passportexpdte
                ,microrollno
                ,micropicno
                ,micropicnol
                ,birthdte
                ,birthplace
                ,domicile
                ,pps_seqno
                ,pass_seqno
                ,create_date
                ,update_date
                ,typedpassport
                ,passportsts
                ,tmppass_seqno
                ,imgpass)
            VALUES
                (src.citizenid
                ,src.personid
                ,src.passportno
                ,src.passno
                ,src.tfamilynm
                ,src.tfirstnm
                ,src.tmiddlenm
                ,src.efamilynm
                ,src.efirstnm
                ,src.emiddlenm
                ,src.sex
                ,src.nationcd
                ,src.height
                ,src.weight
                ,src.addr
                ,src.district
                ,src.citycd
                ,src.statecd
                ,src.zipcode
                ,src.telno
                ,src.passportdte
                ,src.passportexpdte
                ,src.microrollno
                ,src.micropicno
                ,src.micropicnol
                ,src.birthdte
                ,src.birthplace
                ,src.domicile
                ,src.pps_seqno
                ,src.pass_seqno
                ,src.create_date
                ,src.update_date
                ,src.typedpassport
                ,src.passportsts
                ,src.tmppass_seqno
                ,src.imgpass)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.personid       = src.personid
               ,tgt.tfamilynm      = src.tfamilynm
               ,tgt.tfirstnm       = src.tfirstnm
               ,tgt.tmiddlenm      = src.tmiddlenm
               ,tgt.efamilynm      = src.efamilynm
               ,tgt.efirstnm       = src.efirstnm
               ,tgt.emiddlenm      = src.emiddlenm
               ,tgt.sex            = src.sex
               ,tgt.nationcd       = src.nationcd
               ,tgt.height         = src.height
               ,tgt.weight         = src.weight
               ,tgt.addr           = src.addr
               ,tgt.district       = src.district
               ,tgt.citycd         = src.citycd
               ,tgt.statecd        = src.statecd
               ,tgt.zipcode        = src.zipcode
               ,tgt.telno          = src.telno
               ,tgt.passportdte    = src.passportdte
               ,tgt.passportexpdte = src.passportexpdte
               ,tgt.microrollno    = src.microrollno
               ,tgt.micropicno     = src.micropicno
               ,tgt.micropicnol    = src.micropicnol
               ,tgt.birthdte       = src.birthdte
               ,tgt.birthplace     = src.birthplace
               ,tgt.domicile       = src.domicile
               ,tgt.pps_seqno      = src.pps_seqno
               ,tgt.pass_seqno     = src.pass_seqno
               ,tgt.create_date    = src.create_date
               ,tgt.update_date    = src.update_date
               ,tgt.typedpassport  = src.typedpassport
               ,tgt.passportsts    = src.passportsts
               ,tgt.tmppass_seqno  = src.tmppass_seqno
               ,tgt.imgpass        = src.imgpass;

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
        INSERT INTO thaipassport
            (citizenid
            ,personid
            ,passportno
            ,passno
            ,tfamilynm
            ,tfirstnm
            ,tmiddlenm
            ,efamilynm
            ,efirstnm
            ,emiddlenm
            ,sex
            ,nationcd
            ,height
            ,weight
            ,addr
            ,district
            ,citycd
            ,statecd
            ,zipcode
            ,telno
            ,passportdte
            ,passportexpdte
            ,microrollno
            ,micropicno
            ,micropicnol
            ,birthdte
            ,birthplace
            ,domicile
            ,pps_seqno
            ,pass_seqno
            ,create_date
            ,update_date
            ,typedpassport
            ,passportsts
            ,tmppass_seqno
            ,imgpass)
            SELECT citizenid
                  ,personid
                  ,passportno
                  ,passno
                  ,tfamilynm
                  ,tfirstnm
                  ,tmiddlenm
                  ,efamilynm
                  ,efirstnm
                  ,emiddlenm
                  ,sex
                  ,nationcd
                  ,height
                  ,weight
                  ,addr
                  ,district
                  ,citycd
                  ,statecd
                  ,zipcode
                  ,telno
                  ,passportdte
                  ,passportexpdte
                  ,microrollno
                  ,micropicno
                  ,micropicnol
                  ,birthdte
                  ,birthplace
                  ,domicile
                  ,pps_seqno
                  ,pass_seqno
                  ,create_date
                  ,update_date
                  ,typedpassport
                  ,passportsts
                  ,tmppass_seqno
                  ,imgpass
            FROM pibicsdm2.thaipassport
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

END pkg_thaipassport;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_THAIPASSPORT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_THAIPASSPORT" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_THAIPASSPORT" TO "BIOSAADM";
