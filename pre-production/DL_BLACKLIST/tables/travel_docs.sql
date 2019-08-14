CREATE TABLE "DL_BLACKLIST"."TRAVEL_DOCS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL sys_guid() NOT NULL ENABLE, 
	"UNIQUE_VALUE" VARCHAR2(32 CHAR) GENERATED ALWAYS AS ("DOC_NUMBER"||"DATE_OF_EXPIRY$VC"||"ISSUING_COUNTRY") VIRTUAL , 
	"DOC_TYPE" VARCHAR2(2 CHAR), 
	"ISSUING_COUNTRY" VARCHAR2(3 CHAR), 
	"DOC_NUMBER" VARCHAR2(20 CHAR), 
	"DATE_OF_ISSUE" DATE, 
	"DATE_OF_EXPIRY$VC" VARCHAR2(6 CHAR), 
	"DATE_OF_EXPIRY" DATE, 
	"SURNAME" VARCHAR2(100 CHAR), 
	"GIVEN_NAME" VARCHAR2(100 CHAR), 
	"NATIONALITY" VARCHAR2(3 CHAR), 
	"PLACE_OF_BIRTH" VARCHAR2(100 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"ISSUING_AUTHORITY" VARCHAR2(100 CHAR), 
	"DATE_OF_BIRTH$VC" VARCHAR2(6 CHAR), 
	"DATE_OF_BIRTH" DATE, 
	"MRZ_FORMAT" VARCHAR2(4 CHAR), 
	"MRZ_DATA" VARCHAR2(90 CHAR), 
	"DATA_ACQUISITION_TYPE" VARCHAR2(6 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR), 
	"IDENTITY" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DOC_CLASS" VARCHAR2(32 CHAR), 
	"HAIR_COLOR" VARCHAR2(100 CHAR), 
	"HAIR_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"FACE_ID" VARCHAR2(32 CHAR), 
	"DATE_OF_BIRTH_PARTIAL" "DL_BLACKLIST"."CT_PARTIAL_DATE" 
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$CK00" CHECK ( key_value = upper(key_value) ) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$CK04" CHECK ( mrz_format IN (
            'td-1',
            'td-2',
            'td-3'
        ) ) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$CK05" CHECK ( data_acquisition_type IN (
            'AUTO',
            'MANUAL'
        ) ) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$CK03" CHECK ( dml_type IN (
            'I',
            'U'
        ) ) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$FK_OWNER" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$FK_ISSUING_COUNTRY" FOREIGN KEY ("ISSUING_COUNTRY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$FK_NATIONALITY" FOREIGN KEY ("NATIONALITY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$FK_SEX" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("ICAO") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$FK_IDENTITY" FOREIGN KEY ("IDENTITY")
	  REFERENCES "DL_BLACKLIST"."IDENTITIES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$FK_DOC_CLASS" FOREIGN KEY ("DOC_CLASS")
	  REFERENCES "DL_COMMON"."BC_DOC_CLASS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS" ADD CONSTRAINT "TRAVEL_DOCS$FK05" FOREIGN KEY ("FACE_ID")
	  REFERENCES "DL_BLACKLIST"."FACES" ("ID") ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."KEY_VALUE" IS 'Internal used primary key as free format';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."UNIQUE_VALUE" IS 'unique value';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DOC_TYPE" IS 'Document type, like it is used into the MRZ at position 1 to 2';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."ISSUING_COUNTRY" IS 'Issuing country as ICAO-Doc-Code';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DOC_NUMBER" IS 'Serial number of the travel document';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DATE_OF_ISSUE" IS 'When was the travel document issued';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DATE_OF_EXPIRY$VC" IS 'Date of expiry as character data type, like it is used in travel documents as format YYMMDD';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DATE_OF_EXPIRY" IS 'Date of expiry as date data type';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."SURNAME" IS 'Surname of the owner of the travel document';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."GIVEN_NAME" IS 'Given name of the owner of the travel document';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."NATIONALITY" IS 'Nationality as ICAO-Doc-Code';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."PLACE_OF_BIRTH" IS 'Place of birth of the owner of the travel document';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."SEX" IS 'Sex as ICAO-Doc-Code';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."ISSUING_AUTHORITY" IS 'Who has issued this travel document';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DATE_OF_BIRTH$VC" IS 'Date of birth as character data type, like it is used in travel documents as format YYMMDD';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DATE_OF_BIRTH" IS 'Date of birth as date data type';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."MRZ_FORMAT" IS 'Format of the MRZ-Data e. g. td-1, td-2 or td-3';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."MRZ_DATA" IS 'Machine readable data of the travel document';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DATA_ACQUISITION_TYPE" IS 'Is the data acquired automatically for example by a passport reader or manually entered';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."INS_AT" IS 'When was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."INS_BY" IS 'By whom was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DML_AT" IS 'When was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DML_BY" IS 'By whom was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."OWNER" IS 'Owner of record, normally who hast it inserted';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."IDENTITY" IS 'Linked identity of a person';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DOC_CLASS" IS 'Linked DOC_CLASS';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."HAIR_COLOR" IS 'Color of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."HAIR_CHARACTERISTIC" IS 'Characteristic of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."MIDDLE_NAME" IS 'Middle name';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."FACE_ID" IS '(optional) Foreign key to table DL_BLACKLIST.FACES - defines the face to the document';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS"."DATE_OF_BIRTH_PARTIAL" IS 'Special Date Type for Date of Birth, day and month can be zero';
   COMMENT ON TABLE "DL_BLACKLIST"."TRAVEL_DOCS"  IS 'Travel documents';
  CREATE INDEX "DL_BLACKLIST"."RAVEL_DOCS$IX10" ON "DL_BLACKLIST"."TRAVEL_DOCS" ("DOC_CLASS") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX00" ON "DL_BLACKLIST"."TRAVEL_DOCS" ("OWNER") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX01" ON "DL_BLACKLIST"."TRAVEL_DOCS" ("ISSUING_COUNTRY") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX02" ON "DL_BLACKLIST"."TRAVEL_DOCS" ("NATIONALITY") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX03" ON "DL_BLACKLIST"."TRAVEL_DOCS" ("SEX") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX09" ON "DL_BLACKLIST"."TRAVEL_DOCS" ("IDENTITY") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX12" ON "DL_BLACKLIST"."TRAVEL_DOCS" ("FACE_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX90" ON "DL_BLACKLIST"."TRAVEL_DOCS" (LOWER(TRIM("SURNAME")), LOWER(TRIM("GIVEN_NAME")), "NATIONALITY", "IDENTITY") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX91" ON "DL_BLACKLIST"."TRAVEL_DOCS" (SOUNDEX(TRIM("SURNAME")), SOUNDEX(TRIM("GIVEN_NAME")), "NATIONALITY", "IDENTITY") 
  ;
CREATE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$IX95" ON "DL_BLACKLIST"."TRAVEL_DOCS" (LOWER(TRIM("DOC_NUMBER")), "ISSUING_COUNTRY", "IDENTITY") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$PK" ON "DL_BLACKLIST"."TRAVEL_DOCS" ("KEY_VALUE") 
  ;
  GRANT DELETE ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO PUBLIC;
  GRANT REFERENCES ON "DL_BLACKLIST"."TRAVEL_DOCS" TO PUBLIC;
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "APPSUP";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "TESTADM";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "TRAINEE";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "TRAINEE";
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS" TO "TRAINEE";
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
