CREATE TABLE "DL_COMMON"."RELATIONS$I18N" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6), 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."RELATIONS$I18N" ADD CONSTRAINT "RELATIONS$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."RELATIONS$I18N" ADD CONSTRAINT "RELATIONS$I18N$CHK00" CHECK (locale != 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."RELATIONS$I18N" ADD CONSTRAINT "RELATIONS$I18N$CHK01" CHECK (dml_type IN ('I','U')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."DISPLAY_VALUE" IS 'Name of the relation';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."DML_TYPE" IS 'Audit (I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."NOTICE" IS 'Colume for notice';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$I18N"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
  CREATE UNIQUE INDEX "DL_COMMON"."RELATIONS$I18N$PK" ON "DL_COMMON"."RELATIONS$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT SELECT ON "DL_COMMON"."RELATIONS$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."RELATIONS$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."RELATIONS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."RELATIONS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."RELATIONS$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."RELATIONS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."RELATIONS$I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."RELATIONS$I18N" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."RELATIONS$I18N$TIUD0" 
  for insert or update or delete on dl_common.relations$I18N
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * CHageman  08.03.2018  Added
  * WWirns    09.04.2018  Add column ROW_FLAG_MASK
  *******************************************************************************/
  --
  --
  l_dml_type char(1); -- sets the actual transaction type (I.nsert, U.pdate, D.elete)
  --
  --
  /**
  * Checks the Trigger Transaction method to get the transaction type
  * Sets the global trigger variable "l_dml_type"
  *
  * Raises an error if no type can be extracted
  */
  procedure l_set_dml_type is
  begin

    if (INSERTING())
    then
      l_dml_type := 'I';
    elsif (UPDATING())
    then
      l_dml_type := 'U';
    elsif (DELETING())
    then
      l_dml_type := 'D';
    else
      RAISE_APPLICATION_ERROR(-20000
                             ,'Could not determine a value for l_dml_type!');
    end if;
  end l_set_dml_type;
  --
  --
  /**
  * Checks if the primary key value of the table has changed
  *
  * @return BOOLEAN: True = value has changed, False = value has not changed
  */
  function l_has_pk_value_changed return boolean is
  begin
    --
    if (:NEW.key_value != :OLD.key_value or :NEW.locale != :OLD.locale)
    then
      return true;
    else
      return false;
    end if;
  end l_has_pk_value_changed;
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
    l_set_dml_type();
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
    -- If transaction type is NULL, then call l_set_dml_type to extract it
    if (l_dml_type is null)
    then
      -- This case can occur for example on MERGE-Statements!
      l_set_dml_type();
    end if;
    --
    -- If the >>>>INSERTING<<<< transaction is used
    if (l_dml_type = 'I')
    then
      --
      -- set values to audit columns
      :NEW.dml_at   := SYSTIMESTAMP;
      :NEW.dml_by   := dl_common.pkg_session.get_audit_user();
      :NEW.dml_type := l_dml_type;
      --
      --
      -- If the >>>>UPDATING<<<< transaction is used
    elsif (l_dml_type = 'U')
    then
      --
      :NEW.dml_at := SYSTIMESTAMP;
      :NEW.dml_by := dl_common.pkg_session.get_audit_user();

      -- does the pk value has changed?
      if (l_has_pk_value_changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :NEW.dml_type := 'I';
      else
        :NEW.dml_type := l_dml_type;
      end if;
      --

      -- If the >>>>DELETING<<<< transaction is used
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
    --
    null;
    --
    if (l_dml_type is null)
    then

      -- This case can occur for example on MERGE-Statements!
      l_set_dml_type();
    end if;
    --
    -- If the >>>>INSERTING<<<< transaction is used
    if (l_dml_type = 'I')
    then

      null;

    elsif (l_dml_type = 'U')
    then
      --
      insert into relations$i18n$his
        (key_value
        ,locale
        ,display_value
        ,dml_at
        ,dml_by
        ,dml_type
        ,notice
        ,ROW_FLAG_MASK
         --
         )
      values
        (:OLD.key_value
        ,:OLD.locale
        ,:OLD.display_value
        ,:OLD.dml_at
        ,:OLD.dml_by
        ,:OLD.dml_type
        ,:OLD.notice
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
      if (l_has_pk_value_changed())
      then

        insert into relations$i18n$his
          (key_value
          ,locale
          ,dml_at
          ,dml_by
          ,dml_type)
        values
          (:OLD.key_value
          ,:OLD.locale
          ,SYSTIMESTAMP
          ,dl_common.pkg_session.get_audit_user()
          ,'D'
           --
           );
      end if;
      --
    else
      -- 'D'
      insert into relations$i18n$his
        (key_value
        ,locale
        ,display_value
        ,dml_at
        ,dml_by
        ,dml_type
        ,notice
        ,ROW_FLAG_MASK
         --
         )
      values
        (:OLD.key_value
        ,:OLD.locale
        ,:OLD.display_value
        ,SYSTIMESTAMP
        ,dl_common.pkg_session.get_audit_user()
        ,'D'
        ,:OLD.notice
        ,:old.ROW_FLAG_MASK
         --
         );
      --
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
    l_dml_type := null;
    --
  end after statement;
  --
end relations$i18n$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."RELATIONS$I18N$TIUD0" ENABLE;
