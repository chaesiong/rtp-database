CREATE TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"COUTRY_CODE" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"DIRECTION" NUMBER NOT NULL ENABLE, 
	"NEED_LC" NUMBER NOT NULL ENABLE, 
	"NEED_VISUM" NUMBER NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NEED_HEALTHCHECK" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"MESSAGE_DONE" VARCHAR2(255 CHAR), 
	"MESSAGE_FINGERS_RIGHT" VARCHAR2(255 CHAR), 
	"MESSAGE_FINGERS_LEFT" VARCHAR2(255 CHAR), 
	"MESSAGE_THUMBS" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ADD CONSTRAINT "COUNTRY_MANAGEMENT$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ADD CONSTRAINT "COUNTRY_MANAGEMENT$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                          ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ADD CONSTRAINT "COUNTRY_MANAGEMENT$FK00" FOREIGN KEY ("COUTRY_CODE")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."ID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."COUTRY_CODE" IS 'Column for Country Code';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."DIRECTION" IS 'Column for Direction (arrival or departure';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."NEED_LC" IS 'Flag if traveller LC';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."NEED_VISUM" IS 'Flag if traveller need visum';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."NEED_HEALTHCHECK" IS 'Travelers from this country must be checked for illness';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."MESSAGE_DONE" IS 'The message to show on bioscreen display when the passenger from this land is done';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."MESSAGE_FINGERS_RIGHT" IS 'The message to show on bioscreen display when the passenger from this land captures the right hand';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."MESSAGE_FINGERS_LEFT" IS 'The message to show on bioscreen display when the passenger from this land captures the left hand';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."MESSAGE_THUMBS" IS 'The message to show on bioscreen display when the passenger from this land captures the thumbs';
   COMMENT ON TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"  IS 'Is used for BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$IX00" ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ("COUTRY_CODE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$IX01" ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$IX02" ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ("INS_TERMINAL") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$PK" ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ("ID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.COUNTRY_MANAGEMENT
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
    if (:new.ID != :old.ID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_ID             in COUNTRY_MANAGEMENT.ID%type
                              ,o_COUTRY_CODE    in COUNTRY_MANAGEMENT.COUTRY_CODE%type
                              ,n_COUTRY_CODE    in COUNTRY_MANAGEMENT.COUTRY_CODE%type
                              ,o_INS_TERMINAL   in COUNTRY_MANAGEMENT.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in COUNTRY_MANAGEMENT.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in COUNTRY_MANAGEMENT.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in COUNTRY_MANAGEMENT.INS_BORDERPOST%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_COUTRY_CODE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_COUTRY_CODE
                                                                     ,o_COUTRY_CODE))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.ICAO_DOC_CODES t
         where t.KEY_VALUE = n_COUTRY_CODE;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The COUTRY_CODE[''' || n_COUTRY_CODE || '''] is not active! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The COUTRY_CODE[''' || n_COUTRY_CODE || '''] does not exist! For ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    /*if (n_INS_TERMINAL is not null
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
                                 ,'Check borderpost and belonging terminal for ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
      end;
    end if;*/
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
    /*if (v_DML_TYPE in ('I'
                      ,'U')
       --
       and :new.INS_BORDERPOST is null and :new.INS_TERMINAL is not null)
    then
      --
      :new.INS_BORDERPOST := DL_BORDERCONTROL.PKG_COMMON.Get_Borderpost4TERM_ID(:new.INS_TERMINAL);
      --
    end if;*/
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
      L_Check_FK_Content(:new.ID
                        ,null
                        ,:new.COUTRY_CODE
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
      L_Check_FK_Content(:new.ID
                        ,:old.COUTRY_CODE
                        ,:new.COUTRY_CODE
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into COUNTRY_MANAGEMENT$HIS
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
        insert into COUNTRY_MANAGEMENT$HIS
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
      insert into COUNTRY_MANAGEMENT$HIS
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
      insert into COUNTRY_MANAGEMENT$HIS
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
end COUNTRY_MANAGEMENT$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$TIUD0" ENABLE;
