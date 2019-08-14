CREATE TABLE "DL_COMMON"."VISA_TYPES" 
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
	"ICAO_DC_LIST" VARCHAR2(32 CHAR), 
	"PERMIT_DAYS" NUMBER(4,0), 
	"CAN_EDIT_EXPIRY_DT" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"AUTO_GENERATE_VISA" VARCHAR2(1 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$CHK$C00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                      ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                     ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$CHK$C13" CHECK (ICAO_DC_LIST is null or (ICAO_DC_LIST is not null and PERMIT_DAYS is not null)) ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$CHK$C14" CHECK (CAN_EDIT_EXPIRY_DT in ('Y'
                                                                                               ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$CHK$C15" CHECK (AUTO_GENERATE_VISA in ('Y'
                                                                                               ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$FK00" FOREIGN KEY ("TRANS_MODE")
	  REFERENCES "DL_COMMON"."TRANS_MODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_COMMON"."VISA_TYPES" ADD CONSTRAINT "VISA_TYPES$FK01" FOREIGN KEY ("ICAO_DC_LIST")
	  REFERENCES "DL_COMMON"."ICAO_DC_LISTS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."DISPLAY_VALUE" IS 'Name of the Visa Types';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."TRANS_MODE" IS 'Entry is valid, if set, then only for the given transport mode, otherwise for all transport modes!';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."ICAO_DC_LIST" IS 'Entry is valid, if set, then only for the Nationalities by ICAO-Doc-Codes included into the given list, otherwise for all ICAO-Doc-Codes!';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."PERMIT_DAYS" IS 'If ICAO_DC_LIST is set, then the maximum permited stay in days must also be set.';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."CAN_EDIT_EXPIRY_DT" IS 'Officer can edit the expiry date of the stay of the traveller';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."AUTO_GENERATE_VISA" IS 'Automatically generate a visa from the given type and permit days into the visa table';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."VISA_TYPES"  IS 'Table of Visa Types';
  CREATE INDEX "DL_COMMON"."VISA_TYPES$IX00" ON "DL_COMMON"."VISA_TYPES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."VISA_TYPES$IX01" ON "DL_COMMON"."VISA_TYPES" ("TRANS_MODE") 
  ;
CREATE INDEX "DL_COMMON"."VISA_TYPES$IX02" ON "DL_COMMON"."VISA_TYPES" ("ICAO_DC_LIST") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."VISA_TYPES$PK" ON "DL_COMMON"."VISA_TYPES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."VISA_TYPES$UQ00" ON "DL_COMMON"."VISA_TYPES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_COMMON"."VISA_TYPES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_COMMON"."VISA_TYPES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."VISA_TYPES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES" TO "DL_BLACKLIST" WITH GRANT OPTION;
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."VISA_TYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."VISA_TYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."VISA_TYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES" TO "PIBICSDM2";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."VISA_TYPES$TIUD0" 
  for insert or update or delete on DL_COMMON.VISA_TYPES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    27.09.2017  Added
  * WWirns    23.01.2018  Columns TRANS_MODE, ICAO_DC_LIST, PERMIT_DAYS, CAN_EDIT_EXPIRY_DT and AUTO_GENERATE_VISA added
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
    if (:new.KEY_VALUE != :old.KEY_VALUE)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_KEY_VALUE    in VISA_TYPES.KEY_VALUE%type
                              ,o_ICAO_DC_LIST in VISA_TYPES.ICAO_DC_LIST%type
                              ,n_ICAO_DC_LIST in VISA_TYPES.ICAO_DC_LIST%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_ICAO_DC_LIST is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_ICAO_DC_LIST
                                                                      ,o_ICAO_DC_LIST))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.ICAO_DC_LISTS t
         where t.KEY_VALUE = n_ICAO_DC_LIST;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The ICAO_DC_LIST[''' || n_ICAO_DC_LIST || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The ICAO_DC_LIST[''' || n_ICAO_DC_LIST || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
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
                        ,:new.ICAO_DC_LIST
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.ICAO_DC_LIST
                        ,:new.ICAO_DC_LIST
                         --
                         );
      --
      insert into VISA_TYPES$HIS
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
        ,:old.ICAO_DC_LIST
        ,:old.PERMIT_DAYS
        ,:old.CAN_EDIT_EXPIRY_DT
        ,:old.AUTO_GENERATE_VISA
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into VISA_TYPES$HIS
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
      insert into VISA_TYPES$HIS
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
        ,:old.ICAO_DC_LIST
        ,:old.PERMIT_DAYS
        ,:old.CAN_EDIT_EXPIRY_DT
        ,:old.AUTO_GENERATE_VISA
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into VISA_TYPES$HIS
        (KEY_VALUE
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
        ,systimestamp
        ,PKG_SESSION.Get_AUDIT_User()
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
end VISA_TYPES$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."VISA_TYPES$TIUD0" ENABLE;
