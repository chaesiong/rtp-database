CREATE TABLE "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"OBJECT_ID" VARCHAR2(32) NOT NULL ENABLE, 
	"APP_NAME" VARCHAR2(100 CHAR), 
	"PAGE_ID" NUMBER NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" ADD CONSTRAINT "OBJECT_PAGE_REL$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" ADD CONSTRAINT "OBJECT_PAGE_REL$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                      ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" ADD CONSTRAINT "OBJECT_PAGE_REL$FK00" FOREIGN KEY ("OBJECT_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."OBJECTS" ("ID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL"."OBJECT_ID" IS 'Foreign key to table OBJECTS';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL"."APP_NAME" IS 'APEX-App-Name who is parent of PAGE_ID';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL"."PAGE_ID" IS 'Page ID (as in APEX_[999999].APEX_APPLICATION_PAGES)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL"  IS 'Relations between Objects and apex application pages (assignment of apex aplication pages to objects)';
  CREATE INDEX "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL$IX00" ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" ("OBJECT_ID", "PAGE_ID", "APP_NAME") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL$IX01" ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL$PK" ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" ("ID") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "SERVAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.OBJECT_PAGE_REL
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
  * WWirns    09.08.2018  Add procedure L_Check_Row4DML
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
  procedure L_Check_FK_Content(p_ID in OBJECT_PAGE_REL.ID%type
                               --,o_"[columnname-n]" in OBJECT_PAGE_REL."[columnname-n]"%type
                               --,n_"[columnname-n]" in OBJECT_PAGE_REL."[columnname-n]"%type
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
      insert into OBJECT_PAGE_REL$HIS
      values
        (:old.ID
        ,:old.OBJECT_ID
        ,:old.APP_NAME
        ,:old.PAGE_ID
         --,:old.LOCALE
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
        insert into OBJECT_PAGE_REL$HIS
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
      insert into OBJECT_PAGE_REL$HIS
      values
        (:old.ID
        ,:old.OBJECT_ID
        ,:old.APP_NAME
        ,:old.PAGE_ID
         --,:old.LOCALE
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
      insert into OBJECT_PAGE_REL$HIS
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
end OBJECT_PAGE_REL$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL$TIUD0" ENABLE;
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" 
    after insert or update or delete on dl_user_management.object_page_rel
declare
  l_job number;
begin
  dbms_job.submit(l_job, q'[dbms_mview.refresh( 'dl_user_management.apex_menu_permissions' );]');
end;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."OBJECT_PAGE_REL" ENABLE;
