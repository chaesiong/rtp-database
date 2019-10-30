CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."RESIDENCE$TIUD0" 
FOR INSERT OR UPDATE OR DELETE ON dl_bordercontrol.residence
COMPOUND TRIGGER
  --
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * CFunke    27.06.2018  Added
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
END residence$tiud0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."RESIDENCE$TIUD0" ENABLE;
