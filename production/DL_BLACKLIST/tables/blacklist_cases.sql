CREATE TABLE "DL_BLACKLIST"."BLACKLIST_CASES" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT rawtohex(sys_guid() ), 
	"AUTHORITY" VARCHAR2(100 CHAR), 
	"BEHAVIOR" VARCHAR2(100 CHAR), 
	"CASE_NUMBER" VARCHAR2(100 CHAR), 
	"SECRET_LEVEL" VARCHAR2(32 CHAR), 
	"REASON" VARCHAR2(32 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT 'Y' NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"URGENT_CONTACT" VARCHAR2(120 CHAR), 
	"CONTACT_INFORMATION" VARCHAR2(100 CHAR), 
	"TARGET_CODE" VARCHAR2(100 CHAR), 
	"ACTION_CODE" VARCHAR2(32 CHAR), 
	"NOTICE" VARCHAR2(2000 CHAR), 
	"REFERENCE_DOCUMENT" VARCHAR2(100 CHAR), 
	"WARRANT_ARRESTED_TYPE" VARCHAR2(32 CHAR), 
	"CRIMINAL_CASE_NUMBER" VARCHAR2(100 CHAR), 
	"ARRESTED_DESCRIPTION" VARCHAR2(100 CHAR), 
	"ARRESTED_STATUS" VARCHAR2(32 CHAR), 
	"DECIDED_CASE_NUMBER" VARCHAR2(100 CHAR), 
	"ARRESTED_WARRANT_EXPIRY_DATE" DATE, 
	"RELATED_DOCUMENT" VARCHAR2(100 CHAR), 
	"ARRESTED_WARRANT_NUMBER" VARCHAR2(100 CHAR), 
	"ARRESTED_WARRANT_DATE" DATE, 
	"TRAVEL_PERMIT" VARCHAR2(1 CHAR), 
	"TRAVEL_PERMIT_FROM" DATE, 
	"TRAVEL_PERMIT_TO" DATE, 
	"TRAVEL_PERMIT_DATE_INSERT" DATE, 
	"TRAVEL_PERMIT_DATE_DELETE" DATE, 
	"TRAVEL_PERMIT_NOTE" VARCHAR2(2000 CHAR), 
	"OWNER_DATA" VARCHAR2(100 CHAR), 
	"OTHER_DESCRIPTION" VARCHAR2(2000 CHAR), 
	"CONTACT_TELEPHONE_NUMBER" VARCHAR2(40 CHAR), 
	"CONTACT_OWNER_DATA" VARCHAR2(170 CHAR), 
	"ASSOCIATED_BEHAVIOR" VARCHAR2(100 CHAR), 
	"OTHER" VARCHAR2(100 CHAR), 
	"CASE_TYPE" VARCHAR2(32 CHAR) DEFAULT ON NULL 'CRIMINAL' NOT NULL ENABLE, 
	"OSTAY_CREATION_DATE" DATE, 
	"OSTAY_SELF_INDICTMENT" VARCHAR2(1 CHAR), 
	"OSTAY_STATUS" VARCHAR2(100 CHAR), 
	"OSTAY_NO_DAYS" NUMBER, 
	"OSTAY_ARRIVAL_DATE" DATE, 
	"OSTAY_DEPARTURE_DATE" DATE, 
	"OSTAY_TM6" VARCHAR2(100 CHAR), 
	"OSTAY_BLOCK_PERIOD" NUMBER, 
	"OSTAY_NOTICE" VARCHAR2(2000 CHAR), 
	"LOST_PP_LOST_DATE" DATE, 
	"LOST_PP_LAST_PLACE" VARCHAR2(100 CHAR), 
	"LOST_PP_NOTIFY_DATE" DATE, 
	"LOST_PP_NOTIFY_PLACE" VARCHAR2(100 CHAR), 
	"LOST_PP_VISA_ON_ARRIV" VARCHAR2(100 CHAR), 
	"LOST_PP_VISA_EXP_DATE" DATE, 
	"LOST_PP_NOTICE" VARCHAR2(2000 CHAR), 
	"LOST_PP_NEW_PP_TYPE" VARCHAR2(32 CHAR), 
	"LOST_PP_NEW_PP_NUMBER" VARCHAR2(100 CHAR), 
	"LOST_PP_NEW_PP_ISSUE_DATE" DATE, 
	"LOST_PP_NEW_PP_PLACE_OF_ISSUE" VARCHAR2(100 CHAR), 
	"LOST_PP_NEW_PP_EXPIRE_DATE" DATE, 
	"ARRESTED_WARRANT_YEAR" NUMBER(*,0), 
	"UNDECIDED_CASE_NUMBER" VARCHAR2(100 CHAR), 
	"CLOSING_REASON" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_CHK1" CHECK (travel_permit IN (
'N',
'Y'
)) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_CHK2" CHECK (is_active IN (
'N',
'Y'
)) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASE_PK" PRIMARY KEY ("ID")
  USING INDEX (CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_PK" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("ID") 
  )  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASE_UK_AUTHORITY_CASE_NUMBER" UNIQUE ("AUTHORITY", "CASE_NUMBER")
  USING INDEX (CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_UK1" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("AUTHORITY", "CASE_NUMBER") 
  )  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_ACTION_CODE" FOREIGN KEY ("ACTION_CODE")
	  REFERENCES "DL_COMMON"."ACTION_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_ARRESTED_STATUS" FOREIGN KEY ("ARRESTED_STATUS")
	  REFERENCES "DL_COMMON"."ARRESTED_STATUSES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_ARRESTED_TYPE" FOREIGN KEY ("WARRANT_ARRESTED_TYPE")
	  REFERENCES "DL_COMMON"."ARRESTED_TYPES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_CASE_TYPE" FOREIGN KEY ("CASE_TYPE")
	  REFERENCES "DL_COMMON"."CASE_TYPES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_REASON" FOREIGN KEY ("REASON")
	  REFERENCES "DL_COMMON"."REASON_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_SECRET_LEVEL" FOREIGN KEY ("SECRET_LEVEL")
	  REFERENCES "DL_COMMON"."SECRET_LEVELS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES"."CLOSING_REASON" IS 'Reason for closing a case';
  CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX1" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("SECRET_LEVEL") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX2" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("WARRANT_ARRESTED_TYPE") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX3" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("ARRESTED_STATUS") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX4" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("REASON") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX5" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("ACTION_CODE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_PK" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_UK1" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("AUTHORITY", "CASE_NUMBER") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASE_UK_AUTHORITY_CASE_NUMBER" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("AUTHORITY", "CASE_NUMBER", "CASE_TYPE") 
  ;
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "APPSUP";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "SERVAPP";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSAPP";
  GRANT REFERENCES ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_INTERFACE";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_INTERFACE";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_INTERFACE";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_BORDERCONTROL";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_BORDERCONTROL";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIO_BD";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSDM2";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."BLACKLIST_CASES$BIUR" 
    BEFORE INSERT OR UPDATE ON DL_BLACKLIST.BLACKLIST_CASES
    FOR EACH ROW
BEGIN
    IF inserting THEN
        :new.ins_by   := coalesce(:new.ins_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.ins_at   := coalesce(:new.ins_at
                                 ,systimestamp);
        :new.dml_by   := coalesce(:new.dml_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.dml_at   := coalesce(:new.dml_at
                                 ,systimestamp);
        :new.dml_type := 'I';
        -- call dl_blacklist.pkg_utils.create_a_case_id if case_id is null
        -- otherwise take the given value because we assume that it is a pibics load
        IF :new.case_number IS NULL THEN
            :new.case_number := pkg_utils.create_a_case_number();
        END IF;
    ELSIF updating THEN
        :new.ins_by   := :old.ins_by;
        :new.ins_at   := :old.ins_at;
        :new.dml_by   := coalesce(:new.dml_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.dml_at   := coalesce(:new.dml_at
                                 ,systimestamp);
        :new.dml_type := 'U';
    END IF;
END;
/
ALTER TRIGGER "DL_BLACKLIST"."BLACKLIST_CASES$BIUR" ENABLE;
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
