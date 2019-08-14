CREATE TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(250 CHAR), 
	"STREET" VARCHAR2(250 CHAR), 
	"CITY" VARCHAR2(130 CHAR), 
	"STATE_PROVINCE" VARCHAR2(130 CHAR), 
	"POSTCODE" VARCHAR2(40 CHAR), 
	"COUNTRY" VARCHAR2(32 CHAR), 
	"CONTACT_INFO" VARCHAR2(500 CHAR), 
	"SORT_ORDER" NUMBER, 
	"IS_ACTIVE" NUMBER DEFAULT ON NULL 1 NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS_UN" UNIQUE ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$CHK00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$CHK01" CHECK (DML_TYPE in ('I'
                                                                                          ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$CHK02" CHECK (IS_ACTIVE in (0
                                                                                           ,1)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$FK00" FOREIGN KEY ("COUNTRY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."NAME" IS 'Name of the organisation unit';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."DESCRIPTION" IS 'Description of the organisation unit';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."CONTACT_INFO" IS 'Freeform text for how to contact this organisation unit, for example Telefon-/Telefax-Number, eMail-Address , ...';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."SORT_ORDER" IS 'Sort order in maintenance application. The lower the number, the higher is the display position of the organisation unit in the list';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."IS_ACTIVE" IS '1 if the organisation unit is curently active, else 0';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."ORG_UNITS"  IS 'Organisation units';
  CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$IX00" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("NAME", "SORT_ORDER") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$IX01" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("DML_AT", "DML_BY") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$IX02" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("COUNTRY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$PK" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS_UN" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("NAME") 
  ;
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."ORG_UNITS$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.ORG_UNITS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * WWirns    21.08.2018  Added as copy of template LOOKUP-1.2.4
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
    --
    if (:new.ID != :old.ID
       --
       -- LOOP-PK-Column-n: PK is a surrogate key and any natural PK exists also as a unique constraints/indexes!
       or :new.NAME != :old.NAME
       -- END LOOP-PK-Column-n:
       --
       )
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
  procedure L_Check_FK_Content(p_ID in ORG_UNITS.ID%type
                               -- LOOP-PK-Column-n:
                               --,p_"[pk-columnname-n]" in ORG_UNITS."[pk-columnname-n]"%type
                               -- END LOOP-PK-Column-n:
                               --,o_OWNER in ORG_UNITS.OWNER%type
                               --,n_OWNER in ORG_UNITS.OWNER%type
                               -- LOOP-FK-Column-n:
                              ,o_COUNTRY in ORG_UNITS.COUNTRY%type
                              ,n_COUNTRY in ORG_UNITS.COUNTRY%type
                               -- END LOOP-FK-Column-n:
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --v_n_Tmp  number(1);
    --
  begin
    --
    --
    -- LOOP-FK-Column-n:
    --
    --
    if (n_COUNTRY is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_COUNTRY
                                                                 ,o_COUNTRY))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.COUNTRIES t
         where t.KEY_VALUE = n_COUNTRY;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 , 'The COUNTRY[''' || n_COUNTRY || '''] is not active! For ID[''' || p_ID || ''']'
                                  -- LOOP-PK-Column-n:
                                  ----
                                  --|| '/"[pk-columnname-n]"[''' || :old."[pk-columnname-n]" || ''']'
                                  -- END LOOP-PK-Column-n:
                                  --
                                   || ', DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 , 'The COUNTRY[''' || n_COUNTRY || '''] does not exist! For ID[''' || p_ID || ''']'
                                  -- LOOP-PK-Column-n:
                                  ----
                                  --|| '/"[pk-columnname-n]"[''' || :old."[pk-columnname-n]" || ''']'
                                  -- END LOOP-PK-Column-n:
                                  --
                                   || ', DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    -- END LOOP-FK-Column-n:
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
                               , 'The row is not updatable! For ID[''' || :old.ID || ''']'
                                -- LOOP-PK-Column-n:
                                ----
                                --|| '/"[pk-columnname-n]"[''' || :old."[pk-columnname-n]" || ''']'
                                -- END LOOP-PK-Column-n:
                                --
                                 || ', DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    else
      -- 'D'
      if (bitand(:old.ROW_FLAG_MASK
                ,32) = 32)
      then
        -- 32 => prevent delete
        Raise_application_error(-20000
                               , 'The row is not deletable! For ID[''' || :old.ID || ''']'
                                -- LOOP-PK-Column-n:
                                ----
                                --|| '/"[pk-columnname-n]"[''' || :old."[pk-columnname-n]" || ''']'
                                -- END LOOP-PK-Column-n:
                                --
                                 || ', DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
      --
    end if;
    --
  end L_Check_Row4DML;
  --
  -- BEGIN: NOT GENERATED AREA
  --

  --
  -- END: NOT GENERATED AREA
  --
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
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
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
    L_Check_Row4DML();
    --
    if (v_DML_TYPE = 'I')
    then
      --
      -- Begin:PK is a surrogate key
      if (:new.ID is null)
      then
        --
        -- BEGIN: NOT GENERATED AREA
        --
        :new.ID := SYS_GUID();
        --
        -- END: NOT GENERATED AREA
        --
      end if;
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
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
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
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
    --
    if (v_DML_TYPE = 'I')
    then
      --
      L_Check_FK_Content(:new.ID
                         -- LOOP-PK-Column-n:
                         --,:new."[pk-columnname-n]"
                         -- END LOOP-PK-Column-n:
                         --,null
                         --,:new.OWNER
                         -- LOOP-FK-Column-n:
                        ,null
                        ,:new.COUNTRY
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                         -- LOOP-PK-Column-n:
                         --,:new."[pk-columnname-n]"
                         -- END LOOP-PK-Column-n:
                         --,:old.OWNER
                         --,:new.OWNER
                         -- LOOP-FK-Column-n:
                        ,:old.COUNTRY
                        ,:new.COUNTRY
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
      insert into ORG_UNITS$HIS
      values
        (:old.ID
        ,:old.NAME
        ,:old.DESCRIPTION
        ,:old.STREET
        ,:old.CITY
        ,:old.STATE_PROVINCE
        ,:old.POSTCODE
        ,:old.COUNTRY
        ,:old.CONTACT_INFO
        ,:old.SORT_ORDER
        ,:old.IS_ACTIVE
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
        insert into ORG_UNITS$HIS
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
      insert into ORG_UNITS$HIS
      values
        (:old.ID
        ,:old.NAME
        ,:old.DESCRIPTION
        ,:old.STREET
        ,:old.CITY
        ,:old.STATE_PROVINCE
        ,:old.POSTCODE
        ,:old.COUNTRY
        ,:old.CONTACT_INFO
        ,:old.SORT_ORDER
        ,:old.IS_ACTIVE
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
      insert into ORG_UNITS$HIS
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
  /** ======================================================
  * AFTER STATEMENT
  * =======================================================
  */
  after statement is
  begin
    --
    -- BEGIN: NOT GENERATED AREA
    --

    --
    -- END: NOT GENERATED AREA
    --
    --
    v_DML_TYPE := null;
    --
  end after statement;
  --
end ORG_UNITS$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."ORG_UNITS$TIUD0" ENABLE;
