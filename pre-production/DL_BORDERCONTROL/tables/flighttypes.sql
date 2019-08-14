CREATE TABLE "DL_BORDERCONTROL"."FLIGHTTYPES" 
   (	"FLGHTTYPEID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"NAME" VARCHAR2(100 CHAR), 
	"ACTIVE" NUMBER(1,0) DEFAULT 1
                                          --
                                         , 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FLIGHTTYPES" ADD CONSTRAINT "FLIGHTTYPES_PK" PRIMARY KEY ("FLGHTTYPEID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FLIGHTTYPES" ADD CONSTRAINT "FLIGHTTYPES_UK" UNIQUE ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FLIGHTTYPES" ADD CONSTRAINT "FLIGHTTYPES$CHK00" CHECK (DML_TYPE in ('I'
                                                                                            ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."FLGHTTYPEID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."NAME" IS 'Name of Flight Type';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FLIGHTTYPES"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FLIGHTTYPES"  IS 'Used in BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."FLIGHTTYPES$IX00" ON "DL_BORDERCONTROL"."FLIGHTTYPES" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."FLIGHTTYPES$IX01" ON "DL_BORDERCONTROL"."FLIGHTTYPES" ("INS_TERMINAL") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."FLIGHTTYPES_PK" ON "DL_BORDERCONTROL"."FLIGHTTYPES" ("FLGHTTYPEID") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."FLIGHTTYPES_UK" ON "DL_BORDERCONTROL"."FLIGHTTYPES" ("NAME") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FLIGHTTYPES" TO "TRAINEE";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."FLIGHTTYPES$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.FLIGHTTYPES
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    01.02.2018  Added
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
    if (:new.FLGHTTYPEID != :old.FLGHTTYPEID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_FLGHTTYPEID    in FLIGHTTYPES.FLGHTTYPEID%type
                              ,o_INS_TERMINAL   in FLIGHTTYPES.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in FLIGHTTYPES.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in FLIGHTTYPES.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in FLIGHTTYPES.INS_BORDERPOST%type
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
                                 ,'Check borderpost and belonging terminal for p_FLGHTTYPEID[''' || p_FLGHTTYPEID || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
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
      :new.INS_AT   := sysdate;
      :new.INS_BY   := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      :new.DML_AT   := systimestamp;
      :new.DML_BY   := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      :new.DML_TYPE := v_DML_TYPE;
      --
      if (:new.ACTIVE is null)
      then
        :new.ACTIVE := 1;
      end if;
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
      L_Check_FK_Content(:new.FLGHTTYPEID
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
      L_Check_FK_Content(:new.FLGHTTYPEID
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into FLIGHTTYPES$HIS
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
        insert into FLIGHTTYPES$HIS
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
      insert into FLIGHTTYPES$HIS
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
      insert into FLIGHTTYPES$HIS
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
end FLIGHTTYPES$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."FLIGHTTYPES$TIUD0" ENABLE;
