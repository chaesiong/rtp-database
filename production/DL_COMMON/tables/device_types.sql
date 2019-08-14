CREATE TABLE "DL_COMMON"."DEVICE_TYPES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."DEVICE_TYPES" ADD CONSTRAINT "DEVICE_TYPES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."DEVICE_TYPES" ADD CONSTRAINT "DEVICE_TYPES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."DEVICE_TYPES" ADD CONSTRAINT "DEVICE_TYPES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."DEVICE_TYPES" ADD CONSTRAINT "DEVICE_TYPES$CHK$C02" CHECK (IS_ACTIVE in ('Y'
                                                                                          ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."DEVICE_TYPES" ADD CONSTRAINT "DEVICE_TYPES$CHK$C03" CHECK (DML_TYPE in ('I'
                                                                                         ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."DISPLAY_VALUE" IS 'Name of Device Type';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."DEVICE_TYPES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."DEVICE_TYPES"  IS 'Table for Device Types';
  CREATE INDEX "DL_COMMON"."DEVICE_TYPES$IX00" ON "DL_COMMON"."DEVICE_TYPES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."DEVICE_TYPES$PK" ON "DL_COMMON"."DEVICE_TYPES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."DEVICE_TYPES$UQ00" ON "DL_COMMON"."DEVICE_TYPES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."DEVICE_TYPES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."DEVICE_TYPES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."DEVICE_TYPES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."DEVICE_TYPES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."DEVICE_TYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."DEVICE_TYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."DEVICE_TYPES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."DEVICE_TYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."DEVICE_TYPES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."DEVICE_TYPES$TIUD0" 
  for insert or update or delete on DL_COMMON.DEVICE_TYPES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * SRuseva   23.03.2018  Added
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
      insert into DEVICE_TYPES$HIS
	   (KEY_VALUE
        ,LOCALE
        ,DISPLAY_VALUE
        ,DISPLAY_ORDER
        ,IS_ACTIVE
        ,DML_AT
        ,DML_BY
        ,DML_TYPE
        ,NOTICE
        ,NUM_VALUE
        ,ROW_FLAG_MASK
        ,INS_AT
        ,INS_BY)
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
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        insert into DEVICE_TYPES$HIS
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
      insert into DEVICE_TYPES$HIS
	   (KEY_VALUE
        ,LOCALE
        ,DISPLAY_VALUE
        ,DISPLAY_ORDER
        ,IS_ACTIVE
        ,DML_AT
        ,DML_BY
        ,DML_TYPE
        ,NOTICE
        ,NUM_VALUE
        ,ROW_FLAG_MASK
        ,INS_AT
        ,INS_BY)
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
        ,:old.INS_AT
        ,:old.INS_BY
         --
         );
      --
      insert into DEVICE_TYPES$HIS
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
end DEVICE_TYPES$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."DEVICE_TYPES$TIUD0" ENABLE;
