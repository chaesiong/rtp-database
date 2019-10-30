CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."RELATIONS$I18N$TIUD0" 
  for insert or update or delete on dl_common.relations$I18N
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * CHageman  08.03.2018  Added
  * WWirns    09.04.2018  Add column ROW_FLAG_MASK
  *******************************************************************************/
  --
  --
  l_dml_type char(1); -- sets the actual transaction type (I.nsert, U.pdate, D.elete)
  --
  --
  /**
  * Checks the Trigger Transaction method to get the transaction type
  * Sets the global trigger variable "l_dml_type"
  *
  * Raises an error if no type can be extracted
  */
  procedure l_set_dml_type is
  begin
    if (INSERTING())
    then
      l_dml_type := 'I';
    elsif (UPDATING())
    then
      l_dml_type := 'U';
    elsif (DELETING())
    then
      l_dml_type := 'D';
    else
      RAISE_APPLICATION_ERROR(-20000
                             ,'Could not determine a value for l_dml_type!');
    end if;
  end l_set_dml_type;
  --
  --
  /**
  * Checks if the primary key value of the table has changed
  *
  * @return BOOLEAN: True = value has changed, False = value has not changed
  */
  function l_has_pk_value_changed return boolean is
  begin
    --
    if (:NEW.key_value != :OLD.key_value or :NEW.locale != :OLD.locale)
    then
      return true;
    else
      return false;
    end if;
  end l_has_pk_value_changed;
  --
  --
  /** ======================================================
  * BEFORE STATEMENT EVENT
  *
  * Extract the dml-type variable
  * =======================================================
  */
  before statement is
  begin
    --
    l_set_dml_type();
    --
  end before statement;
  --
  --
  /** ======================================================
  * BEFORE EACH ROW EVENT
  * =======================================================
  */
  before each row is
  begin
    --
    -- If transaction type is NULL, then call l_set_dml_type to extract it
    if (l_dml_type is null)
    then
      -- This case can occur for example on MERGE-Statements!
      l_set_dml_type();
    end if;
    --
    -- If the >>>>INSERTING<<<< transaction is used
    if (l_dml_type = 'I')
    then
      --
      -- set values to audit columns
      :NEW.dml_at   := SYSTIMESTAMP;
      :NEW.dml_by   := dl_common.pkg_session.get_audit_user();
      :NEW.dml_type := l_dml_type;
      --
      --
      -- If the >>>>UPDATING<<<< transaction is used
    elsif (l_dml_type = 'U')
    then
      --
      :NEW.dml_at := SYSTIMESTAMP;
      :NEW.dml_by := dl_common.pkg_session.get_audit_user();
      -- does the pk value has changed?
      if (l_has_pk_value_changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :NEW.dml_type := 'I';
      else
        :NEW.dml_type := l_dml_type;
      end if;
      --
      -- If the >>>>DELETING<<<< transaction is used
    else
      -- 'D'
      null;
      --
    end if;
    --
  end before each row;
  --
  --
  /** ======================================================
  * AFTER EACH ROW EVENT
  * -- No historization for language table implemented yet
  * =======================================================
  */
  after each row is
  begin
    --
    --
    null;
    --
    if (l_dml_type is null)
    then
      -- This case can occur for example on MERGE-Statements!
      l_set_dml_type();
    end if;
    --
    -- If the >>>>INSERTING<<<< transaction is used
    if (l_dml_type = 'I')
    then
      null;
    elsif (l_dml_type = 'U')
    then
      --
      insert into relations$i18n$his
        (key_value
        ,locale
        ,display_value
        ,dml_at
        ,dml_by
        ,dml_type
        ,notice
        ,ROW_FLAG_MASK
         --
         )
      values
        (:OLD.key_value
        ,:OLD.locale
        ,:OLD.display_value
        ,:OLD.dml_at
        ,:OLD.dml_by
        ,:OLD.dml_type
        ,:OLD.notice
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
      if (l_has_pk_value_changed())
      then
        insert into relations$i18n$his
          (key_value
          ,locale
          ,dml_at
          ,dml_by
          ,dml_type)
        values
          (:OLD.key_value
          ,:OLD.locale
          ,SYSTIMESTAMP
          ,dl_common.pkg_session.get_audit_user()
          ,'D'
           --
           );
      end if;
      --
    else
      -- 'D'
      insert into relations$i18n$his
        (key_value
        ,locale
        ,display_value
        ,dml_at
        ,dml_by
        ,dml_type
        ,notice
        ,ROW_FLAG_MASK
         --
         )
      values
        (:OLD.key_value
        ,:OLD.locale
        ,:OLD.display_value
        ,SYSTIMESTAMP
        ,dl_common.pkg_session.get_audit_user()
        ,'D'
        ,:OLD.notice
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      --
    end if;
    --
  end after each row;
  --
  --
  /** ======================================================
  * AFTER STATEMENT
  * =======================================================
  */
  after statement is
  begin
    --
    l_dml_type := null;
    --
  end after statement;
  --
end relations$i18n$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."RELATIONS$I18N$TIUD0" ENABLE;
