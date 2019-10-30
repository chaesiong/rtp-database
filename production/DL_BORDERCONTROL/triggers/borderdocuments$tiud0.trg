CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."BORDERDOCUMENTS$TIUD0" 
  for insert or update or delete ON DL_BORDERCONTROL.BORDERDOCUMENTS 
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
  * WWirns    10.11.2017  Added checks for IS_ACTIVE of FK-Columns-Content
  * WWirns    13.11.2017  Additional natural checks for references by NUM_VALUE
  * CFunke    22.11.2017  Added some columns
  * WWirns    03.01.2018  L_Check_FK_Content changed
  * WWirns    20.03.2018  Improve assignments of v_DML_TYPE
  * CHageman  01.06.2018  Changed behavior of doctype
  * CFunke    20.06.2018  Remove check on bc_doc_class
  * MSCS      19.07.2019  Modified L_Set_Calc_DOB to use DOB_PARTIAL column
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
    if (:new.BRDDOCID != :old.BRDDOCID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_BRDDOCID       in BORDERDOCUMENTS.BRDDOCID%type
                              ,o_DOCCLASS       in borderdocuments.docclass%type
                              ,n_DOCCLASS       in borderdocuments.docclass%type
                              ,o_DOCTYPE        in BORDERDOCUMENTS.DOCTYPE%type
                              ,n_DOCTYPE        in BORDERDOCUMENTS.DOCTYPE%type
                              ,o_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                              ,n_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                              ,o_NAT            in BORDERDOCUMENTS.NAT%type
                              ,n_NAT            in BORDERDOCUMENTS.NAT%type
                              ,o_SEX            in BORDERDOCUMENTS.SEX%type
                              ,n_SEX            in BORDERDOCUMENTS.SEX%type
                              ,o_INS_TERMINAL   in BORDERDOCUMENTS.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in BORDERDOCUMENTS.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in BORDERDOCUMENTS.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in BORDERDOCUMENTS.INS_BORDERPOST%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
  /*
  if (n_DOCCLASS is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_DOCCLASS, o_DOCCLASS))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.BC_DOC_TYPES t
         where t.KEY_VALUE = n_DOCCLASS;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The DOCCLASS[''' || n_DOCCLASS || '''] is not active! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The DOCCLASS[''' || n_DOCCLASS || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if; */
    /*
    -- 01.06.2018: C.Hagemann
    -- Removed logical foreign key of doctype to dl_common.bc_doc_types as the logic behind this field was changed
    -- Added field docclass as foreign key to the table borderdocuments
    if (n_DOCTYPE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_DOCTYPE
                                                                 ,o_DOCTYPE))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.BC_DOC_TYPES t
         where t.KEY_VALUE = n_DOCTYPE;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The DOCTYPE[''' || n_DOCTYPE || '''] is not active! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          -- Free input of DOCTYPE is allowed!
          Raise_application_error(-20000
                                 ,'The DOCTYPE[''' || n_DOCTYPE || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
          null;
      end;
    end if;*/
    --
    --
    if (n_ISSUECTRY is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_ISSUECTRY
                                                                   ,o_ISSUECTRY))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.ICAO_DOC_CODES t
         where t.KEY_VALUE = n_ISSUECTRY;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The ISSUECTRY[''' || n_ISSUECTRY || '''] is not active! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The ISSUECTRY[''' || n_ISSUECTRY || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_NAT is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_NAT
                                                             ,o_NAT))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.ICAO_DOC_CODES t
         where t.KEY_VALUE = n_NAT;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The NAT[''' || n_NAT || '''] is not active! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The NAT[''' || n_NAT || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_SEX is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_SEX
                                                             ,o_SEX))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.HUMAN_SEXES t
         where t.NUM_VALUE = n_SEX
           and t.NUM_VALUE is not null;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The SEX[''' || n_SEX || '''] is not active or not an ICAO type! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The SEX[''' || n_SEX || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
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
                                 ,'Check borderpost and belonging terminal for BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
      end;
    end if;
    --
  end L_Check_FK_Content;
  --
  procedure L_Set_Calc_DOB(n_DOB in BORDERDOCUMENTS.DOB%type) is
    --
    v_ddmmrr varchar2(6);
    v_DOB_Partial DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;
    v_calc_DOB date;
    --
  begin
    if n_DOB is not null
    then
      v_ddmmrr      := substr(n_DOB
                             ,5
                             ,2) || substr(n_DOB
                                          ,3
                                          ,2) || substr(n_DOB
                                                       ,1
                                                       ,2);
      v_DOB_Partial := DL_BORDERCONTROL.PKG_COMMON.Get_Partial_Date(v_ddmmrr
                                                                   , 1
                                                                   --
                                                                   );
      if v_DOB_Partial.isValidDate() = 1 then
         v_calc_DOB := v_DOB_Partial.getDate();
      end if;
      :new.CALC_DOB := v_calc_DOB;
    end if;
  end;
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
      L_Set_Calc_DOB(:new.DOB);
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
      L_Set_Calc_DOB(:new.DOB);
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
      L_Check_FK_Content(:new.BRDDOCID
                        ,null
                        ,:new.docclass
                        ,null
                        ,:new.DOCTYPE
                        ,null
                        ,:new.ISSUECTRY
                        ,null
                        ,:new.NAT
                        ,null
                        ,:new.SEX
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
      L_Check_FK_Content(:new.BRDDOCID
                        ,:old.docclass
                        ,:new.docclass
                        ,:old.DOCTYPE
                        ,:new.DOCTYPE
                        ,:old.ISSUECTRY
                        ,:new.ISSUECTRY
                        ,:old.NAT
                        ,:new.NAT
                        ,:old.SEX
                        ,:new.SEX
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into BORDERDOCUMENTS$HIS
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
        insert into BORDERDOCUMENTS$HIS
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
      insert into BORDERDOCUMENTS$HIS
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
      insert into BORDERDOCUMENTS$HIS
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
end BORDERDOCUMENTS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."BORDERDOCUMENTS$TIUD0" ENABLE;
