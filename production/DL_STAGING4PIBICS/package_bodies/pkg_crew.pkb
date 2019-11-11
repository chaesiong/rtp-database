CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_CREW" AS

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

        MERGE INTO crew tgt
        USING (SELECT crew_seqno
                     ,tm6no
                     ,inoutdte
                     ,cardtype
                     ,tfirstnm
                     ,tmiddlenm
                     ,tfamilynm
                     ,efirstnm
                     ,emiddlenm
                     ,efamilynm
                     ,sex
                     ,birthdte
                     ,nationcd
                     ,deptcd
                     ,convcd
                     ,convregno
                     ,tdtcd
                     ,tdtno
                     ,visatypecd
                     ,visaexpdte
                     ,passportdte
                     ,passportisu
                     ,passportexpdte
                     ,targetno
                     ,intype
                     ,chkpointno
                     ,personid
                     ,remark
                     ,status
                     ,tm5_seqno
                     ,tm2inout_seqno
                     ,rankcrw_seqno
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,actflag
                     ,inoutdte_imm
                     ,deptcd_imm
                     ,create_ip
                     ,update_ip
                     ,shift_seqno
                     ,pd_seqno
                     ,zone_seqno
                     ,imginout
                     ,imgpass
               FROM crew@pibics
               WHERE pkg_utils.get_yyyymmdd(p_date => create_date) = p_step_params.timeframe) src
        ON (src.crew_seqno = tgt.crew_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (crew_seqno
                ,tm6no
                ,inoutdte
                ,cardtype
                ,tfirstnm
                ,tmiddlenm
                ,tfamilynm
                ,efirstnm
                ,emiddlenm
                ,efamilynm
                ,sex
                ,birthdte
                ,nationcd
                ,deptcd
                ,convcd
                ,convregno
                ,tdtcd
                ,tdtno
                ,visatypecd
                ,visaexpdte
                ,passportdte
                ,passportisu
                ,passportexpdte
                ,targetno
                ,intype
                ,chkpointno
                ,personid
                ,remark
                ,status
                ,tm5_seqno
                ,tm2inout_seqno
                ,rankcrw_seqno
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,actflag
                ,inoutdte_imm
                ,deptcd_imm
                ,create_ip
                ,update_ip
                ,shift_seqno
                ,pd_seqno
                ,zone_seqno
                ,imginout
                ,imgpass)
            VALUES
                (src.crew_seqno
                ,src.tm6no
                ,src.inoutdte
                ,src.cardtype
                ,src.tfirstnm
                ,src.tmiddlenm
                ,src.tfamilynm
                ,src.efirstnm
                ,src.emiddlenm
                ,src.efamilynm
                ,src.sex
                ,src.birthdte
                ,src.nationcd
                ,src.deptcd
                ,src.convcd
                ,src.convregno
                ,src.tdtcd
                ,src.tdtno
                ,src.visatypecd
                ,src.visaexpdte
                ,src.passportdte
                ,src.passportisu
                ,src.passportexpdte
                ,src.targetno
                ,src.intype
                ,src.chkpointno
                ,src.personid
                ,src.remark
                ,src.status
                ,src.tm5_seqno
                ,src.tm2inout_seqno
                ,src.rankcrw_seqno
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.actflag
                ,src.inoutdte_imm
                ,src.deptcd_imm
                ,src.create_ip
                ,src.update_ip
                ,src.shift_seqno
                ,src.pd_seqno
                ,src.zone_seqno
                ,src.imginout
                ,src.imgpass)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.tm6no          = src.tm6no
               ,tgt.inoutdte       = src.inoutdte
               ,tgt.cardtype       = src.cardtype
               ,tgt.tfirstnm       = src.tfirstnm
               ,tgt.tmiddlenm      = src.tmiddlenm
               ,tgt.tfamilynm      = src.tfamilynm
               ,tgt.efirstnm       = src.efirstnm
               ,tgt.emiddlenm      = src.emiddlenm
               ,tgt.efamilynm      = src.efamilynm
               ,tgt.sex            = src.sex
               ,tgt.birthdte       = src.birthdte
               ,tgt.nationcd       = src.nationcd
               ,tgt.deptcd         = src.deptcd
               ,tgt.convcd         = src.convcd
               ,tgt.convregno      = src.convregno
               ,tgt.tdtcd          = src.tdtcd
               ,tgt.tdtno          = src.tdtno
               ,tgt.visatypecd     = src.visatypecd
               ,tgt.visaexpdte     = src.visaexpdte
               ,tgt.passportdte    = src.passportdte
               ,tgt.passportisu    = src.passportisu
               ,tgt.passportexpdte = src.passportexpdte
               ,tgt.targetno       = src.targetno
               ,tgt.intype         = src.intype
               ,tgt.chkpointno     = src.chkpointno
               ,tgt.personid       = src.personid
               ,tgt.remark         = src.remark
               ,tgt.status         = src.status
               ,tgt.tm5_seqno      = src.tm5_seqno
               ,tgt.tm2inout_seqno = src.tm2inout_seqno
               ,tgt.rankcrw_seqno  = src.rankcrw_seqno
               ,tgt.create_by      = src.create_by
               ,tgt.create_date    = src.create_date
               ,tgt.update_by      = src.update_by
               ,tgt.update_date    = src.update_date
               ,tgt.version        = src.version
               ,tgt.actflag        = src.actflag
               ,tgt.inoutdte_imm   = src.inoutdte_imm
               ,tgt.deptcd_imm     = src.deptcd_imm
               ,tgt.create_ip      = src.create_ip
               ,tgt.update_ip      = src.update_ip
               ,tgt.shift_seqno    = src.shift_seqno
               ,tgt.pd_seqno       = src.pd_seqno
               ,tgt.zone_seqno     = src.zone_seqno
               ,tgt.imginout       = src.imginout
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
        INSERT INTO crew
            (crew_seqno
            ,tm6no
            ,inoutdte
            ,cardtype
            ,tfirstnm
            ,tmiddlenm
            ,tfamilynm
            ,efirstnm
            ,emiddlenm
            ,efamilynm
            ,sex
            ,birthdte
            ,nationcd
            ,deptcd
            ,convcd
            ,convregno
            ,tdtcd
            ,tdtno
            ,visatypecd
            ,visaexpdte
            ,passportdte
            ,passportisu
            ,passportexpdte
            ,targetno
            ,intype
            ,chkpointno
            ,personid
            ,remark
            ,imginout
            ,status
            ,tm5_seqno
            ,tm2inout_seqno
            ,rankcrw_seqno
            ,create_by
            ,create_date
            ,update_by
            ,update_date
            ,version
            ,actflag
            ,inoutdte_imm
            ,deptcd_imm
            ,create_ip
            ,update_ip
            ,shift_seqno
            ,pd_seqno
            ,zone_seqno
            ,imgpass)
            SELECT crew_seqno
                  ,tm6no
                  ,inoutdte
                  ,cardtype
                  ,tfirstnm
                  ,tmiddlenm
                  ,tfamilynm
                  ,efirstnm
                  ,emiddlenm
                  ,efamilynm
                  ,sex
                  ,birthdte
                  ,nationcd
                  ,deptcd
                  ,convcd
                  ,convregno
                  ,tdtcd
                  ,tdtno
                  ,visatypecd
                  ,visaexpdte
                  ,passportdte
                  ,passportisu
                  ,passportexpdte
                  ,targetno
                  ,intype
                  ,chkpointno
                  ,personid
                  ,remark
                  ,imginout
                  ,status
                  ,tm5_seqno
                  ,tm2inout_seqno
                  ,rankcrw_seqno
                  ,create_by
                  ,create_date
                  ,update_by
                  ,update_date
                  ,version
                  ,actflag
                  ,inoutdte_imm
                  ,deptcd_imm
                  ,create_ip
                  ,update_ip
                  ,shift_seqno
                  ,pd_seqno
                  ,zone_seqno
                  ,imgpass
            FROM crew@pibics
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

END pkg_crew;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_CREW" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_CREW" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_CREW" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_CREW" TO "BIOSAADM";
