CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."ICAO_DOC_CODES$TIUD0" FOR
    INSERT OR UPDATE OR DELETE ON dl_common.icao_doc_codes
COMPOUND TRIGGER
--
    --
    /*******************************************************************************
    *
    *                                                                              *
    *                                                                              *
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * WWirns    27.09.2017  Added
    * WWirns    23.02.2018  Add columns INS_AT and INS_BY
    * WWirns    06.04.2018  Refresh from template
    * WWirns    09.04.2018  Add column OFFICIAL_LANGUAGE
    *******************************************************************************/
    --
    --
    v_dml_type   CHAR(1);
    --
    --
    /**
    * Checks the Trigger Transaction method to get the transaction type
    * Sets the global trigger variable "l_dml_type"
    *
    * Raises an error if no type can be extracted
    */
    PROCEDURE l_set_dml_type (
        p_prevent_exce IN BOOLEAN DEFAULT false
    ) IS
    BEGIN
        IF ( inserting () ) THEN
            v_dml_type := 'I';
        ELSIF ( updating () ) THEN
            v_dml_type := 'U';
        ELSIF ( deleting () ) THEN
            v_dml_type := 'D';
        ELSE
            IF ( NOT nvl(p_prevent_exce,false) ) THEN
                raise_application_error(-20000,'Could not determine a value for v_DML_TYPE!');
            END IF;
        END IF;
    END l_set_dml_type;
    --
    --
    /**
    * Checks if the primary key value of the table has changed
    *
    * @return BOOLEAN: True = value has changed, False = value has not changed
    */
    FUNCTION l_has_pk_value_changed RETURN BOOLEAN IS
    BEGIN
        IF (:new.key_value !=:old.key_value ) THEN
            RETURN true;
        ELSE
            RETURN false;
        END IF;
    END l_has_pk_value_changed;
    --
    --
    /**
    * Checks if the foreign key value of the table is valid and can be found in the parent table
    * Raises errors if the value cannot be found
    */
    -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
    --
    PROCEDURE l_check_fk_content (
        p_key_value           IN icao_doc_codes.key_value%TYPE,
        o_official_language   IN icao_doc_codes.official_language%TYPE,
        n_official_language   IN icao_doc_codes.official_language%TYPE
                                 --
    ) IS
        --
        v_vc_tmp   VARCHAR2(1 CHAR);
        --
    BEGIN
        --
        --
        IF ( n_official_language IS NOT NULL AND NOT dl_common.pkg_util.is_equal(n_official_language,o_official_language) ) THEN
            BEGIN
                SELECT
                    t.is_active
                INTO v_vc_tmp
                FROM
                    dl_common.languages t
                WHERE
                    t.key_value = n_official_language;
                IF ( v_vc_tmp != 'Y' ) THEN
                    raise_application_error(-20000,'The OFFICIAL_LANGUAGE['''
                                                    || n_official_language
                                                    || '''] is not active! For KEY_VALUE['''
                                                    || p_key_value
                                                    || '''], DML_TYPE['''
                                                    || v_dml_type
                                                    || '''].');
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    raise_application_error(-20000,'The OFFICIAL_LANGUAGE['''
                                                    || n_official_language
                                                    || '''] does not exist! For KEY_VALUE['''
                                                    || p_key_value
                                                    || '''], DML_TYPE['''
                                                    || v_dml_type
                                                    || '''].');
            END;
        END IF;
        --
    END l_check_fk_content;
    --
    --
    /** ======================================================
    * BEFORE STATEMENT EVENT
    *
    * Extract the dml-type variable
    * =======================================================
    */
    BEFORE STATEMENT IS BEGIN
        --
        l_set_dml_type(true);
        --
    END BEFORE STATEMENT;
    --
    --
    /** ======================================================
    * BEFORE EACH ROW EVENT
    * =======================================================
    */
    BEFORE EACH ROW IS BEGIN
        --
        IF ( v_dml_type IS NULL ) THEN
            -- This case can occur for example on MERGE-Statements!
            l_set_dml_type ();
        END IF;
        --
        IF ( v_dml_type = 'I' ) THEN
            --
            :new.ins_at := SYSDATE;
            :new.ins_by := dl_common.pkg_session.get_audit_user ();
            :new.dml_at := systimestamp;
            :new.dml_by := dl_common.pkg_session.get_audit_user ();
            :new.dml_type := v_dml_type;
            --
        ELSIF ( v_dml_type = 'U' ) THEN
            --
            :new.ins_at :=:old.ins_at;
            :new.ins_by :=:old.ins_by;
            :new.dml_at := systimestamp;
            :new.dml_by := dl_common.pkg_session.get_audit_user ();
            --
            IF ( l_has_pk_value_changed () ) THEN
                -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
                :new.dml_type := 'I';
            ELSE
                :new.dml_type := v_dml_type;
            END IF;
            --
        ELSE
            -- 'D'
            NULL;
            --
        END IF;
        --
    END BEFORE EACH ROW;
    --
    --
    /** ======================================================
    * AFTER EACH ROW EVENT
    * =======================================================
    */
    AFTER EACH ROW IS BEGIN
        --
        IF ( v_dml_type IS NULL ) THEN
            -- This case can occur for example on MERGE-Statements!
            l_set_dml_type ();
        END IF;
        --
        IF ( v_dml_type = 'I' ) THEN
            --
            l_check_fk_content(:new.key_value,NULL,:new.official_language
                               --
            );
            --
        ELSIF ( v_dml_type = 'U' ) THEN
            --
            l_check_fk_content(:new.key_value,:old.official_language,:new.official_language
                               --
            );
            --
            INSERT INTO dl_common.icao_doc_codes$his (
                key_value,
                locale,
                display_value,
                display_order,
                is_active,
                dml_at,
                dml_by,
                dml_type,
                notice,
                num_value,
                row_flag_mask,
                ins_at,
                ins_by,
                official_language
            ) VALUES (
                :old.key_value,
                :old.locale,
                :old.display_value,
                :old.display_order,
                :old.is_active,
                :old.dml_at,
                :old.dml_by,
                :old.dml_type,
                :old.notice,
                :old.num_value,
                :old.row_flag_mask,
                :old.ins_at,
                :old.ins_by,
                :old.official_language
            );
            --
            IF ( l_has_pk_value_changed () ) THEN
                -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
                INSERT INTO icao_doc_codes$his (
                    key_value,
                    ins_at,
                    ins_by,
                    dml_at,
                    dml_by,
                    dml_type
                ) VALUES (
                    :old.key_value,
                    :old.ins_at,
                    :old.ins_by,
                    systimestamp,
                    dl_common.pkg_session.get_audit_user(),
                    'D'
                     --
                );
            END IF;
            --
        ELSE
            -- 'D'
            INSERT INTO dl_common.icao_doc_codes$his (
                key_value,
                locale,
                display_value,
                display_order,
                is_active,
                dml_at,
                dml_by,
                dml_type,
                notice,
                num_value,
                row_flag_mask,
                ins_at,
                ins_by,
                official_language
            ) VALUES (
                :old.key_value,
                :old.locale,
                :old.display_value,
                :old.display_order,
                :old.is_active,
                :old.dml_at,
                :old.dml_by,
                :old.dml_type,
                :old.notice,
                :old.num_value,
                :old.row_flag_mask,
                :old.ins_at,
                :old.ins_by,
                :old.official_language
            );
            --
            INSERT INTO icao_doc_codes$his (
                key_value,
                ins_at,
                ins_by,
                dml_at,
                dml_by,
                dml_type
            ) VALUES (
                :old.key_value,
                :old.ins_at,
                :old.ins_by,
                systimestamp,
                dl_common.pkg_session.get_audit_user(),
                'D'
            );
            --
        END IF;
        --
    END AFTER EACH ROW;
    --
    --
    /** ======================================================
    * AFTER STATEMENT
    * =======================================================
    */
    AFTER STATEMENT IS BEGIN
        --
        v_dml_type := NULL;
        --
    END AFTER STATEMENT;
    --
END icao_doc_codes$tiud0;
/
ALTER TRIGGER "DL_COMMON"."ICAO_DOC_CODES$TIUD0" ENABLE;
