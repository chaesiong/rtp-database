CREATE TABLE "DL_COMMON"."LOCALES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"LC_LANGUAGE" VARCHAR2(2 CHAR) NOT NULL ENABLE, 
	"LC_COUNTRY" VARCHAR2(3 CHAR) NOT NULL ENABLE, 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                               ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$FK_LANGUAGE" FOREIGN KEY ("LC_LANGUAGE")
	  REFERENCES "DL_COMMON"."LANGUAGES" ("ISO639_1") ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$FK_COUNTRY" FOREIGN KEY ("LC_COUNTRY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("ISO3166_A3") ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$FK_OWNER" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."LC_LANGUAGE" IS 'References table LANGUAGES';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."LC_COUNTRY" IS 'References table COUNTRIES';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."OWNER" IS 'Owner of the data';
   COMMENT ON TABLE "DL_COMMON"."LOCALES"  IS 'Table for Locals';
  CREATE INDEX "DL_COMMON"."LOCALES$IX00" ON "DL_COMMON"."LOCALES" ("LC_LANGUAGE") 
  ;
CREATE INDEX "DL_COMMON"."LOCALES$IX01" ON "DL_COMMON"."LOCALES" ("LC_COUNTRY") 
  ;
CREATE INDEX "DL_COMMON"."LOCALES$IX02" ON "DL_COMMON"."LOCALES" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."LOCALES$PK" ON "DL_COMMON"."LOCALES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."LOCALES$UQ00" ON "DL_COMMON"."LOCALES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."LOCALES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."LOCALES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."LOCALES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."LOCALES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."LOCALES$TIUD0" 
  for insert or update or delete on DL_COMMON.LOCALES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    26.09.2017  Added
  * WWirns    09.11.2017  Added checks for IS_ACTIVE of FK-Columns-Content
  * WWirns    23.02.2018  Add columns INS_AT and INS_BY
  * WWirns    10.04.2018  Refresh from template
  * WWirns    10.04.2018  Add column OWNER
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
    if (:new.KEY_VALUE != :old.KEY_VALUE)
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
  procedure L_Check_FK_Content(p_KEY_VALUE   in LOCALES.KEY_VALUE%type
                              ,o_OWNER       in LOCALES.OWNER%type
                              ,n_OWNER       in LOCALES.OWNER%type
                              ,o_LC_LANGUAGE in LOCALES.LC_LANGUAGE%type
                              ,n_LC_LANGUAGE in LOCALES.LC_LANGUAGE%type
                              ,o_LC_COUNTRY  in LOCALES.LC_COUNTRY%type
                              ,n_LC_COUNTRY  in LOCALES.LC_COUNTRY%type
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
    if (n_LC_LANGUAGE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_LC_LANGUAGE
                                                                     ,o_LC_LANGUAGE))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.LANGUAGES t
         where t.ISO639_1 = n_LC_LANGUAGE;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The LC_LANGUAGE[''' || n_LC_LANGUAGE || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The LC_LANGUAGE[''' || n_LC_LANGUAGE || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
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
                        ,null
                        ,:new.LC_LANGUAGE
                        ,null
                        ,:new.LC_COUNTRY
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.OWNER
                        ,:new.OWNER
                        ,:old.LC_LANGUAGE
                        ,:new.LC_LANGUAGE
                        ,:old.LC_COUNTRY
                        ,:new.LC_COUNTRY
                         --
                         );
      --
      insert into LOCALES$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.LC_LANGUAGE
        ,:old.LC_COUNTRY
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.OWNER
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into LOCALES$HIS
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
      --
    else
      -- 'D'
      insert into LOCALES$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.LC_LANGUAGE
        ,:old.LC_COUNTRY
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.OWNER
         --
         );
      --
      insert into LOCALES$HIS
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
end LOCALES$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."LOCALES$TIUD0" ENABLE;
