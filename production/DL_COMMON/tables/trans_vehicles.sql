CREATE TABLE "DL_COMMON"."TRANS_VEHICLES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"TRANS_MODE" VARCHAR2(32 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."TRANS_VEHICLES" ADD CONSTRAINT "TRANS_VEHICLES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_VEHICLES" ADD CONSTRAINT "TRANS_VEHICLES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_VEHICLES" ADD CONSTRAINT "TRANS_VEHICLES$CHK$C00" CHECK (KEY_VALUE = upper(KEY_VALUE) and length(KEY_VALUE) >= 3) ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_VEHICLES" ADD CONSTRAINT "TRANS_VEHICLES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_VEHICLES" ADD CONSTRAINT "TRANS_VEHICLES$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                              ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_VEHICLES" ADD CONSTRAINT "TRANS_VEHICLES$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                             ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_VEHICLES" ADD CONSTRAINT "TRANS_VEHICLES$FK00" FOREIGN KEY ("TRANS_MODE")
	  REFERENCES "DL_COMMON"."TRANS_MODES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."DISPLAY_VALUE" IS 'Name of the Transport Vehicles';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."TRANS_MODE" IS 'If set, then only valid for the given transport mode, otherwise valid for all transport modes!';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_VEHICLES"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."TRANS_VEHICLES"  IS 'Table for Transport Vehicles';
  CREATE INDEX "DL_COMMON"."TRANS_VEHICLES$IX00" ON "DL_COMMON"."TRANS_VEHICLES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."TRANS_VEHICLES$IX01" ON "DL_COMMON"."TRANS_VEHICLES" ("TRANS_MODE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."TRANS_VEHICLES$PK" ON "DL_COMMON"."TRANS_VEHICLES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."TRANS_VEHICLES$UQ00" ON "DL_COMMON"."TRANS_VEHICLES" ("NUM_VALUE") 
  ;
  GRANT INSERT ON "DL_COMMON"."TRANS_VEHICLES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."TRANS_VEHICLES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_COMMON"."TRANS_VEHICLES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."TRANS_VEHICLES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."TRANS_VEHICLES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."TRANS_VEHICLES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."TRANS_VEHICLES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."TRANS_VEHICLES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."TRANS_VEHICLES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."TRANS_VEHICLES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."TRANS_VEHICLES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."TRANS_VEHICLES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."TRANS_VEHICLES$TIUD0" 
  for insert or update or delete on DL_COMMON.TRANS_VEHICLES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    16.11.2017  Added
  * WWirns    23.02.2018  Add columns INS_AT and INS_BY
  *******************************************************************************/
  --
  --
  v_DML_TYPE char(1);
  --
  --
  procedure L_Set_DML_TYPE is
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
      Raise_application_error(-20000
                             ,'Could not determine a value for v_DML_TYPE!');
    end if;
  end L_Set_DML_TYPE;
  --
  --
  function L_Has_PK_Value_Changed return boolean is
  begin
    --
    if (:new.KEY_VALUE != :old.KEY_VALUE
       --
       )
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_KEY_VALUE  in TRANS_VEHICLES.KEY_VALUE%type
                              ,o_TRANS_MODE in TRANS_VEHICLES.TRANS_MODE%type
                              ,n_TRANS_MODE in TRANS_VEHICLES.TRANS_MODE%type
                               --
                               ) is
    --
    v_c_Tmp char(1);
    --
  begin
    --
    --
    if (n_TRANS_MODE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_TRANS_MODE
                                                                    ,o_TRANS_MODE))
    then
      begin
        select '#'
          into v_c_Tmp
          from DL_COMMON.TRANS_MODES t
         where t.KEY_VALUE = n_TRANS_MODE
           and t.IS_ACTIVE = 'Y';
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The TRANS_MODE[''' || n_TRANS_MODE || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
  end L_Check_FK_Content;
  --
  --
  before statement is
  begin
    --
    L_Set_DML_TYPE();
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
      L_Check_FK_Content(:new.KEY_VALUE
                        ,null
                        ,:new.TRANS_MODE
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.TRANS_MODE
                        ,:new.TRANS_MODE
                         --
                         );
      --
      insert into TRANS_VEHICLES$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.TRANS_MODE
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into TRANS_VEHICLES$HIS
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
      --
    else
      -- 'D'
      insert into TRANS_VEHICLES$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.TRANS_MODE
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into TRANS_VEHICLES$HIS
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
end TRANS_VEHICLES$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."TRANS_VEHICLES$TIUD0" ENABLE;