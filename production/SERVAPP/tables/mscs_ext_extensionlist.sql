CREATE TABLE "SERVAPP"."MSCS_EXT_EXTENSIONLIST" 
   (	"EXTLIST_SEQNO" NUMBER NOT NULL ENABLE, 
	"EXT_SEQNO" NUMBER, 
	"EXTPERSON_SEQNO" NUMBER, 
	"DOC_NO" VARCHAR2(50 CHAR), 
	"REASON_SEQNO" NUMBER, 
	"EXT_DAY" NUMBER, 
	"PASSPORTNO" VARCHAR2(50 CHAR), 
	"EXT_DATE" DATE, 
	"TM6NO" VARCHAR2(50 CHAR), 
	"EFIRSTNM" VARCHAR2(150 CHAR), 
	"EMIDDLENM" VARCHAR2(150 CHAR), 
	"EFAMILYNM" VARCHAR2(150 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(50 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"PASSPORT_PLACE" VARCHAR2(50 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORT_EXPDATE" DATE, 
	"IN_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"FROMCOUNT_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"BUILDING" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(200 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(100 CHAR), 
	"PERSON_STS" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"FINE_SEQNO1" NUMBER, 
	"FINE_SEQNO2" NUMBER, 
	"FINE_SEQNO3" NUMBER, 
	"FINE_SEQNO4" NUMBER, 
	"FEESLIP_SEQNO" NUMBER, 
	"APPROVE_STS" CHAR(1 CHAR), 
	"COMMAND_SEQNO" NUMBER, 
	"COMMAND_OTH" VARCHAR2(100 CHAR), 
	"PERMIT_DATE" DATE, 
	"APPROVE_REM" VARCHAR2(1000 CHAR), 
	"WAITCOMMENT_SEQNO" NUMBER, 
	"WAITCOMMENT_OTH" VARCHAR2(100 CHAR), 
	"WAIT_DATE" DATE, 
	"NO_DATE" DATE, 
	"NO_REM" VARCHAR2(100 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"CPASSPORTNO" VARCHAR2(50 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"EXTIMG" BLOB, 
	"PASSPORT_PIC" VARCHAR2(70 CHAR), 
	"VISA_DATE" DATE, 
	"OLD_PERMIT_DATE" DATE, 
	"COM_SEQNO" NUMBER, 
	"FACTTYPE" CHAR(1), 
	"RELATIONSHIP" VARCHAR2(100 CHAR), 
	"REASON_VISA" VARCHAR2(300 CHAR), 
	"REF_PERSON" VARCHAR2(200 CHAR), 
	"REF_TEL" VARCHAR2(50 CHAR), 
	"REMARK_BL" VARCHAR2(500 CHAR), 
	"FINE_NUMBER1" VARCHAR2(20 CHAR), 
	"FINE_NUMBER2" VARCHAR2(20 CHAR), 
	"FINE_NUMBER3" VARCHAR2(20 CHAR), 
	"FINE_NUMBER4" VARCHAR2(20 CHAR), 
	"FINE_NUMBER5" VARCHAR2(20 CHAR), 
	"FINE_DAY1" NUMBER, 
	"FINE_DAY2" NUMBER, 
	"FINE_DAY3" NUMBER, 
	"FINE_DAY4" NUMBER, 
	"FINE_DAY5" NUMBER, 
	"FINE_REMARK1" VARCHAR2(500 CHAR), 
	"FINE_REMARK2" VARCHAR2(500 CHAR), 
	"FINE_REMARK3" VARCHAR2(500 CHAR), 
	"FINE_REMARK4" VARCHAR2(500 CHAR), 
	"FINE_REMARK5" VARCHAR2(500 CHAR), 
	"FINE_STS1" CHAR(1 CHAR), 
	"FINE_STS2" CHAR(1 CHAR), 
	"FINE_STS3" CHAR(1 CHAR), 
	"FINE_STS4" CHAR(1 CHAR), 
	"FINE_STS5" CHAR(1 CHAR), 
	"FLAGSYSTEM" VARCHAR2(3 CHAR), 
	"EXTPERSONQ_SEQNO" NUMBER, 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"VISATYPESUB_SEQNO" NUMBER, 
	"FEE_STS" CHAR(1 CHAR), 
	"FINE_DATE1" DATE, 
	"FINE_DATE2" DATE, 
	"NOTROLE_REM" VARCHAR2(500 CHAR), 
	"CANCEL_REM" VARCHAR2(1000 CHAR), 
	"PROVE_BY" VARCHAR2(300 CHAR), 
	"PROVE_ID" VARCHAR2(20 CHAR), 
	"T_IDICONCEPT" VARCHAR2(50 CHAR), 
	"REMARK" VARCHAR2(2000 CHAR), 
	"ITEMNO" NUMBER DEFAULT 0, 
	"FLAG_QUEONLINE" CHAR(1 CHAR), 
	"STATUS_OFFLINE" VARCHAR2(1 CHAR), 
	"PIBICSPK" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_PK" PRIMARY KEY ("EXTLIST_SEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "SERVAPP"."MSCS_BIRTH_DATE_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("BIRTH_DATE") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_ACTFLAG_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("ACTFLAG") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_APPROVE_STS_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("APPROVE_STS") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_COM_SEQNO_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("COM_SEQNO") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_DOCNO_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("DOC_NO") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_EXTDATE1_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" (TO_CHAR("EXT_DATE",'yyyy-mm-dd')) 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_EXTDATE2_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" (TO_CHAR("EXT_DATE",'yyyymmdd')) 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_EXTDATE_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("EXT_DATE") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_PASSPORTNO_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("PASSPORTNO") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_PERSON_STS_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("PERSON_STS") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_REASON_SEQNO_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("REASON_SEQNO") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_SEX_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("SEX") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_UDEPTSEQNO_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("UDEPT_SEQNO") 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXTLIST_UPDATE_DATE_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" (TO_NUMBER(TO_CHAR("UPDATE_DATE",'YYYYMMDDHH24MISSFF'))) 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXT_DATE_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" (TO_CHAR("EXT_DATE",'yyyymm')) 
  ;
CREATE INDEX "SERVAPP"."MSCS_EXT_EXTLIST_UPDATEDTE_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("UPDATE_DATE") 
  ;
CREATE INDEX "SERVAPP"."MSCS_NATION_SEQNO_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("NATION_SEQNO") 
  ;
CREATE INDEX "SERVAPP"."MSCS_PERMIT_DATE_IDX" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" (TO_CHAR("PERMIT_DATE",'yyyymmdd')) 
  ;
CREATE UNIQUE INDEX "SERVAPP"."EXT_EXTENSIONLIST_PK" ON "SERVAPP"."MSCS_EXT_EXTENSIONLIST" ("EXTLIST_SEQNO") 
  ;
  ;