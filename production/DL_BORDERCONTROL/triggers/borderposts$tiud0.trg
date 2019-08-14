CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."BORDERPOSTS$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.BORDERPOSTS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    11.10.2017  Added
  * WWirns    08.11.2017  Added checks for IS_ACTIVE of FK-Columns-Content
  * WWirns    02.01.2018  Add column DISPLAY_ORDER
  * WWirns    03.01.2018  L_Check_FK_Content changed
  * WWirns    20.03.2018  Improve assignments of v_DML_TYPE
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
    if (:new.KEY_VALUE != :old.KEY_VALUE
       --
       -- Begin:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
       or :new.NAME != :old.NAME
       -- End:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
       --
       )
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_KEY_VALUE         in BORDERPOSTS.KEY_VALUE%type
                              ,o_BORDER_TYPE       in BORDERPOSTS.BORDER_TYPE%type
                              ,n_BORDER_TYPE       in BORDERPOSTS.BORDER_TYPE%type
                              ,o_BORDER_TO_COUNTRY in BORDERPOSTS.BORDER_TO_COUNTRY%type
                              ,n_BORDER_TO_COUNTRY in BORDERPOSTS.BORDER_TO_COUNTRY%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_BORDER_TYPE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_BORDER_TYPE
                                                                     ,o_BORDER_TYPE))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.BORDER_TYPES t
         where t.KEY_VALUE = n_BORDER_TYPE;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The BORDER_TYPE[''' || n_BORDER_TYPE || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The BORDER_TYPE[''' || n_BORDER_TYPE || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
      --
      -- Temporarily disabled by MSCS for data fix. Should be enabled once done.
      /*
      begin
        select '#'
          into v_vc_Tmp
          from dual
         where exists (
                --
                select null
                  from DL_BORDERCONTROL.TERMINALS t0
                 inner join DL_COMMON.TRANS_MODES t2
                    on (t0.TRNSPRTMODEID = t2.NUM_VALUE)
                 where t0.BORDER_POST = p_KEY_VALUE
                   and nvl(n_BORDER_TYPE
                          ,t2.BORDER_TYPE) != nvl(t2.BORDER_TYPE
                                                 ,n_BORDER_TYPE)
                --
                );
        --
        Raise_application_error(-20000
                               ,'The BORDER_TYPE[''' || n_BORDER_TYPE || '''] does not match to existing TRNSPRTMODEID->BORDER_TYPE''s of belonging TERMINALS! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        --
      exception
        when NO_DATA_FOUND then
          null;
      end;
      */
      --
    end if;
    --
    --
    if (n_BORDER_TO_COUNTRY is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_BORDER_TO_COUNTRY
                                                                           ,o_BORDER_TO_COUNTRY))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.COUNTRIES t
         where t.KEY_VALUE = n_BORDER_TO_COUNTRY;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The BORDER_TO_COUNTRY[''' || n_BORDER_TO_COUNTRY || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The BORDER_TO_COUNTRY[''' || n_BORDER_TO_COUNTRY || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
  end L_Check_FK_Content;
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
    if (v_DML_TYPE = 'I')
    then
      --
      -- Begin:PK is a surrogate key
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
      L_Check_FK_Content(:new.KEY_VALUE
                        ,null
                        ,:new.BORDER_TYPE
                        ,null
                        ,:new.BORDER_TO_COUNTRY
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.BORDER_TYPE
                        ,:new.BORDER_TYPE
                        ,:old.BORDER_TO_COUNTRY
                        ,:new.BORDER_TO_COUNTRY
                         --
                         );
      --
      insert into BORDERPOSTS$HIS
      values
        (:old.KEY_VALUE
        ,:old.BORDER_TYPE
        ,:old.NAME
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.BORDER_TO_COUNTRY
        ,:old.LOCALE
        ,:old.DISPLAY_ORDER
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into BORDERPOSTS$HIS
          (KEY_VALUE
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,systimestamp
          ,DL_COMMON.PKG_SESSION.Get_AUDIT_User()
          ,'D'
           --
           );
      end if;
      --
    else
      -- 'D'
      insert into BORDERPOSTS$HIS
      values
        (:old.KEY_VALUE
        ,:old.BORDER_TYPE
        ,:old.NAME
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.BORDER_TO_COUNTRY
        ,:old.LOCALE
        ,:old.DISPLAY_ORDER
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into BORDERPOSTS$HIS
        (KEY_VALUE
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
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
end BORDERPOSTS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."BORDERPOSTS$TIUD0" ENABLE;
