CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_BL_BLACKLIST_CASES" AS

    g_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';
    g_terminal_borderpost_in pkg_hacks.terminal_borderpost_r;

    PROCEDURE log_error(p_rec IN err$_sync_blacklist_cases%ROWTYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        INSERT INTO err$_sync_blacklist_cases
            (ora_err_number$
            ,ora_err_mesg$
            ,ora_err_rowid$
            ,ora_err_optyp$
            ,ora_err_tag$
            ,wlcd
            ,seqno
            ,case_id
            ,identity_id
            ,address_id
            ,travel_doc_id
            ,ownerage
            ,expirydate
            ,nationcd
            ,passportno
            ,create_date
            ,pibics_table_cd
            ,currentness_in_pibics
            ,currentness_in_bc)
        VALUES
            (p_rec.ora_err_number$
            ,p_rec.ora_err_mesg$
            ,p_rec.ora_err_rowid$
            ,p_rec.ora_err_optyp$
            ,p_rec.ora_err_tag$
            ,p_rec.wlcd
            ,p_rec.seqno
            ,p_rec.case_id
            ,p_rec.identity_id
            ,p_rec.address_id
            ,p_rec.travel_doc_id
            ,p_rec.ownerage
            ,p_rec.expirydate
            ,p_rec.nationcd
            ,p_rec.passportno
            ,p_rec.create_date
            ,p_rec.pibics_table_cd
            ,p_rec.currentness_in_pibics
            ,p_rec.currentness_in_bc);

        COMMIT;
    END log_error;
    --
    -- P U B L I C
    --

    PROCEDURE insert_target_watchlist(p_tag IN log_run_steps.tag%TYPE) IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'insert_target_watchlist';
        l_cnt_insert          NUMBER := 0;
        l_cnt_processed_cases NUMBER := 0;
        l_cnt_duplicates      NUMBER := 0;
        l_cnt_errors          NUMBER := 0;
        l_case_id             dl_blacklist.blacklist_cases.id%TYPE;
        l_identity_id         dl_blacklist.identities.key_value%TYPE;
        l_err_rec             err$_sync_blacklist_cases%ROWTYPE;
        l_row_is_in_error     BOOLEAN;
        l_step_params         pkg_utils.step_params;
        lc_pibics_table_cd    VARCHAR2(1 CHAR) := 'W';
        l_start_date          VARCHAR2(20) := to_char(SYSDATE
                                                     ,'YYYY-MM-DD HH24:MI:SS');
        l_tablenames          pkg_utils.tablenames;
    BEGIN
        l_tablenames             := pkg_utils.get_tablenames_backend(p_sync_table_name => gc_process_name
                                                                    ,p_pibics_table_cd => lc_pibics_table_cd);
        l_step_params.table_name := l_tablenames.backend_table;
        pkg_utils.start_step(p_step_params => l_step_params);
        SELECT SUM(CASE
                       WHEN case_id IS NULL
                            OR identity_id IS NULL THEN
                        1
                       ELSE
                        0
                   END)
        INTO l_cnt_insert
        FROM sync_blacklist_cases
        WHERE pibics_table_cd = lc_pibics_table_cd;

        IF l_cnt_insert = 0 THEN
            pkg_utils.end_empty_step;
            RETURN;
        END IF;
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        FOR r IN (SELECT wl.wlcd
                        ,wl.seqno
                        ,wl.ownerage
                        ,wl.agccont
                        ,wl.agcphone
                        ,wl.emgcont
                        ,wl.seclev
                        ,wl.targetno
                        ,wl.warrno
                        ,wl.warrdte
                        ,wl.warrexpdte
                        ,wl.permitdte1
                        ,wl.permitdte2
                        --,wl.reasoncd
                        ,pkg_transcode.get_reason_seq(wl.reasoncd) AS reasoncd
                        ,wl.remark
                        ,wl.birthplace
                        ,wl.height
                        ,wl.weight
                        ,wl.haircolor
                        ,wl.hair
                        ,wl.face
                        ,wl.build
                        ,wl.eyecolor
                        ,wl.complexion
                        ,wl.feature
                        ,wl.peculiarity
                        ,pkg_transcode.get_occupation(wl.occcd) occcd
                        ,pkg_from_pibics.birthdte_date(wl.birthdte) AS birthdte
                        ,wl.sex
                        ,pkg_transcode.get_country(wl.nationcd) AS nationcd
                        ,wl.wltlastnm
                        ,wl.wltfirstnm
                        ,wl.wltmiddlenm
                        ,wl.wlelastnm
                        ,wl.wlemiddlenm
                        ,wl.wlefirstnm
                        ,wl.efsndxnm
                        ,wl.emsndxnm
                        ,wl.elsndxnm
                        ,wl.creusr
                        ,wl.credte
                        ,wl.updusr
                        ,wl.upddte
                  FROM dl_staging4pibics.watchlist wl
                  INNER JOIN sync_blacklist_cases s
                  ON wl.wlcd = s.wlcd
                  AND (wl.seqno = s.seqno OR (wl.seqno IS NULL AND s.seqno IS NULL))
                  AND s.pibics_table_cd = lc_pibics_table_cd
                  WHERE is_active_in_mvlog = 'Y'
                  AND s.row_shall_be_ignored = 'N'
                  AND (case_id IS NULL OR identity_id IS NULL) /*insert */
                  OR (currentness_in_pibics > currentness_in_bc))
        LOOP
            l_case_id     := NULL;
            l_identity_id := NULL;
            BEGIN
                -- handle errors
                IF r.seqno <= 0 THEN
                    BEGIN
                        -- handle insert/update for blacklist_cases
                        INSERT INTO dl_blacklist.blacklist_cases tgt
                            (case_number
                            ,authority
                            ,contact_owner_data
                            ,contact_telephone_number
                            ,urgent_contact
                            ,secret_level
                            ,target_code
                            ,arrested_warrant_number
                            ,arrested_warrant_date
                            ,arrested_warrant_expiry_date
                            ,travel_permit_from
                            ,travel_permit_to
                            ,warrant_arrested_type
                            ,notice
                            ,ins_by
                            ,ins_at
                            ,dml_by
                            ,dml_at
                            ,reason
                            )
                        VALUES
                            (r.wlcd
                            ,r.ownerage
                            ,r.agccont
                            ,r.agcphone
                            ,r.emgcont
                            ,r.seclev
                            ,r.targetno
                            ,r.warrno
                            ,r.warrdte
                            ,r.warrexpdte
                            ,r.permitdte1
                            ,r.permitdte2
                            ,NULL --r.reasoncd
                            ,r.remark
                            ,r.creusr
                            ,r.credte
                            ,r.updusr
                            ,r.upddte
                            ,r.reasoncd
                            )
                        RETURNING id INTO l_case_id;
                    EXCEPTION
                        WHEN dup_val_on_index THEN
                            UPDATE dl_blacklist.blacklist_cases tgt
                            SET contact_owner_data           = r.agccont
                               ,contact_telephone_number     = r.agcphone
                               ,urgent_contact               = r.emgcont
                               ,secret_level                 = r.seclev
                               ,target_code                  = r.targetno
                               ,arrested_warrant_number      = r.warrno
                               ,arrested_warrant_date        = r.warrdte
                               ,arrested_warrant_expiry_date = r.warrexpdte
                               ,travel_permit_from           = r.permitdte1
                               ,travel_permit_to             = r.permitdte2
                               ,warrant_arrested_type        = NULL -- r.reasoncd
                               ,notice                       = r.remark
                               ,dml_by                       = r.updusr
                               ,dml_at                       = r.upddte
                               , reason                     = r.reasoncd
                            WHERE case_number = r.wlcd
                            AND (tgt.authority = r.ownerage OR (tgt.authority IS NULL AND r.ownerage IS NULL))
                            RETURNING id INTO l_case_id;
                    END;

                    l_cnt_processed_cases := l_cnt_processed_cases + 1;
                ELSE
                    -- seqno 1 or higher
                    SELECT id
                    INTO l_case_id
                    FROM dl_blacklist.blacklist_cases tgt
                    WHERE case_number = r.wlcd
                    AND (tgt.authority = r.ownerage OR (tgt.authority IS NULL AND r.ownerage IS NULL));
                END IF;
                UPDATE sync_blacklist_cases tgt
                SET case_id = l_case_id
                WHERE wlcd = r.wlcd
                AND ((seqno IS NULL AND r.seqno IS NULL) OR seqno = r.seqno)
                AND ((tgt.ownerage IS NULL AND r.ownerage IS NULL) OR tgt.ownerage = r.ownerage)
                AND pibics_table_cd = lc_pibics_table_cd;
                BEGIN
                    INSERT INTO dl_blacklist.identities
                        (place_of_birth
                        ,body_height
                        ,body_weight
                        ,hair_color
                        ,hair_characteristic
                        ,face_shape
                        ,body_shape
                        ,eye_color
                        ,skin
                        ,dominant_characteristic
                        ,special_characteristic
                        ,profession
                        ,date_of_birth
                        ,sex
                        ,nationality
                        ,surname_thai
                        ,givenname_thai
                        ,middlename_thai
                        ,surname
                        ,middle_name
                        ,given_name
                        ,ins_by
                        ,ins_at
                        ,dml_by
                        ,dml_at)
                    VALUES
                        (r.birthplace
                        ,r.height
                        ,r.weight
                        ,r.haircolor
                        ,r.hair
                        ,r.face
                        ,r.build
                        ,r.eyecolor
                        ,r.complexion
                        ,r.feature
                        ,r.peculiarity
                        ,r.occcd
                        ,r.birthdte
                        ,r.sex
                        ,r.nationcd
                        ,r.wltlastnm
                        ,r.wltfirstnm
                        ,r.wltmiddlenm
                        ,r.wlelastnm
                        ,r.wlemiddlenm
                        ,r.wlefirstnm
                        ,r.creusr
                        ,r.credte
                        ,r.updusr
                        ,r.upddte)
                    RETURNING key_value INTO l_identity_id;
                EXCEPTION
                    WHEN dup_val_on_index THEN
                        SELECT key_value
                        INTO l_identity_id
                        FROM dl_blacklist.identities
                        WHERE (surname = r.wlelastnm OR (surname IS NULL AND r.wlelastnm IS NULL))
                        AND (middle_name = r.wlemiddlenm OR (middle_name IS NULL AND r.wlemiddlenm IS NULL))
                        AND (given_name = r.wlefirstnm OR (given_name IS NULL AND r.wlefirstnm IS NULL))
                        AND (date_of_birth = r.birthdte OR (date_of_birth IS NULL AND r.birthdte IS NULL))
                        AND (place_of_birth = r.birthplace OR (place_of_birth IS NULL AND r.birthplace IS NULL))
                        AND (sex = r.sex OR (sex IS NULL AND r.sex IS NULL));
                END;
                UPDATE sync_blacklist_cases tgt
                SET identity_id       = l_identity_id
                   ,currentness_in_bc = SYSDATE
                WHERE wlcd = r.wlcd
                AND ((seqno IS NULL AND r.seqno IS NULL) OR (seqno = r.seqno))
                AND tgt.ownerage = r.ownerage
                AND pibics_table_cd = lc_pibics_table_cd;
                BEGIN

                    INSERT INTO dl_blacklist.blacklist_case_identities
                        (blacklist_case
                        ,identity)
                    VALUES
                        (l_case_id
                        ,l_identity_id);

                EXCEPTION
                    WHEN dup_val_on_index THEN
                        NULL;
                END;

            EXCEPTION
                WHEN OTHERS THEN
                    --ignore PLW-06009: procedure "INSERT_TARGET" OTHERS handler does not end in RAISE or RAISE_APPLICATION_ERROR
                    l_err_rec.ora_err_number$ := SQLCODE;
                    l_err_rec.ora_err_mesg$   := SQLERRM;
                    l_err_rec.ora_err_tag$    := coalesce(p_tag
                                                         ,l_start_date);
                    l_err_rec.wlcd            := r.wlcd;
                    l_err_rec.seqno           := r.seqno;
                    l_err_rec.ownerage        := r.ownerage;
                    l_err_rec.case_id         := l_case_id;
                    l_err_rec.identity_id     := l_identity_id;
                    l_err_rec.address_id      := NULL;
                    l_err_rec.travel_doc_id   := NULL;
                    l_err_rec.pibics_table_cd := lc_pibics_table_cd;
                    log_error(p_rec => l_err_rec);
                    l_row_is_in_error := TRUE;
                    l_cnt_errors      := l_cnt_errors + 1;
                    CONTINUE;
            END;
            
            COMMIT;
        END LOOP;

        --COMMIT;
        pkg_utils.update_sync_counter(p_tablenames => l_tablenames);
        IF (l_cnt_errors + l_cnt_duplicates) > 0 THEN
            pkg_utils.record_event(p_event => 'Errors : ' || l_cnt_errors || ', Duplicates : ' || l_cnt_duplicates);
        END IF;
        IF l_cnt_processed_cases = 0 THEN
            pkg_utils.end_empty_step;
        ELSE

            pkg_utils.end_step(p_cnt        => l_cnt_processed_cases
                              ,p_tablenames => l_tablenames);
        END IF;
    END insert_target_watchlist;

    PROCEDURE insert_target_watchlist_wlcd(p_wlcd in varchar2) IS

        PRAGMA AUTONOMOUS_TRANSACTION;
       
        l_cnt_insert          NUMBER := 0;
        v_count_biowl          NUMBER := 0;
        l_case_id             dl_blacklist.blacklist_cases.id%TYPE;
        l_identity_id         dl_blacklist.identities.key_value%TYPE;
        lc_pibics_table_cd    VARCHAR2(1 CHAR) := 'W';
        l_start_date          VARCHAR2(20) := to_char(SYSDATE
                                                     ,'YYYY-MM-DD HH24:MI:SS');
        
    BEGIN
        l_case_id     := NULL;
        SELECT SUM(CASE
                       WHEN case_id IS NULL
                            OR identity_id IS NULL THEN
                        1
                       ELSE
                        0
                   END)
        INTO l_cnt_insert
        FROM sync_blacklist_cases
        WHERE pibics_table_cd = lc_pibics_table_cd
        and wlcd = p_wlcd;

        IF l_cnt_insert > 0 THEN
            BEGIN
            
            FOR r IN (SELECT wl.wlcd
                        ,wl.seqno
                        ,wl.ownerage
                        ,wl.agccont
                        ,wl.agcphone
                        ,wl.emgcont
                        ,wl.seclev
                        ,wl.targetno
                        ,wl.warrno
                        ,wl.warrdte
                        ,wl.warrexpdte
                        ,wl.permitdte1
                        ,wl.permitdte2
                        --,wl.reasoncd
                        ,pkg_transcode.get_reason_seq(wl.reasoncd) AS reasoncd
                        ,wl.remark
                        ,wl.birthplace
                        ,wl.height
                        ,wl.weight
                        ,wl.haircolor
                        ,wl.hair
                        ,wl.face
                        ,wl.build
                        ,wl.eyecolor
                        ,wl.complexion
                        ,wl.feature
                        ,wl.peculiarity
                        ,pkg_transcode.get_occupation(wl.occcd) occcd
                        ,pkg_from_pibics.birthdte_date(wl.birthdte) AS birthdte
                        ,wl.sex
                        ,pkg_transcode.get_country(wl.nationcd) AS nationcd
                        ,wl.wltlastnm
                        ,wl.wltfirstnm
                        ,wl.wltmiddlenm
                        ,wl.wlelastnm
                        ,wl.wlemiddlenm
                        ,wl.wlefirstnm
                        ,wl.efsndxnm
                        ,wl.emsndxnm
                        ,wl.elsndxnm
                        ,wl.creusr
                        ,wl.credte
                        ,wl.updusr
                        ,wl.upddte
                  FROM dl_staging4pibics.watchlist wl
                  INNER JOIN sync_blacklist_cases s
                  ON wl.wlcd = s.wlcd
                  AND (wl.seqno = s.seqno OR (wl.seqno IS NULL AND s.seqno IS NULL))
                  AND s.pibics_table_cd = lc_pibics_table_cd
                  WHERE wl.wlcd = p_wlcd)
        LOOP
        
        --l_case_id     := NULL;
        l_identity_id := NULL;
        
                BEGIN
                
                    select count(*) into v_count_biowl from dl_blacklist.blacklist_cases where CASE_NUMBER = r.wlcd;
                    if v_count_biowl = 0 then
                    begin
                        INSERT INTO dl_blacklist.blacklist_cases tgt
                            (case_number
                            ,authority
                            ,contact_owner_data
                            ,contact_telephone_number
                            ,urgent_contact
                            ,secret_level
                            ,target_code
                            ,arrested_warrant_number
                            ,arrested_warrant_date
                            ,arrested_warrant_expiry_date
                            ,travel_permit_from
                            ,travel_permit_to
                            ,warrant_arrested_type
                            ,notice
                            ,ins_by
                            ,ins_at
                            ,dml_by
                            ,dml_at
                            ,reason)
                        VALUES
                            (r.wlcd
                            ,r.ownerage
                            ,r.agccont
                            ,r.agcphone
                            ,r.emgcont
                            ,r.seclev
                            ,r.targetno
                            ,r.warrno
                            ,r.warrdte
                            ,r.warrexpdte
                            ,r.permitdte1
                            ,r.permitdte2
                            ,NULL
                            ,r.remark
                            ,r.creusr
                            ,r.credte
                            ,r.updusr
                            ,r.upddte
                            ,r.reasoncd)
                        RETURNING id INTO l_case_id;
                        
                                                INSERT INTO dl_blacklist.identities
                        (
                        case_number
                        ,seqno
                        ,place_of_birth
                        ,body_height
                        ,body_weight
                        ,hair_color
                        ,hair_characteristic
                        ,face_shape
                        ,body_shape
                        ,eye_color
                        ,skin
                        ,dominant_characteristic
                        ,special_characteristic
                        ,profession
                        ,date_of_birth
                        ,sex
                        ,nationality
                        ,surname_thai
                        ,givenname_thai
                        ,middlename_thai
                        ,surname
                        ,middle_name
                        ,given_name
                        --,phonetic_given_name
                        --,phonetic_middle_name
                        --,phonetic_surname
                        ,ins_by
                        ,ins_at
                        ,dml_by
                        ,dml_at)
                    VALUES
                        (r.wlcd
                        ,r.seqno
                        ,r.birthplace
                        ,r.height
                        ,r.weight
                        ,r.haircolor
                        ,r.hair
                        ,r.face
                        ,r.build
                        ,r.eyecolor
                        ,r.complexion
                        ,r.feature
                        ,r.peculiarity
                        ,r.occcd
                        ,r.birthdte
                        ,r.sex
                        ,r.nationcd
                        ,r.wltlastnm
                        ,r.wltfirstnm
                        ,r.wltmiddlenm
                        ,r.wlelastnm
                        ,r.wlemiddlenm
                        ,r.wlefirstnm
                        --,r.efsndxnm
                        --,r.emsndxnm
                        --,r.elsndxnm
                        ,r.creusr
                        ,r.credte
                        ,r.updusr
                        ,r.upddte)
                    RETURNING key_value INTO l_identity_id;
                    
                        INSERT INTO dl_blacklist.blacklist_case_identities
                        (blacklist_case
                        ,identity)
                    VALUES
                        (l_case_id
                        ,l_identity_id);
                        
                UPDATE sync_blacklist_cases tgt
                SET case_id = l_case_id,
                identity_id  = l_identity_id
                WHERE wlcd = r.wlcd
                AND ((seqno IS NULL AND r.seqno IS NULL) OR seqno = r.seqno)
                AND pibics_table_cd = lc_pibics_table_cd;
                        
                    end;
                    end if;
        
                END;
        
        END LOOP;
        
        END;
        END IF;
        
        COMMIT;
    END insert_target_watchlist_wlcd;

    PROCEDURE insert_target_lostpassport(p_tag IN log_run_steps.tag%TYPE) IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope           logger_logs.scope%TYPE := g_log_scope_prefix || 'insert_target_lostpassport';
        l_cnt_insert          NUMBER := 0;
        l_cnt_processed_cases NUMBER := 0;
        l_cnt_duplicates      NUMBER := 0;
        l_cnt_errors          NUMBER := 0;
        l_case_id             dl_blacklist.blacklist_cases.id%TYPE;
        l_identity_id         dl_blacklist.identities.key_value%TYPE;
        l_travel_docs_id      dl_blacklist.travel_docs.key_value%TYPE;
        l_err_rec             err$_sync_blacklist_cases%ROWTYPE;
        l_row_is_in_error     BOOLEAN;
        l_step_params         pkg_utils.step_params;
        lc_pibics_table_cd    VARCHAR2(1 CHAR) := 'L';
        l_start_date          VARCHAR2(20) := to_char(SYSDATE
                                                     ,'YYYY-MM-DD HH24:MI:SS');
        l_tablenames          pkg_utils.tablenames;
    BEGIN
        l_tablenames := pkg_utils.get_tablenames_backend(p_sync_table_name => gc_process_name
                                                        ,p_pibics_table_cd => lc_pibics_table_cd);
        sys.dbms_application_info.set_client_info(p_tag);
        l_step_params.table_name := l_tablenames.backend_table;
        pkg_utils.start_step(p_step_params => l_step_params);
        SELECT SUM(CASE
                       WHEN case_id IS NULL
                            OR identity_id IS NULL
                            OR travel_docs_id IS NULL THEN
                        1
                       ELSE
                        0
                   END)
        INTO l_cnt_insert
        FROM sync_blacklist_cases
        WHERE pibics_table_cd = lc_pibics_table_cd;

        IF l_cnt_insert = 0 THEN
            pkg_utils.end_empty_step;
            RETURN;
        END IF;
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        FOR r IN (SELECT lp.lppcd
                        ,lp.ownerage
                        ,lp.agccont
                        ,lp.agcphone
                        ,lp.emgcont
                        ,lp.seclev
                        ,pkg_transcode.get_doc_class(lp.tdcd) AS doc_class
                        ,lp.lostpassportdte
                        ,lp.lostpassportplace
                        ,pkg_transcode.get_visa_type_by_seqno(lp.visatype_seqno) AS visatype
                        ,lp.visaexpdte
                        ,lp.newpassporttype
                        ,lp.newpassportno
                        ,lp.newisupassportdte
                        ,lp.newisupassportplace
                        ,lp.newpassportexpdte
                        ,lp.remark
                        ,lp.passportno
                        ,lp.passportexpdte
                        ,pkg_transcode.get_doctype(lp.passporttype) AS doc_type
                        ,pkg_from_pibics.birthdte_date(lp.birthdate) AS birthdate
                        ,TRIM(lp.sex) AS sex
                        ,pkg_transcode.get_country(lp.nationcd) AS nationcd
                        ,pkg_transcode.get_icao_doc_code(coalesce(lp.isupassportplace
                                                                 ,lp.nationcd)) AS issuing_country
                        ,lp.tfirstnm
                        ,lp.tmiddlenm
                        ,lp.tfamilynm
                        ,lp.efirstnm
                        ,lp.emiddlenm
                        ,lp.efamilynm
                        ,pkg_transcode.get_reason_code(lp.reasoncd) AS reasoncd
                        ,lp.creusr
                        ,lp.credte
                        ,lp.updusr
                        ,lp.upddte
                  FROM dl_staging4pibics.lostpassport lp
                  INNER JOIN sync_blacklist_cases s
                  ON s.wlcd = lp.lppcd
                  AND s.pibics_table_cd = lc_pibics_table_cd
                  WHERE is_active_in_mvlog = 'Y'
                  AND s.row_shall_be_ignored = 'N'
                  AND ((case_id IS NULL OR identity_id IS NULL OR travel_docs_id IS NULL) /*insert */
                        OR (currentness_in_pibics > currentness_in_bc)))
        LOOP
            l_case_id        := NULL;
            l_identity_id    := NULL;
            l_travel_docs_id := NULL;
            BEGIN
                -- handle errors
                BEGIN
                    -- handle insert/update for blacklist_cases
                    INSERT INTO dl_blacklist.blacklist_cases
                        (case_number
                        ,case_type
                        ,authority
                        ,contact_owner_data
                        ,contact_telephone_number
                        ,urgent_contact
                        ,secret_level
                        ,lost_pp_lost_date
                        ,lost_pp_last_place
                        ,lost_pp_visa_on_arriv
                        ,lost_pp_visa_exp_date
                        ,lost_pp_new_pp_type
                        ,lost_pp_new_pp_number
                        ,lost_pp_new_pp_issue_date
                        ,lost_pp_new_pp_place_of_issue
                        ,lost_pp_new_pp_expire_date
                        ,reason
                        ,notice
                        ,ins_by
                        ,ins_at
                        ,dml_by
                        ,dml_at
                        ,dml_type)
                    VALUES
                        (r.lppcd
                        ,'LOST_PASSPORT'
                        ,r.ownerage
                        ,r.agccont
                        ,r.agcphone
                        ,r.emgcont
                        ,r.seclev
                        ,r.lostpassportdte
                        ,r.lostpassportplace
                        ,r.visatype
                        ,r.visaexpdte
                        ,r.newpassporttype
                        ,r.newpassportno
                        ,r.newisupassportdte
                        ,r.newisupassportplace
                        ,r.newpassportexpdte
                        ,r.reasoncd
                        ,r.remark
                        ,r.creusr
                        ,r.credte
                        ,r.updusr
                        ,r.upddte
                        ,'L')
                    RETURNING id INTO l_case_id;
                EXCEPTION
                    WHEN dup_val_on_index THEN
                        SELECT id
                        INTO l_case_id
                        FROM dl_blacklist.blacklist_cases
                        WHERE case_number = r.lppcd
                        AND (authority = r.ownerage OR (authority IS NULL AND r.ownerage IS NULL));
                END;
                UPDATE sync_blacklist_cases tgt
                SET tgt.case_id = l_case_id
                WHERE tgt.wlcd = r.lppcd
                AND (tgt.ownerage = r.ownerage OR (tgt.ownerage IS NULL AND r.ownerage IS NULL))
                AND tgt.pibics_table_cd = lc_pibics_table_cd;

                l_cnt_processed_cases := l_cnt_processed_cases + 1;

                BEGIN
                    INSERT INTO dl_blacklist.identities
                        (date_of_birth
                        ,sex
                        ,nationality
                        ,givenname_thai
                        ,middlename_thai
                        ,surname_thai
                        ,given_name
                        ,middle_name
                        ,surname
                        ,ins_by
                        ,ins_at
                        ,dml_by
                        ,dml_at
                        ,dml_type)
                    VALUES
                        (r.birthdate
                        ,r.sex
                        ,r.nationcd
                        ,r.tfirstnm
                        ,r.tmiddlenm
                        ,r.tfamilynm
                        ,r.efirstnm
                        ,r.emiddlenm
                        ,r.efamilynm
                        ,r.creusr
                        ,r.credte
                        ,r.updusr
                        ,r.upddte
                        ,'L')
                    RETURNING key_value INTO l_identity_id;
                EXCEPTION
                    WHEN dup_val_on_index THEN
                        SELECT key_value
                        INTO l_identity_id
                        FROM dl_blacklist.identities
                        WHERE (surname = r.efamilynm OR (surname IS NULL AND r.efamilynm IS NULL))
                        AND (middle_name = r.emiddlenm OR (middle_name IS NULL AND r.emiddlenm IS NULL))
                        AND (given_name = r.efirstnm OR (given_name IS NULL AND r.efirstnm IS NULL))
                        AND (date_of_birth = r.birthdate OR (date_of_birth IS NULL AND r.birthdate IS NULL))
                        AND (sex = r.sex OR (sex IS NULL AND r.sex IS NULL));
                END;
                UPDATE sync_blacklist_cases tgt
                SET tgt.identity_id = l_identity_id
                WHERE tgt.wlcd = r.lppcd
                AND (tgt.ownerage = r.ownerage OR (tgt.ownerage IS NULL AND r.ownerage IS NULL))
                AND tgt.pibics_table_cd = lc_pibics_table_cd;
                BEGIN
                    INSERT INTO dl_blacklist.blacklist_case_identities
                        (blacklist_case
                        ,identity)
                    VALUES
                        (l_case_id
                        ,l_identity_id);
                EXCEPTION
                    WHEN dup_val_on_index THEN
                        NULL;
                END;
                BEGIN
                    INSERT INTO dl_blacklist.travel_docs tgt
                        (doc_type
                        ,issuing_country
                        ,doc_number
                        ,date_of_expiry
                        ,given_name
                        ,middle_name
                        ,surname
                        ,nationality
                        ,sex
                        ,date_of_birth
                        ,doc_class
                        ,identity
                        ,ins_at
                        ,ins_by
                        ,dml_at
                        ,dml_by
                        ,dml_type)
                    VALUES
                        (r.doc_type
                        ,r.issuing_country
                        ,r.passportno
                        ,r.passportexpdte
                        ,r.efirstnm
                        ,r.emiddlenm
                        ,r.efamilynm
                        ,r.issuing_country
                        ,r.sex
                        ,r.birthdate
                        ,r.doc_class
                        ,l_identity_id
                        ,r.credte
                        ,r.creusr
                        ,r.upddte
                        ,r.updusr
                        ,'I')
                    RETURNING key_value INTO l_travel_docs_id;
                EXCEPTION
                    WHEN dup_val_on_index THEN
                        SELECT key_value
                        INTO l_travel_docs_id
                        FROM dl_blacklist.travel_docs
                        WHERE (issuing_country = r.issuing_country OR
                              (issuing_country IS NULL AND r.issuing_country IS NULL))
                        AND (doc_number = r.passportno OR (doc_number IS NULL AND r.passportno IS NULL))
                        AND (date_of_expiry = r.passportexpdte OR (date_of_expiry IS NULL AND r.passportexpdte IS NULL));
                END;

                UPDATE sync_blacklist_cases tgt
                SET tgt.travel_docs_id    = l_travel_docs_id
                   ,tgt.currentness_in_bc = SYSDATE
                WHERE tgt.wlcd = r.lppcd
                AND (tgt.ownerage = r.ownerage OR (tgt.ownerage IS NULL AND r.ownerage IS NULL))
                AND tgt.pibics_table_cd = lc_pibics_table_cd;
            EXCEPTION
                WHEN OTHERS THEN
                    --ignore PLW-06009: procedure "INSERT_TARGET" OTHERS handler does not end in RAISE or RAISE_APPLICATION_ERROR
                    l_err_rec.ora_err_number$ := SQLCODE;
                    l_err_rec.ora_err_mesg$   := SQLERRM;
                    l_err_rec.ora_err_tag$    := coalesce(p_tag
                                                         ,l_start_date);
                    l_err_rec.wlcd            := r.lppcd;
                    l_err_rec.ownerage        := r.ownerage;
                    l_err_rec.case_id         := l_case_id;
                    l_err_rec.identity_id     := l_identity_id;
                    l_err_rec.address_id      := NULL;
                    l_err_rec.travel_doc_id   := l_travel_docs_id;
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
        IF l_cnt_processed_cases = 0 THEN
            pkg_utils.end_empty_step;
        ELSE

            pkg_utils.end_step(p_cnt        => l_cnt_processed_cases
                              ,p_tablenames => l_tablenames);
        END IF;
    END insert_target_lostpassport;

PROCEDURE insert_target_watchlist2(p_date in varchar2) IS

        PRAGMA AUTONOMOUS_TRANSACTION;
       
        l_cnt_insert          NUMBER := 0;
        v_count_biowl         NUMBER := 0;
        v_count_biowliden     NUMBER := 0;
        v_count_biowlcaseiden     NUMBER := 0;
        v_count_biowltraveldocs  NUMBER := 0;
        l_case_id             dl_blacklist.blacklist_cases.id%TYPE;
        l_identity_id         dl_blacklist.identities.key_value%TYPE;
        l_identity_date_of_brith         dl_blacklist.identities.DATE_OF_BIRTH%TYPE;
        l_identity_date_of_brith_partial         dl_blacklist.identities.DATE_OF_BIRTH_PARTIAL%TYPE;
        lc_pibics_table_cd    VARCHAR2(1 CHAR) := 'W';
        l_start_date          VARCHAR2(20) := to_char(SYSDATE
                                                     ,'YYYY-MM-DD HH24:MI:SS');
        
BEGIN
    
        FOR r0 IN (select wlcd, seqno from DL_STAGING4PIBICS.watchlist2 where to_char(credte,'YYYYMMDD') = p_date)
        LOOP
        
        BEGIN
    
        l_case_id     := NULL;
        SELECT SUM(CASE
                       WHEN case_id IS NULL
                            OR identity_id IS NULL THEN
                        1
                       ELSE
                        0
                   END)
        INTO l_cnt_insert
        FROM sync_blacklist_cases2
        WHERE pibics_table_cd = lc_pibics_table_cd
        and wlcd = r0.wlcd and seqno = r0.seqno;

        IF l_cnt_insert > 0 THEN
        BEGIN
            
            FOR r IN (SELECT wl.wlcd
                        ,wl.seqno
                        ,wl.ownerage
                        ,wl.agccont
                        ,wl.agcphone
                        ,wl.emgcont
                        ,wl.seclev
                        ,wl.targetno
                        ,wl.warrno
                        ,wl.warrdte
                        ,wl.warrexpdte
                        ,wl.permitdte1
                        ,wl.permitdte2
                        ,pkg_transcode.get_reason_code(wl.reasoncd) AS reasoncd
                        ,wl.remark
                        ,wl.birthplace
                        ,wl.height
                        ,wl.weight
                        ,wl.haircolor
                        ,wl.hair
                        ,wl.face
                        ,wl.build
                        ,wl.eyecolor
                        ,wl.complexion
                        ,wl.feature
                        ,wl.peculiarity
                        ,pkg_transcode.get_occupation(wl.occcd) occcd
                        ,pkg_from_pibics.birthdte_date(wl.birthdte) AS birthdte
                        ,wl.sex
                        ,pkg_transcode.get_country(wl.nationcd) AS nationcd
                        ,wl.wltlastnm
                        ,wl.wltfirstnm
                        ,wl.wltmiddlenm
                        ,wl.wlelastnm
                        ,wl.wlemiddlenm
                        ,wl.wlefirstnm
                        ,wl.efsndxnm
                        ,wl.emsndxnm
                        ,wl.elsndxnm
                        ,nvl(wl.creusr,' ') as creusr
                        ,wl.credte
                        ,wl.updusr
                        ,wl.upddte
                        ,wl.TD_SEQNO
                        ,wl.creorg
                        ,wl.OPERREF
                        ,wl.DOCREF
                        ,wl.SEQNO_WLIC
                        ,wl.IDCCD_WLIC
                        ,UPPER(wl.DOCNO_WLIC) as DOCNO_WLIC
                        ,wl.ISUDTE_WLIC
                        ,wl.ISUPLACE_WLIC
                  FROM dl_staging4pibics.watchlist2 wl
                  INNER JOIN sync_blacklist_cases2 s
                  ON wl.wlcd = s.wlcd
                  AND (wl.seqno = s.seqno OR (wl.seqno IS NULL AND s.seqno IS NULL))
                  AND s.pibics_table_cd = lc_pibics_table_cd
                  WHERE wl.wlcd = r0.wlcd and wl.seqno = r0.seqno)
        LOOP
        
        --l_case_id     := NULL;
        l_identity_id := NULL;
        
                BEGIN
                
                    select count(*) into v_count_biowl from dl_blacklist.blacklist_cases where CASE_NUMBER = r.wlcd;
                    if v_count_biowl = 0 then
                    begin
                        INSERT INTO dl_blacklist.blacklist_cases tgt
                            (case_number
                            ,authority
                            ,contact_owner_data
                            ,contact_telephone_number
                            ,urgent_contact
                            ,secret_level
                            ,target_code
                            ,arrested_warrant_number
                            ,arrested_warrant_date
                            ,arrested_warrant_expiry_date
                            ,travel_permit_from
                            ,travel_permit_to
                            ,warrant_arrested_type
                            ,notice
                            ,ins_by
                            ,ins_at
                            ,dml_by
                            ,dml_at
                            ,ACTION_CODE
                            ,reason
                            ,ASSOCIATED_BEHAVIOR
                            ,REFERENCE_DOCUMENT)
                        VALUES
                            (r.wlcd
                            ,r.creorg
                            ,r.agccont
                            ,r.agcphone
                            ,r.emgcont
                            ,r.seclev
                            ,r.targetno
                            ,r.warrno
                            ,r.warrdte
                            ,r.warrexpdte
                            ,r.permitdte1
                            ,r.permitdte2
                            ,NULL
                            ,r.remark
                            ,r.creusr
                            ,r.credte
                            ,r.updusr
                            ,r.upddte
                            ,r.TD_SEQNO
                            ,r.reasoncd
                            ,r.OPERREF
                            ,r.DOCREF)
                        RETURNING id INTO l_case_id;
                    end;
                    else
                        select id into l_case_id from dl_blacklist.blacklist_cases where CASE_NUMBER = r.wlcd;
                    end if;
                    
                    select count(*) into v_count_biowliden from dl_blacklist.identities where CASE_NUMBER = r.wlcd
                    and SEQNO = r.seqno;
                    if v_count_biowliden = 0 then
                    begin
                    
                        INSERT INTO dl_blacklist.identities
                        (
                        case_number
                        ,seqno
                        , place_of_birth
                        ,body_height
                        ,body_weight
                        ,hair_color
                        ,hair_characteristic
                        ,face_shape
                        ,body_shape
                        ,eye_color
                        ,skin
                        ,dominant_characteristic
                        ,special_characteristic
                        ,profession
                        ,date_of_birth
                        ,sex
                        ,nationality
                        ,surname_thai
                        ,givenname_thai
                        ,middlename_thai
                        ,surname
                        ,middle_name
                        ,given_name
                        --,phonetic_given_name
                        --,phonetic_middle_name
                        --,phonetic_surname
                        ,ins_by
                        ,ins_at
                        ,dml_by
                        ,dml_at
                        ,date_of_birth_partial)
                        VALUES
                        (r.wlcd
                        ,r.seqno
                        ,r.birthplace
                        ,r.height
                        ,r.weight
                        ,r.haircolor
                        ,r.hair
                        ,r.face
                        ,r.build
                        ,r.eyecolor
                        ,r.complexion
                        ,r.feature
                        ,r.peculiarity
                        ,r.occcd
                        ,r.birthdte
                        ,r.sex
                        ,r.nationcd
                        ,r.wltlastnm
                        ,r.wltfirstnm
                        ,r.wltmiddlenm
                        ,r.wlelastnm
                        ,r.wlemiddlenm
                        ,r.wlefirstnm
                        --,r.efsndxnm
                        --,r.emsndxnm
                        --,r.elsndxnm
                        ,r.creusr
                        ,r.credte
                        ,r.updusr
                        ,r.upddte
                        ,dl_blacklist.pkg_dl_utils.get_partial_from_varchar(to_char(r.birthdte ,'DD/MM/YYYY')))
                    RETURNING key_value INTO l_identity_id;
                end;
                else    
                begin
                    select key_value into l_identity_id from dl_blacklist.identities where CASE_NUMBER = r.wlcd
                    and SEQNO = r.seqno;
                end;
                end if;
                
                  if r.DOCNO_WLIC is not null then
                begin
                
                select count(*) into v_count_biowltraveldocs from DL_BLACKLIST.TRAVEL_DOCS where IDENTITY = l_identity_id;
                     if v_count_biowltraveldocs = 0 then
                    begin
                    
                        INSERT INTO dl_blacklist.TRAVEL_DOCS tvd
                            (IDENTITY 
                            ,DOC_NUMBER
                            ,DATE_OF_ISSUE
                            ,INS_AT
                            ,INS_BY
                            ,DML_AT
                            ,DML_BY
                            ,DML_TYPE
                            ,tvd.date_of_birth
                            ,tvd.date_of_birth_partial
                            )
                        VALUES
                            (l_identity_id 
                            ,r.DOCNO_WLIC
                            ,r.ISUDTE_WLIC
                            ,r.credte
                            ,r.creusr
                            ,r.upddte
                            ,r.updusr
                            ,'I'
                            ,r.birthdte
                            ,dl_blacklist.pkg_dl_utils.get_partial_from_varchar(to_char(r.birthdte,'DD/MM/YYYY'))
                            );
                            
                    end;
                    else
                        UPDATE  dl_blacklist.TRAVEL_DOCS tvd
                        SET tvd.DOC_NUMBER      = r.DOCNO_WLIC
                            ,tvd.DATE_OF_ISSUE   = r.ISUDTE_WLIC
                            ,tvd.DML_TYPE        = 'U'
                            ,tvd.date_of_birth = r.birthdte
                            ,tvd.date_of_birth_partial = dl_blacklist.pkg_dl_utils.get_partial_from_varchar(to_char(r.birthdte,'DD/MM/YYYY'))
                            where tvd.IDENTITY = l_identity_id;
                            
                    end if;
                    
                end;
                end if;
                
                 select count(*) into v_count_biowlcaseiden from dl_blacklist.blacklist_case_identities where blacklist_case = l_case_id
                 and identity = l_identity_id;
                 
                if v_count_biowlcaseiden = 0 then
                begin
                    
                INSERT INTO dl_blacklist.blacklist_case_identities
                (blacklist_case,identity)
                VALUES(l_case_id,l_identity_id);
                        
                UPDATE sync_blacklist_cases tgt
                SET case_id = l_case_id,
                identity_id  = l_identity_id
                WHERE wlcd = r.wlcd
                AND ((seqno IS NULL AND r.seqno IS NULL) OR seqno = r.seqno)
                AND pibics_table_cd = lc_pibics_table_cd;
                
                end;
                end if;
                
           END;     
        END LOOP;
        
        END;
        ELSE 
        
        FOR r3 IN (SELECT wl.wlcd
                        ,wl.seqno as seqno
                        ,nvl(wl.creusr,' ') as creusr
                        ,wl.credte
                        ,wl.updusr
                        ,wl.upddte
                        ,wl.SEQNO_WLIC
                        ,wl.IDCCD_WLIC
                        ,UPPER(wl.DOCNO_WLIC) as DOCNO_WLIC
                        ,wl.ISUDTE_WLIC
                        ,wl.ISUPLACE_WLIC
                  FROM dl_staging4pibics.watchlist2 wl
                  INNER JOIN sync_blacklist_cases2 s
                  ON wl.wlcd = s.wlcd
                  AND (wl.seqno = s.seqno OR (wl.seqno IS NULL AND s.seqno IS NULL)) 
                  AND s.pibics_table_cd = lc_pibics_table_cd
                  WHERE wl.wlcd = r0.wlcd and wl.seqno = r0.seqno
                  and wl.DOCNO_WLIC is not null )
                  
                                   
        LOOP
        
         l_identity_id := NULL;
        
                BEGIN
                
                select count(*) into v_count_biowliden from dl_blacklist.identities where CASE_NUMBER = r3.wlcd
                    and SEQNO = r3.seqno;
                    
                if v_count_biowliden > 0 then
                BEGIN 
          
                select  key_value,date_of_birth,date_of_birth_partial into l_identity_id,l_identity_date_of_brith,l_identity_date_of_brith_partial from dl_blacklist.identities where CASE_NUMBER = r3.wlcd
                    and SEQNO = r3.seqno AND ROWNUM < 2;
                    
                    
                select count(*) into v_count_biowltraveldocs from DL_BLACKLIST.TRAVEL_DOCS where IDENTITY = l_identity_id;
                     if v_count_biowltraveldocs = 0 then
                    begin
                        INSERT INTO dl_blacklist.TRAVEL_DOCS tvd
                            (IDENTITY 
                            ,DOC_NUMBER
                            ,DATE_OF_ISSUE
                            ,INS_AT
                            ,INS_BY
                            ,DML_AT
                            ,DML_BY
                            ,DML_TYPE
                            ,tvd.date_of_birth
                            ,tvd.date_of_birth_partial
                            )
                        VALUES
                            (l_identity_id 
                            ,r3.DOCNO_WLIC
                            ,r3.ISUDTE_WLIC
                            ,r3.credte
                            ,r3.creusr
                            ,r3.upddte
                            ,r3.updusr
                            ,'I'
                            ,l_identity_date_of_brith
                            ,l_identity_date_of_brith_partial
                            );
                            
                    end;
                    else
                        UPDATE  dl_blacklist.TRAVEL_DOCS tvd
                        SET tvd.DOC_NUMBER              = r3.DOCNO_WLIC
                            ,tvd.DATE_OF_ISSUE           = r3.ISUDTE_WLIC
                            ,tvd.INS_AT                  = r3.credte
                            ,tvd.INS_BY                  = r3.creusr
                            ,tvd.DML_TYPE                = 'U'
                            ,tvd.date_of_birth           = l_identity_date_of_brith
                            ,tvd.date_of_birth_partial   = l_identity_date_of_brith_partial
                            where tvd.IDENTITY = l_identity_id;
                            
                    end if;
                    
                end;
                END if;
            end;
            END LOOP;
        
        
        END IF;
        
        END;     
        END LOOP;
        COMMIT;
                
END insert_target_watchlist2;


PROCEDURE insert_target_WLINDICATECARD(p_date in varchar2) IS

        PRAGMA AUTONOMOUS_TRANSACTION;
        
        v_count_biowliden         NUMBER := 0;
        v_count_biotravel_docs NUMBER := 0;
        l_identity_id         dl_blacklist.identities.key_value%TYPE;   
        l_identity_date_of_brith         dl_blacklist.identities.DATE_OF_BIRTH%TYPE;
        l_identity_date_of_brith_partial         dl_blacklist.identities.DATE_OF_BIRTH_PARTIAL%TYPE;
        
BEGIN


 FOR r IN (select WLCD ,
                SEQNO ,
                IDCCD ,
                DOCNO ,
                ISUDTE ,
                ISUPLACE ,
                CREDTE  from DL_STAGING4PIBICS.WLINDICATECARD where to_char(credte,'YYYYMMDD') = p_date)
        LOOP
        
        BEGIN
        
                select count(*) into v_count_biowliden from dl_blacklist.identities where CASE_NUMBER = r.wlcd;
                if v_count_biowliden > 0 then
                BEGIN 
                
                    select key_value,date_of_birth,date_of_birth_partial into l_identity_id,l_identity_date_of_brith,l_identity_date_of_brith_partial 
                    from dl_blacklist.identities where CASE_NUMBER = r.wlcd AND ROWNUM < 2 order by seqno;
            
                    select count(*) into v_count_biotravel_docs from  DL_BLACKLIST.TRAVEL_DOCS where IDENTITY = l_identity_id AND DOC_NUMBER = r.DOCNO;
                        IF  v_count_biotravel_docs = 0 then
                        BEGIN
                        
                        INSERT INTO dl_blacklist.TRAVEL_DOCS tvd
                            (IDENTITY 
                            ,DOC_NUMBER
                            ,DATE_OF_ISSUE
                            ,DML_TYPE
                            ,tvd.date_of_birth
                            ,tvd.date_of_birth_partial
                            )
                        VALUES
                            (l_identity_id 
                            ,r.DOCNO
                            ,r.ISUDTE
                            ,'I'
                            ,l_identity_date_of_brith
                            ,l_identity_date_of_brith_partial
                            );
                        
                        END;
                        END IF;
                
                END; 
                END IF;
        
        
        
        END;     
        END LOOP;


COMMIT;
END  insert_target_WLINDICATECARD;


BEGIN
    g_terminal_borderpost_in := pkg_hacks.get_dummy_terminal_in;
END pkg_bl_blacklist_cases;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BL_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BL_BLACKLIST_CASES" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BL_BLACKLIST_CASES" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_BL_BLACKLIST_CASES" TO "BIOSUPPORT";
