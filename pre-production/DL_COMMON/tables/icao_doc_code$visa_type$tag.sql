CREATE TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" 
   (	"ICAO_DOC_CODE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"VISA_TYPE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"TAG" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$TAG$PK" PRIMARY KEY ("ICAO_DOC_CODE", "VISA_TYPE", "OWNER", "TAG")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$TAG$CK01" CHECK (DML_TYPE in ('I' ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$TAG$FK00" FOREIGN KEY ("ICAO_DOC_CODE")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$TAG$FK01" FOREIGN KEY ("VISA_TYPE")
	  REFERENCES "DL_COMMON"."VISA_TYPES" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$TAG$FK02" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."ICAO_DOC_CODE" IS 'Foreign Key to ICAO Doc Codes';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."VISA_TYPE" IS 'Foreign Key to Visa Type';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."OWNER" IS 'Owner of the data';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."TAG" IS 'Tag';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG"  IS 'Tags for the basis table rows';
  CREATE INDEX "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG$IX01" ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" ("ICAO_DOC_CODE") 
  ;
CREATE INDEX "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG$IX02" ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" ("VISA_TYPE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG$PK" ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" ("ICAO_DOC_CODE", "VISA_TYPE", "OWNER", "TAG") 
  ;
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG$TIUD0" 
  for insert or update or delete on DL_COMMON.ICAO_DOC_CODE$VISA_TYPE$TAG
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * CHageman  21.06.2018  Added
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
    if (:new.icao_doc_code != :old.icao_doc_code or: new.visa_type != :old.visa_type or :new.OWNER != :old.OWNER or :new.TAG != :old.TAG)
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
  procedure L_Check_FK_Content(p_OWNER            in ICAO_DOC_CODE$VISA_TYPE$TAG.OWNER%type
                               ,p_TAG              in ICAO_DOC_CODE$VISA_TYPE$TAG.TAG%type
                               ,o_OWNER            in ICAO_DOC_CODE$VISA_TYPE$TAG.OWNER%type
                               ,n_OWNER            in ICAO_DOC_CODE$VISA_TYPE$TAG.OWNER%type
                               ,o_icao_doc_code in ICAO_DOC_CODE$VISA_TYPE$TAG.icao_doc_code%type
                               ,n_icao_doc_code in ICAO_DOC_CODE$VISA_TYPE$TAG.icao_doc_code%type
                               ,o_visa_type in ICAO_DOC_CODE$VISA_TYPE$TAG.visa_type%type
                               ,n_visa_type in ICAO_DOC_CODE$VISA_TYPE$TAG.visa_type%type
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
                                 ,'The OWNER[''' || n_OWNER || '''] is not active! For KEY_VALUE[''' || o_icao_doc_code || '/' || o_visa_type || '''], OWNER[''' || p_OWNER || '''], TAG[''' || p_TAG || ''']  , DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The OWNER[''' || n_OWNER || '''] does not exist! For KEY_VALUE[''' || o_icao_doc_code || '/' || o_visa_type || '''], OWNER[''' || p_OWNER || '''], TAG[''' || p_TAG || ''']  , DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_visa_type is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_visa_type
                                                                           ,o_visa_type))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from dl_common.visa_types t
         where t.KEY_VALUE = n_visa_type;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The icao_doc_code[''' || n_visa_type || '''] is not active! For KEY_VALUE[''' || o_icao_doc_code || '/' || o_visa_type || '''], OWNER[''' || p_OWNER || '''], TAG[''' || p_TAG || ''']  , DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The icao_doc_code[''' || n_visa_type || '''] does not exist! For KEY_VALUE[''' || o_icao_doc_code || '/' || o_visa_type || '''], OWNER[''' || p_OWNER || '''], TAG[''' || p_TAG || ''']  , DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_icao_doc_code is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_icao_doc_code
                                                                           ,o_icao_doc_code))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from dl_common.icao_doc_codes t
         where t.KEY_VALUE = n_icao_doc_code;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The icao_doc_code[''' || n_icao_doc_code || '''] is not active! For KEY_VALUE[''' || o_icao_doc_code || '/' || o_visa_type || '''], OWNER[''' || p_OWNER || '''], TAG[''' || p_TAG || ''']  , DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The icao_doc_code[''' || n_icao_doc_code || '''] does not exist! For KEY_VALUE[''' || o_icao_doc_code || '/' || o_visa_type || '''], OWNER[''' || p_OWNER || '''], TAG[''' || p_TAG || ''']  , DML_TYPE[''' || v_DML_TYPE || '''].');
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
      L_Check_FK_Content(:new.OWNER
                        ,:new.TAG
                        ,null
                        ,:new.OWNER
                        ,null
                        ,:new.icao_doc_code
                        ,null
                        ,:new.visa_type
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.OWNER
                        ,:new.TAG
                        ,:old.OWNER
                        ,:new.OWNER
                        ,:old.icao_doc_code
                         ,:new.icao_doc_code
                        ,:old.visa_type
                         ,:new.visa_type
                         --
                         );
      --
      insert into ICAO_DOC_CODE$VISA_TYPE$TAG$HIS
      values
        (:old.ICAO_DOC_CODE
        ,:old.VISA_TYPE
        ,:old.OWNER
        ,:old.TAG
        ,:old.NOTICE
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
        insert into ICAO_DOC_CODE$VISA_TYPE$TAG$HIS
          (icao_doc_code
          ,visa_type
          ,OWNER
          ,TAG
          ,INS_AT
          ,INS_BY
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.icao_doc_code
          ,:old.visa_type
          ,:old.OWNER
          ,:old.TAG
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
      insert into ICAO_DOC_CODE$VISA_TYPE$TAG$HIS
      values
        (:old.icao_doc_code
        ,:old.visa_type
        ,:old.OWNER
        ,:old.TAG
        ,:old.NOTICE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      insert into ICAO_DOC_CODE$VISA_TYPE$TAG$HIS
        (icao_doc_code
        ,visa_type
        ,OWNER
        ,TAG
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.icao_doc_code
        ,:old.visa_type
        ,:old.OWNER
        ,:old.TAG
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
    v_DML_TYPE := null;
    --
  end after statement;
  --
end ICAO_DOC_CODE$VISA_TYPE$TAG$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$TAG$TIUD0" ENABLE;
