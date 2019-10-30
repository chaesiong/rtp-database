CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."TRAVEL_DOCS$TIUD0" FOR
    INSERT OR UPDATE OR DELETE ON dl_blacklist.travel_docs
COMPOUND TRIGGER
--
    --
    /*******************************************************************************
    *
    *                                                                              *
    *                                                                              *
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * WWirns    17.04.2018  Added
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
        p_prevent_exce IN   BOOLEAN DEFAULT false
    ) IS
    BEGIN
        IF ( inserting() ) THEN
            v_dml_type := 'I';
        ELSIF ( updating() ) THEN
            v_dml_type := 'U';
        ELSIF ( deleting() ) THEN
            v_dml_type := 'D';
        ELSE
            IF ( NOT nvl(p_prevent_exce, false) ) THEN
                raise_application_error(-20000, 'Could not determine a value for v_DML_TYPE!');
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
        --
        IF ( :new.key_value != :old.key_value
           --
           -- Begin:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
         OR :new.doc_number
                                                 || :new.date_of_expiry$vc
                                                 || :new.issuing_country != :old.doc_number
                                                                            || :old.date_of_expiry$vc
                                                                            || :old.issuing_country
           -- End:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
           --
                                                                             ) THEN
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
        p_key_value         IN                  travel_docs.key_value%TYPE,
        o_issuing_country   IN                  travel_docs.issuing_country%TYPE,
        n_issuing_country   IN                  travel_docs.issuing_country%TYPE,
        o_nationality       IN                  travel_docs.nationality%TYPE,
        n_nationality       IN                  travel_docs.nationality%TYPE,
        o_sex               IN                  travel_docs.sex%TYPE,
        n_sex               IN                  travel_docs.sex%TYPE
                                 --
    ) IS
        --
        v_vc_tmp   VARCHAR2(1 CHAR);
        --
    BEGIN
        --
        --
        IF ( n_issuing_country IS NOT NULL AND NOT dl_common.pkg_util.is_equal(n_issuing_country, o_issuing_country) ) THEN
            BEGIN
                SELECT
                    t.is_active
                INTO v_vc_tmp
                FROM
                    dl_common.icao_doc_codes t
                WHERE
                    t.key_value = n_issuing_country;
                IF ( v_vc_tmp != 'Y' ) THEN
                    raise_application_error(-20000, 'The ISSUING_COUNTRY['''
                                                    || n_issuing_country
                                                    || '''] is not active! For KEY_VALUE['''
                                                    || p_key_value
                                                    || '''], DML_TYPE['''
                                                    || v_dml_type
                                                    || '''].');
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    raise_application_error(-20000, 'The ISSUING_COUNTRY['''
                                                    || n_issuing_country
                                                    || '''] does not exist! For KEY_VALUE['''
                                                    || p_key_value
                                                    || '''], DML_TYPE['''
                                                    || v_dml_type
                                                    || '''].');
            END;
        END IF;
        --
        --
        IF ( n_nationality IS NOT NULL AND NOT dl_common.pkg_util.is_equal(n_nationality, o_nationality) ) THEN
            BEGIN
                SELECT
                    t.is_active
                INTO v_vc_tmp
                FROM
                    dl_common.icao_doc_codes t
                WHERE
                    t.key_value = n_nationality;
                IF ( v_vc_tmp != 'Y' ) THEN
                    raise_application_error(-20000, 'The NATIONALITY['''
                                                    || n_nationality
                                                    || '''] is not active! For KEY_VALUE['''
                                                    || p_key_value
                                                    || '''], DML_TYPE['''
                                                    || v_dml_type
                                                    || '''].');
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    raise_application_error(-20000, 'The NATIONALITY['''
                                                    || n_nationality
                                                    || '''] does not exist! For KEY_VALUE['''
                                                    || p_key_value
                                                    || '''], DML_TYPE['''
                                                    || v_dml_type
                                                    || '''].');
            END;
        END IF;
        --
        --
        IF ( n_sex IS NOT NULL AND NOT dl_common.pkg_util.is_equal(n_sex, o_sex) ) THEN
            BEGIN
                SELECT
                    t.is_active
                INTO v_vc_tmp
                FROM
                    dl_common.human_sexes t
                WHERE
                    t.icao = n_sex;
                IF ( v_vc_tmp != 'Y' ) THEN
                    raise_application_error(-20000, 'The SEX['''
                                                    || n_sex
                                                    || '''] is not active! For KEY_VALUE['''
                                                    || p_key_value
                                                    || '''], DML_TYPE['''
                                                    || v_dml_type
                                                    || '''].');
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    raise_application_error(-20000, 'The SEX['''
                                                    || n_sex
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
            l_set_dml_type();
        END IF;
        --
        IF ( v_dml_type = 'I' ) THEN
            --
            -- Begin:PK is a surrogate key
            /*
            if (:new.KEY_VALUE is null)
            then
              :new.KEY_VALUE := DL_BLACKLIST.IDENTITIES$SEQ00.NextVal;
            end if;
            */
            -- End:PK is a surrogate key
            --
            :new.ins_by := dl_common.pkg_session.get_audit_user();
            :new.ins_at := systimestamp;
            :new.dml_by := dl_common.pkg_session.get_audit_user();
            :new.dml_at := systimestamp;
            :new.dml_type := v_dml_type;
        ELSIF ( v_dml_type = 'U' ) THEN
            --
            --    :new.ins_by := :old.ins_by;
            --        :new.ins_at := :old.ins_at;
            :new.dml_by := dl_common.pkg_session.get_audit_user();
            :new.dml_at := systimestamp;
            :new.dml_type := v_dml_type;
        END IF;
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
            l_set_dml_type();
        END IF;
        --
        IF ( v_dml_type = 'I' ) THEN
            --
            l_check_fk_content(:new.key_value, NULL, :new.issuing_country, NULL, :new.nationality, NULL, :new.sex
                               --
            );
            --
        ELSIF ( v_dml_type = 'U' ) THEN
            --
            l_check_fk_content(:new.key_value, :old.issuing_country, :new.issuing_country, :old.nationality, :new.nationality,
            :old.sex, :new.sex
                               --
            );
            INSERT INTO travel_docs$his (
                key_value,
                unique_value,
                doc_type,
                issuing_country,
                doc_number,
                date_of_issue,
                date_of_expiry$vc,
                date_of_expiry,
                surname,
                given_name,
                nationality,
                place_of_birth,
                sex,
                issuing_authority,
                date_of_birth$vc,
                mrz_format,
                mrz_data,
                data_acquisition_type,
                ins_at,
                ins_by,
                dml_at,
                dml_by,
                dml_type,
                owner,
                identity,
                date_of_birth_partial,
                hair_color,
                hair_characteristic,
                middle_name,
                unique_value$his
                 --
            ) VALUES (
                :old.key_value,
                :old.unique_value,
                :old.doc_type,
                :old.issuing_country,
                :old.doc_number,
                :old.date_of_issue,
                :old.date_of_expiry$vc,
                :old.date_of_expiry,
                :old.surname,
                :old.given_name,
                :old.nationality,
                :old.place_of_birth,
                :old.sex,
                :old.issuing_authority,
                :old.date_of_birth$vc,
                :old.mrz_format,
                :old.mrz_data,
                :old.data_acquisition_type,
                :old.ins_at,
                :old.ins_by,
                :old.dml_at,
                :old.dml_by,
                :old.dml_type,
                :old.owner,
                :old.identity,
                :old.date_of_birth_partial,
                :old.hair_color,
                :old.hair_characteristic,
                :old.middle_name,
                :old.unique_value
                --
            );
            --
            IF ( l_has_pk_value_changed() ) THEN
                -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
                INSERT INTO travel_docs$his (
                    key_value,
                    unique_value,
                    ins_at,
                    ins_by,
                    dml_at,
                    dml_by,
                    dml_type
                ) VALUES (
                    :old.key_value,
                    :old.unique_value,
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
            INSERT INTO travel_docs$his (
                key_value,
                unique_value,
                doc_type,
                issuing_country,
                doc_number,
                date_of_issue,
                date_of_expiry$vc,
                date_of_expiry,
                surname,
                given_name,
                nationality,
                place_of_birth,
                sex,
                issuing_authority,
                date_of_birth$vc,
                mrz_format,
                mrz_data,
                data_acquisition_type,
                ins_at,
                ins_by,
                dml_at,
                dml_by,
                dml_type,
                owner,
                identity,
                date_of_birth_partial,
                hair_color,
                hair_characteristic,
                middle_name,
                unique_value$his
            ) VALUES (
                :old.key_value,
                :old.unique_value,
                :old.doc_type,
                :old.issuing_country,
                :old.doc_number,
                :old.date_of_issue,
                :old.date_of_expiry$vc,
                :old.date_of_expiry,
                :old.surname,
                :old.given_name,
                :old.nationality,
                :old.place_of_birth,
                :old.sex,
                :old.issuing_authority,
                :old.date_of_birth$vc,
                :old.mrz_format,
                :old.mrz_data,
                :old.data_acquisition_type,
                :old.ins_at,
                :old.ins_by,
                :old.dml_at,
                :old.dml_by,
                :old.dml_type,
                :old.owner,
                :old.identity,
                :old.date_of_birth_partial,
                :old.hair_color,
                :old.hair_characteristic,
                :old.middle_name,
                :old.unique_value
            );
            INSERT INTO travel_docs$his (
                key_value,
                unique_value,
                ins_at,
                ins_by,
                dml_at,
                dml_by,
                dml_type
            ) VALUES (
                :old.key_value,
                :old.unique_value,
                :old.ins_at,
                :old.ins_by,
                systimestamp,
                dl_common.pkg_session.get_audit_user(),
                'D'
                 --
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
END travel_docs$tiud0;
/
ALTER TRIGGER "DL_BLACKLIST"."TRAVEL_DOCS$TIUD0" ENABLE;
