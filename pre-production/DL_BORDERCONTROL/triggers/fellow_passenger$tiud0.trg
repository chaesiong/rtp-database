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
