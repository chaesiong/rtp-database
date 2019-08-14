CREATE TABLE "DL_BORDERCONTROL"."TM8_APPLICATION" 
   (	"KEY_VALUE" VARCHAR2(32) DEFAULT SYS_GUID(), 
	"FEES_FK" VARCHAR2(32 CHAR), 
	"PERSON_FK" VARCHAR2(32), 
	"PURPOSE_SEQNO" NUMBER, 
	"PURPOSE" VARCHAR2(2500), 
	"TRANSPORTTYPE_SEQNO" VARCHAR2(20), 
	"VISA_FK" VARCHAR2(32), 
	"DOC_DATE" DATE DEFAULT sysdate, 
	"ARRIVE_DATE" DATE, 
	"LEAVE_DATE" DATE, 
	"RETURN_DATE" DATE, 
	"ENDPERMIT_DATE" DATE, 
	"PASSPORTNO" VARCHAR2(20), 
	"PASSPORT_ISSUED_DATE" DATE, 
	"PASSPORT_EXPIRY_DATE" DATE, 
	"PASSPORT_ISSUED_BY" NVARCHAR2(20), 
	"TM8_TYPE" CHAR(1), 
	"MANUALTM8" CHAR(1), 
	"APPROVAL_STATUS" VARCHAR2(32 CHAR), 
	"TM6_NUMBER" VARCHAR2(20), 
	"APPLICATION_NUMBER" NUMBER NOT NULL ENABLE, 
	"DESTINATION_COUNTRY" VARCHAR2(32), 
	"ADDITIONAL_INFO" VARCHAR2(256), 
	"NUMBER_OF_ENTRIES_USED" NUMBER DEFAULT 0, 
	"NUMBER_OF_ENTRIES" NUMBER DEFAULT 1, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."TM8_APPLICATION" ADD CONSTRAINT "TM8_APPLICATION_PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TM8_APPLICATION" ADD CONSTRAINT "TM8_APPLICATION_NUMBER_UQ" UNIQUE ("APPLICATION_NUMBER")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TM8_APPLICATION" ADD CONSTRAINT "TM8_APPLICATION_PERSON_FK" FOREIGN KEY ("PERSON_FK")
	  REFERENCES "DL_BORDERCONTROL"."PERSON" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TM8_APPLICATION" ADD CONSTRAINT "TM8_APPLICATION_VISA_FK" FOREIGN KEY ("VISA_FK")
	  REFERENCES "DL_BORDERCONTROL"."VISAS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."FEES_FK" IS 'Foreign Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."PERSON_FK" IS 'Foreign Key (The Person who requested the TM8)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."PURPOSE_SEQNO" IS 'Foreign Key for the Purpose (Business, Travel, etc.)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."PURPOSE" IS 'What does the Foreigner want to do abroad';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."TRANSPORTTYPE_SEQNO" IS 'Foreign Key (Transport Type like Ship, Plane)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."VISA_FK" IS 'Foreign Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."DOC_DATE" IS 'Creation Date of the document';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."ARRIVE_DATE" IS 'Date of arrival in Thailand';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."LEAVE_DATE" IS 'Date of temporary departure';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."RETURN_DATE" IS 'Date of return back to Thailand';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."ENDPERMIT_DATE" IS 'End of the Re-Entry Permit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."PASSPORTNO" IS 'The Passport Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."PASSPORT_ISSUED_DATE" IS 'Passport issued at ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."PASSPORT_EXPIRY_DATE" IS 'Passport will expire on';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."PASSPORT_ISSUED_BY" IS 'Passport was issued by (Country)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."TM8_TYPE" IS 'S = Single, M = Multiple';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."MANUALTM8" IS 'A = Automatic, M = Manual';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."APPROVAL_STATUS" IS 'A = Approved, N = Not Approved, R = End of Permit, C = Canceled';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."TM6_NUMBER" IS 'A Foreign Key to the Entry Forms Table to determine which TM6 was used';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."APPLICATION_NUMBER" IS 'The Unique Application Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."DESTINATION_COUNTRY" IS 'Where do you want to go to?';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."ADDITIONAL_INFO" IS 'Column for additional Information/Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."NUMBER_OF_ENTRIES_USED" IS 'Number of Entries allready used';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."NUMBER_OF_ENTRIES" IS 'Number of Entries which are allowed';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TM8_APPLICATION"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON TABLE "DL_BORDERCONTROL"."TM8_APPLICATION"  IS 'Used in Re-Entry';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."TM8_APPLICATION_NUMBER_UQ" ON "DL_BORDERCONTROL"."TM8_APPLICATION" ("APPLICATION_NUMBER") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."TM8_APPLICATION_PK" ON "DL_BORDERCONTROL"."TM8_APPLICATION" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TM8_APPLICATION" TO "TRAINEE";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."TM8_APPLICATION$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL."TM8_APPLICATION"
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
  * WWirns    06.10.2017  Changes because of surrogate keys
  * WWirns    09.11.2017  Added FK-Content check
  * WWirns    04.04.2018  INS_* columns added
  * DNotzon   27.06.2018  Modified for TM8_APPLICATION
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
    else
      -- 'D'
      null;
      --
    end if;
    --
  end before each row;
  --
  --
end "TM8_APPLICATION$TIUD0";
/
ALTER TRIGGER "DL_BORDERCONTROL"."TM8_APPLICATION$TIUD0" ENABLE;
