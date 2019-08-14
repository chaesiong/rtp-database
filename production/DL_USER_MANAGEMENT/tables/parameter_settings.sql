CREATE TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"DISPLAY_NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100 CHAR), 
	"IS_MODIFIABLE_IN_APEX" NUMBER NOT NULL ENABLE, 
	"SORT_ORDER" NUMBER, 
	"VALUE_TYPE" NUMBER, 
	"DEFAULT_STR" VARCHAR2(30 CHAR), 
	"DEFAULT_NUM" NUMBER, 
	"DEFAULT_IS_ON" NUMBER, 
	"VALUE_STR" VARCHAR2(30 CHAR), 
	"VALUE_NUM" NUMBER, 
	"VALUE_IS_ON" NUMBER, 
	"ACTIVE_STR" VARCHAR2(30 CHAR) GENERATED ALWAYS AS (NVL("VALUE_STR","DEFAULT_STR")) VIRTUAL , 
	"ACTIVE_NUM" NUMBER GENERATED ALWAYS AS (NVL("VALUE_NUM","DEFAULT_NUM")) VIRTUAL , 
	"ACTIVE_IS_ON" NUMBER GENERATED ALWAYS AS (NVL("VALUE_IS_ON","DEFAULT_IS_ON")) VIRTUAL , 
	"ACTIVE_VALUE" VARCHAR2(4000 CHAR) GENERATED ALWAYS AS (COALESCE(NVL("VALUE_STR","DEFAULT_STR"),TO_CHAR(NVL("VALUE_NUM","DEFAULT_NUM")),CASE NVL("VALUE_IS_ON","DEFAULT_IS_ON") WHEN 1 THEN 'On' ELSE 'Off' END )) VIRTUAL , 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAMETER_SETTINGS$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAMETER_SETTINGS$UQ00" UNIQUE ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_MODIFIABLE_CK" CHECK (IS_MODIFIABLE_IN_APEX = 1 or IS_MODIFIABLE_IN_APEX = 0) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_DEF_VALUE_CK" CHECK ((VALUE_TYPE = 1 and DEFAULT_STR is not null and DEFAULT_NUM is null and DEFAULT_IS_ON is null) or (VALUE_TYPE = 2 and DEFAULT_STR is null and DEFAULT_NUM is not null and DEFAULT_IS_ON is null) or
                                                                                                   (VALUE_TYPE = 3 and DEFAULT_STR is null and DEFAULT_NUM is null and DEFAULT_IS_ON is not null)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_IS_ON_CK" CHECK (VALUE_IS_ON in (1
                                                                                                              ,0)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_DEF_IS_ON_CK" CHECK (DEFAULT_IS_ON in (1
                                                                                                                    ,0)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_VALUE_CK" CHECK ((VALUE_TYPE = 1 and VALUE_NUM is null and VALUE_IS_ON is null) or (VALUE_TYPE = 2 and VALUE_STR is null and VALUE_IS_ON is null) or (VALUE_TYPE = 3 and VALUE_STR is null and VALUE_NUM is null)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAMETER_SETTINGS$CHK00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAMETER_SETTINGS$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                            ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ID" IS 'Artifical primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."NAME" IS 'Name of the parameter';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DISPLAY_NAME" IS 'Name to be displayed in maintenance application';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DESCRIPTION" IS 'Description of the parameter';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."IS_MODIFIABLE_IN_APEX" IS '1 - to be maintainable in apex, 0 - not to be maintainable in apex';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."SORT_ORDER" IS 'Sort order in maintenance application. The lower the number, the higher is the display position of the parameter in the list';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."VALUE_TYPE" IS '1 if the value is a string, 2 if the value is numeric, 3 if the value is boolean';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DEFAULT_STR" IS 'default string value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DEFAULT_NUM" IS 'default numeric value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DEFAULT_IS_ON" IS 'default "boolean" value (1 means "is on", 0 means "is off")';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."VALUE_STR" IS 'string value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."VALUE_NUM" IS 'numeric value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."VALUE_IS_ON" IS '"boolean" value (1 means "is on", 0 means "is off")';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ACTIVE_STR" IS 'virtual column: active string value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ACTIVE_NUM" IS 'virtual column: active numeric value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ACTIVE_IS_ON" IS 'virtual column: active value (converted to string format)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"  IS 'Parameter settings for user management';
  CREATE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$IX00" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ("NAME", "DISPLAY_NAME", "SORT_ORDER") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$IX01" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$PK" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$UQ00" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ("NAME") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.PARAMETER_SETTINGS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    13.03.2018  Added
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
    if (:new.ID != :old.ID or :new.NAME != :old.NAME)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_ID in PARAMETER_SETTINGS.ID%type
                               --,o_"[columnname-n]" in PARAMETER_SETTINGS."[columnname-n]"%type
                               --,n_"[columnname-n]" in PARAMETER_SETTINGS."[columnname-n]"%type
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
                               ,'The row is not updatable! For ID[''' || :old.ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    else
      -- 'D'
      if (bitand(:old.ROW_FLAG_MASK
                ,32) = 32)
      then
        -- 32 => prevent delete
        Raise_application_error(-20000
                               ,'The row is not deletable! For ID[''' || :old.ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
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
      L_Check_FK_Content(:new.ID
                         --,null
                         --,:new."[columnname-n]"
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                         --,:old."[columnname-n]"
                         --,:new."[columnname-n]"
                         --
                         );
      --
      insert into PARAMETER_SETTINGS$HIS
        (ID
        ,name
        ,DISPLAY_NAME
        ,DESCRIPTION
        ,IS_MODIFIABLE_IN_APEX
        ,SORT_ORDER
        ,VALUE_TYPE
        ,DEFAULT_STR
        ,DEFAULT_NUM
        ,DEFAULT_IS_ON
        ,VALUE_STR
        ,VALUE_NUM
        ,VALUE_IS_ON
         --,ACTIVE_STR
         --,ACTIVE_NUM
         --,ACTIVE_IS_ON
         --,ACTIVE_VALUE
        ,LOCALE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE
        ,ROW_FLAG_MASK
        ,TAG
         --
         )
      values
        (:old.ID
        ,:old.NAME
        ,:old.DISPLAY_NAME
        ,:old.DESCRIPTION
        ,:old.IS_MODIFIABLE_IN_APEX
        ,:old.SORT_ORDER
        ,:old.VALUE_TYPE
        ,:old.DEFAULT_STR
        ,:old.DEFAULT_NUM
        ,:old.DEFAULT_IS_ON
        ,:old.VALUE_STR
        ,:old.VALUE_NUM
        ,:old.VALUE_IS_ON
         --,:old.ACTIVE_STR
         --,:old.ACTIVE_NUM
         --,:old.ACTIVE_IS_ON
         --,:old.ACTIVE_VALUE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
        ,:old.TAG
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into PARAMETER_SETTINGS$HIS
          (ID
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.ID
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
      insert into PARAMETER_SETTINGS$HIS
        (ID
        ,name
        ,DISPLAY_NAME
        ,DESCRIPTION
        ,IS_MODIFIABLE_IN_APEX
        ,SORT_ORDER
        ,VALUE_TYPE
        ,DEFAULT_STR
        ,DEFAULT_NUM
        ,DEFAULT_IS_ON
        ,VALUE_STR
        ,VALUE_NUM
        ,VALUE_IS_ON
         --,ACTIVE_STR
         --,ACTIVE_NUM
         --,ACTIVE_IS_ON
         --,ACTIVE_VALUE
        ,LOCALE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE
        ,ROW_FLAG_MASK
        ,TAG
         --
         )
      values
        (:old.ID
        ,:old.NAME
        ,:old.DISPLAY_NAME
        ,:old.DESCRIPTION
        ,:old.IS_MODIFIABLE_IN_APEX
        ,:old.SORT_ORDER
        ,:old.VALUE_TYPE
        ,:old.DEFAULT_STR
        ,:old.DEFAULT_NUM
        ,:old.DEFAULT_IS_ON
        ,:old.VALUE_STR
        ,:old.VALUE_NUM
        ,:old.VALUE_IS_ON
         --,:old.ACTIVE_STR
         --,:old.ACTIVE_NUM
         --,:old.ACTIVE_IS_ON
         --,:old.ACTIVE_VALUE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
        ,:old.TAG
         --
         );
      --
      insert into PARAMETER_SETTINGS$HIS
        (ID
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.ID
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
end PARAMETER_SETTINGS$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$TIUD0" ENABLE;
