CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_TMINOUT" AS

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

        MERGE INTO tminout tgt
        USING (SELECT seqno
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
                     ,travcd
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
                     ,creusr
                     ,credte
                     ,credterm
                     ,updusr
                     ,upddte
                     ,updterm
                     ,isprocess
                     ,personid
                     ,tfsndxnm
                     ,tlsndxnm
                     ,tmsndxnm
                     ,efsndxnm
                     ,elsndxnm
                     ,emsndxnm
                     ,remark
                     ,rescertno
                     ,imginout
                     ,pm_re_entry
                     ,pm_reexpdte
                     ,pm_extension
                     ,pm_exexpdte
                     ,pm_non_quota
                     ,pm_nonexpdte
                     ,status
                     ,tm5_seqno
                     ,tm2inout_seqno
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,rpjseqno
                     ,permitcd
                     ,newpermit
                     ,conv_seqno
                     ,visatype_seqno
                     ,dept_seqno
                     ,count_seqno
                     ,permit_seqno
                     ,citizenid
                     ,pass_seqno
                     ,flightprefix
                     ,flightnumber
                     ,typedata
                     ,deptcdorg
                     ,flagjoinpass
                     ,flagfines
                     ,rescerttype
                     ,respvcd
                     ,resnoyear
                     ,pv_seqno
                     ,pd_seqno
                     ,zone_seqno
                     ,shift_seqno
               FROM tminout@pibics
               WHERE pkg_utils.get_yyyymmdd(p_date => create_date) = p_step_params.timeframe) src
        ON (src.seqno = tgt.seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (seqno
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
                ,travcd
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
                ,creusr
                ,credte
                ,credterm
                ,updusr
                ,upddte
                ,updterm
                ,isprocess
                ,personid
                ,tfsndxnm
                ,tlsndxnm
                ,tmsndxnm
                ,efsndxnm
                ,elsndxnm
                ,emsndxnm
                ,remark
                ,rescertno
                ,pm_re_entry
                ,pm_reexpdte
                ,pm_extension
                ,pm_exexpdte
                ,pm_non_quota
                ,pm_nonexpdte
                ,status
                ,tm5_seqno
                ,tm2inout_seqno
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,rpjseqno
                ,permitcd
                ,newpermit
                ,conv_seqno
                ,visatype_seqno
                ,dept_seqno
                ,count_seqno
                ,permit_seqno
                ,citizenid
                ,pass_seqno
                ,flightprefix
                ,flightnumber
                ,typedata
                ,deptcdorg
                ,flagjoinpass
                ,flagfines
                ,rescerttype
                ,respvcd
                ,resnoyear
                ,pv_seqno
                ,pd_seqno
                ,zone_seqno
                ,shift_seqno
                ,imginout)
            VALUES
                (src.seqno
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
                ,src.travcd
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
                ,src.creusr
                ,src.credte
                ,src.credterm
                ,src.updusr
                ,src.upddte
                ,src.updterm
                ,src.isprocess
                ,src.personid
                ,src.tfsndxnm
                ,src.tlsndxnm
                ,src.tmsndxnm
                ,src.efsndxnm
                ,src.elsndxnm
                ,src.emsndxnm
                ,src.remark
                ,src.rescertno
                ,src.pm_re_entry
                ,src.pm_reexpdte
                ,src.pm_extension
                ,src.pm_exexpdte
                ,src.pm_non_quota
                ,src.pm_nonexpdte
                ,src.status
                ,src.tm5_seqno
                ,src.tm2inout_seqno
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.rpjseqno
                ,src.permitcd
                ,src.newpermit
                ,src.conv_seqno
                ,src.visatype_seqno
                ,src.dept_seqno
                ,src.count_seqno
                ,src.permit_seqno
                ,src.citizenid
                ,src.pass_seqno
                ,src.flightprefix
                ,src.flightnumber
                ,src.typedata
                ,src.deptcdorg
                ,src.flagjoinpass
                ,src.flagfines
                ,src.rescerttype
                ,src.respvcd
                ,src.resnoyear
                ,src.pv_seqno
                ,src.pd_seqno
                ,src.zone_seqno
                ,src.shift_seqno
                ,src.imginout)
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
               ,tgt.travcd         = src.travcd
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
               ,tgt.creusr         = src.creusr
               ,tgt.credte         = src.credte
               ,tgt.credterm       = src.credterm
               ,tgt.updusr         = src.updusr
               ,tgt.upddte         = src.upddte
               ,tgt.updterm        = src.updterm
               ,tgt.isprocess      = src.isprocess
               ,tgt.personid       = src.personid
               ,tgt.tfsndxnm       = src.tfsndxnm
               ,tgt.tlsndxnm       = src.tlsndxnm
               ,tgt.tmsndxnm       = src.tmsndxnm
               ,tgt.efsndxnm       = src.efsndxnm
               ,tgt.elsndxnm       = src.elsndxnm
               ,tgt.emsndxnm       = src.emsndxnm
               ,tgt.remark         = src.remark
               ,tgt.rescertno      = src.rescertno
               ,tgt.pm_re_entry    = src.pm_re_entry
               ,tgt.pm_reexpdte    = src.pm_reexpdte
               ,tgt.pm_extension   = src.pm_extension
               ,tgt.pm_exexpdte    = src.pm_exexpdte
               ,tgt.pm_non_quota   = src.pm_non_quota
               ,tgt.pm_nonexpdte   = src.pm_nonexpdte
               ,tgt.status         = src.status
               ,tgt.tm5_seqno      = src.tm5_seqno
               ,tgt.tm2inout_seqno = src.tm2inout_seqno
               ,tgt.create_by      = src.create_by
               ,tgt.create_date    = src.create_date
               ,tgt.update_by      = src.update_by
               ,tgt.update_date    = src.update_date
               ,tgt.version        = src.version
               ,tgt.rpjseqno       = src.rpjseqno
               ,tgt.permitcd       = src.permitcd
               ,tgt.newpermit      = src.newpermit
               ,tgt.conv_seqno     = src.conv_seqno
               ,tgt.visatype_seqno = src.visatype_seqno
               ,tgt.dept_seqno     = src.dept_seqno
               ,tgt.count_seqno    = src.count_seqno
               ,tgt.permit_seqno   = src.permit_seqno
               ,tgt.citizenid      = src.citizenid
               ,tgt.pass_seqno     = src.pass_seqno
               ,tgt.flightprefix   = src.flightprefix
               ,tgt.flightnumber   = src.flightnumber
               ,tgt.typedata       = src.typedata
               ,tgt.deptcdorg      = src.deptcdorg
               ,tgt.flagjoinpass   = src.flagjoinpass
               ,tgt.flagfines      = src.flagfines
               ,tgt.rescerttype    = src.rescerttype
               ,tgt.respvcd        = src.respvcd
               ,tgt.resnoyear      = src.resnoyear
               ,tgt.pv_seqno       = src.pv_seqno
               ,tgt.pd_seqno       = src.pd_seqno
               ,tgt.zone_seqno     = src.zone_seqno
               ,tgt.shift_seqno    = src.shift_seqno
               ,tgt.imginout       = src.imginout;

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
        INSERT INTO tminout
            (seqno
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
            ,travcd
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
            ,creusr
            ,credte
            ,credterm
            ,updusr
            ,upddte
            ,updterm
            ,isprocess
            ,personid
            ,tfsndxnm
            ,tlsndxnm
            ,tmsndxnm
            ,efsndxnm
            ,elsndxnm
            ,emsndxnm
            ,remark
            ,rescertno
            ,imginout
            ,pm_re_entry
            ,pm_reexpdte
            ,pm_extension
            ,pm_exexpdte
            ,pm_non_quota
            ,pm_nonexpdte
            ,status
            ,tm5_seqno
            ,tm2inout_seqno
            ,create_by
            ,create_date
            ,update_by
            ,update_date
            ,version
            ,rpjseqno
            ,permitcd
            ,newpermit
            ,conv_seqno
            ,visatype_seqno
            ,dept_seqno
            ,count_seqno
            ,permit_seqno
            ,citizenid
            ,pass_seqno
            ,flightprefix
            ,flightnumber
            ,typedata
            ,deptcdorg
            ,flagjoinpass
            ,flagfines
            ,rescerttype
            ,respvcd
            ,resnoyear
            ,pv_seqno
            ,pd_seqno
            ,zone_seqno
            ,shift_seqno)
            SELECT seqno
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
                  ,travcd
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
                  ,creusr
                  ,credte
                  ,credterm
                  ,updusr
                  ,upddte
                  ,updterm
                  ,isprocess
                  ,personid
                  ,tfsndxnm
                  ,tlsndxnm
                  ,tmsndxnm
                  ,efsndxnm
                  ,elsndxnm
                  ,emsndxnm
                  ,remark
                  ,rescertno
                  ,imginout
                  ,pm_re_entry
                  ,pm_reexpdte
                  ,pm_extension
                  ,pm_exexpdte
                  ,pm_non_quota
                  ,pm_nonexpdte
                  ,status
                  ,tm5_seqno
                  ,tm2inout_seqno
                  ,create_by
                  ,create_date
                  ,update_by
                  ,update_date
                  ,version
                  ,rpjseqno
                  ,permitcd
                  ,newpermit
                  ,conv_seqno
                  ,visatype_seqno
                  ,dept_seqno
                  ,count_seqno
                  ,permit_seqno
                  ,citizenid
                  ,pass_seqno
                  ,flightprefix
                  ,flightnumber
                  ,typedata
                  ,deptcdorg
                  ,flagjoinpass
                  ,flagfines
                  ,rescerttype
                  ,respvcd
                  ,resnoyear
                  ,pv_seqno
                  ,pd_seqno
                  ,zone_seqno
                  ,shift_seqno
            FROM tminout@pibics
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

END pkg_tminout;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TMINOUT" TO "DERMALOG_PROXY";
