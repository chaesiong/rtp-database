CREATE TABLE "DL_BORDERCONTROL"."MOVEMENTS" 
   (	"MVMNTID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"BRDDOCID" VARCHAR2(32 CHAR), 
	"LANDBARCD" NUMBER(14,0), 
	"EXITFLG" NUMBER(1,0) NOT NULL ENABLE, 
	"MAX_STAY_DT" DATE, 
	"FINGERMATCH" NUMBER(3,0), 
	"FACEMATCH" NUMBER(3,0), 
	"MVMNTADDR" VARCHAR2(40 CHAR), 
	"ORIDEST" VARCHAR2(80 CHAR), 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"REFUSEDFLG" NUMBER, 
	"OBSERVATION" VARCHAR2(255 CHAR), 
	"TRNSPRTUNITID" VARCHAR2(32 CHAR), 
	"PERSON_TYPE" NUMBER(32,0), 
	"SCANNED_FLIGHT" VARCHAR2(20 CHAR), 
	"PS_1" VARCHAR2(256 CHAR), 
	"PS_2" VARCHAR2(256 CHAR), 
	"PS_3" VARCHAR2(256 CHAR), 
	"PS_4" VARCHAR2(256 CHAR), 
	"PS_5" VARCHAR2(256 CHAR), 
	"PS_6" NUMBER, 
	"PS_7" NUMBER, 
	"PS_8" NUMBER, 
	"PS_9" NUMBER, 
	"PS_10" NUMBER, 
	"FINGERMATCH_HISTORY" NUMBER, 
	"FACEMATC_HISTORY" NUMBER, 
	"REASON_OFFLOAD" VARCHAR2(256 CHAR), 
	"REASON_DEPORTEE" VARCHAR2(256 CHAR), 
	"VISA_TYPE" VARCHAR2(32 CHAR), 
	"VISA" VARCHAR2(32 CHAR), 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"IS_FINISHED" VARCHAR2(1 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE, 
	"PRIOR_MOVEMENT" VARCHAR2(32 CHAR), 
	"ENTRY_FORM" VARCHAR2(32 CHAR), 
	"FORM_NO_APPROVED" VARCHAR2(1 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE, 
	"MOVEMENT_DT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"SOURCE_SYSTEM" NUMBER NOT NULL ENABLE, 
	"DATE_OF_ENTRY" TIMESTAMP (6), 
	"MRZVISA" VARCHAR2(255 CHAR)
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1 ,'MONTH')) 
 (PARTITION "P_BEFORE_2018"  VALUES LESS THAN (TIMESTAMP' 2018-01-01 00:00:00') ) ;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS_PK" PRIMARY KEY ("MVMNTID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                        ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$CHK01" CHECK (IS_FINISHED in ('N'
                                                                                           ,'Y')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$CHK02" CHECK (FORM_NO_APPROVED in ('N'
                                                                                                ,'Y')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$UQ00" UNIQUE ("BRDDOCID", "MOVEMENT_DT") DISABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$FK00" FOREIGN KEY ("EXITFLG")
	  REFERENCES "DL_COMMON"."PORT_MOVEMENTS" ("NUM_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$FK01" FOREIGN KEY ("BRDDOCID")
	  REFERENCES "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("BRDDOCID") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$FK02" FOREIGN KEY ("PERSON_TYPE")
	  REFERENCES "DL_COMMON"."BC_PERSON_TYPES" ("NUM_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$FK03" FOREIGN KEY ("VISA_TYPE")
	  REFERENCES "DL_COMMON"."VISA_TYPES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$FK04" FOREIGN KEY ("VISA")
	  REFERENCES "DL_BORDERCONTROL"."VISAS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS" ADD CONSTRAINT "MOVEMENTS$FK07" FOREIGN KEY ("PRIOR_MOVEMENT")
	  REFERENCES "DL_BORDERCONTROL"."MOVEMENTS" ("MVMNTID") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."MVMNTID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."BRDDOCID" IS 'Foreign Key to Table Borderducuments';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."LANDBARCD" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."EXITFLG" IS 'Foreign Keyto Table DL_COMMON.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."MAX_STAY_DT" IS 'The date when the traveller must have leaved the country';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."FINGERMATCH" IS 'Check Fingermatch';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."FACEMATCH" IS 'CheckFacematch';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."MVMNTADDR" IS 'MVMNTADDR';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."ORIDEST" IS 'ORIDEST';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."REFUSEDFLG" IS 'REFUSEDFLG';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."OBSERVATION" IS 'OBSERVATION';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."TRNSPRTUNITID" IS 'TRNSPRTUNITID';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PERSON_TYPE" IS 'The type of the person who crosses the border';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."SCANNED_FLIGHT" IS 'Flight Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_1" IS 'PS_1';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_2" IS 'PS_2';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_3" IS 'PS_3';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_4" IS 'PS_4';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_5" IS 'PS_5';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_6" IS 'PS_6';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_7" IS 'PS_7';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_8" IS 'PS_8';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_9" IS 'PS_9';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PS_10" IS 'PS_10';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."FINGERMATCH_HISTORY" IS 'FINGERMATCH HISTORY';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."FACEMATC_HISTORY" IS 'FACEMATC HISTORY';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."REASON_OFFLOAD" IS 'REASON OFFLOAD';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."REASON_DEPORTEE" IS 'REASON DEPORTEE';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."VISA_TYPE" IS 'The used visa type for the movement';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."VISA" IS 'The used visa for the movement';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."IS_FINISHED" IS 'Flag: If the movement is finished Y.es otherwise N.o';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."PRIOR_MOVEMENT" IS 'The prior movement of the current one, for example for an exit it points to the movement that represents the entry';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."ENTRY_FORM" IS 'The filled out entry form used for this movement';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."FORM_NO_APPROVED" IS 'Flag: If the Officer has checked the TM6 Number it is Y.es otherwise N.o';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."MOVEMENT_DT" IS 'When takes place the movement';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."SOURCE_SYSTEM" IS '1=BmbS 2= PIBICS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."DATE_OF_ENTRY" IS 'Date of Entry';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS"."MRZVISA" IS 'MRZ number of VISA document';
   COMMENT ON TABLE "DL_BORDERCONTROL"."MOVEMENTS"  IS 'Used in BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."I_MOVEMENTS_BRDDOCID" ON "DL_BORDERCONTROL"."MOVEMENTS" ("BRDDOCID") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS$IX02" ON "DL_BORDERCONTROL"."MOVEMENTS" ("EXITFLG") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS$IX03" ON "DL_BORDERCONTROL"."MOVEMENTS" ("PERSON_TYPE") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS$IX04" ON "DL_BORDERCONTROL"."MOVEMENTS" ("VISA_TYPE") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS$IX05" ON "DL_BORDERCONTROL"."MOVEMENTS" ("VISA") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS$IX06" ON "DL_BORDERCONTROL"."MOVEMENTS" ("INS_BORDERPOST") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS$IX07" ON "DL_BORDERCONTROL"."MOVEMENTS" ("INS_TERMINAL") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS$IX08" ON "DL_BORDERCONTROL"."MOVEMENTS" ("ENTRY_FORM") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS$IX09" ON "DL_BORDERCONTROL"."MOVEMENTS" ("MOVEMENT_DT") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS_CREATED_IDX" ON "DL_BORDERCONTROL"."MOVEMENTS" ("INS_AT") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."MOVEMENTS_PK" ON "DL_BORDERCONTROL"."MOVEMENTS" ("MVMNTID") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "SERVAPP";
  GRANT DELETE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_INTERFACE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "APPSUP";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "TRAINEE";
  GRANT ALTER ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT DELETE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT INDEX ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT READ ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT DEBUG ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_MAINTENANCE";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."MOVEMENTS" TO "DL_BLACKLIST";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."MOVEMENTS$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.MOVEMENTS
  compound trigger
--
  --
  /*******************************************************************************
  * 
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    23.10.2017  Added
  * WWirns    10.11.2017  Added checks for IS_ACTIVE of FK-Columns-Content
  * WWirns    13.11.2017  Added L_Get_Borderpost()
  * WWirns    15.12.2017  Rename PSSNGRSTATUS to PERSON_TYPE and drop RNKDSGNTDID and extend L_Check_FK_Content
  * WWirns    03.01.2018  L_Check_FK_Content changed
  * WWirns    30.01.2018  Add VISA_TYPE and change VISA
  * WWirns    21.02.2018  Add link to prior MOVEMENTS
  * WWirns    21.02.2018  Add link to ENTRY_FORMS
  * WWirns    22.02.2018  Add ENTRY_FORM check
  * WWirns    22.02.2018  Only Check_FK_Content if IS_FINISHED is 'Y'
  * WWirns    27.02.2018  Add check against ICAO_DC_LIST4NO_ENTRY_FORM
  * WWirns    01.03.2018  Add procedure L_Check_Prior_MOVEMENT$AT to avoid error "mutating table"
  * WWirns    02.03.2018  Add check for MUST_APPROVE_ENTRY_FORM_NO
  * WWirns    20.03.2018  Add column MOVEMENT_DT
  * WWirns    20.03.2018  Improve assignments of v_DML_TYPE and v_PORT_MOVEMENTS
  * M.Bock    19.07.2019  Allow INS_BY, DML_BY to be set explicitly
  *******************************************************************************/
  --
  --
  type rt_PORT_MOVEMENT is record(
     IS_ACTIVE                  DL_COMMON.PORT_MOVEMENTS.IS_ACTIVE%type
    ,IS_NEED_ENTRY_FORM         DL_COMMON.PORT_MOVEMENTS.IS_NEED_ENTRY_FORM%type
    ,ICAO_DC_LIST4NO_ENTRY_FORM DL_COMMON.PORT_MOVEMENTS.ICAO_DC_LIST4NO_ENTRY_FORM%type
    ,MUST_APPROVE_ENTRY_FORM_NO DL_COMMON.PORT_MOVEMENTS.MUST_APPROVE_ENTRY_FORM_NO%type
    --
    );
  --
  type tt_PORT_MOVEMENT$WC38 is table of rt_PORT_MOVEMENT index by varchar2(38 char);
  --
  v_DML_TYPE       char(1);
  v_PORT_MOVEMENTS tt_PORT_MOVEMENT$WC38;
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
  procedure L_Set_PORT_MOVEMENTS is
    --
    v_PORT_MOVEMENT rt_PORT_MOVEMENT;
    --
  begin
    --
    for R0 in (
               --
               select trim(t.NUM_VALUE) as NUM_VALUE
                      ,t.IS_ACTIVE
                      ,t.IS_NEED_ENTRY_FORM
                      ,t.ICAO_DC_LIST4NO_ENTRY_FORM
                      ,t.MUST_APPROVE_ENTRY_FORM_NO
                 from DL_COMMON.PORT_MOVEMENTS t
               --
               )
    loop
      v_PORT_MOVEMENT.IS_ACTIVE := R0.IS_ACTIVE;
      v_PORT_MOVEMENT.IS_NEED_ENTRY_FORM := R0.IS_NEED_ENTRY_FORM;
      v_PORT_MOVEMENT.ICAO_DC_LIST4NO_ENTRY_FORM := R0.ICAO_DC_LIST4NO_ENTRY_FORM;
      v_PORT_MOVEMENT.MUST_APPROVE_ENTRY_FORM_NO := R0.MUST_APPROVE_ENTRY_FORM_NO;
      v_PORT_MOVEMENTS(R0.NUM_VALUE) := v_PORT_MOVEMENT;
    end loop;
    --
  end L_Set_PORT_MOVEMENTS;
  --
  --
  function L_Has_PK_Value_Changed return boolean is
  begin
    if (:new.MVMNTID != :old.MVMNTID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  --
  procedure L_Check_Prior_MOVEMENT$AT(p_MVMNTID        in MOVEMENTS.MVMNTID%type
                                     ,p_PRIOR_MOVEMENT in MOVEMENTS.PRIOR_MOVEMENT%type
                                     ,p_EXITFLG        in MOVEMENTS.EXITFLG%type
                                      --
                                      ) is
    --
    pragma autonomous_transaction;
    --
    v_n_Tmp number;
    --
  begin
    --
    if (p_PRIOR_MOVEMENT = p_MVMNTID)
    then
      Raise_application_error(-20000
                             ,'This movement cannot be the PRIOR_MOVEMENT[''' || p_PRIOR_MOVEMENT || '''] for itself! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
    end if;
    begin
      select t.EXITFLG
        into v_n_Tmp
        from MOVEMENTS t
       where t.MVMNTID = p_PRIOR_MOVEMENT
         and t.IS_FINISHED = 'Y';
      if (v_n_Tmp = p_EXITFLG)
      then
        Raise_application_error(-20000
                               ,'The PRIOR_MOVEMENT[''' || p_PRIOR_MOVEMENT || '''] cannot have the same EXITFLG as this movement! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end if;
    exception
      when NO_DATA_FOUND then
        Raise_application_error(-20000
                               ,'The PRIOR_MOVEMENT[''' || p_PRIOR_MOVEMENT || '''] does not exist or ist not finished! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
    end;
    --
  end L_Check_Prior_MOVEMENT$AT;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_MVMNTID          in MOVEMENTS.MVMNTID%type
                              ,p_BRDDOCID         in MOVEMENTS.BRDDOCID%type
                              ,p_IS_FINISHED      in MOVEMENTS.IS_FINISHED%type
                              ,o_EXITFLG          in MOVEMENTS.EXITFLG%type
                              ,n_EXITFLG          in MOVEMENTS.EXITFLG%type
                              ,o_PERSON_TYPE      in MOVEMENTS.PERSON_TYPE%type
                              ,n_PERSON_TYPE      in MOVEMENTS.PERSON_TYPE%type
                              ,o_VISA_TYPE        in MOVEMENTS.VISA_TYPE%type
                              ,n_VISA_TYPE        in MOVEMENTS.VISA_TYPE%type
                              ,o_INS_TERMINAL     in MOVEMENTS.INS_TERMINAL%type
                              ,n_INS_TERMINAL     in MOVEMENTS.INS_TERMINAL%type
                              ,o_INS_BORDERPOST   in MOVEMENTS.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST   in MOVEMENTS.INS_BORDERPOST%type
                              ,o_PRIOR_MOVEMENT   in MOVEMENTS.PRIOR_MOVEMENT%type
                              ,n_PRIOR_MOVEMENT   in MOVEMENTS.PRIOR_MOVEMENT%type
                              ,o_ENTRY_FORM       in MOVEMENTS.ENTRY_FORM%type
                              ,n_ENTRY_FORM       in MOVEMENTS.ENTRY_FORM%type
                              ,o_FORM_NO_APPROVED in MOVEMENTS.FORM_NO_APPROVED%type
                              ,n_FORM_NO_APPROVED in MOVEMENTS.FORM_NO_APPROVED%type
                              ,n_PS4              in MOVEMENTS.PS_4%type
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    v_NAT    BORDERDOCUMENTS.NAT%type;
    --
  begin
    --
    -- n_EXITFLG should be checked even the row is not finihed, yet!
    if (n_EXITFLG is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_EXITFLG
                                                                 ,o_EXITFLG))
    then
      begin
        if (v_PORT_MOVEMENTS(trim(n_EXITFLG)).IS_ACTIVE != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The EXITFLG[''' || n_EXITFLG || '''] is not active! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,'The EXITFLG[''' || n_EXITFLG || '''] does not exist! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
      end;
    end if;
    --
    --
    if (p_IS_FINISHED = 'Y')
    then
      --
      if (n_PERSON_TYPE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_PERSON_TYPE
                                                                       ,o_PERSON_TYPE))
      then
        begin
          select t.IS_ACTIVE
            into v_vc_Tmp
            from DL_COMMON.BC_PERSON_TYPES t
           where t.NUM_VALUE = n_PERSON_TYPE;
          if (v_vc_Tmp != 'Y')
          then
            Raise_application_error(-20000
                                   ,'The PERSON_TYPE[''' || n_PERSON_TYPE || '''] is not active! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
          end if;
        exception
          when NO_DATA_FOUND then
            Raise_application_error(-20000
                                   ,'The PERSON_TYPE[''' || n_PERSON_TYPE || '''] does not exist! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end;
        --
      end if;
      --
      --
      if (n_VISA_TYPE is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_VISA_TYPE
                                                                     ,o_VISA_TYPE))
      then
        begin
          select t.IS_ACTIVE
            into v_vc_Tmp
            from DL_COMMON.VISA_TYPES t
           where t.KEY_VALUE = n_VISA_TYPE;
          if (v_vc_Tmp != 'Y')
          then
            Raise_application_error(-20000
                                   ,'The VISA_TYPE[''' || n_VISA_TYPE || '''] is not active! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
          end if;
        exception
          when NO_DATA_FOUND then
            Raise_application_error(-20000
                                   ,'The VISA_TYPE[''' || n_VISA_TYPE || '''] does not exist! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end;
        --
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
                                   ,'Check borderpost and belonging terminal for p_MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
        end;
      end if;
      --
      --
      if (n_PRIOR_MOVEMENT is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_PRIOR_MOVEMENT
                                                                          ,o_PRIOR_MOVEMENT))
      then
        --
        L_Check_Prior_MOVEMENT$AT(p_MVMNTID
                                 ,n_PRIOR_MOVEMENT
                                 ,n_EXITFLG
                                  --
                                  );
        --
      end if;
      --
      --
      if (n_ENTRY_FORM is not null)
      then
        --
        if (not DL_COMMON.PKG_UTIL.Is_Equal(n_ENTRY_FORM
                                           ,o_ENTRY_FORM))
        then
          --
          null;
          --
        end if;
        --
      else
        --
        if (v_PORT_MOVEMENTS(trim(n_EXITFLG)).IS_NEED_ENTRY_FORM = 'Y' and n_PS4 is null)
        then
          --
          if (v_PORT_MOVEMENTS(trim(n_EXITFLG)).ICAO_DC_LIST4NO_ENTRY_FORM is not null and p_BRDDOCID is not null and n_PS4 is null)
          then
            select t.NAT
              into v_NAT
              from BORDERDOCUMENTS t
             where t.BRDDOCID = p_BRDDOCID;
            begin
              select t1.IS_ACTIVE
                into v_vc_Tmp
                from DL_COMMON.ICAO_DC_LISTS t1
               inner join DL_COMMON.ICAO_DC_LIST_ITMS t2
                  on (t1.KEY_VALUE = t2.KEY_VALUE)
               where t1.KEY_VALUE = v_PORT_MOVEMENTS(trim(n_EXITFLG)).ICAO_DC_LIST4NO_ENTRY_FORM
                 and t1.IS_ACTIVE = 'Y'
                 and t2.ICAO_DOC_CODE = v_NAT;
            exception
              when NO_DATA_FOUND then
                Raise_application_error(-20000
                                       ,'The ENTRY_FORM[''''] cannot be null! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
            end;
          else
            Raise_application_error(-20000
                                   ,'The ENTRY_FORM[''''] cannot be null! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
          end if;
          --
        end if;
        --
      end if;
      --
      --
      if (n_FORM_NO_APPROVED is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_FORM_NO_APPROVED
                                                                            ,o_FORM_NO_APPROVED))
      then
        --
        if (v_PORT_MOVEMENTS(trim(n_EXITFLG)).MUST_APPROVE_ENTRY_FORM_NO = 'Y' and n_FORM_NO_APPROVED != 'Y')
        then
          Raise_application_error(-20000
                                 ,'The FORM_NO_APPROVED[''' || n_FORM_NO_APPROVED || '''] must be "Y" for this type of port movement! For MVMNTID[''' || p_MVMNTID || '''], DML_TYPE[''' || v_DML_TYPE || '''].');
        end if;
        --
      end if;
      --
      --
      --alter table DL_BORDERCONTROL.MOVEMENTS add constraint MOVEMENTS$FK01 foreign key(BRDDOCID) references DL_BORDERCONTROL.BORDERDOCUMENTS(BRDDOCID);
      --
    end if;
    --
  end L_Check_FK_Content;
  --
  --
  before statement is
  begin
    --
    L_Set_DML_TYPE(true);
    L_Set_PORT_MOVEMENTS();
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
      if :new.INS_BY = user then 
        :new.INS_BY := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      end if;
      :new.DML_AT   := systimestamp;
      if :new.DML_BY = user then
        :new.DML_BY := DL_COMMON.PKG_SESSION.Get_AUDIT_User();
      end if;
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
      :new.DML_TYPE    := v_DML_TYPE;
      :new.MOVEMENT_DT := :old.MOVEMENT_DT;
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
    if (v_PORT_MOVEMENTS.count() = 0)
    then
      L_Set_PORT_MOVEMENTS();
    end if;
    --
    if (v_DML_TYPE = 'I')
    then
      --
      null;/*L_Check_FK_Content(:new.MVMNTID
                        ,:new.BRDDOCID
                        ,:new.IS_FINISHED
                        ,null
                        ,:new.EXITFLG
                        ,null
                        ,:new.PERSON_TYPE
                        ,null
                        ,:new.VISA_TYPE
                        ,null
                        ,:new.INS_TERMINAL
                        ,null
                        ,:new.INS_BORDERPOST
                        ,null
                        ,:new.PRIOR_MOVEMENT
                        ,null
                        ,:new.ENTRY_FORM
                        ,null
                        ,:new.FORM_NO_APPROVED
                        ,:new.PS_4
                         --
                         );*/
      --
    elsif (v_DML_TYPE = 'U')
    then
      --
      null;/*L_Check_FK_Content(:new.MVMNTID
                        ,:new.BRDDOCID
                        ,:new.IS_FINISHED
                        ,:old.EXITFLG
                        ,:new.EXITFLG
                        ,:old.PERSON_TYPE
                        ,:new.PERSON_TYPE
                        ,:old.VISA_TYPE
                        ,:new.VISA_TYPE
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                        ,:old.PRIOR_MOVEMENT
                        ,:new.PRIOR_MOVEMENT
                        ,:old.ENTRY_FORM
                        ,:new.ENTRY_FORM
                        ,:old.FORM_NO_APPROVED
                        ,:new.FORM_NO_APPROVED
                        ,:new.PS_4
                         --
                         );*/
      --
      /*
      insert into MOVEMENTS$HIS
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
        insert into MOVEMENTS$HIS
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
      insert into MOVEMENTS$HIS
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
      insert into MOVEMENTS$HIS
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
      --
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
end MOVEMENTS$TIUD0;

/
ALTER TRIGGER "DL_BORDERCONTROL"."MOVEMENTS$TIUD0" ENABLE;
