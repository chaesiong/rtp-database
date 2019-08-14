CREATE TABLE "DL_USER_MANAGEMENT"."LOOKUPS" 
   (	"KEY_CATEGORY" VARCHAR2(64 CHAR) NOT NULL ENABLE, 
	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"PARENT_KEY_CATEGORY" VARCHAR2(64 CHAR), 
	"PARENT_KEY_VALUE" VARCHAR2(32 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR), 
	"DISPLAY_VALUE_SHORT" VARCHAR2(30 CHAR), 
	"DISPLAY_VALUE_ALTERNATIVE" VARCHAR2(200 CHAR), 
	"VALUE_LARGE_DATA_ID" NUMBER(*,0)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS" ADD CONSTRAINT "LOOKUPS$PK" PRIMARY KEY ("KEY_CATEGORY", "KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS" ADD CONSTRAINT "LOOKUPS$UQ00" UNIQUE ("KEY_CATEGORY", "NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS" ADD CONSTRAINT "LOOKUPS$CHK00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS" ADD CONSTRAINT "LOOKUPS$CHK01" CHECK (DML_TYPE in ('I'
                                                                                      ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS" ADD CONSTRAINT "LOOKUPS$CHK02" CHECK (IS_ACTIVE in ('Y'
                                                                                       ,'N')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS" ADD CONSTRAINT "LOOKUPS$FK00" FOREIGN KEY ("PARENT_KEY_CATEGORY", "PARENT_KEY_VALUE")
	  REFERENCES "DL_USER_MANAGEMENT"."LOOKUPS" ("KEY_CATEGORY", "KEY_VALUE") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."KEY_CATEGORY" IS 'Lookup category,e.g. "gender","country"';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."KEY_VALUE" IS 'Key of the lookup. Within a category this key is unique if only the active lookups are considered.';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."PARENT_KEY_CATEGORY" IS 'Lookup category of the parent lookup if there is a hierarchy (e.g. district < country)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."PARENT_KEY_VALUE" IS 'Lookup key of the parent lookup if there is a hierarchy (e.g. district < country)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."DISPLAY_VALUE" IS 'Long version of the lookup value (e.g. country name)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."IS_ACTIVE" IS '"Y" if the lookup is currently active, "N" if not.';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."NOTICE" IS 'Description on the lookup value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."NUM_VALUE" IS 'Numeric lookup value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."LOCALE" IS 'Locale for multilanguage candidates';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."LOOKUPS"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."LOOKUPS"  IS 'Global lookup table';
  CREATE INDEX "DL_USER_MANAGEMENT"."LOOKUPS$IX00" ON "DL_USER_MANAGEMENT"."LOOKUPS" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."LOOKUPS$IX01" ON "DL_USER_MANAGEMENT"."LOOKUPS" ("DML_AT", "DML_BY") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."LOOKUPS$IX02" ON "DL_USER_MANAGEMENT"."LOOKUPS" ("PARENT_KEY_CATEGORY", "PARENT_KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."LOOKUPS$PK" ON "DL_USER_MANAGEMENT"."LOOKUPS" ("KEY_CATEGORY", "KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."LOOKUPS$UQ00" ON "DL_USER_MANAGEMENT"."LOOKUPS" ("KEY_CATEGORY", "NUM_VALUE") 
  ;
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."LOOKUPS$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.LOOKUPS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    14.03.2018  Added
  * WWirns    25.07.2018  Add INS_*-Columns for make history rows
  * WWirns    08.08.2018  Add procedure L_Check_Row4DML
  * WWirns    27.08.2018  Add loosing INS_AT and INS_BY at code point "L_Has_PK_Value_Changed"
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
    --
    if (:new.KEY_CATEGORY != :old.KEY_CATEGORY or :new.KEY_VALUE != :old.KEY_VALUE)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_KEY_CATEGORY in LOOKUPS.KEY_CATEGORY%type
                              ,p_KEY_VALUE    in LOOKUPS.KEY_VALUE %type
                               --,o_"[columnname-n]" in LOOKUPS."[columnname-n]"%type
                               --,n_"[columnname-n]" in LOOKUPS."[columnname-n]"%type
                               --
                               ) is
    --
    --v_vc_Tmp varchar2(1 char);
    --v_n_Tmp  number(1);
    --
  begin
    --
    --
    /*
    if (n_"[columnname-n]" is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_"[columnname-n]"
                                                                           ,o_"[columnname-n]"))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from "XX.XX" t
         where t.KEY_VALUE = n_"[columnname-n]";
        if (v_vc_Tmp != "?")
        then
          Raise_application_error(-20000
                                 ,'The "[columnname-n]"[''' || n_"[columnname-n]" || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The "[columnname-n]"[''' || n_"[columnname-n]" || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    */
    null;
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
                               ,'The row is not updatable! For KEY_CATEGORY[''' || :old.KEY_CATEGORY || ''']/KEY_VALUE[''' || :old.KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    else
      -- 'D'
      if (bitand(:old.ROW_FLAG_MASK
                ,32) = 32)
      then
        -- 32 => prevent delete
        Raise_application_error(-20000
                               ,'The row is not deletable! For KEY_CATEGORY[''' || :old.KEY_CATEGORY || ''']/KEY_VALUE[''' || :old.KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    end if;
    --
  end L_Check_Row4DML;
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
      L_Check_FK_Content(:new.KEY_CATEGORY
                        ,:new.KEY_VALUE
                         --,null
                         --,:new."[columnname-n]"
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_CATEGORY
                        ,:new.KEY_VALUE
                         --,:old."[columnname-n]"
                         --,:new."[columnname-n]"
                         --
                         );
      --
      insert into LOOKUPS$HIS
      values
        (:old.KEY_CATEGORY
        ,:old.KEY_VALUE
        ,:old.PARENT_KEY_CATEGORY
        ,:old.PARENT_KEY_VALUE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
        ,:old.TAG
        ,:old.DISPLAY_VALUE_SHORT
        ,:old.DISPLAY_VALUE_ALTERNATIVE
        ,:old.VALUE_LARGE_DATA_ID
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into LOOKUPS$HIS
          (KEY_CATEGORY
          ,KEY_VALUE
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.KEY_CATEGORY
          ,:old.KEY_VALUE
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
      insert into LOOKUPS$HIS
      values
        (:old.KEY_CATEGORY
        ,:old.KEY_VALUE
        ,:old.PARENT_KEY_CATEGORY
        ,:old.PARENT_KEY_VALUE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
        ,:old.TAG
        ,:old.DISPLAY_VALUE_SHORT
        ,:old.DISPLAY_VALUE_ALTERNATIVE
        ,:old.VALUE_LARGE_DATA_ID
         --
         );
      --
      insert into LOOKUPS$HIS
        (KEY_CATEGORY
        ,KEY_VALUE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_CATEGORY
        ,:old.KEY_VALUE
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
end LOOKUPS$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."LOOKUPS$TIUD0" ENABLE;
