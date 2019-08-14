CREATE TABLE "DL_COMMON"."MESSAGES" 
   (	"MESSAGE_KEY" VARCHAR2(512 CHAR) NOT NULL ENABLE, 
	"KEY_DELIMITER" VARCHAR2(10 CHAR) DEFAULT ON NULL ' ' NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"MESSAGE_VALUE" VARCHAR2(4000 CHAR) NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR) DEFAULT null NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."MESSAGES" ADD CONSTRAINT "MESSAGES$PK" PRIMARY KEY ("MESSAGE_KEY")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."MESSAGES" ADD CONSTRAINT "MESSAGES$CHK$C02" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."MESSAGES" ADD CONSTRAINT "MESSAGES$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                  ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."MESSAGES" ADD CONSTRAINT "MESSAGES$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                 ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."MESSAGES" ADD CONSTRAINT "MESSAGES$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."MESSAGE_KEY" IS 'The key is treated case sensitive and it could be a path like the example "[Owner]\[App-Domain]\[App-Name]\[App-Page]\[%]..."!';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."KEY_DELIMITER" IS 'The delimiter used for split the key in each parts, i. e. the key represents a path.';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."MESSAGE_VALUE" IS 'Message text';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."OWNER" IS 'Owner who has inserted and is responsible for this row.';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."MESSAGES"  IS 'Table for Messages in Javascript';
  CREATE INDEX "DL_COMMON"."MESSAGES$IX00" ON "DL_COMMON"."MESSAGES" ("MESSAGE_VALUE") 
  ;
CREATE INDEX "DL_COMMON"."MESSAGES$IX01" ON "DL_COMMON"."MESSAGES" (UPPER("OWNER")) 
  ;
CREATE INDEX "DL_COMMON"."MESSAGES$IX02" ON "DL_COMMON"."MESSAGES" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."MESSAGES$PK" ON "DL_COMMON"."MESSAGES" ("MESSAGE_KEY") 
  ;
  GRANT SELECT ON "DL_COMMON"."MESSAGES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."MESSAGES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."MESSAGES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."MESSAGES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."MESSAGES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."MESSAGES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MESSAGES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."MESSAGES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MESSAGES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."MESSAGES$TIUD0" 
  for insert or update or delete on DL_COMMON.MESSAGES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    19.10.2017  Added
  * WWirns    23.11.2017  Column OWNER added
  * WWirns    23.02.2018  Add columns INS_AT and INS_BY
  * WWirns    06.04.2018  Refresh trigger from template and add changes depending column OWNER
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
    if (:new.MESSAGE_KEY != :old.MESSAGE_KEY)
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
  procedure L_Check_FK_Content(p_MESSAGE_KEY in MESSAGES.MESSAGE_KEY%type
                              ,o_OWNER       in MESSAGES.OWNER%type
                              ,n_OWNER       in MESSAGES.OWNER%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_OWNER is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_OWNER
                                                               ,o_OWNER))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.OWNERS t
         where t.KEY_VALUE = n_OWNER;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] is not active! For MESSAGE_KEY[''' || p_MESSAGE_KEY || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] does not exist! For MESSAGE_KEY[''' || p_MESSAGE_KEY || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
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
      /*
      if (:new.KEY_VALUE is null)
      then
        :new.KEY_VALUE := DL_COMMON."[objectname]"$SEQ00.NextVal;
      end if;
      */
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
      L_Check_FK_Content(:new.MESSAGE_KEY
                        ,null
                        ,:new.OWNER
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      --
      if (:new.OWNER != :old.OWNER)
      then
        Raise_application_error(-20000
                               ,'Changing the OWNER of MESSAGE_KEY[''' || :old.MESSAGE_KEY || '''] is not allowed!');
      end if;
      --
      L_Check_FK_Content(:new.MESSAGE_KEY
                        ,:old.OWNER
                        ,:new.OWNER
                         --
                         );
      --
      --
      --
      insert into MESSAGES$HIS
      values
        (:old.MESSAGE_KEY
        ,:old.KEY_DELIMITER
        ,:old.LOCALE
        ,:old.MESSAGE_VALUE
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into MESSAGES$HIS
          (MESSAGE_KEY
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.MESSAGE_KEY
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
      insert into MESSAGES$HIS
      values
        (:old.MESSAGE_KEY
        ,:old.KEY_DELIMITER
        ,:old.LOCALE
        ,:old.MESSAGE_VALUE
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into MESSAGES$HIS
        (MESSAGE_KEY
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.MESSAGE_KEY
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
end MESSAGES$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."MESSAGES$TIUD0" ENABLE;
