CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_BC_THAIPASSPORT" AS
    g_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    g_tablenames pkg_utils.tablenames;

    PROCEDURE log_error(p_rec IN err$_sync_thaipassport%ROWTYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        INSERT INTO dl_staging4pibics_intf.err$_sync_thaipassport
            (ora_err_number$
            ,ora_err_mesg$
            ,ora_err_tag$
            ,create_date
            ,citizenid
            ,passportno)
        VALUES
            (p_rec.ora_err_number$
            ,p_rec.ora_err_mesg$
            ,p_rec.ora_err_tag$
            ,p_rec.create_date
            ,p_rec.citizenid
            ,p_rec.passportno);
        COMMIT;
    END log_error;
    --
    -- P U B L I C
    --
    PROCEDURE insert_target(p_tag IN log_run_steps.tag%TYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope      logger_logs.scope%TYPE := g_log_scope_prefix || 'insert_target';
        l_cnt_insert     NUMBER := 0;
        l_cnt_processed  NUMBER := 0;
        l_cnt_duplicates NUMBER := 0;
        l_cnt_errors     NUMBER := 0;
        l_step_params    pkg_utils.step_params;
        CURSOR c_batch IS
            SELECT *
            FROM sync_thaipassport m
            WHERE is_active_in_mvlog = 'Y'
            AND row_shall_be_ignored = 'N'
            AND key_value IS NULL
            OR (currentness_in_pibics > currentness_in_bc);
        l_err_rec         err$_sync_thaipassport%ROWTYPE;
        l_row_is_in_error BOOLEAN;
        l_temptab         t_sync_tab;
        l_key_value       dl_bordercontrol.thaipassport.key_value%TYPE;
    BEGIN
        l_step_params.table_name := g_tablenames.backend_table;
        pkg_utils.start_step(p_step_params => l_step_params);
--        SELECT SUM(to_insert)
--        INTO l_cnt_insert
--        FROM dl_staging4pibics_intf.cnt_sync
--        WHERE sync_table_name = g_tablenames.sync_table;
--        IF l_cnt_insert = 0 THEN
--            logger.log('Nothing to insert for ' || g_tablenames.backend_table
--                      ,l_log_scope);
--            pkg_utils.end_empty_step;
--            RETURN;
--        END IF;
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        OPEN c_batch;
        LOOP
            FETCH c_batch BULK COLLECT
                INTO l_temptab LIMIT 10000;
            EXIT WHEN l_temptab.count = 0;
            FOR r IN (WITH basis AS
                           (SELECT citizenid
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
                           FROM dl_staging4pibics.thaipassport)
                          SELECT tt.citizenid
                                ,tt.passportno
                                ,s.personid
                                ,s.passno
                                ,s.tfamilynm
                                ,s.tfirstnm
                                ,s.tmiddlenm
                                ,s.efamilynm
                                ,s.efirstnm
                                ,s.emiddlenm
                                ,s.sex
                                ,s.nationcd
                                ,s.height
                                ,s.weight
                                ,s.addr
                                ,s.district
                                ,s.citycd
                                ,s.statecd
                                ,s.zipcode
                                ,s.telno
                                ,s.passportdte
                                ,s.passportexpdte
                                ,s.microrollno
                                ,s.micropicno
                                ,s.micropicnol
                                ,s.birthdte
                                ,s.birthplace
                                ,s.domicile
                                ,s.pps_seqno
                                ,s.pass_seqno
                                ,s.create_date
                                ,s.update_date
                                ,s.typedpassport
                                ,s.passportsts
                                ,s.tmppass_seqno
                          FROM TABLE(l_temptab) tt
                          INNER JOIN basis s
                          ON tt.citizenid = s.citizenid
                          AND tt.passportno = s.passportno)
            LOOP
                l_row_is_in_error := FALSE;
                BEGIN
                    INSERT INTO dl_bordercontrol.thaipassport
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
                        ,tmppass_seqno)
                    VALUES
                        (r.citizenid
                        ,r.personid
                        ,r.passportno
                        ,r.passno
                        ,r.tfamilynm
                        ,r.tfirstnm
                        ,r.tmiddlenm
                        ,r.efamilynm
                        ,r.efirstnm
                        ,r.emiddlenm
                        ,r.sex
                        ,r.nationcd
                        ,r.height
                        ,r.weight
                        ,r.addr
                        ,r.district
                        ,r.citycd
                        ,r.statecd
                        ,r.zipcode
                        ,r.telno
                        ,r.passportdte
                        ,r.passportexpdte
                        ,r.microrollno
                        ,r.micropicno
                        ,r.micropicnol
                        ,r.birthdte
                        ,r.birthplace
                        ,r.domicile
                        ,r.pps_seqno
                        ,r.pass_seqno
                        ,r.create_date
                        ,r.update_date
                        ,r.typedpassport
                        ,r.passportsts
                        ,r.tmppass_seqno)
                    RETURNING key_value INTO l_key_value;
                    l_cnt_processed := l_cnt_processed + 1;
                EXCEPTION
                    WHEN dup_val_on_index THEN
                        l_cnt_duplicates := l_cnt_duplicates + 1;
                    WHEN OTHERS THEN
                        --ignore PLW-06009: procedure "INSERT_TARGET" OTHERS handler does not end in RAISE or RAISE_APPLICATION_ERROR
                        l_err_rec.ora_err_number$ := SQLCODE;
                        l_err_rec.ora_err_mesg$   := SQLERRM;
                        l_err_rec.ora_err_tag$    := p_tag;
                        l_err_rec.create_date     := r.create_date;
                        l_err_rec.citizenid       := r.citizenid;
                        l_err_rec.passportno      := r.passportno;
                        log_error(p_rec => l_err_rec);
                        l_row_is_in_error := TRUE;
                        l_cnt_errors      := l_cnt_errors + 1;
                        CONTINUE;
                END;
                IF NOT l_row_is_in_error THEN
                    UPDATE sync_thaipassport tgt
                    SET tgt.key_value     = l_key_value
                       ,currentness_in_bc = SYSDATE
                    WHERE citizenid = r.citizenid
                    AND passportno = r.passportno;
                END IF;
            END LOOP;
        END LOOP;
        CLOSE c_batch;

        COMMIT;
        pkg_utils.update_sync_counter(p_tablenames => g_tablenames);
        IF (l_cnt_errors + l_cnt_duplicates) > 0 THEN
            pkg_utils.record_event(p_event => 'Errors : ' || l_cnt_errors || ', Duplicates : ' || l_cnt_duplicates);
        END IF;
        pkg_utils.end_step(p_cnt        => l_cnt_processed
                          ,p_tablenames => g_tablenames);
    END insert_target;
BEGIN
    g_tablenames := pkg_utils.get_tablenames_backend(p_sync_table_name => gc_process_name
                                                    ,p_pibics_table_cd => NULL);
END pkg_bc_thaipassport;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_THAIPASSPORT" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_THAIPASSPORT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_THAIPASSPORT" TO "BIOSUPPORT";
