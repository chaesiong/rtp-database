CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."COMPUTERS$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.COMPUTERS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * WWirns    27.08.2018  Added as copy of template LOOKUP-1.2.4
  *******************************************************************************/
  --
  --
  v_DML_TYPE char(1);
  --
  --
  /**
  * Checks the Trigger Transaction method to get the transaction type
  * Sets the global trigger variable "l_dml_type"
  *
  * Raises an error if no type can be extracted
  */
  procedure L_Set_DML_TYPE(p_Prevent_EXCE in boolean default false) is
  begin
    if (INSERTING())
    then
      v_DML_TYPE := 'I';
    elsif (UPDATING())
    then
      v_DML_TYPE := 'U';
    elsif (DELETING())
    then
      v_DML_TYPE := 'D';
    else
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(-20000
                               ,'Could not determine a value for v_DML_TYPE!');
      end if;
    end if;
  end L_Set_DML_TYPE;
  --
  --
  /**
  * Checks if the primary key value of the table has changed
  *
  * @return BOOLEAN: True = value has changed, False = value has not changed
  */
  function L_Has_PK_Value_Changed return boolean is
  begin
    --
    if (:new.ID != :old.ID
       --
       -- LOOP-PK-Column-n: PK is a surrogate key and any natural PK exists also as a unique constraints/indexes!
       or :new.NAME != :old.NAME
       -- END LOOP-PK-Column-n:
       --
       )
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  --
  /**
  * Checks if the foreign key value of the table is valid and can be found in the parent table
  * Raises errors if the value cannot be found
  */
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_ID in COMPUTERS.ID%type
                               -- LOOP-PK-Column-n:
                               --,p_"[pk-columnname-n]" in COMPUTERS."[pk-columnname-n]"%type
                               -- END LOOP-PK-Column-n:
                               --,o_OWNER in COMPUTERS.OWNER%type
                               --,n_OWNER in COMPUTERS.OWNER%type
                               -- LOOP-FK-Column-n:
                               -- END LOOP-FK-Column-n:
                               --
                               ) is
    --
    --v_vc_Tmp varchar2(1 char);
    --v_n_Tmp  number(1);
    --
  begin
    --
    --
    -- LOOP-FK-Column-n:
    null;
    -- END LOOP-FK-Column-n:
    --
  end L_Check_FK_Content;
  --
  --
  procedure L_Check_Row4DML is
  begin
    --
    if (v_DML_TYPE = 'I')
    then
      --
      null;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      if (bitand(:old.ROW_FLAG_MASK
                ,16) = 16)
      then
        -- 16 => prevent update
        Raise_application_error(-20000
                               , 'The row is not updatable! For ID[''' || :old.ID || ''']'
                                -- LOOP-PK-Column-n:
                                ----
                                --|| '/"[pk-columnname-n]"[''' || :old."[pk-columnname-n]" || ''']'
                                -- END LOOP-PK-Column-n:
                                --
                                 || ', DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    else
      -- 'D'
      if (bitand(:old.ROW_FLAG_MASK
                ,32) = 32)
      then
        -- 32 => prevent delete
        Raise_application_error(-20000
                               , 'The row is not deletable! For ID[''' || :old.ID || ''']'
                                -- LOOP-PK-Column-n:
                                ----
                                --|| '/"[pk-columnname-n]"[''' || :old."[pk-columnname-n]" || ''']'
                                -- END LOOP-PK-Column-n:
                                --
                                 || ', DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    end if;
    --
  end L_Check_Row4DML;
  --
  -- BEGIN: NOT GENERATED AREA
  --

  --
  -- END: NOT GENERATED AREA
  --
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
    L_Set_DML_TYPE(true);
    --
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
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
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    L_Check_Row4DML();
    --
    if (v_DML_TYPE = 'I')
    then
      --
      -- Begin:PK is a surrogate key
      if (:new.ID is null)
      then
        --
        -- BEGIN: NOT GENERATED AREA
        --
        :new.ID := SYS_GUID();
        --
        -- END: NOT GENERATED AREA
        --
      end if;
      -- End:PK is a surrogate key
      --
      :new.INS_AT   := sysdate;
      :new.INS_BY   := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      :new.DML_AT   := systimestamp;
      :new.DML_BY   := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      :new.DML_TYPE := v_DML_TYPE;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      :new.INS_AT := :old.INS_AT;
      :new.INS_BY := :old.INS_BY;
      :new.DML_AT := systimestamp;
      :new.DML_BY := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :new.DML_TYPE := 'I';
      else
        :new.DML_TYPE := v_DML_TYPE;
      end if;
      --
    else
      -- 'D'
      null;
      --
    end if;
    --
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
    --
  end before each row;
  --
  --
  /** ======================================================
  * AFTER EACH ROW EVENT
  * =======================================================
  */
  after each row is
  begin
    --
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
    --
    if (v_DML_TYPE = 'I')
    then
      --
      L_Check_FK_Content(:new.ID
                         -- LOOP-PK-Column-n:
                         --,:new."[pk-columnname-n]"
                         -- END LOOP-PK-Column-n:
                         --,null
                         --,:new.OWNER
                         -- LOOP-FK-Column-n:
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                         -- LOOP-PK-Column-n:
                         --,:new."[pk-columnname-n]"
                         -- END LOOP-PK-Column-n:
                         --,:old.OWNER
                         --,:new.OWNER
                         -- LOOP-FK-Column-n:
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
      insert into COMPUTERS$HIS
      values
        (:old.ID
        ,:old.NAME
        ,:old.DESCRIPTION
        ,:old.DNS_NAME
        ,:old.SORT_ORDER
        ,:old.IS_ACTIVE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
        ,:old.TAG
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into COMPUTERS$HIS
          (ID
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.ID
          ,:old.INS_AT
          ,:old.INS_BY
          ,systimestamp
          ,DL_COMMON.PKG_SESSION.Get_AUDIT_User()
          ,'D'
           --
           );
      end if;
      --
    else
      -- 'D'
      insert into COMPUTERS$HIS
      values
        (:old.ID
        ,:old.NAME
        ,:old.DESCRIPTION
        ,:old.DNS_NAME
        ,:old.SORT_ORDER
        ,:old.IS_ACTIVE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
        ,:old.TAG
         --
         );
      --
      insert into COMPUTERS$HIS
        (ID
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.ID
        ,:old.INS_AT
        ,:old.INS_BY
        ,systimestamp
        ,DL_COMMON.PKG_SESSION.Get_AUDIT_User()
        ,'D'
         --
         );
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
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
    --
    v_DML_TYPE := null;
    --
  end after statement;
  --
end COMPUTERS$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."COMPUTERS$TIUD0" ENABLE;
