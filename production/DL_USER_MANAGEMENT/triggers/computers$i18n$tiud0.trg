CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."COMPUTERS$I18N$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.COMPUTERS$I18N
  compound trigger
--
  --
  /*******************************************************************************
  *
  *
  *                                                                              *
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
    if (:new.ID != :old.ID or :new.LOCALE != :old.LOCALE)
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
  procedure L_Check_FK_Content(p_ID     in COMPUTERS$I18N.ID%type
                              ,p_LOCALE in COMPUTERS$I18N.LOCALE%type
                               --,o_OWNER     in COMPUTERS$I18N.OWNER%type
                               --,n_OWNER     in COMPUTERS$I18N.OWNER%type
                               -- LOOP-FK-Column-n:
                               --,o_"[fk-columnname-n]" in COMPUTERS$I18N."[fk-columnname-n]"%type
                               --,n_"[fk-columnname-n]" in COMPUTERS$I18N."[fk-columnname-n]"%type
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
    null;
    /*
    if (n_OWNER is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_OWNER
                                                               ,o_OWNER))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.OWNERS t
         where t.KEY_VALUE = n_OWNER;
        if (v_vc_Tmp != "?")
        then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] is not active! For ID[''' || p_ID || ''']/LOCALE[''' || p_LOCALE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] does not exist! For ID[''' || p_ID || ''']/LOCALE[''' || p_LOCALE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    */
    -- LOOP-FK-Column-n:
    ----
    ----
    --if (n_"[fk-columnname-n]" is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_"[fk-columnname-n]"
    --                                                                          ,o_"[fk-columnname-n]"))
    --then
    --  begin
    --    select t.IS_ACTIVE
    --      into v_vc_Tmp
    --      from "[fk-schemaname-n]"."[fk-objectname-n]" t
    --     where t.KEY_VALUE = n_"[fk-columnname-n]";
    --    if (v_vc_Tmp != 'Y')
    --    then
    --      Raise_application_error(-20000
    --                             , 'The "[fk-columnname-n]"[''' || n_"[fk-columnname-n]" || '''] is not active! For ID[''' || p_ID || ''']/LOCALE[''' || p_LOCALE || ''']'
    --                              --
    --                               || ', DML_TYPE[''' || v_DML_TYPE || '''].');
    --    end if;
    --  exception
    --    when NO_DATA_FOUND then
    --      Raise_application_error(-20000
    --                             , 'The "[fk-columnname-n]"[''' || n_"[fk-columnname-n]" || '''] does not exist! For ID[''' || p_ID || ''']/LOCALE[''' || p_LOCALE || ''']'
    --                              --
    --                               || ', DML_TYPE[''' || v_DML_TYPE || '''].');
    --  end;
    --end if;
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
                               , 'The row is not updatable! For ID[''' || :old.ID || ''']/LOCALE[''' || :old.LOCALE || ''']'
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
                               , 'The row is not deletable! For ID[''' || :old.ID || ''']/LOCALE[''' || :old.LOCALE || ''']'
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
                        ,:new.LOCALE
                         --,null
                         --,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,null
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                        ,:new.LOCALE
                         --,:old.OWNER
                         --,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,:old."[fk-columnname-n]"
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
      insert into COMPUTERS$I18N$HIS
      values
        (:old.ID
        ,:old.NAME
        ,:old.DESCRIPTION
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into COMPUTERS$I18N$HIS
          (ID
          ,LOCALE
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.ID
          ,:old.LOCALE
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
      insert into COMPUTERS$I18N$HIS
      values
        (:old.ID
        ,:old.NAME
        ,:old.DESCRIPTION
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      insert into COMPUTERS$I18N$HIS
        (ID
        ,LOCALE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.ID
        ,:old.LOCALE
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
end COMPUTERS$I18N$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."COMPUTERS$I18N$TIUD0" ENABLE;
