CREATE TABLE "DL_STAGING4PIBICS"."LOSTPASSPORT" 
   (	"LPPCD" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"NATIONCD" VARCHAR2(3 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"CITIZENID" VARCHAR2(13 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"ISUPASSPORTDTE" DATE, 
	"ISUPASSPORTPLACE" VARCHAR2(3 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"PASSPORTTYPE" VARCHAR2(4 CHAR), 
	"LOSTPASSPORTDTE" DATE, 
	"LOSTPASSPORTPLACE" VARCHAR2(3 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"REMARK" VARCHAR2(800 CHAR), 
	"CREUSR" VARCHAR2(30 CHAR), 
	"CREDTE" DATE, 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"NEWPASSPORTNO" VARCHAR2(12 CHAR), 
	"NEWPASSPORTTYPE" VARCHAR2(4 CHAR), 
	"NEWISUPASSPORTDTE" DATE, 
	"NEWISUPASSPORTPLACE" VARCHAR2(3 CHAR), 
	"NEWPASSPORTEXPDTE" DATE, 
	"INFORMPASSPORTDTE" DATE, 
	"OWNERAGE" VARCHAR2(4 CHAR), 
	"AGCPHONE" VARCHAR2(60 CHAR), 
	"EMGCONT" VARCHAR2(200 CHAR), 
	"DOCREF" VARCHAR2(100 CHAR), 
	"SECLEV" VARCHAR2(2 CHAR), 
	"REASONCD" VARCHAR2(4 CHAR), 
	"AGCCONT" VARCHAR2(200 CHAR), 
	"OPERREF" VARCHAR2(2 CHAR), 
	"TDCD" VARCHAR2(4 CHAR), 
	"LPPERSON" VARCHAR2(20 CHAR), 
	"POLISSTATION" VARCHAR2(200 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"VISAEXPDTE" DATE, 
	"TDT_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"PID" VARCHAR2(30 CHAR), 
	"ORG_CODE" VARCHAR2(10 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS"."LOSTPASSPORT" ADD CONSTRAINT "LOSTPASSPORT_PK" PRIMARY KEY ("LPPCD")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."LOSTPASSPORT_PK" ON "DL_STAGING4PIBICS"."LOSTPASSPORT" ("LPPCD") 
  ;
  GRANT DELETE ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."LOSTPASSPORT" TO "APPSUP";
