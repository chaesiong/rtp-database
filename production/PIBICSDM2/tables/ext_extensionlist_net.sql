CREATE TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET" 
   (	"EXTLIST_NET_SEQNO" NUMBER, 
	"EXT_SEQNO" NUMBER, 
	"DOC_NO" VARCHAR2(50 CHAR), 
	"REASON_SEQNO" NUMBER, 
	"EXT_DAY" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"EXT_DATE" DATE, 
	"TM6NO" VARCHAR2(7 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
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
	"ADDR" VARCHAR2(100 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(20 CHAR), 
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
	"APPROVE_REM" VARCHAR2(100 CHAR), 
	"WAITCOMMENT_SEQNO" NUMBER, 
	"WAITCOMMENT_OTH" VARCHAR2(100 CHAR), 
	"WAIT_DATE" DATE, 
	"NO_DATE" DATE, 
	"NO_REM" VARCHAR2(100 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"CPASSPORTNO" VARCHAR2(20 CHAR), 
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
	"COM_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET" ADD CONSTRAINT "EXT_EXTENSIONLIST_NET_PK" PRIMARY KEY ("EXTLIST_NET_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET" ADD CONSTRAINT "EXT_EXTENSIONLIST_NET_R03" FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET" ADD CONSTRAINT "EXT_EXTENSIONLIST_NET_R02" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET" ADD CONSTRAINT "EXT_EXTENSIONLIST_NET_R04" FOREIGN KEY ("FROMCOUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET" ADD CONSTRAINT "EXT_EXTENSIONLIST_NET_R11" FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_EXTENSIONLIST_NET" ADD CONSTRAINT "EXT_EXTENSIONLIST_NET_R06" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_EXTENSIONLIST_NET_PK" ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" ("EXTLIST_NET_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301197C00061$$" ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" (
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_EXTENSIONLIST_NET" TO "BIOSAADM";
