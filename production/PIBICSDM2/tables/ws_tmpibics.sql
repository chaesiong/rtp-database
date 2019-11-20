CREATE TABLE "PIBICSDM2"."WS_TMPIBICS" 
   (	"SEQUENCENO" VARCHAR2(100 CHAR), 
	"SENDDATETIME" VARCHAR2(14 CHAR), 
	"MSGVERSION" NUMBER, 
	"ISSUCCESS" CHAR(1 CHAR), 
	"FALSETYPE" NUMBER(1,0), 
	"ERRORDESC" VARCHAR2(250 CHAR), 
	"SEQNO" VARCHAR2(100 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR), 
	"INOUTDTE" DATE, 
	"CARDTYPE" CHAR(1 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
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
	"PASSPORTDTE" DATE, 
	"PASSPORTISU" VARCHAR2(60 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"TARGETNO" VARCHAR2(7 CHAR), 
	"INTYPE" CHAR(1 CHAR), 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"CREUSR" VARCHAR2(20 CHAR), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(30 CHAR), 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"UPDTERM" VARCHAR2(30 CHAR), 
	"ISPROCESS" CHAR(1 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"TFSNDXNM" VARCHAR2(60 CHAR), 
	"TLSNDXNM" VARCHAR2(60 CHAR), 
	"TMSNDXNM" VARCHAR2(60 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"RESCERTNO" VARCHAR2(20 CHAR), 
	"IMGINOUT" BLOB, 
	"PM_RE_ENTRY" VARCHAR2(20 CHAR), 
	"PM_REEXPDTE" DATE, 
	"PM_EXTENSION" VARCHAR2(20 CHAR), 
	"PM_EXEXPDTE" DATE, 
	"PM_NON_QUOTA" VARCHAR2(20 CHAR), 
	"PM_NONEXPDTE" DATE, 
	"STATUS" CHAR(1 CHAR), 
	"TM5_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 0, 
	"RPJSEQNO" NUMBER, 
	"PERMITCD" CHAR(4 CHAR), 
	"NEWPERMIT" DATE, 
	"CONV_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"PERMIT_SEQNO" NUMBER, 
	"CITIZENID" VARCHAR2(13 CHAR), 
	"PASS_SEQNO" NUMBER, 
	"FLIGHTPREFIX" VARCHAR2(20 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(20 CHAR), 
	"TYPEDATA" VARCHAR2(20 CHAR), 
	"DEPTCDORG" CHAR(5 CHAR), 
	"FLAGJOINPASS" CHAR(1 CHAR), 
	"FLAGFINES" CHAR(1 CHAR), 
	"RESCERTTYPE" VARCHAR2(4 CHAR), 
	"RESPVCD" VARCHAR2(3 CHAR), 
	"RESNOYEAR" VARCHAR2(20 CHAR), 
	"SENDTYPE" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WS_TMPIBICS" ADD CONSTRAINT "WS_TMPIBICS_PK" PRIMARY KEY ("SEQUENCENO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302403C00050$$" ON "PIBICSDM2"."WS_TMPIBICS" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."WS_TMPIBICS_PK" ON "PIBICSDM2"."WS_TMPIBICS" ("SEQUENCENO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WS_TMPIBICS" TO "BIOSAADM";
