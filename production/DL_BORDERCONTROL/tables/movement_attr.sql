CREATE TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR" 
   (	"MVMNTID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"SEQNO" NUMBER NOT NULL ENABLE, 
	"ATTRVARCHAR" VARCHAR2(4000 CHAR), 
	"ATTRBLOB" BLOB, 
	"INS_AT" TIMESTAMP (6) DEFAULT sysdate
                                            --
                                           , 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1 ,'MONTH')) 
 (PARTITION "P_BEFORE_2018"  VALUES LESS THAN (TIMESTAMP' 2018-01-01 00:00:00') ) ;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR" ADD CONSTRAINT "PK_MOVEMENT_ATTR" PRIMARY KEY ("MVMNTID", "SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR" ADD CONSTRAINT "MOVEMENT_ATTR$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR" ADD CONSTRAINT "MOVEMENT_ATTR$FK00" FOREIGN KEY ("MVMNTID")
	  REFERENCES "DL_BORDERCONTROL"."MOVEMENTS" ("MVMNTID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."MVMNTID" IS 'Foreign Key to Movements Table';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."SEQNO" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."ATTRVARCHAR" IS 'Name of Attributes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."ATTRBLOB" IS 'Image';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR"  IS 'Not in use';
  CREATE INDEX "DL_BORDERCONTROL"."MOVEMENT_ATTR$IX00" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENT_ATTR$IX01" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" ("INS_TERMINAL") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."PK_MOVEMENT_ATTR" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" ("MVMNTID", "SEQNO") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311917C00004$$" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" (
   LOCAL
 (PARTITION "SYS_IL_P7257" ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."MOVEMENT_ATTR$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.MOVEMENT_ATTR
--follows <OWNER>.<TRIGGER>
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    29.01.2018  Added
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
    if (:new.MVMNTID != :old.MVMNTID or :new.SEQNO != :old.SEQNO)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                              ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                              ,o_INS_TERMINAL   in MOVEMENT_ATTR.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in MOVEMENT_ATTR.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type
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
                                 ,'Check borderpost and belonging terminal for (p_MVMNTID, p_SEQNO)[''' || p_MVMNTID || ''', ' || p_SEQNO || '], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
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
      L_Check_FK_Content(:new.MVMNTID
                        ,:new.SEQNO
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
      L_Check_FK_Content(:new.MVMNTID
                        ,:new.SEQNO
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into MOVEMENT_ATTR$HIS
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
        insert into MOVEMENT_ATTR$HIS
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
      insert into MOVEMENT_ATTR$HIS
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
      insert into MOVEMENT_ATTR$HIS
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
end MOVEMENT_ATTR$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."MOVEMENT_ATTR$TIUD0" ENABLE;
