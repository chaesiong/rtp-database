CREATE TABLE "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" 
   (	"HEALTH_CHECK_ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"FLIGHTNUM" VARCHAR2(8 CHAR), 
	"VALID_FROM" DATE, 
	"VALID_UNTIL" DATE, 
	"WARNING_TEXT" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" ADD CONSTRAINT "HEALTH_CHECK$PK" PRIMARY KEY ("HEALTH_CHECK_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" ADD CONSTRAINT "HEALTH_CHECK$CHK$C01" CHECK (dml_type IN ('I', 'U')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."HEALTH_CHECK_ID" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."FLIGHTNUM" IS 'Column for Flight Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."VALID_FROM" IS 'Data is valid from this date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."VALID_UNTIL" IS 'Data is valid to this date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."WARNING_TEXT" IS 'Column for warning text';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK"  IS 'Used in BmBS';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."HEALTH_CHECK$PK" ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" ("HEALTH_CHECK_ID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK" TO "TRAINEE";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK$TIUD0" 
FOR INSERT OR UPDATE OR DELETE ON dl_bordercontrol.flight_health_check
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
    IF (:NEW.health_check_id != :OLD.health_check_id)
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
END flight_health_check$tiud0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."FLIGHT_HEALTH_CHECK$TIUD0" ENABLE;
