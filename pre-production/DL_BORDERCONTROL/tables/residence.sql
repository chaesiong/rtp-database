CREATE TABLE "DL_BORDERCONTROL"."RESIDENCE" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"DOCUMENT_NO" VARCHAR2(15 CHAR), 
	"NATIONALITY" VARCHAR2(32 CHAR), 
	"EXPIRE_DATE" DATE, 
	"RESIDENT_TYPE" VARCHAR2(100 CHAR), 
	"RESIDENT_NO" VARCHAR2(15 CHAR), 
	"FIRST_NAME_THAI" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME_THAI" VARCHAR2(100 CHAR), 
	"LAST_NAME_THAI" VARCHAR2(100 CHAR), 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE, 
	"RESIDENT_ADDR_L1" VARCHAR2(255 CHAR), 
	"RESIDENT_ADDR_L2" VARCHAR2(255 CHAR), 
	"RESIDENT_ADDR_L3" VARCHAR2(255 CHAR), 
	"ENDORSEMENT_NO" VARCHAR2(20 CHAR), 
	"ENDORSEMENT_FROM" DATE, 
	"ENDORSEMENT_UNTIL" DATE, 
	"ENDORSEMENT_BY" VARCHAR2(255 CHAR), 
	"RESIDENTBOOK_NO" VARCHAR2(255 CHAR), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"CREATED_BY" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."RESIDENCE" ADD CONSTRAINT "RESIDENCE$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."RESIDENCE" ADD CONSTRAINT "RESIDENCE$CHK$C01" CHECK (dml_type IN ('I', 'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."RESIDENCE" ADD CONSTRAINT "RESIDENCE$FK01" FOREIGN KEY ("NATIONALITY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."DOCUMENT_NO" IS 'Document Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."NATIONALITY" IS 'FK DL_COMMON.ICAO_DOC_CODES';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."EXPIRE_DATE" IS 'Expire Date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_TYPE" IS 'Type of resident';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_NO" IS 'Resident Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."FIRST_NAME_THAI" IS 'Firstname Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."MIDDLE_NAME_THAI" IS 'Middle Name Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."LAST_NAME_THAI" IS 'Lastname Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_ADDR_L1" IS 'Column for Resident Address Line 1';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_ADDR_L2" IS 'Column for Resident Address Line 2';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_ADDR_L3" IS 'Column for Resident Address Line 3';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."ENDORSEMENT_NO" IS 'Column for Endorsement Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."ENDORSEMENT_FROM" IS 'Date from which Endorsement is valid';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."ENDORSEMENT_UNTIL" IS 'Date until which Endorsement is valid';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."ENDORSEMENT_BY" IS 'Name of who creates the endorsement';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENTBOOK_NO" IS 'Column for Resident Book Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."CREATED_AT" IS 'Original Timestamp of record creation';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."CREATED_BY" IS 'Original user who created the record';
   COMMENT ON TABLE "DL_BORDERCONTROL"."RESIDENCE"  IS 'Used in BmBS';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."IDX_RESIDENCE_DOCNATEXP" ON "DL_BORDERCONTROL"."RESIDENCE" ("DOCUMENT_NO", "NATIONALITY", "EXPIRE_DATE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."RESIDENCE$PK" ON "DL_BORDERCONTROL"."RESIDENCE" ("KEY_VALUE") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."RESIDENCE" TO "DL_STAGING4PIBICS";
  GRANT INSERT ON "DL_BORDERCONTROL"."RESIDENCE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "DL_STAGING4PIBICS";
  GRANT UPDATE ON "DL_BORDERCONTROL"."RESIDENCE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."RESIDENCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."RESIDENCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."RESIDENCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."RESIDENCE" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."RESIDENCE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."RESIDENCE" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."RESIDENCE" TO "TRAINEE";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."RESIDENCE$TIUD0" 
FOR INSERT OR UPDATE OR DELETE ON dl_bordercontrol.residence
COMPOUND TRIGGER
  --
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * CFunke    27.06.2018  Added
  *******************************************************************************/
  --
  --
  l_dml_type CHAR(1); -- sets the actual transaction type (I.nsert, U.pdate, D.elete)
  --
  --
  /**
   * Checks the Trigger Transaction method to get the transaction type
   * Sets the global trigger variable "l_dml_type"
   *
   * Raises an error if no type can be extracted
   */
  PROCEDURE l_set_dml_type
  IS
  BEGIN

    IF (INSERTING())
    THEN
      l_dml_type := 'I';
    ELSIF (UPDATING())
    THEN
      l_dml_type := 'U';
    ELSIF (DELETING())
    THEN
      l_dml_type := 'D';
    ELSE
      RAISE_APPLICATION_ERROR(-20000,'Could not determine a value for l_dml_type!');
    END IF;
  END l_set_dml_type;
  --
  --
  /**
   * Checks if the primary key value of the table has changed
   *
   * @return BOOLEAN: True = value has changed, False = value has not changed
   */
  FUNCTION l_has_pk_value_changed
  RETURN BOOLEAN
  IS
  BEGIN
    --
    IF (:NEW.key_value != :OLD.key_value)
    THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END l_has_pk_value_changed;
  --
  --
  /** ======================================================
   * BEFORE STATEMENT EVENT
   *
   * Extract the dml-type variable
   * =======================================================
   */
  BEFORE STATEMENT
  IS
  BEGIN
    --
    l_set_dml_type();
    --
  END BEFORE STATEMENT;
  --
  --
  /** ======================================================
   * BEFORE EACH ROW EVENT
   * =======================================================
   */
  BEFORE EACH ROW
  IS
  BEGIN
    --
    -- If transaction type is NULL, then call l_set_dml_type to extract it
    IF (l_dml_type IS NULL)
    THEN
      -- This case can occur for example on MERGE-Statements!
      l_set_dml_type();
    END IF;
    --
    -- If the >>>>INSERTING<<<< transaction is used
    IF (l_dml_type = 'I')
    THEN
      --
      -- set values to audit columns
      :NEW.dml_at   := SYSTIMESTAMP;
      :NEW.dml_by   := dl_common.pkg_session.get_audit_user();
      :NEW.dml_type := l_dml_type;
      --
      --
    -- If the >>>>UPDATING<<<< transaction is used
    ELSIF (l_dml_type = 'U')
    THEN
      --
      :NEW.dml_at := SYSTIMESTAMP;
      :NEW.dml_by := dl_common.pkg_session.get_audit_user();

      -- does the pk value has changed?
      IF (l_has_pk_value_changed())
      THEN
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :NEW.dml_type := 'I';
      ELSE
        :NEW.dml_type := l_dml_type;
      END IF;
      --

    -- If the >>>>DELETING<<<< transaction is used
    ELSE
      -- 'D'
      NULL;
      --
    END IF;
    --
  END BEFORE EACH ROW;
  --
  --
  /** ======================================================
   * AFTER EACH ROW EVENT
   * =======================================================
   */
  AFTER EACH ROW
  IS
  BEGIN
    --
    IF (l_dml_type IS NULL)
    THEN

      -- This case can occur for example on MERGE-Statements!
      l_set_dml_type();
    END IF;
    --
    --
  END AFTER EACH ROW;
  --
  --
  AFTER STATEMENT
  IS
  BEGIN
    --
    l_dml_type := NULL;
    --
  END AFTER STATEMENT;
  --
END residence$tiud0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."RESIDENCE$TIUD0" ENABLE;
