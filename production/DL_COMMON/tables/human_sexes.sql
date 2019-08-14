CREATE TABLE "DL_COMMON"."HUMAN_SEXES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ISO5218" NUMBER(1,0), 
	"ICAO" VARCHAR2(1 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES" ADD CONSTRAINT "HUMAN_SEXES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES" ADD CONSTRAINT "HUMAN_SEXES$UQ00" UNIQUE ("ISO5218")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES" ADD CONSTRAINT "HUMAN_SEXES$UQ01" UNIQUE ("ICAO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES" ADD CONSTRAINT "HUMAN_SEXES$UQ02" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES" ADD CONSTRAINT "HUMAN_SEXES$CHK$C00" CHECK (KEY_VALUE = upper(KEY_VALUE) and length(KEY_VALUE) >= 3) ENABLE;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES" ADD CONSTRAINT "HUMAN_SEXES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES" ADD CONSTRAINT "HUMAN_SEXES$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                        ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES" ADD CONSTRAINT "HUMAN_SEXES$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                       ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."ISO5218" IS 'ISO5218 value for human sexes e.g. 2 = Female';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."ICAO" IS 'ICAO value for human sexes e.g. F = Female';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."NUM_VALUE" IS 'Contains numeric values based onto the enumeration of the websocket server for the passport reader "public enum Gender {Unknown = 0, Male = 1, Female = 2, }"!';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."HUMAN_SEXES"  IS 'Table for Human Sexes';
  CREATE INDEX "DL_COMMON"."HUMAN_SEXES$IX00" ON "DL_COMMON"."HUMAN_SEXES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."HUMAN_SEXES$IX90" ON "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE", LOWER(TRIM("DISPLAY_VALUE"))) 
  ;
CREATE INDEX "DL_COMMON"."HUMAN_SEXES$IX91" ON "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE", SOUNDEX(TRIM("DISPLAY_VALUE"))) 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."HUMAN_SEXES$PK" ON "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."HUMAN_SEXES$UQ00" ON "DL_COMMON"."HUMAN_SEXES" ("ISO5218") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."HUMAN_SEXES$UQ01" ON "DL_COMMON"."HUMAN_SEXES" ("ICAO") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."HUMAN_SEXES$UQ02" ON "DL_COMMON"."HUMAN_SEXES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."HUMAN_SEXES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."HUMAN_SEXES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."HUMAN_SEXES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."HUMAN_SEXES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."HUMAN_SEXES$TIUD0" 
  for insert or update or delete on DL_COMMON.HUMAN_SEXES
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
      null;
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      insert into HUMAN_SEXES$HIS
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
        ,:old.ISO5218
        ,:old.ICAO
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        insert into HUMAN_SEXES$HIS
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
      insert into HUMAN_SEXES$HIS
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
        ,:old.ISO5218
        ,:old.ICAO
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into HUMAN_SEXES$HIS
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
end HUMAN_SEXES$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."HUMAN_SEXES$TIUD0" ENABLE;
