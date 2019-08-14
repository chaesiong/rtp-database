CREATE TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"PERSON" VARCHAR2(32 CHAR), 
	"RELATION" VARCHAR2(32 CHAR), 
	"NATIONALITY" VARCHAR2(32 CHAR), 
	"RECEIPT" VARCHAR2(32 CHAR), 
	"TM6_NO" VARCHAR2(50 CHAR), 
	"FIRST_NAME" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"LAST_NAME" VARCHAR2(100 CHAR), 
	"SEX" VARCHAR2(20 CHAR), 
	"DATE_OF_BIRTH" DATE, 
	"PLACE_OF_BIRTH" VARCHAR2(100 CHAR), 
	"REASON" VARCHAR2(2500 CHAR), 
	"APPROVAL_STATUS" CHAR(1 CHAR), 
	"IMAGE" BLOB, 
	"DML_AT" TIMESTAMP (6), 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"MVMNTID" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER" ADD CONSTRAINT "FELLOW_PASSENGER$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER" ADD CONSTRAINT "FELLOW_PASSENGER$CHK$C00" CHECK (key_value = UPPER(key_value) AND LENGTH(key_value) >= 3) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER" ADD CONSTRAINT "FELLOW_PASSENGER$CHK$C01" CHECK (dml_type IN ('I', 'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER" ADD CONSTRAINT "FELLOW_PASSENGER$FK01" FOREIGN KEY ("PERSON")
	  REFERENCES "DL_BORDERCONTROL"."PERSON" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER" ADD CONSTRAINT "FELLOW_PASSENGER$FK02" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER" ADD CONSTRAINT "FELLOW_PASSENGER$FK03" FOREIGN KEY ("RELATION")
	  REFERENCES "DL_COMMON"."RELATIONS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER" ADD CONSTRAINT "FELLOW_PASSENGER$FK04" FOREIGN KEY ("NATIONALITY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."PERSON" IS 'FK DL_BORDERCONTROL.PERSON';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."RELATION" IS 'FK DL_COMMON.RELATIONS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."NATIONALITY" IS 'FK DL_COMMON.ICAO_DOC_CODES';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."RECEIPT" IS 'FK Receipt / Fee Table';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."TM6_NO" IS 'Number of TM6 card';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."FIRST_NAME" IS 'Column for first name';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."MIDDLE_NAME" IS 'Column for middle name';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."LAST_NAME" IS 'Column for lastname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."SEX" IS 'FK DL_COMMON.HUMAN_SEXES';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."DATE_OF_BIRTH" IS 'Column for date of birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."PLACE_OF_BIRTH" IS 'Column for place of birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."REASON" IS 'Column for reason of travel';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."APPROVAL_STATUS" IS 'A = Approved, N = Not Approved, R = End of Permit, C = Canceled';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."IMAGE" IS 'Image of the Passenger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FELLOW_PASSENGER"."MVMNTID" IS 'FK DL_BORDERCONTROL.MOVEMENTS';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FELLOW_PASSENGER"  IS 'Used in BmBS, VOA, Re-Entry';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."FELLOW_PASSENGER$PK" ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312103C00015$$" ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" (
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "APPSUP";
  GRANT INSERT ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FELLOW_PASSENGER" TO "PIBICSAPP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."FELLOW_PASSENGER$TIUD0" 
FOR INSERT OR UPDATE OR DELETE ON dl_bordercontrol.fellow_passenger
COMPOUND TRIGGER
  --
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * CHageman  19.03.2018  Added
  * CFunke    19.03.2018  Add Procedure L_Check_FK_Content
  *******************************************************************************/
  --
  --
  l_dml_type CHAR(1); -- sets the actual transaction type (I.nsert, U.pdate, D.elete)
  --
  --
  /**
   * Checks the Trigger Transaction method to get the transaction type
   * Sets the global trigger variable "l_dml_type"
   *
   * Raises an error if no type can be extracted
   */
  PROCEDURE l_set_dml_type
  IS
  BEGIN

    IF (INSERTING())
    THEN
      l_dml_type := 'I';
    ELSIF (UPDATING())
    THEN
      l_dml_type := 'U';
    ELSIF (DELETING())
    THEN
      l_dml_type := 'D';
    ELSE
      RAISE_APPLICATION_ERROR(-20000,'Could not determine a value for l_dml_type!');
    END IF;
  END l_set_dml_type;
  --
  --
  /**
   * Checks if the primary key value of the table has changed
   *
   * @return BOOLEAN: True = value has changed, False = value has not changed
   */
  FUNCTION l_has_pk_value_changed
  RETURN BOOLEAN
  IS
  BEGIN
    --
    IF (:NEW.key_value != :OLD.key_value)
    THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END l_has_pk_value_changed;
  --
  --
  PROCEDURE L_Check_FK_Content(n_MVMNTID  in FELLOW_PASSENGER.MVMNTID%type
                              ,n_PERSON   in FELLOW_PASSENGER.PERSON%type
                              --
                              ) is
  BEGIN
    if n_MVMNTID is null and n_PERSON is null
    then
        Raise_application_error(-20000
                                 ,'Both, MVMNTID and PERSON, can not be null. At least one column should have a value.');
    end if;
  END L_Check_FK_Content;
  /**
   * Checks if the foreign key value of the table is valid and can be found in the parent table
   * Raises errors if the value cannot be found
   */
  /*PROCEDURE l_check_fk_content (p_key_value             IN person.key_value%TYPE
                               ,o_adm_class_province    IN person.adm_class_province%TYPE
                               ,n_adm_class_province    IN person.adm_class_province%TYPE
                               ,o_adm_class_district    IN person.adm_class_district%TYPE
                               ,n_adm_class_district    IN person.adm_class_district%TYPE
                               ,o_adm_class_subdistrict IN person.adm_class_subdistrict%TYPE
                               ,n_adm_class_subdistrict IN person.adm_class_subdistrict%TYPE
                               ,o_carrier               IN person.carrier%TYPE
                               ,n_carrier               IN person.carrier%TYPE
                               ,o_relation              IN person.relation%TYPE
                               ,n_relation              IN person.relation%TYPE
                               ,o_sex                   IN person.sex%TYPE
                               ,n_sex                   IN person.sex%TYPE
                               ,o_birth_country         IN person.birth_country%TYPE
                               ,n_birth_country         IN person.birth_country%TYPE
                               ,o_nationality           IN person.nationality%TYPE
                               ,n_nationality           IN person.nationality%TYPE
                               --
                               )
  IS
    --
    l_check VARCHAR2(1 CHAR);
    --
  BEGIN
    --
    -- Check FK if the column has changed
    IF (n_adm_class_province IS NOT NULL AND NOT dl_common.pkg_util.is_equal(n_adm_class_province, o_adm_class_province))
    THEN

      BEGIN

        SELECT 1
          INTO l_check
          FROM adm_class_province
         WHERE key_value = n_adm_class_province;

        IF (l_check != 'Y')
        THEN
          RAISE_APPLICATION_ERROR(-20000,'The "adm_class_province"[''' || n_adm_class_province || '''] is not active! For KEY_VALUE[''' || p_key_value || '''], DML_TYPE[''' || l_dml_type || '''].');
        END IF;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          RAISE_APPLICATION_ERROR(-20000,'The "adm_class_province"[''' || n_adm_class_province || '''] does not exist! For KEY_VALUE[''' || p_key_value || '''], DML_TYPE[''' || l_dml_type || '''].');
      END;
    END IF;
    --
  END l_check_fk_content;*/

  /** ======================================================
   * BEFORE STATEMENT EVENT
   *
   * Extract the dml-type variable
   * =======================================================
   */
  BEFORE STATEMENT
  IS
  BEGIN
    --
    l_set_dml_type();
    --
  END BEFORE STATEMENT;
  --
  --
  /** ======================================================
   * BEFORE EACH ROW EVENT
   * =======================================================
   */
  BEFORE EACH ROW
  IS
  BEGIN
    --
    -- If transaction type is NULL, then call l_set_dml_type to extract it
    IF (l_dml_type IS NULL)
    THEN
      -- This case can occur for example on MERGE-Statements!
      l_set_dml_type();
    END IF;
    --
    -- If the >>>>INSERTING<<<< transaction is used
    IF (l_dml_type = 'I')
    THEN
      --
      -- set values to audit columns
      :NEW.dml_at   := SYSTIMESTAMP;
      :NEW.dml_by   := dl_common.pkg_session.get_audit_user();
      :NEW.dml_type := l_dml_type;
      --
      --
    -- If the >>>>UPDATING<<<< transaction is used
    ELSIF (l_dml_type = 'U')
    THEN
      --
      :NEW.dml_at := SYSTIMESTAMP;
      :NEW.dml_by := dl_common.pkg_session.get_audit_user();

      -- does the pk value has changed?
      IF (l_has_pk_value_changed())
      THEN
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :NEW.dml_type := 'I';
      ELSE
        :NEW.dml_type := l_dml_type;
      END IF;
      --

    -- If the >>>>DELETING<<<< transaction is used
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
  AFTER EACH ROW
  IS
  BEGIN
    --
    IF (l_dml_type IS NULL)
    THEN

      -- This case can occur for example on MERGE-Statements!
      l_set_dml_type();
    END IF;
    --
    -- If the >>>>INSERTING<<<< transaction is used
    IF (l_dml_type = 'I')
    THEN

      L_Check_FK_Content(:new.MVMNTID
                        ,:new.PERSON
                         --
                         );

    -- If the >>>>UPDATING<<<< transaction is used
    ELSIF (l_dml_type = 'U')
    THEN
      L_Check_FK_Content(:new.MVMNTID
                        ,:new.PERSON
                         --
                         );
      --
      /*
      INSERT INTO dl_bordercontrol.adm_class_district$HIS
        (key_value
        ,locale
        ,display_value
        ,display_order
        ,display_code
        ,is_active
        ,dml_at
        ,dml_by
        ,dml_type
        ,notice
        ,num_value
        ,row_flag_mask
        ,adm_class_province)
      VALUES
        (:OLD.key_value
        ,:OLD.locale
        ,:OLD.display_value
        ,:OLD.display_order
        ,:OLD.display_code
        ,:OLD.is_active
        ,:OLD.dml_at
        ,:OLD.dml_by
        ,:OLD.dml_type
        ,:OLD.notice
        ,:OLD.num_value
        ,:OLD.row_flag_mask
        ,:OLD.adm_class_province );
      --

      -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
      IF (l_has_pk_value_changed())
      THEN

        INSERT INTO dl_bordercontrol.adm_class_district$HIS
          (key_value
          ,dml_at
          ,dml_by
          ,dml_type)
        VALUES
          (:OLD.key_value
          ,SYSTIMESTAMP
          ,dl_common.pkg_session.get_audit_user()
          ,'D'
           --
           );
      END IF;
      --

    -- If the >>>>DELETING<<<< transaction is used
    ELSE
      -- 'D'
      INSERT INTO dl_bordercontrol.adm_class_district$HIS
        (key_value
        ,locale
        ,display_value
        ,display_order
        ,display_code
        ,is_active
        ,dml_at
        ,dml_by
        ,dml_type
        ,notice
        ,num_value
        ,row_flag_mask
        ,adm_class_province)
      VALUES
        (:OLD.key_value
        ,:OLD.locale
        ,:OLD.display_value
        ,:OLD.display_order
        ,:OLD.display_code
        ,:OLD.is_active
        ,SYSTIMESTAMP
        ,dl_common.pkg_session.get_audit_user()
        ,'D'
        ,:OLD.notice
        ,:OLD.num_value
        ,:OLD.row_flag_mask
        ,:OLD.adm_class_province );
      --
      --
      */
    END IF;
    --
  END AFTER EACH ROW;
  --
  --
  AFTER STATEMENT
  IS
  BEGIN
    --
    l_dml_type := NULL;
    --
  END AFTER STATEMENT;
  --
END fellow_passenger$tiud0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."FELLOW_PASSENGER$TIUD0" ENABLE;
