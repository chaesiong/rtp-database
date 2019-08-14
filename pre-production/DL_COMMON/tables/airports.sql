CREATE TABLE "DL_COMMON"."AIRPORTS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"LATITUDE" NUMBER(8,6), 
	"LONGITUDE" NUMBER(9,6), 
	"ALTITUDE" NUMBER, 
	"COUNTRY" VARCHAR2(3 CHAR), 
	"CITY" VARCHAR2(128 CHAR), 
	"TZ_OFFSET" VARCHAR2(6 CHAR), 
	"TZ_REGION" VARCHAR2(64 CHAR), 
	"TZ_ABBREV" VARCHAR2(4 CHAR), 
	"ICAO" VARCHAR2(4 CHAR), 
	"IATA" VARCHAR2(3 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$UQ01" UNIQUE ("ICAO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$UQ02" UNIQUE ("IATA")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                  ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                 ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK00" CHECK (LATITUDE is null or LATITUDE between - 91 and 90) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK01" CHECK (LONGITUDE is null or LONGITUDE between - 181 and 180) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK02" CHECK (LATITUDE is null and LONGITUDE is null or LATITUDE is not null and LONGITUDE is not null) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK03" CHECK (regexp_like(TZ_OFFSET
                                                                              ,'^(-|\+)([0-1][0-9]|20|21|22|23):[0-5][0-9]$'
                                                                              ,'c')) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK04" CHECK (TZ_ABBREV = upper(TZ_ABBREV)) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK05" CHECK (ICAO = upper(ICAO)) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK06" CHECK (IATA = upper(IATA)) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$FK00" FOREIGN KEY ("COUNTRY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DISPLAY_VALUE" IS 'Name of Airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."LATITUDE" IS 'Valid between -90 and 90 (-91 means invalid)';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."LONGITUDE" IS 'Valid between -180 and 180 (-181 means invalid)';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."ALTITUDE" IS 'not in use';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."COUNTRY" IS 'Country of Airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."CITY" IS 'City of Airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."TZ_OFFSET" IS 'Timezone Offset';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."TZ_REGION" IS 'Timezone region';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."TZ_ABBREV" IS 'not in use';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."ICAO" IS 'ICAO Code of Airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."IATA" IS 'IATA Code of airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."AIRPORTS"  IS 'Table for Airports';
  CREATE INDEX "DL_COMMON"."AIRPORTS$IX00" ON "DL_COMMON"."AIRPORTS" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."AIRPORTS$IX01" ON "DL_COMMON"."AIRPORTS" ("COUNTRY") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."AIRPORTS$PK" ON "DL_COMMON"."AIRPORTS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."AIRPORTS$UQ00" ON "DL_COMMON"."AIRPORTS" ("NUM_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."AIRPORTS$UQ01" ON "DL_COMMON"."AIRPORTS" ("ICAO") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."AIRPORTS$UQ02" ON "DL_COMMON"."AIRPORTS" ("IATA") 
  ;
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."AIRPORTS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."AIRPORTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."AIRPORTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."AIRPORTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."AIRPORTS$TIUD0" 
  for insert or update or delete on DL_COMMON.AIRPORTS
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
  procedure L_Check_FK_Content(p_KEY_VALUE in AIRPORTS.KEY_VALUE%type
                              ,o_COUNTRY   in AIRPORTS.COUNTRY%type
                              ,n_COUNTRY   in AIRPORTS.COUNTRY%type
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
        :new.KEY_VALUE := DL_COMMON.AIRPORTS$SEQ00.NextVal;
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
      insert into AIRPORTS$HIS
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
        ,:old.LATITUDE
        ,:old.LONGITUDE
        ,:old.ALTITUDE
        ,:old.COUNTRY
        ,:old.CITY
        ,:old.TZ_OFFSET
        ,:old.TZ_REGION
        ,:old.TZ_ABBREV
        ,:old.ICAO
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
        insert into AIRPORTS$HIS
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
      insert into AIRPORTS$HIS
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
        ,:old.LATITUDE
        ,:old.LONGITUDE
        ,:old.ALTITUDE
        ,:old.COUNTRY
        ,:old.CITY
        ,:old.TZ_OFFSET
        ,:old.TZ_REGION
        ,:old.TZ_ABBREV
        ,:old.ICAO
        ,:old.IATA
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into AIRPORTS$HIS
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
end AIRPORTS$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."AIRPORTS$TIUD0" ENABLE;
