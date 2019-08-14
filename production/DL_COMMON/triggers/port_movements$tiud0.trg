CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."PORT_MOVEMENTS$TIUD0" 
  for insert or update or delete on DL_COMMON.PORT_MOVEMENTS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    27.09.2017  Added
  * WWirns    22.02.2018  Add column IS_NEED_ENTRY_FORM
  * WWirns    23.02.2018  Add columns INS_AT and INS_BY
  * WWirns    27.02.2018  Add columns ICAO_DC_LIST4NO_ENTRY_FORM
  * WWirns    02.03.2018  Add columns MUST_APPROVE_ENTRY_FORM_NO
  *******************************************************************************/
  --
  --
  v_DML_TYPE char(1);
  --
  --
  procedure L_Set_DML_TYPE is
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
      Raise_application_error(-20000
                             ,'Could not determine a value for v_DML_TYPE!');
    end if;
  end L_Set_DML_TYPE;
  --
  --
  function L_Has_PK_Value_Changed return boolean is
  begin
    if (:new.KEY_VALUE != :old.KEY_VALUE)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_KEY_VALUE                  in PORT_MOVEMENTS.KEY_VALUE%type
                              ,o_ICAO_DC_LIST4NO_ENTRY_FORM in PORT_MOVEMENTS.ICAO_DC_LIST4NO_ENTRY_FORM%type
                              ,n_ICAO_DC_LIST4NO_ENTRY_FORM in PORT_MOVEMENTS.ICAO_DC_LIST4NO_ENTRY_FORM%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_ICAO_DC_LIST4NO_ENTRY_FORM is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_ICAO_DC_LIST4NO_ENTRY_FORM
                                                                                    ,o_ICAO_DC_LIST4NO_ENTRY_FORM))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.ICAO_DC_LISTS t
         where t.KEY_VALUE = n_ICAO_DC_LIST4NO_ENTRY_FORM;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The ICAO_DC_LIST4NO_ENTRY_FORM[''' || n_ICAO_DC_LIST4NO_ENTRY_FORM || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The ICAO_DC_LIST4NO_ENTRY_FORM[''' || n_ICAO_DC_LIST4NO_ENTRY_FORM || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
  end L_Check_FK_Content;
  --
  --
  before statement is
  begin
    --
    L_Set_DML_TYPE();
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
    if (v_DML_TYPE = 'I')
    then
      --
      :new.INS_AT   := sysdate;
      :new.INS_BY   := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      :new.DML_AT   := systimestamp;
      :new.DML_BY   := PKG_SESSION.Get_AUDIT_User();
      :new.DML_TYPE := v_DML_TYPE;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      :new.INS_AT := :old.INS_AT;
      :new.INS_BY := :old.INS_BY;
      :new.DML_AT := systimestamp;
      :new.DML_BY := PKG_SESSION.Get_AUDIT_User();
      if (L_Has_PK_Value_Changed())
      then
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
      L_Check_FK_Content(:new.KEY_VALUE
                        ,null
                        ,:new.ICAO_DC_LIST4NO_ENTRY_FORM
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.ICAO_DC_LIST4NO_ENTRY_FORM
                        ,:new.ICAO_DC_LIST4NO_ENTRY_FORM
                         --
                         );
      --
      insert into PORT_MOVEMENTS$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.IS_NEED_ENTRY_FORM
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.ICAO_DC_LIST4NO_ENTRY_FORM
        ,:old.MUST_APPROVE_ENTRY_FORM_NO
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        insert into PORT_MOVEMENTS$HIS
          (KEY_VALUE
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,systimestamp
          ,PKG_SESSION.Get_AUDIT_User()
          ,'D'
           --
           );
      end if;
      --
    else
      -- 'D'
      insert into PORT_MOVEMENTS$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.IS_NEED_ENTRY_FORM
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.ICAO_DC_LIST4NO_ENTRY_FORM
        ,:old.MUST_APPROVE_ENTRY_FORM_NO
         --
         );
      --
      insert into PORT_MOVEMENTS$HIS
        (KEY_VALUE
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
        ,systimestamp
        ,PKG_SESSION.Get_AUDIT_User()
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
end PORT_MOVEMENTS$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."PORT_MOVEMENTS$TIUD0" ENABLE;
