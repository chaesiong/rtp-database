CREATE TABLE "DL_BORDERCONTROL"."THAIPASSPORT" 
   (	"CITIZENID" VARCHAR2(13 CHAR) NOT NULL ENABLE, 
	"PERSONID" VARCHAR2(20 CHAR), 
	"PASSPORTNO" VARCHAR2(12 CHAR) NOT NULL ENABLE, 
	"PASSNO" VARCHAR2(4 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"NATIONCD" VARCHAR2(3 CHAR), 
	"HEIGHT" NUMBER, 
	"WEIGHT" NUMBER, 
	"ADDR" VARCHAR2(60 CHAR), 
	"DISTRICT" VARCHAR2(60 CHAR), 
	"CITYCD" VARCHAR2(3 CHAR), 
	"STATECD" VARCHAR2(2 CHAR), 
	"ZIPCODE" VARCHAR2(5 CHAR), 
	"TELNO" VARCHAR2(60 CHAR), 
	"PASSPORTDTE" DATE, 
	"PASSPORTEXPDTE" DATE, 
	"MICROROLLNO" VARCHAR2(4 CHAR), 
	"MICROPICNO" VARCHAR2(10 CHAR), 
	"MICROPICNOL" VARCHAR2(4 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"IMGPASS" BLOB, 
	"BIRTHPLACE" VARCHAR2(50 CHAR), 
	"DOMICILE" VARCHAR2(50 CHAR), 
	"PPS_SEQNO" NUMBER, 
	"PASS_SEQNO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"TYPEDPASSPORT" VARCHAR2(1 CHAR), 
	"PASSPORTSTS" VARCHAR2(1 CHAR), 
	"TMPPASS_SEQNO" NUMBER, 
	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ACTIVE" NUMBER(1,0) DEFAULT ON NULL 1 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."THAIPASSPORT" ADD CONSTRAINT "THAIPASSPORT$CHK00" CHECK (DML_TYPE in ('I'
                                                                                              ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."THAIPASSPORT" ADD CONSTRAINT "THAIPASSPORT$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."CITIZENID" IS 'Citizen ID';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."PERSONID" IS 'Person ID';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."PASSPORTNO" IS 'Passport Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."PASSNO" IS 'Document Type?';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."TFAMILYNM" IS 'Surname Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."TFIRSTNM" IS 'Firstname Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."TMIDDLENM" IS 'Middlename Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."EFAMILYNM" IS 'Surname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."EFIRSTNM" IS 'Firstname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."EMIDDLENM" IS 'Middlename';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."SEX" IS 'Column for Gender';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."NATIONCD" IS 'country Code of Nationality';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."HEIGHT" IS 'Height';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."WEIGHT" IS 'Weight';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."ADDR" IS 'Address';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."DISTRICT" IS 'District';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."CITYCD" IS 'City';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."STATECD" IS 'State';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."ZIPCODE" IS 'Zipcode';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."TELNO" IS 'Telephone Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."PASSPORTDTE" IS 'Issuring Date of Passport';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."PASSPORTEXPDTE" IS 'Expiry Date of Passport';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."MICROROLLNO" IS 'Microroll Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."MICROPICNO" IS 'Micropic Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."MICROPICNOL" IS 'MICROPICNOL';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."BIRTHDTE" IS 'Date of Birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."IMGPASS" IS 'Passport Image';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."BIRTHPLACE" IS 'Place of Birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."DOMICILE" IS 'DOMICILE';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."PPS_SEQNO" IS 'PPS_SEQNO';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."PASS_SEQNO" IS 'PASS_SEQNO';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."CREATE_DATE" IS 'Date of Creation';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."UPDATE_DATE" IS 'Date of last Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."TYPEDPASSPORT" IS 'TYPEDPASSPORT';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."PASSPORTSTS" IS 'PASSPORTSTS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."TMPPASS_SEQNO" IS 'TMPPASS_SEQNO';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."THAIPASSPORT"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_BORDERCONTROL"."THAIPASSPORT"  IS 'Used in BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$00" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("EFAMILYNM") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$01" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("EFIRSTNM") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$02" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("TFAMILYNM") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$03" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("TFIRSTNM") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$04" ON "DL_BORDERCONTROL"."THAIPASSPORT" (TO_CHAR("CREATE_DATE",'YYYYMMDD')) 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$05" ON "DL_BORDERCONTROL"."THAIPASSPORT" (TO_CHAR("PASSPORTDTE",'YYYYMMDD')) 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$06" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("BIRTHDTE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$07" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("EMIDDLENM") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$08" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("PASSPORTNO") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$IX90" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("KEY_VALUE", LOWER(TRIM("TFAMILYNM")), LOWER(TRIM("TMIDDLENM")), LOWER(TRIM("TFIRSTNM"))) 
  ;
CREATE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$IX91" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("KEY_VALUE", SOUNDEX(TRIM("TFAMILYNM")), SOUNDEX(TRIM("TMIDDLENM")), SOUNDEX(TRIM("TFIRSTNM"))) 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312062C00027$$" ON "DL_BORDERCONTROL"."THAIPASSPORT" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$PK" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."THAIPASSPORT$UQ00" ON "DL_BORDERCONTROL"."THAIPASSPORT" ("CITIZENID", "PASSPORTNO") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."THAIPASSPORT" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."THAIPASSPORT$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.THAIPASSPORT
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
  procedure L_Check_FK_Content(p_KEY_VALUE in THAIPASSPORT.KEY_VALUE%type
                               --,o_INS_TERMINAL   in THAIPASSPORT.INS_TERMINAL%type
                               --,n_INS_TERMINAL   in THAIPASSPORT.INS_TERMINAL%type
                               --,o_INS_BORDERPOST in THAIPASSPORT.INS_BORDERPOST%type
                               --,n_INS_BORDERPOST in THAIPASSPORT.INS_BORDERPOST%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    null;
    --
    --
    /*
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
                                 ,'Check borderpost and belonging terminal for ID[''' || p_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
      end;
    end if;
    */
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
    /*
    if (v_DML_TYPE in ('I'
                      ,'U')
       --
       and :new.INS_BORDERPOST is null and :new.INS_TERMINAL is not null)
    then
      --
      :new.INS_BORDERPOST := DL_BORDERCONTROL.PKG_COMMON.Get_Borderpost4TERM_ID(:new.INS_TERMINAL);
      --
    end if;
    */
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
                         --,null
                         --,:new.INS_TERMINAL
                         --,null
                         --,:new.INS_BORDERPOST
                         --
                         );
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                         --,:old.INS_TERMINAL
                         --,:new.INS_TERMINAL
                         --,:old.INS_BORDERPOST
                         --,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into THAIPASSPORTS$HIS
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
        insert into THAIPASSPORTS$HIS
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
      insert into THAIPASSPORTS$HIS
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
      insert into THAIPASSPORTS$HIS
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
end THAIPASSPORT$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."THAIPASSPORT$TIUD0" ENABLE;
