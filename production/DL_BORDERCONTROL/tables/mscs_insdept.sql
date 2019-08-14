CREATE TABLE "DL_BORDERCONTROL"."MSCS_INSDEPT" 
   (	"INSDEPT_SEQNO" NUMBER, 
	"TM5_SEQNO" NUMBER, 
	"GUART_SEQNO" NUMBER, 
	"VERSION" NUMBER, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."MSCS_INSDEPT" ADD CONSTRAINT "MSCS_INSDEPT_PK" PRIMARY KEY ("INSDEPT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MSCS_INSDEPT" ADD CONSTRAINT "MSCS_INSDEPT$FK00" FOREIGN KEY ("TM5_SEQNO")
	  REFERENCES "DL_BORDERCONTROL"."MSCS_TM5" ("TM5_SEQNO") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."INSDEPT_SEQNO" IS 'Surrogate key ประกันด่าน';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."TM5_SEQNO" IS 'Surrogate key การเพิ่ม/ลด คนประจำพาหนะ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."GUART_SEQNO" IS 'Surrogate key ประกันด่าน';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."VERSION" IS 'ลำดับข้อมูลในการcheck query';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."ACTFLAG" IS 'สถานะการใช้งาน Y=ใช้งาน,N=ยกเลิก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."INS_AT" IS 'วันที่บันทัก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."INS_BY" IS 'รหัสผู้บันทึก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."DML_AT" IS 'วันที่ปรับปรุง';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSDEPT"."DML_BY" IS 'รหัสผู้ปรับปรุง';
   COMMENT ON TABLE "DL_BORDERCONTROL"."MSCS_INSDEPT"  IS 'ตารางข้อมูลประกันด่าน';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."MSCS_INSDEPT_PK" ON "DL_BORDERCONTROL"."MSCS_INSDEPT" ("INSDEPT_SEQNO") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "DL_INTERFACE";
  GRANT INSERT ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "DL_INTERFACE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSDEPT" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."MSCS_INSDEPT$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.MSCS_INSDEPT
compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MSCS      27.01.2019  Added
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
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_KEY_VALUE      in MSCS_INSDEPT.INSDEPT_SEQNO%type
                              ,o_INS_TERMINAL   in MSCS_INSDEPT.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in MSCS_INSDEPT.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in MSCS_INSDEPT.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in MSCS_INSDEPT.INS_BORDERPOST%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_INS_TERMINAL is not null
       --
       and n_INS_BORDERPOST is not null
       --
       and (not DL_COMMON.PKG_UTIL.Is_Equal(n_INS_TERMINAL
                                            ,o_INS_TERMINAL)
       --
       or not DL_COMMON.PKG_UTIL.Is_Equal(n_INS_BORDERPOST
                                               ,o_INS_BORDERPOST))
       --
       )
    then
      begin
        if (n_INS_BORDERPOST != DL_BORDERCONTROL.PKG_COMMON.Get_Borderpost4TERM_ID(n_INS_TERMINAL))
        then
          Raise_application_error(-20000
                                 ,'The n_INS_TERMINAL[''' || n_INS_TERMINAL || '''] does not belong to n_INS_BORDERPOST[''' || n_INS_BORDERPOST || ''']!');
        end if;
      exception
        when others then
          Raise_application_error(-20000
                                 ,'Check borderpost and belonging terminal for p_KEY_VALUE[''' || p_KEY_VALUE || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
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
      :new.INSDEPT_SEQNO := DL_BORDERCONTROL.MSCS_INSDEPT$SEQ01.NEXTVAL;
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
    if (v_DML_TYPE in ('I'
                      ,'U')
       --
       and :new.INS_BORDERPOST is null and :new.INS_TERMINAL is not null)
    then
      --
      :new.INS_BORDERPOST := DL_BORDERCONTROL.PKG_COMMON.Get_Borderpost4TERM_ID(:new.INS_TERMINAL);
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
      L_Check_FK_Content(:new.INSDEPT_SEQNO
                        ,null
                        ,:new.INS_TERMINAL
                        ,null
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.INSDEPT_SEQNO
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );

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
end MSCS_INSDEPT$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."MSCS_INSDEPT$TIUD0" ENABLE;
