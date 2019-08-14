CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."FLIGHTS$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.FLIGHTS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    01.02.2018  Added
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
    if (:new.FLGHTID != :old.FLGHTID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_FLGHTID         in FLIGHTS.FLGHTID%type
                              ,o_ORIGINAIRPORTID in FLIGHTS.ORIGINAIRPORTID%type
                              ,n_ORIGINAIRPORTID in FLIGHTS.ORIGINAIRPORTID%type
                              ,o_DESTINAIRPORTID in FLIGHTS.DESTINAIRPORTID%type
                              ,n_DESTINAIRPORTID in FLIGHTS.DESTINAIRPORTID%type
                              ,o_PAIREDFLGHTID   in FLIGHTS.PAIREDFLGHTID%type
                              ,n_PAIREDFLGHTID   in FLIGHTS.PAIREDFLGHTID%type
                              ,o_AGENTID         in FLIGHTS.AGENTID%type
                              ,n_AGENTID         in FLIGHTS.AGENTID%type
                              ,o_INS_TERMINAL    in FLIGHTS.INS_TERMINAL%type
                              ,n_INS_TERMINAL    in FLIGHTS.INS_TERMINAL%type
                              ,o_INS_BORDERPOST  in FLIGHTS.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST  in FLIGHTS.INS_BORDERPOST%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_ORIGINAIRPORTID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_ORIGINAIRPORTID
                                                                         ,o_ORIGINAIRPORTID))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.PORTS t
         where t.NUM_VALUE = n_ORIGINAIRPORTID;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The ORIGINAIRPORTID[''' || n_ORIGINAIRPORTID || '''] is not active! For p_FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The ORIGINAIRPORTID[''' || n_ORIGINAIRPORTID || '''] does not exist! For p_FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_DESTINAIRPORTID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_DESTINAIRPORTID
                                                                         ,o_DESTINAIRPORTID))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.PORTS t
         where t.NUM_VALUE = n_DESTINAIRPORTID;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The DESTINAIRPORTID[''' || n_DESTINAIRPORTID || '''] is not active! For p_FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The DESTINAIRPORTID[''' || n_DESTINAIRPORTID || '''] does not exist! For p_FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    /*
    if (n_PAIREDFLGHTID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_PAIREDFLGHTID
                                                                       ,o_PAIREDFLGHTID))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_BORDERCONTROL.FLIGHTS t
         where t.FLGHTID = n_PAIREDFLGHTID;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The PAIREDFLGHTID[''' || n_PAIREDFLGHTID || '''] is not active! For p_FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The PAIREDFLGHTID[''' || n_PAIREDFLGHTID || '''] does not exist! For p_FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    */
    --
    --
    if (n_AGENTID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_AGENTID
                                                                 ,o_AGENTID))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.CARRIERS t
         where t.NUM_VALUE = n_AGENTID;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The AGENTID[''' || n_AGENTID || '''] is not active! For p_FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The AGENTID[''' || n_AGENTID || '''] does not exist! For p_FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_INS_TERMINAL is not null
       --
       and n_INS_BORDERPOST is not null
       --
       and (not DL_COMMON.PKG_UTIL.Is_Equal(n_INS_TERMINAL
                                            ,o_INS_TERMINAL)
       --
       or not DL_COMMON.PKG_UTIL.Is_Equal(n_INS_BORDERPOST
                                               ,o_INS_BORDERPOST))
       --
       )
    then
      begin
        if (n_INS_BORDERPOST != DL_BORDERCONTROL.PKG_COMMON.Get_Borderpost4TERM_ID(n_INS_TERMINAL))
        then
          Raise_application_error(-20000
                                 ,'The n_INS_TERMINAL[''' || n_INS_TERMINAL || '''] does not belong to n_INS_BORDERPOST[''' || n_INS_BORDERPOST || ''']!');
        end if;
      exception
        when others then
          Raise_application_error(-20000
                                 ,'Check borderpost and belonging terminal for FLGHTID[''' || p_FLGHTID || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
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
      if (:new.ACTIVE is null)
      then
        :new.ACTIVE := 1;
      end if;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      :new.INS_AT := :old.INS_AT;
      :new.INS_BY := :old.INS_BY;
      :new.DML_AT := systimestamp;
      :new.DML_BY := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      /*
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :new.DML_TYPE := 'I';
      else
        :new.DML_TYPE := v_DML_TYPE;
      end if;
      */
      :new.DML_TYPE := v_DML_TYPE;
      --
    else
      -- 'D'
      null;
      --
    end if;
    --
    if (v_DML_TYPE in ('I'
                      ,'U')
       --
       and :new.INS_BORDERPOST is null and :new.INS_TERMINAL is not null)
    then
      --
      :new.INS_BORDERPOST := DL_BORDERCONTROL.PKG_COMMON.Get_Borderpost4TERM_ID(:new.INS_TERMINAL);
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
      L_Check_FK_Content(:new.FLGHTID
                        ,null
                        ,:new.ORIGINAIRPORTID
                        ,null
                        ,:new.DESTINAIRPORTID
                        ,null
                        ,:new.PAIREDFLGHTID
                        ,null
                        ,:new.AGENTID
                        ,null
                        ,:new.INS_TERMINAL
                        ,null
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.FLGHTID
                        ,:old.ORIGINAIRPORTID
                        ,:new.ORIGINAIRPORTID
                        ,:old.DESTINAIRPORTID
                        ,:new.DESTINAIRPORTID
                        ,:old.PAIREDFLGHTID
                        ,:new.PAIREDFLGHTID
                        ,:old.AGENTID
                        ,:new.AGENTID
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into FLIGHTS$HIS
      values
        (:old.KEY_VALUE
        ,:old.BORDER_POST
        ,:old.TERMINAL_TYPE
        ,:old.TERMINAL_NAME
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.IP_ADDRESS
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into FLIGHTS$HIS
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
      */
      --
    else
      -- 'D'
      null;
      /*
      insert into FLIGHTS$HIS
      values
        (:old.KEY_VALUE
        ,:old.BORDER_POST
        ,:old.TERMINAL_TYPE
        ,:old.TERMINAL_NAME
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.IP_ADDRESS
         --
         );
      --
      insert into FLIGHTS$HIS
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
      */
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
end FLIGHTS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."FLIGHTS$TIUD0" ENABLE;
