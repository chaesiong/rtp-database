CREATE TABLE "DL_BLACKLIST"."IDENTITIES_O" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL sys_guid() NOT NULL ENABLE, 
	"UNIQUE_VALUE" VARCHAR2(32 CHAR) GENERATED ALWAYS AS ("KEY_VALUE"||'') VIRTUAL , 
	"SALUTATION" VARCHAR2(32 CHAR), 
	"SURNAME" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"GIVEN_NAME" VARCHAR2(100 CHAR), 
	"SURNAME_THAI" VARCHAR2(100 CHAR), 
	"MIDDLENAME_THAI" VARCHAR2(100 CHAR), 
	"GIVENNAME_THAI" VARCHAR2(100 CHAR), 
	"DATE_OF_BIRTH" DATE, 
	"PLACE_OF_BIRTH" VARCHAR2(150 CHAR), 
	"COUNTRY_OF_BIRTH" VARCHAR2(32 CHAR), 
	"NATIONALITY" VARCHAR2(32 CHAR), 
	"SEX" VARCHAR2(32 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"PROFESSION" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_0" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_1" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_2" VARCHAR2(32 CHAR), 
	"ADDRESS_0" VARCHAR2(500 CHAR), 
	"ADDRESS_1" VARCHAR2(500 CHAR), 
	"ADDRESS_2" VARCHAR2(500 CHAR), 
	"BODY_HEIGHT" NUMBER, 
	"BODY_WEIGHT" NUMBER, 
	"BODY_SHAPE" VARCHAR2(100 CHAR), 
	"HAIR_COLOR" VARCHAR2(100 CHAR), 
	"HAIR_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"FACE_SHAPE" VARCHAR2(100 CHAR), 
	"EYE_COLOR" VARCHAR2(100 CHAR), 
	"SKIN" VARCHAR2(100 CHAR), 
	"DOMINANT_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"SPECIAL_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"PHONETIC_SURNAME" VARCHAR2(100 CHAR), 
	"PHONETIC_MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"PHONETIC_GIVEN_NAME" VARCHAR2(100 CHAR), 
	"OWNER" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_SOURCE" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_0" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_1" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_2" VARCHAR2(128 CHAR), 
	"AUTHORITY" VARCHAR2(100 CHAR), 
	"BEHAVIOUR" VARCHAR2(100 CHAR), 
	"CASENUMBER" VARCHAR2(100 CHAR), 
	"LEVEL_CONFIDENTIALITY" VARCHAR2(100 CHAR), 
	"REASON" VARCHAR2(100 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"CRD_FLAG" VARCHAR2(1 CHAR), 
	"CRD_RESULT_FLAG" VARCHAR2(1 CHAR), 
	"CRD_UPDATED_DATETIME" DATE, 
	"CRD_RESULT_XML" CLOB, 
	"CRD_BLIN_SEQ" NUMBER
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$CK00_O" CHECK ( key_value = upper(key_value) ) DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$CK03_O" CHECK ( dml_type IN (
            'I',
            'U'
        ) ) DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$PK_O" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_OWNER_O" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_COUNTRY_OF_BIRTH_O" FOREIGN KEY ("COUNTRY_OF_BIRTH")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_NATIONALITY_O" FOREIGN KEY ("NATIONALITY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_SEX_O" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_SALUTATION_O" FOREIGN KEY ("SALUTATION")
	  REFERENCES "DL_COMMON"."SALUTATIONS" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_PROFESSION_O" FOREIGN KEY ("PROFESSION")
	  REFERENCES "DL_COMMON"."PROFESSIONS" ("KEY_VALUE") DISABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."KEY_VALUE" IS 'Internal used primary key as free format';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."UNIQUE_VALUE" IS 'Natural unique key: Currently generated value by expression ""';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SALUTATION" IS 'Salutation';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SURNAME" IS 'Surname';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."MIDDLE_NAME" IS 'Middle name';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."GIVEN_NAME" IS 'Given name';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SURNAME_THAI" IS 'Surname thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."MIDDLENAME_THAI" IS 'Middle name thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."GIVENNAME_THAI" IS 'Given name thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DATE_OF_BIRTH" IS 'Date of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PLACE_OF_BIRTH" IS 'Place of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."COUNTRY_OF_BIRTH" IS 'Country of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."NATIONALITY" IS 'Nationality';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SEX" IS 'Sex';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."NOTICE" IS 'Any notice onto this identity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PROFESSION" IS 'Profession';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONE_NUMBER_0" IS 'First known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONE_NUMBER_1" IS 'Second known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONE_NUMBER_2" IS 'Third known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."ADDRESS_0" IS 'First known complete address';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."ADDRESS_1" IS 'Second known complete address';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."ADDRESS_2" IS 'Third known complete address';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."BODY_HEIGHT" IS 'Height of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."BODY_WEIGHT" IS 'Weight of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."BODY_SHAPE" IS 'Shape of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."HAIR_COLOR" IS 'Color of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."HAIR_CHARACTERISTIC" IS 'Characteristic of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."FACE_SHAPE" IS 'Shape of the Face';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EYE_COLOR" IS 'Color of the eye';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SKIN" IS 'Skin';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DOMINANT_CHARACTERISTIC" IS 'The identities dominant Characteristic';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SPECIAL_CHARACTERISTIC" IS 'Any other special characteristic';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONETIC_SURNAME" IS 'Surname phonetically written';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONETIC_MIDDLE_NAME" IS 'Middle name phonetically written';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONETIC_GIVEN_NAME" IS 'Given name phonetically written';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."OWNER" IS 'Owner of record, normally who hast it inserted';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EXTENDED_DATA_SOURCE" IS 'The source of any linked data onto this entity, e. g. SCHEMA.TABLE';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EXTENDED_DATA_PK_0" IS 'The first primary key value into the source of any linked data onto this entity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EXTENDED_DATA_PK_1" IS 'The second primary key value into the source of any linked data onto this entity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EXTENDED_DATA_PK_2" IS 'The thirdt primary key value into the source of any linked data onto this entity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."AUTHORITY" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."BEHAVIOUR" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."CASENUMBER" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."LEVEL_CONFIDENTIALITY" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."REASON" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."INS_AT" IS 'When was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."INS_BY" IS 'By whom was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DML_AT" IS 'When was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DML_BY" IS 'By whom was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON TABLE "DL_BLACKLIST"."IDENTITIES_O"  IS 'Identities of a person';
  CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX00_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("OWNER") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX01_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("COUNTRY_OF_BIRTH") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX02_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("NATIONALITY") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX03_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("SEX") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX04_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("SALUTATION") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX05_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("PROFESSION") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX06_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("EXTENDED_DATA_PK_0", "EXTENDED_DATA_PK_1", "EXTENDED_DATA_PK_2", "EXTENDED_DATA_SOURCE") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX90_O" ON "DL_BLACKLIST"."IDENTITIES_O" (LOWER(TRIM("SURNAME")), LOWER(TRIM("SURNAME_THAI")), LOWER(TRIM("MIDDLE_NAME")), LOWER(TRIM("MIDDLENAME_THAI")), LOWER(TRIM("GIVEN_NAME")), LOWER(TRIM("GIVENNAME_THAI")), "SEX", "DATE_OF_BIRTH", "NATIONALITY", "KEY_VALUE") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX91_O" ON "DL_BLACKLIST"."IDENTITIES_O" (SOUNDEX(TRIM("SURNAME")), SOUNDEX(TRIM("SURNAME_THAI")), SOUNDEX(TRIM("MIDDLE_NAME")), SOUNDEX(TRIM("MIDDLENAME_THAI")), SOUNDEX(TRIM("GIVEN_NAME")), SOUNDEX(TRIM("GIVENNAME_THAI")), "SEX", "DATE_OF_BIRTH", "NATIONALITY", "KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."IDENTITIES$PK_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."IDENTITIES$UQ00_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("UNIQUE_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000312621C00055$$" ON "DL_BLACKLIST"."IDENTITIES_O" (
  ;
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES_O" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO PUBLIC;
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES_O" TO PUBLIC;
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES_O" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES_O" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "APPSUP";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES_O" TO "PIBICSAPP";
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
