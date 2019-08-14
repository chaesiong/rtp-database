CREATE TABLE "DL_COMMON"."APEX_MENU" 
   (	"KEY_VALUE" NUMBER(15,0) NOT NULL ENABLE, 
	"PARENT_KEY_VALUE" NUMBER(15,0), 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"TARGET" VARCHAR2(4000 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_CURRENT_LIST_ENTRY" VARCHAR2(3 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"IMAGE" VARCHAR2(255 CHAR), 
	"IMAGE_ATTRIBUTE" VARCHAR2(255 CHAR), 
	"IMAGE_ALT_ATTRIBUTE" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"APP_ALIAS" VARCHAR2(255 CHAR), 
	"PAGE_ID" NUMBER(10,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR) DEFAULT null NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"CHILD_PAGES" VARCHAR2(64 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."APEX_MENU" ADD CONSTRAINT "APEX_MENU$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_MENU" ADD CONSTRAINT "APEX_MENU$CHK$C00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_MENU" ADD CONSTRAINT "APEX_MENU$CHK$C01" CHECK (DML_TYPE in ('I'
                                                                                   ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_MENU" ADD CONSTRAINT "APEX_MENU$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."PARENT_KEY_VALUE" IS 'Page ID from Parent';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."DISPLAY_VALUE" IS 'Text to appear as list Entry';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."TARGET" IS 'Target URL to branch to when list entry is selected';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."IS_CURRENT_LIST_ENTRY" IS 'Flag: Y.es or N.o';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."IMAGE" IS 'Icon of Apex Menu Entrance';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."IMAGE_ATTRIBUTE" IS 'Icon Attribute';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."IMAGE_ALT_ATTRIBUTE" IS 'Image Alt Attribute';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."APP_ALIAS" IS 'Application Alias where the Page belongs to';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."PAGE_ID" IS 'Page ID from Application';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."OWNER" IS 'Owner who has inserted and is responsible for this row.';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU"."CHILD_PAGES" IS 'Pages that have the same Menu Entry comma separated';
   COMMENT ON TABLE "DL_COMMON"."APEX_MENU"  IS 'Menu items for a dynamic list that builds the hierarchical menu in APEX';
  CREATE INDEX "DL_COMMON"."APEX_MENU$IX00" ON "DL_COMMON"."APEX_MENU" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."APEX_MENU$IX01" ON "DL_COMMON"."APEX_MENU" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."APEX_MENU$PK" ON "DL_COMMON"."APEX_MENU" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."APEX_MENU" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."APEX_MENU" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."APEX_MENU" TO "DL_USER_MANAGEMENT";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."APEX_MENU" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."APEX_MENU" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."APEX_MENU" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."APEX_MENU$TIUD0" 
  for insert or update or delete on DL_COMMON.APEX_MENU
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * CFunke    15.12.2017  Added
  * WWirns    20.12.2017  Trigger was in invalid state, because of insert into XX$HIS!
  * WWirns    02.01.2018  Add columns
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
  procedure L_Check_FK_Content(p_KEY_VALUE in APEX_MENU.KEY_VALUE%type
                              ,o_OWNER     in APEX_MENU.OWNER%type
                              ,n_OWNER     in APEX_MENU.OWNER%type
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
      insert into APEX_MENU$HIS
      values
        (:old.KEY_VALUE
        ,:old.PARENT_KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.TARGET
        ,:old.DISPLAY_ORDER
        ,:old.IS_CURRENT_LIST_ENTRY
        ,:old.IMAGE
        ,:old.IMAGE_ATTRIBUTE
        ,:old.IMAGE_ALT_ATTRIBUTE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.APP_ALIAS
        ,:old.PAGE_ID
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
        insert into APEX_MENU$HIS
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
      insert into APEX_MENU$HIS
      values
        (:old.KEY_VALUE
        ,:old.PARENT_KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.TARGET
        ,:old.DISPLAY_ORDER
        ,:old.IS_CURRENT_LIST_ENTRY
        ,:old.IMAGE
        ,:old.IMAGE_ATTRIBUTE
        ,:old.IMAGE_ALT_ATTRIBUTE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.APP_ALIAS
        ,:old.PAGE_ID
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into APEX_MENU$HIS
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
  after statement is
  begin
    --
    v_DML_TYPE := null;
    --
  end after statement;
  --
end APEX_MENU$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."APEX_MENU$TIUD0" ENABLE;
