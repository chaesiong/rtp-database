CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."IDENTITIES$TIUD0_O" FOR INSERT OR UPDATE OR DELETE ON "DL_BLACKLIST"."IDENTITIES_O"
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
    * WWilms    20.06.2018  Added thai version name columns
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
        --
        IF (:new.key_value != :old.key_value
           --
           -- Begin:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
           OR :new.key_value || '' != :old.key_value || ''
           -- End:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
           --
           ) THEN
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
    PROCEDURE l_check_fk_content(p_key_value        IN identities.key_value%TYPE
                                ,o_country_of_birth IN identities.country_of_birth%TYPE
                                ,n_country_of_birth IN identities.country_of_birth%TYPE
                                ,o_nationality      IN identities.nationality%TYPE
                                ,n_nationality      IN identities.nationality%TYPE
                                ,o_sex              IN identities.sex%TYPE
                                ,n_sex              IN identities.sex%TYPE
                                ,o_salutation       IN identities.salutation%TYPE
                                ,n_salutation       IN identities.salutation%TYPE
                                ,o_profession       IN identities.profession%TYPE
                                ,n_profession       IN identities.profession%TYPE
                                 --
                                 ) IS
        --
        v_vc_tmp VARCHAR2(1 CHAR);
        --
    BEGIN
        --
        --
        NULL;
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
            -- Begin:PK is a surrogate key
            /*
            if (:new.KEY_VALUE is null)
            then
              :new.KEY_VALUE := DL_BLACKLIST.IDENTITIES$SEQ00.NextVal;
            end if;
            */
            -- End:PK is a surrogate key
            --
            :new.ins_by   := coalesce(:new.ins_by
                                     ,dl_common.pkg_session.get_audit_user());
            :new.ins_at   := coalesce(:new.ins_at
                                     ,systimestamp);
            :new.dml_by   := coalesce(:new.dml_by
                                     ,dl_common.pkg_session.get_audit_user());
            :new.dml_at   := coalesce(:new.dml_at
                                     ,systimestamp);
            :new.dml_type := v_dml_type;
            --
        ELSIF (v_dml_type = 'U') THEN
            --
            :new.ins_by := :old.ins_by;
            :new.ins_at := :old.ins_at;
            :new.dml_by := coalesce(:new.dml_by
                                   ,dl_common.pkg_session.get_audit_user());
            :new.dml_at := coalesce(:new.dml_at
                                   ,systimestamp);
            --
            IF (l_has_pk_value_changed()) THEN
                -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
                :new.dml_type := 'I';
            ELSE
                :new.dml_type := v_dml_type;
            END IF;
            --
            :new.owner := CASE
                              WHEN (:old.owner IS NOT NULL) THEN
                               :old.owner
                              ELSE
                               :new.owner
                          END;
            --
            --
            /*
            if (:new.FACE_IMAGE_ISID != :old.FACE_IMAGE_ISID)
            then
              Raise_application_error(-20000
                                     ,'The FACE_IMAGE_ISID[''' || :new.FACE_IMAGE_ISID || '''] cannot be changed! For KEY_VALUE[''' || :new.KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
            end if;
            */
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
                              ,:new.country_of_birth
                              ,NULL
                              ,:new.nationality
                              ,NULL
                              ,:new.sex
                              ,NULL
                              ,:new.salutation
                              ,NULL
                              ,:new.profession
                               --
                               );
            --
        ELSIF (v_dml_type = 'U') THEN
            --
            l_check_fk_content(:new.key_value
                              ,:old.country_of_birth
                              ,:new.country_of_birth
                              ,:old.nationality
                              ,:new.nationality
                              ,:old.sex
                              ,:new.sex
                              ,:old.salutation
                              ,:new.salutation
                              ,:old.profession
                              ,:new.profession
                               --
                               );
            --
            INSERT INTO identities$his
                (key_value
                ,unique_value
                ,salutation
                ,surname
                ,middle_name
                ,given_name
                ,surname_thai
                ,middlename_thai
                ,givenname_thai
                ,date_of_birth
                ,place_of_birth
                ,country_of_birth
                ,nationality
                ,sex
                ,notice
                ,profession
                ,phone_number_0
                ,phone_number_1
                ,phone_number_2
                ,address_0
                ,address_1
                ,address_2
                ,body_height
                ,body_weight
                ,body_shape
                ,hair_color
                ,hair_characteristic
                ,face_shape
                ,eye_color
                ,skin
                ,dominant_characteristic
                ,special_characteristic
                ,phonetic_surname
                ,phonetic_middle_name
                ,phonetic_given_name
                ,ins_at
                ,ins_by
                ,dml_at
                ,dml_by
                ,dml_type
                ,owner
                ,extended_data_source
                ,extended_data_pk_0
                ,extended_data_pk_1
                ,extended_data_pk_2
                 --
                 )
            VALUES
                (:old.key_value
                ,:old.unique_value
                ,:old.salutation
                ,:old.surname
                ,:old.middle_name
                ,:old.given_name
                ,:old.surname_thai
                ,:old.middlename_thai
                ,:old.givenname_thai
                ,:old.date_of_birth
                ,:old.place_of_birth
                ,:old.country_of_birth
                ,:old.nationality
                ,:old.sex
                ,:old.notice
                ,:old.profession
                ,:old.phone_number_0
                ,:old.phone_number_1
                ,:old.phone_number_2
                ,:old.address_0
                ,:old.address_1
                ,:old.address_2
                ,:old.body_height
                ,:old.body_weight
                ,:old.body_shape
                ,:old.hair_color
                ,:old.hair_characteristic
                ,:old.face_shape
                ,:old.eye_color
                ,:old.skin
                ,:old.dominant_characteristic
                ,:old.special_characteristic
                ,:old.phonetic_surname
                ,:old.phonetic_middle_name
                ,:old.phonetic_given_name
                ,:old.ins_at
                ,:old.ins_by
                ,:old.dml_at
                ,:old.dml_by
                ,:old.dml_type
                ,:old.owner
                ,:old.extended_data_source
                ,:old.extended_data_pk_0
                ,:old.extended_data_pk_1
                ,:old.extended_data_pk_2
                 --
                 );
            --
            IF (l_has_pk_value_changed()) THEN
                -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
                INSERT INTO identities$his
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
            INSERT INTO identities$his
                (key_value
                ,unique_value
                ,salutation
                ,surname
                ,middle_name
                ,given_name
                ,surname_thai
                ,middlename_thai
                ,givenname_thai
                ,date_of_birth
                ,place_of_birth
                ,country_of_birth
                ,nationality
                ,sex
                ,notice
                ,profession
                ,phone_number_0
                ,phone_number_1
                ,phone_number_2
                ,address_0
                ,address_1
                ,address_2
                ,body_height
                ,body_weight
                ,body_shape
                ,hair_color
                ,hair_characteristic
                ,face_shape
                ,eye_color
                ,skin
                ,dominant_characteristic
                ,special_characteristic
                ,phonetic_surname
                ,phonetic_middle_name
                ,phonetic_given_name
                ,ins_at
                ,ins_by
                ,dml_at
                ,dml_by
                ,dml_type
                ,owner
                ,extended_data_source
                ,extended_data_pk_0
                ,extended_data_pk_1
                ,extended_data_pk_2
                 --
                 )
            VALUES
                (:old.key_value
                ,:old.unique_value
                ,:old.salutation
                ,:old.surname
                ,:old.middle_name
                ,:old.given_name
                ,:old.surname_thai
                ,:old.middlename_thai
                ,:old.givenname_thai
                ,:old.date_of_birth
                ,:old.place_of_birth
                ,:old.country_of_birth
                ,:old.nationality
                ,:old.sex
                ,:old.notice
                ,:old.profession
                ,:old.phone_number_0
                ,:old.phone_number_1
                ,:old.phone_number_2
                ,:old.address_0
                ,:old.address_1
                ,:old.address_2
                ,:old.body_height
                ,:old.body_weight
                ,:old.body_shape
                ,:old.hair_color
                ,:old.hair_characteristic
                ,:old.face_shape
                ,:old.eye_color
                ,:old.skin
                ,:old.dominant_characteristic
                ,:old.special_characteristic
                ,:old.phonetic_surname
                ,:old.phonetic_middle_name
                ,:old.phonetic_given_name
                ,:old.ins_at
                ,:old.ins_by
                ,:old.dml_at
                ,:old.dml_by
                ,:old.dml_type
                ,:old.owner
                ,:old.extended_data_source
                ,:old.extended_data_pk_0
                ,:old.extended_data_pk_1
                ,:old.extended_data_pk_2
                 --
                 );
            --
            INSERT INTO identities$his
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
END identities$tiud0;
/
ALTER TRIGGER "DL_BLACKLIST"."IDENTITIES$TIUD0_O" DISABLE;
