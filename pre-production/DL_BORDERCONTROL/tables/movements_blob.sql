CREATE TABLE "DL_BORDERCONTROL"."MOVEMENTS_BLOB" 
   (	"MVMNT_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"WSQ_LL" BLOB, 
	"WSQ_LI" BLOB, 
	"WSQ_LM" BLOB, 
	"WSQ_LR" BLOB, 
	"WSQ_LT" BLOB, 
	"WSQ_RL" BLOB, 
	"WSQ_RI" BLOB, 
	"WSQ_RM" BLOB, 
	"WSQ_RR" BLOB, 
	"WSQ_RT" BLOB, 
	"VISA_PAGE" BLOB, 
	"TRAVELCARD_PAGE" BLOB, 
	"LIVE_PHOTO" BLOB, 
	"PSBLOB_1" BLOB, 
	"PSBLOB_2" BLOB, 
	"PSBLOB_3" BLOB, 
	"PSBLOB_4" BLOB, 
	"PSBLOB_5" BLOB, 
	"PSBLOB_6" BLOB, 
	"PSBLOB_7" BLOB, 
	"PSBLOB_8" BLOB, 
	"PSBLOB_9" BLOB, 
	"PSBLOB_10" BLOB, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"TEMPLATE_LL" BLOB, 
	"TEMPLATE_LI" BLOB, 
	"TEMPLATE_LM" BLOB, 
	"TEMPLATE_LR" BLOB, 
	"TEMPLATE_LT" BLOB, 
	"TEMPLATE_RL" BLOB, 
	"TEMPLATE_RI" BLOB, 
	"TEMPLATE_RM" BLOB, 
	"TEMPLATE_RR" BLOB, 
	"TEMPLATE_RT" BLOB
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1 ,'MONTH')) STORE IN ("DATASTORE_LOB") 
 (PARTITION "P_BEFORE_2018"  VALUES LESS THAN (TO_DATE(' 2018-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) ) ;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS_BLOB" ADD CONSTRAINT "PK_MOVEMENTS_BLOB" PRIMARY KEY ("MVMNT_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS_BLOB" ADD CONSTRAINT "MOVEMENTS_BLOB$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                  ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENTS_BLOB" ADD CONSTRAINT "MOVEMENTS_BLOB$FK00" FOREIGN KEY ("MVMNT_ID")
	  REFERENCES "DL_BORDERCONTROL"."MOVEMENTS" ("MVMNTID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."MVMNT_ID" IS 'Foreign Key to table DL_BORDERCONTROL.MOVEMENTS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_LL" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_LI" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_LM" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_LR" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_LT" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_RL" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_RI" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_RM" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_RR" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."WSQ_RT" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."VISA_PAGE" IS 'Image Visa Page';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TRAVELCARD_PAGE" IS 'Image TM6 Page';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."LIVE_PHOTO" IS 'Image live photo';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_1" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_2" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_3" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_4" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_5" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_6" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_7" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_8" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_9" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."PSBLOB_10" IS 'not in use';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_LL" IS 'Image left little finger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_LI" IS 'Image left index finger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_LM" IS 'Image left middle finger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_LR" IS 'Image left ring finger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_LT" IS 'Image left thumb';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_RL" IS 'Image right little finger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_RI" IS 'Image right index finger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_RM" IS 'Image right middle finger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_RR" IS 'Image right ring finger';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENTS_BLOB"."TEMPLATE_RT" IS 'Image right thumb';
   COMMENT ON TABLE "DL_BORDERCONTROL"."MOVEMENTS_BLOB"  IS 'Used in BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS_BLOB$IX00" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS_BLOB$IX01" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" ("INS_TERMINAL") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENTS_BLOB_CREATED_IDX" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" ("INS_AT") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."PK_MOVEMENTS_BLOB" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" ("MVMNT_ID") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00002$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7259" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00003$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7261" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00004$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7263" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00005$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7265" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00006$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7267" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00007$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7269" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00008$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7271" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00009$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7273" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00010$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7275" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00011$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7277" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00012$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7279" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00013$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7281" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00014$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7283" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00015$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7285" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00016$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7287" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00017$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7289" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00018$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7291" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00019$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7293" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00020$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7295" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00021$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7297" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00022$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7299" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00023$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7301" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00024$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7303" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00032$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7305" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00033$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7307" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00034$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7309" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00035$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7311" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00036$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7313" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00037$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7315" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00038$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7317" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00039$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7319" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00040$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7321" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311924C00041$$" ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" (
   LOCAL
 (PARTITION "SYS_IL_P7323" ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "APPSUP";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENTS_BLOB" TO "TRAINEE";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."MOVEMENTS_BLOB$TIUD0" 
  for insert or update or delete on DL_BORDERCONTROL.MOVEMENTS_BLOB
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
    if (:new.MVMNT_ID != :old.MVMNT_ID)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_MVMNT_ID       in MOVEMENTS_BLOB.MVMNT_ID%type
                              ,o_INS_TERMINAL   in MOVEMENTS_BLOB.INS_TERMINAL%type
                              ,n_INS_TERMINAL   in MOVEMENTS_BLOB.INS_TERMINAL%type
                              ,o_INS_BORDERPOST in MOVEMENTS_BLOB.INS_BORDERPOST%type
                              ,n_INS_BORDERPOST in MOVEMENTS_BLOB.INS_BORDERPOST%type
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
                                 ,'Check borderpost and belonging terminal for p_MVMNT_ID[''' || p_MVMNT_ID || '''], DML_TYPE[''' || v_DML_TYPE || '''] raises: ' || sqlerrm);
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
      L_Check_FK_Content(:new.MVMNT_ID
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
      L_Check_FK_Content(:new.MVMNT_ID
                        ,:old.INS_TERMINAL
                        ,:new.INS_TERMINAL
                        ,:old.INS_BORDERPOST
                        ,:new.INS_BORDERPOST
                         --
                         );
      --
      /*
      insert into MOVEMENTS_BLOB$HIS
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
        insert into MOVEMENTS_BLOB$HIS
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
      insert into MOVEMENTS_BLOB$HIS
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
      insert into MOVEMENTS_BLOB$HIS
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
end MOVEMENTS_BLOB$TIUD0;
/
ALTER TRIGGER "DL_BORDERCONTROL"."MOVEMENTS_BLOB$TIUD0" ENABLE;
