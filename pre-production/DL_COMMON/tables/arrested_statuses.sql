CREATE TABLE "DL_COMMON"."ARRESTED_STATUSES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES" ADD CONSTRAINT "ARRESTED_STATUSES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES" ADD CONSTRAINT "ARRESTED_STATUSES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES" ADD CONSTRAINT "ARRESTED_STATUSES$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES" ADD CONSTRAINT "ARRESTED_STATUSES$CK01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES" ADD CONSTRAINT "ARRESTED_STATUSES$CK02" CHECK (IS_ACTIVE in ('Y'
                                                                                              ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES" ADD CONSTRAINT "ARRESTED_STATUSES$CK03" CHECK (DML_TYPE in ('I'
                                                                                             ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES" ADD CONSTRAINT "ARRESTED_STATUSES$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES"."OWNER" IS 'Owner of the data';
   COMMENT ON TABLE "DL_COMMON"."ARRESTED_STATUSES"  IS 'Table for Arrested Statuses';
  CREATE INDEX "DL_COMMON"."ARRESTED_STATUSES$IX00" ON "DL_COMMON"."ARRESTED_STATUSES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."ARRESTED_STATUSES$IX01" ON "DL_COMMON"."ARRESTED_STATUSES" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."ARRESTED_STATUSES$PK" ON "DL_COMMON"."ARRESTED_STATUSES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."ARRESTED_STATUSES$UQ00" ON "DL_COMMON"."ARRESTED_STATUSES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."ARRESTED_STATUSES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ARRESTED_STATUSES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ARRESTED_STATUSES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ARRESTED_STATUSES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."ARRESTED_STATUSES$TIUD0" 
  for insert or update or delete on DL_COMMON.ARRESTED_STATUSES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * CHageman  13.06.2018  Added
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
    if (:new.KEY_VALUE != :old.KEY_VALUE
       --
       -- Begin:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
       --or :new."[columnname-n]" != :old."[columnname-n]"
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
  procedure L_Check_FK_Content(p_KEY_VALUE        in ARRESTED_STATUSES.KEY_VALUE%type
                               ,o_OWNER            in ARRESTED_STATUSES.OWNER%type
                               ,n_OWNER            in ARRESTED_STATUSES.OWNER%type
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
                                 ,'The OWNER[''' || n_OWNER || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
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
      L_Check_FK_Content(:new.KEY_VALUE
                        ,null
                        ,:new.OWNER
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.OWNER
                        ,:new.OWNER
                         --
                         );
      --
      insert into ARRESTED_STATUSES$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into ARRESTED_STATUSES$HIS
          (KEY_VALUE
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
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
      insert into ARRESTED_STATUSES$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      insert into ARRESTED_STATUSES$HIS
        (KEY_VALUE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
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
end ARRESTED_STATUSES$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."ARRESTED_STATUSES$TIUD0" ENABLE;
