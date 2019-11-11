CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_BC_MOVEMENTS" AS

    g_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    PROCEDURE log_error(p_rec IN err$_sync_movements%ROWTYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        INSERT INTO dl_staging4pibics_intf.err$_sync_movements
            (ora_err_number$
            ,ora_err_mesg$
            ,ora_err_tag$
            ,seqno
            ,exitflg
            ,mvmntid
            ,kv_entry_forms
            ,brddocid
            ,movement_dt
            ,tm6no
            ,doctype
            ,docno
            ,issuectry
            ,nat
            ,dob
            ,expirydate
            ,givenname
            ,surname
            ,pibics_table_cd)
        VALUES
            (p_rec.ora_err_number$
            ,p_rec.ora_err_mesg$
            ,p_rec.ora_err_tag$
            ,p_rec.seqno
            ,p_rec.exitflg
            ,p_rec.mvmntid
            ,p_rec.kv_entry_forms
            ,p_rec.brddocid
            ,p_rec.movement_dt
            ,p_rec.tm6no
            ,p_rec.doctype
            ,p_rec.docno
            ,p_rec.issuectry
            ,p_rec.nat
            ,p_rec.dob
            ,p_rec.expirydate
            ,p_rec.givenname
            ,p_rec.surname
            ,p_rec.pibics_table_cd);
        COMMIT;
    END log_error;

    -- P U B L I C
    --
    PROCEDURE save_pibics_transaction(i_mvmntid               IN dl_staging4pibics_intf.sync_movements.mvmntid%TYPE
                                     , --PK of DL_BORDERCONTROL  table
                                      i_seqno                 IN dl_staging4pibics_intf.sync_movements.seqno%TYPE
                                     , --PK of PIBICS table
                                      i_brddocid              IN dl_staging4pibics_intf.sync_movements.brddocid%TYPE
                                     , --ID of DL_BORDERCONTROL.BORDERDOCUMENTS
                                      i_currentness_in_pibics IN dl_staging4pibics_intf.sync_movements.currentness_in_pibics%TYPE
                                     , --The update or create date in the source
                                      i_currentness_in_bc     IN dl_staging4pibics_intf.sync_movements.currentness_in_bc%TYPE --The update or create date in the source
                                      ) IS
        --Logging
        l_scope  logger_logs.scope%TYPE := g_log_scope_prefix || 'save_pibics_transaction';
        l_params logger.tab_param;

    BEGIN
        logger.log('SAVE PIBICS RESPONSE TO SNY TABLE: start'
                  ,l_scope
                  ,NULL
                  ,l_params);

        INSERT INTO sync_movements
            (mvmntid
            ,seqno
            ,brddocid
            ,currentness_in_pibics
            ,currentness_in_bc
            ,movement_dt)
        VALUES
            (i_mvmntid
            ,i_seqno
            ,i_brddocid
            ,i_currentness_in_pibics
            ,i_currentness_in_bc
            ,SYSDATE);
        COMMIT;

        logger.log('SAVE PIBICS RESPONSE TO SNY TABLE: end'
                  ,l_scope
                  ,NULL
                  ,l_params);
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('RECEIVE RESPONCE FROM PIBICS: unhandled exeption'
                            ,l_scope
                            ,NULL
                            ,l_params);
            RAISE;
    END save_pibics_transaction;

    PROCEDURE insert_target(p_tag IN log_run_steps.tag%TYPE) IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'insert_target';
        l_cnt_insert          NUMBER := 0;
        l_cnt_processed       NUMBER := 0;
        l_cnt_duplicates      NUMBER := 0;
        l_cnt_errors          NUMBER := 0;
        l_borderpost_terminal pkg_transcode.borderpost_terminal;
        l_mvmntid             dl_bordercontrol.movements.mvmntid%TYPE;
        l_brddocid            dl_bordercontrol.borderdocuments.brddocid%TYPE;
        l_kv_entry_forms      dl_bordercontrol.entry_forms.key_value%TYPE;
        l_err_rec             err$_sync_movements%ROWTYPE;
        l_row_is_in_error     BOOLEAN;
        lc_pibics_table_cd    VARCHAR2(1 CHAR) := 'T';
        l_step_params         pkg_utils.step_params;
        l_tablenames          pkg_utils.tablenames;
    BEGIN
        l_tablenames             := pkg_utils.get_tablenames_backend(p_sync_table_name => gc_process_name
                                                                    ,p_pibics_table_cd => 'T');
        l_step_params.table_name := l_tablenames.backend_table;
        pkg_utils.start_step(p_step_params => l_step_params);
        SELECT SUM(CASE
                       WHEN mvmntid IS NULL
                            OR brddocid IS NULL
                            OR kv_entry_forms IS NULL THEN
                        1
                       ELSE
                        0
                   END)
        INTO l_cnt_insert
        FROM sync_movements
        WHERE pibics_table_cd = lc_pibics_table_cd;

        IF l_cnt_insert = 0 THEN
            pkg_utils.end_empty_step;
            RETURN;
        END IF;
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);

        FOR r IN (SELECT CAST(tt.seqno AS NUMBER) seqno
                        ,pkg_transcode.get_doctype(tdtcd) AS doctype
                        ,deptcd
                        ,credterm
                        ,cardtype
                        ,flightprefix || flightnumber AS trnsprtunitid
                        ,CASE
                             WHEN typedata = 'ATC' THEN
                              3
                             ELSE
                              2
                         END AS source_system
                        ,CASE
                             WHEN typedata = 'CREW' THEN
                              1
                             ELSE
                              CAST(NULL AS NUMBER)
                         END AS person_type
                        ,pkg_transcode.get_icao_doc_code(nationcd) AS nat
                        ,pkg_from_pibics.birthdte(birthdte) AS dob
                        ,pkg_from_pibics.sex(sex) AS sex
                        ,efirstnm AS givenname
                        ,coalesce(efamilynm
                                 ,'not set in PIBICS') AS surname
                        ,remark
                        ,docno
                        ,coalesce(ci.icao_code
                                 ,issuectry) AS issuectry
                        ,expirydate
                        ,s.tm6no
                        ,movement_dt
                        ,s.brddocid
                        ,s.kv_entry_forms
                        ,s.mvmntid
                        ,s.exitflg
                  FROM dl_staging4pibics.tminout tt
                  INNER JOIN sync_movements s
                  ON s.seqno = tt.seqno
                  LEFT JOIN dl_common.countries_icao_doc_codes ci
                  ON ci.country = s.issuectry
                  WHERE is_active_in_mvlog = 'Y'
                  AND row_shall_be_ignored = 'N'
                  AND ((mvmntid IS NULL OR brddocid IS NULL OR kv_entry_forms IS NULL) /*insert */
                        OR (currentness_in_pibics > currentness_in_bc)))
        LOOP
            l_row_is_in_error     := FALSE;
            l_cnt_processed       := l_cnt_processed + 1;
            l_borderpost_terminal := pkg_transcode.get_borderpost_terminal(p_deptcd     => r.deptcd
                                                                          ,p_ip_address => r.credterm
                                                                          ,p_cardtype   => r.cardtype);
            BEGIN
                IF r.brddocid IS NULL THEN
                    BEGIN
                        INSERT INTO dl_bordercontrol.borderdocuments
                            (doctype
                            ,docno
                            ,issuectry
                            ,nat
                            ,dob
                            ,sex
                            ,expirydate
                            ,givenname
                            ,surname
                            ,ins_terminal
                            ,ins_borderpost)
                        VALUES
                            (r.doctype
                            ,r.docno
                            ,r.issuectry
                            ,r.nat
                            ,r.dob
                            ,r.sex
                            ,r.expirydate
                            ,r.givenname
                            ,r.surname
                            ,l_borderpost_terminal.terminal
                            ,l_borderpost_terminal.borderpost)
                        RETURNING brddocid INTO l_brddocid;
                    EXCEPTION
                        WHEN dup_val_on_index THEN
                            SELECT brddocid
                            INTO l_brddocid
                            FROM dl_bordercontrol.borderdocuments t
                            WHERE (t.docno = r.docno AND t.issuectry = r.issuectry AND t.expirydate = r.expirydate);
                    END;
                    UPDATE sync_movements tgt
                    SET tgt.brddocid = coalesce(r.brddocid
                                               ,l_brddocid)
                    WHERE seqno = r.seqno;
                END IF;
                IF r.kv_entry_forms IS NULL THEN
                    BEGIN
                        INSERT INTO dl_bordercontrol.entry_forms
                            (form_no
                            ,note
                            ,ins_terminal
                            ,ins_borderpost)
                        VALUES
                            (r.tm6no
                            ,r.remark
                            ,l_borderpost_terminal.terminal
                            ,l_borderpost_terminal.borderpost)
                        RETURNING key_value INTO l_kv_entry_forms;
                    EXCEPTION
                        WHEN dup_val_on_index THEN
                            SELECT key_value
                            INTO l_kv_entry_forms
                            FROM dl_bordercontrol.entry_forms t
                            WHERE (t.form_no = r.tm6no);

                    END;
                    UPDATE sync_movements tgt
                    SET tgt.kv_entry_forms = coalesce(r.kv_entry_forms
                                                     ,l_kv_entry_forms)
                    WHERE seqno = r.seqno;
                END IF;
                IF r.mvmntid IS NULL THEN
                    BEGIN
                        INSERT INTO dl_bordercontrol.movements
                            (exitflg
                            ,movement_dt
                            ,brddocid
                            ,entry_form
                            ,date_of_entry
                            ,trnsprtunitid
                            ,is_finished
                            ,ins_terminal
                            ,ins_borderpost
                            ,source_system
                            ,person_type)
                        VALUES
                            (r.exitflg
                            ,r.movement_dt
                            ,coalesce(r.brddocid
                                     ,l_brddocid)
                            ,coalesce(r.kv_entry_forms
                                     ,l_kv_entry_forms)
                            ,r.movement_dt
                            ,r.trnsprtunitid
                            ,'Y'
                            ,l_borderpost_terminal.terminal
                            ,l_borderpost_terminal.borderpost
                            ,r.source_system
                            ,r.person_type)
                        RETURNING mvmntid INTO l_mvmntid;
                    EXCEPTION
                        WHEN dup_val_on_index THEN
                            l_cnt_duplicates := l_cnt_duplicates + 1;
                    END;
                END IF;
                UPDATE sync_movements tgt
                SET tgt.mvmntid       = coalesce(r.mvmntid
                                                ,l_mvmntid)
                   ,currentness_in_bc = SYSDATE
                WHERE seqno = r.seqno;
            EXCEPTION
                WHEN OTHERS THEN
                    --ignore PLW-06009: procedure "INSERT_TARGET" OTHERS handler does not end in RAISE or RAISE_APPLICATION_ERROR
                    l_err_rec.ora_err_number$ := SQLCODE;
                    l_err_rec.ora_err_mesg$   := SQLERRM;
                    l_err_rec.ora_err_tag$    := p_tag;
                    l_err_rec.seqno           := r.seqno;
                    l_err_rec.exitflg         := r.exitflg;
                    l_err_rec.kv_entry_forms  := coalesce(r.kv_entry_forms
                                                         ,l_kv_entry_forms);
                    l_err_rec.brddocid        := coalesce(r.brddocid
                                                         ,l_brddocid);
                    l_err_rec.mvmntid         := coalesce(r.mvmntid
                                                         ,l_mvmntid);
                    l_err_rec.movement_dt     := r.movement_dt;
                    l_err_rec.tm6no           := r.tm6no;
                    l_err_rec.doctype         := r.doctype;
                    l_err_rec.docno           := r.docno;
                    l_err_rec.issuectry       := r.issuectry;
                    l_err_rec.nat             := r.nat;
                    l_err_rec.dob             := r.dob;
                    l_err_rec.expirydate      := r.expirydate;
                    l_err_rec.givenname       := r.givenname;
                    l_err_rec.surname         := r.surname;
                    l_err_rec.pibics_table_cd := lc_pibics_table_cd;
                    log_error(p_rec => l_err_rec);
                    l_row_is_in_error := TRUE;
                    l_cnt_errors      := l_cnt_errors + 1;
                    CONTINUE;
            END;
        END LOOP;
        COMMIT;
        pkg_utils.update_sync_counter(p_tablenames => l_tablenames);
        IF (l_cnt_errors + l_cnt_duplicates) > 0 THEN
            pkg_utils.record_event(p_event => 'Errors : ' || l_cnt_errors || ', Duplicates : ' || l_cnt_duplicates);
        END IF;
        pkg_utils.end_step(p_cnt        => l_cnt_processed
                          ,p_tablenames => l_tablenames);
    END insert_target;

    PROCEDURE insert_target_tmmain(p_lowest_tmrunno_to_copy  IN dl_staging4pibics.cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                                  ,p_highest_tmrunno_to_copy IN dl_staging4pibics.cnt_tmmain.highest_tmrunno_to_copy%TYPE
                                  ,p_tag                     IN log_run_steps.tag%TYPE) IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'insert_target_tmmain';
        l_cnt_insert          NUMBER := 0;
        l_cnt_processed       NUMBER := 0;
        l_cnt_duplicates      NUMBER := 0;
        l_cnt_errors          NUMBER := 0;
        l_borderpost_terminal pkg_transcode.borderpost_terminal;
        l_mvmntid             dl_bordercontrol.movements.mvmntid%TYPE;
        l_brddocid            dl_bordercontrol.borderdocuments.brddocid%TYPE;
        l_kv_entry_forms      dl_bordercontrol.entry_forms.key_value%TYPE;
        l_err_rec             err$_sync_movements%ROWTYPE;
        l_row_is_in_error     BOOLEAN;
        lc_pibics_table_cd    VARCHAR2(1 CHAR) := 'A';
        l_step_params         pkg_utils.step_params;
        l_tablenames          pkg_utils.tablenames;
    BEGIN
        l_tablenames             := pkg_utils.get_tablenames_backend(p_sync_table_name => gc_process_name
                                                                    ,p_pibics_table_cd => lc_pibics_table_cd);
        l_step_params.table_name := l_tablenames.backend_table;
        pkg_utils.start_step(p_step_params => l_step_params);
        SELECT SUM(CASE
                       WHEN mvmntid IS NULL
                            OR brddocid IS NULL
                            OR kv_entry_forms IS NULL THEN
                        1
                       ELSE
                        0
                   END)
        INTO l_cnt_insert
        FROM sync_movements
        WHERE pibics_table_cd = lc_pibics_table_cd;

        IF l_cnt_insert = 0 THEN
            pkg_utils.end_empty_step;
            RETURN;
        END IF;
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);

        FOR r IN (SELECT CAST(tt.seqno AS NUMBER) seqno
                        ,pkg_transcode.get_doctype(tdtcd) AS doctype
                        ,deptcd
                        ,credterm
                        ,cardtype
                        ,flightprefix || flightnumber AS trnsprtunitid
                        ,CASE
                             WHEN typedata = 'ATC' THEN
                              3
                             ELSE
                              2
                         END AS source_system
                        ,CASE
                             WHEN typedata = 'CREW' THEN
                              1
                             ELSE
                              CAST(NULL AS NUMBER)
                         END AS person_type
                        ,pkg_transcode.get_icao_doc_code(nationcd) AS nat
                        ,pkg_from_pibics.birthdte(birthdte) AS dob
                        ,pkg_from_pibics.sex(sex) AS sex
                        ,efirstnm AS givenname
                        ,coalesce(efamilynm
                                 ,'not set in PIBICS') AS surname
                        ,remark
                        ,docno
                        ,coalesce(ci.icao_code
                                 ,issuectry) AS issuectry
                        ,expirydate
                        ,s.tm6no
                        ,movement_dt
                        ,s.brddocid
                        ,s.kv_entry_forms
                        ,s.mvmntid
                        ,s.exitflg
                  FROM tmmain_union tt
                  INNER JOIN sync_movements s
                  ON s.seqno = tt.seqno
                  LEFT JOIN dl_common.countries_icao_doc_codes ci
                  ON ci.country = s.issuectry
                  WHERE is_active_in_mvlog = 'Y'
                  AND row_shall_be_ignored = 'N'
                  AND tmrunno >= p_lowest_tmrunno_to_copy
                  AND tmrunno <= p_highest_tmrunno_to_copy
                  AND ((mvmntid IS NULL OR brddocid IS NULL OR kv_entry_forms IS NULL) /*insert */
                        OR (currentness_in_pibics > currentness_in_bc)))
        LOOP
            l_row_is_in_error     := FALSE;
            l_cnt_processed       := l_cnt_processed + 1;
            l_borderpost_terminal := pkg_transcode.get_borderpost_terminal(p_deptcd     => r.deptcd
                                                                          ,p_ip_address => r.credterm
                                                                          ,p_cardtype   => r.cardtype);
            BEGIN
                IF r.brddocid IS NULL THEN
                    BEGIN
                        INSERT INTO dl_bordercontrol.borderdocuments
                            (doctype
                            ,docno
                            ,issuectry
                            ,nat
                            ,dob
                            ,sex
                            ,expirydate
                            ,givenname
                            ,surname
                            ,ins_terminal
                            ,ins_borderpost)
                        VALUES
                            (r.doctype
                            ,r.docno
                            ,r.issuectry
                            ,r.nat
                            ,r.dob
                            ,r.sex
                            ,r.expirydate
                            ,r.givenname
                            ,r.surname
                            ,l_borderpost_terminal.terminal
                            ,l_borderpost_terminal.borderpost)
                        RETURNING brddocid INTO l_brddocid;
                    EXCEPTION
                        WHEN dup_val_on_index THEN
                            SELECT brddocid
                            INTO l_brddocid
                            FROM dl_bordercontrol.borderdocuments t
                            WHERE (t.docno = r.docno AND t.issuectry = r.issuectry AND t.expirydate = r.expirydate);
                    END;
                    UPDATE sync_movements tgt
                    SET tgt.brddocid = coalesce(r.brddocid
                                               ,l_brddocid)
                    WHERE seqno = r.seqno;
                END IF;
                IF r.kv_entry_forms IS NULL THEN
                    BEGIN
                        INSERT INTO dl_bordercontrol.entry_forms
                            (form_no
                            ,note
                            ,ins_terminal
                            ,ins_borderpost)
                        VALUES
                            (r.tm6no
                            ,r.remark
                            ,l_borderpost_terminal.terminal
                            ,l_borderpost_terminal.borderpost)
                        RETURNING key_value INTO l_kv_entry_forms;
                    EXCEPTION
                        WHEN dup_val_on_index THEN
                            SELECT key_value
                            INTO l_kv_entry_forms
                            FROM dl_bordercontrol.entry_forms t
                            WHERE (t.form_no = r.tm6no);

                    END;
                    UPDATE sync_movements tgt
                    SET tgt.kv_entry_forms = coalesce(r.kv_entry_forms
                                                     ,l_kv_entry_forms)
                    WHERE seqno = r.seqno;
                END IF;
                IF r.mvmntid IS NULL THEN
                    BEGIN
                        INSERT INTO dl_bordercontrol.movements
                            (exitflg
                            ,movement_dt
                            ,brddocid
                            ,entry_form
                            ,date_of_entry
                            ,trnsprtunitid
                            ,is_finished
                            ,ins_terminal
                            ,ins_borderpost
                            ,source_system
                            ,person_type)
                        VALUES
                            (r.exitflg
                            ,r.movement_dt
                            ,coalesce(r.brddocid
                                     ,l_brddocid)
                            ,coalesce(r.kv_entry_forms
                                     ,l_kv_entry_forms)
                            ,r.movement_dt
                            ,r.trnsprtunitid
                            ,'Y'
                            ,l_borderpost_terminal.terminal
                            ,l_borderpost_terminal.borderpost
                            ,r.source_system
                            ,r.person_type)
                        RETURNING mvmntid INTO l_mvmntid;
                    EXCEPTION
                        WHEN dup_val_on_index THEN
                            l_cnt_duplicates := l_cnt_duplicates + 1;
                    END;
                END IF;
                UPDATE sync_movements tgt
                SET tgt.mvmntid       = coalesce(r.mvmntid
                                                ,l_mvmntid)
                   ,currentness_in_bc = SYSDATE
                WHERE seqno = r.seqno;
            EXCEPTION
                WHEN OTHERS THEN
                    --ignore PLW-06009: procedure "INSERT_TARGET" OTHERS handler does not end in RAISE or RAISE_APPLICATION_ERROR
                    l_err_rec.ora_err_number$ := SQLCODE;
                    l_err_rec.ora_err_mesg$   := SQLERRM;
                    l_err_rec.ora_err_tag$    := p_tag;
                    l_err_rec.seqno           := r.seqno;
                    l_err_rec.exitflg         := r.exitflg;
                    l_err_rec.kv_entry_forms  := coalesce(r.kv_entry_forms
                                                         ,l_kv_entry_forms);
                    l_err_rec.brddocid        := coalesce(r.brddocid
                                                         ,l_brddocid);
                    l_err_rec.mvmntid         := coalesce(r.mvmntid
                                                         ,l_mvmntid);
                    l_err_rec.movement_dt     := r.movement_dt;
                    l_err_rec.tm6no           := r.tm6no;
                    l_err_rec.doctype         := r.doctype;
                    l_err_rec.docno           := r.docno;
                    l_err_rec.issuectry       := r.issuectry;
                    l_err_rec.nat             := r.nat;
                    l_err_rec.dob             := r.dob;
                    l_err_rec.expirydate      := r.expirydate;
                    l_err_rec.givenname       := r.givenname;
                    l_err_rec.surname         := r.surname;
                    l_err_rec.pibics_table_cd := lc_pibics_table_cd;
                    log_error(p_rec => l_err_rec);
                    l_row_is_in_error := TRUE;
                    l_cnt_errors      := l_cnt_errors + 1;
                    CONTINUE;
            END;
        END LOOP;
        UPDATE dl_staging4pibics.cnt_tmmain
        SET copied_cnt_target = l_cnt_processed
           ,copied_at_target  = SYSDATE
        WHERE highest_tmrunno_to_copy = p_highest_tmrunno_to_copy;
        COMMIT;
        pkg_utils.update_sync_counter(p_tablenames => l_tablenames);
        IF (l_cnt_errors + l_cnt_duplicates) > 0 THEN
            pkg_utils.record_event(p_event => 'Errors : ' || l_cnt_errors || ', Duplicates : ' || l_cnt_duplicates);
        END IF;
        pkg_utils.end_step(p_cnt        => l_cnt_processed
                          ,p_tablenames => l_tablenames);
    END insert_target_tmmain;

END pkg_bc_movements;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_MOVEMENTS" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_MOVEMENTS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_MOVEMENTS" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BC_MOVEMENTS" TO "BIOSAADM";
