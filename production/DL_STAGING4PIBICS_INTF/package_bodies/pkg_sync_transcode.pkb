CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_SYNC_TRANSCODE" AS
    /*
       see architectural description at https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+Dermalog+staging+System+to+Bordercontrol

    */

    g_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';
    gc_dummy           CONSTANT VARCHAR2(1) := '?';

    gc_l_en_us CONSTANT VARCHAR2(5 CHAR) := 'en_US';
    gc_l_th_th CONSTANT VARCHAR2(5 CHAR) := 'th_TH';
    g_run_paramas pkg_utils.run_params;
    PROCEDURE check_result(p_res      IN NUMBER
                          ,p_logscope IN VARCHAR2) IS
    BEGIN
        IF p_res = 0 THEN
            logger.log_error('No data merged'
                            ,p_logscope);
            RAISE err_no_data_merged;
        END IF;
    END check_result;
    ----
    ---- PUBLIC
    ----
    /* Operation of the procedures
       The procedure here shall maintain the transcoding tables TRCD_XXXX  so that the Business Metadata (Lookups) are available to transcode the technical IDs
       of the IBICS side to the technical IDs on the DL_BORDERCONTROL/DL_COMMON side.

       PIBICS is the leading system here ! It is possible that several PIBICS-Ids map to the same DL_BORDERCONTROL/DL_COMMON id but not the other way round.

       the procedures work with at leas 3 tables each :
       * The staging table DL_STAGING4PIBICS.XXX with the new PIBICS data, its content shall be transferred to
       * the target table DL_BORDERCONTROL.XXX (or DL_COMMON.XXX) which may contain other data too, not only PIBICS data
       * in the TRCS_XXXX tale is the relation between the technical Ids on the DL_STAGING4PIBICS and the DL_BORDERCONTROL/DL_COMMON side

       Sometimes the transcoding data has dependencies and then the additional business key on the PIBICS side are included in the TRCD table.
       In this case the procedures herein shall becalled in a certain sequences, this is contrilled in the table OPS_STAGING_SYNC_PROCESSES.

       Each processs works in the following steps
       1. Merge the DL_STAGING4PIBICS data with the BUSINESS key from the PIBICS-Side into the target table in DL_BORDERCONTROL/DL_COMMON.
          The technical key of the PIBICS side can be omitted (only to be used as a descriptove attribute in the target) . Merge by the business Id .
          In case of dependencies the technical Idents of the dependant opbjects are joined here with the helop of the TRCD-tables of these objects
       2. Merge the ttechnical ID  and the business key from  DL_BORDERCONTROL/DL_COMMON
          (joined with the DL_STAGING4PIBICS date by business key to get the technical PIBICS key)
          in the TRCD-table . Merge by thge business Id .
       3. Merge the DL_STAGING4PIBICS data with the TECHNICAL DL_BORDERCONTROL/DL_COMMON key from the TRCD table in the xxx$I18N table if required.


    */

    PROCEDURE fill_region IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_region';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_region;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);

        MERGE INTO dl_bordercontrol.adm_class_region tgt
        USING (SELECT reg_seqno
                     ,regcd
                     ,regenm
                     ,actflag
               FROM (SELECT stg.reg_seqno
                           ,stg.regcd
                           ,coalesce(stg.regenm
                                    ,'(' || stg.regcd || ')') AS regenm
                           ,stg.actflag
                           ,row_number() over(PARTITION BY regcd ORDER BY reg_seqno DESC) AS rn
                     FROM dl_staging4pibics.region stg)
               WHERE rn = 1) src
        ON (src.regcd = tgt.display_code)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.regenm
               ,tgt.num_value     = src.reg_seqno
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,display_value
                ,display_code
                ,num_value
                ,is_active)
            VALUES
                (gc_l_en_us
                ,src.regenm
                ,src.regcd
                ,src.reg_seqno
                ,src.actflag);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);
        MERGE INTO trcd_region tgt
        USING (SELECT bc.key_value
                     ,bc.display_code
                     ,stg.reg_seqno
               FROM dl_bordercontrol.adm_class_region bc
               INNER JOIN dl_staging4pibics.region stg
               ON stg.regcd = display_code) src
        ON (src.display_code = tgt.code)
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno)
            VALUES
                (src.display_code
                ,src.key_value
                ,src.reg_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_bordercontrol.adm_class_region$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.regtnm
               FROM dl_staging4pibics.region stg
               INNER JOIN trcd_region trcd
               ON trcd.seqno = stg.reg_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.regtnm
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.regtnm);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_region);
        pkg_utils.end_step(p_cnt => l_res);
    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_region;

    PROCEDURE fill_province IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_province';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_province;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);

        MERGE INTO dl_bordercontrol.adm_class_province tgt
        USING (SELECT pv_seqno
                     ,pvcd
                     ,pv_desc_en
                     ,actflag
                     ,region
               FROM (SELECT stg.pv_seqno
                           ,stg.pvcd
                           ,coalesce(stg.pv_desc_en
                                    ,'(' || stg.pvcd || ')') AS pv_desc_en
                           ,stg.actflag
                           ,reg.key_value AS region
                           ,row_number() over(PARTITION BY pvcd ORDER BY pv_seqno DESC) AS rn
                     FROM dl_staging4pibics.province stg
                     INNER JOIN trcd_region reg
                     ON stg.reg_seqno = reg.seqno)
               WHERE rn = 1) src
        ON (src.pvcd = tgt.display_code)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.pv_desc_en
               ,tgt.num_value     = src.pv_seqno
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,is_active
                ,num_value
                ,display_value
                ,display_code
                ,adm_class_region)
            VALUES
                (gc_l_en_us
                ,src.actflag
                ,src.pv_seqno
                ,src.pv_desc_en
                ,src.pvcd
                ,src.region);

        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_province tgt
        USING (SELECT bc.key_value
                     ,bc.display_code
                     ,stg.pv_seqno
                     ,trcd.seqno AS higher
               FROM dl_bordercontrol.adm_class_province bc
               INNER JOIN dl_staging4pibics.province stg
               ON stg.pvcd = bc.display_code
               AND stg.actflag = bc.is_active
               INNER JOIN trcd_region trcd
               ON trcd.key_value = bc.adm_class_region
               AND stg.reg_seqno = trcd.seqno) src
        ON (src.display_code = tgt.code AND src.higher = tgt.higher) --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno
                ,higher)
            VALUES
                (src.display_code
                ,src.key_value
                ,src.pv_seqno
                ,src.higher)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_bordercontrol.adm_class_province$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.pv_desc
               FROM dl_staging4pibics.province stg
               INNER JOIN trcd_province trcd
               ON trcd.seqno = stg.pv_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.pv_desc
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.pv_desc);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_province);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_province;

    PROCEDURE fill_ampur IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_ampur';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_ampur;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_bordercontrol.adm_class_district tgt
        USING (SELECT amp_seqno
                     ,ampcd
                     ,amp_desc
                     ,actflag
                     ,amp_desc_en
                     ,province
               FROM (SELECT stg.amp_seqno
                           ,stg.ampcd
                           ,stg.amp_desc
                           ,stg.actflag
                           ,coalesce(stg.amp_desc_en
                                    ,'(' || stg.amp_seqno || ')') AS amp_desc_en
                           ,prov.key_value AS province
                           ,row_number() over(PARTITION BY ampcd ORDER BY amp_seqno DESC) AS rn
                     FROM dl_staging4pibics.ampur stg
                     INNER JOIN trcd_province prov
                     ON stg.pv_seqno = prov.seqno)
               WHERE actflag = 'Y'
               ) src
        ON (src.ampcd = tgt.display_code AND src.province = tgt.adm_class_province)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.amp_desc_en
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,is_active
                ,num_value
                ,display_value
                ,display_code
                ,adm_class_province)
            VALUES
                (gc_l_en_us
                ,src.actflag
                ,src.amp_seqno
                ,src.amp_desc_en
                ,src.ampcd
                ,src.province);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_ampur tgt
        USING (SELECT bc.key_value
                     ,bc.display_code
                     ,stg.amp_seqno
                     ,trcd.seqno AS higher
               FROM dl_bordercontrol.adm_class_district bc
               INNER JOIN trcd_province trcd
               ON trcd.key_value = bc.adm_class_province
               INNER JOIN dl_staging4pibics.ampur stg
               ON stg.ampcd = display_code
               AND stg.actflag = bc.is_active
               AND stg.pv_seqno = trcd.seqno) src
        ON (src.display_code = tgt.code AND src.higher = tgt.higher) --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno
                ,higher)
            VALUES
                (src.display_code
                ,src.key_value
                ,src.amp_seqno
                ,src.higher)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_bordercontrol.adm_class_district$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.amp_desc
               FROM dl_staging4pibics.ampur stg
               INNER JOIN trcd_ampur trcd
               ON stg.amp_seqno = trcd.seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.amp_desc
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.amp_desc);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_ampur);
        pkg_utils.end_step(p_cnt => l_res);
    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_ampur;

    PROCEDURE fill_tambon IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_tambon';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_tambon;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_bordercontrol.adm_class_subdistrict tgt
        USING (SELECT tmb_seqno
                     ,tmbcd
                     ,actflag
                     ,tmb_desc_en
                     ,district
               FROM (SELECT stg.tmb_seqno
                           ,stg.tmbcd
                           ,stg.actflag
                           ,coalesce(stg.tmb_desc_en
                                    ,'(' || stg.tmb_seqno || ')') AS tmb_desc_en
                           ,amp.key_value AS district
                           ,row_number() over(PARTITION BY tmbcd ORDER BY tmb_seqno DESC) AS rn
                     FROM dl_staging4pibics.tambon stg
                     INNER JOIN trcd_ampur amp
                     ON stg.amp_seqno = amp.seqno)
               WHERE actflag = 'Y') src
        ON (src.tmbcd = tgt.display_code AND src.district = tgt.adm_class_district)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.tmb_desc_en
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,is_active
                ,num_value
                ,display_value
                ,display_code
                ,adm_class_district)
            VALUES
                (gc_l_en_us
                ,src.actflag
                ,src.tmb_seqno
                ,src.tmb_desc_en
                ,src.tmbcd
                ,src.district);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_tambon tgt
        USING (SELECT bc.key_value
                     ,bc.display_code
                     ,stg.tmb_seqno
                     ,trcd.seqno AS higher
               FROM dl_bordercontrol.adm_class_subdistrict bc
               INNER JOIN trcd_ampur trcd
               ON trcd.key_value = bc.adm_class_district
               INNER JOIN dl_staging4pibics.tambon stg
               ON stg.tmbcd = display_code
               AND stg.actflag = bc.is_active
               AND stg.amp_seqno = trcd.seqno) src
        ON (src.display_code = tgt.code AND src.higher = tgt.higher) --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno
                ,higher)
            VALUES
                (src.display_code
                ,src.key_value
                ,src.tmb_seqno
                ,src.higher)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_bordercontrol.adm_class_subdistrict$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.tmb_desc
               FROM dl_staging4pibics.tambon stg
               INNER JOIN trcd_tambon trcd
               ON stg.tmb_seqno = trcd.seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.tmb_desc
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.tmb_desc);
        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_tambon);
        pkg_utils.end_step(p_cnt => l_res);
    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_tambon;
    --
    --  others
    --
    PROCEDURE fill_occupation IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_occupation';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_occupation;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);

        MERGE INTO dl_common.professions tgt
        USING (SELECT stg.occ_seqno
                     ,stg.occcd
                     ,coalesce(stg.occenm
                              ,'(' || stg.occ_seqno || ')') AS occenm
                     ,stg.actflag
               FROM dl_staging4pibics.occupation stg) src
        ON (to_number(src.occcd) = tgt.num_value)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.occenm
               ,tgt.display_code  = src.occcd
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,display_value
                ,num_value
                ,display_code
                ,is_active)
            VALUES
                (gc_l_en_us
                ,src.occenm
                ,to_number(src.occcd)
                ,src.occcd
                ,src.actflag);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_occupation tgt
        USING (SELECT bc.key_value
                     ,bc.display_code
                     ,stg.occ_seqno
               FROM dl_common.professions bc
               INNER JOIN dl_staging4pibics.occupation stg
               ON stg.occcd = display_code) src
        ON (src.display_code = tgt.code)
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno)
            VALUES
                (src.display_code
                ,src.key_value
                ,src.occ_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_common.professions$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.occtnm
               FROM dl_staging4pibics.occupation stg
               INNER JOIN trcd_occupation trcd
               ON trcd.seqno = stg.occ_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.occtnm
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.occtnm);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_occupation);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_occupation;

    PROCEDURE fill_suffix IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_suffix';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_suffix;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_common.salutations tgt
        USING (SELECT stg.suffix_seqno
                     ,CASE
                          WHEN stg.suffix_type = 'T' THEN
                           stg.suffix_desc
                          ELSE
                           '(' || stg.suffix_seqno || ')'
                      END AS suffix_desc
                     ,CASE
                          WHEN stg.suffix_type = 'E' THEN
                           stg.suffix_desc
                          ELSE
                           '(' || stg.suffix_seqno || ')'
                      END AS suffix_desc_en
                     ,stg.suffix_type
                     ,stg.actflag
               FROM dl_staging4pibics.suffix stg) src
        ON (src.suffix_seqno = tgt.display_code) --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.suffix_desc_en
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,is_active
                ,display_value
                ,display_code
                ,num_value)
            VALUES
                (gc_l_en_us
                ,src.actflag
                ,src.suffix_desc_en
                ,src.suffix_seqno
                ,src.suffix_seqno);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_suffix tgt
        USING (SELECT bc.key_value
                     ,bc.display_code
                     ,stg.suffix_seqno
               FROM dl_common.salutations bc
               INNER JOIN dl_staging4pibics.suffix stg
               ON stg.suffix_seqno = display_code) src --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
        ON (src.display_code = tgt.seqno) --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,seqno)
            VALUES
                (src.key_value
                ,src.suffix_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_common.salutations$i18n tgt
        USING (SELECT trcd.key_value
                     ,CASE
                          WHEN stg.suffix_type = 'T' THEN
                           stg.suffix_desc
                          ELSE
                           '(' || stg.suffix_seqno || ')'
                      END AS suffix_desc
                     ,CASE
                          WHEN stg.suffix_type = 'E' THEN
                           stg.suffix_desc
                          ELSE
                           '(' || stg.suffix_seqno || ')'
                      END AS suffix_desc_en
               FROM dl_staging4pibics.suffix stg
               INNER JOIN trcd_suffix trcd
               ON trcd.seqno = stg.suffix_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.suffix_desc
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.suffix_desc);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_suffix);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_suffix;

    PROCEDURE fill_visatype IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_visatype';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_visatype;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_common.visa_types tgt
        USING (SELECT stg.visatype_seqno
                     ,upper(stg.visatypecd) AS visatypecd
                     ,stg.actflag
                     ,coalesce(stg.visatypeenm
                              ,'(' || stg.visatypecd || ')') AS visatype_desc_en
               FROM dl_staging4pibics.visatype stg) src
        ON (src.visatypecd = tgt.key_value)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.visatype_desc_en
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,is_active
                ,display_value
                ,notice)
            VALUES
                (src.visatypecd
                ,gc_l_en_us
                ,src.actflag
                ,src.visatype_desc_en
                ,src.visatype_seqno);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_visatype tgt
        USING (SELECT bc.key_value
                     ,bc.key_value AS visatypecd
                     ,stg.visatype_seqno
               FROM dl_common.visa_types bc
               INNER JOIN dl_staging4pibics.visatype stg
               ON stg.visatypecd = bc.key_value) src
        ON (src.visatypecd = tgt.code)
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno)
            VALUES
                (src.visatypecd
                ,src.key_value
                ,src.visatype_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_common.visa_types$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.visatypetnm
               FROM dl_staging4pibics.visatype stg
               INNER JOIN trcd_visatype trcd
               ON trcd.seqno = stg.visatype_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.visatypetnm
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.visatypetnm);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_visatype);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_visatype;

    -- TODO: dl_common.trans_vehicles.trans_mode
    PROCEDURE fill_conveyance IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_conveyance';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_conveyance;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);

        MERGE INTO dl_common.trans_vehicles tgt
        USING (SELECT stg.conv_seqno
                     ,stg.convcd
                     ,stg.actflag
                     ,coalesce(stg.convenm
                              ,'(' || stg.conv_seqno || ')') AS conv_desc_en
               FROM dl_staging4pibics.conveyance stg) src
        ON (src.convcd = tgt.key_value)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.conv_desc_en
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,is_active
                ,display_value
                ,notice)
            VALUES
                (src.convcd
                ,gc_l_en_us
                ,src.actflag
                ,src.conv_desc_en
                ,src.conv_seqno);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_conveyance tgt
        USING (SELECT bc.key_value
                     ,bc.key_value AS convcd
                     ,stg.conv_seqno
               FROM dl_common.trans_vehicles bc
               INNER JOIN dl_staging4pibics.conveyance stg
               ON stg.convcd = bc.key_value) src
        ON (src.convcd = tgt.code)
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno)
            VALUES
                (src.convcd
                ,src.key_value
                ,src.conv_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_common.trans_vehicles$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.convtnm
               FROM dl_staging4pibics.conveyance stg
               INNER JOIN trcd_conveyance trcd
               ON trcd.seqno = stg.conv_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.convtnm
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.convtnm);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_conveyance);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_conveyance;

    PROCEDURE fill_traveldoctype IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_traveldoctype';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_traveldoctype;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_common.bc_doc_class tgt
        USING (SELECT stg.tdt_seqno
                     ,stg.tdtcd
                     ,stg.actflag
                     ,coalesce(stg.tdtenm
                              ,'(' || stg.tdt_seqno || ')') AS traveldoc_desc_en
               FROM dl_staging4pibics.traveldoctype stg) src
        ON (to_number(src.tdtcd DEFAULT 0
        ON conversion error) = to_number(tgt.key_value DEFAULT 9999
        ON conversion error))
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.traveldoc_desc_en
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,is_active
                ,display_value
                ,num_value)
            VALUES
                (to_number(src.tdtcd DEFAULT 0 ON conversion error)
                ,gc_l_en_us
                ,src.actflag
                ,src.traveldoc_desc_en
                ,src.tdt_seqno);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_traveldoctype tgt
        USING (SELECT bc.key_value
                     ,bc.key_value AS tdtcd
                     ,stg.tdt_seqno
               FROM dl_common.bc_doc_class bc
               INNER JOIN dl_staging4pibics.traveldoctype stg
               ON to_number(stg.tdtcd DEFAULT 0 ON conversion error) =
                  to_number(bc.key_value DEFAULT 0 ON conversion error)) src
        ON (to_number(src.key_value DEFAULT 0
        ON conversion error) = to_number(tgt.code DEFAULT 0
        ON conversion error))
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno)
            VALUES
                (src.tdtcd
                ,src.key_value
                ,src.tdt_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_common.bc_doc_class$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.tdttnm
               FROM dl_staging4pibics.traveldoctype stg
               INNER JOIN trcd_traveldoctype trcd
               ON trcd.seqno = stg.tdt_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.tdttnm
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.tdttnm);
        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_traveldoctype);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_traveldoctype;

    PROCEDURE fill_permittype IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_permittype';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_permittype;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_bordercontrol.faf_permit_type tgt
        USING (SELECT stg.permit_seqno
                     ,stg.permitcd
                     ,stg.actflag
                     ,'(' || stg.permit_seqno || ')' AS permit_desc_en
               FROM dl_staging4pibics.permittype stg) src
        ON (src.permitcd = tgt.display_code)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.permit_desc_en
               ,tgt.is_active     = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,is_active
                ,display_value
                ,display_code
                ,notice)
            VALUES
                (gc_l_en_us
                ,src.actflag
                ,src.permit_desc_en
                ,src.permitcd
                ,src.permit_seqno);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_permittype tgt
        USING (SELECT bc.key_value     AS key_value
                     ,bc.display_code  AS permitcd
                     ,stg.permit_seqno
               FROM dl_bordercontrol.faf_permit_type bc
               INNER JOIN dl_staging4pibics.permittype stg
               ON stg.permitcd = bc.display_code) src
        ON (src.permitcd = tgt.code)
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno)
            VALUES
                (src.permitcd
                ,src.key_value
                ,src.permit_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_bordercontrol.faf_permit_type$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.permitnm
               FROM dl_staging4pibics.permittype stg
               INNER JOIN trcd_permittype trcd
               ON trcd.seqno = stg.permit_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.permitnm
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.permitnm);
        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_permittype);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_permittype;

    PROCEDURE fill_paymentrate IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_paymentrate';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_paymentrate;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_bordercontrol.faf_payment_rate tgt
        USING (SELECT stg.prate_seqno
                     ,stg.prateno
                     ,stg.actflag
                     ,coalesce(NULL
                              ,'(' || stg.prate_seqno || ')') AS prate_desc_en
                     ,stg.prateamount
                     ,stg.limitamount
                     ,stg.pratetype
                     ,stg.prateabbrenm
                     ,CASE
                          WHEN stg.limitamount IS NOT NULL
                               AND stg.limitamount < stg.prateamount THEN
                           NULL
                          ELSE
                           stg.limitamount
                      END AS cost_limit
               FROM dl_staging4pibics.paymentrate stg) src
        ON (src.prateno = tgt.display_code)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value       = src.prate_desc_en
               ,tgt.costs_regular       = src.prateamount
               ,tgt.costs_limit         = src.cost_limit
               ,tgt.payment_type        = src.pratetype
               ,tgt.display_value_short = src.prateabbrenm
               ,tgt.is_active           = src.actflag
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,is_active
                ,display_value
                ,display_code
                ,costs_regular
                ,costs_limit
                ,payment_type
                ,display_value_short
                ,notice)
            VALUES
                (gc_l_en_us
                ,src.actflag
                ,src.prate_desc_en
                ,src.prateno
                ,src.prateamount
                ,src.cost_limit
                ,src.pratetype
                ,src.prateabbrenm
                ,src.prateno);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_paymentrate tgt
        USING (SELECT bc.key_value
                     ,bc.display_code AS prateno
                     ,stg.prate_seqno
               FROM dl_bordercontrol.faf_payment_rate bc
               INNER JOIN dl_staging4pibics.paymentrate stg
               ON stg.prateno = bc.display_code) src
        ON (src.prateno = tgt.code) --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno)
            VALUES
                (src.prateno
                ,src.key_value
                ,src.prate_seqno)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        MERGE INTO dl_bordercontrol.faf_payment_rate$i18n tgt
        USING (SELECT trcd.key_value
                     ,substr(stg.pratenm
                            ,1
                            ,128) AS prate_desc_th
               FROM dl_staging4pibics.paymentrate stg
               INNER JOIN trcd_paymentrate trcd
               ON trcd.seqno = stg.prate_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.prate_desc_th
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.prate_desc_th);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_paymentrate);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_paymentrate;

    PROCEDURE fill_continent IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_continent';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_continent;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);

        MERGE INTO dl_common.continents tgt
        USING (SELECT stg.continent_seqno
                     ,stg.continentcd
                     ,stg.actflag
                     ,stg.continent_seqno AS rpt_sort
                     ,coalesce(continentenm
                              ,'(' || stg.continent_seqno || ')') AS continent_desc_en

               FROM dl_staging4pibics.continent stg) src
        ON (src.continentcd = tgt.display_code)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.continent_desc_en
               ,tgt.is_active     = src.actflag
               ,tgt.display_order = src.rpt_sort
               ,tgt.num_value     = src.continent_seqno
        WHEN NOT MATCHED THEN
            INSERT
                (locale
                ,display_code
                ,is_active
                ,display_value
                ,display_order
                ,num_value)
            VALUES
                (gc_l_en_us
                ,src.continentcd
                ,src.actflag
                ,src.continent_desc_en
                ,src.continent_seqno
                ,src.continent_seqno);

        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_continent tgt
        USING (SELECT bc.key_value
                     ,stg.continentcd
                     ,stg.continent_seqno
               FROM dl_common.continents bc
               INNER JOIN dl_staging4pibics.continent stg
               ON stg.continentcd = bc.display_code) src
        ON (src.continentcd = tgt.code)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value
        WHEN NOT MATCHED THEN
            INSERT
                (seqno
                ,code
                ,key_value)
            VALUES
                (src.continent_seqno
                ,src.continentcd
                ,src.key_value);

        MERGE INTO dl_common.continents$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.continenttnm
               FROM dl_staging4pibics.continent stg
               INNER JOIN trcd_continent trcd
               ON trcd.seqno = stg.continent_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.continenttnm
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.continenttnm);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_continent);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN

            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_continent;

    PROCEDURE fill_country IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_country';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_country;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        FOR r IN (SELECT stg.count_seqno
                        ,stg.countcd
                        ,stg.actflag
                        ,coalesce(countenm
                                 ,'(' || stg.count_seqno || ')') AS count_desc_en
                        ,stg.rpt_sort
                        ,stg.abbcount
                        ,pkg_transcode.get_continent(p_cd_or_seqno => stg.continentcd
                                                    ,p_optional    => 1) AS continent
                        ,row_number() over(PARTITION BY abbcount ORDER BY count_seqno DESC) AS rn
                  FROM dl_staging4pibics.country stg)
        LOOP
            IF r.rn > 1 THEN
                NULL;
            ELSE
                UPDATE dl_common.countries tgt
                SET tgt.display_value = r.count_desc_en
                   ,tgt.is_active     = r.actflag
                   ,tgt.display_order = r.rpt_sort
                   ,tgt.num_value     = r.count_seqno || r.rpt_sort
                   ,tgt.notice        = r.countcd
                   ,tgt.continent     = r.continent
                WHERE tgt.key_value = r.abbcount;
                IF SQL%ROWCOUNT = 0 THEN
                    INSERT INTO dl_common.countries
                        (key_value
                        ,locale
                        ,is_active
                        ,display_value
                        ,display_order
                        ,num_value
                        ,notice
                        ,continent
                        ,iso3166_a3
                        ,iso3166_a2)
                    VALUES
                        (r.abbcount
                        ,gc_l_en_us
                        ,r.actflag
                        ,r.count_desc_en
                        ,r.rpt_sort
                        ,r.count_seqno || r.rpt_sort
                        ,r.countcd
                        ,r.continent
                        ,coalesce(r.abbcount
                                 ,gc_dummy)
                        ,gc_dummy);
                END IF;
            END IF;
        END LOOP;

        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_country tgt
        USING (SELECT bc.key_value
                     ,stg.countcd
                     ,stg.count_seqno
               FROM dl_common.countries bc
               INNER JOIN (SELECT count_seqno
                                ,countcd
                                ,abbcount
                          FROM (SELECT stg.count_seqno
                                      ,stg.countcd
                                      ,stg.abbcount
                                      ,row_number() over(PARTITION BY abbcount ORDER BY count_seqno DESC) AS rn
                                FROM dl_staging4pibics.country stg)
                          WHERE rn = 1) stg
               ON stg.abbcount = bc.key_value) src
        ON (src.key_value = tgt.key_value)
        WHEN NOT MATCHED THEN
            INSERT
                (code
                ,key_value
                ,seqno)
            VALUES
                (src.countcd
                ,src.key_value
                ,src.count_seqno);

        MERGE INTO dl_common.countries$i18n tgt
        USING (SELECT trcd.key_value
                     ,stg.counttnm
               FROM dl_staging4pibics.country stg
               INNER JOIN trcd_country trcd
               ON trcd.seqno = stg.count_seqno) src
        ON (src.key_value = tgt.key_value AND tgt.locale = gc_l_th_th)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.display_value = src.counttnm
        WHEN NOT MATCHED THEN
            INSERT
                (key_value
                ,locale
                ,display_value)
            VALUES
                (src.key_value
                ,gc_l_th_th
                ,src.counttnm);

        DELETE FROM trcd_icao_doc_codes;
        INSERT INTO trcd_icao_doc_codes
            (code
            ,key_value
            ,seqno)
            WITH stg_country_basis AS
             (SELECT stg.count_seqno
                    ,stg.countcd
                    ,stg.abbcount
                    ,row_number() over(PARTITION BY abbcount ORDER BY count_seqno DESC) AS rn
              FROM dl_staging4pibics.country stg),
            stg_country AS
             (SELECT count_seqno
                    ,countcd
                    ,abbcount
              FROM stg_country_basis
              WHERE rn = 1),
            countries_with_corrections AS
             (SELECT coalesce(cid.icao_code
                             ,c.key_value) AS corrected_key_value
                    ,c.key_value
                    ,CASE
                         WHEN coalesce(cid.icao_code
                                      ,c.key_value) <> c.key_value THEN
                          0
                         ELSE
                          1
                     END AS value_is_not_changed
              FROM dl_common.countries c
              LEFT JOIN dl_common.countries_icao_doc_codes cid
              ON c.key_value = cid.country),
            large_result AS
             (SELECT corrected_key_value
                    ,key_value
                    ,count_seqno
                    ,countcd
                    ,row_number() over(PARTITION BY corrected_key_value ORDER BY value_is_not_changed) AS changed_values_have_priority
              FROM countries_with_corrections cwc
              INNER JOIN stg_country stg
              ON (stg.abbcount = cwc.key_value))
            SELECT countcd
                  ,corrected_key_value
                  ,count_seqno
            FROM large_result
            WHERE changed_values_have_priority = 1;
        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_country);
        pkg_utils.end_step(p_cnt => l_res);
    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_country;

    PROCEDURE fill_flightnumbers IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_flightnumbers';
        --
        l_terminal_borderpost_rec pkg_hacks.terminal_borderpost_r := pkg_hacks.get_dummy_terminal_in();
        l_res                     PLS_INTEGER := 0;
        l_step_params             pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_flightnumbers;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_bordercontrol.flights tgt
        USING (SELECT flightseqno
                     ,flightnum
                     ,directionflg
                     ,flightstartdte
                     ,flightenddte
                     ,actflag
               FROM (SELECT stg.flightseqno
                           ,TRIM(stg.flightprefix) || TRIM(stg.flightnumber) AS flightnum
                           ,pkg_from_pibics.cardtype(stg.cardtype) AS directionflg
                           ,stg.flightstartdte
                           ,stg.flightenddte
                           ,decode(stg.actflag
                                  ,'ACTIVE'
                                  ,'1'
                                  ,'CANCEL'
                                  ,'0') AS actflag
                           ,row_number() over(PARTITION BY TRIM(stg.flightprefix) || TRIM(stg.flightnumber), stg.cardtype ORDER BY stg.flightseqno DESC) AS rn
                     FROM dl_staging4pibics.flightnumbers stg
                     WHERE stg.cardtype IN (1 --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
                                           ,2)) --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
               WHERE rn = 1
               ) src
        ON (src.flightnum = tgt.flightnum AND src.directionflg = tgt.directionflg)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.active        = src.actflag
               ,tgt.timedeparture = src.flightstartdte
               ,tgt.timearrival   = src.flightenddte
        WHEN NOT MATCHED THEN
            INSERT
                (flightnum
                ,timedeparture
                ,timearrival
                ,active
                ,directionflg
                ,ins_terminal
                ,ins_borderpost)
            VALUES
                (src.flightnum
                ,src.flightstartdte
                ,src.flightenddte
                ,src.actflag
                ,src.directionflg
                ,l_terminal_borderpost_rec.terminal
                ,l_terminal_borderpost_rec.borderpost);
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_flightnumbers tgt
        USING (SELECT bc.flightnum    AS flightnum
                     ,bc.flghtid      AS key_value
                     ,bc.directionflg
                     ,stg.flightseqno
               FROM dl_bordercontrol.flights bc
               INNER JOIN (SELECT flightseqno
                                ,flightnum
                                ,directionflg
                          FROM (SELECT stg.flightseqno
                                      ,TRIM(stg.flightprefix) || TRIM(stg.flightnumber) AS flightnum
                                      ,pkg_from_pibics.cardtype(stg.cardtype) AS directionflg
                                      ,row_number() over(PARTITION BY TRIM(stg.flightprefix) || TRIM(stg.flightnumber), stg.cardtype ORDER BY stg.flightseqno DESC) AS rn
                                FROM dl_staging4pibics.flightnumbers stg
                                WHERE stg.cardtype IN (1 --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
                                                      ,2)) --ignore PLW-07204: conversion away from column type may result in sub-optimal query plan
                          WHERE rn = 1) stg
               ON stg.flightnum = bc.flightnum
               AND stg.directionflg = bc.directionflg) src
        ON (src.flightnum = tgt.flightnum AND src.directionflg = tgt.direction)
        WHEN NOT MATCHED THEN
            INSERT
                (seqno
                ,flightnum
                ,direction
                ,key_value)
            VALUES
                (src.flightseqno
                ,src.flightnum
                ,src.directionflg
                ,src.key_value)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.key_value = src.key_value;

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_flightnumbers);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_flightnumbers;

    PROCEDURE fill_visabynation IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope   logger_logs.scope%TYPE := g_log_scope_prefix || 'fill_visabynation';
        l_res         PLS_INTEGER := 0;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_step_params.table_name := gc_t_visabynation;
        pkg_utils.start_step(p_step_params => l_step_params);
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        MERGE INTO dl_common.country$visa_type tgt
        USING (SELECT stg.visan_seqno
                     ,c.key_value     AS country
                     ,v.key_value     AS visatype
                     ,stg.defaultvisa
                     ,stg.actflag
               FROM (SELECT stg.visan_seqno
                           ,stg.count_seqno
                           ,stg.visa_seqno
                           ,stg.defaultvisa
                           ,stg.actflag
                           ,row_number() over(PARTITION BY stg.count_seqno, stg.visa_seqno ORDER BY visan_seqno DESC) AS rn
                     FROM dl_staging4pibics.visabynation stg) stg
               INNER JOIN trcd_country c
               ON c.seqno = stg.count_seqno
               INNER JOIN trcd_visatype v
               ON v.seqno = stg.visa_seqno
               WHERE stg.rn = 1) src
        ON (src.country = tgt.country AND src.visatype = tgt.visa_type)
        WHEN NOT MATCHED THEN
            INSERT
                (country
                ,visa_type
                ,is_default)
            VALUES
                (src.country
                ,src.visatype
                ,src.defaultvisa)
        WHEN MATCHED THEN
            UPDATE
            SET tgt.is_default = src.defaultvisa;
        l_res := SQL%ROWCOUNT;
        check_result(p_res      => l_res
                    ,p_logscope => l_log_scope);

        MERGE INTO trcd_visabynation tgt
        USING (SELECT bc.country
                     ,bc.visa_type
                     ,stg.visan_seqno
               FROM dl_common.country$visa_type bc
               INNER JOIN trcd_country c
               ON c.key_value = bc.country
               INNER JOIN trcd_visatype v
               ON v.key_value = bc.visa_type
               INNER JOIN dl_staging4pibics.visabynation stg
               ON stg.count_seqno = c.seqno
               AND stg.visa_seqno = v.seqno) src
        ON (src.country = tgt.key_value_country AND src.visa_type = tgt.key_value_visa_type)
        WHEN NOT MATCHED THEN
            INSERT
                (seqno
                ,key_value_country
                ,key_value_visa_type)
            VALUES
                (src.visan_seqno
                ,src.country
                ,src.visa_type);

        COMMIT;
        pkg_utils.update_transcode_counter(p_trcd_table => gc_t_visabynation);
        pkg_utils.end_step(p_cnt => l_res);

    EXCEPTION
        WHEN OTHERS THEN
            pkg_utils.record_error_and_end_step(SQLERRM);
            RAISE;
    END fill_visabynation;

BEGIN
    g_run_paramas.process_name := gc_process_name;
    g_run_paramas.tag          := to_char(SYSDATE
                                         ,'YYYYMMDD-HH24MISS');
    pkg_utils.start_run(p_params => g_run_paramas);

    pkg_preferences.get_and_use_logger_preferences;
END pkg_sync_transcode;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_SYNC_TRANSCODE" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_SYNC_TRANSCODE" TO "PIBICSAPP";
