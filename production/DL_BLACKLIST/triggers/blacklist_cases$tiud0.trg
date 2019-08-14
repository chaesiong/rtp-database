CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."BLACKLIST_CASES$TIUD0" 
  for insert or update or delete on DL_BLACKLIST.BLACKLIST_CASES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MStahl    12.02.2019  Added
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
    if (:new.id != :old.id
       --
       -- Begin:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
       or :new.id != :old.id
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
  --
  /**
  * Checks if the foreign key value of the table is valid and can be found in the parent table
  * Raises errors if the value cannot be found
  */
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_id        in BLACKLIST_CASES.ID%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    NULL;
    --
  end L_Check_FK_Content;
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
    if (v_DML_TYPE = 'I')
    then
      --
      -- Begin:PK is a surrogate key
      if (:new.id is null)
      then
        :new.id := sys_guid();
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
    if (v_DML_TYPE = 'I')
    then
      --
      L_Check_FK_Content(:new.id
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.id
                         --
                         );
      --
      insert into BLACKLIST_CASES$HIS
      values
        (:old.id
        ,:old.authority
        ,:old.behavior
        ,:old.case_number
        ,:old.secret_level
        ,:old.reason
        ,:old.is_active
        ,:old.ins_by
        ,:old.ins_at
        ,:old.dml_by
        ,:old.dml_at
        ,:old.dml_type
        ,:old.urgent_contact
        ,:old.contact_information
        ,:old.target_code
        ,:old.action_code
        ,:old.notice
        ,:old.reference_document
        ,:old.warrant_arrested_type
        ,:old.criminal_case_number
        ,:old.arrested_description
        ,:old.arrested_status
        ,:old.decided_case_number
        ,:old.arrested_warrant_expiry_date
        ,:old.related_document
        ,:old.arrested_warrant_number
        ,:old.arrested_warrant_date
        ,:old.travel_permit
        ,:old.travel_permit_from
        ,:old.travel_permit_to
        ,:old.travel_permit_date_insert
        ,:old.travel_permit_date_delete
        ,:old.travel_permit_note
        ,:old.owner_data
        ,:old.other_description
        ,:old.contact_telephone_number
        ,:old.contact_owner_data
        ,:old.associated_behavior
        ,:old.other
        ,:old.case_type
        ,:old.ostay_creation_date
        ,:old.ostay_self_indictment
        ,:old.ostay_status
        ,:old.ostay_no_days
        ,:old.ostay_arrival_date
        ,:old.ostay_departure_date
        ,:old.ostay_tm6
        ,:old.ostay_block_period
        ,:old.ostay_notice
        ,:old.lost_pp_lost_date
        ,:old.lost_pp_last_place
        ,:old.lost_pp_notify_date
        ,:old.lost_pp_notify_place
        ,:old.lost_pp_visa_on_arriv
        ,:old.lost_pp_visa_exp_date
        ,:old.lost_pp_notice
        ,:old.lost_pp_new_pp_type
        ,:old.lost_pp_new_pp_number
        ,:old.lost_pp_new_pp_issue_date
        ,:old.lost_pp_new_pp_place_of_issue
        ,:old.lost_pp_new_pp_expire_date
        ,:old.arrested_warrant_year
        ,:old.undecided_case_number
        ,:old.closing_reason
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into BLACKLIST_CASES$HIS
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
      insert into BLACKLIST_CASES$HIS
      values
        (:old.id
        ,:old.authority
        ,:old.behavior
        ,:old.case_number
        ,:old.secret_level
        ,:old.reason
        ,:old.is_active
        ,:old.ins_by
        ,:old.ins_at
        ,:old.dml_by
        ,:old.dml_at
        ,:old.dml_type
        ,:old.urgent_contact
        ,:old.contact_information
        ,:old.target_code
        ,:old.action_code
        ,:old.notice
        ,:old.reference_document
        ,:old.warrant_arrested_type
        ,:old.criminal_case_number
        ,:old.arrested_description
        ,:old.arrested_status
        ,:old.decided_case_number
        ,:old.arrested_warrant_expiry_date
        ,:old.related_document
        ,:old.arrested_warrant_number
        ,:old.arrested_warrant_date
        ,:old.travel_permit
        ,:old.travel_permit_from
        ,:old.travel_permit_to
        ,:old.travel_permit_date_insert
        ,:old.travel_permit_date_delete
        ,:old.travel_permit_note
        ,:old.owner_data
        ,:old.other_description
        ,:old.contact_telephone_number
        ,:old.contact_owner_data
        ,:old.associated_behavior
        ,:old.other
        ,:old.case_type
        ,:old.ostay_creation_date
        ,:old.ostay_self_indictment
        ,:old.ostay_status
        ,:old.ostay_no_days
        ,:old.ostay_arrival_date
        ,:old.ostay_departure_date
        ,:old.ostay_tm6
        ,:old.ostay_block_period
        ,:old.ostay_notice
        ,:old.lost_pp_lost_date
        ,:old.lost_pp_last_place
        ,:old.lost_pp_notify_date
        ,:old.lost_pp_notify_place
        ,:old.lost_pp_visa_on_arriv
        ,:old.lost_pp_visa_exp_date
        ,:old.lost_pp_notice
        ,:old.lost_pp_new_pp_type
        ,:old.lost_pp_new_pp_number
        ,:old.lost_pp_new_pp_issue_date
        ,:old.lost_pp_new_pp_place_of_issue
        ,:old.lost_pp_new_pp_expire_date
        ,:old.arrested_warrant_year
        ,:old.undecided_case_number
        ,:old.closing_reason
         --
         );
      --
      insert into BLACKLIST_CASES$HIS
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
    v_DML_TYPE := null;
    --
  end after statement;
  --
end BLACKLIST_CASES$TIUD0;
/
ALTER TRIGGER "DL_BLACKLIST"."BLACKLIST_CASES$TIUD0" ENABLE;
