CREATE TABLE "DL_BORDERCONTROL"."PARAMETERS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 CHAR), 
	"VALUE" VARCHAR2(255 CHAR), 
	"DESCRIPTION" VARCHAR2(255 CHAR), 
	"MINVALUE" VARCHAR2(255 CHAR), 
	"MAXVALUE" VARCHAR2(255 CHAR), 
	"DEFAULTVALUE" VARCHAR2(255 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."PARAMETERS" ADD CONSTRAINT "PARAMETERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."PARAMETERS" ADD CONSTRAINT "PARAMETERS_UK1" UNIQUE ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."PARAMETERS" ADD CONSTRAINT "PARAMETERS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                          ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."ID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."NAME" IS 'Name of Parameter';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."VALUE" IS 'Value of Parameter';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."DESCRIPTION" IS 'Description of Parameter';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."MINVALUE" IS 'Ninvalue of Parameter';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."MAXVALUE" IS 'Maxvalue of Parameter';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."DEFAULTVALUE" IS 'Default value of Parameter';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."PARAMETERS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON TABLE "DL_BORDERCONTROL"."PARAMETERS"  IS 'Table for Parameters needed in Frontend of BmBS';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."PARAMETERS_PK" ON "DL_BORDERCONTROL"."PARAMETERS" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."PARAMETERS_UK1" ON "DL_BORDERCONTROL"."PARAMETERS" ("NAME") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."PARAMETERS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."PARAMETERS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."PARAMETERS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."PARAMETERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."PARAMETERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."PARAMETERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."PARAMETERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."PARAMETERS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."PARAMETERS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."PARAMETERS" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."PARAMETERS$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.PARAMETERS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    02.02.2018  Added
  * WWirns    20.03.2018  Improve assignments of v_DML_TYPE
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
  procedure L_Check_FK_Content(p_ID in PARAMETERS.ID%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
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
      -- Begin:PK is a surrogate key
      :new.ID := PARAMETERS_SEQ.NextVal;
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
      :new.ID     := :old.ID;
      :new.INS_AT := :old.INS_AT;
      :new.INS_BY := :old.INS_BY;
      :new.DML_AT := systimestamp;
      :new.DML_BY := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      /*
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :new.DML_TYPE := 'I';
      else
        :new.DML_TYPE := v_DML_TYPE;
      end if;
      */
      :new.DML_TYPE := v_DML_TYPE;
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
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                         --
                         );
      --
      /*
      insert into PARAMETERS$HIS
      values
        (:old.KEY_VALUE
        ,:old.BORDER_POST
        ,:old.TERMINAL_TYPE
        ,:old.TERMINAL_NAME
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.IP_ADDRESS
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into PARAMETERS$HIS
          (KEY_VALUE
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,systimestamp
          ,DL_COMMON.PKG_SESSION.Get_AUDIT_User()
          ,'D'
           --
           );
      end if;
      */
      --
    else
      -- 'D'
      null;
      /*
      insert into PARAMETERS$HIS
      values
        (:old.KEY_VALUE
        ,:old.BORDER_POST
        ,:old.TERMINAL_TYPE
        ,:old.TERMINAL_NAME
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.IP_ADDRESS
         --
         );
      --
      insert into PARAMETERS$HIS
        (KEY_VALUE
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
        ,systimestamp
        ,DL_COMMON.PKG_SESSION.Get_AUDIT_User()
        ,'D'
         --
         );
      */
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
end PARAMETERS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."PARAMETERS$TIUD0" ENABLE;
