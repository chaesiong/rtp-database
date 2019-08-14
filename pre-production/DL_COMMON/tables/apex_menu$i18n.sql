CREATE TABLE "DL_COMMON"."APEX_MENU$I18N" 
   (	"KEY_VALUE" NUMBER(15,0) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."APEX_MENU$I18N" ADD CONSTRAINT "APEX_MENU$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_MENU$I18N" ADD CONSTRAINT "APEX_MENU$I18N$CHK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_MENU$I18N" ADD CONSTRAINT "APEX_MENU$I18N$CHK01" CHECK (DML_TYPE in ('I'
                                                                                           ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_MENU$I18N" ADD CONSTRAINT "APEX_MENU$I18N$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_COMMON"."APEX_MENU" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_COMMON"."APEX_MENU$I18N" ADD CONSTRAINT "APEX_MENU$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."DISPLAY_VALUE" IS 'Text to appear as list Entry';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."APEX_MENU$I18N"."OWNER" IS 'Owner who has inserted and is responsible for this row.';
   COMMENT ON TABLE "DL_COMMON"."APEX_MENU$I18N"  IS 'Translation Apex Menu';
  CREATE INDEX "DL_COMMON"."APEX_MENU$I18N$IX02" ON "DL_COMMON"."APEX_MENU$I18N" ("DISPLAY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."APEX_MENU$I18N$PK" ON "DL_COMMON"."APEX_MENU$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$I18N" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."APEX_MENU$I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."APEX_MENU$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."APEX_MENU$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."APEX_MENU$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."APEX_MENU$I18N" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."APEX_MENU$I18N$TIUD0" 
  for insert or update or delete on DL_COMMON.APEX_MENU$I18N
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
  * WWirns    23.02.2018  Add columns INS_AT and INS_BY
  * WWirns    06.04.2018  Refresh trigger from template
  * WWirns    09.04.2018  Add column ROW_FLAG_MASK
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
  * -- No historization for language table implemented yet
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
      null;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      insert into APEX_MENU$I18N$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        insert into APEX_MENU$I18N$HIS
          (KEY_VALUE
          ,LOCALE
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,:old.LOCALE
          ,systimestamp
          ,DL_COMMON.PKG_SESSION.Get_AUDIT_User()
          ,'D'
           --
           );
      end if;
      --
    else
      -- 'D'
      insert into APEX_MENU$I18N$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      insert into APEX_MENU$I18N$HIS
        (KEY_VALUE
        ,LOCALE
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
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
end APEX_MENU$I18N$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."APEX_MENU$I18N$TIUD0" ENABLE;
