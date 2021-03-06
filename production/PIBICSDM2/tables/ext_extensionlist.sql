CREATE TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" 
   (	"EXTLIST_SEQNO" NUMBER, 
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
	"FACTTYPE" CHAR(1 CHAR), 
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
	"SW_EXT_PERSON_LOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_PK" PRIMARY KEY ("EXTLIST_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R05" FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R04" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R06" FOREIGN KEY ("FROMCOUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R02" FOREIGN KEY ("EXT_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_EXTENSION" ("EXT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R10" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R01" FOREIGN KEY ("EXTPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PERSON" ("EXTPERSON_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R21" FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R12" FOREIGN KEY ("FEESLIP_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FEES" ("FEES_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R09" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R08" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST" ADD CONSTRAINT "EXT_EXTENSIONLIST_R11" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") DISABLE;
  CREATE INDEX "PIBICSDM2"."BIRTH_DATE_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("BIRTH_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_ACTFLAG_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("ACTFLAG") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_APPROVE_STS_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("APPROVE_STS") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_COMPOSITE_IDX1" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("NATION_SEQNO", "PASSPORTNO", "BIRTH_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_COM_SEQNO_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("COM_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_DOCNO_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("DOC_NO") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_EXTDATE2_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" (TO_CHAR("EXT_DATE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_EXTDATE_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("EXT_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_PASSPORTNO_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("PASSPORTNO") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_PERMIT_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("PERMIT_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_PERSON_LOG_SEQNO_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("SW_EXT_PERSON_LOG_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_PERSON_STS_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("PERSON_STS") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_REASON_SEQNO_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("REASON_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_SEX_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("SEX") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_UDEPTSEQNO_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("UDEPT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."EXTLIST_UPDATE_DATE_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" (TO_NUMBER(TO_CHAR("UPDATE_DATE",'YYYYMMDDHH24MISSFF'))) 
  ;
CREATE INDEX "PIBICSDM2"."EXT_DATE_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" (TO_CHAR("EXT_DATE",'yyyymm')) 
  ;
CREATE INDEX "PIBICSDM2"."EXT_EXTLIST_UPDATEDTE_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("UPDATE_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."NATION_SEQNO_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("NATION_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."PERMIT_DATE_IDX" ON "PIBICSDM2"."EXT_EXTENSIONLIST" (TO_CHAR("PERMIT_DATE",'yyyymmdd')) 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."EXT_EXTENSIONLIST_PK" ON "PIBICSDM2"."EXT_EXTENSIONLIST" ("EXTLIST_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301188C00062$$" ON "PIBICSDM2"."EXT_EXTENSIONLIST" (
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_EXTENSIONLIST" TO "BIOSAADM";
