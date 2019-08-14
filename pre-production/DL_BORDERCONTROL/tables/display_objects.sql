CREATE TABLE "DL_BORDERCONTROL"."DISPLAY_OBJECTS" 
   (	"KEY_VALUE" VARCHAR2(32) DEFAULT sys_guid() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"OBJECT_ID" NUMBER NOT NULL ENABLE, 
	"OBJECT_NAME" VARCHAR2(255) NOT NULL ENABLE, 
	"DELETE_FLAG" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"CONTENT" BLOB, 
	"IS_DEFAULT" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"IS_VIDEO" NUMBER(1,0) DEFAULT NULL NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."DISPLAY_OBJECTS" ADD CONSTRAINT "DISPLAY_OBJECTS_PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."DISPLAY_OBJECTS" ADD CONSTRAINT "DISPLAY_OBJECTS_UK1" UNIQUE ("OBJECT_ID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."OBJECT_ID" IS 'The numeric ID of the object. Used in the display API for showing objects.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."OBJECT_NAME" IS 'A Descriptive text for the content.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."DELETE_FLAG" IS 'This object should be deleted from the display.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."CONTENT" IS 'The actual content for the display. Either MPEG2-Video in AVI container or JPEG image.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."IS_DEFAULT" IS 'This object will automatically be shown when the display gets power.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."DISPLAY_OBJECTS"."IS_VIDEO" IS 'This object is an MPEG2 video or a JPEG image.';
   COMMENT ON TABLE "DL_BORDERCONTROL"."DISPLAY_OBJECTS"  IS 'Passenger Display content for deployment used for BmBS';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."DISPLAY_OBJECTS_PK" ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."DISPLAY_OBJECTS_UK1" ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" ("OBJECT_ID") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312151C00010$$" ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" (
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."DISPLAY_OBJECTS" TO "TRAINEE";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."DISPLAY_OBJECTS$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.DISPLAY_OBJECTS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MSTEPHAN  18.07.2018  Added
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
    if (:new.KEY_VALUE != :old.KEY_VALUE
       --
       -- Begin:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
       or :new.OBJECT_ID != :old.OBJECT_ID
       -- End:PK is a surrogate key and any natural PK exists also as unique constraints/indexes!
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
      -- Begin:PK is a surrogate key
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
	  null;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      --
	  null;
      --
      --
    else
      -- 'D'
	  null;
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
end DISPLAY_OBJECTS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."DISPLAY_OBJECTS$TIUD0" ENABLE;
