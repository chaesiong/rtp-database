CREATE TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"USER_ID" VARCHAR2(256 CHAR), 
	"USER_SOURCE" NUMBER, 
	"APP_NAME" VARCHAR2(100 CHAR), 
	"OPERATION" NUMBER, 
	"COMMENTS" VARCHAR2(500 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" ADD CONSTRAINT "ACTIVITIES$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" ADD CONSTRAINT "ACTIVITIES$CHK00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" ADD CONSTRAINT "ACTIVITIES$CHK01" CHECK (DML_TYPE in ('I'
                                                                                            ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" ADD CONSTRAINT "ACTIVITIES$CHK02" CHECK (OPERATION in (1
                                                                                             ,2
                                                                                             ,3)) ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."USER_ID" IS 'DN if the user is from LDAP, users.id if the user is from Dermalog User Management';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."USER_SOURCE" IS '1 - if the user is from LDAP, 2 if the user is from Dermalog User Management';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."APP_NAME" IS 'Application Name';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."OPERATION" IS '1 - LOGIN, 2 - LOGOUT, 3 - FAILED LOGIN ATTEMPT. See lookup category user_operation.';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."COMMENTS" IS 'Comments on Operation';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."ACTIVITIES"  IS 'User activities';
  CREATE INDEX "DL_USER_MANAGEMENT"."ACTIVITIES$IX00" ON "DL_USER_MANAGEMENT"."ACTIVITIES" ("USER_ID", "APP_NAME") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."ACTIVITIES$IX01" ON "DL_USER_MANAGEMENT"."ACTIVITIES" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ACTIVITIES$PK" ON "DL_USER_MANAGEMENT"."ACTIVITIES" ("ID") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."ACTIVITIES$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.ACTIVITIES
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
    if (:new.ID != :old.ID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_ID in ACTIVITIES.ID%type
                               --,o_"[columnname-n]" in ACTIVITIES."[columnname-n]"%type
                               --,n_"[columnname-n]" in ACTIVITIES."[columnname-n]"%type
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
      insert into ACTIVITIES$HIS
      values
        (:old.ID
        ,:old.USER_ID
        ,:old.USER_SOURCE
        ,:old.APP_NAME
        ,:old.OPERATION
        ,:old.COMMENTS
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
        insert into ACTIVITIES$HIS
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
      insert into ACTIVITIES$HIS
      values
        (:old.ID
        ,:old.USER_ID
        ,:old.USER_SOURCE
        ,:old.APP_NAME
        ,:old.OPERATION
        ,:old.COMMENTS
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
      insert into ACTIVITIES$HIS
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
end ACTIVITIES$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."ACTIVITIES$TIUD0" ENABLE;
