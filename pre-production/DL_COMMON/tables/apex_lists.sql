CREATE TABLE "DL_COMMON"."APEX_LISTS" 
   (	"KEY_VALUE" NUMBER(15,0), 
	"PARENT_KEY_VALUE" NUMBER(15,0), 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"LIST_NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"TARGET" VARCHAR2(4000 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_CURRENT_LIST_ENTRY" VARCHAR2(3 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"IMAGE" VARCHAR2(255 CHAR), 
	"IMAGE_ATTRIBUTE" VARCHAR2(255 CHAR), 
	"IMAGE_ALT_ATTRIBUTE" VARCHAR2(255 CHAR), 
	"ATTRIBUTE1" VARCHAR2(255 CHAR), 
	"ATTRIBUTE2" VARCHAR2(255 CHAR), 
	"ATTRIBUTE3" VARCHAR2(255 CHAR), 
	"ATTRIBUTE4" VARCHAR2(255 CHAR), 
	"ATTRIBUTE5" VARCHAR2(255 CHAR), 
	"ATTRIBUTE6" VARCHAR2(255 CHAR), 
	"ATTRIBUTE7" VARCHAR2(255 CHAR), 
	"ATTRIBUTE8" VARCHAR2(255 CHAR), 
	"ATTRIBUTE9" VARCHAR2(255 CHAR), 
	"ATTRIBUTE10" VARCHAR2(255 CHAR), 
	"IS_EXTERNAL" VARCHAR2(1 CHAR), 
	"AUTHORIZATION_SCHEME" VARCHAR2(255 CHAR), 
	"AUTH_OBJECT_ID" VARCHAR2(32 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"APP_ALIAS" VARCHAR2(255 CHAR), 
	"PAGE_ID" NUMBER(10,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR) DEFAULT null NOT NULL ENABLE, 
	"CHILD_PAGES" VARCHAR2(64 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."APEX_LISTS" ADD CONSTRAINT "APEX_LISTS$CHK$C00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_LISTS" ADD CONSTRAINT "APEX_LISTS$CHK$C01" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_LISTS" ADD CONSTRAINT "APEX_LISTS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_LISTS" ADD CONSTRAINT "APEX_LISTS$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."PARENT_KEY_VALUE" IS 'Key Value from Parent';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."LIST_NAME" IS 'Name of the list';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DISPLAY_VALUE" IS 'Text to appear as list Entry';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."TARGET" IS 'Target URL to branch to when list entry is selected';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IS_CURRENT_LIST_ENTRY" IS 'Flag: Y.es or N.o';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IMAGE" IS 'Icon of Apex Menu Entrance';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IMAGE_ATTRIBUTE" IS 'Icon Attribute';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IMAGE_ALT_ATTRIBUTE" IS 'Image Alt Attribute';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE1" IS 'Substitution string #A01#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE2" IS 'Substitution string #A02#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE3" IS 'Substitution string #A03#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE4" IS 'Substitution string #A04#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE5" IS 'Substitution string #A05#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE6" IS 'Substitution string #A06#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE7" IS 'Substitution string #A07#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE8" IS 'Substitution string #A08#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE9" IS 'Substitution string #A09#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ATTRIBUTE10" IS 'Substitution string #A010#';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."IS_EXTERNAL" IS 'Is external link?';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."AUTHORIZATION_SCHEME" IS 'Authorization scheme to be authorized against';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."AUTH_OBJECT_ID" IS 'Object ID to be authorized against';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."APP_ALIAS" IS 'Application Alias where the Page belongs to';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."PAGE_ID" IS 'Page ID from Application';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."OWNER" IS 'Owner who has inserted and is responsible for this row.';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."CHILD_PAGES" IS 'Pages that have the same Menu Entry comma separated';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_LISTS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON TABLE "DL_COMMON"."APEX_LISTS"  IS 'List items for a dynamic list that builds the hierarchical list in APEX';
  CREATE INDEX "DL_COMMON"."APEX_LISTS$IX00" ON "DL_COMMON"."APEX_LISTS" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."APEX_LISTS$IX01" ON "DL_COMMON"."APEX_LISTS" ("OWNER") 
  ;
CREATE INDEX "DL_COMMON"."APEX_LISTS$IX02" ON "DL_COMMON"."APEX_LISTS" ("LIST_NAME") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."APEX_LISTS$PK" ON "DL_COMMON"."APEX_LISTS" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."APEX_LISTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."APEX_LISTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."APEX_LISTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_LISTS" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."APEX_LISTS$TIUD0" 
  for insert or update or delete on DL_COMMON.APEX_LISTS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MSCS      07.02.2019  Added
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
  procedure L_Check_FK_Content(p_KEY_VALUE in APEX_LISTS.KEY_VALUE%type
                              ,o_OWNER     in APEX_LISTS.OWNER%type
                              ,n_OWNER     in APEX_LISTS.OWNER%type
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
      /* -- pending
	  insert into APEX_LISTS$HIS
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
	  */
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        /* -- pending
		insert into APEX_LISTS$HIS
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
		*/
		null;
      end if;
      --
    else
      -- 'D'
      /* -- pending
	  insert into APEX_LISTS$HIS
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
	  */
      --
      /* -- pending
	  insert into APEX_LISTS$HIS
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
	  */
	  null;
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
end APEX_LISTS$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."APEX_LISTS$TIUD0" ENABLE;
