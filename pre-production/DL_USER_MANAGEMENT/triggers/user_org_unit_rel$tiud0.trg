CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.USER_ORG_UNIT_REL
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    21.08.2018  Added
  * WWirns    27.08.2018  Add loosing INS_AT and INS_BY at code point "L_Has_PK_Value_Changed"
  *******************************************************************************/
  --
  --
  v_DML_TYPE char(1);
  --
  --
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
  function L_Has_PK_Value_Changed return boolean is
  begin
    --
    if (:new.ID != :old.ID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_ID          in USER_ORG_UNIT_REL.ID%type
                              ,o_USER_ID     in USER_ORG_UNIT_REL.USER_ID%type
                              ,n_USER_ID     in USER_ORG_UNIT_REL.USER_ID%type
                              ,o_ORG_UNIT_ID in USER_ORG_UNIT_REL.ORG_UNIT_ID%type
                              ,n_ORG_UNIT_ID in USER_ORG_UNIT_REL.ORG_UNIT_ID%type
                               --
                               ) is
    --
    --v_vc_Tmp varchar2(1 char);
    v_n_Tmp number(1);
    --
  begin
    --
    --
    if (n_USER_ID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_USER_ID
                                                                 ,o_USER_ID))
    then
      begin
        select t.STATE
          into v_n_Tmp
          from USERS t
         where t.ID = n_USER_ID;
        if (v_n_Tmp != 1)
        then
          Raise_application_error(-20000
                                 ,'The USER_ID[''' || n_USER_ID || '''] is not active! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The USER_ID[''' || n_USER_ID || '''] does not exist! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_ORG_UNIT_ID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_ORG_UNIT_ID
                                                                     ,o_ORG_UNIT_ID))
    then
      begin
        select nvl(t.IS_ACTIVE
                  ,0)
          into v_n_Tmp
          from ORG_UNITS t
         where t.ID = n_ORG_UNIT_ID;
        if (v_n_Tmp != 1)
        then
          Raise_application_error(-20000
                                 ,'The ORG_UNIT_ID[''' || n_ORG_UNIT_ID || '''] is not active! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The ORG_UNIT_ID[''' || n_ORG_UNIT_ID || '''] does not exist! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
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
                               ,'The row is not updatable! For ID[''' || :old.ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    else
      -- 'D'
      if (bitand(:old.ROW_FLAG_MASK
                ,32) = 32)
      then
        -- 32 => prevent delete
        Raise_application_error(-20000
                               ,'The row is not deletable! For ID[''' || :old.ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    end if;
    --
  end L_Check_Row4DML;
  --
  --
  before statement is
  begin
    --
    L_Set_DML_TYPE(true);
    --
  end before statement;
  --
  --
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
  end before each row;
  --
  --
  after each row is
  begin
    --
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    if (v_DML_TYPE = 'I')
    then
      --
      L_Check_FK_Content(:new.ID
                        ,null
                        ,:new.USER_ID
                        ,null
                        ,:new.ORG_UNIT_ID
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                        ,:old.USER_ID
                        ,:new.USER_ID
                        ,:old.ORG_UNIT_ID
                        ,:new.ORG_UNIT_ID
                         --
                         );
      --
      insert into USER_ORG_UNIT_REL$HIS
      values
        (:old.ID
        ,:old.USER_ID
        ,:old.USER_DN
        ,:old.ORG_UNIT_ID
        ,:old.ORG_UNIT_DN
         --,:old.LOCALE
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
        insert into USER_ORG_UNIT_REL$HIS
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
      insert into USER_ORG_UNIT_REL$HIS
      values
        (:old.ID
        ,:old.USER_ID
        ,:old.USER_DN
        ,:old.ORG_UNIT_ID
        ,:old.ORG_UNIT_DN
         --,:old.LOCALE
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
      insert into USER_ORG_UNIT_REL$HIS
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
  after statement is
  begin
    --
    v_DML_TYPE := null;
    --
  end after statement;
  --
end USER_ORG_UNIT_REL$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."USER_ORG_UNIT_REL$TIUD0" ENABLE;
