CREATE TABLE "DL_DBA"."TEMPLATES$I18N" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_DBA"."TEMPLATES$I18N" ADD CONSTRAINT "TEMPLATES$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES$I18N" ADD CONSTRAINT "TEMPLATES$I18N$CK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES$I18N" ADD CONSTRAINT "TEMPLATES$I18N$CK01" CHECK (DML_TYPE in ('I'
                                                                                       ,'U')) ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES$I18N" ADD CONSTRAINT "TEMPLATES$I18N$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_DBA"."TEMPLATES" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES$I18N" ADD CONSTRAINT "TEMPLATES$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES$I18N" ADD CONSTRAINT "TEMPLATES$I18N$FK02" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."KEY_VALUE" IS 'Key value, links to table DL_DBA.TEMPLATES';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."LOCALE" IS 'Localisation of all character columns of the row, links to table DL_COMMON.LOCALES';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."INS_AT" IS 'Inserted at';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."INS_BY" IS 'Inserted by';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."DML_AT" IS 'Last executed DML at';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."DML_BY" IS 'Last executed DML by';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."DML_TYPE" IS 'Last executed DML-Action: ''I'' => Insert, ''U'' => Update, ''D'' => Delete';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$I18N"."OWNER" IS 'Owner of the row, links to table DL_COMMON.OWNERS';
   COMMENT ON TABLE "DL_DBA"."TEMPLATES$I18N"  IS 'Additional localized rows of table DL_DBA.TEMPLATES';
  CREATE INDEX "DL_DBA"."TEMPLATES$I18N$IX02" ON "DL_DBA"."TEMPLATES$I18N" ("DISPLAY_VALUE") 
  ;
CREATE INDEX "DL_DBA"."TEMPLATES$I18N$IX03" ON "DL_DBA"."TEMPLATES$I18N" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_DBA"."TEMPLATES$I18N$PK" ON "DL_DBA"."TEMPLATES$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT SELECT ON "DL_DBA"."TEMPLATES$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_DBA"."TEMPLATES$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_DBA"."TEMPLATES$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_DBA"."TEMPLATES$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$I18N" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_DBA"."TEMPLATES$I18N$TIUD0" 
  for insert or update or delete on DL_DBA.TEMPLATES$I18N
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
    if (:new.KEY_VALUE != :old.KEY_VALUE or :new.LOCALE != :old.LOCALE)
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
  procedure L_Check_FK_Content(p_KEY_VALUE in TEMPLATES$I18N.KEY_VALUE%type
                              ,p_LOCALE    in TEMPLATES$I18N.LOCALE%type
                              ,o_OWNER     in TEMPLATES$I18N.OWNER%type
                              ,n_OWNER     in TEMPLATES$I18N.OWNER%type
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
                                 ,'The OWNER[''' || n_OWNER || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || ''']/LOCALE[''' || p_LOCALE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || ''']/LOCALE[''' || p_LOCALE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
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
                               , 'The row is not updatable! For KEY_VALUE[''' || :old.KEY_VALUE || ''']/LOCALE[''' || :old.LOCALE || ''']'
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
                               , 'The row is not deletable! For KEY_VALUE[''' || :old.KEY_VALUE || ''']/LOCALE[''' || :old.LOCALE || ''']'
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
                        ,:new.LOCALE
                        ,null
                        ,:new.OWNER
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:new.LOCALE
                        ,:old.OWNER
                        ,:new.OWNER
                         --
                         );
      --
      insert into TEMPLATES$I18N$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into TEMPLATES$I18N$HIS
          (KEY_VALUE
          ,LOCALE
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,:old.LOCALE
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
      insert into TEMPLATES$I18N$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      insert into TEMPLATES$I18N$HIS
        (KEY_VALUE
        ,LOCALE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
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
end TEMPLATES$I18N$TIUD0;
/
ALTER TRIGGER "DL_DBA"."TEMPLATES$I18N$TIUD0" ENABLE;
