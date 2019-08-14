CREATE TABLE "DL_COMMON"."ICAO_DOC_CODES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"OFFICIAL_LANGUAGE" VARCHAR2(32 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODES" ADD CONSTRAINT "ICAO_DOC_CODES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX (CREATE INDEX "DL_COMMON"."ICAO_DOC_CODES$IX90" ON "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE", LOWER(TRIM("DISPLAY_VALUE"))) 
  )  ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODES" ADD CONSTRAINT "ICAO_DOC_CODES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODES" ADD CONSTRAINT "ICAO_DOC_CODES$CHK$C00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODES" ADD CONSTRAINT "ICAO_DOC_CODES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODES" ADD CONSTRAINT "ICAO_DOC_CODES$CHK$C04" CHECK (IS_ACTIVE in ('Y','N')) ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODES" ADD CONSTRAINT "ICAO_DOC_CODES$CHK$C07" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODES" ADD CONSTRAINT "ICAO_DOC_CODES$FK_OFFICIAL_LANGUAGE" FOREIGN KEY ("OFFICIAL_LANGUAGE")
	  REFERENCES "DL_COMMON"."LANGUAGES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."KEY_VALUE" IS 'ICAO-Code Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."DISPLAY_VALUE" IS 'Name of the Country';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."OFFICIAL_LANGUAGE" IS 'Official Language of country';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON TABLE "DL_COMMON"."ICAO_DOC_CODES"  IS 'ICAO-Codes used in travel documents for nationality, place of birth, issuing authority, ...';
  CREATE INDEX "DL_COMMON"."ICAO_DOC_CODES$IX00" ON "DL_COMMON"."ICAO_DOC_CODES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."ICAO_DOC_CODES$IX01" ON "DL_COMMON"."ICAO_DOC_CODES" ("OFFICIAL_LANGUAGE") 
  ;
CREATE INDEX "DL_COMMON"."ICAO_DOC_CODES$IX90" ON "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE", LOWER(TRIM("DISPLAY_VALUE"))) 
  ;
CREATE INDEX "DL_COMMON"."ICAO_DOC_CODES$IX91" ON "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE", SOUNDEX(TRIM("DISPLAY_VALUE"))) 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."ICAO_DOC_CODES$UQ00" ON "DL_COMMON"."ICAO_DOC_CODES" ("NUM_VALUE") 
  ;
  GRANT INSERT ON "DL_COMMON"."ICAO_DOC_CODES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_COMMON"."ICAO_DOC_CODES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."ICAO_DOC_CODES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODES" TO "APPSUP";
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
