CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."COUNTRIES$TIUD0" 
    FOR INSERT OR UPDATE OR DELETE ON dl_common.countries
    COMPOUND TRIGGER
--
    --
    /*******************************************************************************
    *
    *                                                                              *
    *                                                                              *
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * WWirns    26.09.2017  Added
    * WWirns    23.02.2018  Add columns INS_AT and INS_BY
    * WWirns    09.04.2018  Refresh from template
    * WWirns    09.04.2018  Add column OFFICIAL_LANGUAGE
    * WWirns    10.04.2018  Add column OWNER
    *******************************************************************************/
    --
    --
    v_dml_type CHAR(1);
    --
    --
    /**
    * Checks the Trigger Transaction method to get the transaction type
    * Sets the global trigger variable "l_dml_type"
    *
    * Raises an error if no type can be extracted
    */
    PROCEDURE l_set_dml_type(p_prevent_exce IN BOOLEAN DEFAULT FALSE) IS
    BEGIN
        IF (inserting()) THEN
            v_dml_type := 'I';
        ELSIF (updating()) THEN
            v_dml_type := 'U';
        ELSIF (deleting()) THEN
            v_dml_type := 'D';
        ELSE
            IF (NOT nvl(p_prevent_exce
                       ,FALSE)) THEN
                raise_application_error(-20000
                                       ,'Could not determine a value for v_DML_TYPE!');
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
        IF (:new.key_value != :old.key_value) THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
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
    PROCEDURE l_check_fk_content(p_key_value         IN countries.key_value%TYPE
                                ,o_owner             IN countries.owner%TYPE
                                ,n_owner             IN countries.owner%TYPE
                                ,o_official_language IN countries.official_language%TYPE
                                ,n_official_language IN countries.official_language%TYPE
                                 --
                                 ) IS
        --
        v_vc_tmp VARCHAR2(1 CHAR);
        --
    BEGIN
        --
        --
        IF (n_owner IS NOT NULL AND NOT dl_common.pkg_util.is_equal(n_owner
                                                                   ,o_owner)) THEN
            BEGIN
                SELECT t.is_active
                INTO v_vc_tmp
                FROM dl_common.owners t
                WHERE t.key_value = n_owner;
                IF (v_vc_tmp != 'Y') THEN
                    raise_application_error(-20000
                                           ,'The OWNER[''' || n_owner || '''] is not active! For KEY_VALUE[''' ||
                                            p_key_value || '''], DML_TYPE[''' || v_dml_type || '''].');
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    raise_application_error(-20000
                                           ,'The OWNER[''' || n_owner || '''] does not exist! For KEY_VALUE[''' ||
                                            p_key_value || '''], DML_TYPE[''' || v_dml_type || '''].');
            END;
        END IF;
        --
        --
        IF (n_official_language IS NOT NULL AND
           NOT dl_common.pkg_util.is_equal(n_official_language
                                           ,o_official_language)) THEN
            BEGIN
                SELECT t.is_active
                INTO v_vc_tmp
                FROM dl_common.languages t
                WHERE t.key_value = n_official_language;
                IF (v_vc_tmp != 'Y') THEN
                    raise_application_error(-20000
                                           ,'The OFFICIAL_LANGUAGE[''' || n_official_language ||
                                            '''] is not active! For KEY_VALUE[''' || p_key_value || '''], DML_TYPE[''' ||
                                            v_dml_type || '''].');
                END IF;
            EXCEPTION
                WHEN no_data_found THEN
                    raise_application_error(-20000
                                           ,'The OFFICIAL_LANGUAGE[''' || n_official_language ||
                                            '''] does not exist! For KEY_VALUE[''' || p_key_value ||
                                            '''], DML_TYPE[''' || v_dml_type || '''].');
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
    BEFORE STATEMENT IS
    BEGIN
        --
        l_set_dml_type(TRUE);
        --
    END BEFORE STATEMENT;
    --
    --
    /** ======================================================
    * BEFORE EACH ROW EVENT
    * =======================================================
    */
    BEFORE EACH ROW IS
    BEGIN
        --
        IF (v_dml_type IS NULL) THEN
            -- This case can occur for example on MERGE-Statements!
            l_set_dml_type();
        END IF;
        --
        IF (v_dml_type = 'I') THEN
            --
            :new.ins_at   := SYSDATE;
            :new.ins_by   := dl_common.pkg_session.get_audit_user();
            :new.dml_at   := systimestamp;
            :new.dml_by   := dl_common.pkg_session.get_audit_user();
            :new.dml_type := v_dml_type;
            --
        ELSIF (v_dml_type = 'U') THEN
            --
            :new.ins_at := :old.ins_at;
            :new.ins_by := :old.ins_by;
            :new.dml_at := systimestamp;
            :new.dml_by := dl_common.pkg_session.get_audit_user();
            --
            IF (l_has_pk_value_changed()) THEN
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
    AFTER EACH ROW IS
    BEGIN
        --
        IF (v_dml_type IS NULL) THEN
            -- This case can occur for example on MERGE-Statements!
            l_set_dml_type();
        END IF;
        --
        IF (v_dml_type = 'I') THEN
            --
            l_check_fk_content(:new.key_value
                              ,NULL
                              ,:new.owner
                              ,NULL
                              ,:new.official_language
                               --
                               );
            --
        ELSIF (v_dml_type = 'U') THEN
            --
            l_check_fk_content(:new.key_value
                              ,:old.owner
                              ,:new.owner
                              ,:old.official_language
                              ,:new.official_language
                               --
                               );
            --
            INSERT INTO dl_common.countries$his
                (key_value
                ,locale
                ,display_value
                ,display_order
                ,is_active
                ,notice
                ,iso3166_a3
                ,iso3166_a2
                ,iso3166_num
                ,tl_domain
                ,phone_area_code
                ,icao_loc_part
                ,nationality
                ,num_value
                ,official_language
                ,continent
                ,row_flag_mask
                ,dml_at
                ,dml_by
                ,dml_type
                ,ins_at
                ,ins_by
                ,owner)
            VALUES
                (:old.key_value
                ,:old.locale
                ,:old.display_value
                ,:old.display_order
                ,:old.is_active
                ,:old.notice
                ,:old.iso3166_a3
                ,:old.iso3166_a2
                ,:old.iso3166_num
                ,:old.tl_domain
                ,:old.phone_area_code
                ,:old.icao_loc_part
                ,:old.nationality
                ,:old.num_value
                ,:old.official_language
                ,:old.continent
                ,:old.row_flag_mask
                ,:old.dml_at
                ,:old.dml_by
                ,:old.dml_type
                ,:old.ins_at
                ,:old.ins_by
                ,:old.owner);

            --
            IF (l_has_pk_value_changed()) THEN
                -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
                INSERT INTO countries$his
                    (key_value
                    ,ins_at
                    ,ins_by
                    ,dml_at
                    ,dml_by
                    ,dml_type)
                VALUES
                    (:old.key_value
                    ,:old.ins_at
                    ,:old.ins_by
                    ,systimestamp
                    ,dl_common.pkg_session.get_audit_user()
                    ,'D'
                     --
                     );
            END IF;
            --
        ELSE
            -- 'D'
            INSERT INTO dl_common.countries$his
                (key_value
                ,locale
                ,display_value
                ,display_order
                ,is_active
                ,notice
                ,iso3166_a3
                ,iso3166_a2
                ,iso3166_num
                ,tl_domain
                ,phone_area_code
                ,icao_loc_part
                ,nationality
                ,num_value
                ,official_language
                ,continent
                ,row_flag_mask
                ,dml_at
                ,dml_by
                ,dml_type
                ,ins_at
                ,ins_by
                ,owner)
            VALUES
                (:old.key_value
                ,:old.locale
                ,:old.display_value
                ,:old.display_order
                ,:old.is_active
                ,:old.notice
                ,:old.iso3166_a3
                ,:old.iso3166_a2
                ,:old.iso3166_num
                ,:old.tl_domain
                ,:old.phone_area_code
                ,:old.icao_loc_part
                ,:old.nationality
                ,:old.num_value
                ,:old.official_language
                ,:old.continent
                ,:old.row_flag_mask
                ,:old.dml_at
                ,:old.dml_by
                ,:old.dml_type
                ,:old.ins_at
                ,:old.ins_by
                ,:old.owner);
            --
            INSERT INTO countries$his
                (key_value
                ,ins_at
                ,ins_by
                ,dml_at
                ,dml_by
                ,dml_type)
            VALUES
                (:old.key_value
                ,:old.ins_at
                ,:old.ins_by
                ,systimestamp
                ,dl_common.pkg_session.get_audit_user()
                ,'D'
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
    AFTER STATEMENT IS
    BEGIN
        --
        v_dml_type := NULL;
        --
    END AFTER STATEMENT;
    --
END countries$tiud0;
/
ALTER TRIGGER "DL_COMMON"."COUNTRIES$TIUD0" ENABLE;
