CREATE TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" 
   (	"BRDDOCID" VARCHAR2(32 CHAR) DEFAULT ON NULL sys_guid() NOT NULL ENABLE, 
	"DOCTYPE" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"DOCNO" VARCHAR2(15 CHAR) NOT NULL ENABLE, 
	"ISSUECTRY" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"NAT" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"DOB" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"EXPIRYDATE" DATE NOT NULL ENABLE, 
	"GIVENNAME" VARCHAR2(150 CHAR), 
	"SURNAME" VARCHAR2(150 CHAR) NOT NULL ENABLE, 
	"OPTIONALDATA" VARCHAR2(16 CHAR), 
	"AFISID" NUMBER, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"OFFICER_OBSERVATION" VARCHAR2(255 CHAR), 
	"MRZDG1" VARCHAR2(90 CHAR), 
	"P_01" VARCHAR2(100 CHAR), 
	"P_02" VARCHAR2(100 CHAR), 
	"P_03" VARCHAR2(100 CHAR), 
	"P_04" VARCHAR2(100 CHAR), 
	"P_05" VARCHAR2(100 CHAR), 
	"MIDDLENAME" VARCHAR2(150 CHAR), 
	"GIVENNAME_THAI" VARCHAR2(150 CHAR), 
	"MIDDLENAME_THAI" VARCHAR2(150 CHAR), 
	"SURNAME_THAI" VARCHAR2(150 CHAR), 
	"CALC_DOB" DATE, 
	"MANUAL_EXPIRY_DATE" DATE, 
	"MANUAL_ISSUING_DATE" DATE, 
	"MANUAL_NATIONALITY" VARCHAR2(3 CHAR), 
	"MANUAL_PLACEOFBIRTH" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"SEX" NUMBER(32,0) NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DOCCLASS" VARCHAR2(32 CHAR), 
	"SUB_NATIONALITY" VARCHAR2(32 CHAR), 
	"SOURCE_SYSTEM" NUMBER DEFAULT ON NULL 1 NOT NULL ENABLE, 
	"CALC_MRZDG1" VARCHAR2(90 CHAR), 
	"DOB_PARTIAL" "DL_BORDERCONTROL"."CT_PARTIAL_DATE_TYPE" 
   )   NO INMEMORY ;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$CHK01" CHECK ( trunc(expirydate) = expirydate ) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$CHK00" CHECK ( dml_type IN ( 'I','U') ) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS_PK" PRIMARY KEY ("BRDDOCID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$FK01" FOREIGN KEY ("ISSUECTRY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$FK02" FOREIGN KEY ("NAT")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$FK03" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("NUM_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."BRDDOCID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOCTYPE" IS 'Column for Document Type';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOCNO" IS 'Column for Document Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."ISSUECTRY" IS 'Column for Issuring Country';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."NAT" IS 'Column for Nationality';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOB" IS 'Column for Date of Birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."EXPIRYDATE" IS 'Column for expirydate';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."GIVENNAME" IS 'Column for givenname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SURNAME" IS 'Column for surname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."OPTIONALDATA" IS 'Column for optional data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."AFISID" IS 'Column for AFIS-ID';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."INS_TERMINAL" IS 'Terminal, where data was inserted (Foreign Key)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."INS_BORDERPOST" IS 'Borderpost, where data was inserted (Foreign Key)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."OFFICER_OBSERVATION" IS 'Column for officer observation';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MRZDG1" IS 'Machine Readable Zone ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_01" IS 'p_01';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_02" IS 'p_02';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_03" IS 'p_03';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_04" IS 'p_04';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_05" IS 'p_05';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MIDDLENAME" IS 'Column for middlename';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."GIVENNAME_THAI" IS 'Column for givenname thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MIDDLENAME_THAI" IS 'Column for middlename thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SURNAME_THAI" IS 'Column for surname in thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."CALC_DOB" IS 'Column for calculate Date of Birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MANUAL_EXPIRY_DATE" IS 'Border document data that differ from automatically read data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MANUAL_ISSUING_DATE" IS 'Border document data that differ from automatically read data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MANUAL_NATIONALITY" IS 'Border document data that differ from automatically read data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MANUAL_PLACEOFBIRTH" IS 'Border document data that differ from automatically read data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SEX" IS 'Column for Sex/Gender';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOCCLASS" IS 'Defines the document class (like passport, id, image, etc.); FK to table dl_common.bc_doc_types';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SUB_NATIONALITY" IS 'Sub-nationality (e.g. there are several sub-nationalities in china); soft-fk to DL_COMMON.SUB_NATIONALITIES';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SOURCE_SYSTEM" IS '1=BmbS 2=PIBICS 4=Offline';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOB_PARTIAL" IS 'Special Date Type for Date of Birth, day and month can be zero';
   COMMENT ON TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS"  IS 'Is used for BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX00" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("DOCTYPE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX01" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("ISSUECTRY") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX02" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("NAT") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX03" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("SEX") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX05" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX06" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("INS_TERMINAL") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX07" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("DOCCLASS") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX08" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("AFISID", '1') 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX09" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("NAT", "DOB", "SURNAME") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$UK1" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("DOCNO", "ISSUECTRY", "EXPIRYDATE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS_PK" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("BRDDOCID") 
  ;
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "SERVAPP";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "APPSUP";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "TRAINEE";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BLACKLIST";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."BORDERDOCUMENTS$TIUD0" 
  for insert or update or delete ON DL_BORDERCONTROL.BORDERDOCUMENTS 
compound trigger
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    11.10.2017  Added
  * WWirns    10.11.2017  Added checks for IS_ACTIVE of FK-Columns-Content
  * WWirns    13.11.2017  Additional natural checks for references by NUM_VALUE
  * CFunke    22.11.2017  Added some columns
  * WWirns    03.01.2018  L_Check_FK_Content changed
  * WWirns    20.03.2018  Improve assignments of v_DML_TYPE
  * CHageman  01.06.2018  Changed behavior of doctype
  * CFunke    20.06.2018  Remove check on bc_doc_class
  * MSCS      19.07.2019  Modified L_Set_Calc_DOB to use DOB_PARTIAL column
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
    if (:new.BRDDOCID != :old.BRDDOCID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_BRDDOCID       in BORDERDOCUMENTS.BRDDOCID%type
                              ,o_DOCCLASS       in borderdocuments.docclass%type
                              ,n_DOCCLASS       in borderdocuments.docclass%type
                              ,o_DOCTYPE        in BORDERDOCUMENTS.DOCTYPE%type
                              ,n_DOCTYPE        in BORDERDOCUMENTS.DOCTYPE%type
                              ,o_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                              ,n_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                              ,o_NAT            in BORDERDOCUMENTS.NAT%type
                              ,n_NAT            in BORDERDOCUMENTS.NAT%type
                              ,o_SEX            in BORDERDOCUMENTS.SEX%type
                              ,n_SEX            in BORDERDOCUMENTS.SEX%type
                              ,o_INS_TERMINAL   in BORDERDOCUMENTS.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in BORDERDOCUMENTS.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in BORDERDOCUMENTS.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in BORDERDOCUMENTS.INS_BORDERPOST%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
  /*
  if (n_DOCCLASS is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_DOCCLASS, o_DOCCLASS))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.BC_DOC_TYPES t
         where t.KEY_VALUE = n_DOCCLASS;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The DOCCLASS[''' || n_DOCCLASS || '''] is not active! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The DOCCLASS[''' || n_DOCCLASS || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if; */

    /*
    -- 01.06.2018: C.Hagemann
    -- Removed logical foreign key of doctype to dl_common.bc_doc_types as the logic behind this field was changed
    -- Added field docclass as foreign key to the table borderdocuments

    if (n_DOCTYPE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_DOCTYPE
                                                                 ,o_DOCTYPE))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.BC_DOC_TYPES t
         where t.KEY_VALUE = n_DOCTYPE;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The DOCTYPE[''' || n_DOCTYPE || '''] is not active! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          -- Free input of DOCTYPE is allowed!

          Raise_application_error(-20000
                                 ,'The DOCTYPE[''' || n_DOCTYPE || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');

          null;
      end;
    end if;*/
    --
    --
    if (n_ISSUECTRY is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_ISSUECTRY
                                                                   ,o_ISSUECTRY))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.ICAO_DOC_CODES t
         where t.KEY_VALUE = n_ISSUECTRY;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The ISSUECTRY[''' || n_ISSUECTRY || '''] is not active! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The ISSUECTRY[''' || n_ISSUECTRY || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_NAT is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_NAT
                                                             ,o_NAT))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.ICAO_DOC_CODES t
         where t.KEY_VALUE = n_NAT;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The NAT[''' || n_NAT || '''] is not active! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The NAT[''' || n_NAT || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (n_SEX is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_SEX
                                                             ,o_SEX))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.HUMAN_SEXES t
         where t.NUM_VALUE = n_SEX
           and t.NUM_VALUE is not null;
        if (v_vc_Tmp != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The SEX[''' || n_SEX || '''] is not active or not an ICAO type! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The SEX[''' || n_SEX || '''] does not exist! For BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
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
                                 ,'Check borderpost and belonging terminal for BRDDOCID[''' || p_BRDDOCID || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
      end;
    end if;
    --
  end L_Check_FK_Content;
  --
  procedure L_Set_Calc_DOB(n_DOB in BORDERDOCUMENTS.DOB%type) is
    --
    v_ddmmrr varchar2(6);
    v_DOB_Partial DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;
    v_calc_DOB date;
    --
  begin
    if n_DOB is not null
    then
      v_ddmmrr      := substr(n_DOB
                             ,5
                             ,2) || substr(n_DOB
                                          ,3
                                          ,2) || substr(n_DOB
                                                       ,1
                                                       ,2);
      
      v_DOB_Partial := DL_BORDERCONTROL.PKG_COMMON.Get_Partial_Date(v_ddmmrr
                                                                   , 1
                                                                   --
                                                                   );
      
      if v_DOB_Partial.isValidDate() = 1 then
         v_calc_DOB := v_DOB_Partial.getDate();
      end if;
      
      :new.CALC_DOB := v_calc_DOB;
    end if;
  end;
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
      L_Set_Calc_DOB(:new.DOB);
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
      L_Set_Calc_DOB(:new.DOB);
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
      L_Check_FK_Content(:new.BRDDOCID
                        ,null
                        ,:new.docclass
                        ,null
                        ,:new.DOCTYPE
                        ,null
                        ,:new.ISSUECTRY
                        ,null
                        ,:new.NAT
                        ,null
                        ,:new.SEX
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
      L_Check_FK_Content(:new.BRDDOCID
                        ,:old.docclass
                        ,:new.docclass
                        ,:old.DOCTYPE
                        ,:new.DOCTYPE
                        ,:old.ISSUECTRY
                        ,:new.ISSUECTRY
                        ,:old.NAT
                        ,:new.NAT
                        ,:old.SEX
                        ,:new.SEX
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into BORDERDOCUMENTS$HIS
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
        insert into BORDERDOCUMENTS$HIS
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
      insert into BORDERDOCUMENTS$HIS
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
      insert into BORDERDOCUMENTS$HIS
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
end BORDERDOCUMENTS$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."BORDERDOCUMENTS$TIUD0" ENABLE;
