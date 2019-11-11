CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_LOSTPASSPORT" AS

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

        MERGE INTO lostpassport tgt
        USING (SELECT lppcd
                     ,nationcd
                     ,passportno
                     ,citizenid
                     ,tfirstnm
                     ,tfamilynm
                     ,efirstnm
                     ,efamilynm
                     ,birthdate
                     ,sex
                     ,isupassportdte
                     ,isupassportplace
                     ,passportexpdte
                     ,passporttype
                     ,lostpassportdte
                     ,lostpassportplace
                     ,tmiddlenm
                     ,emiddlenm
                     ,remark
                     ,creusr
                     ,credte
                     ,updusr
                     ,upddte
                     ,newpassportno
                     ,newpassporttype
                     ,newisupassportdte
                     ,newisupassportplace
                     ,newpassportexpdte
                     ,informpassportdte
                     ,ownerage
                     ,agcphone
                     ,emgcont
                     ,docref
                     ,seclev
                     ,reasoncd
                     ,agccont
                     ,operref
                     ,tdcd
                     ,lpperson
                     ,polisstation
                     ,visatype_seqno
                     ,visaexpdte
                     ,tdt_seqno
                     ,dept_seqno
                     ,pid
                     ,org_code
               FROM pibicsdm2.lostpassport
               WHERE pkg_utils.get_yyyymmdd(p_date => credte) = p_step_params.timeframe) src
        ON (src.lppcd = tgt.lppcd)
        WHEN NOT MATCHED THEN
            INSERT
                (lppcd
                ,nationcd
                ,passportno
                ,citizenid
                ,tfirstnm
                ,tfamilynm
                ,efirstnm
                ,efamilynm
                ,birthdate
                ,sex
                ,isupassportdte
                ,isupassportplace
                ,passportexpdte
                ,passporttype
                ,lostpassportdte
                ,lostpassportplace
                ,tmiddlenm
                ,emiddlenm
                ,remark
                ,creusr
                ,credte
                ,updusr
                ,upddte
                ,newpassportno
                ,newpassporttype
                ,newisupassportdte
                ,newisupassportplace
                ,newpassportexpdte
                ,informpassportdte
                ,ownerage
                ,agcphone
                ,emgcont
                ,docref
                ,seclev
                ,reasoncd
                ,agccont
                ,operref
                ,tdcd
                ,lpperson
                ,polisstation
                ,visatype_seqno
                ,visaexpdte
                ,tdt_seqno
                ,dept_seqno
                ,pid
                ,org_code)
            VALUES
                (src.lppcd
                ,src.nationcd
                ,src.passportno
                ,src.citizenid
                ,src.tfirstnm
                ,src.tfamilynm
                ,src.efirstnm
                ,src.efamilynm
                ,src.birthdate
                ,src.sex
                ,src.isupassportdte
                ,src.isupassportplace
                ,src.passportexpdte
                ,src.passporttype
                ,src.lostpassportdte
                ,src.lostpassportplace
                ,src.tmiddlenm
                ,src.emiddlenm
                ,src.remark
                ,src.creusr
                ,src.credte
                ,src.updusr
                ,src.upddte
                ,src.newpassportno
                ,src.newpassporttype
                ,src.newisupassportdte
                ,src.newisupassportplace
                ,src.newpassportexpdte
                ,src.informpassportdte
                ,src.ownerage
                ,src.agcphone
                ,src.emgcont
                ,src.docref
                ,src.seclev
                ,src.reasoncd
                ,src.agccont
                ,src.operref
                ,src.tdcd
                ,src.lpperson
                ,src.polisstation
                ,src.visatype_seqno
                ,src.visaexpdte
                ,src.tdt_seqno
                ,src.dept_seqno
                ,src.pid
                ,src.org_code)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.nationcd            = src.nationcd
               ,tgt.passportno          = src.passportno
               ,tgt.citizenid           = src.citizenid
               ,tgt.tfirstnm            = src.tfirstnm
               ,tgt.tfamilynm           = src.tfamilynm
               ,tgt.efirstnm            = src.efirstnm
               ,tgt.efamilynm           = src.efamilynm
               ,tgt.birthdate           = src.birthdate
               ,tgt.sex                 = src.sex
               ,tgt.isupassportdte      = src.isupassportdte
               ,tgt.isupassportplace    = src.isupassportplace
               ,tgt.passportexpdte      = src.passportexpdte
               ,tgt.passporttype        = src.passporttype
               ,tgt.lostpassportdte     = src.lostpassportdte
               ,tgt.lostpassportplace   = src.lostpassportplace
               ,tgt.tmiddlenm           = src.tmiddlenm
               ,tgt.emiddlenm           = src.emiddlenm
               ,tgt.remark              = src.remark
               ,tgt.creusr              = src.creusr
               ,tgt.credte              = src.credte
               ,tgt.updusr              = src.updusr
               ,tgt.upddte              = src.upddte
               ,tgt.newpassportno       = src.newpassportno
               ,tgt.newpassporttype     = src.newpassporttype
               ,tgt.newisupassportdte   = src.newisupassportdte
               ,tgt.newisupassportplace = src.newisupassportplace
               ,tgt.newpassportexpdte   = src.newpassportexpdte
               ,tgt.informpassportdte   = src.informpassportdte
               ,tgt.ownerage            = src.ownerage
               ,tgt.agcphone            = src.agcphone
               ,tgt.emgcont             = src.emgcont
               ,tgt.docref              = src.docref
               ,tgt.seclev              = src.seclev
               ,tgt.reasoncd            = src.reasoncd
               ,tgt.agccont             = src.agccont
               ,tgt.operref             = src.operref
               ,tgt.tdcd                = src.tdcd
               ,tgt.lpperson            = src.lpperson
               ,tgt.polisstation        = src.polisstation
               ,tgt.visatype_seqno      = src.visatype_seqno
               ,tgt.visaexpdte          = src.visaexpdte
               ,tgt.tdt_seqno           = src.tdt_seqno
               ,tgt.dept_seqno          = src.dept_seqno
               ,tgt.pid                 = src.pid
               ,tgt.org_code            = src.org_code;

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
        INSERT INTO lostpassport
            (lppcd
            ,nationcd
            ,passportno
            ,citizenid
            ,tfirstnm
            ,tfamilynm
            ,efirstnm
            ,efamilynm
            ,birthdate
            ,sex
            ,isupassportdte
            ,isupassportplace
            ,passportexpdte
            ,passporttype
            ,lostpassportdte
            ,lostpassportplace
            ,tmiddlenm
            ,emiddlenm
            ,remark
            ,creusr
            ,credte
            ,updusr
            ,upddte
            ,newpassportno
            ,newpassporttype
            ,newisupassportdte
            ,newisupassportplace
            ,newpassportexpdte
            ,informpassportdte
            ,ownerage
            ,agcphone
            ,emgcont
            ,docref
            ,seclev
            ,reasoncd
            ,agccont
            ,operref
            ,tdcd
            ,lpperson
            ,polisstation
            ,visatype_seqno
            ,visaexpdte
            ,tdt_seqno
            ,dept_seqno
            ,pid
            ,org_code)
            SELECT lppcd
                  ,nationcd
                  ,passportno
                  ,citizenid
                  ,tfirstnm
                  ,tfamilynm
                  ,efirstnm
                  ,efamilynm
                  ,birthdate
                  ,sex
                  ,isupassportdte
                  ,isupassportplace
                  ,passportexpdte
                  ,passporttype
                  ,lostpassportdte
                  ,lostpassportplace
                  ,tmiddlenm
                  ,emiddlenm
                  ,remark
                  ,creusr
                  ,credte
                  ,updusr
                  ,upddte
                  ,newpassportno
                  ,newpassporttype
                  ,newisupassportdte
                  ,newisupassportplace
                  ,newpassportexpdte
                  ,informpassportdte
                  ,ownerage
                  ,agcphone
                  ,emgcont
                  ,docref
                  ,seclev
                  ,reasoncd
                  ,agccont
                  ,operref
                  ,tdcd
                  ,lpperson
                  ,polisstation
                  ,visatype_seqno
                  ,visaexpdte
                  ,tdt_seqno
                  ,dept_seqno
                  ,pid
                  ,org_code
            FROM pibicsdm2.lostpassport
            WHERE pkg_utils.get_yyyymm(p_date => credte) = p_step_params.timeframe;
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

END pkg_lostpassport;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_LOSTPASSPORT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_LOSTPASSPORT" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_LOSTPASSPORT" TO "BIOSAADM";
