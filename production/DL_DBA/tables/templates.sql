CREATE TABLE "DL_DBA"."TEMPLATES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
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
	"OWNER" VARCHAR2(128 CHAR), 
	"TEMPLATE_KEY" VARCHAR2(512 CHAR) NOT NULL ENABLE, 
	"TEMPLATE_VAL" CLOB, 
	"MAJOR" NUMBER(5,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"MINOR" NUMBER(5,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"PATCH" NUMBER(5,0) DEFAULT ON NULL 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$CK01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$CK02" CHECK (IS_ACTIVE in ('Y'
                                                                              ,'N')) ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$CK03" CHECK (DML_TYPE in ('I'
                                                                             ,'U')) ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$UQ01" UNIQUE ("TEMPLATE_KEY")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."KEY_VALUE" IS 'Key value (Primary key)';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."LOCALE" IS 'Localisation of all character columns of the row, links to table DL_COMMON.LOCALES';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."INS_AT" IS 'Inserted at';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."INS_BY" IS 'Inserted by';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."DML_AT" IS 'Last executed DML at';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."DML_BY" IS 'Last executed DML by';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."DML_TYPE" IS 'Last executed DML-Action: ''I'' => Insert, ''U'' => Update, ''D'' => Delete';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."NUM_VALUE" IS 'Numerical key value (Unique key)';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."OWNER" IS 'Owner of the row, links to table DL_COMMON.OWNERS';
  CREATE INDEX "DL_DBA"."TEMPLATES$IX00" ON "DL_DBA"."TEMPLATES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_DBA"."TEMPLATES$IX01" ON "DL_DBA"."TEMPLATES" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_DBA"."SYS_IL0000310327C00016$$" ON "DL_DBA"."TEMPLATES" (
  ;
CREATE UNIQUE INDEX "DL_DBA"."TEMPLATES$PK" ON "DL_DBA"."TEMPLATES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_DBA"."TEMPLATES$UQ00" ON "DL_DBA"."TEMPLATES" ("NUM_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_DBA"."TEMPLATES$UQ01" ON "DL_DBA"."TEMPLATES" ("TEMPLATE_KEY") 
  ;
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "SERVAPP";
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "BIO_BD";
  GRANT DELETE ON "DL_DBA"."TEMPLATES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_DBA"."TEMPLATES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_DBA"."TEMPLATES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_DBA"."TEMPLATES$TIUD0" 
  for insert or update or delete on DL_DBA.TEMPLATES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    14.08.2018  Added as copy of lookup-template-1.2.2
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
       or :new.TEMPLATE_KEY != :old.TEMPLATE_KEY
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
  procedure L_Check_FK_Content(p_KEY_VALUE in TEMPLATES.KEY_VALUE%type
                              ,o_OWNER     in TEMPLATES.OWNER%type
                              ,n_OWNER     in TEMPLATES.OWNER%type
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
  end L_Check_FK_Content;
  --
  --
  procedure L_Check_Row4DML is
  begin
    --
    if (v_DML_TYPE = 'I')
    then
      --
      null;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      if (bitand(:old.ROW_FLAG_MASK
                ,16) = 16)
      then
        -- 16 => prevent update
        Raise_application_error(-20000
                               , 'The row is not updatable! For KEY_VALUE[''' || :old.KEY_VALUE || ''']'
                                --
                                 || ', DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    else
      -- 'D'
      if (bitand(:old.ROW_FLAG_MASK
                ,32) = 32)
      then
        -- 32 => prevent delete
        Raise_application_error(-20000
                               , 'The row is not deletable! For KEY_VALUE[''' || :old.KEY_VALUE || ''']'
                                --
                                 || ', DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    end if;
    --
  end L_Check_Row4DML;
  --
  -- BEGIN: NOT GENERATED AREA
  --

  --
  -- END: NOT GENERATED AREA
  --
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
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
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
    L_Check_Row4DML();
    --
    if (v_DML_TYPE = 'I')
    then
      --
      -- Begin:PK is a surrogate key
      if (:new.KEY_VALUE is null)
      then
        :new.KEY_VALUE := SYS_GUID();
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
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
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
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
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
      insert into TEMPLATES$HIS
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
        ,:old.TEMPLATE_KEY
        ,:old.TEMPLATE_VAL
        ,:old.MAJOR
        ,:old.MINOR
        ,:old.PATCH
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into TEMPLATES$HIS
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
      insert into TEMPLATES$HIS
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
        ,:old.TEMPLATE_KEY
        ,:old.TEMPLATE_VAL
        ,:old.MAJOR
        ,:old.MINOR
        ,:old.PATCH
         --
         );
      --
      insert into TEMPLATES$HIS
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
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
    --
    v_DML_TYPE := null;
    --
  end after statement;
  --
end TEMPLATES$TIUD0;
/
ALTER TRIGGER "DL_DBA"."TEMPLATES$TIUD0" ENABLE;
