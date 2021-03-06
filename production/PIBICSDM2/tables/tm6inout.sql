CREATE TABLE "PIBICSDM2"."TM6INOUT" 
   (	"TM6SEQNO" NUMBER, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"INOUTDTE" DATE, 
	"CARDTYPE" CHAR(1 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"DEPTCD" VARCHAR2(5 CHAR), 
	"TRAVCD" CHAR(4 CHAR), 
	"CONVCD" CHAR(4 CHAR), 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"TDTCD" VARCHAR2(4 CHAR), 
	"TDTNO" VARCHAR2(20 CHAR), 
	"VISATYPECD" CHAR(4 CHAR), 
	"VISAEXPDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"CREUSR" VARCHAR2(20 CHAR), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(30 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"STATUS" CHAR(1 CHAR), 
	"CONV_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"TYPEDATA" VARCHAR2(20 CHAR), 
	"TM6EXLOGSEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"REMARK" VARCHAR2(2000 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."TM6INOUT_PK" ON "PIBICSDM2"."TM6INOUT" ("TM6SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TM6INOUT" TO "BIOSAADM";
