CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_TRANSCODE" AS

    gc_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    PROCEDURE load_ampur IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_ampur';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_ampur;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO dl_staging4pibics.ampur tgt
        USING (SELECT amp_seqno
                     ,ampcd
                     ,pv_seqno
                     ,amp_desc
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,actflag
                     ,amp_desc_en
                     ,dept_seqno
               FROM pibicsdm2.ampur) src
        ON (src.amp_seqno = tgt.amp_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (amp_seqno
                ,ampcd
                ,pv_seqno
                ,amp_desc
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,actflag
                ,amp_desc_en
                ,dept_seqno)
            VALUES
                (src.amp_seqno
                ,src.ampcd
                ,src.pv_seqno
                ,src.amp_desc
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.actflag
                ,src.amp_desc_en
                ,src.dept_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.ampcd       = src.ampcd
               ,tgt.pv_seqno    = src.pv_seqno
               ,tgt.amp_desc    = src.amp_desc
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version
               ,tgt.actflag     = src.actflag
               ,tgt.amp_desc_en = src.amp_desc_en
               ,tgt.dept_seqno  = src.dept_seqno;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_ampur || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_ampur;

    PROCEDURE load_conveyance IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_conveyance';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_conveyance;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO conveyance tgt
        USING (SELECT conv_seqno
                     ,convcd
                     ,travcd
                     ,convtnm
                     ,convenm
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
               FROM pibicsdm2.conveyance) src
        ON (src.conv_seqno = tgt.conv_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (conv_seqno
                ,convcd
                ,travcd
                ,convtnm
                ,convenm
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version)
            VALUES
                (src.conv_seqno
                ,src.convcd
                ,src.travcd
                ,src.convtnm
                ,src.convenm
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.convcd      = src.convcd
               ,tgt.travcd      = src.travcd
               ,tgt.convtnm     = src.convtnm
               ,tgt.convenm     = src.convenm
               ,tgt.actflag     = src.actflag
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_conveyance || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_conveyance;

    PROCEDURE load_continent IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_continent';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_continent;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO continent tgt
        USING (SELECT continent_seqno
                     ,continentcd
                     ,continenttnm
                     ,continentenm
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
               FROM pibicsdm2.continent) src
        ON (src.continent_seqno = tgt.continent_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (continent_seqno
                ,continentcd
                ,continenttnm
                ,continentenm
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version)
            VALUES
                (src.continent_seqno
                ,src.continentcd
                ,src.continenttnm
                ,src.continentenm
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.continentcd  = src.continentcd
               ,tgt.continenttnm = src.continenttnm
               ,tgt.continentenm = src.continentenm
               ,tgt.actflag      = src.actflag
               ,tgt.create_by    = src.create_by
               ,tgt.create_date  = src.create_date
               ,tgt.update_by    = src.update_by
               ,tgt.update_date  = src.update_date
               ,tgt.version      = src.version;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_continent || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_continent;

    PROCEDURE load_country IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_country';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_country;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO country tgt
        USING (SELECT count_seqno
                     ,countcd
                     ,counttnm
                     ,countenm
                     ,nationtnm
                     ,nationenm
                     ,continentcd
                     ,actflag
                     ,abbcount
                     ,visaflag
                     ,healthctl
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,continent_seqno
                     ,salary
                     ,rpt_sort
                     ,status_apec
                     ,flagvisarun
                     ,pcsvisarun
                     ,countchnnm
               FROM pibicsdm2.country) src
        ON (src.count_seqno = tgt.count_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (count_seqno
                ,countcd
                ,counttnm
                ,countenm
                ,nationtnm
                ,nationenm
                ,continentcd
                ,actflag
                ,abbcount
                ,visaflag
                ,healthctl
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,continent_seqno
                ,salary
                ,rpt_sort
                ,status_apec
                ,flagvisarun
                ,pcsvisarun
                ,countchnnm)
            VALUES
                (src.count_seqno
                ,src.countcd
                ,src.counttnm
                ,src.countenm
                ,src.nationtnm
                ,src.nationenm
                ,src.continentcd
                ,src.actflag
                ,src.abbcount
                ,src.visaflag
                ,src.healthctl
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.continent_seqno
                ,src.salary
                ,src.rpt_sort
                ,src.status_apec
                ,src.flagvisarun
                ,src.pcsvisarun
                ,src.countchnnm)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.countcd         = src.countcd
               ,tgt.counttnm        = src.counttnm
               ,tgt.countenm        = src.countenm
               ,tgt.nationtnm       = src.nationtnm
               ,tgt.nationenm       = src.nationenm
               ,tgt.continentcd     = src.continentcd
               ,tgt.actflag         = src.actflag
               ,tgt.abbcount        = src.abbcount
               ,tgt.visaflag        = src.visaflag
               ,tgt.healthctl       = src.healthctl
               ,tgt.create_by       = src.create_by
               ,tgt.create_date     = src.create_date
               ,tgt.update_by       = src.update_by
               ,tgt.update_date     = src.update_date
               ,tgt.version         = src.version
               ,tgt.continent_seqno = src.continent_seqno
               ,tgt.salary          = src.salary
               ,tgt.rpt_sort        = src.rpt_sort
               ,tgt.status_apec     = src.status_apec
               ,tgt.flagvisarun     = src.flagvisarun
               ,tgt.pcsvisarun      = src.pcsvisarun
               ,tgt.countchnnm      = src.countchnnm;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_country || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_country;

    PROCEDURE load_department IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_department';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_department;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);

        MERGE INTO department tgt
        USING (SELECT dept_seqno
                     ,deptcd
                     ,deptlevel
                     ,deptenm
                     ,depttnm
                     ,addr
                     ,addno
                     ,pv_seqno
                     ,amp_seqno
                     ,tmb_seqno
                     ,zipcode
                     ,telno
                     ,fax
                     ,email
                     ,urldept
                     ,adepttype
                     ,conv_seqno
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,convcd
                     ,abbrnm
                     ,rel_code
                     ,org_code
                     ,detainee_flag
                     ,org_seqno
                     ,checkpoint
                     ,deptabbfmt1
                     ,deptabbfmt2
                     ,casino_flag
                     ,spotseqno
                     ,olddeptcd
                     ,deptline
                     ,field_default
                     ,twosection
                     ,qext_actflag
                     ,qext_type
                     ,qext_note
                     ,qreps_actflag
                     ,qreps_type
                     ,qreps_note
                     ,dept_title_doc
                     ,tel_title_doc
                     ,deptabbfmt3
                     ,count_seqno
                     ,qfn90_actflag
                     ,qfn90_type
                     ,qfn90_note
                     ,flag_fines_staff
                     ,deptabbfmt4
                     ,voa_online_flag
                     ,imgdir
               FROM pibicsdm2.department) src
        ON (src.dept_seqno = tgt.dept_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (dept_seqno
                ,deptcd
                ,deptlevel
                ,deptenm
                ,depttnm
                ,addr
                ,addno
                ,pv_seqno
                ,amp_seqno
                ,tmb_seqno
                ,zipcode
                ,telno
                ,fax
                ,email
                ,urldept
                ,adepttype
                ,conv_seqno
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,convcd
                ,abbrnm
                ,rel_code
                ,org_code
                ,detainee_flag
                ,org_seqno
                ,checkpoint
                ,deptabbfmt1
                ,deptabbfmt2
                ,casino_flag
                ,spotseqno
                ,olddeptcd
                ,deptline
                ,field_default
                ,twosection
                ,qext_actflag
                ,qext_type
                ,qext_note
                ,qreps_actflag
                ,qreps_type
                ,qreps_note
                ,dept_title_doc
                ,tel_title_doc
                ,deptabbfmt3
                ,count_seqno
                ,qfn90_actflag
                ,qfn90_type
                ,qfn90_note
                ,flag_fines_staff
                ,deptabbfmt4
                ,voa_online_flag
                ,imgdir)
            VALUES
                (src.dept_seqno
                ,src.deptcd
                ,src.deptlevel
                ,src.deptenm
                ,src.depttnm
                ,src.addr
                ,src.addno
                ,src.pv_seqno
                ,src.amp_seqno
                ,src.tmb_seqno
                ,src.zipcode
                ,src.telno
                ,src.fax
                ,src.email
                ,src.urldept
                ,src.adepttype
                ,src.conv_seqno
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.convcd
                ,src.abbrnm
                ,src.rel_code
                ,src.org_code
                ,src.detainee_flag
                ,src.org_seqno
                ,src.checkpoint
                ,src.deptabbfmt1
                ,src.deptabbfmt2
                ,src.casino_flag
                ,src.spotseqno
                ,src.olddeptcd
                ,src.deptline
                ,src.field_default
                ,src.twosection
                ,src.qext_actflag
                ,src.qext_type
                ,src.qext_note
                ,src.qreps_actflag
                ,src.qreps_type
                ,src.qreps_note
                ,src.dept_title_doc
                ,src.tel_title_doc
                ,src.deptabbfmt3
                ,src.count_seqno
                ,src.qfn90_actflag
                ,src.qfn90_type
                ,src.qfn90_note
                ,src.flag_fines_staff
                ,src.deptabbfmt4
                ,src.voa_online_flag
                ,src.imgdir)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.deptcd           = src.deptcd
               ,tgt.deptlevel        = src.deptlevel
               ,tgt.deptenm          = src.deptenm
               ,tgt.depttnm          = src.depttnm
               ,tgt.addr             = src.addr
               ,tgt.addno            = src.addno
               ,tgt.pv_seqno         = src.pv_seqno
               ,tgt.amp_seqno        = src.amp_seqno
               ,tgt.tmb_seqno        = src.tmb_seqno
               ,tgt.zipcode          = src.zipcode
               ,tgt.telno            = src.telno
               ,tgt.fax              = src.fax
               ,tgt.email            = src.email
               ,tgt.urldept          = src.urldept
               ,tgt.adepttype        = src.adepttype
               ,tgt.conv_seqno       = src.conv_seqno
               ,tgt.actflag          = src.actflag
               ,tgt.create_by        = src.create_by
               ,tgt.create_date      = src.create_date
               ,tgt.update_by        = src.update_by
               ,tgt.update_date      = src.update_date
               ,tgt.version          = src.version
               ,tgt.convcd           = src.convcd
               ,tgt.abbrnm           = src.abbrnm
               ,tgt.rel_code         = src.rel_code
               ,tgt.org_code         = src.org_code
               ,tgt.detainee_flag    = src.detainee_flag
               ,tgt.org_seqno        = src.org_seqno
               ,tgt.checkpoint       = src.checkpoint
               ,tgt.deptabbfmt1      = src.deptabbfmt1
               ,tgt.deptabbfmt2      = src.deptabbfmt2
               ,tgt.casino_flag      = src.casino_flag
               ,tgt.spotseqno        = src.spotseqno
               ,tgt.olddeptcd        = src.olddeptcd
               ,tgt.deptline         = src.deptline
               ,tgt.field_default    = src.field_default
               ,tgt.twosection       = src.twosection
               ,tgt.qext_actflag     = src.qext_actflag
               ,tgt.qext_type        = src.qext_type
               ,tgt.qext_note        = src.qext_note
               ,tgt.qreps_actflag    = src.qreps_actflag
               ,tgt.qreps_type       = src.qreps_type
               ,tgt.qreps_note       = src.qreps_note
               ,tgt.dept_title_doc   = src.dept_title_doc
               ,tgt.tel_title_doc    = src.tel_title_doc
               ,tgt.deptabbfmt3      = src.deptabbfmt3
               ,tgt.count_seqno      = src.count_seqno
               ,tgt.qfn90_actflag    = src.qfn90_actflag
               ,tgt.qfn90_type       = src.qfn90_type
               ,tgt.qfn90_note       = src.qfn90_note
               ,tgt.flag_fines_staff = src.flag_fines_staff
               ,tgt.deptabbfmt4      = src.deptabbfmt4
               ,tgt.voa_online_flag  = src.voa_online_flag
               ,tgt.imgdir           = src.imgdir;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_department || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_department;

    PROCEDURE load_flightnumbers IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_flightnumbers';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_flightnumbers;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO dl_staging4pibics.flightnumbers tgt
        USING (SELECT flightseqno
                     ,flightprefix
                     ,flightnumber
                     ,dept_seqno
                     ,allflag
                     ,cardtype
                     ,flightstartdte
                     ,flightenddte
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,flight_type
                     ,healthflag
               FROM pibicsdm2.flightnumbers) src
        ON (src.flightseqno = tgt.flightseqno)
        WHEN NOT MATCHED THEN
            INSERT
                (flightseqno
                ,flightprefix
                ,flightnumber
                ,dept_seqno
                ,allflag
                ,cardtype
                ,flightstartdte
                ,flightenddte
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,flight_type
                ,healthflag)
            VALUES
                (src.flightseqno
                ,src.flightprefix
                ,src.flightnumber
                ,src.dept_seqno
                ,src.allflag
                ,src.cardtype
                ,src.flightstartdte
                ,src.flightenddte
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.flight_type
                ,src.healthflag)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.flightprefix   = src.flightprefix
               ,tgt.flightnumber   = src.flightnumber
               ,tgt.dept_seqno     = src.dept_seqno
               ,tgt.allflag        = src.allflag
               ,tgt.cardtype       = src.cardtype
               ,tgt.flightstartdte = src.flightstartdte
               ,tgt.flightenddte   = src.flightenddte
               ,tgt.actflag        = src.actflag
               ,tgt.create_by      = src.create_by
               ,tgt.create_date    = src.create_date
               ,tgt.update_by      = src.update_by
               ,tgt.update_date    = src.update_date
               ,tgt.version        = src.version
               ,tgt.flight_type    = src.flight_type
               ,tgt.healthflag     = src.healthflag;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_flightnumbers || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_flightnumbers;

    PROCEDURE load_fs_slipsystem IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_fs_slipsystem';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_fs_slipsystem;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);

        MERGE INTO fs_slipsystem tgt
        USING (SELECT fss_seqno
                     ,system_name
                     ,system_code
                     ,system_type
                     ,actflag
                     ,prate_seqno
               FROM pibicsdm2.fs_slipsystem) src
        ON (src.fss_seqno = tgt.fss_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (fss_seqno
                ,system_name
                ,system_code
                ,system_type
                ,actflag
                ,prate_seqno)
            VALUES
                (src.fss_seqno
                ,src.system_name
                ,src.system_code
                ,src.system_type
                ,src.actflag
                ,src.prate_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.system_name = src.system_name
               ,tgt.system_code = src.system_code
               ,tgt.system_type = src.system_type
               ,tgt.actflag     = src.actflag
               ,tgt.prate_seqno = src.prate_seqno;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_fs_slipsystem || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_fs_slipsystem;

    PROCEDURE load_occupation IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_occupation';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_occupation;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO occupation tgt
        USING (SELECT occ_seqno
                     ,occcd
                     ,occtnm
                     ,occenm
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
               FROM pibicsdm2.occupation) src
        ON (src.occ_seqno = tgt.occ_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (occ_seqno
                ,occcd
                ,occtnm
                ,occenm
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version)
            VALUES
                (src.occ_seqno
                ,src.occcd
                ,src.occtnm
                ,src.occenm
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.occcd       = src.occcd
               ,tgt.occtnm      = src.occtnm
               ,tgt.occenm      = src.occenm
               ,tgt.actflag     = src.actflag
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_occupation || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_occupation;

    PROCEDURE load_paymentrate IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_paymentrate';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_paymentrate;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO paymentrate tgt
        USING (SELECT prate_seqno
                     ,prateno
                     ,pratenm
                     ,prateamount
                     ,limitamount
                     ,pratetype
                     ,fss_seqno
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,flag_system
                     ,chargedof
                     ,prateabbrenm

               FROM pibicsdm2.paymentrate) src
        ON (src.prate_seqno = tgt.prate_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (prate_seqno
                ,prateno
                ,pratenm
                ,prateamount
                ,limitamount
                ,pratetype
                ,fss_seqno
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,flag_system
                ,chargedof
                ,prateabbrenm)
            VALUES
                (src.prate_seqno
                ,src.prateno
                ,src.pratenm
                ,src.prateamount
                ,src.limitamount
                ,src.pratetype
                ,src.fss_seqno
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.flag_system
                ,src.chargedof
                ,src.prateabbrenm)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.prateno      = src.prateno
               ,tgt.pratenm      = src.pratenm
               ,tgt.prateamount  = src.prateamount
               ,tgt.limitamount  = src.limitamount
               ,tgt.pratetype    = src.pratetype
               ,tgt.fss_seqno    = src.fss_seqno
               ,tgt.actflag      = src.actflag
               ,tgt.create_by    = src.create_by
               ,tgt.create_date  = src.create_date
               ,tgt.update_by    = src.update_by
               ,tgt.update_date  = src.update_date
               ,tgt.version      = src.version
               ,tgt.flag_system  = src.flag_system
               ,tgt.chargedof    = src.chargedof
               ,tgt.prateabbrenm = src.prateabbrenm;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_paymentrate || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_paymentrate;

    PROCEDURE load_permittype IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_PERMITTYPE';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_permittype;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO permittype tgt
        USING (SELECT permit_seqno
                     ,permitcd
                     ,permitnm
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
               FROM pibicsdm2.permittype) src
        ON (src.permit_seqno = tgt.permit_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (permit_seqno
                ,permitcd
                ,permitnm
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version)
            VALUES
                (src.permit_seqno
                ,src.permitcd
                ,src.permitnm
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.permitcd    = src.permitcd
               ,tgt.permitnm    = src.permitnm
               ,tgt.actflag     = src.actflag
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_permittype || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_permittype;

    PROCEDURE load_province IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_province';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_province;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO province tgt
        USING (SELECT pv_seqno
                     ,reg_seqno
                     ,pvcd
                     ,pv_desc
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,dept_seqno
                     ,num_hotel
                     ,pv_desc_en
                     ,actflag
                     ,pl_seqno
               FROM pibicsdm2.province) src
        ON (src.pv_seqno = tgt.pv_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (pv_seqno
                ,reg_seqno
                ,pvcd
                ,pv_desc
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,dept_seqno
                ,num_hotel
                ,pv_desc_en
                ,actflag
                ,pl_seqno)
            VALUES
                (src.pv_seqno
                ,src.reg_seqno
                ,src.pvcd
                ,src.pv_desc
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.dept_seqno
                ,src.num_hotel
                ,src.pv_desc_en
                ,src.actflag
                ,src.pl_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.reg_seqno   = src.reg_seqno
               ,tgt.pvcd        = src.pvcd
               ,tgt.pv_desc     = src.pv_desc
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version
               ,tgt.dept_seqno  = src.dept_seqno
               ,tgt.num_hotel   = src.num_hotel
               ,tgt.pv_desc_en  = src.pv_desc_en
               ,tgt.actflag     = src.actflag
               ,tgt.pl_seqno    = src.pl_seqno;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_province || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_province;

    PROCEDURE load_rankcrw IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_all';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_rankcrw;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO rankcrw tgt
        USING (SELECT rankcrw_seqno
                     ,rankfullnm
                     ,ranknm
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,actflag
                     ,conv_seqno
               FROM pibicsdm2.rankcrw) src
        ON (src.rankcrw_seqno = tgt.rankcrw_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (rankcrw_seqno
                ,rankfullnm
                ,ranknm
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,actflag
                ,conv_seqno)
            VALUES
                (src.rankcrw_seqno
                ,src.rankfullnm
                ,src.ranknm
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.actflag
                ,src.conv_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.rankfullnm  = src.rankfullnm
               ,tgt.ranknm      = src.ranknm
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version
               ,tgt.actflag     = src.actflag
               ,tgt.conv_seqno  = src.conv_seqno;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_rankcrw || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_rankcrw;

    PROCEDURE load_region IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_region';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_region;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO region tgt
        USING (SELECT reg_seqno
                     ,regcd
                     ,regtnm
                     ,regenm
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,actflag

               FROM pibicsdm2.region) src
        ON (src.reg_seqno = tgt.reg_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (reg_seqno
                ,regcd
                ,regtnm
                ,regenm
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,actflag)
            VALUES
                (src.reg_seqno
                ,src.regcd
                ,src.regtnm
                ,src.regenm
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.actflag)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.regcd       = src.regcd
               ,tgt.regtnm      = src.regtnm
               ,tgt.regenm      = src.regenm
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version
               ,tgt.actflag     = src.actflag;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_region || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_region;

    PROCEDURE load_suffix IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_suffix';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_suffix;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO suffix tgt
        USING (SELECT suffix_seqno
                     ,suffix_desc
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,suffix_type
                     ,suffixorder
               FROM pibicsdm2.suffix) src
        ON (src.suffix_seqno = tgt.suffix_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (suffix_seqno
                ,suffix_desc
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,suffix_type
                ,suffixorder)
            VALUES
                (src.suffix_seqno
                ,src.suffix_desc
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.suffix_type
                ,src.suffixorder)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.suffix_desc = src.suffix_desc
               ,tgt.actflag     = src.actflag
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version
               ,tgt.suffix_type = src.suffix_type
               ,tgt.suffixorder = src.suffixorder;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_suffix || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_suffix;

    PROCEDURE load_tambon IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_tambon';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_tambon;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO tambon tgt
        USING (SELECT tmb_seqno
                     ,tmbcd
                     ,amp_seqno
                     ,tmb_desc
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,actflag
                     ,tmb_desc_en
                     ,dept_seqno
               FROM pibicsdm2.tambon) src
        ON (src.tmb_seqno = tgt.tmb_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (tmb_seqno
                ,tmbcd
                ,amp_seqno
                ,tmb_desc
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,actflag
                ,tmb_desc_en
                ,dept_seqno)
            VALUES
                (src.tmb_seqno
                ,src.tmbcd
                ,src.amp_seqno
                ,src.tmb_desc
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.actflag
                ,src.tmb_desc_en
                ,src.dept_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.tmbcd       = src.tmbcd
               ,tgt.amp_seqno   = src.amp_seqno
               ,tgt.tmb_desc    = src.tmb_desc
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version
               ,tgt.actflag     = src.actflag
               ,tgt.tmb_desc_en = src.tmb_desc_en
               ,tgt.dept_seqno  = src.dept_seqno;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_tambon || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_tambon;

    PROCEDURE load_traveldoctype IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_traveldoctype';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_traveldoctype;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO traveldoctype tgt
        USING (SELECT tdt_seqno
                     ,tdtcd
                     ,tdttnm
                     ,tdtenm
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
               FROM pibicsdm2.traveldoctype) src
        ON (src.tdt_seqno = tgt.tdt_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (tdt_seqno
                ,tdtcd
                ,tdttnm
                ,tdtenm
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version)
            VALUES
                (src.tdt_seqno
                ,src.tdtcd
                ,src.tdttnm
                ,src.tdtenm
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.tdtcd       = src.tdtcd
               ,tgt.tdttnm      = src.tdttnm
               ,tgt.tdtenm      = src.tdtenm
               ,tgt.actflag     = src.actflag
               ,tgt.create_by   = src.create_by
               ,tgt.create_date = src.create_date
               ,tgt.update_by   = src.update_by
               ,tgt.update_date = src.update_date
               ,tgt.version     = src.version;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_traveldoctype || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_traveldoctype;

    PROCEDURE load_visabynation IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_visabynation';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_visabynation;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO dl_staging4pibics.visabynation tgt
        USING (SELECT visan_seqno
                     ,countcd
                     ,visatypecd
                     ,defaultvisa
                     ,actflag
                     ,create_by
                     ,create_date
                     ,update_by
                     ,update_date
                     ,version
                     ,count_seqno
                     ,visa_seqno
                     ,visatypecdorg
                     ,fixdeptline
               FROM pibicsdm2.visabynation) src
        ON (src.visan_seqno = tgt.visan_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (visan_seqno
                ,countcd
                ,visatypecd
                ,defaultvisa
                ,actflag
                ,create_by
                ,create_date
                ,update_by
                ,update_date
                ,version
                ,count_seqno
                ,visa_seqno
                ,visatypecdorg
                ,fixdeptline)
            VALUES
                (src.visan_seqno
                ,src.countcd
                ,src.visatypecd
                ,src.defaultvisa
                ,src.actflag
                ,src.create_by
                ,src.create_date
                ,src.update_by
                ,src.update_date
                ,src.version
                ,src.count_seqno
                ,src.visa_seqno
                ,src.visatypecdorg
                ,src.fixdeptline)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.countcd       = src.countcd
               ,tgt.visatypecd    = src.visatypecd
               ,tgt.defaultvisa   = src.defaultvisa
               ,tgt.actflag       = src.actflag
               ,tgt.create_by     = src.create_by
               ,tgt.create_date   = src.create_date
               ,tgt.update_by     = src.update_by
               ,tgt.update_date   = src.update_date
               ,tgt.version       = src.version
               ,tgt.count_seqno   = src.count_seqno
               ,tgt.visa_seqno    = src.visa_seqno
               ,tgt.visatypecdorg = src.visatypecdorg
               ,tgt.fixdeptline   = src.fixdeptline;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_visabynation || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_visabynation;

    PROCEDURE load_visatype IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_visatype';
        l_step_params pkg_utils.step_params;
        l_step_status pkg_utils.step_status;
    BEGIN

        l_step_params.table_name := lc_p_visatype;
        l_step_params.timeframe  := NULL;
        pkg_utils.start_step(p_step_params => l_step_params);

        logger.log('START'
                  ,l_log_scope);
        MERGE INTO visatype tgt
        USING (SELECT visatype_seqno
                     ,visatypecd
                     ,visatypetnm
                     ,visatypeenm
                     ,permittdays
                     ,actflag
                     ,create_date
                     ,create_by
                     ,update_date
                     ,update_by
                     ,version
                     ,visatype_ext
                     ,old_visatype
               FROM pibicsdm2.visatype) src
        ON (src.visatype_seqno = tgt.visatype_seqno)
        WHEN NOT MATCHED THEN
            INSERT
                (visatype_seqno
                ,visatypecd
                ,visatypetnm
                ,visatypeenm
                ,permittdays
                ,actflag
                ,create_date
                ,create_by
                ,update_date
                ,update_by
                ,version
                ,visatype_ext
                ,old_visatype)
            VALUES
                (src.visatype_seqno
                ,src.visatypecd
                ,src.visatypetnm
                ,src.visatypeenm
                ,src.permittdays
                ,src.actflag
                ,src.create_date
                ,src.create_by
                ,src.update_date
                ,src.update_by
                ,src.version
                ,src.visatype_ext
                ,src.old_visatype)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.visatypecd   = src.visatypecd
               ,tgt.visatypetnm  = src.visatypetnm
               ,tgt.visatypeenm  = src.visatypeenm
               ,tgt.permittdays  = src.permittdays
               ,tgt.actflag      = src.actflag
               ,tgt.create_date  = src.create_date
               ,tgt.create_by    = src.create_by
               ,tgt.update_date  = src.update_date
               ,tgt.update_by    = src.update_by
               ,tgt.version      = src.version
               ,tgt.visatype_ext = src.visatype_ext
               ,tgt.old_visatype = src.old_visatype;

        l_step_status.cnt_processed := SQL%ROWCOUNT;
        COMMIT;
        pkg_utils.end_step(p_step_status => l_step_status);
        logger.log('END. ' || lc_p_visatype || ' cnt_processed:' || l_step_status.cnt_processed
                  ,l_log_scope);
    END load_visatype;

END pkg_transcode;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TRANSCODE" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TRANSCODE" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TRANSCODE" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TRANSCODE" TO "BIOSAADM";
