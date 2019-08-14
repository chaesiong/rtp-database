CREATE TABLE "DL_BORDERCONTROL"."VISAS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"VISA_TYPE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"VISA_NUMBER" VARCHAR2(32 CHAR), 
	"ISSUING_DATE" DATE, 
	"ISSUING_PLACE" VARCHAR2(255 CHAR), 
	"ADDITIONAL_INFO" VARCHAR2(255 CHAR), 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BORDERDOCUMENT" VARCHAR2(32 CHAR), 
	"VISA_IMAGE" BLOB, 
	"EXPIRY_DATE" DATE, 
	"PERSON" VARCHAR2(32 CHAR), 
	"APPLICANT_DATE" DATE, 
	"FROM_COUNTRY" VARCHAR2(32 CHAR), 
	"TRANS_VEHICLE" VARCHAR2(32 CHAR), 
	"TRANS_NUMBER" VARCHAR2(50 CHAR), 
	"STATUS" VARCHAR2(32 CHAR) DEFAULT ON NULL 'APPROVED' NOT NULL ENABLE, 
	"RELEASE_NOTE" VARCHAR2(2500 CHAR), 
	"CANCEL_NOTE" VARCHAR2(2500 CHAR), 
	"PAYMENT_STATUS" VARCHAR2(32 CHAR) DEFAULT ON NULL 'DONT_PAY' NOT NULL ENABLE, 
	"RECEIPT" VARCHAR2(32 CHAR), 
	"PERMIT_TYPE" VARCHAR2(255 CHAR), 
	"PERMIT_EXPIRY_DATE" DATE, 
	"INS_OFFICER" VARCHAR2(255 CHAR), 
	"STATUS_FEE_EXCEPTION" VARCHAR2(255 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE, 
	"STATUS_NO_RECEIPT" VARCHAR2(255 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE, 
	"STATUS_PRINT_FORM" VARCHAR2(255 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE, 
	"BLACKLIST_RECORD" VARCHAR2(32 CHAR)
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1 ,'MONTH')) 
 (PARTITION "P_BEFORE_2018"  VALUES LESS THAN (TO_DATE(' 2018-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) ) ;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$CHK03" CHECK (status_fee_exception IN ('Y', 'N')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$CHK04" CHECK (status_no_receipt IN ('Y', 'N')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$CHK05" CHECK (status_print_form IN ('Y', 'N')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$CHK01" CHECK (status IN ('APPROVED', 'DECLINED', 'IN_PROGRESS', 'CANCELED')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$CHK02" CHECK (payment_status IN ('PAYED', 'NOT_YET_PAID', 'DONT_PAY')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$FK00" FOREIGN KEY ("VISA_TYPE")
	  REFERENCES "DL_COMMON"."VISA_TYPES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$FK03" FOREIGN KEY ("BORDERDOCUMENT")
	  REFERENCES "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("BRDDOCID") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$FK04" FOREIGN KEY ("FROM_COUNTRY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$FK05" FOREIGN KEY ("TRANS_VEHICLE")
	  REFERENCES "DL_COMMON"."TRANS_VEHICLES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$FK06" FOREIGN KEY ("PERSON")
	  REFERENCES "DL_BORDERCONTROL"."PERSON" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VISAS" ADD CONSTRAINT "VISAS$FK07" FOREIGN KEY ("RECEIPT")
	  REFERENCES "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."VISA_TYPE" IS 'Foreign Key to Table DL_COMMON.VISA_TYPES';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."VISA_NUMBER" IS 'Column for Visa Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."ISSUING_DATE" IS 'Issuing Date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."ISSUING_PLACE" IS 'Issuing Place';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."ADDITIONAL_INFO" IS 'Column for additional Information/Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."BORDERDOCUMENT" IS 'The borderdocument (passport, ...) that was used to request the visa and/or depends with the visa';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."VISA_IMAGE" IS 'Image of Visa';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."EXPIRY_DATE" IS 'Date till the Visa is valid (if no date is set the Visa is valid for an undefined period of time)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."PERSON" IS 'FK DL_BORDERCONTROL.PERSON';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."APPLICANT_DATE" IS 'Application Date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."FROM_COUNTRY" IS 'FK DL_COMMON.COUNTRIES';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."TRANS_VEHICLE" IS 'Transport Vehicle';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."TRANS_NUMBER" IS 'Number of the transport method the user came in (e.g. flight no)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."STATUS" IS 'Status of the Visa entry (A.pproved, D.eclined, I.n Progress); A is set as default to provide downgrades in Visa logic';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."RELEASE_NOTE" IS 'Reason why the Visa was approved or declined';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."CANCEL_NOTE" IS 'Reason why the Visa was cancelled';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."PAYMENT_STATUS" IS 'Status of the payment that has to be made (P.ayed; N.ot yet but has to; D.on''t have to pay)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."RECEIPT" IS 'Receipt number / connection to the payment functionality';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."PERMIT_TYPE" IS 'Number of Permit Days';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."PERMIT_EXPIRY_DATE" IS 'Date of Permit expiry';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."INS_OFFICER" IS 'Username of the user who inserted this dataset';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."STATUS_FEE_EXCEPTION" IS 'Traveler don''t have to pay any fee';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."STATUS_NO_RECEIPT" IS 'The officer don''t want to print a receipt';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."STATUS_PRINT_FORM" IS 'The officer wants (or don''t want) to print the form / Visa';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VISAS"."BLACKLIST_RECORD" IS 'Record ID of Blacklist entry';
   COMMENT ON TABLE "DL_BORDERCONTROL"."VISAS"  IS 'Used in BmBS, VOA, Re-Entry';
  CREATE INDEX "DL_BORDERCONTROL"."VISAS$IX00" ON "DL_BORDERCONTROL"."VISAS" ("VISA_TYPE") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."VISAS$IX01" ON "DL_BORDERCONTROL"."VISAS" ("INS_BORDERPOST") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."VISAS$IX02" ON "DL_BORDERCONTROL"."VISAS" ("INS_TERMINAL") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."VISAS$IX03" ON "DL_BORDERCONTROL"."VISAS" ("BORDERDOCUMENT") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311899C00015$$" ON "DL_BORDERCONTROL"."VISAS" (
   LOCAL
 (PARTITION "SYS_IL_P7253" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."VISAS$PK" ON "DL_BORDERCONTROL"."VISAS" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "SERVAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VISAS" TO "DL_INTERFACE";
  GRANT DELETE ON "DL_BORDERCONTROL"."VISAS" TO "DL_INTERFACE";
  GRANT INSERT ON "DL_BORDERCONTROL"."VISAS" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."VISAS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."VISAS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VISAS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "APPSUP";
  GRANT INSERT ON "DL_BORDERCONTROL"."VISAS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VISAS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."VISAS" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."VISAS" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VISAS" TO "TRAINEE";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."VISAS$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.VISAS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    29.01.2018  Added
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
  procedure L_Check_FK_Content(p_KEY_VALUE      in VISAS.KEY_VALUE%type
                              ,o_VISA_TYPE      in VISAS.VISA_TYPE%type
                              ,n_VISA_TYPE      in VISAS.VISA_TYPE%type
                              ,o_INS_TERMINAL   in VISAS.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in VISAS.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in VISAS.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in VISAS.INS_BORDERPOST%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_VISA_TYPE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_VISA_TYPE
                                                                   ,o_VISA_TYPE))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.VISA_TYPES t
         where t.KEY_VALUE = n_VISA_TYPE;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The VISA_TYPE[''' || n_VISA_TYPE || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The VISA_TYPE[''' || n_VISA_TYPE || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
      --
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
                                 ,'Check borderpost and belonging terminal for p_KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
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
      L_Check_FK_Content(:new.KEY_VALUE
                        ,null
                        ,:new.VISA_TYPE
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
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.VISA_TYPE
                        ,:new.VISA_TYPE
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into VISAS$HIS
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
        insert into VISAS$HIS
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
      insert into VISAS$HIS
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
      insert into VISAS$HIS
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
end VISAS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."VISAS$TIUD0" ENABLE;
