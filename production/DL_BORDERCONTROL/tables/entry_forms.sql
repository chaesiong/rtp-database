CREATE TABLE "DL_BORDERCONTROL"."ENTRY_FORMS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"FORM_IMAGE" BLOB, 
	"FORM_NO" VARCHAR2(32 CHAR), 
	"PROVINCE" VARCHAR2(32 CHAR), 
	"DISTRICT" VARCHAR2(32 CHAR), 
	"SUBDISTRICT" VARCHAR2(32 CHAR), 
	"ADDRESS" VARCHAR2(255 CHAR), 
	"NOTE" VARCHAR2(4000 CHAR)
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1 ,'MONTH')) 
 (PARTITION "P_BEFORE_2018"  VALUES LESS THAN (TO_DATE(' 2018-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) ) ;
  ALTER TABLE "DL_BORDERCONTROL"."ENTRY_FORMS" ADD CONSTRAINT "ENTRY_FORMS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ENTRY_FORMS" ADD CONSTRAINT "ENTRY_FORMS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                            ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ENTRY_FORMS" ADD CONSTRAINT "ENTRY_FORMS$FK02" FOREIGN KEY ("PROVINCE")
	  REFERENCES "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ENTRY_FORMS" ADD CONSTRAINT "ENTRY_FORMS$FK03" FOREIGN KEY ("DISTRICT")
	  REFERENCES "DL_BORDERCONTROL"."ADM_CLASS_DISTRICT" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ENTRY_FORMS" ADD CONSTRAINT "ENTRY_FORMS$FK04" FOREIGN KEY ("SUBDISTRICT")
	  REFERENCES "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."INS_TERMINAL" IS 'Terminal, where data was inserted (Foreign Key)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."INS_BORDERPOST" IS 'Borderpost, where data was inserted (Foreign Key)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."FORM_IMAGE" IS 'Colum for image of TM6';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."FORM_NO" IS 'Colum for TM6 Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."PROVINCE" IS 'Column for Province';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."DISTRICT" IS 'Column for district';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."SUBDISTRICT" IS 'Column for subdistrict';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."ADDRESS" IS 'Column for address';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ENTRY_FORMS"."NOTE" IS 'Column for notes';
   COMMENT ON TABLE "DL_BORDERCONTROL"."ENTRY_FORMS"  IS 'Table for Entry Forms (TM6) used in BmBS, VOA, Re-Entry';
  CREATE INDEX "DL_BORDERCONTROL"."ENTRY_FORMS$IX00" ON "DL_BORDERCONTROL"."ENTRY_FORMS" ("INS_BORDERPOST") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."ENTRY_FORMS$IX01" ON "DL_BORDERCONTROL"."ENTRY_FORMS" ("INS_TERMINAL") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."ENTRY_FORMS$IX02" ON "DL_BORDERCONTROL"."ENTRY_FORMS" ("FORM_NO") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."ENTRY_FORMS$PK" ON "DL_BORDERCONTROL"."ENTRY_FORMS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311906C00009$$" ON "DL_BORDERCONTROL"."ENTRY_FORMS" (
   LOCAL
 (PARTITION "SYS_IL_P7255" ) ;
  GRANT DELETE ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "SERVAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_INTERFACE";
  GRANT DELETE ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_INTERFACE";
  GRANT INSERT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DL_BLACKLIST" WITH GRANT OPTION;
  GRANT SELECT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "APPSUP";
  GRANT INSERT ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ENTRY_FORMS" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."ENTRY_FORMS$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.ENTRY_FORMS
  compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    21.02.2018  Added
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
  procedure L_Check_FK_Content(p_KEY_VALUE      in ENTRY_FORMS.KEY_VALUE%type
                              ,o_INS_TERMINAL   in ENTRY_FORMS.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in ENTRY_FORMS.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in ENTRY_FORMS.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in ENTRY_FORMS.INS_BORDERPOST%type
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
      L_Check_FK_Content(:new.KEY_VALUE
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
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into MOVEMENT_CHILDREN$HIS
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
        insert into MOVEMENT_CHILDREN$HIS
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
      insert into MOVEMENT_CHILDREN$HIS
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
      insert into MOVEMENT_CHILDREN$HIS
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
end ENTRY_FORMS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."ENTRY_FORMS$TIUD0" ENABLE;
