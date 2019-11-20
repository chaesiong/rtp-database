CREATE TABLE "PIBICSDM2"."TEST1" 
   (	"SEQNO" VARCHAR2(300) NOT NULL ENABLE, 
	"TM6NO" VARCHAR2(60), 
	"INOUTDTE" DATE, 
	"CARDTYPE" CHAR(3), 
	"TFIRSTNM" VARCHAR2(180), 
	"TMIDDLENM" VARCHAR2(180), 
	"TFAMILYNM" VARCHAR2(180), 
	"EFIRSTNM" VARCHAR2(180), 
	"EMIDDLENM" VARCHAR2(180), 
	"EFAMILYNM" VARCHAR2(180), 
	"SEX" CHAR(3), 
	"BIRTHDTE" VARCHAR2(30), 
	"NATIONCD" CHAR(9), 
	"DEPTCD" VARCHAR2(15), 
	"TRAVCD" CHAR(12), 
	"CONVCD" CHAR(12), 
	"CONVREGNO" VARCHAR2(60), 
	"TDTCD" VARCHAR2(12), 
	"TDTNO" VARCHAR2(60), 
	"VISATYPECD" CHAR(12), 
	"VISAEXPDTE" DATE, 
	"PASSPORTDTE" DATE, 
	"PASSPORTISU" VARCHAR2(180), 
	"PASSPORTEXPDTE" DATE, 
	"TARGETNO" VARCHAR2(21), 
	"INTYPE" CHAR(3), 
	"CHKPOINTNO" CHAR(9), 
	"CREUSR" VARCHAR2(60), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(90), 
	"UPDUSR" VARCHAR2(60), 
	"UPDDTE" DATE, 
	"UPDTERM" VARCHAR2(90), 
	"ISPROCESS" CHAR(3), 
	"PERSONID" VARCHAR2(60), 
	"TFSNDXNM" VARCHAR2(180), 
	"TLSNDXNM" VARCHAR2(180), 
	"TMSNDXNM" VARCHAR2(180), 
	"EFSNDXNM" VARCHAR2(180), 
	"ELSNDXNM" VARCHAR2(180), 
	"EMSNDXNM" VARCHAR2(180), 
	"REMARK" VARCHAR2(4000), 
	"RESCERTNO" VARCHAR2(60), 
	"IMGINOUT" BLOB, 
	"PM_RE_ENTRY" VARCHAR2(60), 
	"PM_REEXPDTE" DATE, 
	"PM_EXTENSION" VARCHAR2(60), 
	"PM_EXEXPDTE" DATE, 
	"PM_NON_QUOTA" VARCHAR2(60), 
	"PM_NONEXPDTE" DATE, 
	"STATUS" CHAR(3), 
	"TM5_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(60), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(60), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"RPJSEQNO" NUMBER, 
	"PERMITCD" CHAR(12), 
	"NEWPERMIT" DATE, 
	"CONV_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"PERMIT_SEQNO" NUMBER, 
	"CITIZENID" VARCHAR2(39), 
	"PASS_SEQNO" NUMBER, 
	"FLIGHTPREFIX" VARCHAR2(60), 
	"FLIGHTNUMBER" VARCHAR2(60), 
	"TYPEDATA" VARCHAR2(60), 
	"DEPTCDORG" CHAR(15), 
	"FLAGJOINPASS" CHAR(3), 
	"FLAGFINES" CHAR(3), 
	"RESCERTTYPE" VARCHAR2(12), 
	"RESPVCD" VARCHAR2(9), 
	"RESNOYEAR" VARCHAR2(60), 
	"PV_SEQNO" NUMBER, 
	"PD_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"SHIFT_SEQNO" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000366203C00044$$" ON "PIBICSDM2"."TEST1" (
  ;
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TEST1" TO "BIOSAADM";
