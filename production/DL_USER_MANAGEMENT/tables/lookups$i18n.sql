CREATE TABLE "DL_USER_MANAGEMENT"."LOOKUPS$I18N" 
   (	"KEY_CATEGORY" VARCHAR2(64 CHAR) NOT NULL ENABLE, 
	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"DISPLAY_VALUE_SHORT" VARCHAR2(30 CHAR), 
	"DISPLAY_VALUE_ALTERNATIVE" VARCHAR2(200 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS$I18N" ADD CONSTRAINT "LOOKUPS$I18N$PK" PRIMARY KEY ("KEY_CATEGORY", "KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS$I18N" ADD CONSTRAINT "LOOKUPS$I18N$CHK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS$I18N" ADD CONSTRAINT "LOOKUPS$I18N$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS$I18N" ADD CONSTRAINT "LOOKUPS$I18N$FK00" FOREIGN KEY ("KEY_CATEGORY", "KEY_VALUE")
	  REFERENCES "DL_USER_MANAGEMENT"."LOOKUPS" ("KEY_CATEGORY", "KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS$I18N" ADD CONSTRAINT "LOOKUPS$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."LOOKUPS$I18N$IX02" ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" ("DISPLAY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."LOOKUPS$I18N$PK" ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" ("KEY_CATEGORY", "KEY_VALUE", "LOCALE") 
  ;
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$I18N" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."LOOKUPS$I18N$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.LOOKUPS$I18N
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
    if (:new.KEY_CATEGORY != :old.KEY_CATEGORY or :new.KEY_VALUE != :old.KEY_VALUE or :new.LOCALE != :old.LOCALE)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
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
      null;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      insert into LOOKUPS$I18N$HIS
      values
        (:old.KEY_CATEGORY
        ,:old.KEY_VALUE
        ,:old.DISPLAY_VALUE
        ,:old.NOTICE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.DISPLAY_VALUE_SHORT
        ,:old.DISPLAY_VALUE_ALTERNATIVE
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        insert into LOOKUPS$I18N$HIS
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
      insert into LOOKUPS$I18N$HIS
      values
        (:old.KEY_CATEGORY
        ,:old.KEY_VALUE
        ,:old.DISPLAY_VALUE
        ,:old.NOTICE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.DISPLAY_VALUE_SHORT
        ,:old.DISPLAY_VALUE_ALTERNATIVE
         --
         );
      --
      insert into LOOKUPS$I18N$HIS
        (KEY_CATEGORY
        ,KEY_VALUE
        ,LOCALE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_CATEGORY
        ,:old.KEY_VALUE
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
  after statement is
  begin
    --
    v_DML_TYPE := null;
    --
  end after statement;
  --
end LOOKUPS$I18N$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."LOOKUPS$I18N$TIUD0" ENABLE;
