CREATE TABLE "PIBICSDM2"."LOSTPASSPORTLOG" 
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
	"LOGUSERID" VARCHAR2(30 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
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
	"TDCD" CHAR(4 CHAR), 
	"OPERREF" CHAR(2 CHAR), 
	"LPPERSON" VARCHAR2(20 CHAR), 
	"DELREMARK" VARCHAR2(1000 CHAR), 
	"TDT_SEQNO" NUMBER, 
	"POLISSTATION" VARCHAR2(200 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"VISAEXPDTE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"LPPLOGID" NUMBER
   ) ;
  CREATE INDEX "PIBICSDM2"."LOSTPASSPORT_LOGDTE_IDX" ON "PIBICSDM2"."LOSTPASSPORTLOG" ("LOGDTE") 
  ;
CREATE INDEX "PIBICSDM2"."LOSTPASSPORT_LOGDTE_IDXFN" ON "PIBICSDM2"."LOSTPASSPORTLOG" (TO_CHAR("LOGDTE",'dd/mm/yyyy')) 
  ;
CREATE INDEX "PIBICSDM2"."LOSTPASSPORT_LOGFLAG_IDX" ON "PIBICSDM2"."LOSTPASSPORTLOG" ("LOGFLAG") 
  ;
CREATE INDEX "PIBICSDM2"."LOSTPASSPORT_LOGUSERID_IDX" ON "PIBICSDM2"."LOSTPASSPORTLOG" ("LOGUSERID") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."LOSTPASSPORTLOG_PK" ON "PIBICSDM2"."LOSTPASSPORTLOG" ("LPPLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."LOSTPASSPORTLOG" TO "BIOSAADM";
