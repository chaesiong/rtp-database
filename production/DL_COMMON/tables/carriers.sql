CREATE TABLE "DL_COMMON"."CARRIERS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"CARRIER_TYPE_MASK" NUMBER(2,0) DEFAULT 0 NOT NULL ENABLE, 
	"COUNTRY" VARCHAR2(3 CHAR), 
	"ICAO" VARCHAR2(3 CHAR), 
	"IATA_PREFIX" VARCHAR2(3 CHAR), 
	"IATA" VARCHAR2(2 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"IS_SEA_CARRIER" NUMBER(1,0) GENERATED ALWAYS AS (CASE BITAND("CARRIER_TYPE_MASK",1) WHEN 1 THEN 1 ELSE 0 END) VIRTUAL , 
	"IS_AIR_CARRIER" NUMBER(1,0) GENERATED ALWAYS AS (CASE BITAND("CARRIER_TYPE_MASK",2) WHEN 2 THEN 1 ELSE 0 END) VIRTUAL , 
	"IS_RAIL_CARRIER" NUMBER(1,0) GENERATED ALWAYS AS (CASE BITAND("CARRIER_TYPE_MASK",4) WHEN 4 THEN 1 ELSE 0 END) VIRTUAL , 
	"IS_ROAD_CARRIER" NUMBER(1,0) GENERATED ALWAYS AS (CASE BITAND("CARRIER_TYPE_MASK",8) WHEN 8 THEN 1 ELSE 0 END) VIRTUAL , 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                  ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                 ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$CHK00" CHECK (CARRIER_TYPE_MASK between 0 and 15) ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$CHK01" CHECK (regexp_like(ICAO
                                                                              ,'^[A-Z]{3}$'
                                                                              ,'c')) ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$CHK02" CHECK (regexp_like(IATA_PREFIX
                                                                              ,'^[0-9]{3}$'
                                                                              ,'c')) ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$CHK03" CHECK (regexp_like(IATA
                                                                              ,'^[A-Z0-9]{2}$'
                                                                              ,'c')) ENABLE;
  ALTER TABLE "DL_COMMON"."CARRIERS" ADD CONSTRAINT "CARRIERS$FK00" FOREIGN KEY ("COUNTRY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."DISPLAY_VALUE" IS 'Name of the Carriers';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."CARRIER_TYPE_MASK" IS 'Bitmask: 0 => unknown, 1 => sea, 2 => air, 4 => rail, 8 => road !';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."COUNTRY" IS 'Foreign Key to table DL_COMMON.COUNTRIES';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."ICAO" IS 'ICAO Code';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."IATA_PREFIX" IS 'IATA Prefix';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."IATA" IS 'IATA';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."IS_SEA_CARRIER" IS '0 means FALSE and 1 means TRUE';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."IS_AIR_CARRIER" IS '0 means FALSE and 1 means TRUE';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."IS_RAIL_CARRIER" IS '0 means FALSE and 1 means TRUE';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."IS_ROAD_CARRIER" IS '0 means FALSE and 1 means TRUE';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."CARRIERS"."INS_BY" IS 'User who insert the data';
  CREATE INDEX "DL_COMMON"."CARRIERS$IX00" ON "DL_COMMON"."CARRIERS" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."CARRIERS$IX01" ON "DL_COMMON"."CARRIERS" ("COUNTRY") 
  ;
CREATE INDEX "DL_COMMON"."CARRIERS$IX02" ON "DL_COMMON"."CARRIERS" ("IS_SEA_CARRIER") 
  ;
CREATE INDEX "DL_COMMON"."CARRIERS$IX03" ON "DL_COMMON"."CARRIERS" ("IS_AIR_CARRIER") 
  ;
CREATE INDEX "DL_COMMON"."CARRIERS$IX04" ON "DL_COMMON"."CARRIERS" ("IS_RAIL_CARRIER") 
  ;
CREATE INDEX "DL_COMMON"."CARRIERS$IX05" ON "DL_COMMON"."CARRIERS" ("IS_ROAD_CARRIER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."CARRIERS$PK" ON "DL_COMMON"."CARRIERS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."CARRIERS$UQ00" ON "DL_COMMON"."CARRIERS" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."CARRIERS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."CARRIERS" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."CARRIERS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."CARRIERS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."CARRIERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."CARRIERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CARRIERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."CARRIERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CARRIERS" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."CARRIERS$TIUD0" 
  for insert or update or delete on DL_COMMON.CARRIERS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    04.10.2017  Added
  * WWirns    09.11.2017  Added checks for IS_ACTIVE of FK-Columns-Content
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
  procedure L_Check_FK_Content(p_KEY_VALUE in CARRIERS.KEY_VALUE%type
                              ,o_COUNTRY   in CARRIERS.COUNTRY%type
                              ,n_COUNTRY   in CARRIERS.COUNTRY%type
                               --
                               ) is
    --
    v_c_Tmp char(1);
    --
  begin
    --
    --
    if (n_COUNTRY is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_COUNTRY
                                                                 ,o_COUNTRY))
    then
      begin
        select '#'
          into v_c_Tmp
          from DL_COMMON.COUNTRIES t
         where t.KEY_VALUE = n_COUNTRY
           and t.IS_ACTIVE = 'Y';
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The COUNTRY[''' || n_COUNTRY || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
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
      -- Begin:PK is a surrogate key
      if (:new.KEY_VALUE is null)
      then
        :new.KEY_VALUE := DL_COMMON.CARRIERS$SEQ00.NextVal;
        :new.KEY_VALUE := lpad(:new.KEY_VALUE
                              ,11
                              ,'0');
      end if;
      -- End:PK is a surrogate key
      --
      :new.INS_AT   := sysdate;
      :new.INS_BY   := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      :new.DML_AT   := systimestamp;
      :new.DML_BY   := PKG_SESSION.Get_AUDIT_User();
      :new.DML_TYPE := v_DML_TYPE;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      :new.INS_AT := :old.INS_AT;
      :new.INS_BY := :old.INS_BY;
      :new.DML_AT := systimestamp;
      :new.DML_BY := PKG_SESSION.Get_AUDIT_User();
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
                        ,:new.COUNTRY
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.COUNTRY
                        ,:new.COUNTRY
                         --
                         );
      --
      insert into CARRIERS$HIS
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
        ,:old.CARRIER_TYPE_MASK
        ,:old.COUNTRY
        ,:old.ICAO
        ,:old.IATA_PREFIX
        ,:old.IATA
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into CARRIERS$HIS
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
      end if;
      --
    else
      -- 'D'
      insert into CARRIERS$HIS
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
        ,:old.CARRIER_TYPE_MASK
        ,:old.COUNTRY
        ,:old.ICAO
        ,:old.IATA_PREFIX
        ,:old.IATA
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into CARRIERS$HIS
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
end CARRIERS$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."CARRIERS$TIUD0" ENABLE;
