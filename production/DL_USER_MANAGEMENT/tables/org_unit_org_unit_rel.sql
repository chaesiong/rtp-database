CREATE TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"ORG_UNIT_ID" VARCHAR2(32 CHAR), 
	"ORG_UNIT_DN" VARCHAR2(256 CHAR), 
	"MEMBER_ORG_UNIT_ID" VARCHAR2(32 CHAR), 
	"MEMBER_ORG_UNIT_DN" VARCHAR2(256 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$UQ00" UNIQUE ("MEMBER_ORG_UNIT_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$UQ01" UNIQUE ("MEMBER_ORG_UNIT_DN")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                                  ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$CHK02" CHECK ((ORG_UNIT_ID is not null and MEMBER_ORG_UNIT_ID is not null and ORG_UNIT_ID != MEMBER_ORG_UNIT_ID and ORG_UNIT_DN is null and MEMBER_ORG_UNIT_DN is null)
                                                                                                      --
                                                                                                      or (ORG_UNIT_ID is null and MEMBER_ORG_UNIT_ID is null and ORG_UNIT_DN is not null and MEMBER_ORG_UNIT_DN is not null and ORG_UNIT_DN != MEMBER_ORG_UNIT_DN)
                                                                                                      --
                                                                                                      ) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$FK00" FOREIGN KEY ("ORG_UNIT_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ORG_UNITS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$FK01" FOREIGN KEY ("MEMBER_ORG_UNIT_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ORG_UNITS" ("ID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."ORG_UNIT_ID" IS 'ORG_UNITS.ID of the organisation unit';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."ORG_UNIT_DN" IS '"Distinguish Name" (DN) of the organisation unit from "Active Directory" (AD)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."MEMBER_ORG_UNIT_ID" IS 'ORG_UNITS.ID of the organisation unit who is a member of ORG_UNIT_ID';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."MEMBER_ORG_UNIT_DN" IS '"Distinguish Name" (DN) from "Active Directory" (AD) of the organisation unit who is a member of ORG_UNIT_DN';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"  IS 'Intersection table between ORG_UNITS and ORG_UNITS, at which the organisation unit is a member of an other organisation unit and currently the organisation unit can only be assigned to ONE organisation unit';
  CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$IX00" ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$PK" ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$UQ00" ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ("MEMBER_ORG_UNIT_ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$UQ01" ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ("MEMBER_ORG_UNIT_DN") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "SERVAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.ORG_UNIT_ORG_UNIT_REL
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    21.08.2018  Added
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
  procedure L_Check_FK_Content(p_ID                 in ORG_UNIT_ORG_UNIT_REL.ID%type
                              ,o_ORG_UNIT_ID        in ORG_UNIT_ORG_UNIT_REL.ORG_UNIT_ID%type
                              ,n_ORG_UNIT_ID        in ORG_UNIT_ORG_UNIT_REL.ORG_UNIT_ID%type
                              ,o_MEMBER_ORG_UNIT_ID in ORG_UNIT_ORG_UNIT_REL.MEMBER_ORG_UNIT_ID%type
                              ,n_MEMBER_ORG_UNIT_ID in ORG_UNIT_ORG_UNIT_REL.MEMBER_ORG_UNIT_ID%type
                               --
                               ) is
    --
    --v_vc_Tmp varchar2(1 char);
    v_n_Tmp number(1);
    --
  begin
    --
    --
    if (n_ORG_UNIT_ID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_ORG_UNIT_ID
                                                                     ,o_ORG_UNIT_ID))
    then
      begin
        select t.IS_ACTIVE
          into v_n_Tmp
          from ORG_UNITS t
         where t.ID = n_ORG_UNIT_ID;
        if (v_n_Tmp != 1)
        then
          Raise_application_error(-20000
                                 ,'The ORG_UNIT_ID[''' || n_ORG_UNIT_ID || '''] is not active! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The ORG_UNIT_ID[''' || n_ORG_UNIT_ID || '''] does not exist! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_MEMBER_ORG_UNIT_ID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_MEMBER_ORG_UNIT_ID
                                                                            ,o_MEMBER_ORG_UNIT_ID))
    then
      begin
        select t.IS_ACTIVE
          into v_n_Tmp
          from ORG_UNITS t
         where t.ID = n_MEMBER_ORG_UNIT_ID;
        if (v_n_Tmp != 1)
        then
          Raise_application_error(-20000
                                 ,'The MEMBER_ORG_UNIT_ID[''' || n_MEMBER_ORG_UNIT_ID || '''] is not active! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The MEMBER_ORG_UNIT_ID[''' || n_MEMBER_ORG_UNIT_ID || '''] does not exist! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
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
                        ,null
                        ,:new.ORG_UNIT_ID
                        ,null
                        ,:new.MEMBER_ORG_UNIT_ID
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                        ,:old.ORG_UNIT_ID
                        ,:new.ORG_UNIT_ID
                        ,:old.MEMBER_ORG_UNIT_ID
                        ,:new.MEMBER_ORG_UNIT_ID
                         --
                         );
      --
      insert into ORG_UNIT_ORG_UNIT_REL$HIS
      values
        (:old.ID
        ,:old.ORG_UNIT_ID
        ,:old.ORG_UNIT_DN
        ,:old.MEMBER_ORG_UNIT_ID
        ,:old.MEMBER_ORG_UNIT_DN
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
        insert into ORG_UNIT_ORG_UNIT_REL$HIS
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
      insert into ORG_UNIT_ORG_UNIT_REL$HIS
      values
        (:old.ID
        ,:old.ORG_UNIT_ID
        ,:old.ORG_UNIT_DN
        ,:old.MEMBER_ORG_UNIT_ID
        ,:old.MEMBER_ORG_UNIT_DN
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
      insert into ORG_UNIT_ORG_UNIT_REL$HIS
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
end ORG_UNIT_ORG_UNIT_REL$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$TIUD0" ENABLE;
