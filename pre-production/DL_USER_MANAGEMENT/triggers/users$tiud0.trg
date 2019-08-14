CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."USERS$TIUD0" 
  for insert or update or delete ON DL_USER_MANAGEMENT.USERS 
compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    13.03.2018  Added
  * WWirns    25.07.2018  Prevent changes on the main administrator
  * WWirns    25.07.2018  Add INS_*-Columns for make history rows
  * WWirns    08.08.2018  Add procedure L_Check_Row4DML
  * WWirns    27.08.2018  Add loosing INS_AT and INS_BY at code point "L_Has_PK_Value_Changed"
  * MStahl    24.09.2018  Added phone number
  * MSCS      24.07.2019  Added pw_expire, national_id, first_name_thai, last_name_thai, dob, rank,
  *                       department_level_1, department_level_2, department_level_2, position
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
    if (:new.ID != :old.ID or :new.USERNAME != :old.USERNAME)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_ID in USERS.ID%type
                               --,o_"[columnname-n]" in USERS."[columnname-n]"%type
                               --,n_"[columnname-n]" in USERS."[columnname-n]"%type
                               --
                               ) is
    --
    --v_vc_Tmp varchar2(1 char);
    --v_n_Tmp  number(1);
    --
  begin
    --
    --
    /*
    if (n_"[columnname-n]" is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_"[columnname-n]"
                                                                           ,o_"[columnname-n]"))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from "XX.XX" t
         where t.KEY_VALUE = n_"[columnname-n]";
        if (v_vc_Tmp != "?")
        then
          Raise_application_error(-20000
                                 ,'The "[columnname-n]"[''' || n_"[columnname-n]" || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The "[columnname-n]"[''' || n_"[columnname-n]" || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    */
    null;
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
      --
      if (L_Has_PK_Value_Changed())
      then
        if ('UM_ADMIN' in (upper(:new.ID)
                          ,upper(:new.USERNAME)))
        then
          Raise_application_error(-20000
                                 ,'The main administration user with the ID[''' || :old.ID || ''']/USERNAME[''' || :old.USERNAME || '''] cannot be updated!');
        end if;
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
      if ('UM_ADMIN' in (upper(:new.ID)
                        ,upper(:new.USERNAME)) and :new.STATE != 1)
      then
        Raise_application_error(-20000
                               ,'The main administration user with the ID[''' || :new.ID || ''']/USERNAME[''' || :new.USERNAME || '''] must have STATE[1] and not [' || trim(:new.STATE) || ']!');
      end if;
      --
      L_Check_FK_Content(:new.ID
                         --,null
                         --,:new."[columnname-n]"
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      if ('UM_ADMIN' in (upper(:new.ID)
                        ,upper(:new.USERNAME)) and :new.STATE != 1)
      then
        Raise_application_error(-20000
                               ,'The main administration user with the ID[''' || :new.ID || ''']/USERNAME[''' || :new.USERNAME || '''] must have STATE[1] and not [' || trim(:new.STATE) || ']!');
      end if;
      --
      L_Check_FK_Content(:new.ID
                         --,:old."[columnname-n]"
                         --,:new."[columnname-n]"
                         --
                         );
      --
      insert into USERS$HIS
        (id
        ,username
        ,first_name
        ,last_name
        ,mail_address
        ,phone_number
        ,state
        ,pw_hash
        ,pw_salt
        ,pw_iteration_count
        ,pw_expiration_date
        ,pw_must_be_changed
        ,locale
        ,ins_at
        ,ins_by
        ,dml_at
        ,dml_by
        ,dml_type
        ,row_flag_mask
        ,tag
        ,pw_expire
        ,national_id
        ,first_name_thai
        ,last_name_thai
        ,dob
        ,rank
        ,department_level_1
        ,department_level_2
        ,department_level_3
        ,position
         --
         )
      values
        (:old.ID
        ,:old.USERNAME
        ,:old.FIRST_NAME
        ,:old.LAST_NAME
        ,:old.MAIL_ADDRESS
        ,:old.PHONE_NUMBER
        ,:old.STATE
        ,:old.PW_HASH
        ,:old.PW_SALT
        ,:old.PW_ITERATION_COUNT
        ,:old.PW_EXPIRATION_DATE
        ,:old.PW_MUST_BE_CHANGED
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
        ,:old.TAG
        ,:old.pw_expire
        ,:old.national_id
        ,:old.first_name_thai
        ,:old.last_name_thai
        ,:old.dob
        ,:old.rank
        ,:old.department_level_1
        ,:old.department_level_2
        ,:old.department_level_3
        ,:old.position
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into USERS$HIS
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
      if ('UM_ADMIN' in (upper(:old.ID)
                        ,upper(:old.USERNAME)))
      then
        Raise_application_error(-20000
                               ,'The main administration user with the ID[''' || :old.ID || ''']/USERNAME[''' || :old.USERNAME || '''] cannot be deleted!');
      end if;
      --
      insert into USERS$HIS
        (id
        ,username
        ,first_name
        ,last_name
        ,mail_address
        ,phone_number
        ,state
        ,pw_hash
        ,pw_salt
        ,pw_iteration_count
        ,pw_expiration_date
        ,pw_must_be_changed
        ,locale
        ,ins_at
        ,ins_by
        ,dml_at
        ,dml_by
        ,dml_type
        ,row_flag_mask
        ,tag
        ,pw_expire
        ,national_id
        ,first_name_thai
        ,last_name_thai
        ,dob
        ,rank
        ,department_level_1
        ,department_level_2
        ,department_level_3
        ,position
         --
         )
      values
        (:old.ID
        ,:old.USERNAME
        ,:old.FIRST_NAME
        ,:old.LAST_NAME
        ,:old.MAIL_ADDRESS
        ,:old.PHONE_NUMBER
        ,:old.STATE
        ,:old.PW_HASH
        ,:old.PW_SALT
        ,:old.PW_ITERATION_COUNT
        ,:old.PW_EXPIRATION_DATE
        ,:old.PW_MUST_BE_CHANGED
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
        ,:old.TAG
        ,:old.pw_expire
        ,:old.national_id
        ,:old.first_name_thai
        ,:old.last_name_thai
        ,:old.dob
        ,:old.rank
        ,:old.department_level_1
        ,:old.department_level_2
        ,:old.department_level_3
        ,:old.position
         --
         );
      --
      insert into USERS$HIS
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
end USERS$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."USERS$TIUD0" ENABLE;
