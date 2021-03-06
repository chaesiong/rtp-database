CREATE TABLE "PIBICSDM2"."LOSTPASSPORT_TMP" 
   (	"LPPCD" VARCHAR2(20 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"CITIZENID" CHAR(13 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"ISUPASSPORTDTE" DATE, 
	"ISUPASSPORTPLACE" CHAR(3 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"PASSPORTTYPE" CHAR(4 CHAR), 
	"LOSTPASSPORTDTE" DATE, 
	"LOSTPASSPORTPLACE" CHAR(3 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"REMARK" VARCHAR2(800 CHAR), 
	"CREUSR" VARCHAR2(30 CHAR), 
	"CREDTE" DATE, 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"NEWPASSPORTNO" VARCHAR2(12 CHAR), 
	"NEWPASSPORTTYPE" CHAR(4 CHAR), 
	"NEWISUPASSPORTDTE" DATE, 
	"NEWISUPASSPORTPLACE" CHAR(3 CHAR), 
	"NEWPASSPORTEXPDTE" DATE, 
	"INFORMPASSPORTDTE" DATE, 
	"OWNERAGE" CHAR(4 CHAR), 
	"AGCPHONE" VARCHAR2(60 CHAR), 
	"EMGCONT" VARCHAR2(200 CHAR), 
	"DOCREF" VARCHAR2(100 CHAR), 
	"SECLEV" VARCHAR2(2 CHAR), 
	"REASONCD" CHAR(4 CHAR), 
	"AGCCONT" VARCHAR2(200 CHAR), 
	"OPERREF" CHAR(2 CHAR), 
	"TDCD" CHAR(4 CHAR), 
	"LPPERSON" VARCHAR2(20 CHAR), 
	"POLISSTATION" VARCHAR2(200 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"VISAEXPDTE" DATE, 
	"TDT_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"PID" VARCHAR2(30 CHAR), 
	"ORG_CODE" VARCHAR2(10 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."LOSTPASSPORT_TMP" TO "BIOSAADM";
