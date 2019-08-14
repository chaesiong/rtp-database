CREATE TABLE "DL_BORDERCONTROL"."TERMINALS" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"IPADDRESS" VARCHAR2(15 CHAR), 
	"DEFAULTEXITFLG" NUMBER(1,0) NOT NULL ENABLE, 
	"ACTIVE" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE, 
	"TRNSPRTMODEID" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE, 
	"ISGATE" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"POS_X" NUMBER DEFAULT 1, 
	"POS_Y" NUMBER DEFAULT 1, 
	"WIDTH" NUMBER DEFAULT 1, 
	"HEIGHT" NUMBER DEFAULT 1, 
	"FLOOR_ID" NUMBER, 
	"BIO_CAPTURING" NUMBER DEFAULT ON NULL 1 NOT NULL ENABLE, 
	"NAME" VARCHAR2(128 CHAR) DEFAULT SYS_GUID() NOT NULL ENABLE, 
	"BORDER_POST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DEFAULT_TRAVELER_TYPE" NUMBER(32,0), 
	"DEFAULT_CAMERA_DIRECTION" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS_UK1" UNIQUE ("IPADDRESS")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS$CHK$C14" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                        ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS$CHK01" CHECK (DEFAULT_CAMERA_DIRECTION is null or DEFAULT_CAMERA_DIRECTION in ('L', 'R')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS$FK00" FOREIGN KEY ("TRNSPRTMODEID")
	  REFERENCES "DL_COMMON"."TRANS_MODES" ("NUM_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS$FK01" FOREIGN KEY ("DEFAULTEXITFLG")
	  REFERENCES "DL_COMMON"."PORT_MOVEMENTS" ("NUM_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS$FK03" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS$FK04" FOREIGN KEY ("DEFAULT_TRAVELER_TYPE")
	  REFERENCES "DL_COMMON"."BC_PERSON_TYPES" ("NUM_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS" ADD CONSTRAINT "TERMINALS$FK02" FOREIGN KEY ("BORDER_POST")
	  REFERENCES "DL_BORDERCONTROL"."BORDERPOSTS" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."ID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."IPADDRESS" IS 'Column for IP Address';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."DEFAULTEXITFLG" IS 'Default Text Flag';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."TRNSPRTMODEID" IS 'Default Value for Transportmode ID';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."ISGATE" IS 'Flag for is gate?';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."POS_X" IS 'Column for position X';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."POS_Y" IS 'Column for position Y';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."WIDTH" IS 'Column for width';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."HEIGHT" IS 'Column height';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."FLOOR_ID" IS 'Column for floor id';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."BIO_CAPTURING" IS 'Column for Bio Capturing';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."NAME" IS 'Name of Terminal';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."BORDER_POST" IS 'Foreign Key to Table DL_BORDERCONTROL.BORDERPOSTS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."DEFAULT_TRAVELER_TYPE" IS 'The default value  for person type for this terminal';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS"."DEFAULT_CAMERA_DIRECTION" IS 'The default direction for the camera to look at. May be (null), ''L'', ''R''';
   COMMENT ON TABLE "DL_BORDERCONTROL"."TERMINALS"  IS 'Used in BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."TERMINALS$IX00" ON "DL_BORDERCONTROL"."TERMINALS" ("TRNSPRTMODEID") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."TERMINALS$IX01" ON "DL_BORDERCONTROL"."TERMINALS" ("DEFAULTEXITFLG") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."TERMINALS$IX03" ON "DL_BORDERCONTROL"."TERMINALS" ("LOCALE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."TERMINALS$UX00" ON "DL_BORDERCONTROL"."TERMINALS" ("BORDER_POST", UPPER("NAME")) 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."TERMINALS_PK" ON "DL_BORDERCONTROL"."TERMINALS" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."TERMINALS_UK1" ON "DL_BORDERCONTROL"."TERMINALS" ("IPADDRESS") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."TERMINALS" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."TERMINALS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TERMINALS" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."TERMINALS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."TERMINALS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TERMINALS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TERMINALS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TERMINALS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TERMINALS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS" TO "PIBICSDM2";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."TERMINALS$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.TERMINALS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    11.10.2017  Added
  * WWirns    08.11.2017  Added checks for IS_ACTIVE of FK-Columns-Content
  * WWirns    10.11.2017  Exchanged ENTRY_EXITS against PORT_MOVEMENTS
  * WWirns    03.01.2018  L_Check_FK_Content changed
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
  procedure L_Check_FK_Content(p_ID             in TERMINALS.ID%type
                              ,o_TRNSPRTMODEID  in TERMINALS.TRNSPRTMODEID%type
                              ,n_TRNSPRTMODEID  in TERMINALS.TRNSPRTMODEID%type
                              ,o_DEFAULTEXITFLG in TERMINALS.DEFAULTEXITFLG%type
                              ,n_DEFAULTEXITFLG in TERMINALS.DEFAULTEXITFLG%type
                              ,o_BORDER_POST    in TERMINALS.BORDER_POST%type
                              ,n_BORDER_POST    in TERMINALS.BORDER_POST%type
                               --
                               ) is
    --
    v_vc_Tmp            varchar2(1 char);
    v_TRNSPRTMODEID$CHG boolean := false;
    v_BORDER_POST$CHG   boolean := false;
    --
  begin
    --
    --
    if (n_TRNSPRTMODEID is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_TRNSPRTMODEID
                                                                       ,o_TRNSPRTMODEID))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.TRANS_MODES t
         where t.NUM_VALUE = n_TRNSPRTMODEID;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The TRNSPRTMODEID[''' || n_TRNSPRTMODEID || '''] is not active! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The TRNSPRTMODEID[''' || n_TRNSPRTMODEID || '''] does not exist! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
      v_TRNSPRTMODEID$CHG := true;
    end if;
    --
    --
    if (n_DEFAULTEXITFLG is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_DEFAULTEXITFLG
                                                                        ,o_DEFAULTEXITFLG))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.PORT_MOVEMENTS t
         where t.NUM_VALUE = n_DEFAULTEXITFLG;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The DEFAULTEXITFLG[''' || n_DEFAULTEXITFLG || '''] is not active! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The DEFAULTEXITFLG[''' || n_DEFAULTEXITFLG || '''] does not exist! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_BORDER_POST is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_BORDER_POST
                                                                     ,o_BORDER_POST))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_BORDERCONTROL.BORDERPOSTS t
         where t.KEY_VALUE = n_BORDER_POST;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The BORDER_POST[''' || n_BORDER_POST || '''] is not active! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The BORDER_POST[''' || n_BORDER_POST || '''] does not exist! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
      v_BORDER_POST$CHG := true;
    end if;
    --
    --
    if ((v_TRNSPRTMODEID$CHG and n_BORDER_POST is not null) or (v_BORDER_POST$CHG and n_TRNSPRTMODEID is not null))
    then
      begin
        select '#'
          into v_vc_Tmp
          from DL_BORDERCONTROL.BORDERPOSTS t1
              ,DL_COMMON.TRANS_MODES        t2
         where t1.KEY_VALUE = n_BORDER_POST
           and t2.NUM_VALUE = n_TRNSPRTMODEID
           and nvl(t1.BORDER_TYPE
                  ,t2.BORDER_TYPE) = nvl(t2.BORDER_TYPE
                                        ,t1.BORDER_TYPE);
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The BORDER_TYPE''s of BORDER_POST[''' || n_BORDER_POST || '''] and TRNSPRTMODEID[' || n_TRNSPRTMODEID || '] do not match! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
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
      -- End:PK is a surrogate key
      --
      if (:new.ACTIVE is null)
      then
        :new.ACTIVE := 1;
      end if;
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
                        ,null
                        ,:new.TRNSPRTMODEID
                        ,null
                        ,:new.DEFAULTEXITFLG
                        ,null
                        ,:new.BORDER_POST
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.ID
                        ,:old.TRNSPRTMODEID
                        ,:new.TRNSPRTMODEID
                        ,:old.DEFAULTEXITFLG
                        ,:new.DEFAULTEXITFLG
                        ,:old.BORDER_POST
                        ,:new.BORDER_POST
                         --
                         );
      --
      /*
      insert into TERMINALS$HIS
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
        insert into TERMINALS$HIS
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
      insert into TERMINALS$HIS
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
      insert into TERMINALS$HIS
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
end TERMINALS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."TERMINALS$TIUD0" ENABLE;
