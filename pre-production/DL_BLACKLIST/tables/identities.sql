CREATE TABLE "DL_BLACKLIST"."IDENTITIES" 
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
	"OWNER" VARCHAR2(128 CHAR), 
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
	"DATE_OF_BIRTH_PARTIAL" "DL_BLACKLIST"."CT_PARTIAL_DATE" , 
	"CRD_BLIN_SEQ" NUMBER, 
	"CASE_NUMBER" VARCHAR2(100 CHAR), 
	"SEQNO" NUMBER
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$CK00" CHECK ( key_value = upper(key_value) ) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$CK03" CHECK ( dml_type IN (
            'I',
            'U'
        ) ) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_OWNER" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_COUNTRY_OF_BIRTH" FOREIGN KEY ("COUNTRY_OF_BIRTH")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_NATIONALITY" FOREIGN KEY ("NATIONALITY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_SEX" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_SALUTATION" FOREIGN KEY ("SALUTATION")
	  REFERENCES "DL_COMMON"."SALUTATIONS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_PROFESSION" FOREIGN KEY ("PROFESSION")
	  REFERENCES "DL_COMMON"."PROFESSIONS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."KEY_VALUE" IS 'Internal used primary key as free format';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."UNIQUE_VALUE" IS 'Natural unique key: Currently generated value by expression ""';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."SALUTATION" IS 'Salutation';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."SURNAME" IS 'Surname';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."MIDDLE_NAME" IS 'Middle name';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."GIVEN_NAME" IS 'Given name';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."SURNAME_THAI" IS 'Surname thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."MIDDLENAME_THAI" IS 'Middle name thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."GIVENNAME_THAI" IS 'Given name thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."DATE_OF_BIRTH" IS 'Date of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."PLACE_OF_BIRTH" IS 'Place of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."COUNTRY_OF_BIRTH" IS 'Country of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."NATIONALITY" IS 'Nationality';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."SEX" IS 'Sex';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."NOTICE" IS 'Any notice onto this identity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."PROFESSION" IS 'Profession';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."PHONE_NUMBER_0" IS 'First known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."PHONE_NUMBER_1" IS 'Second known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."PHONE_NUMBER_2" IS 'Third known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."BODY_HEIGHT" IS 'Height of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."BODY_WEIGHT" IS 'Weight of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."BODY_SHAPE" IS 'Shape of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."HAIR_COLOR" IS 'Color of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."HAIR_CHARACTERISTIC" IS 'Characteristic of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."FACE_SHAPE" IS 'Shape of the Face';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."EYE_COLOR" IS 'Color of the eye';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."SKIN" IS 'Skin';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."DOMINANT_CHARACTERISTIC" IS 'The identities dominant Characteristic';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."SPECIAL_CHARACTERISTIC" IS 'Any other special characteristic';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."OWNER" IS 'Owner of record, normally who hast it inserted';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."INS_AT" IS 'When was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."INS_BY" IS 'By whom was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."DML_AT" IS 'When was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."DML_BY" IS 'By whom was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."DATE_OF_BIRTH_PARTIAL" IS 'Special Date Type for Date of Birth, day and month can be zero';
   COMMENT ON TABLE "DL_BLACKLIST"."IDENTITIES"  IS 'Identities of a person';
  CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX00" ON "DL_BLACKLIST"."IDENTITIES" ("OWNER") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX01" ON "DL_BLACKLIST"."IDENTITIES" ("COUNTRY_OF_BIRTH") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX02" ON "DL_BLACKLIST"."IDENTITIES" ("NATIONALITY") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX03" ON "DL_BLACKLIST"."IDENTITIES" ("SEX") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX04" ON "DL_BLACKLIST"."IDENTITIES" ("SALUTATION") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX05" ON "DL_BLACKLIST"."IDENTITIES" ("PROFESSION") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX90" ON "DL_BLACKLIST"."IDENTITIES" (LOWER(TRIM("SURNAME")), LOWER(TRIM("SURNAME_THAI")), LOWER(TRIM("MIDDLE_NAME")), LOWER(TRIM("MIDDLENAME_THAI")), LOWER(TRIM("GIVEN_NAME")), LOWER(TRIM("GIVENNAME_THAI")), "NATIONALITY", "KEY_VALUE") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX91" ON "DL_BLACKLIST"."IDENTITIES" (SOUNDEX(TRIM("SURNAME")), SOUNDEX(TRIM("SURNAME_THAI")), SOUNDEX(TRIM("MIDDLE_NAME")), SOUNDEX(TRIM("MIDDLENAME_THAI")), SOUNDEX(TRIM("GIVEN_NAME")), SOUNDEX(TRIM("GIVENNAME_THAI")), "NATIONALITY", "KEY_VALUE") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX92" ON "DL_BLACKLIST"."IDENTITIES" ("DML_AT", "KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."IDENTITIES$PK" ON "DL_BLACKLIST"."IDENTITIES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."IDENTITIES$UQ00" ON "DL_BLACKLIST"."IDENTITIES" ("UNIQUE_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000312621C00040$$" ON "DL_BLACKLIST"."IDENTITIES" (
  ;
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO PUBLIC;
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES" TO PUBLIC;
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "APPSUP";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "TESTADM";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES" TO "TRAINEE";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "TRAINEE";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES" TO "TRAINEE";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."IDENTITIES$TIUD0" 
    FOR INSERT OR UPDATE OR DELETE ON dl_blacklist.identities
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
            :new.ins_by   := dl_common.pkg_session.get_audit_user();
            :new.ins_at   := systimestamp;
            :new.dml_by   := dl_common.pkg_session.get_audit_user();
            :new.dml_at   := systimestamp;
            :new.dml_type := v_dml_type;
            --
        ELSIF (v_dml_type = 'U') THEN
            --
            --   :new.ins_by := :old.ins_by;
            --      :new.ins_at := :old.ins_at;
            :new.dml_by := dl_common.pkg_session.get_audit_user();
            :new.dml_at := systimestamp;
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
                ,date_of_birth_partial
                ,place_of_birth
                ,country_of_birth
                ,nationality
                ,sex
                ,notice
                ,profession
                ,phone_number_0
                ,phone_number_1
                ,phone_number_2
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
                ,ins_at
                ,ins_by
                ,dml_at
                ,dml_by
                ,dml_type
                ,owner
                ,crd_flag
                ,crd_result_flag
                ,crd_updated_datetime
                ,crd_result_xml
                ,crd_blin_seq
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
                ,:old.date_of_birth_partial
                ,:old.place_of_birth
                ,:old.country_of_birth
                ,:old.nationality
                ,:old.sex
                ,:old.notice
                ,:old.profession
                ,:old.phone_number_0
                ,:old.phone_number_1
                ,:old.phone_number_2
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
                ,:old.ins_at
                ,:old.ins_by
                ,:old.dml_at
                ,:old.dml_by
                ,:old.dml_type
                ,:old.owner
                ,:old.crd_flag
                ,:old.crd_result_flag
                ,:old.crd_updated_datetime
                ,:old.crd_result_xml
                ,:old.crd_blin_seq
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

                ,place_of_birth
                ,country_of_birth
                ,nationality
                ,sex
                ,notice
                ,profession
                ,phone_number_0
                ,phone_number_1
                ,phone_number_2
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
                ,ins_at
                ,ins_by
                ,dml_at
                ,dml_by
                ,dml_type
                ,owner
                ,date_of_birth_partial
                ,crd_flag
                ,crd_result_flag
                ,crd_updated_datetime
                ,crd_result_xml
                ,crd_blin_seq
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
                ,:old.place_of_birth
                ,:old.country_of_birth
                ,:old.nationality
                ,:old.sex
                ,:old.notice
                ,:old.profession
                ,:old.phone_number_0
                ,:old.phone_number_1
                ,:old.phone_number_2
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
                ,:old.ins_at
                ,:old.ins_by
                ,:old.dml_at
                ,:old.dml_by
                ,:old.dml_type
                ,:old.owner
                ,:old.date_of_birth_partial
                ,:old.crd_flag
                ,:old.crd_result_flag
                ,:old.crd_updated_datetime
                ,:old.crd_result_xml
                ,:old.crd_blin_seq
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
ALTER TRIGGER "DL_BLACKLIST"."IDENTITIES$TIUD0" ENABLE;
