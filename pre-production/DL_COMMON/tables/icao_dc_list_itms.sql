CREATE TABLE "DL_COMMON"."ICAO_DC_LIST_ITMS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"ICAO_DOC_CODE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"IS_DEFAULT" VARCHAR2(1 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."ICAO_DC_LIST_ITMS" ADD CONSTRAINT "ICAO_DC_LIST_ITMS$PK" PRIMARY KEY ("KEY_VALUE", "ICAO_DOC_CODE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DC_LIST_ITMS" ADD CONSTRAINT "ICAO_DC_LIST_ITMS$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                 ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DC_LIST_ITMS" ADD CONSTRAINT "ICAO_DC_LIST_ITMS$CHK02" CHECK (IS_DEFAULT IN ('Y', 'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DC_LIST_ITMS" ADD CONSTRAINT "ICAO_DC_LIST_ITMS$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_COMMON"."ICAO_DC_LISTS" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DC_LIST_ITMS" ADD CONSTRAINT "ICAO_DC_LIST_ITMS$FK01" FOREIGN KEY ("ICAO_DOC_CODE")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."ICAO_DOC_CODE" IS 'ICAO Document Code e.g. D for Germany';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DC_LIST_ITMS"."IS_DEFAULT" IS 'Value should be the default value in frontend (Y.es, N.o)';
   COMMENT ON TABLE "DL_COMMON"."ICAO_DC_LIST_ITMS"  IS 'Table for ICAO Document List Items';
  CREATE UNIQUE INDEX "DL_COMMON"."ICAO_DC_LIST_ITMS$PK" ON "DL_COMMON"."ICAO_DC_LIST_ITMS" ("KEY_VALUE", "ICAO_DOC_CODE") 
  ;
  GRANT SELECT ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ICAO_DC_LIST_ITMS" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."ICAO_DC_LIST_ITMS$TIUD0" 
  for insert or update or delete on DL_COMMON.ICAO_DC_LIST_ITMS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    22.01.2018  Added
  * WWirns    23.02.2018  Add columns INS_AT and INS_BY
  * WWirns    09.04.2018  Add column ROW_FLAG_MASK
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
    if (:new.KEY_VALUE != :old.KEY_VALUE or :new.ICAO_DOC_CODE != :old.ICAO_DOC_CODE)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  --
  procedure L_Check_FK_Content(p_KEY_VALUE     in ICAO_DC_LIST_ITMS.KEY_VALUE%type
                              ,o_ICAO_DOC_CODE in ICAO_DC_LIST_ITMS.ICAO_DOC_CODE%type
                              ,n_ICAO_DOC_CODE in ICAO_DC_LIST_ITMS.ICAO_DOC_CODE%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_ICAO_DOC_CODE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_ICAO_DOC_CODE
                                                                       ,o_ICAO_DOC_CODE))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.ICAO_DOC_CODES t
         where t.KEY_VALUE = n_ICAO_DOC_CODE;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The ICAO_DOC_CODE[''' || n_ICAO_DOC_CODE || '''] is not active! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The ICAO_DOC_CODE[''' || n_ICAO_DOC_CODE || '''] does not exist! For KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
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
                        ,:new.ICAO_DOC_CODE
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.ICAO_DOC_CODE
                        ,:new.ICAO_DOC_CODE
                         --
                         );
      --
      insert into ICAO_DC_LIST_ITMS$HIS
      values
        (:old.KEY_VALUE
        ,:old.ICAO_DOC_CODE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        insert into ICAO_DC_LIST_ITMS$HIS
          (KEY_VALUE
          ,ICAO_DOC_CODE
          ,DML_AT
          ,DML_BY
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,:old.ICAO_DOC_CODE
          ,systimestamp
          ,DL_COMMON.PKG_SESSION.Get_AUDIT_User()
          ,'D'
           --
           );
      end if;
      --
    else
      -- 'D'
      insert into ICAO_DC_LIST_ITMS$HIS
      values
        (:old.KEY_VALUE
        ,:old.ICAO_DOC_CODE
        ,:old.DML_AT
        ,:old.DML_BY
        ,:old.DML_TYPE
        ,:old.INS_AT
        ,:old.INS_BY
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      insert into ICAO_DC_LIST_ITMS$HIS
        (KEY_VALUE
        ,ICAO_DOC_CODE
        ,DML_AT
        ,DML_BY
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
        ,:old.ICAO_DOC_CODE
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
end ICAO_DC_LIST_ITMS$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."ICAO_DC_LIST_ITMS$TIUD0" ENABLE;
