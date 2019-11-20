CREATE TABLE "PIBICSDM2"."TMP_PROCESSOVS" 
   (	"TMOVSSEQNO" NUMBER, 
	"PERSONID" VARCHAR2(20 CHAR), 
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
	"TDTCD" VARCHAR2(4 CHAR), 
	"TDTNO" VARCHAR2(20 CHAR), 
	"VISATYPECD" CHAR(4 CHAR), 
	"VISAEXPDTE" DATE, 
	"PASSPORTDTE" DATE, 
	"PASSPORTEXPDTE" DATE, 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"UPDTERM" VARCHAR2(30 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"STATUS" CHAR(1 CHAR) DEFAULT 0, 
	"TM5_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"CONVCD" CHAR(4 CHAR), 
	"CONVREGNO" VARCHAR2(40 CHAR), 
	"SEQNO" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 0, 
	"CONV_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"PERMIT_SEQNO" NUMBER, 
	"FLIGHTPREFIX" VARCHAR2(20 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(20 CHAR), 
	"DEPTCD" CHAR(5 CHAR), 
	"EXTPERSON_SEQNO" NUMBER, 
	"EXTPERMITDTE" DATE, 
	"EXTFLAG" CHAR(1 CHAR), 
	"CHNGPERSON_SEQNO" NUMBER, 
	"CHNGPERMITDTE" DATE, 
	"CHNGFLAG" CHAR(1 CHAR), 
	"RQSPERSON_SEQNO" NUMBER, 
	"RQSPERMITDTE" DATE, 
	"RQSFLAG" CHAR(1 CHAR), 
	"FNPERSON_SEQNO" NUMBER, 
	"ALIEN_SEQNO" NUMBER, 
	"PROCESSDTE" DATE, 
	"MATCH_NAME" CHAR(1 CHAR), 
	"MATCH_NAME_WLCD" VARCHAR2(20 CHAR), 
	"MATCH_TDTNO" CHAR(1 CHAR), 
	"MATCH_TDTNO_WLCD" VARCHAR2(20 CHAR), 
	"OVSDTE" DATE, 
	"YEAROFDOB" VARCHAR2(4 CHAR), 
	"SEXDESC" VARCHAR2(10 CHAR), 
	"DEPTLEVEL1" NUMBER, 
	"DEPTLEVEL2" NUMBER, 
	"BUILDING" VARCHAR2(500 CHAR), 
	"ADDR" VARCHAR2(500 CHAR), 
	"ROAD" VARCHAR2(500 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"TEL" VARCHAR2(100 CHAR), 
	"TYPEADDR" VARCHAR2(20 CHAR), 
	"LASTPERMITDTE" DATE
   ) ;
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_PROCESSOVS" TO "BIOSAADM";
