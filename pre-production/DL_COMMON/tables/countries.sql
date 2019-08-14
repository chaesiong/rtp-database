CREATE TABLE "DL_COMMON"."COUNTRIES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ISO3166_A3" VARCHAR2(3 CHAR) NOT NULL ENABLE, 
	"ISO3166_A2" VARCHAR2(2 CHAR), 
	"ISO3166_NUM" VARCHAR2(3 CHAR), 
	"TL_DOMAIN" VARCHAR2(2 CHAR), 
	"PHONE_AREA_CODE" VARCHAR2(6 CHAR), 
	"ICAO_LOC_PART" VARCHAR2(2 CHAR), 
	"NATIONALITY" VARCHAR2(128 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"OFFICIAL_LANGUAGE" VARCHAR2(32 CHAR), 
	"CONTINENT" VARCHAR2(32 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX (CREATE INDEX "DL_COMMON"."COUNTRIES$IX90" ON "DL_COMMON"."COUNTRIES" ("KEY_VALUE", LOWER(TRIM("DISPLAY_VALUE"))) 
  )  ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$UQ00" UNIQUE ("ISO3166_A3")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$UQ02" UNIQUE ("ISO3166_NUM")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$UQ05" UNIQUE ("ICAO_LOC_PART")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$UQ06" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$CHK_DML_TYPE" CHECK (DML_TYPE in ('I' ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$CHK_ICAO_LOC_PART" CHECK (ICAO_LOC_PART = upper(ICAO_LOC_PART) and length(ICAO_LOC_PART) <= 2) ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$CHK_ISO3166_A3" CHECK (ISO3166_A3 = upper(ISO3166_A3) and length(ISO3166_A3) = 3) ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$CHK_ISO3166_NUM" CHECK (ISO3166_NUM is null or regexp_like(ISO3166_NUM ,'^[0-9]{3}$' ,'c')) ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$CHK_IS_ACTIVE" CHECK (IS_ACTIVE in ('Y','N')) ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$CHK_LOCALE" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$CHK_PHONE_AREA_CODE" CHECK (PHONE_AREA_CODE is null or REGEXP_LIKE(PHONE_AREA_CODE    ,'^(\+|00)\d{1,4}$' ,'c')) ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$CHK_TL_DOMAIN" CHECK (TL_DOMAIN is null or (length(TL_DOMAIN) >= 2 and TL_DOMAIN = lower(TL_DOMAIN))) ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$FK_OFFICIAL_LANGUAGE" FOREIGN KEY ("OFFICIAL_LANGUAGE")
	  REFERENCES "DL_COMMON"."LANGUAGES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$FK_OWNER" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES" ADD CONSTRAINT "COUNTRIES$FK_CONTINENT" FOREIGN KEY ("CONTINENT")
	  REFERENCES "DL_COMMON"."CONTINENTS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."DISPLAY_VALUE" IS 'Name of Country';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."ISO3166_A3" IS 'ISO 3166 ALPHA-3';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."ISO3166_A2" IS 'ISO 3166 ALPHA-2';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."ISO3166_NUM" IS 'ISO 3166 Numeric';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."TL_DOMAIN" IS 'Top level domain';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."PHONE_AREA_CODE" IS 'Phone Country Code e.g. +49 for Germany';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."ICAO_LOC_PART" IS 'ICAO_LOC_PART';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."NATIONALITY" IS 'Sex neutral title of the nationality e. g. German, French, Austrian, ...';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."OFFICIAL_LANGUAGE" IS 'Official Language of the country';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."CONTINENT" IS 'Continent of country';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES"."OWNER" IS 'Owner of the data';
   COMMENT ON TABLE "DL_COMMON"."COUNTRIES"  IS 'Table for Countries';
  CREATE INDEX "DL_COMMON"."COUNTRIES$IX00" ON "DL_COMMON"."COUNTRIES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."COUNTRIES$IX01" ON "DL_COMMON"."COUNTRIES" ("OFFICIAL_LANGUAGE") 
  ;
CREATE INDEX "DL_COMMON"."COUNTRIES$IX02" ON "DL_COMMON"."COUNTRIES" ("OWNER") 
  ;
CREATE INDEX "DL_COMMON"."COUNTRIES$IX90" ON "DL_COMMON"."COUNTRIES" ("KEY_VALUE", LOWER(TRIM("DISPLAY_VALUE"))) 
  ;
CREATE INDEX "DL_COMMON"."COUNTRIES$IX91" ON "DL_COMMON"."COUNTRIES" ("KEY_VALUE", SOUNDEX(TRIM("DISPLAY_VALUE"))) 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."COUNTRIES$UQ00" ON "DL_COMMON"."COUNTRIES" ("ISO3166_A3") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."COUNTRIES$UQ02" ON "DL_COMMON"."COUNTRIES" ("ISO3166_NUM") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."COUNTRIES$UQ05" ON "DL_COMMON"."COUNTRIES" ("ICAO_LOC_PART") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."COUNTRIES$UQ06" ON "DL_COMMON"."COUNTRIES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_COMMON"."COUNTRIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_COMMON"."COUNTRIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "SERVAPP";
  GRANT DELETE ON "DL_COMMON"."COUNTRIES" TO "PROSI";
  GRANT INSERT ON "DL_COMMON"."COUNTRIES" TO "PROSI";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "PROSI";
  GRANT UPDATE ON "DL_COMMON"."COUNTRIES" TO "PROSI";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."COUNTRIES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."COUNTRIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."COUNTRIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."COUNTRIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "TESTADM";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES" TO "TRAINEE";
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
