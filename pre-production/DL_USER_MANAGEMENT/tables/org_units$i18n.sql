CREATE TABLE "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(250 CHAR), 
	"STREET" VARCHAR2(250 CHAR), 
	"CITY" VARCHAR2(130 CHAR), 
	"STATE_PROVINCE" VARCHAR2(130 CHAR), 
	"POSTCODE" VARCHAR2(40 CHAR), 
	"CONTACT_INFO" VARCHAR2(500 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" ADD CONSTRAINT "ORG_UNITS$I18N$PK" PRIMARY KEY ("ID", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" ADD CONSTRAINT "ORG_UNITS$I18N$CHK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" ADD CONSTRAINT "ORG_UNITS$I18N$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                    ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" ADD CONSTRAINT "ORG_UNITS$I18N$FK00" FOREIGN KEY ("ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ORG_UNITS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" ADD CONSTRAINT "ORG_UNITS$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$I18N$IX02" ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" ("NAME") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$I18N$PK" ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" ("ID", "LOCALE") 
  ;
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$I18N" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."ORG_UNITS$I18N$TIUD0" 
  for insert or update or delete on DL_USER_MANAGEMENT.ORG_UNITS$I18N
  compound trigger
--
  --
  /*******************************************************************************
  *
  *
  *                                                                              *
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
    if (:new.ID != :old.ID or :new.LOCALE != :old.LOCALE)
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
  procedure L_Check_FK_Content(p_ID     in ORG_UNITS$I18N.ID%type
                              ,p_LOCALE in ORG_UNITS$I18N.LOCALE%type
                               --,o_OWNER     in ORG_UNITS$I18N.OWNER%type
                               --,n_OWNER     in ORG_UNITS$I18N.OWNER%type
                               -- LOOP-FK-Column-n:
                               --,o_"[fk-columnname-n]" in ORG_UNITS$I18N."[fk-columnname-n]"%type
                               --,n_"[fk-columnname-n]" in ORG_UNITS$I18N."[fk-columnname-n]"%type
                               -- END LOOP-FK-Column-n:
                               --
                               ) is
    --
    --v_vc_Tmp varchar2(1 char);
    --v_n_Tmp  number(1);
    --
  begin
    --
    --
    null;
    /*
    if (n_OWNER is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_OWNER
                                                               ,o_OWNER))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.OWNERS t
         where t.KEY_VALUE = n_OWNER;
        if (v_vc_Tmp != "?")
        then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] is not active! For ID[''' || p_ID || ''']/LOCALE[''' || p_LOCALE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] does not exist! For ID[''' || p_ID || ''']/LOCALE[''' || p_LOCALE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    */
    -- LOOP-FK-Column-n:
    ----
    ----
    --if (n_"[fk-columnname-n]" is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_"[fk-columnname-n]"
    --                                                                          ,o_"[fk-columnname-n]"))
    --then
    --  begin
    --    select t.IS_ACTIVE
    --      into v_vc_Tmp
    --      from "[fk-schemaname-n]"."[fk-objectname-n]" t
    --     where t.KEY_VALUE = n_"[fk-columnname-n]";
    --    if (v_vc_Tmp != 'Y')
    --    then
    --      Raise_application_error(-20000
    --                             , 'The "[fk-columnname-n]"[''' || n_"[fk-columnname-n]" || '''] is not active! For ID[''' || p_ID || ''']/LOCALE[''' || p_LOCALE || ''']'
    --                              --
    --                               || ', DML_TYPE[''' || v_DML_TYPE || '''].');
    --    end if;
    --  exception
    --    when NO_DATA_FOUND then
    --      Raise_application_error(-20000
    --                             , 'The "[fk-columnname-n]"[''' || n_"[fk-columnname-n]" || '''] does not exist! For ID[''' || p_ID || ''']/LOCALE[''' || p_LOCALE || ''']'
    --                              --
    --                               || ', DML_TYPE[''' || v_DML_TYPE || '''].');
    --  end;
    --end if;
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
                               , 'The row is not updatable! For ID[''' || :old.ID || ''']/LOCALE[''' || :old.LOCALE || ''']'
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
                               , 'The row is not deletable! For ID[''' || :old.ID || ''']/LOCALE[''' || :old.LOCALE || ''']'
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
                        ,:new.LOCALE
                         --,null
                         --,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,null
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                        ,:new.LOCALE
                         --,:old.OWNER
                         --,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,:old."[fk-columnname-n]"
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
      insert into ORG_UNITS$I18N$HIS
      values
        (:old.ID
        ,:old.NAME
        ,:old.DESCRIPTION
        ,:old.STREET
        ,:old.CITY
        ,:old.STATE_PROVINCE
        ,:old.POSTCODE
        ,:old.CONTACT_INFO
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into ORG_UNITS$I18N$HIS
          (ID
          ,LOCALE
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.ID
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
      insert into ORG_UNITS$I18N$HIS
      values
        (:old.ID
        ,:old.NAME
        ,:old.DESCRIPTION
        ,:old.STREET
        ,:old.CITY
        ,:old.STATE_PROVINCE
        ,:old.POSTCODE
        ,:old.CONTACT_INFO
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      insert into ORG_UNITS$I18N$HIS
        (ID
        ,LOCALE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.ID
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
end ORG_UNITS$I18N$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."ORG_UNITS$I18N$TIUD0" ENABLE;
